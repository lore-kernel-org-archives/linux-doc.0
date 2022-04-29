Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C77A1C433F5
	for <linux-doc@archiver.kernel.org>; Fri, 29 Apr 2022 12:18:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1359002AbiD2MWG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 29 Apr 2022 08:22:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39158 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1358994AbiD2MWE (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 29 Apr 2022 08:22:04 -0400
Received: from mail-pj1-x102b.google.com (mail-pj1-x102b.google.com [IPv6:2607:f8b0:4864:20::102b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1D3E7C7492
        for <linux-doc@vger.kernel.org>; Fri, 29 Apr 2022 05:18:44 -0700 (PDT)
Received: by mail-pj1-x102b.google.com with SMTP id fv2so6962553pjb.4
        for <linux-doc@vger.kernel.org>; Fri, 29 Apr 2022 05:18:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=nJJ2yjd2/4fpAJdLzUZPduPx0rYtfHlVNZ/74R+S6Q4=;
        b=LQd2JOMlImsT/p4HS41D/RtsHSJZpYb3+IgaBw60oQMRt6xScDB2h3Cyv1Qgjeu9FP
         b8bzT9WGQeRMlS7OuyfciF4JYpY8ls0XRS1bKUgVCVt5DBlLWj4lG+cPRGPpcVC2XtTE
         F5v37DJLI/0QKaTs+yal0pE+KhbU0B9ch6P6DRcQpgXDBaPiwrd1Lwpe9GtDh2M4ark7
         0cdobSG90wKyu0bVuPGgv2HxsN6B3wFfiXNClO//SmKe8T/SdM6ObvpJNJ6Ud6c4AvYl
         WMft94Lmfu0J6U9LbnBiK/xoT5tuljWb9LLQSJSXyxlTEzT03Gjl4YkVbeUyzhylRQls
         MhPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=nJJ2yjd2/4fpAJdLzUZPduPx0rYtfHlVNZ/74R+S6Q4=;
        b=P21j6xIutoKlFRHe9AA16fS1ZRsm0euDeC2Bvj3IZFH0f20SujTBaCuosTwZPuUyUG
         LiRWOI7YtBRZLc+89QQizukbMBYpefl3qBdv2uYsB9tOMoaxkyDsPsijbfQFUXR89hj4
         1SS9lwh6yOVahvNvnenG19UH2D5JsBkgqftmVRBzdLWE+uYW/Pn/Rvq5hfDGltBPvzTV
         uvsURK+5VF0bJ1x0HwAKMLKQQ0HAzqGurRnM7zofV3GXipUjz/vADd3bT28AnxQ5b1+Z
         gh2xaODgHyaIJ84GnYUxNiDzGKG5jicRHYafxO+Cw4kEe3N+Vq2xM1i8B9hIyjwFFklw
         W9OQ==
X-Gm-Message-State: AOAM531bwRb5mRhBSGxpDbeJv+EtpjVh0kVmVSiaQvw68jlZH0Ntpwxc
        eGomoXTmjLF2aIAZDtm8pUcfVw==
X-Google-Smtp-Source: ABdhPJzsAHVZK1rLNyDCsVai7UxB75Y9vMNVPvKk2z6nj+5DQi5ljAM0esq9Q83iXNA0RQHyq6G78g==
X-Received: by 2002:a17:90a:dd46:b0:1b8:8:7303 with SMTP id u6-20020a17090add4600b001b800087303mr3592108pjv.197.1651234723558;
        Fri, 29 Apr 2022 05:18:43 -0700 (PDT)
Received: from FVFYT0MHHV2J.bytedance.net ([139.177.225.239])
        by smtp.gmail.com with ESMTPSA id k11-20020a056a00168b00b004f7e1555538sm3101421pfc.190.2022.04.29.05.18.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 05:18:43 -0700 (PDT)
From:   Muchun Song <songmuchun@bytedance.com>
To:     corbet@lwn.net, mike.kravetz@oracle.com, akpm@linux-foundation.org,
        mcgrof@kernel.org, keescook@chromium.org, yzaikin@google.com,
        osalvador@suse.de, david@redhat.com, masahiroy@kernel.org
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, duanxiongchun@bytedance.com, smuchun@gmail.com,
        Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v9 2/4] mm: memory_hotplug: override memmap_on_memory when hugetlb_free_vmemmap=on
Date:   Fri, 29 Apr 2022 20:18:14 +0800
Message-Id: <20220429121816.37541-3-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220429121816.37541-1-songmuchun@bytedance.com>
References: <20220429121816.37541-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

When "hugetlb_free_vmemmap=on" and "memory_hotplug.memmap_on_memory"
are both passed to boot cmdline, the variable of "memmap_on_memory"
will be set to 1 even if the vmemmap pages will not be allocated from
the hotadded memory since the former takes precedence over the latter.
In the next patch, we want to enable or disable the feature of freeing
vmemmap pages of HugeTLB via sysctl.  We need a way to know if the
feature of memory_hotplug.memmap_on_memory is enabled when enabling
the feature of freeing vmemmap pages since those two features are not
compatible, however, the variable of "memmap_on_memory" cannot indicate
this nowadays.  Do not set "memmap_on_memory" to 1 when both parameters
are passed to cmdline, in this case, "memmap_on_memory" could indicate
if this feature is enabled by the users.

Also introduce mhp_memmap_on_memory() helper to move the definition of
"memmap_on_memory" to the scope of CONFIG_MHP_MEMMAP_ON_MEMORY.  In the
next patch, mhp_memmap_on_memory() will also be exported to be used in
hugetlb_vmemmap.c.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
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

