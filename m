Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FBEEC433F5
	for <linux-doc@archiver.kernel.org>; Tue, 12 Apr 2022 12:12:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351683AbiDLMPH (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 12 Apr 2022 08:15:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46624 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1354457AbiDLMOH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 12 Apr 2022 08:14:07 -0400
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 82B5E8595E
        for <linux-doc@vger.kernel.org>; Tue, 12 Apr 2022 04:15:11 -0700 (PDT)
Received: by mail-pj1-x102f.google.com with SMTP id mp16-20020a17090b191000b001cb5efbcab6so2491461pjb.4
        for <linux-doc@vger.kernel.org>; Tue, 12 Apr 2022 04:15:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=0UA2E7Swg+iesG+ux9AwzGNddrfmiNsjUbQGq/dsMiM=;
        b=KyuopGe1m1WVOFP9p32hmnKBOcBz7duXJkJk9fS7PkoLF0O/RrKyn0sKqaHT7mwP2o
         Oemd+xORRsXBp6BQ77rF2ECHQKbcsydrcRVQF+xON0R1Tc3192LcDa9tNR+Yhg72Hcko
         WDNb0O+5PAynoZQW4wML+O/ykXnlIcgyVq39+gR98yIkZ48xzIJDvoZWzM+bvssO9tUm
         82+Bu3gpNvE/FAoQFNukD7gOFZ1aOiNOmkU6gSOXM0qJyOIOfevULObXLuMq/Gcki9/P
         1JI9GHBns+7OgvpyjHhLm8EgsSAg1TAA9L0/viQqSSKRt1/ETaLApAa7XkNdQSziZJcQ
         FSQg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=0UA2E7Swg+iesG+ux9AwzGNddrfmiNsjUbQGq/dsMiM=;
        b=PSnmZ3GbMWRinm1+K/JbFBxqW1IgqC64ur++R1qEimgH6n6g0bMYM6IQDErkysZVfO
         Hcwg0impZ1M7551ZisZSDPl+oXvg+3WvdHgTXmqOXK7zHDDfXfHoWEyGujw41PgJr+Xl
         UvUfolKxeOVkXOSjN9es3RyX7AvoNhQxXMt20XZt70QtMujhLyeErUNzvJMBAD0zYa+e
         UUXZKHIGg+7H4+xfVgv5nkXgFPQBsNnZ2unSXJcwq4pEzjYPxxnpso4y6Ilo3j80ygel
         j8dgCNsc2aQBXuJR3WSnxSlT1cuMHbZwfTr4ck12F6eMXVWucnO9ipFKOTOhL4DU/eqH
         enPA==
X-Gm-Message-State: AOAM533jw96VejTFoMQzAdMHjFVtDLbpPHcdk9pCNaWlV52tp3vIB8dz
        myNspGBmDVGTCcPcorxTH9+EhQ==
X-Google-Smtp-Source: ABdhPJw0PpvcK/RfW3RHG1GTMBjicwgJXBBNM/iVvZwsd6IE8JTVr0XCaF+IWKEuybeVVBGmHde9Gw==
X-Received: by 2002:a17:902:c94d:b0:158:4e50:7a32 with SMTP id i13-20020a170902c94d00b001584e507a32mr12971286pla.163.1649762110989;
        Tue, 12 Apr 2022 04:15:10 -0700 (PDT)
Received: from FVFYT0MHHV2J.bytedance.net ([139.177.225.229])
        by smtp.gmail.com with ESMTPSA id l25-20020a635719000000b0039da6cdf82dsm402507pgb.83.2022.04.12.04.15.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 12 Apr 2022 04:15:10 -0700 (PDT)
From:   Muchun Song <songmuchun@bytedance.com>
To:     corbet@lwn.net, mike.kravetz@oracle.com, akpm@linux-foundation.org,
        mcgrof@kernel.org, keescook@chromium.org, yzaikin@google.com,
        osalvador@suse.de, david@redhat.com, masahiroy@kernel.org
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, duanxiongchun@bytedance.com, smuchun@gmail.com,
        Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v7 2/4] mm: memory_hotplug: override memmap_on_memory when hugetlb_free_vmemmap=on
Date:   Tue, 12 Apr 2022 19:14:32 +0800
Message-Id: <20220412111434.96498-3-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220412111434.96498-1-songmuchun@bytedance.com>
References: <20220412111434.96498-1-songmuchun@bytedance.com>
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
index 74430f88853d..f6eab03397d3 100644
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
@@ -1272,9 +1294,7 @@ bool mhp_supports_memmap_on_memory(unsigned long size)
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
@@ -2081,7 +2101,7 @@ static int __ref try_remove_memory(u64 start, u64 size)
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

