Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B543C7618D
	for <linux-doc@archiver.kernel.org>; Thu,  6 Apr 2023 16:56:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S239013AbjDFQ4r (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 6 Apr 2023 12:56:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41002 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239765AbjDFQ4o (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 6 Apr 2023 12:56:44 -0400
Received: from 66-220-144-178.mail-mxout.facebook.com (66-220-144-178.mail-mxout.facebook.com [66.220.144.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9260E61A8
        for <linux-doc@vger.kernel.org>; Thu,  6 Apr 2023 09:56:39 -0700 (PDT)
Received: by dev0134.prn3.facebook.com (Postfix, from userid 425415)
        id 18DF4AC5FA65; Thu,  6 Apr 2023 09:53:44 -0700 (PDT)
From:   Stefan Roesch <shr@devkernel.io>
To:     kernel-team@fb.com
Cc:     shr@devkernel.io, linux-mm@kvack.org, riel@surriel.com,
        mhocko@suse.com, david@redhat.com, linux-kselftest@vger.kernel.org,
        linux-doc@vger.kernel.org, akpm@linux-foundation.org,
        hannes@cmpxchg.org, Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH v5 1/3] mm: add new api to enable ksm per process
Date:   Thu,  6 Apr 2023 09:53:37 -0700
Message-Id: <20230406165339.1017597-2-shr@devkernel.io>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230406165339.1017597-1-shr@devkernel.io>
References: <20230406165339.1017597-1-shr@devkernel.io>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

So far KSM can only be enabled by calling madvise for memory regions.  To
be able to use KSM for more workloads, KSM needs to have the ability to b=
e
enabled / disabled at the process / cgroup level.

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

  1) Introduce new MMF_VM_MERGE_ANY flag

     This introduces the new flag MMF_VM_MERGE_ANY flag.  When this flag
     is set, kernel samepage merging (ksm) gets enabled for all vma's of =
a
     process.

  2) Setting VM_MERGEABLE on VMA creation

     When a VMA is created, if the MMF_VM_MERGE_ANY flag is set, the
     VM_MERGEABLE flag will be set for this VMA.

  3) add flag to __ksm_enter

     This change adds the flag parameter to __ksm_enter.  This allows to
     distinguish if ksm was called by prctl or madvise.

  4) add flag to __ksm_exit call

     This adds the flag parameter to the __ksm_exit() call.  This allows
     to distinguish if this call is for an prctl or madvise invocation.

  5) support disabling of ksm for a process

     This adds the ability to disable ksm for a process if ksm has been
     enabled for the process.

  6) add new prctl option to get and set ksm for a process

     This adds two new options to the prctl system call
     - enable ksm for all vmas of a process (if the vmas support it).
     - query if ksm has been enabled for a process.

3. Disabling MMF_VM_MERGE_ANY for storage keys in s390

   In the s390 architecture when storage keys are used, the
   MMF_VM_MERGE_ANY will be disabled.

Signed-off-by: Stefan Roesch <shr@devkernel.io>
Cc: David Hildenbrand <david@redhat.com>
Cc: Johannes Weiner <hannes@cmpxchg.org>
Cc: Michal Hocko <mhocko@suse.com>
Cc: Rik van Riel <riel@surriel.com>
Cc: Bagas Sanjaya <bagasdotme@gmail.com>
Signed-off-by: Andrew Morton <akpm@linux-foundation.org>
---
 arch/s390/mm/gmap.c            |   1 +
 include/linux/ksm.h            |  31 +++++++--
 include/linux/sched/coredump.h |   1 +
 include/uapi/linux/prctl.h     |   2 +
 kernel/fork.c                  |   1 +
 kernel/sys.c                   |  24 +++++++
 mm/ksm.c                       | 111 ++++++++++++++++++++++++++-------
 mm/mmap.c                      |   7 +++
 8 files changed, 151 insertions(+), 27 deletions(-)

diff --git a/arch/s390/mm/gmap.c b/arch/s390/mm/gmap.c
index 5a716bdcba05..9d85e5589474 100644
--- a/arch/s390/mm/gmap.c
+++ b/arch/s390/mm/gmap.c
@@ -2591,6 +2591,7 @@ int gmap_mark_unmergeable(void)
 	int ret;
 	VMA_ITERATOR(vmi, mm, 0);
=20
+	clear_bit(MMF_VM_MERGE_ANY, &mm->flags);
 	for_each_vma(vmi, vma) {
 		/* Copy vm_flags to avoid partial modifications in ksm_madvise */
 		vm_flags =3D vma->vm_flags;
diff --git a/include/linux/ksm.h b/include/linux/ksm.h
index 7e232ba59b86..c65455bf124c 100644
--- a/include/linux/ksm.h
+++ b/include/linux/ksm.h
@@ -18,20 +18,29 @@
 #ifdef CONFIG_KSM
 int ksm_madvise(struct vm_area_struct *vma, unsigned long start,
 		unsigned long end, int advice, unsigned long *vm_flags);
-int __ksm_enter(struct mm_struct *mm);
-void __ksm_exit(struct mm_struct *mm);
+
+int ksm_add_mm(struct mm_struct *mm);
+void ksm_add_vma(struct vm_area_struct *vma);
+void ksm_add_vmas(struct mm_struct *mm);
+
+int __ksm_enter(struct mm_struct *mm, int flag);
+void __ksm_exit(struct mm_struct *mm, int flag);
=20
 static inline int ksm_fork(struct mm_struct *mm, struct mm_struct *oldmm=
)
 {
+	if (test_bit(MMF_VM_MERGE_ANY, &oldmm->flags))
+		return ksm_add_mm(mm);
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
@@ -53,6 +62,18 @@ void folio_migrate_ksm(struct folio *newfolio, struct =
folio *folio);
=20
 #else  /* !CONFIG_KSM */
=20
+static inline int ksm_add_mm(struct mm_struct *mm)
+{
+}
+
+static inline void ksm_add_vma(struct vm_area_struct *vma)
+{
+}
+
+static inline void ksm_add_vmas(struct mm_struct *mm)
+{
+}
+
 static inline int ksm_fork(struct mm_struct *mm, struct mm_struct *oldmm=
)
 {
 	return 0;
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
diff --git a/kernel/fork.c b/kernel/fork.c
index f68954d05e89..1520697cf6c7 100644
--- a/kernel/fork.c
+++ b/kernel/fork.c
@@ -686,6 +686,7 @@ static __latent_entropy int dup_mmap(struct mm_struct=
 *mm,
 		if (vma_iter_bulk_store(&vmi, tmp))
 			goto fail_nomem_vmi_store;
=20
+		ksm_add_vma(tmp);
 		mm->map_count++;
 		if (!(tmp->vm_flags & VM_WIPEONFORK))
 			retval =3D copy_page_range(tmp, mpnt);
diff --git a/kernel/sys.c b/kernel/sys.c
index 495cd87d9bf4..3e6918a10259 100644
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
@@ -2661,6 +2662,29 @@ SYSCALL_DEFINE5(prctl, int, option, unsigned long,=
 arg2, unsigned long, arg3,
 	case PR_SET_VMA:
 		error =3D prctl_set_vma(arg2, arg3, arg4, arg5);
 		break;
+#ifdef CONFIG_KSM
+	case PR_SET_MEMORY_MERGE:
+		if (mmap_write_lock_killable(me->mm))
+			return -EINTR;
+
+		if (arg2) {
+			int err =3D ksm_add_mm(me->mm);
+			if (err)
+				return err;
+
+			ksm_add_vmas(me->mm);
+		} else {
+			clear_bit(MMF_VM_MERGE_ANY, &me->mm->flags);
+		}
+		mmap_write_unlock(me->mm);
+		break;
+	case PR_GET_MEMORY_MERGE:
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
index d7bd28199f6c..ab95ae0f9def 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -534,10 +534,33 @@ static int break_ksm(struct vm_area_struct *vma, un=
signed long addr,
 	return (ret & VM_FAULT_OOM) ? -ENOMEM : 0;
 }
=20
+static bool vma_ksm_compatible(struct vm_area_struct *vma)
+{
+	if (vma->vm_flags & (VM_SHARED  | VM_MAYSHARE   | VM_PFNMAP  |
+			     VM_IO      | VM_DONTEXPAND | VM_HUGETLB |
+			     VM_MIXEDMAP))
+		return false;		/* just ignore the advice */
+
+	if (vma_is_dax(vma))
+		return false;
+
+#ifdef VM_SAO
+	if (vma->vm_flags & VM_SAO)
+		return false;
+#endif
+#ifdef VM_SPARC_ADI
+	if (vma->vm_flags & VM_SPARC_ADI)
+		return false;
+#endif
+
+	return true;
+}
+
 static struct vm_area_struct *find_mergeable_vma(struct mm_struct *mm,
 		unsigned long addr)
 {
 	struct vm_area_struct *vma;
+
 	if (ksm_test_exit(mm))
 		return NULL;
 	vma =3D vma_lookup(mm, addr);
@@ -1065,6 +1088,7 @@ static int unmerge_and_remove_all_rmap_items(void)
=20
 			mm_slot_free(mm_slot_cache, mm_slot);
 			clear_bit(MMF_VM_MERGEABLE, &mm->flags);
+			clear_bit(MMF_VM_MERGE_ANY, &mm->flags);
 			mmdrop(mm);
 		} else
 			spin_unlock(&ksm_mmlist_lock);
@@ -2495,6 +2519,7 @@ static struct ksm_rmap_item *scan_get_next_rmap_ite=
m(struct page **page)
=20
 		mm_slot_free(mm_slot_cache, mm_slot);
 		clear_bit(MMF_VM_MERGEABLE, &mm->flags);
+		clear_bit(MMF_VM_MERGE_ANY, &mm->flags);
 		mmap_read_unlock(mm);
 		mmdrop(mm);
 	} else {
@@ -2571,6 +2596,63 @@ static int ksm_scan_thread(void *nothing)
 	return 0;
 }
=20
+static void __ksm_add_vma(struct vm_area_struct *vma)
+{
+	unsigned long vm_flags =3D vma->vm_flags;
+
+	if (vm_flags & VM_MERGEABLE)
+		return;
+
+	if (vma_ksm_compatible(vma)) {
+		vm_flags |=3D VM_MERGEABLE;
+		vm_flags_reset(vma, vm_flags);
+	}
+}
+
+/**
+ * ksm_add_vma - Mark vma as mergeable
+ *
+ * @vma:  Pointer to vma
+ */
+void ksm_add_vma(struct vm_area_struct *vma)
+{
+	struct mm_struct *mm =3D vma->vm_mm;
+
+	if (test_bit(MMF_VM_MERGE_ANY, &mm->flags))
+		__ksm_add_vma(vma);
+}
+
+/**
+ * ksm_add_vmas - Mark all vma's of a process as mergeable
+ *
+ * @mm:  Pointer to mm
+ */
+void ksm_add_vmas(struct mm_struct *mm)
+{
+	struct vm_area_struct *vma;
+
+	VMA_ITERATOR(vmi, mm, 0);
+	for_each_vma(vmi, vma)
+		__ksm_add_vma(vma);
+}
+
+/**
+ * ksm_add_mm - Add mm to mm ksm list
+ *
+ * @mm:  Pointer to mm
+ *
+ * Returns 0 on success, otherwise error code
+ */
+int ksm_add_mm(struct mm_struct *mm)
+{
+	if (test_bit(MMF_VM_MERGE_ANY, &mm->flags))
+		return -EINVAL;
+	if (test_bit(MMF_VM_MERGEABLE, &mm->flags))
+		return -EINVAL;
+
+	return __ksm_enter(mm, MMF_VM_MERGE_ANY);
+}
+
 int ksm_madvise(struct vm_area_struct *vma, unsigned long start,
 		unsigned long end, int advice, unsigned long *vm_flags)
 {
@@ -2579,28 +2661,13 @@ int ksm_madvise(struct vm_area_struct *vma, unsig=
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
+		if (vma->vm_flags & VM_MERGEABLE)
 			return 0;
-
-#ifdef VM_SAO
-		if (*vm_flags & VM_SAO)
+		if (!vma_ksm_compatible(vma))
 			return 0;
-#endif
-#ifdef VM_SPARC_ADI
-		if (*vm_flags & VM_SPARC_ADI)
-			return 0;
-#endif
=20
 		if (!test_bit(MMF_VM_MERGEABLE, &mm->flags)) {
-			err =3D __ksm_enter(mm);
+			err =3D __ksm_enter(mm, MMF_VM_MERGEABLE);
 			if (err)
 				return err;
 		}
@@ -2626,7 +2693,7 @@ int ksm_madvise(struct vm_area_struct *vma, unsigne=
d long start,
 }
 EXPORT_SYMBOL_GPL(ksm_madvise);
=20
-int __ksm_enter(struct mm_struct *mm)
+int __ksm_enter(struct mm_struct *mm, int flag)
 {
 	struct ksm_mm_slot *mm_slot;
 	struct mm_slot *slot;
@@ -2659,7 +2726,7 @@ int __ksm_enter(struct mm_struct *mm)
 		list_add_tail(&slot->mm_node, &ksm_scan.mm_slot->slot.mm_node);
 	spin_unlock(&ksm_mmlist_lock);
=20
-	set_bit(MMF_VM_MERGEABLE, &mm->flags);
+	set_bit(flag, &mm->flags);
 	mmgrab(mm);
=20
 	if (needs_wakeup)
@@ -2668,7 +2735,7 @@ int __ksm_enter(struct mm_struct *mm)
 	return 0;
 }
=20
-void __ksm_exit(struct mm_struct *mm)
+void __ksm_exit(struct mm_struct *mm, int flag)
 {
 	struct ksm_mm_slot *mm_slot;
 	struct mm_slot *slot;
@@ -2700,7 +2767,7 @@ void __ksm_exit(struct mm_struct *mm)
=20
 	if (easy_to_free) {
 		mm_slot_free(mm_slot_cache, mm_slot);
-		clear_bit(MMF_VM_MERGEABLE, &mm->flags);
+		clear_bit(flag, &mm->flags);
 		mmdrop(mm);
 	} else if (mm_slot) {
 		mmap_write_lock(mm);
diff --git a/mm/mmap.c b/mm/mmap.c
index 740b54be3ed4..483e182e0b9d 100644
--- a/mm/mmap.c
+++ b/mm/mmap.c
@@ -46,6 +46,7 @@
 #include <linux/pkeys.h>
 #include <linux/oom.h>
 #include <linux/sched/mm.h>
+#include <linux/ksm.h>
=20
 #include <linux/uaccess.h>
 #include <asm/cacheflush.h>
@@ -2213,6 +2214,8 @@ int __split_vma(struct vma_iterator *vmi, struct vm=
_area_struct *vma,
 	/* vma_complete stores the new vma */
 	vma_complete(&vp, vmi, vma->vm_mm);
=20
+	ksm_add_vma(new);
+
 	/* Success. */
 	if (new_below)
 		vma_next(vmi);
@@ -2664,6 +2667,7 @@ unsigned long mmap_region(struct file *file, unsign=
ed long addr,
 	if (file && vm_flags & VM_SHARED)
 		mapping_unmap_writable(file->f_mapping);
 	file =3D vma->vm_file;
+	ksm_add_vma(vma);
 expanded:
 	perf_event_mmap(vma);
=20
@@ -2936,6 +2940,7 @@ static int do_brk_flags(struct vma_iterator *vmi, s=
truct vm_area_struct *vma,
 		goto mas_store_fail;
=20
 	mm->map_count++;
+	ksm_add_vma(vma);
 out:
 	perf_event_mmap(vma);
 	mm->total_vm +=3D len >> PAGE_SHIFT;
@@ -3180,6 +3185,7 @@ struct vm_area_struct *copy_vma(struct vm_area_stru=
ct **vmap,
 		if (vma_link(mm, new_vma))
 			goto out_vma_link;
 		*need_rmap_locks =3D false;
+		ksm_add_vma(new_vma);
 	}
 	validate_mm_mt(mm);
 	return new_vma;
@@ -3356,6 +3362,7 @@ static struct vm_area_struct *__install_special_map=
ping(
 	vm_stat_account(mm, vma->vm_flags, len >> PAGE_SHIFT);
=20
 	perf_event_mmap(vma);
+	ksm_add_vma(vma);
=20
 	validate_mm_mt(mm);
 	return vma;
--=20
2.34.1

