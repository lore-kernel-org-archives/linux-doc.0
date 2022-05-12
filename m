Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E678C433EF
	for <linux-doc@archiver.kernel.org>; Thu, 12 May 2022 04:12:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1346049AbiELEM0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 12 May 2022 00:12:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1346177AbiELEMX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 12 May 2022 00:12:23 -0400
Received: from mail-pf1-x435.google.com (mail-pf1-x435.google.com [IPv6:2607:f8b0:4864:20::435])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 180731E655E
        for <linux-doc@vger.kernel.org>; Wed, 11 May 2022 21:12:21 -0700 (PDT)
Received: by mail-pf1-x435.google.com with SMTP id x52so3676918pfu.11
        for <linux-doc@vger.kernel.org>; Wed, 11 May 2022 21:12:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=TxGePxN899QZhoK9/ghhqKhjvB6kwBatns9zvkXLNoM=;
        b=5zL6Ux4e5oQOa5p8UgoVRa+EphNIOXbDGvd4yValnePwa3YJG1ssf/8rGQRoNCsyrt
         CuDmkNTu7sLWTMq08LcZxESPc3ozL+U78k5n5c3HjkUCFvpypuZHMp/PgqSnMlDy+eKU
         NqbbL9vpL/W+bIgm1t9Ucz4DHkXVi8bN2zlZtKYRNltw+TRNmzJj/K2XOXpWi0y69Gee
         Eb/71eBVxQ/nccsjGzZWx133Y3/Y3OiynRyJNxUoZZlwv4HyUR21aSM94644h+rZvrH1
         Y9tLCKei7VC4m7oEInWdeYlEaPrS4BE2wjBSyAc5VUogoyIGVMkXMeMQhirseXGhWBtR
         g5fw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=TxGePxN899QZhoK9/ghhqKhjvB6kwBatns9zvkXLNoM=;
        b=aebzB/p6OuV6AjCVyG53am72eyVLXjgFJhpMmq6sBTgwa0ZsgMC8TXDdK54lDlziYG
         Hz8/bBYSHPAf5dFVDn//2Fljhmn4uahi9d0b4ttYwtkwnDDnSdPhyf3Z9vrKHfiMdxD1
         Ql3hD47tSwuVxQGVFaCM2kfsS0CXZZOxaGjUZL8cjtx0qK2fPX7CCVlX3LESw657XOdF
         U9/dY/ZZpFBCw3K5uXzhhYcnYpTzLpE/sodrCsRT5OgAZQ46PqwfB/N+eGskG4kyfMHO
         6x7l6gadOPUP5YuOlfe9xky+sSZ5xeaTXOtlFbWaZjqO0r2sSKh2x7AceAh8HvMA0J9g
         6l5g==
X-Gm-Message-State: AOAM532xPeqDTFTl8/m3CVnBtpPATTkCPHSbdmMy7u24iYr/yR7YMpaZ
        sqY/bqB6RXaClaTQtZHekRkVSQ==
X-Google-Smtp-Source: ABdhPJyVzqXQhaRwLwOwpPjYhG5wgU6VIzcyA+6dFV5TpJfz6U6+N3dreyMpzMgCCcyOwbALtRgaug==
X-Received: by 2002:a05:6a00:24d5:b0:50d:eea9:507 with SMTP id d21-20020a056a0024d500b0050deea90507mr28438515pfv.15.1652328741326;
        Wed, 11 May 2022 21:12:21 -0700 (PDT)
Received: from FVFYT0MHHV2J.bytedance.net ([139.177.225.234])
        by smtp.gmail.com with ESMTPSA id q13-20020a170902edcd00b0015e8d4eb2dcsm2695161plk.294.2022.05.11.21.12.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 May 2022 21:12:21 -0700 (PDT)
From:   Muchun Song <songmuchun@bytedance.com>
To:     corbet@lwn.net, mike.kravetz@oracle.com, akpm@linux-foundation.org,
        mcgrof@kernel.org, keescook@chromium.org, yzaikin@google.com,
        osalvador@suse.de, david@redhat.com, masahiroy@kernel.org
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, duanxiongchun@bytedance.com, smuchun@gmail.com,
        Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v11 2/4] mm: memory_hotplug: override memmap_on_memory when hugetlb_free_vmemmap=on
Date:   Thu, 12 May 2022 12:11:40 +0800
Message-Id: <20220512041142.39501-3-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220512041142.39501-1-songmuchun@bytedance.com>
References: <20220512041142.39501-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Optimizing HugeTLB vmemmap pages is not compatible with allocating memmap on
hot added memory. If "hugetlb_free_vmemmap=on" and
memory_hotplug.memmap_on_memory" are both passed on the kernel command line,
optimizing hugetlb pages takes precedence.  However, the global variable
memmap_on_memory will still be set to 1, even though we will not try to
allocate memmap on hot added memory.

Also introduce mhp_memmap_on_memory() helper to move the definition of
"memmap_on_memory" to the scope of CONFIG_MHP_MEMMAP_ON_MEMORY.  In the
next patch, mhp_memmap_on_memory() will also be exported to be used in
hugetlb_vmemmap.c.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Mike Kravetz <mike.kravetz@oracle.com>
---
 mm/memory_hotplug.c | 32 ++++++++++++++++++++++++++------
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 111684878fd9..a6101ae402f9 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -42,14 +42,36 @@
 #include "internal.h"
 #include "shuffle.h"
 
+#ifdef CONFIG_MHP_MEMMAP_ON_MEMORY
+static int memmap_on_memory_set(const char *val, const struct kernel_param *kp)
+{
+	if (hugetlb_optimize_vmemmap_enabled())
+		return 0;
+	return param_set_bool(val, kp);
+}
+
+static const struct kernel_param_ops memmap_on_memory_ops = {
+	.flags	= KERNEL_PARAM_OPS_FL_NOARG,
+	.set	= memmap_on_memory_set,
+	.get	= param_get_bool,
+};
 
 /*
  * memory_hotplug.memmap_on_memory parameter
  */
 static bool memmap_on_memory __ro_after_init;
-#ifdef CONFIG_MHP_MEMMAP_ON_MEMORY
-module_param(memmap_on_memory, bool, 0444);
+module_param_cb(memmap_on_memory, &memmap_on_memory_ops, &memmap_on_memory, 0444);
 MODULE_PARM_DESC(memmap_on_memory, "Enable memmap on memory for memory hotplug");
+
+static inline bool mhp_memmap_on_memory(void)
+{
+	return memmap_on_memory;
+}
+#else
+static inline bool mhp_memmap_on_memory(void)
+{
+	return false;
+}
 #endif
 
 enum {
@@ -1263,9 +1285,7 @@ bool mhp_supports_memmap_on_memory(unsigned long size)
 	 *       altmap as an alternative source of memory, and we do not exactly
 	 *       populate a single PMD.
 	 */
-	return memmap_on_memory &&
-	       !hugetlb_optimize_vmemmap_enabled() &&
-	       IS_ENABLED(CONFIG_MHP_MEMMAP_ON_MEMORY) &&
+	return mhp_memmap_on_memory() &&
 	       size == memory_block_size_bytes() &&
 	       IS_ALIGNED(vmemmap_size, PMD_SIZE) &&
 	       IS_ALIGNED(remaining_size, (pageblock_nr_pages << PAGE_SHIFT));
@@ -2083,7 +2103,7 @@ static int __ref try_remove_memory(u64 start, u64 size)
 	 * We only support removing memory added with MHP_MEMMAP_ON_MEMORY in
 	 * the same granularity it was added - a single memory block.
 	 */
-	if (memmap_on_memory) {
+	if (mhp_memmap_on_memory()) {
 		nr_vmemmap_pages = walk_memory_blocks(start, size, NULL,
 						      get_nr_vmemmap_pages_cb);
 		if (nr_vmemmap_pages) {
-- 
2.11.0

