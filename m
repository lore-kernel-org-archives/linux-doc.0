Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1A48C433EF
	for <linux-doc@archiver.kernel.org>; Fri, 18 Mar 2022 10:09:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234857AbiCRKKl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 18 Mar 2022 06:10:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49428 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234854AbiCRKKk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 Mar 2022 06:10:40 -0400
Received: from mail-pj1-x1033.google.com (mail-pj1-x1033.google.com [IPv6:2607:f8b0:4864:20::1033])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 703B51FAA1E
        for <linux-doc@vger.kernel.org>; Fri, 18 Mar 2022 03:09:20 -0700 (PDT)
Received: by mail-pj1-x1033.google.com with SMTP id mj15-20020a17090b368f00b001c637aa358eso10040125pjb.0
        for <linux-doc@vger.kernel.org>; Fri, 18 Mar 2022 03:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=WwEC4WbmrPNUQyCrBW01Ge/3AIxEgFtA8vMHcjbrgUI=;
        b=pFHhxarl1w/haQopvFTYGEKrEjTDEhvc8Y1ROTjzbsriOVSGD0TQodxuvP1n0E6JNC
         4JTGW8wGVt/u3qZ1fafuRXfUKMC8dbMNbHQ8FtNmDVtslx/osFnOLyluZYRPKeqd7WO+
         kvpsqJPYVkqB55mTsG9Yq5kqf8C1hiz/b7R/LOmdtescHgXs6yhEs6goe7fm3VvJf0e4
         OYqI0i+ACvgaq5PU/BoG6nz3FGrsEyCldcGViA+PAL+a/6gg1X06B4Ba4LeT5H21Gz0G
         MHe9kY0KO2xqSlMlgbddMN6fpgag/+X2DGKiKFxyIRJ3EjN7GbIH/M/+gsCUZf8+maC8
         9J7g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=WwEC4WbmrPNUQyCrBW01Ge/3AIxEgFtA8vMHcjbrgUI=;
        b=kw0rKyyrLpBtqttLQ3BACFMQh53413yXSpv8fEw6cQ/U3S/yV03DeZEb5ch4Az1nsr
         In3qq5Ltxzn8DWy05QZamZZebzAwsC8l0vzHaQlZ76GwGOgBi8yBjLou4K2E9Obq14yV
         UTF+qmb0Mmik0MEOf2wXd0w1FHV8RsDpbao0ZVowPopmr1qRWe50NyXQGvlcEbfR+CeP
         g58Lv7buMs5YfHJIbQA5LjiPhttThPSmxoDTvKfXTM1Kh97eorls8eXIuogejZ4TUH73
         QiRXCMo8zj3C743FAP8BI0VI5pNC6N6qOp6CRxW59tBmchmoPZ9uBZLau0t6IBxzZ4/j
         rNbA==
X-Gm-Message-State: AOAM532eh/sPXAWMW45B0Wm99E99gQ91EySea2W+1dd0kwvAcGPgaPgf
        30lvhAzAqlFPNoOCoGFfztx51A==
X-Google-Smtp-Source: ABdhPJwDnJVONODWzHybiJauSNnambY6vz8I3zJjMpEe1c+AtPn5LnIfdtAUWQvTdXzU3GQHegb/cA==
X-Received: by 2002:a17:902:e74b:b0:152:fef9:a56 with SMTP id p11-20020a170902e74b00b00152fef90a56mr9624097plf.58.1647598159884;
        Fri, 18 Mar 2022 03:09:19 -0700 (PDT)
Received: from FVFYT0MHHV2J.bytedance.net ([139.177.225.241])
        by smtp.gmail.com with ESMTPSA id j3-20020a056a00234300b004fa042e8216sm9541252pfj.2.2022.03.18.03.09.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Mar 2022 03:09:19 -0700 (PDT)
From:   Muchun Song <songmuchun@bytedance.com>
To:     corbet@lwn.net, mike.kravetz@oracle.com, akpm@linux-foundation.org,
        mcgrof@kernel.org, keescook@chromium.org, yzaikin@google.com,
        osalvador@suse.de, david@redhat.com
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, duanxiongchun@bytedance.com, smuchun@gmail.com,
        Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v4 2/4] mm: memory_hotplug: override memmap_on_memory when hugetlb_free_vmemmap=on
Date:   Fri, 18 Mar 2022 18:07:18 +0800
Message-Id: <20220318100720.14524-3-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.32.0 (Apple Git-132)
In-Reply-To: <20220318100720.14524-1-songmuchun@bytedance.com>
References: <20220318100720.14524-1-songmuchun@bytedance.com>
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
index 416b38ca8def..da594b382829 100644
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
@@ -1288,9 +1310,7 @@ bool mhp_supports_memmap_on_memory(unsigned long size)
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
@@ -2074,7 +2094,7 @@ static int __ref try_remove_memory(u64 start, u64 size)
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

