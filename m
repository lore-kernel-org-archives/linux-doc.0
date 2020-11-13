Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1614FC56202
	for <linux-doc@archiver.kernel.org>; Fri, 13 Nov 2020 11:06:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A6E2E20B80
	for <linux-doc@archiver.kernel.org>; Fri, 13 Nov 2020 11:06:39 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.b="vYF40kLS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726592AbgKMLGg (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 13 Nov 2020 06:06:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54044 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726472AbgKMLEx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 13 Nov 2020 06:04:53 -0500
Received: from mail-pg1-x543.google.com (mail-pg1-x543.google.com [IPv6:2607:f8b0:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32E00C0617A7
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2020 03:03:46 -0800 (PST)
Received: by mail-pg1-x543.google.com with SMTP id f38so6831646pgm.2
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2020 03:03:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=QzolJXKJFt3Cv9lk0AvV6UgqgHDueM2wckEIHiP70o4=;
        b=vYF40kLSPTori9kiUCaA8h+WJRxn/OJj5FR3U6TfhNVIRJ7HIWbWL5bz2jmSwgCAh7
         QLXUgeaue7x6mna7QPdQSqYCZgX3VfQZE5fOrBaMuupSjUfiVrpq42S5Ww5vJb3jz+0K
         KZraHE4s3VI/MVTe/GbH/NRYf3RnEK6aJPK5zGbtRQ5cIlyFZegnpzJjP3YQ3cQEpZHW
         QFw9ZSI+hH37JpxeFP8Zu9aueUjInncq/8gD8aA/GFxdKXDV91nT9FT9q9R0s167Qb/s
         01bp9m/k992a3+NE/2zqSJ5xkx6SDwejark0dKPO0/KTtafxi3MGqRPOfSOZA8Uusl04
         Em2Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=QzolJXKJFt3Cv9lk0AvV6UgqgHDueM2wckEIHiP70o4=;
        b=Yv+jMZH9XioTD7oG9SZBpndepEaoN3bbNYjMljjpF3KJ5L5TdztMgfxVXyKPIpEcn0
         mCTl4P0BK+kjoDETaezfStnoA7Fb/vG6ZKIjaRgJOiGa5pYiV/kB28OS06o0BaS3LROL
         CM3Acv2lwMf1ep0mgLIGw2KySA71IOJrpKZO34JdII7UB327s1bIJlxZA2AY57G1hKse
         vBpEdH3sJbE/Swy9Zg7kUWLBDHPd0lYt4F3SFZFwI7qxxLxG/2pCMFjYYzbEip3ZgZ8Q
         +uF1olYJ/rrATrvAfy5NZVj9QFrpn67H+SRB+xLdi7FVziYwlM/8PXwzQi1WRgqf4UuK
         mfNw==
X-Gm-Message-State: AOAM533gmvZAFKFwkbY3JbI9lSUvhxC9uUk16mTOwFcGmm86AoJfExYO
        tycTRgXBsaUpnrypy4AtOYevkw==
X-Google-Smtp-Source: ABdhPJwSxrC8AebEKZmKNBIl86jC4CYLWk9JpK9nMJhulmTMM7fshqtrmP4/n4vXa34e85lcpIUKTQ==
X-Received: by 2002:a17:90a:a58e:: with SMTP id b14mr2244140pjq.203.1605265425784;
        Fri, 13 Nov 2020 03:03:45 -0800 (PST)
Received: from localhost.localdomain ([61.120.150.78])
        by smtp.gmail.com with ESMTPSA id f1sm8909959pfc.56.2020.11.13.03.03.35
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 13 Nov 2020 03:03:45 -0800 (PST)
From:   Muchun Song <songmuchun@bytedance.com>
To:     corbet@lwn.net, mike.kravetz@oracle.com, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
        dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
        viro@zeniv.linux.org.uk, akpm@linux-foundation.org,
        paulmck@kernel.org, mchehab+huawei@kernel.org,
        pawan.kumar.gupta@linux.intel.com, rdunlap@infradead.org,
        oneukum@suse.com, anshuman.khandual@arm.com, jroedel@suse.de,
        almasrymina@google.com, rientjes@google.com, willy@infradead.org,
        osalvador@suse.de, mhocko@suse.com
Cc:     duanxiongchun@bytedance.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-fsdevel@vger.kernel.org,
        Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v4 15/21] mm/hugetlb: Set the PageHWPoison to the raw error page
Date:   Fri, 13 Nov 2020 18:59:46 +0800
Message-Id: <20201113105952.11638-16-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20201113105952.11638-1-songmuchun@bytedance.com>
References: <20201113105952.11638-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Because we reuse the first tail page, if we set PageHWPosion on a
tail page. It indicates that we may set PageHWPoison on a series
of pages. So we can use the head[4].mapping to record the real
error page index and set the raw error page PageHWPoison later.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/hugetlb.c         | 11 +++--------
 mm/hugetlb_vmemmap.h | 39 +++++++++++++++++++++++++++++++++++++++
 2 files changed, 42 insertions(+), 8 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 055604d07046..b853aacd5c16 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -1383,6 +1383,7 @@ static void __free_hugepage(struct hstate *h, struct page *page)
 	int i;
 
 	alloc_huge_page_vmemmap(h, page);
+	subpage_hwpoison_deliver(page);
 
 	for (i = 0; i < pages_per_huge_page(h); i++) {
 		page[i].flags &= ~(1 << PG_locked | 1 << PG_error |
@@ -1944,14 +1945,8 @@ int dissolve_free_huge_page(struct page *page)
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
index 79f330bb0714..b09fd658ce20 100644
--- a/mm/hugetlb_vmemmap.h
+++ b/mm/hugetlb_vmemmap.h
@@ -21,6 +21,29 @@ void __init gather_vmemmap_pgtable_init(struct huge_bootmem_page *m,
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
@@ -57,6 +80,22 @@ static inline void free_huge_page_vmemmap(struct hstate *h, struct page *head)
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

