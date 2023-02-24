Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10C8EC61DA3
	for <linux-doc@archiver.kernel.org>; Fri, 24 Feb 2023 04:44:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229471AbjBXEoI (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 23 Feb 2023 23:44:08 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57164 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229452AbjBXEoH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 23 Feb 2023 23:44:07 -0500
Received: from 66-220-144-178.mail-mxout.facebook.com (66-220-144-178.mail-mxout.facebook.com [66.220.144.178])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 40A3B51935
        for <linux-doc@vger.kernel.org>; Thu, 23 Feb 2023 20:44:06 -0800 (PST)
Received: by dev0134.prn3.facebook.com (Postfix, from userid 425415)
        id 0A66F7B74EDD; Thu, 23 Feb 2023 20:40:59 -0800 (PST)
From:   Stefan Roesch <shr@devkernel.io>
To:     kernel-team@fb.com
Cc:     shr@devkernel.io, linux-mm@kvack.org, riel@surriel.com,
        mhocko@suse.com, david@redhat.com, linux-kselftest@vger.kernel.org,
        linux-doc@vger.kernel.org, akpm@linux-foundation.org,
        hannes@cmpxchg.org, Bagas Sanjaya <bagasdotme@gmail.com>
Subject: [PATCH v3 2/3] mm: add new KSM process and sysfs knobs
Date:   Thu, 23 Feb 2023 20:39:59 -0800
Message-Id: <20230224044000.3084046-3-shr@devkernel.io>
X-Mailer: git-send-email 2.30.2
In-Reply-To: <20230224044000.3084046-1-shr@devkernel.io>
References: <20230224044000.3084046-1-shr@devkernel.io>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

This adds the general_profit KSM sysfs knob and the process profit
metric and process merge type knobs to ksm_stat.

1) split off pages_volatile function

This splits off the pages_volatile function. The next patch will use
this function.

2) expose general_profit metric

The documentation mentions a general profit metric, however this metric
is not calculated. In addition the formula depends on the size of
internal structures, which makes it more difficult for an administrator
to make the calculation. Adding the metric for a better user experience.

3) document general_profit sysfs knob

4) calculate ksm process profit metric

The ksm documentation mentions the process profit metric and how to
calculate it. This adds the calculation of the metric.

5) add ksm_merge_type() function

This adds the ksm_merge_type function. The function returns the merge
type for the process. For madvise it returns "madvise", for prctl it
returns "process" and otherwise it returns "none".

6) mm: expose ksm process profit metric and merge type in ksm_stat

This exposes the ksm process profit metric in /proc/<pid>/ksm_stat.
The documentation mentions the formula for the ksm process profit
metric, however it does not calculate it. In addition the formula
depends on the size of internal structures. So it makes sense to expose
it.

This exposes the ksm process type in /proc/<pid>/ksm_stat. The name of
the value is ksm_merge_type.

7) document new procfs ksm knobs

Signed-off-by: Stefan Roesch <shr@devkernel.io>
Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
---
 Documentation/ABI/testing/sysfs-kernel-mm-ksm |  8 ++++
 Documentation/admin-guide/mm/ksm.rst          |  8 +++-
 fs/proc/base.c                                |  5 ++
 include/linux/ksm.h                           |  5 ++
 mm/ksm.c                                      | 47 +++++++++++++++++--
 5 files changed, 69 insertions(+), 4 deletions(-)

diff --git a/Documentation/ABI/testing/sysfs-kernel-mm-ksm b/Documentatio=
n/ABI/testing/sysfs-kernel-mm-ksm
index d244674a9480..7768e90f7a8f 100644
--- a/Documentation/ABI/testing/sysfs-kernel-mm-ksm
+++ b/Documentation/ABI/testing/sysfs-kernel-mm-ksm
@@ -51,3 +51,11 @@ Description:	Control merging pages across different NU=
MA nodes.
=20
 		When it is set to 0 only pages from the same node are merged,
 		otherwise pages from all nodes can be merged together (default).
+
+What:		/sys/kernel/mm/ksm/general_profit
+Date:		January 2023
+KernelVersion:  6.1
+Contact:	Linux memory management mailing list <linux-mm@kvack.org>
+Description:	Measure how effective KSM is.
+		general_profit: how effective is KSM. The formula for the
+		calculation is in Documentation/admin-guide/mm/ksm.rst.
diff --git a/Documentation/admin-guide/mm/ksm.rst b/Documentation/admin-g=
uide/mm/ksm.rst
index f160f9487a90..34f1d0396eee 100644
--- a/Documentation/admin-guide/mm/ksm.rst
+++ b/Documentation/admin-guide/mm/ksm.rst
@@ -159,6 +159,8 @@ stable_node_chains_prune_millisecs
=20
 The effectiveness of KSM and MADV_MERGEABLE is shown in ``/sys/kernel/mm=
/ksm/``:
=20
+general_profit
+        how effective is KSM. The calculation is explained below.
 pages_shared
         how many shared pages are being used
 pages_sharing
@@ -216,7 +218,8 @@ several times, which are unprofitable memory consumed=
.
 			  ksm_rmap_items * sizeof(rmap_item).
=20
    where ksm_merging_pages is shown under the directory ``/proc/<pid>/``=
,
-   and ksm_rmap_items is shown in ``/proc/<pid>/ksm_stat``.
+   and ksm_rmap_items is shown in ``/proc/<pid>/ksm_stat``. The process =
profit
+   is also shown in ``/proc/<pid>/ksm_stat`` as ksm_process_profit.
=20
 From the perspective of application, a high ratio of ``ksm_rmap_items`` =
to
 ``ksm_merging_pages`` means a bad madvise-applied policy, so developers =
or
@@ -227,6 +230,9 @@ so if the ``ksm_rmap_items/ksm_merging_pages`` ratio =
exceeds 64 on 64-bit CPU
 or exceeds 128 on 32-bit CPU, then the app's madvise policy should be dr=
opped,
 because the ksm profit is approximately zero or negative.
=20
+The ksm_merge_type in ``/proc/<pid>/ksm_stat`` shows the merge type of t=
he
+process. Valid values are ``none``, ``madvise`` and ``process``.
+
 Monitoring KSM events
 =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
=20
diff --git a/fs/proc/base.c b/fs/proc/base.c
index ac9ebe972be0..45749051e53b 100644
--- a/fs/proc/base.c
+++ b/fs/proc/base.c
@@ -96,6 +96,7 @@
 #include <linux/time_namespace.h>
 #include <linux/resctrl.h>
 #include <linux/cn_proc.h>
+#include <linux/ksm.h>
 #include <trace/events/oom.h>
 #include "internal.h"
 #include "fd.h"
@@ -3199,6 +3200,7 @@ static int proc_pid_ksm_merging_pages(struct seq_fi=
le *m, struct pid_namespace *
=20
 	return 0;
 }
+
 static int proc_pid_ksm_stat(struct seq_file *m, struct pid_namespace *n=
s,
 				struct pid *pid, struct task_struct *task)
 {
@@ -3208,6 +3210,9 @@ static int proc_pid_ksm_stat(struct seq_file *m, st=
ruct pid_namespace *ns,
 	if (mm) {
 		seq_printf(m, "ksm_rmap_items %lu\n", mm->ksm_rmap_items);
 		seq_printf(m, "zero_pages_sharing %lu\n", mm->ksm_zero_pages_sharing);
+		seq_printf(m, "ksm_merging_pages %lu\n", mm->ksm_merging_pages);
+		seq_printf(m, "ksm_merge_type %s\n", ksm_merge_type(mm));
+		seq_printf(m, "ksm_process_profit %ld\n", ksm_process_profit(mm));
 		mmput(mm);
 	}
=20
diff --git a/include/linux/ksm.h b/include/linux/ksm.h
index d38a05a36298..d5f69f18ee5a 100644
--- a/include/linux/ksm.h
+++ b/include/linux/ksm.h
@@ -55,6 +55,11 @@ struct page *ksm_might_need_to_copy(struct page *page,
 void rmap_walk_ksm(struct folio *folio, struct rmap_walk_control *rwc);
 void folio_migrate_ksm(struct folio *newfolio, struct folio *folio);
=20
+#ifdef CONFIG_PROC_FS
+long ksm_process_profit(struct mm_struct *);
+const char *ksm_merge_type(struct mm_struct *mm);
+#endif /* CONFIG_PROC_FS */
+
 #else  /* !CONFIG_KSM */
=20
 static inline int ksm_fork(struct mm_struct *mm, struct mm_struct *oldmm=
)
diff --git a/mm/ksm.c b/mm/ksm.c
index 23d6944f78ad..3121bc0f48f3 100644
--- a/mm/ksm.c
+++ b/mm/ksm.c
@@ -3024,6 +3024,25 @@ static void wait_while_offlining(void)
 }
 #endif /* CONFIG_MEMORY_HOTREMOVE */
=20
+#ifdef CONFIG_PROC_FS
+long ksm_process_profit(struct mm_struct *mm)
+{
+	return (long)mm->ksm_merging_pages * PAGE_SIZE -
+		mm->ksm_rmap_items * sizeof(struct ksm_rmap_item);
+}
+
+/* Return merge type name as string. */
+const char *ksm_merge_type(struct mm_struct *mm)
+{
+	if (test_bit(MMF_VM_MERGE_ANY, &mm->flags))
+		return "process";
+	else if (test_bit(MMF_VM_MERGEABLE, &mm->flags))
+		return "madvise";
+	else
+		return "none";
+}
+#endif /* CONFIG_PROC_FS */
+
 #ifdef CONFIG_SYSFS
 /*
  * This all compiles without CONFIG_SYSFS, but is a waste of space.
@@ -3271,8 +3290,7 @@ static ssize_t pages_unshared_show(struct kobject *=
kobj,
 }
 KSM_ATTR_RO(pages_unshared);
=20
-static ssize_t pages_volatile_show(struct kobject *kobj,
-				   struct kobj_attribute *attr, char *buf)
+static long pages_volatile(void)
 {
 	long ksm_pages_volatile;
=20
@@ -3284,7 +3302,14 @@ static ssize_t pages_volatile_show(struct kobject =
*kobj,
 	 */
 	if (ksm_pages_volatile < 0)
 		ksm_pages_volatile =3D 0;
-	return sysfs_emit(buf, "%ld\n", ksm_pages_volatile);
+
+	return ksm_pages_volatile;
+}
+
+static ssize_t pages_volatile_show(struct kobject *kobj,
+				   struct kobj_attribute *attr, char *buf)
+{
+	return sysfs_emit(buf, "%ld\n", pages_volatile());
 }
 KSM_ATTR_RO(pages_volatile);
=20
@@ -3295,6 +3320,21 @@ static ssize_t zero_pages_sharing_show(struct kobj=
ect *kobj,
 }
 KSM_ATTR_RO(zero_pages_sharing);
=20
+static ssize_t general_profit_show(struct kobject *kobj,
+				   struct kobj_attribute *attr, char *buf)
+{
+	long general_profit;
+	long all_rmap_items;
+
+	all_rmap_items =3D ksm_max_page_sharing + ksm_pages_shared +
+				ksm_pages_unshared + pages_volatile();
+	general_profit =3D ksm_pages_sharing * PAGE_SIZE -
+				all_rmap_items * sizeof(struct ksm_rmap_item);
+
+	return sysfs_emit(buf, "%ld\n", general_profit);
+}
+KSM_ATTR_RO(general_profit);
+
 static ssize_t stable_node_dups_show(struct kobject *kobj,
 				     struct kobj_attribute *attr, char *buf)
 {
@@ -3360,6 +3400,7 @@ static struct attribute *ksm_attrs[] =3D {
 	&stable_node_dups_attr.attr,
 	&stable_node_chains_prune_millisecs_attr.attr,
 	&use_zero_pages_attr.attr,
+	&general_profit_attr.attr,
 	NULL,
 };
=20
--=20
2.30.2

