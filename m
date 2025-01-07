Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67C1B3D984
	for <linux-doc@vger.kernel.org>; Tue,  7 Jan 2025 00:04:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736208245; cv=none; b=E4qUL2BsxkWvjCl+Kvu5s9mHgErJZoq2x24bl6UA7JlrhIaA32wAibgMWABe9KEfu8F03zgMAZHn3h6ajGYT+VZSzsuKf6YGLWRi/6D5yS+to3zBMJM/UM2xVEd74dW8omf/HBxone5hFc32oZhyvgrHcl7acizNhoFGzsmobUo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736208245; c=relaxed/simple;
	bh=GKwK/sWK6bvDmO1VxVPId65nGwnqJRzV+lVu1PFcv0E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MLTBIitgHBiCqI3cf3l9YiHH9U876CApPGaEUp6fs3yWVzVWOv+WIuxTg5HN7PVLBxsQEeDOIoMf6Wfd4KU8hpm09WN+EmrK3KbzYr7drSOCVsQ+sdH+xBU5q0qXfFU0d4ajhQj7lmC3fTQJd6zXk+m5zHJRZJunyMi1Tf1wPYg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=XbPQYIod; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="XbPQYIod"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6ddcff5a823so21842856d6.0
        for <linux-doc@vger.kernel.org>; Mon, 06 Jan 2025 16:04:03 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1736208242; x=1736813042; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V7/RT8+H7mI8JxtxXU0vRyxqoG6aLJf762JcOXh6uPk=;
        b=XbPQYIodYEB9SQA9RvRqJPCPGbZF+QV94JJQPOTc4weeH0cJ77iRfSyjvKmvEKV4fj
         kNDhLQMOPY6f+gILGK9nf+TWnbKkf+t1niBNOfC96luwaeikaFGrI7DBRofH0KPEfb9V
         7Mjc88TQrjkgysjXswzusgPD8fkRYli5yLdrA5wu9+BjGB1jWJdlAx5S9oTWgusDMHBt
         eK2v6kMgcVTE1CdLP+epu/Pe485ykfNvTdZ/UeRJWD/VHolkZsFexEJNV91Gm0rc/dNb
         UxarYCWyNbLdgmFasWStxea/iazoiebFFCOMcOJkfT5c6aqpWDReKVkayCM+Zc9FRyt2
         rYmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736208242; x=1736813042;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V7/RT8+H7mI8JxtxXU0vRyxqoG6aLJf762JcOXh6uPk=;
        b=JyUJhHQNob/5R1dtBj8Akrd2H12x9ik/EiTmauEEo5t2DlhF4Kg+oQsD5Ua+TUkaiB
         cOW7A/bH09ESWGmupUP0bvqo+AiMG97Yusxi6kh6IOv1WdMCGVWqdhCVgi9Q7NIE+Ap8
         frTEpbCmzso1M2f36VWV6kkia28lWzy1iKAMEihMTIs1mR74JjZ1L24+fFoRP8SeLLvf
         iFDa2S0ufiUjPgRNRwqV+B/E2P1QwIx8O+onQm1ABhbjp1uDLLTtOytknA0X+pY1LfnO
         cMu4MnFY2ijbTR/zYdKO8bvqsJsJ6xdY2uHCyFuTAM8zkVp1ZvZ7shX8aOB8b3l6Y2d4
         rNLA==
X-Gm-Message-State: AOJu0Yw7e3ol72DPBiljBETVLWld6yhQ60/zMMQIuUdH1Dpf7wMcJf+t
	o6yjlNtp9p2i9b/xHk/zjkkDfQD5IJXDSsgfQjUbTTaFuMRQuCx3d/OpllQv3sM=
X-Gm-Gg: ASbGncs6mann1MQe7qieV4Wjd8SIVMuM2w9SM1pPcZCjOdmPa5SO3+akLvNjokXsaXL
	7lql5ltSaeAm+7eRssGCPar1QJdSccH7SZ/JtjpBbDEPhFd7aj3+BVt9xkGNg1k83khKr859Bjb
	y7iG7jxeELMRHG8OJLfwA3mc7X2FY6L13sBtwoTlI5mFjMJvfGEToJkJa0dkfoYmAp0a+pOCkSy
	ZwwiCOkkPKTWn/iI233mxg6xJsgiOPsgygtjHBN9pqZGJMCQAL02K5ScNW5Q9sb7s1VMpx1/Slt
	0pRxoRmWaBeWAJPK0anQMvaZgTQzl+umjNUn+ObZGnjw
X-Google-Smtp-Source: AGHT+IH2SA3s6BT+Bp1QFg246/HWcHqeI2BOW5TZn2KK9a/w4rSSBzDE/HpgoQ9zK1LVGRBVtpinZg==
X-Received: by 2002:ad4:5aa8:0:b0:6d8:883b:142a with SMTP id 6a1803df08f44-6dd2330898emr1077157996d6.2.1736208242230;
        Mon, 06 Jan 2025 16:04:02 -0800 (PST)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-56-208.washdc.fios.verizon.net. [173.79.56.208])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6dd18137218sm174104476d6.57.2025.01.06.16.04.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jan 2025 16:04:01 -0800 (PST)
From: Gregory Price <gourry@gourry.net>
To: linux-mm@kvack.org
Cc: linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	kernel-team@meta.com,
	nehagholkar@meta.com,
	abhishekd@meta.com,
	david@redhat.com,
	nphamcs@gmail.com,
	gourry@gourry.net,
	akpm@linux-foundation.org,
	hannes@cmpxchg.org,
	kbusch@meta.com,
	ying.huang@linux.alibaba.com,
	feng.tang@intel.com,
	donettom@linux.ibm.com
Subject: [PATCH v3 6/6] migrate,sysfs: add pagecache promotion
Date: Mon,  6 Jan 2025 19:03:46 -0500
Message-ID: <20250107000346.1338481-7-gourry@gourry.net>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250107000346.1338481-1-gourry@gourry.net>
References: <20250107000346.1338481-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

adds /sys/kernel/mm/numa/pagecache_promotion_enabled

When page cache lands on lower tiers, there is no way for promotion
to occur unless it becomes memory-mapped and exposed to NUMA hint
faults.  Just adding a mechanism to promote pages unconditionally,
however, opens up significant possibility of performance regressions.

Similar to the `demotion_enabled` sysfs entry, provide a sysfs toggle
to enable and disable page cache promotion.  This option will enable
opportunistic promotion of unmapped page cache during syscall access.

This option is intended for operational conditions where demoted page
cache will eventually contain memory which becomes hot - and where
said memory likely to cause performance issues due to being trapped on
the lower tier of memory.

A Page Cache folio is considered a promotion candidates when:
  0) tiering and pagecache-promotion are enabled
  1) the folio resides on a node not in the top tier
  2) the folio is already marked referenced and active.
  3) Multiple accesses in (referenced & active) state occur quickly.

Since promotion is not safe to execute unconditionally from within
folio_mark_accessed, we defer promotion to a new task_work captured
in the task_struct.  This ensures that the task doing the access has
some hand in promoting pages - even among deduplicated read only files.

We limit the total number of folios on the promotion list to the
promotion rate limit to limit the amount of inline work done during
large reads - avoiding significant overhead.  We do not use the existing
rate-limit check function this checked during the migration anyway.

The promotion node is always the local node of the promoting cpu.

Suggested-by: Johannes Weiner <hannes@cmpxchg.org>
Signed-off-by: Gregory Price <gourry@gourry.net>
---
 .../ABI/testing/sysfs-kernel-mm-numa          | 20 +++++++
 include/linux/memory-tiers.h                  |  2 +
 include/linux/migrate.h                       |  5 ++
 include/linux/sched.h                         |  4 ++
 include/linux/sched/sysctl.h                  |  1 +
 init/init_task.c                              |  2 +
 kernel/sched/fair.c                           | 24 +++++++-
 mm/memory-tiers.c                             | 27 +++++++++
 mm/migrate.c                                  | 55 +++++++++++++++++++
 mm/swap.c                                     |  8 +++
 10 files changed, 147 insertions(+), 1 deletion(-)

diff --git a/Documentation/ABI/testing/sysfs-kernel-mm-numa b/Documentation/ABI/testing/sysfs-kernel-mm-numa
index 77e559d4ed80..ebb041891db2 100644
--- a/Documentation/ABI/testing/sysfs-kernel-mm-numa
+++ b/Documentation/ABI/testing/sysfs-kernel-mm-numa
@@ -22,3 +22,23 @@ Description:	Enable/disable demoting pages during reclaim
 		the guarantees of cpusets.  This should not be enabled
 		on systems which need strict cpuset location
 		guarantees.
+
+What:		/sys/kernel/mm/numa/pagecache_promotion_enabled
+Date:		January 2025
+Contact:	Linux memory management mailing list <linux-mm@kvack.org>
+Description:	Enable/disable promoting pages during file access
+
+		Page migration during file access is intended for systems
+		with tiered memory configurations that have significant
+		unmapped file cache usage. By default, file cache memory
+		on slower tiers will not be opportunistically promoted by
+		normal NUMA hint faults, because the system has no way to
+		track them.  This option enables opportunistic promotion
+		of pages that are accessed via syscall (e.g. read/write)
+		if multiple accesses occur in quick succession.
+
+		It may move data to a NUMA node that does not fall into
+		the cpuset of the allocating process which might be
+		construed to violate the guarantees of cpusets.  This
+		should not be enabled on systems which need strict cpuset
+		location guarantees.
diff --git a/include/linux/memory-tiers.h b/include/linux/memory-tiers.h
index 0dc0cf2863e2..fa96a67b8996 100644
--- a/include/linux/memory-tiers.h
+++ b/include/linux/memory-tiers.h
@@ -37,6 +37,7 @@ struct access_coordinate;
 
 #ifdef CONFIG_NUMA
 extern bool numa_demotion_enabled;
+extern bool numa_pagecache_promotion_enabled;
 extern struct memory_dev_type *default_dram_type;
 extern nodemask_t default_dram_nodes;
 struct memory_dev_type *alloc_memory_type(int adistance);
@@ -76,6 +77,7 @@ static inline bool node_is_toptier(int node)
 #else
 
 #define numa_demotion_enabled	false
+#define numa_pagecache_promotion_enabled	false
 #define default_dram_type	NULL
 #define default_dram_nodes	NODE_MASK_NONE
 /*
diff --git a/include/linux/migrate.h b/include/linux/migrate.h
index 3dfbe7c1cc83..80438ddd76c7 100644
--- a/include/linux/migrate.h
+++ b/include/linux/migrate.h
@@ -146,6 +146,7 @@ int migrate_misplaced_folio_prepare(struct folio *folio,
 		struct vm_area_struct *vma, int node);
 int migrate_misplaced_folio(struct folio *folio, int node);
 int migrate_misplaced_folio_batch(struct list_head *foliolist, int node);
+void promotion_candidate(struct folio *folio);
 #else
 static inline int migrate_misplaced_folio_prepare(struct folio *folio,
 		struct vm_area_struct *vma, int node)
@@ -160,6 +161,10 @@ int migrate_misplaced_folio_batch(struct list_head *foliolist, int node)
 {
 	return -EAGAIN; /* can't migrate now */
 }
+static inline void promotion_candidate(struct folio *folio)
+{
+	return;
+}
 #endif /* CONFIG_NUMA_BALANCING */
 
 #ifdef CONFIG_MIGRATION
diff --git a/include/linux/sched.h b/include/linux/sched.h
index 66b311fbd5d6..84b9bcfaa01d 100644
--- a/include/linux/sched.h
+++ b/include/linux/sched.h
@@ -1363,6 +1363,10 @@ struct task_struct {
 	unsigned long			numa_faults_locality[3];
 
 	unsigned long			numa_pages_migrated;
+
+	struct callback_head		numa_promo_work;
+	struct list_head		promo_list;
+	unsigned long			promo_count;
 #endif /* CONFIG_NUMA_BALANCING */
 
 #ifdef CONFIG_RSEQ
diff --git a/include/linux/sched/sysctl.h b/include/linux/sched/sysctl.h
index 5a64582b086b..50b1d1dc27e2 100644
--- a/include/linux/sched/sysctl.h
+++ b/include/linux/sched/sysctl.h
@@ -25,6 +25,7 @@ enum sched_tunable_scaling {
 
 #ifdef CONFIG_NUMA_BALANCING
 extern int sysctl_numa_balancing_mode;
+extern unsigned int sysctl_numa_balancing_promote_rate_limit;
 #else
 #define sysctl_numa_balancing_mode	0
 #endif
diff --git a/init/init_task.c b/init/init_task.c
index e557f622bd90..47162ed14106 100644
--- a/init/init_task.c
+++ b/init/init_task.c
@@ -187,6 +187,8 @@ struct task_struct init_task __aligned(L1_CACHE_BYTES) = {
 	.numa_preferred_nid = NUMA_NO_NODE,
 	.numa_group	= NULL,
 	.numa_faults	= NULL,
+	.promo_list	= LIST_HEAD_INIT(init_task.promo_list),
+	.promo_count	= 0,
 #endif
 #if defined(CONFIG_KASAN_GENERIC) || defined(CONFIG_KASAN_SW_TAGS)
 	.kasan_depth	= 1,
diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
index 3e9ca38512de..7612d5c2d75d 100644
--- a/kernel/sched/fair.c
+++ b/kernel/sched/fair.c
@@ -42,6 +42,7 @@
 #include <linux/interrupt.h>
 #include <linux/memory-tiers.h>
 #include <linux/mempolicy.h>
+#include <linux/migrate.h>
 #include <linux/mutex_api.h>
 #include <linux/profile.h>
 #include <linux/psi.h>
@@ -126,7 +127,7 @@ static unsigned int sysctl_sched_cfs_bandwidth_slice		= 5000UL;
 
 #ifdef CONFIG_NUMA_BALANCING
 /* Restrict the NUMA promotion throughput (MB/s) for each target node. */
-static unsigned int sysctl_numa_balancing_promote_rate_limit = 65536;
+unsigned int sysctl_numa_balancing_promote_rate_limit = 65536;
 #endif
 
 #ifdef CONFIG_SYSCTL
@@ -3537,6 +3538,25 @@ static void task_numa_work(struct callback_head *work)
 	}
 }
 
+static void task_numa_promotion_work(struct callback_head *work)
+{
+	struct task_struct *p = current;
+	struct list_head *promo_list= &p->promo_list;
+	int nid = numa_node_id();
+
+	SCHED_WARN_ON(p != container_of(work, struct task_struct, numa_promo_work));
+
+	work->next = work;
+
+	if (list_empty(promo_list))
+		return;
+
+	migrate_misplaced_folio_batch(promo_list, nid);
+	current->promo_count = 0;
+	return;
+}
+
+
 void init_numa_balancing(unsigned long clone_flags, struct task_struct *p)
 {
 	int mm_users = 0;
@@ -3561,8 +3581,10 @@ void init_numa_balancing(unsigned long clone_flags, struct task_struct *p)
 	RCU_INIT_POINTER(p->numa_group, NULL);
 	p->last_task_numa_placement	= 0;
 	p->last_sum_exec_runtime	= 0;
+	INIT_LIST_HEAD(&p->promo_list);
 
 	init_task_work(&p->numa_work, task_numa_work);
+	init_task_work(&p->numa_promo_work, task_numa_promotion_work);
 
 	/* New address space, reset the preferred nid */
 	if (!(clone_flags & CLONE_VM)) {
diff --git a/mm/memory-tiers.c b/mm/memory-tiers.c
index fc14fe53e9b7..e8acb54aa8df 100644
--- a/mm/memory-tiers.c
+++ b/mm/memory-tiers.c
@@ -935,6 +935,7 @@ static int __init memory_tier_init(void)
 subsys_initcall(memory_tier_init);
 
 bool numa_demotion_enabled = false;
+bool numa_pagecache_promotion_enabled = false;
 
 #ifdef CONFIG_MIGRATION
 #ifdef CONFIG_SYSFS
@@ -957,11 +958,37 @@ static ssize_t demotion_enabled_store(struct kobject *kobj,
 	return count;
 }
 
+static ssize_t pagecache_promotion_enabled_show(struct kobject *kobj,
+						struct kobj_attribute *attr,
+						char *buf)
+{
+	return sysfs_emit(buf, "%s\n",
+			  numa_pagecache_promotion_enabled ? "true" : "false");
+}
+
+static ssize_t pagecache_promotion_enabled_store(struct kobject *kobj,
+						 struct kobj_attribute *attr,
+						 const char *buf, size_t count)
+{
+	ssize_t ret;
+
+	ret = kstrtobool(buf, &numa_pagecache_promotion_enabled);
+	if (ret)
+		return ret;
+
+	return count;
+}
+
+
 static struct kobj_attribute numa_demotion_enabled_attr =
 	__ATTR_RW(demotion_enabled);
 
+static struct kobj_attribute numa_pagecache_promotion_enabled_attr =
+	__ATTR_RW(pagecache_promotion_enabled);
+
 static struct attribute *numa_attrs[] = {
 	&numa_demotion_enabled_attr.attr,
+	&numa_pagecache_promotion_enabled_attr.attr,
 	NULL,
 };
 
diff --git a/mm/migrate.c b/mm/migrate.c
index a751a995f2d9..97f86ee6fd0d 100644
--- a/mm/migrate.c
+++ b/mm/migrate.c
@@ -44,6 +44,8 @@
 #include <linux/sched/sysctl.h>
 #include <linux/memory-tiers.h>
 #include <linux/pagewalk.h>
+#include <linux/sched/numa_balancing.h>
+#include <linux/task_work.h>
 
 #include <asm/tlbflush.h>
 
@@ -2736,5 +2738,58 @@ int migrate_misplaced_folio_batch(struct list_head *folio_list, int node)
 	BUG_ON(!list_empty(folio_list));
 	return nr_remaining ? -EAGAIN : 0;
 }
+
+/**
+ * promotion_candidate: report a promotion candidate folio
+ *
+ * The folio will be isolated from LRU if selected, and task_work will
+ * putback the folio on promotion failure.
+ *
+ * Candidates may not be promoted and may be returned to the LRU.
+ *
+ * Takes a folio reference that will be released in task work.
+ */
+void promotion_candidate(struct folio *folio)
+{
+	struct task_struct *task = current;
+	struct list_head *promo_list= &task->promo_list;
+	struct callback_head *work = &task->numa_promo_work;
+	int nid = folio_nid(folio);
+	int flags, last_cpupid;
+
+	/* do not migrate toptier folios or in kernel context */
+	if (node_is_toptier(nid) || task->flags & PF_KTHREAD)
+		return;
+
+	/*
+	 * Limit per-syscall migration rate to balancing rate limit. This avoids
+	 * excessive work during large reads knowing that task work is likely to
+	 * hit the rate limit and put excess folios back on the LRU anyway.
+	 */
+	if (task->promo_count >= sysctl_numa_balancing_promote_rate_limit)
+		return;
+
+	/* Isolate the folio to prepare for migration */
+	nid = numa_migrate_check(folio, NULL, 0, &flags, folio_test_dirty(folio),
+				 &last_cpupid);
+	if (nid == NUMA_NO_NODE)
+		return;
+
+	if (migrate_misplaced_folio_prepare(folio, NULL, nid))
+		return;
+
+	/*
+	 * If work is pending, add this folio to the list. Otherwise, ensure
+	 * the task will execute the work, otherwise we can leak folios.
+	 */
+	if (list_empty(promo_list) && task_work_add(task, work, TWA_RESUME)) {
+		folio_putback_lru(folio);
+		return;
+	}
+	list_add_tail(&folio->lru, promo_list);
+	task->promo_count += folio_nr_pages(folio);
+	return;
+}
+EXPORT_SYMBOL(promotion_candidate);
 #endif /* CONFIG_NUMA_BALANCING */
 #endif /* CONFIG_NUMA */
diff --git a/mm/swap.c b/mm/swap.c
index 746a5ceba42c..c006be6048f4 100644
--- a/mm/swap.c
+++ b/mm/swap.c
@@ -37,6 +37,10 @@
 #include <linux/page_idle.h>
 #include <linux/local_lock.h>
 #include <linux/buffer_head.h>
+#include <linux/migrate.h>
+#include <linux/memory-tiers.h>
+#include <linux/sched/sysctl.h>
+#include <linux/sched/numa_balancing.h>
 
 #include "internal.h"
 
@@ -474,6 +478,10 @@ void folio_mark_accessed(struct folio *folio)
 			__lru_cache_activate_folio(folio);
 		folio_clear_referenced(folio);
 		workingset_activation(folio);
+	} else if (!folio_test_isolated(folio) &&
+		   (sysctl_numa_balancing_mode & NUMA_BALANCING_MEMORY_TIERING) &&
+		   numa_pagecache_promotion_enabled) {
+		promotion_candidate(folio);
 	}
 	if (folio_test_idle(folio))
 		folio_clear_idle(folio);
-- 
2.47.1

