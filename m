Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9EA2D7D099
	for <lwn-linux-doc@archive.lwn.net>; Fri, 18 Jan 2019 13:44:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727496AbfARNo3 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 18 Jan 2019 08:44:29 -0500
Received: from mail-wm1-f66.google.com ([209.85.128.66]:37814 "EHLO
        mail-wm1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728014AbfARNo2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 Jan 2019 08:44:28 -0500
Received: by mail-wm1-f66.google.com with SMTP id g67so4542594wmd.2
        for <linux-doc@vger.kernel.org>; Fri, 18 Jan 2019 05:44:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id;
        bh=6xhP3iFZu+KY4p6uA7nxYzqv59edNtjKSfjSMfB8u+8=;
        b=UrHguNnD28eUc06ATqkWwzWIuediGZIT8Dojl9XpKM6si+KEAo2f5PlG2pg95exakT
         MLQxBCSC0qc93Qq2SzWaa+AwWlvX/zyeoXg1MayvY31RwVgkoOtordjOHMGHlSVZLPMg
         S+KEoJ3I563xPNO/nG1AY7RFJKNM/VFPv1RIVXB7XTxWormA7mXAKRE377Hu+7b8ND0G
         x+cdGEukxB69l9/3f2p86X01VUTaygkoyEsimE8CxVnUK2xV0N9EDoFujiLjJslz+/2m
         djYhUUeDzLr4GTVaaFvF/pA6/hlj3MOTyhBmUnSpeZYF6POoYJXZ5vffMub2r9C0QT6Z
         HMBg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=6xhP3iFZu+KY4p6uA7nxYzqv59edNtjKSfjSMfB8u+8=;
        b=r45wfmIefxDyOe78sBj3mUerSSfNo9gdjendMmqs68N02Kz4XVI+48QWOLDYTMKysW
         gC6GqMP9hQOJUi20GUrQ4CDN1M09RlSiZbW4Vqkx+Ony2WJrwmMRllH+dZu7GJHod7ji
         uF3jNzaVUVsSuvOThfNmajBOo6LbjyeBaNstHPQ0dLzGuzInCvK7YNC9uBasOI6xvcGl
         ECK7ubHYbAZGcROzw/vc2F8zrwdHiaWqrfyf/gVvc1+1BPhwBsyweoV8C9DwDi5W5pVn
         51exKuaq4pwB/DqQXOGzsP63jPSfEG2cWQiALRWxhfLjmcxvhhTjx1o35FyZePiOj0FC
         ccUQ==
X-Gm-Message-State: AJcUukcOSHHfVSNi+TlWVm8Ax1bsfUs4Q3e8c4aT7Z/lRDJ0ppyvTJ0g
        wINwM+xiN42txfhbAY4iD4EeLisqWJQ=
X-Google-Smtp-Source: ALg8bN6q8pkGJRQqKhQVSRwKN5gJFmOp6G9FcYQc3pwLEAsOrr31MF/rkKFXCJD++LEhcH5RIccvsg==
X-Received: by 2002:a1c:3d44:: with SMTP id k65mr15541959wma.76.1547819066534;
        Fri, 18 Jan 2019 05:44:26 -0800 (PST)
Received: from localhost.localdomain ([51.15.160.169])
        by smtp.googlemail.com with ESMTPSA id y13sm65912208wrn.73.2019.01.18.05.44.25
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-SHA bits=128/128);
        Fri, 18 Jan 2019 05:44:25 -0800 (PST)
From:   Corentin Labbe <clabbe@baylibre.com>
To:     corbet@lwn.net, hch@lst.de, m.szyprowski@samsung.com,
        robin.murphy@arm.com
Cc:     iommu@lists.linux-foundation.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, Corentin Labbe <clabbe@baylibre.com>
Subject: [PATCH v2] dma-debug: add dumping facility via debugfs
Date:   Fri, 18 Jan 2019 13:44:18 +0000
Message-Id: <1547819058-3552-1-git-send-email-clabbe@baylibre.com>
X-Mailer: git-send-email 2.7.4
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

While debugging a DMA mapping leak, I needed to access
debug_dma_dump_mappings() but easily from user space.

This patch adds a /sys/kernel/debug/dma-api/dump file which contain all
current DMA mapping.

Signed-off-by: Corentin Labbe <clabbe@baylibre.com>
---
Changes since v1:
- Use DEFINE_SHOW_ATTRIBUTE
- Add Documentation

 Documentation/DMA-API.txt |  3 +++
 kernel/dma/debug.c        | 36 ++++++++++++++++++++++++++++++++++++
 2 files changed, 39 insertions(+)

diff --git a/Documentation/DMA-API.txt b/Documentation/DMA-API.txt
index e133ccd60228..78114ee63057 100644
--- a/Documentation/DMA-API.txt
+++ b/Documentation/DMA-API.txt
@@ -696,6 +696,9 @@ dma-api/disabled		This read-only file contains the character 'Y'
 				happen when it runs out of memory or if it was
 				disabled at boot time
 
+dma-api/dump			This read-only file contains current DMA
+				mappings.
+
 dma-api/error_count		This file is read-only and shows the total
 				numbers of errors found.
 
diff --git a/kernel/dma/debug.c b/kernel/dma/debug.c
index 23cf5361bcf1..b4827b1c9070 100644
--- a/kernel/dma/debug.c
+++ b/kernel/dma/debug.c
@@ -144,6 +144,7 @@ static struct dentry *num_free_entries_dent __read_mostly;
 static struct dentry *min_free_entries_dent __read_mostly;
 static struct dentry *nr_total_entries_dent __read_mostly;
 static struct dentry *filter_dent           __read_mostly;
+static struct dentry *dump_dent             __read_mostly;
 
 /* per-driver filter related state */
 
@@ -840,6 +841,36 @@ static const struct file_operations filter_fops = {
 	.llseek = default_llseek,
 };
 
+static int dump_show(struct seq_file *seq, void *v)
+{
+	int idx;
+
+	for (idx = 0; idx < HASH_SIZE; idx++) {
+		struct hash_bucket *bucket = &dma_entry_hash[idx];
+		struct dma_debug_entry *entry;
+		unsigned long flags;
+
+		spin_lock_irqsave(&bucket->lock, flags);
+
+		list_for_each_entry(entry, &bucket->list, list) {
+			seq_printf(seq,
+				   "%s %s %s idx %d P=%llx N=%lx D=%llx L=%llx %s %s\n",
+				   dev_name(entry->dev),
+				   dev_driver_string(entry->dev),
+				   type2name[entry->type], idx,
+				   phys_addr(entry), entry->pfn,
+				   entry->dev_addr, entry->size,
+				   dir2name[entry->direction],
+				   maperr2str[entry->map_err_type]);
+		}
+
+		spin_unlock_irqrestore(&bucket->lock, flags);
+	}
+	return 0;
+}
+
+DEFINE_SHOW_ATTRIBUTE(dump);
+
 static int dma_debug_fs_init(void)
 {
 	dma_debug_dent = debugfs_create_dir("dma-api", NULL);
@@ -894,6 +925,11 @@ static int dma_debug_fs_init(void)
 	if (!filter_dent)
 		goto out_err;
 
+	dump_dent = debugfs_create_file("dump", 0444,
+					dma_debug_dent, NULL, &dump_fops);
+	if (!dump_dent)
+		goto out_err;
+
 	return 0;
 
 out_err:
-- 
2.19.2

