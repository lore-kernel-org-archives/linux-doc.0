Return-Path: <SRS0=q8nj=EO=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 23358C388F9
	for <linux-doc@archiver.kernel.org>; Sun,  8 Nov 2020 14:12:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DC37D208B6
	for <linux-doc@archiver.kernel.org>; Sun,  8 Nov 2020 14:12:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.b="Rhp9WxDm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728660AbgKHOMf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 8 Nov 2020 09:12:35 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35168 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728651AbgKHOMc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 8 Nov 2020 09:12:32 -0500
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E1FF7C0613D3
        for <linux-doc@vger.kernel.org>; Sun,  8 Nov 2020 06:12:31 -0800 (PST)
Received: by mail-pf1-x444.google.com with SMTP id w14so2897722pfd.7
        for <linux-doc@vger.kernel.org>; Sun, 08 Nov 2020 06:12:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=YtIyQzAvHroZKptlekhFrmJwjKkMKzILzouKGzt2f6k=;
        b=Rhp9WxDmyv/RhEytkDFxoQkEq1V5pi1tKU3OVQVsW77wJdXH5f/2Z6/ZGtm1PIRL6g
         q0wr6tFpcF1PgghtqZMN/8uys3MOEYWcBedrFIk5Fa6gEX1+P6XZ6qLV6JxETXkYo3Qq
         TWKnTnb3ZweeJ1oCforZ2f3rKk++psVY2q7vMPdA0c7nQZXIKHxe69gvZL8EZUef6oyZ
         DaWBU71aB9pdgFB0v5RyRMOJ0C9eXQwPU44+gUhLBHeJ13wwcS+Wwxz8PGDMu+4OHHNB
         imdOAxrP5OBW2JuG8eZDRK+xBu4CPgNzAkUFT/se7MUH4lOUIbulFXpAi2IzdxrNUhOl
         wokA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=YtIyQzAvHroZKptlekhFrmJwjKkMKzILzouKGzt2f6k=;
        b=GKo14tMzAgDh7vvXPbvkTP3YIyIVljhU266f3gA5G4+1pQV/t1u6xyzrl5SOJVAqGK
         94UfPj3vQhIH3q7dezS9KoGFPbPu1NmXxSrAp6s2tR+BeaESOPRwh2dWALlOqv/FDgFc
         UMMWPBSdn8jyWJfVnRIu8pawrR965qAxyQYk1tPjcWfh2kVRrYFLZ4QTYCWwp92GYXdC
         QQGA9yIJnWtcfqgkrH+wGvV4QJKuepJuhBfgRIERwlMWw2+ME0jv/BjkDyWpEozLj+/D
         XfM7FV3rRFPEYrAk4IuZUHjtPG7Rweft+1qvolL0qIq3n+/Kx6JmTRVorxRTum4MJuDL
         S1YQ==
X-Gm-Message-State: AOAM530CkWaedjogVHxFobCURiAwOZ98iaZb+jiJoPc4OWlf/Wxhpv8w
        s9BlftalUnHmaahqLgId0bFtnQ==
X-Google-Smtp-Source: ABdhPJyBBqHXdVJzJb0PmTdi9AVnwB/gLdr18ecPlbIl65Vq7v6QcCD8JbdsWRJwBKvGxFKR9Uosrg==
X-Received: by 2002:aa7:8481:0:b029:18b:f647:45f7 with SMTP id u1-20020aa784810000b029018bf64745f7mr3139497pfn.58.1604844751504;
        Sun, 08 Nov 2020 06:12:31 -0800 (PST)
Received: from localhost.localdomain ([103.136.220.94])
        by smtp.gmail.com with ESMTPSA id z11sm8754047pfk.52.2020.11.08.06.12.21
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sun, 08 Nov 2020 06:12:30 -0800 (PST)
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
Subject: [PATCH v3 05/21] mm/hugetlb: Introduce pgtable allocation/freeing helpers
Date:   Sun,  8 Nov 2020 22:10:57 +0800
Message-Id: <20201108141113.65450-6-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20201108141113.65450-1-songmuchun@bytedance.com>
References: <20201108141113.65450-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On x86_64, vmemmap is always PMD mapped if the machine has hugepages
support and if we have 2MB contiguos pages and PMD aligned. If we want
to free the unused vmemmap pages, we have to split the huge pmd firstly.
So we should pre-allocate pgtable to split PMD to PTE.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 include/linux/hugetlb.h |  10 +++++
 mm/hugetlb.c            | 111 ++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 121 insertions(+)

diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index eed3dd3bd626..d81c262418db 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -593,6 +593,16 @@ static inline unsigned int blocks_per_huge_page(struct hstate *h)
 
 #include <asm/hugetlb.h>
 
+#ifdef CONFIG_HUGETLB_PAGE_FREE_VMEMMAP
+#ifndef VMEMMAP_HPAGE_SHIFT
+#define VMEMMAP_HPAGE_SHIFT		HPAGE_SHIFT
+#endif
+#define VMEMMAP_HPAGE_ORDER		(VMEMMAP_HPAGE_SHIFT - PAGE_SHIFT)
+#define VMEMMAP_HPAGE_NR		(1 << VMEMMAP_HPAGE_ORDER)
+#define VMEMMAP_HPAGE_SIZE		((1UL) << VMEMMAP_HPAGE_SHIFT)
+#define VMEMMAP_HPAGE_MASK		(~(VMEMMAP_HPAGE_SIZE - 1))
+#endif /* CONFIG_HUGETLB_PAGE_FREE_VMEMMAP */
+
 #ifndef is_hugepage_only_range
 static inline int is_hugepage_only_range(struct mm_struct *mm,
 					unsigned long addr, unsigned long len)
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index a0007902fafb..5c7be2ee7e15 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -1303,6 +1303,108 @@ static inline void destroy_compound_gigantic_page(struct page *page,
  */
 #define RESERVE_VMEMMAP_NR	2U
 
+#define page_huge_pte(page)	((page)->pmd_huge_pte)
+
+static inline unsigned int free_vmemmap_pages_per_hpage(struct hstate *h)
+{
+	return h->nr_free_vmemmap_pages;
+}
+
+static inline unsigned int vmemmap_pages_per_hpage(struct hstate *h)
+{
+	return free_vmemmap_pages_per_hpage(h) + RESERVE_VMEMMAP_NR;
+}
+
+static inline unsigned long vmemmap_pages_size_per_hpage(struct hstate *h)
+{
+	return (unsigned long)vmemmap_pages_per_hpage(h) << PAGE_SHIFT;
+}
+
+static inline unsigned int pgtable_pages_to_prealloc_per_hpage(struct hstate *h)
+{
+	unsigned long vmemmap_size = vmemmap_pages_size_per_hpage(h);
+
+	/*
+	 * No need pre-allocate page tabels when there is no vmemmap pages
+	 * to free.
+	 */
+	if (!free_vmemmap_pages_per_hpage(h))
+		return 0;
+
+	return ALIGN(vmemmap_size, VMEMMAP_HPAGE_SIZE) >> VMEMMAP_HPAGE_SHIFT;
+}
+
+static inline void vmemmap_pgtable_init(struct page *page)
+{
+	page_huge_pte(page) = NULL;
+}
+
+static void vmemmap_pgtable_deposit(struct page *page, pgtable_t pgtable)
+{
+	/* FIFO */
+	if (!page_huge_pte(page))
+		INIT_LIST_HEAD(&pgtable->lru);
+	else
+		list_add(&pgtable->lru, &page_huge_pte(page)->lru);
+	page_huge_pte(page) = pgtable;
+}
+
+static pgtable_t vmemmap_pgtable_withdraw(struct page *page)
+{
+	pgtable_t pgtable;
+
+	/* FIFO */
+	pgtable = page_huge_pte(page);
+	page_huge_pte(page) = list_first_entry_or_null(&pgtable->lru,
+						       struct page, lru);
+	if (page_huge_pte(page))
+		list_del(&pgtable->lru);
+	return pgtable;
+}
+
+static int vmemmap_pgtable_prealloc(struct hstate *h, struct page *page)
+{
+	int i;
+	pgtable_t pgtable;
+	unsigned int nr = pgtable_pages_to_prealloc_per_hpage(h);
+
+	if (!nr)
+		return 0;
+
+	vmemmap_pgtable_init(page);
+
+	for (i = 0; i < nr; i++) {
+		pte_t *pte_p;
+
+		pte_p = pte_alloc_one_kernel(&init_mm);
+		if (!pte_p)
+			goto out;
+		vmemmap_pgtable_deposit(page, virt_to_page(pte_p));
+	}
+
+	return 0;
+out:
+	while (i-- && (pgtable = vmemmap_pgtable_withdraw(page)))
+		pte_free_kernel(&init_mm, page_to_virt(pgtable));
+	return -ENOMEM;
+}
+
+static void vmemmap_pgtable_free(struct hstate *h, struct page *page)
+{
+	pgtable_t pgtable;
+	unsigned int nr = pgtable_pages_to_prealloc_per_hpage(h);
+
+	if (!nr)
+		return;
+
+	pgtable = page_huge_pte(page);
+	if (!pgtable)
+		return;
+
+	while (nr-- && (pgtable = vmemmap_pgtable_withdraw(page)))
+		pte_free_kernel(&init_mm, page_to_virt(pgtable));
+}
+
 static void __init hugetlb_vmemmap_init(struct hstate *h)
 {
 	unsigned int order = huge_page_order(h);
@@ -1326,6 +1428,15 @@ static void __init hugetlb_vmemmap_init(struct hstate *h)
 static inline void hugetlb_vmemmap_init(struct hstate *h)
 {
 }
+
+static inline int vmemmap_pgtable_prealloc(struct hstate *h, struct page *page)
+{
+	return 0;
+}
+
+static inline void vmemmap_pgtable_free(struct hstate *h, struct page *page)
+{
+}
 #endif
 
 static void update_and_free_page(struct hstate *h, struct page *page)
-- 
2.11.0

