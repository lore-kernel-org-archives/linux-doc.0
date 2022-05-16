Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBB2AC433EF
	for <linux-doc@archiver.kernel.org>; Mon, 16 May 2022 10:24:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234347AbiEPKYK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 16 May 2022 06:24:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38350 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242600AbiEPKXx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 16 May 2022 06:23:53 -0400
Received: from mail-pl1-x630.google.com (mail-pl1-x630.google.com [IPv6:2607:f8b0:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C6B50DF59
        for <linux-doc@vger.kernel.org>; Mon, 16 May 2022 03:23:32 -0700 (PDT)
Received: by mail-pl1-x630.google.com with SMTP id s14so13997033plk.8
        for <linux-doc@vger.kernel.org>; Mon, 16 May 2022 03:23:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=jSjHlEJZ1lWJ5sUgf+NErUi604xPZiJFf+96LoXPZRA=;
        b=tvaEqhT5/0VShTdmGcoV7QtkaEOFtFRpQgSee1AARQzV7qYhbtTSIUiemTABLiPqRJ
         wO0IWpVnGfUGXIuoRzl/oYax5/wlxFS7PIMUc9w28HhTQ9vupeD5RBq5b+SWjGq4BUQ+
         daFSBYXRBJyH7Mb0rqkhKeUBYrwF2/lSQtUUcPp9B5FpIXRdP+dp11fvmMhY3RQwUct8
         Qn6SF5MYrU6EgxrBpTj+oTe7c8e/pZXcdGtirgqcBmgBpO8pECK6KjYP7pzgUhQvU8BN
         XmKyNkvkbG2dH7BgTbrwpssZKSaxayfFF0JxUZ9QyiXXmkeT0M59bXNImnZ/bz6nZsY5
         ASBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=jSjHlEJZ1lWJ5sUgf+NErUi604xPZiJFf+96LoXPZRA=;
        b=7xK63wT/6gmwYy3oyRP2x60BTy9pAAKqPxVUIUg2eidi93egUuB4i4L2jv+SIHTjw3
         AKknLilmuiF1cd7c7Vm5xwn92dgLYIartFDCcWs1roj4HKHJLssVapi8K79vp4NBpYHw
         jQWn953AmeVgoOJIfdRvQMubCl74tXSiBdNvQuqM2NcPFNYjRzRjkGV9H1G2pQ1Cfgyu
         32xqB2Cfw3zO5FSC2shyYtYTIWaR9bLWgcLde8KBMhP5cwRpG7Sy3cWGSx1Gco8Fso86
         pw7UHQV3KZzPszzYtJCLBOULd+tyf0RvNZc4/HKMtcOkhlLPqyeNKai2BrHfiAfl6d95
         qE2A==
X-Gm-Message-State: AOAM531/mmMYfWY2b0qgsEc3dPDgjyIY2MVTraNM0DX8oHrX94EmRl/g
        oYy9oNsexEibSsznNIamvijQYDP7BvPoGA==
X-Google-Smtp-Source: ABdhPJz8RxTwBuh5VCxsEKPELii/OLyV7DdKmnwjxoTMtu2gqnnHrzqm70OoYqtS83/xrVBs05SXow==
X-Received: by 2002:a17:90b:1249:b0:1df:257a:539a with SMTP id gx9-20020a17090b124900b001df257a539amr9957427pjb.47.1652696612277;
        Mon, 16 May 2022 03:23:32 -0700 (PDT)
Received: from FVFYT0MHHV2J.bytedance.net ([139.177.225.234])
        by smtp.gmail.com with ESMTPSA id i9-20020aa79089000000b0050dc76281e4sm6472731pfa.190.2022.05.16.03.23.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 May 2022 03:23:32 -0700 (PDT)
From:   Muchun Song <songmuchun@bytedance.com>
To:     corbet@lwn.net, mike.kravetz@oracle.com, akpm@linux-foundation.org,
        mcgrof@kernel.org, keescook@chromium.org, yzaikin@google.com,
        osalvador@suse.de, david@redhat.com, masahiroy@kernel.org
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, duanxiongchun@bytedance.com, smuchun@gmail.com,
        Muchun Song <songmuchun@bytedance.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Anshuman Khandual <anshuman.khandual@arm.com>
Subject: [PATCH v12 5/7] mm: hugetlb_vmemmap: remove hugetlb_optimize_vmemmap_enabled()
Date:   Mon, 16 May 2022 18:22:09 +0800
Message-Id: <20220516102211.41557-6-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.32.1 (Apple Git-133)
In-Reply-To: <20220516102211.41557-1-songmuchun@bytedance.com>
References: <20220516102211.41557-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

There is only one user of hugetlb_optimize_vmemmap_enabled() outside of
hugetlb_vmemmap, that is flush_dcache_page() in arch/arm64/mm/flush.c.
However, it does not need to call hugetlb_optimize_vmemmap_enabled()
in flush_dcache_page() since HugeTLB pages are always fully mapped
and only head page will be set PG_dcache_clean meaning only head page
's flag may need to be cleared (see commit cf5a501d985b).  After this
change, there is no users of hugetlb_optimize_vmemmap_enabled() outside
of hugetlb_vmemmap. So remove hugetlb_optimize_vmemmap_enabled() to
simplify the code.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
---
 arch/arm64/mm/flush.c      | 13 +++----------
 include/linux/page-flags.h | 14 ++------------
 mm/hugetlb_vmemmap.c       |  3 ++-
 3 files changed, 7 insertions(+), 23 deletions(-)

diff --git a/arch/arm64/mm/flush.c b/arch/arm64/mm/flush.c
index fc4f710e9820..5f9379b3c8c8 100644
--- a/arch/arm64/mm/flush.c
+++ b/arch/arm64/mm/flush.c
@@ -76,17 +76,10 @@ EXPORT_SYMBOL_GPL(__sync_icache_dcache);
 void flush_dcache_page(struct page *page)
 {
 	/*
-	 * Only the head page's flags of HugeTLB can be cleared since the tail
-	 * vmemmap pages associated with each HugeTLB page are mapped with
-	 * read-only when CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP is enabled (more
-	 * details can refer to vmemmap_remap_pte()).  Although
-	 * __sync_icache_dcache() only set PG_dcache_clean flag on the head
-	 * page struct, there is more than one page struct with PG_dcache_clean
-	 * associated with the HugeTLB page since the head vmemmap page frame
-	 * is reused (more details can refer to the comments above
-	 * page_fixed_fake_head()).
+	 * HugeTLB pages are always fully mapped and only head page will be
+	 * set PG_dcache_clean (see comments in __sync_icache_dcache()).
 	 */
-	if (hugetlb_optimize_vmemmap_enabled() && PageHuge(page))
+	if (PageHuge(page))
 		page = compound_head(page);
 
 	if (test_bit(PG_dcache_clean, &page->flags))
diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index b70124b9c7c1..404f4ede17f5 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -203,12 +203,6 @@ enum pageflags {
 DECLARE_STATIC_KEY_MAYBE(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON,
 			 hugetlb_optimize_vmemmap_key);
 
-static __always_inline bool hugetlb_optimize_vmemmap_enabled(void)
-{
-	return static_branch_maybe(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON,
-				   &hugetlb_optimize_vmemmap_key);
-}
-
 /*
  * If the feature of optimizing vmemmap pages associated with each HugeTLB
  * page is enabled, the head vmemmap page frame is reused and all of the tail
@@ -227,7 +221,8 @@ static __always_inline bool hugetlb_optimize_vmemmap_enabled(void)
  */
 static __always_inline const struct page *page_fixed_fake_head(const struct page *page)
 {
-	if (!hugetlb_optimize_vmemmap_enabled())
+	if (!static_branch_maybe(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON,
+				 &hugetlb_optimize_vmemmap_key))
 		return page;
 
 	/*
@@ -255,11 +250,6 @@ static inline const struct page *page_fixed_fake_head(const struct page *page)
 {
 	return page;
 }
-
-static inline bool hugetlb_optimize_vmemmap_enabled(void)
-{
-	return false;
-}
 #endif
 
 static __always_inline int page_is_fake_head(struct page *page)
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 970c36b8935f..d1fea65fec98 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -124,7 +124,8 @@ void __init hugetlb_vmemmap_init(struct hstate *h)
 	BUILD_BUG_ON(__NR_USED_SUBPAGE >=
 		     RESERVE_VMEMMAP_SIZE / sizeof(struct page));
 
-	if (!hugetlb_optimize_vmemmap_enabled())
+	if (!static_branch_maybe(CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP_DEFAULT_ON,
+				 &hugetlb_optimize_vmemmap_key))
 		return;
 
 	if (!is_power_of_2(sizeof(struct page))) {
-- 
2.11.0

