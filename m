Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2F8BC433EF
	for <linux-doc@archiver.kernel.org>; Mon,  7 Mar 2022 13:08:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236028AbiCGNJo (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 7 Mar 2022 08:09:44 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39846 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233581AbiCGNJn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Mar 2022 08:09:43 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF53969CEF
        for <linux-doc@vger.kernel.org>; Mon,  7 Mar 2022 05:08:46 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id kx1-20020a17090b228100b001bf2dd26729so6847568pjb.1
        for <linux-doc@vger.kernel.org>; Mon, 07 Mar 2022 05:08:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eZY7gA2azo+4sffK75qtgPBXDeGINoqj5q7b11RTqYU=;
        b=Kse9gu+yaCLOEChe3cuA0Kb8eck2heSq5BOv8WU9ue+N9gUxdSkaNvkKxdDqZpzml5
         7CRSs4fHIdvmCKOR4jjyWcn95Hn9m9ypLaWya+bCSj7EPJD1D30SFFOsHR8crWGPRQoB
         WHX5tOWQIJINeYODVkyoAwwyluernd4B0VPvXcgGwCL7yUJh2yFC1NQjUyVMbnQDsy7i
         VGWCoxmXD9JxkzayLdD3GxHLoo0uBJkZrRDdmkFlGzcvyIbL5RxKRQd7yAEEaiYrjaAi
         PF1CuJ8mURertrx7GdYJi1cwD7MIicxvaYivlicjKPJPDmLfWHQaGyoTqp8Kmba3t+Dk
         tRsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eZY7gA2azo+4sffK75qtgPBXDeGINoqj5q7b11RTqYU=;
        b=tlau3PokS43FqLgl7b6ciSaTxP7cPyqrQTctIiSidyhg7wilbgL8CGEqgZWvD4Jeoy
         NcJUOkxtNT767Zg/sJ7Wzf7yHn5pSQSzS7tvIMGfRdoZvSxluKLGQehEi6SnLVRu9d7M
         tBHULOsjfuLZvaBnIAcN2HPaAIuSuOQFDKVlfHCPVOpnZoJ5DKQ3ZF71PXxHgYxrTF6+
         bXTlGuWiKjv7G83Du6ZTvWOkfqvXDphSnKrjSW8hv06uVEum9vBkyHnOv1NTebmA0ZbL
         rsy8k+JzD03CZaInA6ilNwK1aIxwXmWnnTNSvA+A9jy1566Kz6BItoOeVONfzG3EKN7X
         Ow1g==
X-Gm-Message-State: AOAM533aFq++7uOpLNoz2xCSys7HJF3CMhLCREB+CktcW/2itOzVbdCv
        B2C7iJslUgbo9wISaDmDkUKDYw==
X-Google-Smtp-Source: ABdhPJw8PMBRA/Jiet3aOehZpxwLq5aQgGRk+n6DAlJRzdFAldXJjBHSB6LzkRlc4xetOEKUOh8p6A==
X-Received: by 2002:a17:90b:1c8e:b0:1bf:364c:dd7a with SMTP id oo14-20020a17090b1c8e00b001bf364cdd7amr12718994pjb.103.1646658526331;
        Mon, 07 Mar 2022 05:08:46 -0800 (PST)
Received: from FVFYT0MHHV2J.bytedance.net ([139.177.225.245])
        by smtp.gmail.com with ESMTPSA id x9-20020aa79409000000b004f704d33ca0sm3258528pfo.136.2022.03.07.05.08.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Mar 2022 05:08:46 -0800 (PST)
From:   Muchun Song <songmuchun@bytedance.com>
To:     corbet@lwn.net, mike.kravetz@oracle.com, akpm@linux-foundation.org,
        mcgrof@kernel.org, keescook@chromium.org, yzaikin@google.com,
        osalvador@suse.de, david@redhat.com
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, duanxiongchun@bytedance.com, smuchun@gmail.com,
        Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v3 2/4] mm: memory_hotplug: override memmap_on_memory when hugetlb_free_vmemmap=on
Date:   Mon,  7 Mar 2022 21:07:06 +0800
Message-Id: <20220307130708.58771-3-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220307130708.58771-1-songmuchun@bytedance.com>
References: <20220307130708.58771-1-songmuchun@bytedance.com>
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
"memmap_on_memory" to the scope of CONFIG_MHP_MEMMAP_ON_MEMORY.  It
could save a sizeof(bool) memory when !CONFIG_MHP_MEMMAP_ON_MEMORY.
In the next patch, mhp_memmap_on_memory() will also be exported to be
used in hugetlb_vmemmap.c.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/memory_hotplug.c | 32 ++++++++++++++++++++++++++------
 1 file changed, 26 insertions(+), 6 deletions(-)

diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index c226a337c1ef..d92edf102cfe 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -42,14 +42,36 @@
 #include "internal.h"
 #include "shuffle.h"
 
+#ifdef CONFIG_MHP_MEMMAP_ON_MEMORY
+static int memmap_on_memory_set(const char *val, const struct kernel_param *kp)
+{
+	if (hugetlb_free_vmemmap_enabled())
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
@@ -1289,9 +1311,7 @@ bool mhp_supports_memmap_on_memory(unsigned long size)
 	 *       altmap as an alternative source of memory, and we do not exactly
 	 *       populate a single PMD.
 	 */
-	return memmap_on_memory &&
-	       !hugetlb_free_vmemmap_enabled() &&
-	       IS_ENABLED(CONFIG_MHP_MEMMAP_ON_MEMORY) &&
+	return mhp_memmap_on_memory() &&
 	       size == memory_block_size_bytes() &&
 	       IS_ALIGNED(vmemmap_size, PMD_SIZE) &&
 	       IS_ALIGNED(remaining_size, (pageblock_nr_pages << PAGE_SHIFT));
@@ -2075,7 +2095,7 @@ static int __ref try_remove_memory(u64 start, u64 size)
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

