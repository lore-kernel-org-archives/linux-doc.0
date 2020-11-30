Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 225C5C83012
	for <linux-doc@archiver.kernel.org>; Mon, 30 Nov 2020 15:21:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DCFA82087D
	for <linux-doc@archiver.kernel.org>; Mon, 30 Nov 2020 15:21:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.b="pwSZzac3"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728041AbgK3PVe (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 30 Nov 2020 10:21:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728034AbgK3PVe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 30 Nov 2020 10:21:34 -0500
Received: from mail-pg1-x544.google.com (mail-pg1-x544.google.com [IPv6:2607:f8b0:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AD85AC0613D2
        for <linux-doc@vger.kernel.org>; Mon, 30 Nov 2020 07:21:13 -0800 (PST)
Received: by mail-pg1-x544.google.com with SMTP id f17so10266197pge.6
        for <linux-doc@vger.kernel.org>; Mon, 30 Nov 2020 07:21:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=AROpevGsmraJS2E24AC4gycXj2TEwOrJX0mQgAFYrzY=;
        b=pwSZzac3IBcilPGXWUeBgyY+Fg7/95ymV3hblc/nKN3k8/VWi05Mm0dVLFWqOP6JEF
         frGeFrlddmHPh3u/8lHiQxLFlw2ZJY9GgTwc+Wm1eIsHZK4BjW5TPW6CyDCzJB0/Gl3x
         0H5/WdIuCGDS9AKNSEZP0O6Qk7kElZ4ABSRnuQdDvRo1kBkF8frslTucIdUGhMZzeM0q
         ip49yBijOT7TDl6o4rRvxt5F/MvC8oKg3UTT2dZ+wxT0RemzBFGtpGNp9dz7hZp4x9/j
         eXT1PQVQYY4E7pGGwGLLTl/kWkg4qEdf6gcFvSPU1WslDsyTtBlDsAV4lFha5LfanNzo
         Ws3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=AROpevGsmraJS2E24AC4gycXj2TEwOrJX0mQgAFYrzY=;
        b=DTgsoHBWFE+1dhUsJ/QGQNb13uF02kJvNgFQF3w3LCb/isr6WY+IweKbvxQHJOLzSJ
         fstcpBG8jotf1Lvkh0Bhd8J8C8l+NvgKq93QEp6wMLtP39UL/q5h9scPwOApWL1jQLnp
         nmG5OieuINpSBh2zSFAwTBbN6pjsajUhrn7XoZN3uKZziuevmpY0nyFpn7rav9k14Jl4
         aTRhu1Wcg/5mCkvgP7Mpw9ATbulPLv7Y9mlTG6eIenq72bAtGd5L0Z7VKsSagWNwI/Dc
         71fC+2RNOFZmtF1gdUL17HodHdYPOlYSOWOkUA1cMOdWtp82ZfN9stqxKK9lcbMM2ZDF
         XQaw==
X-Gm-Message-State: AOAM530Jy5JhwC9ki7LVMHxfMybZPKmR3CyH3V7Rqy6rMoTtSFP4Q+BW
        u9t1be4RJu2Oug66LTkAx8C5IQ==
X-Google-Smtp-Source: ABdhPJxH9kfbhIihzHvuiewQLiLNOB0k6p0Ye+4DjteIb8gr6m+sMIOCgzhj3sZMaB4KXtbfJ5506Q==
X-Received: by 2002:aa7:9606:0:b029:198:14c4:4f44 with SMTP id q6-20020aa796060000b029019814c44f44mr18740912pfg.80.1606749673191;
        Mon, 30 Nov 2020 07:21:13 -0800 (PST)
Received: from localhost.bytedance.net ([103.136.221.68])
        by smtp.gmail.com with ESMTPSA id q12sm16201660pgv.91.2020.11.30.07.21.03
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 30 Nov 2020 07:21:12 -0800 (PST)
From:   Muchun Song <songmuchun@bytedance.com>
To:     corbet@lwn.net, mike.kravetz@oracle.com, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
        dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
        viro@zeniv.linux.org.uk, akpm@linux-foundation.org,
        paulmck@kernel.org, mchehab+huawei@kernel.org,
        pawan.kumar.gupta@linux.intel.com, rdunlap@infradead.org,
        oneukum@suse.com, anshuman.khandual@arm.com, jroedel@suse.de,
        almasrymina@google.com, rientjes@google.com, willy@infradead.org,
        osalvador@suse.de, mhocko@suse.com, song.bao.hua@hisilicon.com
Cc:     duanxiongchun@bytedance.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-fsdevel@vger.kernel.org,
        Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v7 11/15] mm/hugetlb: Set the PageHWPoison to the raw error page
Date:   Mon, 30 Nov 2020 23:18:34 +0800
Message-Id: <20201130151838.11208-12-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20201130151838.11208-1-songmuchun@bytedance.com>
References: <20201130151838.11208-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Because we reuse the first tail vmemmap page frame and remap it
with read-only, we cannot set the PageHWPosion on a tail page.
So we can use the head[4].mapping to record the real error page
index and set the raw error page PageHWPoison later.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/hugetlb.c         | 11 +++--------
 mm/hugetlb_vmemmap.h | 39 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 42 insertions(+), 8 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index ebe35532d432..12cb46b8e901 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -1382,6 +1382,7 @@ static void __free_hugepage(struct hstate *h, struct page *page)
 	int i;
 
 	alloc_huge_page_vmemmap(h, page);
+	subpage_hwpoison_deliver(page);
 
 	for (i = 0; i < pages_per_huge_page(h); i++) {
 		page[i].flags &= ~(1 << PG_locked | 1 << PG_error |
@@ -1849,14 +1850,8 @@ int dissolve_free_huge_page(struct page *page)
 		int nid = page_to_nid(head);
 		if (h->free_huge_pages - h->resv_huge_pages == 0)
 			goto out;
-		/*
-		 * Move PageHWPoison flag from head page to the raw error page,
-		 * which makes any subpages rather than the error page reusable.
-		 */
-		if (PageHWPoison(head) && page != head) {
-			SetPageHWPoison(page);
-			ClearPageHWPoison(head);
-		}
+
+		set_subpage_hwpoison(head, page);
 		list_del(&head->lru);
 		h->free_huge_pages--;
 		h->free_huge_pages_node[nid]--;
diff --git a/mm/hugetlb_vmemmap.h b/mm/hugetlb_vmemmap.h
index 7887095488f4..4bb35d87ae10 100644
--- a/mm/hugetlb_vmemmap.h
+++ b/mm/hugetlb_vmemmap.h
@@ -15,6 +15,29 @@ void __init hugetlb_vmemmap_init(struct hstate *h);
 void alloc_huge_page_vmemmap(struct hstate *h, struct page *head);
 void free_huge_page_vmemmap(struct hstate *h, struct page *head);
 
+static inline void subpage_hwpoison_deliver(struct page *head)
+{
+	struct page *page = head;
+
+	if (PageHWPoison(head))
+		page = head + page_private(head + 4);
+
+	/*
+	 * Move PageHWPoison flag from head page to the raw error page,
+	 * which makes any subpages rather than the error page reusable.
+	 */
+	if (page != head) {
+		SetPageHWPoison(page);
+		ClearPageHWPoison(head);
+	}
+}
+
+static inline void set_subpage_hwpoison(struct page *head, struct page *page)
+{
+	if (PageHWPoison(head))
+		set_page_private(head + 4, page - head);
+}
+
 static inline unsigned int free_vmemmap_pages_per_hpage(struct hstate *h)
 {
 	return h->nr_free_vmemmap_pages;
@@ -32,6 +55,22 @@ static inline void free_huge_page_vmemmap(struct hstate *h, struct page *head)
 {
 }
 
+static inline void subpage_hwpoison_deliver(struct page *head)
+{
+}
+
+static inline void set_subpage_hwpoison(struct page *head, struct page *page)
+{
+	/*
+	 * Move PageHWPoison flag from head page to the raw error page,
+	 * which makes any subpages rather than the error page reusable.
+	 */
+	if (PageHWPoison(head) && page != head) {
+		SetPageHWPoison(page);
+		ClearPageHWPoison(head);
+	}
+}
+
 static inline unsigned int free_vmemmap_pages_per_hpage(struct hstate *h)
 {
 	return 0;
-- 
2.11.0

