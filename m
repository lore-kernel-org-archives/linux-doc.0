Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8C26CC4361B
	for <linux-doc@archiver.kernel.org>; Thu, 17 Dec 2020 12:17:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 38A562395A
	for <linux-doc@archiver.kernel.org>; Thu, 17 Dec 2020 12:17:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728335AbgLQMRW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 17 Dec 2020 07:17:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43956 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728324AbgLQMRU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 17 Dec 2020 07:17:20 -0500
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7CE4C0611CD
        for <linux-doc@vger.kernel.org>; Thu, 17 Dec 2020 04:16:39 -0800 (PST)
Received: by mail-pj1-x1030.google.com with SMTP id lb18so3543357pjb.5
        for <linux-doc@vger.kernel.org>; Thu, 17 Dec 2020 04:16:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=LKwguLzjeWBmYGwSMmLpi6yU5zJ+fIhPLHmeqwyavEM=;
        b=Fhe/5iybq/cXRHMa8Tq6OxFJ2n/BfLTlrw2UIZZzOI8DIDjo1QDiMWY+POmZuAxChy
         YmQyJgurSTMtKMJT6QPINmKWkD5/AuZ9ztPw37BEky1ERZdjqKMkx6MIRq3L6E5R1wHS
         rxS7y2lj0bkDXvgjk++n7TRF8N4s9xjvdYmiJqL+VS312a/QdCH4M58DLhGqoO0W6fTS
         W8qMzIzBvZSlvlPCp7wkp9swUMZjPV0JhFaaqaGxr6RQ5/QVbullS0LO1V7rUTlTRgTI
         fp95zoFos8LW4Qq6qRQXLMnM7TOkLZm3pI1/y7iK6QuXVdr1ijMfPpyIb9TZr/bWqRMX
         Oxuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=LKwguLzjeWBmYGwSMmLpi6yU5zJ+fIhPLHmeqwyavEM=;
        b=MypivzCBDqlAj4YwubbRD7kCT4V6OVD98OPRBY3c3xl/+4NIemh4uK/qM32abO6/Um
         wPpJB89rYrxVON/GtVKl4Dk1AWQJGIU7CRESVCXoe+jcwfePg3/6M484S5QpoO/0C+A2
         aIw0Q0VU7XP8CySAGmrm3X0MLME93NiJMsAF7Y1YB5RGwKAlV+Zv3NuR5k37vOvBZeiH
         AZZC5+JptNcV81OoQPlwT8ipYGYyYhKkCqtLTb1IsIOSrF/YN0pTsBqbOsWwAaaQe7/E
         O8Un3wNGa41Wh0NDhvM0LH4nrXRmfJdAm/8Kqla3qrQA5E48eU2jC8qD+cjKKM+jYDtO
         LLpA==
X-Gm-Message-State: AOAM533Fmt3w3ATDdW7Ige0LiT77Yx7rRjuARTwUvFOacHGredm3SWQE
        YC3leOIg7AEWV5Lt6nasP27zlw==
X-Google-Smtp-Source: ABdhPJwzxvaOOteOBZXRp2OqanCQPqB1Mp6wmaeBu2IrG4A+vMMCtCLNURz7rCm647vegcvQhm4q2A==
X-Received: by 2002:a17:90a:67ce:: with SMTP id g14mr7860805pjm.33.1608207399401;
        Thu, 17 Dec 2020 04:16:39 -0800 (PST)
Received: from localhost.localdomain ([139.177.225.237])
        by smtp.gmail.com with ESMTPSA id n15sm2775691pgl.31.2020.12.17.04.16.27
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 17 Dec 2020 04:16:38 -0800 (PST)
From:   Muchun Song <songmuchun@bytedance.com>
To:     corbet@lwn.net, mike.kravetz@oracle.com, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
        dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
        viro@zeniv.linux.org.uk, akpm@linux-foundation.org,
        paulmck@kernel.org, mchehab+huawei@kernel.org,
        pawan.kumar.gupta@linux.intel.com, rdunlap@infradead.org,
        oneukum@suse.com, anshuman.khandual@arm.com, jroedel@suse.de,
        almasrymina@google.com, rientjes@google.com, willy@infradead.org,
        osalvador@suse.de, mhocko@suse.com, song.bao.hua@hisilicon.com,
        david@redhat.com, naoya.horiguchi@nec.com
Cc:     duanxiongchun@bytedance.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-fsdevel@vger.kernel.org,
        Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v10 06/11] mm/hugetlb: Set the PageHWPoison to the raw error page
Date:   Thu, 17 Dec 2020 20:12:58 +0800
Message-Id: <20201217121303.13386-7-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20201217121303.13386-1-songmuchun@bytedance.com>
References: <20201217121303.13386-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Because we reuse the first tail vmemmap page frame and remap it
with read-only, we cannot set the PageHWPosion on a tail page.
So we can use the head[4].private to record the real error page
index and set the raw error page PageHWPoison later.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Oscar Salvador <osalvador@suse.de>
---
 mm/hugetlb.c | 48 ++++++++++++++++++++++++++++++++++++++++--------
 1 file changed, 40 insertions(+), 8 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 329f473b929e..f15aa9b19b6e 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -1347,6 +1347,43 @@ static inline void __update_and_free_page(struct hstate *h, struct page *page)
 		schedule_work(&hpage_update_work);
 }
 
+static inline void hwpoison_subpage_deliver(struct hstate *h, struct page *head)
+{
+	struct page *page;
+
+	if (!PageHWPoison(head) || !free_vmemmap_pages_per_hpage(h))
+		return;
+
+	page = head + page_private(head + 4);
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
+static inline void hwpoison_subpage_set(struct hstate *h, struct page *head,
+					struct page *page)
+{
+	if (!PageHWPoison(head))
+		return;
+
+	if (free_vmemmap_pages_per_hpage(h)) {
+		set_page_private(head + 4, page - head);
+	} else if (page != head) {
+		/*
+		 * Move PageHWPoison flag from head page to the raw error page,
+		 * which makes any subpages rather than the error page reusable.
+		 */
+		SetPageHWPoison(page);
+		ClearPageHWPoison(head);
+	}
+}
+
 static void update_and_free_page(struct hstate *h, struct page *page)
 {
 	if (hstate_is_gigantic(h) && !gigantic_page_runtime_supported())
@@ -1366,6 +1403,7 @@ static void __free_hugepage(struct hstate *h, struct page *page)
 	int i;
 
 	alloc_huge_page_vmemmap(h, page);
+	hwpoison_subpage_deliver(h, page);
 
 	for (i = 0; i < pages_per_huge_page(h); i++) {
 		page[i].flags &= ~(1 << PG_locked | 1 << PG_error |
@@ -1843,14 +1881,8 @@ int dissolve_free_huge_page(struct page *page)
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
+		hwpoison_subpage_set(h, head, page);
 		list_del(&head->lru);
 		h->free_huge_pages--;
 		h->free_huge_pages_node[nid]--;
-- 
2.11.0

