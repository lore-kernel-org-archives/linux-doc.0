Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D534ECAAA1
	for <linux-doc@archiver.kernel.org>; Sun, 11 Sep 2022 09:59:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229981AbiIKJ7l (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 11 Sep 2022 05:59:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57418 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229976AbiIKJ7i (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 11 Sep 2022 05:59:38 -0400
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5D85810F6
        for <linux-doc@vger.kernel.org>; Sun, 11 Sep 2022 02:59:31 -0700 (PDT)
Received: by mail-qk1-x72f.google.com with SMTP id d17so3448795qko.13
        for <linux-doc@vger.kernel.org>; Sun, 11 Sep 2022 02:59:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=soleen.com; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date;
        bh=IQgFAlcZ+zBw786vdsFczK8VrNHApPya6ZC6RPMkUdg=;
        b=B7B7pHbZ63+sPWwS2bD6YT1SStvX81UMer7JZxmb2Y5zl//fOZKSJe6QQrlxj4unjc
         WDxlNFc81O6KKYWX+3kHXoCbwgrnTNTHrGPYF/Gy9N2yadEqTjxSGmHf6kXGCKYQSWsf
         i4szN97Ry6b/Sp93I9coUyReS67tuLpesPv72OwqzThS4Z7UjkNZaqZ+lGko554zcfcr
         jMbMa0KbUB9TSqD9EkFodoHDAkeUypmhY4mRkP+TAvo28yxDtecBCwbKDDLMp/eo7EFz
         g36jyaTCaEVtCX8w4/C+5f1Y+v4pabrpWeWxLiP4KAvAF6WYqDwwQIXjtUOrqRHZQlRZ
         r4RA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date;
        bh=IQgFAlcZ+zBw786vdsFczK8VrNHApPya6ZC6RPMkUdg=;
        b=vwASCfaCZ+7CQRoEhn2PqW86JllU2vSIKalP52wd6EfEGJG/fpIcHsMWxvmg/ujAvJ
         jMOfP8sLr4XeohRXZxJDul+Kyjq9QG6BrSTwEy3izNoGxdjFSUI6D9UdrNMnefcT978q
         LWUcxL5QFGm1SxOx6kMCkSKlnqjsptbexj/zEAxeAYXgPeSD9eA65nhJWVAW+a2Aetij
         8wqwndNBH2MkYRS4otUQfvoGFN7UM7tIi95QldIgubzKvGQanVmRLl+fzkNrBAziwop9
         5ZTKWt3pByvpQIU9ABC4a33G9diPcRk3LATKkKPWE1LGJ4bLmzXMsX3420OAN8PnvBgA
         UurA==
X-Gm-Message-State: ACgBeo2t68tuq4emV7u3Y2O6j45LQuovhtOpeBp1go4wQdyDgbl+REtP
        TfWV3jN8CgRgl/v885t52M7DVA==
X-Google-Smtp-Source: AA6agR5DcmR8o9JAtmJ/2eIiSKRUYqewIiL/dNKxjys5qnEA0ST4IsGWy6xsrwjMK/lKCFbJNdD3zg==
X-Received: by 2002:a05:620a:278d:b0:6bb:1435:c0bd with SMTP id g13-20020a05620a278d00b006bb1435c0bdmr15648933qkp.291.1662890370397;
        Sun, 11 Sep 2022 02:59:30 -0700 (PDT)
Received: from soleen.c.googlers.com.com (240.157.150.34.bc.googleusercontent.com. [34.150.157.240])
        by smtp.gmail.com with ESMTPSA id y29-20020a37f61d000000b006cbd60c14c9sm4625233qkj.35.2022.09.11.02.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 11 Sep 2022 02:59:29 -0700 (PDT)
From:   Pasha Tatashin <pasha.tatashin@soleen.com>
To:     pasha.tatashin@soleen.com, akpm@linux-foundation.org,
        corbet@lwn.net, linux-mm@kvack.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, rick.p.edgecombe@intel.com
Subject: [PATCH 2/3] mm/page_table_check: Do WARN_ON instead of BUG_ON by default
Date:   Sun, 11 Sep 2022 09:59:22 +0000
Message-Id: <20220911095923.3614387-3-pasha.tatashin@soleen.com>
X-Mailer: git-send-email 2.37.2.789.g6183377224-goog
In-Reply-To: <20220911095923.3614387-1-pasha.tatashin@soleen.com>
References: <20220911095923.3614387-1-pasha.tatashin@soleen.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Currently, page_table_check when detects errors panics kernel. Instead,
print a warning, and panic only when specifically requested via kernel
parameter:

	page_table_check=panic

Signed-off-by: Pasha Tatashin <pasha.tatashin@soleen.com>
---
 mm/page_table_check.c | 53 +++++++++++++++++++++++++++++++------------
 1 file changed, 39 insertions(+), 14 deletions(-)

diff --git a/mm/page_table_check.c b/mm/page_table_check.c
index 665ece0d55d4..881f19d0714c 100644
--- a/mm/page_table_check.c
+++ b/mm/page_table_check.c
@@ -17,13 +17,37 @@ struct page_table_check {
 
 static bool __page_table_check_enabled __initdata =
 				IS_ENABLED(CONFIG_PAGE_TABLE_CHECK_ENFORCED);
+static bool __page_table_check_panic;
 
 DEFINE_STATIC_KEY_TRUE(page_table_check_disabled);
 EXPORT_SYMBOL(page_table_check_disabled);
 
+#define PAGE_TABLE_CHECK_BUG(v)							\
+	do {									\
+		bool __bug = !!(v);						\
+										\
+		if (__page_table_check_panic)					\
+			BUG_ON(__bug);						\
+		else if (WARN_ON_ONCE(__bug))					\
+			static_branch_enable(&page_table_check_disabled);	\
+	} while (false)
+
 static int __init early_page_table_check_param(char *buf)
 {
-	return strtobool(buf, &__page_table_check_enabled);
+	int rc = strtobool(buf, &__page_table_check_enabled);
+
+	if (rc) {
+		if (!strcmp(buf, "panic")) {
+			__page_table_check_enabled = true;
+			__page_table_check_panic = true;
+			rc = 0;
+		}
+	}
+
+	if (rc)
+		pr_warn("Invalid option string: '%s'\n", buf);
+
+	return rc;
 }
 
 early_param("page_table_check", early_page_table_check_param);
@@ -48,7 +72,8 @@ struct page_ext_operations page_table_check_ops = {
 
 static struct page_table_check *get_page_table_check(struct page_ext *page_ext)
 {
-	BUG_ON(!page_ext);
+	PAGE_TABLE_CHECK_BUG(!page_ext);
+
 	return (void *)(page_ext) + page_table_check_ops.offset;
 }
 
@@ -75,11 +100,11 @@ static void page_table_check_clear(struct mm_struct *mm, unsigned long addr,
 		struct page_table_check *ptc = get_page_table_check(page_ext);
 
 		if (anon) {
-			BUG_ON(atomic_read(&ptc->file_map_count));
-			BUG_ON(atomic_dec_return(&ptc->anon_map_count) < 0);
+			PAGE_TABLE_CHECK_BUG(atomic_read(&ptc->file_map_count));
+			PAGE_TABLE_CHECK_BUG(atomic_dec_return(&ptc->anon_map_count) < 0);
 		} else {
-			BUG_ON(atomic_read(&ptc->anon_map_count));
-			BUG_ON(atomic_dec_return(&ptc->file_map_count) < 0);
+			PAGE_TABLE_CHECK_BUG(atomic_read(&ptc->anon_map_count));
+			PAGE_TABLE_CHECK_BUG(atomic_dec_return(&ptc->file_map_count) < 0);
 		}
 		page_ext = page_ext_next(page_ext);
 	}
@@ -102,7 +127,7 @@ static void page_table_check_set(struct mm_struct *mm, unsigned long addr,
 	if (!pfn_valid(pfn))
 		return;
 
-	BUG_ON(is_zero_pfn(pfn) && rw);
+	PAGE_TABLE_CHECK_BUG(!is_zero_pfn(pfn) && rw);
 
 	page = pfn_to_page(pfn);
 	page_ext = lookup_page_ext(page);
@@ -112,11 +137,11 @@ static void page_table_check_set(struct mm_struct *mm, unsigned long addr,
 		struct page_table_check *ptc = get_page_table_check(page_ext);
 
 		if (anon) {
-			BUG_ON(atomic_read(&ptc->file_map_count));
-			BUG_ON(atomic_inc_return(&ptc->anon_map_count) > 1 && rw);
+			PAGE_TABLE_CHECK_BUG(atomic_read(&ptc->file_map_count));
+			PAGE_TABLE_CHECK_BUG(atomic_inc_return(&ptc->anon_map_count) > 1 && rw);
 		} else {
-			BUG_ON(atomic_read(&ptc->anon_map_count));
-			BUG_ON(atomic_inc_return(&ptc->file_map_count) < 0);
+			PAGE_TABLE_CHECK_BUG(atomic_read(&ptc->anon_map_count));
+			PAGE_TABLE_CHECK_BUG(atomic_inc_return(&ptc->file_map_count) < 0);
 		}
 		page_ext = page_ext_next(page_ext);
 	}
@@ -131,12 +156,12 @@ void __page_table_check_zero(struct page *page, unsigned int order)
 	struct page_ext *page_ext = lookup_page_ext(page);
 	unsigned long i;
 
-	BUG_ON(!page_ext);
+	PAGE_TABLE_CHECK_BUG(!page_ext);
 	for (i = 0; i < (1ul << order); i++) {
 		struct page_table_check *ptc = get_page_table_check(page_ext);
 
-		BUG_ON(atomic_read(&ptc->anon_map_count));
-		BUG_ON(atomic_read(&ptc->file_map_count));
+		PAGE_TABLE_CHECK_BUG(atomic_read(&ptc->anon_map_count));
+		PAGE_TABLE_CHECK_BUG(atomic_read(&ptc->file_map_count));
 		page_ext = page_ext_next(page_ext);
 	}
 }
-- 
2.37.2.789.g6183377224-goog

