Received: from mta21.hihonor.com (mta21.honor.com [81.70.160.142])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8584D199252;
	Fri, 28 Nov 2025 03:10:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=81.70.160.142
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764299431; cv=none; b=H3cdYdeg1SJ8k6IqoOh5pOW/Y0vjF08p+ACin5mosdzUrZLNXn0r0p7USwUkBKWi253HFq4n0/vLd3YFMcK4YRXRz7t0CMyAcz7BIzc6tCi8J6vNgQg3p+n3aBusdyTcRbKR2/eig0kXSSuku4zFDF7nNakZgCvGMvzAJLtI4Rg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764299431; c=relaxed/simple;
	bh=hk9UQh9z/96n9IuZCKnIWje2f+aFL+5nYxKb4bxDZbU=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=X0+l0oRWrcJflI02YzPpcOMKrmiXVsjPPAwrZKVbhjQXXN71FmxsvxXZvpSmb0vfhtxAJ+X57CJdzLfE1i0hmMwNqCMr3zQ9EsOJb9EW9CbfaWxXb1CUBBo9SqHFn75mm5eBUOdbsDlftRcggy9z4iZHliYBPTuzsbAeFoAuzq8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com; spf=pass smtp.mailfrom=honor.com; arc=none smtp.client-ip=81.70.160.142
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=honor.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=honor.com
Received: from w002.hihonor.com (unknown [10.68.28.120])
	by mta21.hihonor.com (SkyGuard) with ESMTPS id 4dHdBy1DhFzYmZ9w;
	Fri, 28 Nov 2025 10:52:58 +0800 (CST)
Received: from localhost.localdomain (10.144.5.36) by w002.hihonor.com
 (10.68.28.120) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.11; Fri, 28 Nov
 2025 10:54:19 +0800
From: Zicheng Wang <wangzicheng@honor.com>
To: <akpm@linux-foundation.org>, <hannes@cmpxchg.org>, <david@redhat.com>,
	<axelrasmussen@google.com>, <yuanchu@google.com>
CC: <mhocko@kernel.org>, <zhengqi.arch@bytedance.com>,
	<shakeel.butt@linux.dev>, <lorenzo.stoakes@oracle.com>, <weixugc@google.com>,
	<Liam.Howlett@oracle.com>, <vbabka@suse.cz>, <rppt@kernel.org>,
	<surenb@google.com>, <mhocko@suse.com>, <corbet@lwn.net>,
	<linux-mm@kvack.org>, <linux-doc@vger.kernel.org>,
	<linux-kernel@vger.kernel.org>, Zicheng Wang <wangzicheng@honor.com>
Subject: [PATCH 1/3] mm/lru_gen: add procfs support for lru_gen interfaces
Date: Fri, 28 Nov 2025 10:53:13 +0800
Message-ID: <20251128025315.3520689-2-wangzicheng@honor.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251128025315.3520689-1-wangzicheng@honor.com>
References: <20251128025315.3520689-1-wangzicheng@honor.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-ClientProxiedBy: w012.hihonor.com (10.68.27.189) To w002.hihonor.com
 (10.68.28.120)

This patch refactors the lru_gen and lru_gen_full control files to allow
their interfaces to be exposed under either debugfs or procfs.

Two main changes:
1. minimal code modification by reusing the existing seq_operations.
2. lru_gen file mode update from 0644 to 0664, so that Android's group
"system" can write to the file when procfs interface is enabled.

Signed-off-by: Zicheng Wang <wangzicheng@honor.com>
---
 mm/vmscan.c | 37 +++++++++++++++++++++++++++++++++++--
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/mm/vmscan.c b/mm/vmscan.c
index 674999999..dd30f3949 100644
--- a/mm/vmscan.c
+++ b/mm/vmscan.c
@@ -58,6 +58,7 @@
 #include <linux/random.h>
 #include <linux/mmu_notifier.h>
 #include <linux/parser.h>
+#include <linux/proc_fs.h>
 
 #include <asm/tlbflush.h>
 #include <asm/div64.h>
@@ -5324,9 +5325,17 @@ static const struct attribute_group lru_gen_attr_group = {
 };
 
 /******************************************************************************
- *                          debugfs interface
+ *                          lru_gen interface
  ******************************************************************************/
 
+static inline bool lru_gen_show_is_full(const struct file *file)
+{
+    /* procfs: i_private = (void *)1 means full
+     * debugfs: also works because debugfs sets i_private
+     */
+	return file->f_inode->i_private != NULL;
+}
+
 static void *lru_gen_seq_start(struct seq_file *m, loff_t *pos)
 {
 	struct mem_cgroup *memcg;
@@ -5435,7 +5444,7 @@ static void lru_gen_seq_show_full(struct seq_file *m, struct lruvec *lruvec,
 static int lru_gen_seq_show(struct seq_file *m, void *v)
 {
 	unsigned long seq;
-	bool full = debugfs_get_aux_num(m->file);
+	bool full = lru_gen_show_is_full(m->file);
 	struct lruvec *lruvec = v;
 	struct lru_gen_folio *lrugen = &lruvec->lrugen;
 	int nid = lruvec_pgdat(lruvec)->node_id;
@@ -5671,6 +5680,7 @@ static int lru_gen_seq_open(struct inode *inode, struct file *file)
 	return seq_open(file, &lru_gen_seq_ops);
 }
 
+#ifndef CONFIG_LRU_GEN_PROCFS_CTRL
 static const struct file_operations lru_gen_rw_fops = {
 	.open = lru_gen_seq_open,
 	.read = seq_read,
@@ -5685,6 +5695,22 @@ static const struct file_operations lru_gen_ro_fops = {
 	.llseek = seq_lseek,
 	.release = seq_release,
 };
+#else
+static const struct proc_ops lru_gen_proc_rw_ops = {
+	.proc_open    = lru_gen_seq_open,
+	.proc_read    = seq_read,
+	.proc_write   = lru_gen_seq_write,
+	.proc_lseek   = seq_lseek,
+	.proc_release = seq_release,
+};
+
+static const struct proc_ops lru_gen_proc_ro_ops = {
+	.proc_open    = lru_gen_seq_open,
+	.proc_read    = seq_read,
+	.proc_lseek   = seq_lseek,
+	.proc_release = seq_release,
+};
+#endif
 
 /******************************************************************************
  *                          initialization
@@ -5772,10 +5798,17 @@ static int __init init_lru_gen(void)
 	if (sysfs_create_group(mm_kobj, &lru_gen_attr_group))
 		pr_err("lru_gen: failed to create sysfs group\n");
 
+#ifndef CONFIG_LRU_GEN_PROCFS_CTRL
 	debugfs_create_file_aux_num("lru_gen", 0644, NULL, NULL, false,
 				    &lru_gen_rw_fops);
 	debugfs_create_file_aux_num("lru_gen_full", 0444, NULL, NULL, true,
 				    &lru_gen_ro_fops);
+#else
+	proc_create_data("lru_gen", 0664, NULL,
+					&lru_gen_proc_rw_ops, NULL);
+	proc_create_data("lru_gen_full", 0444, NULL,
+					&lru_gen_proc_ro_ops, (void *)1);
+#endif
 
 	return 0;
 };
-- 
2.25.1

