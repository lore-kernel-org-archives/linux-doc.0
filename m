Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8E47C6FA99
	for <linux-doc@archiver.kernel.org>; Fri, 10 Mar 2023 18:31:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230410AbjCJSbj (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 10 Mar 2023 13:31:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32804 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230092AbjCJSbi (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 10 Mar 2023 13:31:38 -0500
Received: from 66-220-144-178.mail-mxout.facebook.com (66-220-144-178.mail-mxout.facebook.com [66.220.144.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 36F37F5D30
        for <linux-doc@vger.kernel.org>; Fri, 10 Mar 2023 10:31:37 -0800 (PST)
Received: by dev0134.prn3.facebook.com (Postfix, from userid 425415)
        id 2280A8D84921; Fri, 10 Mar 2023 10:28:54 -0800 (PST)
From:   Stefan Roesch <shr@devkernel.io>
To:     kernel-team@fb.com
Cc:     shr@devkernel.io, linux-mm@kvack.org, riel@surriel.com,
        mhocko@suse.com, david@redhat.com, linux-kselftest@vger.kernel.org,
        linux-doc@vger.kernel.org, akpm@linux-foundation.org,
        hannes@cmpxchg.org, Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH v4 1/3] mm: add new api to enable ksm per process
Date:   Fri, 10 Mar 2023 10:28:49 -0800
Message-Id: <20230310182851.2579138-2-shr@devkernel.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230310182851.2579138-1-shr@devkernel.io>
References: <20230310182851.2579138-1-shr@devkernel.io>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Patch series "mm: process/cgroup ksm support", v3.

So far KSM can only be enabled by calling madvise for memory regions.  To
be able to use KSM for more workloads, KSM needs to have the ability to b=
e
enabled / disabled at the process / cgroup level.

Use case 1:

  The madvise call is not available in the programming language.  An
  example for this are programs with forked workloads using a garbage
  collected language without pointers.  In such a language madvise cannot
  be made available.

  In addition the addresses of objects get moved around as they are
  garbage collected.  KSM sharing needs to be enabled "from the outside"
  for these type of workloads.

Use case 2:

  The same interpreter can also be used for workloads where KSM brings
  no benefit or even has overhead.  We'd like to be able to enable KSM on
  a workload by workload basis.

Use case 3:

  With the madvise call sharing opportunities are only enabled for the
  current process: it is a workload-local decision.  A considerable numbe=
r
  of sharing opportuniites may exist across multiple workloads or jobs.
  Only a higler level entity like a job scheduler or container can know
  for certain if its running one or more instances of a job.  That job
  scheduler however doesn't have the necessary internal worklaod knowledg=
e
  to make targeted madvise calls.

Security concerns:

  In previous discussions security concerns have been brought up.  The
  problem is that an individual workload does not have the knowledge abou=
t
  what else is running on a machine.  Therefore it has to be very
  conservative in what memory areas can be shared or not.  However, if th=
e
  system is dedicated to running multiple jobs within the same security
  domain, its the job scheduler that has the knowledge that sharing can b=
e
  safely enabled and is even desirable.

Performance:

  Experiments with using UKSM have shown a capacity increase of around
  20%.


1. New options for prctl system command

   This patch series adds two new options to the prctl system call.
   The first one allows to enable KSM at the process level and the second
   one to query the setting.

   The setting will be inherited by child processes.

   With the above setting, KSM can be enabled for the seed process of a
   cgroup and all processes in the cgroup will inherit the setting.

2. Changes to KSM processing

   When KSM is enabled at the process level, the KSM code will iterate
   over all the VMA's and enable KSM for the eligible VMA's.

   When forking a process that has KSM enabled, the setting will be
   inherited by the new child process.

   In addition when KSM is disabled for a process, KSM will be disabled
   for the VMA's where KSM has been enabled.

3. Add general_profit metric

   The general_profit metric of KSM is specified in the documentation,
   but not calculated.  This adds the general profit metric to
   /sys/kernel/debug/mm/ksm.

4. Add more metrics to ksm_stat

   This adds the process profit and ksm type metric to
   /proc/<pid>/ksm_stat.

5. Add more tests to ksm_tests

   This adds an option to specify the merge type to the ksm_tests.
   This allows to test madvise and prctl KSM.  It also adds a new option
   to query if prctl KSM has been enabled.  It adds a fork test to verify
   that the KSM process setting is inherited by client processes.

An update to the prctl(2) manpage has been proposed at [1].

This patch (of 3):

This adds a new prctl to API to enable and disable KSM on a per process
basis instead of only at the VMA basis (with madvise).

1) Introduce new MMF_VM_MERGE_ANY flag

   This introduces the new flag MMF_VM_MERGE_ANY flag.  When this flag
   is set, kernel samepage merging (ksm) gets enabled for all vma's of a
   process.

2) add flag to __ksm_enter

   This change adds the flag parameter to __ksm_enter.  This allows to
   distinguish if ksm was called by prctl or madvise.

3) add flag to __ksm_exit call

   This adds the flag parameter to the __ksm_exit() call.  This allows
   to distinguish if this call is for an prctl or madvise invocation.

4) invoke madvise for all vmas in scan_get_next_rmap_item

   If the new flag MMF_VM_MERGE_ANY has been set for a process, iterate
   over all the vmas and enable ksm if possible.  For the vmas that can b=
e
   ksm enabled this is only done once.

5) support disabling of ksm for a process

   This adds the ability to disable ksm for a process if ksm has been
   enabled for the process.

6) add new prctl option to get and set ksm for a process

   This adds two new options to the prctl system call
   - enable ksm for all vmas of a process (if the vmas support it).
   - query if ksm has been enabled for a process.

Link: https://lkml.kernel.org/r/20230227220206.436662-1-shr@devkernel.io =
[1]
Link: https://lkml.kernel.org/r/20230224044000.3084046-1-shr@devkernel.io
Link: https://lkml.kernel.org/r/20230224044000.3084046-2-shr@devkernel.io
Signed-off-by: Stefan Roesch <shr@devkernel.io>
Cc: David Hildenbrand <david@redhat.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Rik van Riel <riel@surriel.com>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---
 include/linux/ksm.h            | 14 ++++--
 include/linux/sched/coredump.h |  1 +
 include/uapi/linux/prctl.h     |  2 +
 kernel/sys.c                   | 27 ++++++++++
 mm/ksm.c                       | 90 +++++++++++++++++++++++-----------
 5 files changed, 101 insertions(+), 33 deletions(-)

diff --git a/include/linux/ksm.h b/include/linux/ksm.h
index 7e232ba59b86..d38a05a36298 100644
--- a/include/linux/ksm.h
+++ b/include/linux/ksm.h
@@ -18,20 +18,24 @@
 #ifdef CONFIG_KSM
 int ksm_madvise(struct vm_area_struct *vma, unsigned long start,
 		unsigned long end, int advice, unsigned long *vm_flags);
-int __ksm_enter(struct mm_struct *mm);
-void __ksm_exit(struct mm_struct *mm);
+int __ksm_enter(struct mm_struct *mm, int flag);
+void __ksm_exit(struct mm_struct *mm, int flag);
=20
 static inline int ksm_fork(struct mm_struct *mm, struct mm_struct *oldmm=
)
 {
+	if (test_bit(MMF_VM_MERGE_ANY, &oldmm->flags))
+		return __ksm_enter(mm, MMF_VM_MERGE_ANY);
 	if (test_bit(MMF_VM_MERGEABLE, &oldmm->flags))
-		return __ksm_enter(mm);
+		return __ksm_enter(mm, MMF_VM_MERGEABLE);
 	return 0;
 }
=20
 static inline void ksm_exit(struct mm_struct *mm)
 {
-	if (test_bit(MMF_VM_MERGEABLE, &mm->flags))
-		__ksm_exit(mm);
+	if (test_bit(MMF_VM_MERGE_ANY, &mm->flags))
+		__ksm_exit(mm, MMF_VM_MERGE_ANY);
+	else if (test_bit(MMF_VM_MERGEABLE, &mm->flags))
+		__ksm_exit(mm, MMF_VM_MERGEABLE);
 }
=20
 /*
diff --git a/include/linux/sched/coredump.h b/include/linux/sched/coredum=
p.h
index 0e17ae7fbfd3..0ee96ea7a0e9 100644
--- a/include/linux/sched/coredump.h
+++ b/include/linux/sched/coredump.h
@@ -90,4 +90,5 @@ static inline int get_dumpable(struct mm_struct *mm)
 #define MMF_INIT_MASK		(MMF_DUMPABLE_MASK | MMF_DUMP_FILTER_MASK |\
 				 MMF_DISABLE_THP_MASK | MMF_HAS_MDWE_MASK)
=20
+#define MMF_VM_MERGE_ANY	29
 #endif /* _LINUX_SCHED_COREDUMP_H */
diff --git a/include/uapi/linux/prctl.h b/include/uapi/linux/prctl.h
index 1312a137f7fb..759b3f53e53f 100644
--- a/include/uapi/linux/prctl.h
+++ b/include/uapi/linux/prctl.h
@@ -290,4 +290,6 @@ struct prctl_mm_map {
 #define PR_SET_VMA		0x53564d41
 # define PR_SET_VMA_ANON_NAME		0
=20
+#define PR_SET_MEMORY_MERGE		67
+#define PR_GET_MEMORY_MERGE		68
 #endif /* _LINUX_PRCTL_H */
diff --git a/kernel/sys.c b/kernel/sys.c
index 495cd87d9bf4..edc439b1cae9 100644
--- a/kernel/sys.c
+++ b/kernel/sys.c
@@ -15,6 +15,7 @@
 #include <linux/highuid.h>
 #include <linux/fs.h>
 #include <linux/kmod.h>
+#include <linux/ksm.h>
 #include <linux/perf_event.h>
 #include <linux/resource.h>
 #include <linux/kernel.h>
@@ -2661,6 +2662,32 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long,=
 arg2, unsigned long, arg3,
 	case PR_SET_VMA:
 		error =3D prctl_set_vma(arg2, arg3, arg4, arg5);
 		break;
+#ifdef CONFIG_KSM
+	case PR_SET_MEMORY_MERGE:
+		if (!capable(CAP_SYS_RESOURCE))
+			return -EPERM;
+
+		if (arg2) {
+			if (mmap_write_lock_killable(me->mm))
+				return -EINTR;
+
+			if (!test_bit(MMF_VM_MERGE_ANY, &me->mm->flags))
+				error =3D __ksm_enter(me->mm, MMF_VM_MERGE_ANY);
+			mmap_write_unlock(me->mm);
+		} else {
+			__ksm_exit(me->mm, MMF_VM_MERGE_ANY);
+		}
+		break;
+	case PR_GET_MEMORY_MERGE:
+		if (!capable(CAP_SYS_RESOURCE))
+			return -EPERM;
+
+		if (arg2 || arg3 || arg4 || arg5)
+			return -EINVAL;
+
+		error =3D !!test_bit(MMF_VM_MERGE_ANY, &me->mm->flags);
+		break;
+#endif
 	default:
 		error =3D -EINVAL;
 		break;
diff --git a/mm/ksm.c b/mm/ksm.c
index d7bd28199f6c..b8e6e734dd69 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -534,16 +534,58 @@ static int break_ksm(struct vm_area_struct *vma, un=
signed long addr,
 	return (ret & VM_FAULT_OOM) ? -ENOMEM : 0;
 }
=20
+static bool vma_ksm_compatible(struct vm_area_struct *vma)
+{
+	/*
+	 * Be somewhat over-protective for now!
+	 */
+	if (vma->vm_flags & (VM_MERGEABLE | VM_SHARED  | VM_MAYSHARE   |
+			     VM_PFNMAP    | VM_IO      | VM_DONTEXPAND |
+			     VM_HUGETLB | VM_MIXEDMAP))
+		return false;		/* just ignore the advice */
+
+	if (vma_is_dax(vma))
+		return false;
+
+#ifdef VM_SAO
+	if (*vm_flags & VM_SAO)
+		return false;
+#endif
+#ifdef VM_SPARC_ADI
+	if (*vm_flags & VM_SPARC_ADI)
+		return false;
+#endif
+
+	return true;
+}
+
+static bool vma_ksm_mergeable(struct vm_area_struct *vma)
+{
+	if (vma->vm_flags & VM_MERGEABLE)
+		return true;
+
+	if (test_bit(MMF_VM_MERGE_ANY, &vma->vm_mm->flags) &&
+		vma_ksm_compatible(vma))
+		return true;
+
+	return false;
+}
+
 static struct vm_area_struct *find_mergeable_vma(struct mm_struct *mm,
 		unsigned long addr)
 {
 	struct vm_area_struct *vma;
+
 	if (ksm_test_exit(mm))
 		return NULL;
+
 	vma =3D vma_lookup(mm, addr);
-	if (!vma || !(vma->vm_flags & VM_MERGEABLE) || !vma->anon_vma)
+	if (!vma || !vma->anon_vma)
 		return NULL;
-	return vma;
+	if (vma_ksm_mergeable(vma))
+		return vma;
+
+	return NULL;
 }
=20
 static void break_cow(struct ksm_rmap_item *rmap_item)
@@ -1042,7 +1084,7 @@ static int unmerge_and_remove_all_rmap_items(void)
 			goto mm_exiting;
=20
 		for_each_vma(vmi, vma) {
-			if (!(vma->vm_flags & VM_MERGEABLE) || !vma->anon_vma)
+			if (!vma_ksm_mergeable(vma) || !vma->anon_vma)
 				continue;
 			err =3D unmerge_ksm_pages(vma,
 						vma->vm_start, vma->vm_end);
@@ -1065,6 +1107,7 @@ static int unmerge_and_remove_all_rmap_items(void)
=20
 			mm_slot_free(mm_slot_cache, mm_slot);
 			clear_bit(MMF_VM_MERGEABLE, &mm->flags);
+			clear_bit(MMF_VM_MERGE_ANY, &mm->flags);
 			mmdrop(mm);
 		} else
 			spin_unlock(&ksm_mmlist_lock);
@@ -2409,8 +2452,9 @@ static struct ksm_rmap_item *scan_get_next_rmap_ite=
m(struct page **page)
 		goto no_vmas;
=20
 	for_each_vma(vmi, vma) {
-		if (!(vma->vm_flags & VM_MERGEABLE))
+		if (!vma_ksm_mergeable(vma))
 			continue;
+
 		if (ksm_scan.address < vma->vm_start)
 			ksm_scan.address =3D vma->vm_start;
 		if (!vma->anon_vma)
@@ -2495,6 +2539,7 @@ static struct ksm_rmap_item *scan_get_next_rmap_ite=
m(struct page **page)
=20
 		mm_slot_free(mm_slot_cache, mm_slot);
 		clear_bit(MMF_VM_MERGEABLE, &mm->flags);
+		clear_bit(MMF_VM_MERGE_ANY, &mm->flags);
 		mmap_read_unlock(mm);
 		mmdrop(mm);
 	} else {
@@ -2579,28 +2624,12 @@ int ksm_madvise(struct vm_area_struct *vma, unsig=
ned long start,
=20
 	switch (advice) {
 	case MADV_MERGEABLE:
-		/*
-		 * Be somewhat over-protective for now!
-		 */
-		if (*vm_flags & (VM_MERGEABLE | VM_SHARED  | VM_MAYSHARE   |
-				 VM_PFNMAP    | VM_IO      | VM_DONTEXPAND |
-				 VM_HUGETLB | VM_MIXEDMAP))
-			return 0;		/* just ignore the advice */
-
-		if (vma_is_dax(vma))
-			return 0;
-
-#ifdef VM_SAO
-		if (*vm_flags & VM_SAO)
-			return 0;
-#endif
-#ifdef VM_SPARC_ADI
-		if (*vm_flags & VM_SPARC_ADI)
+		if (!vma_ksm_compatible(vma))
 			return 0;
-#endif
=20
-		if (!test_bit(MMF_VM_MERGEABLE, &mm->flags)) {
-			err =3D __ksm_enter(mm);
+		if (!test_bit(MMF_VM_MERGEABLE, &mm->flags) &&
+		    !test_bit(MMF_VM_MERGE_ANY, &mm->flags)) {
+			err =3D __ksm_enter(mm, MMF_VM_MERGEABLE);
 			if (err)
 				return err;
 		}
@@ -2626,7 +2655,7 @@ int ksm_madvise(struct vm_area_struct *vma, unsigne=
d long start,
 }
 EXPORT_SYMBOL_GPL(ksm_madvise);
=20
-int __ksm_enter(struct mm_struct *mm)
+int __ksm_enter(struct mm_struct *mm, int flag)
 {
 	struct ksm_mm_slot *mm_slot;
 	struct mm_slot *slot;
@@ -2659,7 +2688,7 @@ int __ksm_enter(struct mm_struct *mm)
 		list_add_tail(&slot->mm_node, &ksm_scan.mm_slot->slot.mm_node);
 	spin_unlock(&ksm_mmlist_lock);
=20
-	set_bit(MMF_VM_MERGEABLE, &mm->flags);
+	set_bit(flag, &mm->flags);
 	mmgrab(mm);
=20
 	if (needs_wakeup)
@@ -2668,12 +2697,17 @@ int __ksm_enter(struct mm_struct *mm)
 	return 0;
 }
=20
-void __ksm_exit(struct mm_struct *mm)
+void __ksm_exit(struct mm_struct *mm, int flag)
 {
 	struct ksm_mm_slot *mm_slot;
 	struct mm_slot *slot;
 	int easy_to_free =3D 0;
=20
+	if (!(current->flags & PF_EXITING) &&
+	      flag =3D=3D MMF_VM_MERGE_ANY &&
+	      test_bit(MMF_VM_MERGE_ANY, &mm->flags))
+		clear_bit(MMF_VM_MERGE_ANY, &mm->flags);
+
 	/*
 	 * This process is exiting: if it's straightforward (as is the
 	 * case when ksmd was never running), free mm_slot immediately.
@@ -2700,7 +2734,7 @@ void __ksm_exit(struct mm_struct *mm)
=20
 	if (easy_to_free) {
 		mm_slot_free(mm_slot_cache, mm_slot);
-		clear_bit(MMF_VM_MERGEABLE, &mm->flags);
+		clear_bit(flag, &mm->flags);
 		mmdrop(mm);
 	} else if (mm_slot) {
 		mmap_write_lock(mm);
--=20
2.34.1

