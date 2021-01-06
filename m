Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0771C432C3
	for <linux-doc@archiver.kernel.org>; Wed,  6 Jan 2021 14:22:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8E2E52312A
	for <linux-doc@archiver.kernel.org>; Wed,  6 Jan 2021 14:22:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726995AbhAFOWD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 6 Jan 2021 09:22:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55756 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726794AbhAFOWC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 6 Jan 2021 09:22:02 -0500
Received: from mail-pj1-x102a.google.com (mail-pj1-x102a.google.com [IPv6:2607:f8b0:4864:20::102a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8377BC061361
        for <linux-doc@vger.kernel.org>; Wed,  6 Jan 2021 06:20:57 -0800 (PST)
Received: by mail-pj1-x102a.google.com with SMTP id j13so1655864pjz.3
        for <linux-doc@vger.kernel.org>; Wed, 06 Jan 2021 06:20:57 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=9dJD9jIzWDoyhaAcVJQeaUo28aYYhfu54r+mE2CBxNg=;
        b=o383ghz8HXXGrRY9KqtLQYFhlyvvQT/xvfQy7A2Mg1jVAo8f97qxZteIL9PDoL0Bvq
         cVmGpCz9aE4xOKwPvVOxBjPusSsT8Kbm8eube8E0rH/Rc4It+g13zWxEn9wMh7LyNJa+
         LGFFYFRcixOYFkwMwmOyzHRp/5kAQsSUeDkJ98pEbz8HPdtoQsSstJX+ZjhuZRUEAGW2
         c7aCilIgOh6Qg1o/pCnjl19db9xUn3shxOQCCsFlaU5REkTHIBAjTtMWjbxPcbaE/Ug1
         C0ugndK5eB7z6f1srm0FDumoDEecZSgaGCmWptGHDlnOKpKrt0Jn603dtKSW+qfZbiOU
         F52w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=9dJD9jIzWDoyhaAcVJQeaUo28aYYhfu54r+mE2CBxNg=;
        b=j+xKUKn5JOLU2ytatVJvWpDVIKeRM/hYz1RcZyOuZJv1Pvz8u3XTG7HyOC9nPqQLkT
         Z9aIi/vhSRsVrseeF7URnhWYt3kyMVgXotZTah3t143F47oKcYlgv4AiCueSq+OJNh30
         zHVNTOjHE41+131jT3hZEszd6Y8h2I7ukSG1SZtv5ihgPYWZ5tEoKTSZlaSV2Gl/tewA
         t+QqVj53sutK7vWXifr9mW8KUoAHpqsin1uqUWUxu4UEpLj2f3n8EV7kwnQ4sQ5OD8h3
         TsZr2bHEQr5dA9llVgjWAHCCVZoTAI6SZwnpME43336vkzZrckUpa4PAgEk1YPirhukw
         69rA==
X-Gm-Message-State: AOAM531H3s9rbCY8bwv4jK3pforf2cXK4V9XCAMsRAarkzgktNqgRiyK
        xbx8bjB9Vf5N/TZy3OWPc8g2RQ==
X-Google-Smtp-Source: ABdhPJy2D4DUnh0jFoHdDgH9rkdTzNtaF+xPdJt0bOSH/kuanYvrbndIV2FtJQdLvDbOj8v02hoFyw==
X-Received: by 2002:a17:902:521:b029:dc:2836:ec17 with SMTP id 30-20020a1709020521b02900dc2836ec17mr4323835plf.47.1609942857016;
        Wed, 06 Jan 2021 06:20:57 -0800 (PST)
Received: from localhost.bytedance.net ([139.177.225.232])
        by smtp.gmail.com with ESMTPSA id a29sm2831730pfr.73.2021.01.06.06.20.45
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 06 Jan 2021 06:20:56 -0800 (PST)
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
Subject: [PATCH v12 05/13] mm/hugetlb: Defer freeing of HugeTLB pages
Date:   Wed,  6 Jan 2021 22:19:23 +0800
Message-Id: <20210106141931.73931-6-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20210106141931.73931-1-songmuchun@bytedance.com>
References: <20210106141931.73931-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

In the subsequent patch, we should allocate the vmemmap pages when
freeing HugeTLB pages. But update_and_free_page() is always called
with holding hugetlb_lock, so we cannot use GFP_KERNEL to allocate
vmemmap pages. However, we can defer the actual freeing in a kworker
to prevent from using GFP_ATOMIC to allocate the vmemmap pages.

The update_hpage_vmemmap_workfn() is where the call to allocate
vmemmmap pages will be inserted.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Reviewed-by: Mike Kravetz <mike.kravetz@oracle.com>
---
 mm/hugetlb.c         | 74 ++++++++++++++++++++++++++++++++++++++++++++++++++--
 mm/hugetlb_vmemmap.c | 12 ---------
 mm/hugetlb_vmemmap.h | 17 ++++++++++++
 3 files changed, 89 insertions(+), 14 deletions(-)

diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 140135fc8113..c165186ec2cf 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -1292,15 +1292,85 @@ static inline void destroy_compound_gigantic_page(struct page *page,
 						unsigned int order) { }
 #endif
 
-static void update_and_free_page(struct hstate *h, struct page *page)
+static void __free_hugepage(struct hstate *h, struct page *page);
+
+/*
+ * As update_and_free_page() is always called with holding hugetlb_lock, so we
+ * cannot use GFP_KERNEL to allocate vmemmap pages. However, we can defer the
+ * actual freeing in a workqueue to prevent from using GFP_ATOMIC to allocate
+ * the vmemmap pages.
+ *
+ * The update_hpage_vmemmap_workfn() is where the call to allocate vmemmmap
+ * pages will be inserted.
+ *
+ * update_hpage_vmemmap_workfn() locklessly retrieves the linked list of pages
+ * to be freed and frees them one-by-one. As the page->mapping pointer is going
+ * to be cleared in update_hpage_vmemmap_workfn() anyway, it is reused as the
+ * llist_node structure of a lockless linked list of huge pages to be freed.
+ */
+static LLIST_HEAD(hpage_update_freelist);
+
+static void update_hpage_vmemmap_workfn(struct work_struct *work)
 {
-	int i;
+	struct llist_node *node;
+
+	node = llist_del_all(&hpage_update_freelist);
+
+	while (node) {
+		struct page *page;
+		struct hstate *h;
+
+		page = container_of((struct address_space **)node,
+				     struct page, mapping);
+		node = node->next;
+		page->mapping = NULL;
+		h = page_hstate(page);
+
+		spin_lock(&hugetlb_lock);
+		__free_hugepage(h, page);
+		spin_unlock(&hugetlb_lock);
 
+		cond_resched();
+	}
+}
+static DECLARE_WORK(hpage_update_work, update_hpage_vmemmap_workfn);
+
+static inline void __update_and_free_page(struct hstate *h, struct page *page)
+{
+	/* No need to allocate vmemmap pages */
+	if (!free_vmemmap_pages_per_hpage(h)) {
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
+static void update_and_free_page(struct hstate *h, struct page *page)
+{
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
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 4ffa2a4ae2a8..19f1898aaede 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -178,18 +178,6 @@
 #define RESERVE_VMEMMAP_NR		2U
 #define RESERVE_VMEMMAP_SIZE		(RESERVE_VMEMMAP_NR << PAGE_SHIFT)
 
-/*
- * How many vmemmap pages associated with a HugeTLB page that can be freed
- * to the buddy allocator.
- *
- * Todo: Returns zero for now, which means the feature is disabled. We will
- * enable it once all the infrastructure is there.
- */
-static inline unsigned int free_vmemmap_pages_per_hpage(struct hstate *h)
-{
-	return 0;
-}
-
 static inline unsigned long free_vmemmap_pages_size_per_hpage(struct hstate *h)
 {
 	return (unsigned long)free_vmemmap_pages_per_hpage(h) << PAGE_SHIFT;
diff --git a/mm/hugetlb_vmemmap.h b/mm/hugetlb_vmemmap.h
index 6923f03534d5..01f8637adbe0 100644
--- a/mm/hugetlb_vmemmap.h
+++ b/mm/hugetlb_vmemmap.h
@@ -12,9 +12,26 @@
 
 #ifdef CONFIG_HUGETLB_PAGE_FREE_VMEMMAP
 void free_huge_page_vmemmap(struct hstate *h, struct page *head);
+
+/*
+ * How many vmemmap pages associated with a HugeTLB page that can be freed
+ * to the buddy allocator.
+ *
+ * Todo: Returns zero for now, which means the feature is disabled. We will
+ * enable it once all the infrastructure is there.
+ */
+static inline unsigned int free_vmemmap_pages_per_hpage(struct hstate *h)
+{
+	return 0;
+}
 #else
 static inline void free_huge_page_vmemmap(struct hstate *h, struct page *head)
 {
 }
+
+static inline unsigned int free_vmemmap_pages_per_hpage(struct hstate *h)
+{
+	return 0;
+}
 #endif /* CONFIG_HUGETLB_PAGE_FREE_VMEMMAP */
 #endif /* _LINUX_HUGETLB_VMEMMAP_H */
-- 
2.11.0

