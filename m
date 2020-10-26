Return-Path: <SRS0=Bwbi=EB=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5332AC2D0A3
	for <linux-doc@archiver.kernel.org>; Mon, 26 Oct 2020 14:54:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F225C2463C
	for <linux-doc@archiver.kernel.org>; Mon, 26 Oct 2020 14:54:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.b="1XUbgX6F"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1782288AbgJZOy2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 26 Oct 2020 10:54:28 -0400
Received: from mail-pg1-f194.google.com ([209.85.215.194]:42760 "EHLO
        mail-pg1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1782289AbgJZOy2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Oct 2020 10:54:28 -0400
Received: by mail-pg1-f194.google.com with SMTP id s22so6192349pga.9
        for <linux-doc@vger.kernel.org>; Mon, 26 Oct 2020 07:54:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=EcJtKWN8O9Qodyyp13/1PkKx/cUbDB95Z/x259AJSBY=;
        b=1XUbgX6FaLFoZU9pI23pS8o0DXUp9yNPArHW3McFT9vzwsmyVy3VL5DSA5BQr5PXZC
         SH1tkTSrwA18hKOIXTamspmxj/sSHIqZaB9weP8mImesc0/JLZCcDkRBHVWZM2q6qUI6
         XvEf1fqxB4298oGy3OeVf6URDdEDexEwtqrvW9ejyUmmQlH9lc9g0wGELvcmZES97qLz
         NRXfV9xH3UWl9feO5kuPAplRtr+0yGBeLnCIMA6Y19dbhm+DqD1+gq3Ej8hLwSXOy0lv
         SVuFYrmUP9+AOig7GImjG/LUzRccGtxnuzPpdIdopxj8MGUXCQC1eC6gIlM+Nrl88uc1
         u5xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=EcJtKWN8O9Qodyyp13/1PkKx/cUbDB95Z/x259AJSBY=;
        b=nCQUC0iydlD+g5muOFHZdPFnCG00gQNrJyrIUMgxOGF/j93f8468d1rdlTeOuGtqFZ
         lHmWuBQe5AaUrVCknrKpCvDzGA2b+uNO5sGo1CafktxEl4ah8Y2XYzs72dE93pQqwVbX
         ylfUJEyRVoa6l8GRrM0qlq440lVKBIKJcAEcFzB8YQMZmX+oT+LgWuICTroWQn5GAFxK
         cVXEQXbvn9NInjcFC8kqh09R1fITvkE+sQaJCsaM74rRHY5XaXd9chGEkv8zgcFKq8sn
         LEtjQAnzrtTGqI/OjVQXsoNpj4C0tO/JKgBeyRd+6kOCAb/IMN7Sq5qmDALV84h6g50p
         t6FQ==
X-Gm-Message-State: AOAM530YlSXYQpQMW/WXwgcYJYQg1C4dnQhKLz4cCyjpkHiBcoFGruN5
        Orw+BD90gHY4lQxpq2g44kqihA==
X-Google-Smtp-Source: ABdhPJx37UPgiI/VapjlHMmbDWY5Gek8UN494n0cx2H6I0fWbAXFRnr7QVt+RJebYAaHfgT+SjyS5A==
X-Received: by 2002:a63:2406:: with SMTP id k6mr13751141pgk.366.1603724067420;
        Mon, 26 Oct 2020 07:54:27 -0700 (PDT)
Received: from localhost.localdomain ([103.136.220.89])
        by smtp.gmail.com with ESMTPSA id x123sm12042726pfb.212.2020.10.26.07.54.18
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 26 Oct 2020 07:54:26 -0700 (PDT)
From:   Muchun Song <songmuchun@bytedance.com>
To:     corbet@lwn.net, mike.kravetz@oracle.com, tglx@linutronix.de,
        mingo@redhat.com, bp@alien8.de, x86@kernel.org, hpa@zytor.com,
        dave.hansen@linux.intel.com, luto@kernel.org, peterz@infradead.org,
        viro@zeniv.linux.org.uk, akpm@linux-foundation.org,
        paulmck@kernel.org, mchehab+huawei@kernel.org,
        pawan.kumar.gupta@linux.intel.com, rdunlap@infradead.org,
        oneukum@suse.com, anshuman.khandual@arm.com, jroedel@suse.de,
        almasrymina@google.com, rientjes@google.com, willy@infradead.org
Cc:     duanxiongchun@bytedance.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        linux-fsdevel@vger.kernel.org,
        Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v2 08/19] mm/hugetlb: Defer freeing of hugetlb pages
Date:   Mon, 26 Oct 2020 22:51:03 +0800
Message-Id: <20201026145114.59424-9-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20201026145114.59424-1-songmuchun@bytedance.com>
References: <20201026145114.59424-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

In the subsequent patch, we will allocate the vmemmap pages when free
huge pages. But update_and_free_page() is be called from a non-task
context(and hold hugetlb_lock), we can defer the actual freeing in
a workqueue to prevent use GFP_ATOMIC to allocate the vmemmap pages.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/hugetlb.c | 94 +++++++++++++++++++++++++++++++++++++++++++++++-----
 1 file changed, 85 insertions(+), 9 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index aa012d603e06..a5500c79e2df 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -1292,6 +1292,8 @@ static inline void destroy_compound_gigantic_page(struct page *page,
 						unsigned int order) { }
 #endif
 
+static void __free_hugepage(struct hstate *h, struct page *page);
+
 #ifdef CONFIG_HUGETLB_PAGE_FREE_VMEMMAP
 #include <linux/bootmem_info.h>
 
@@ -1601,6 +1603,64 @@ static void free_huge_page_vmemmap(struct hstate *h, struct page *head)
 
 	free_vmemmap_page_list(&free_pages);
 }
+
+/*
+ * As update_and_free_page() is be called from a non-task context(and hold
+ * hugetlb_lock), we can defer the actual freeing in a workqueue to prevent
+ * use GFP_ATOMIC to allocate a lot of vmemmap pages.
+ *
+ * update_hpage_vmemmap_workfn() locklessly retrieves the linked list of
+ * pages to be freed and frees them one-by-one. As the page->mapping pointer
+ * is going to be cleared in update_hpage_vmemmap_workfn() anyway, it is
+ * reused as the llist_node structure of a lockless linked list of huge
+ * pages to be freed.
+ */
+static LLIST_HEAD(hpage_update_freelist);
+
+static void update_hpage_vmemmap_workfn(struct work_struct *work)
+{
+	struct llist_node *node;
+	struct page *page;
+
+	node = llist_del_all(&hpage_update_freelist);
+
+	while (node) {
+		page = container_of((struct address_space **)node,
+				     struct page, mapping);
+		node = node->next;
+		page->mapping = NULL;
+		__free_hugepage(page_hstate(page), page);
+
+		cond_resched();
+	}
+}
+static DECLARE_WORK(hpage_update_work, update_hpage_vmemmap_workfn);
+
+static inline void __update_and_free_page(struct hstate *h, struct page *page)
+{
+	/* No need to allocate vmemmap pages */
+	if (!nr_free_vmemmap(h)) {
+		__free_hugepage(h, page);
+		return;
+	}
+
+	/*
+	 * Defer freeing to avoid using GFP_ATOMIC to allocate vmemmap
+	 * pages.
+	 *
+	 * Only call schedule_work() if hpage_update_freelist is previously
+	 * empty. Otherwise, schedule_work() had been called but the workfn
+	 * hasn't retrieved the list yet.
+	 */
+	if (llist_add((struct llist_node *)&page->mapping,
+		      &hpage_update_freelist))
+		schedule_work(&hpage_update_work);
+}
+
+static inline void free_gigantic_page_comm(struct hstate *h, struct page *page)
+{
+	free_gigantic_page(page, huge_page_order(h));
+}
 #else
 static inline void hugetlb_vmemmap_init(struct hstate *h)
 {
@@ -1618,17 +1678,39 @@ static inline void vmemmap_pgtable_free(struct hstate *h, struct page *page)
 static inline void free_huge_page_vmemmap(struct hstate *h, struct page *head)
 {
 }
+
+static inline void __update_and_free_page(struct hstate *h, struct page *page)
+{
+	__free_hugepage(h, page);
+}
+
+static inline void free_gigantic_page_comm(struct hstate *h, struct page *page)
+{
+	/*
+	 * Temporarily drop the hugetlb_lock, because
+	 * we might block in free_gigantic_page().
+	 */
+	spin_unlock(&hugetlb_lock);
+	free_gigantic_page(page, huge_page_order(h));
+	spin_lock(&hugetlb_lock);
+}
 #endif
 
 static void update_and_free_page(struct hstate *h, struct page *page)
 {
-	int i;
-
 	if (hstate_is_gigantic(h) && !gigantic_page_runtime_supported())
 		return;
 
 	h->nr_huge_pages--;
 	h->nr_huge_pages_node[page_to_nid(page)]--;
+
+	__update_and_free_page(h, page);
+}
+
+static void __free_hugepage(struct hstate *h, struct page *page)
+{
+	int i;
+
 	for (i = 0; i < pages_per_huge_page(h); i++) {
 		page[i].flags &= ~(1 << PG_locked | 1 << PG_error |
 				1 << PG_referenced | 1 << PG_dirty |
@@ -1640,14 +1722,8 @@ static void update_and_free_page(struct hstate *h, struct page *page)
 	set_compound_page_dtor(page, NULL_COMPOUND_DTOR);
 	set_page_refcounted(page);
 	if (hstate_is_gigantic(h)) {
-		/*
-		 * Temporarily drop the hugetlb_lock, because
-		 * we might block in free_gigantic_page().
-		 */
-		spin_unlock(&hugetlb_lock);
 		destroy_compound_gigantic_page(page, huge_page_order(h));
-		free_gigantic_page(page, huge_page_order(h));
-		spin_lock(&hugetlb_lock);
+		free_gigantic_page_comm(h, page);
 	} else {
 		__free_pages(page, huge_page_order(h));
 	}
-- 
2.20.1

