Return-Path: <SRS0=dOZX=D3=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 09AE5C433E7
	for <linux-doc@archiver.kernel.org>; Tue, 20 Oct 2020 09:05:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7CD322224F
	for <linux-doc@archiver.kernel.org>; Tue, 20 Oct 2020 09:05:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=amazon.com header.i=@amazon.com header.b="ss+KC4X0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2390669AbgJTJFy (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 20 Oct 2020 05:05:54 -0400
Received: from smtp-fw-9101.amazon.com ([207.171.184.25]:60251 "EHLO
        smtp-fw-9101.amazon.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2390557AbgJTJFy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 20 Oct 2020 05:05:54 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazon201209;
  t=1603184754; x=1634720754;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version;
  bh=JsfFNZwGqOpvXiFV1LBG6WzEtB5PCi7m9BtzNbnD0XM=;
  b=ss+KC4X0pecLuf2IUj3Ap9zq4uOpj0EruDEes0bMMVhecgqzW1RA73Tj
   XfnXvZzg0DNU5M/3DfEUgS7iB4V7e+SXu7PC8Saw2CMVR4XgXdDKoj8Lw
   7cn19kfvfnPQPVzVHqMfMvkwBMgR9o452lvf/rO6vc4CtgqqcgoFjPimL
   c=;
X-IronPort-AV: E=Sophos;i="5.77,396,1596499200"; 
   d="scan'208";a="78103905"
Received: from sea32-co-svc-lb4-vlan3.sea.corp.amazon.com (HELO email-inbound-relay-2a-538b0bfb.us-west-2.amazon.com) ([10.47.23.38])
  by smtp-border-fw-out-9101.sea19.amazon.com with ESMTP; 20 Oct 2020 09:05:54 +0000
Received: from EX13D31EUB001.ant.amazon.com (pdx4-ws-svc-p6-lb7-vlan3.pdx.amazon.com [10.170.41.166])
        by email-inbound-relay-2a-538b0bfb.us-west-2.amazon.com (Postfix) with ESMTPS id C054CA1C53;
        Tue, 20 Oct 2020 09:05:50 +0000 (UTC)
Received: from u3f2cd687b01c55.ant.amazon.com (10.43.161.237) by
 EX13D31EUB001.ant.amazon.com (10.43.166.210) with Microsoft SMTP Server (TLS)
 id 15.0.1497.2; Tue, 20 Oct 2020 09:05:30 +0000
From:   SeongJae Park <sjpark@amazon.com>
To:     <akpm@linux-foundation.org>
CC:     SeongJae Park <sjpark@amazon.de>, <Jonathan.Cameron@Huawei.com>,
        <aarcange@redhat.com>, <acme@kernel.org>,
        <alexander.shishkin@linux.intel.com>, <amit@kernel.org>,
        <benh@kernel.crashing.org>, <brendan.d.gregg@gmail.com>,
        <brendanhiggins@google.com>, <cai@lca.pw>,
        <colin.king@canonical.com>, <corbet@lwn.net>, <david@redhat.com>,
        <dwmw@amazon.com>, <elver@google.com>, <fan.du@intel.com>,
        <foersleo@amazon.de>, <gthelen@google.com>, <irogers@google.com>,
        <jolsa@redhat.com>, <kirill@shutemov.name>, <mark.rutland@arm.com>,
        <mgorman@suse.de>, <minchan@kernel.org>, <mingo@redhat.com>,
        <namhyung@kernel.org>, <peterz@infradead.org>,
        <rdunlap@infradead.org>, <riel@surriel.com>, <rientjes@google.com>,
        <rostedt@goodmis.org>, <rppt@kernel.org>, <sblbir@amazon.com>,
        <shakeelb@google.com>, <shuah@kernel.org>, <sj38.park@gmail.com>,
        <snu@amazon.de>, <vbabka@suse.cz>, <vdavydov.dev@gmail.com>,
        <yang.shi@linux.alibaba.com>, <ying.huang@intel.com>,
        <zgf574564920@gmail.com>, <linux-damon@amazon.com>,
        <linux-mm@kvack.org>, <linux-doc@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>
Subject: [PATCH v22 12/18] mm/damon/dbgfs: Export kdamond pid to the user space
Date:   Tue, 20 Oct 2020 10:59:34 +0200
Message-ID: <20201020085940.13875-13-sjpark@amazon.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201020085940.13875-1-sjpark@amazon.com>
References: <20201020085940.13875-1-sjpark@amazon.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.43.161.237]
X-ClientProxiedBy: EX13D41UWC001.ant.amazon.com (10.43.162.107) To
 EX13D31EUB001.ant.amazon.com (10.43.166.210)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: SeongJae Park <sjpark@amazon.de>

For CPU usage accounting, knowing pid of the monitoring thread could be
helpful.  For example, users could use cpuaccount cgroups with the pid.

This commit therefore exports the pid of currently running monitoring
thread to the user space via 'kdamond_pid' file in the debugfs
directory.

Signed-off-by: SeongJae Park <sjpark@amazon.de>
---
 mm/damon/dbgfs.c | 37 +++++++++++++++++++++++++++++++++++--
 1 file changed, 35 insertions(+), 2 deletions(-)

diff --git a/mm/damon/dbgfs.c b/mm/damon/dbgfs.c
index 5aac85de23d2..94ed2eca2510 100644
--- a/mm/damon/dbgfs.c
+++ b/mm/damon/dbgfs.c
@@ -369,6 +369,32 @@ static ssize_t dbgfs_target_ids_write(struct file *file,
 	return ret;
 }
 
+static ssize_t dbgfs_kdamond_pid_read(struct file *file,
+		char __user *buf, size_t count, loff_t *ppos)
+{
+	struct damon_ctx *ctx = file->private_data;
+	char *kbuf;
+	ssize_t len;
+
+	kbuf = kmalloc(count, GFP_KERNEL);
+	if (!kbuf)
+		return -ENOMEM;
+
+	mutex_lock(&ctx->kdamond_lock);
+	if (ctx->kdamond)
+		len = scnprintf(kbuf, count, "%d\n", ctx->kdamond->pid);
+	else
+		len = scnprintf(kbuf, count, "none\n");
+	mutex_unlock(&ctx->kdamond_lock);
+	if (!len)
+		goto out;
+	len = simple_read_from_buffer(buf, count, ppos, kbuf, len);
+
+out:
+	kfree(kbuf);
+	return len;
+}
+
 static int damon_dbgfs_open(struct inode *inode, struct file *file)
 {
 	file->private_data = inode->i_private;
@@ -397,11 +423,18 @@ static const struct file_operations target_ids_fops = {
 	.write = dbgfs_target_ids_write,
 };
 
+static const struct file_operations kdamond_pid_fops = {
+	.owner = THIS_MODULE,
+	.open = damon_dbgfs_open,
+	.read = dbgfs_kdamond_pid_read,
+};
+
 static int dbgfs_fill_ctx_dir(struct dentry *dir, struct damon_ctx *ctx)
 {
-	const char * const file_names[] = {"attrs", "record", "target_ids"};
+	const char * const file_names[] = {"attrs", "record", "target_ids",
+		"kdamond_pid"};
 	const struct file_operations *fops[] = {&attrs_fops, &record_fops,
-		&target_ids_fops};
+		&target_ids_fops}, &kdamond_pid_fops;
 	int i;
 
 	for (i = 0; i < ARRAY_SIZE(file_names); i++) {
-- 
2.17.1

