Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DAC9C433EF
	for <linux-doc@archiver.kernel.org>; Fri, 29 Apr 2022 13:36:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238803AbiD2NkG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 29 Apr 2022 09:40:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350499AbiD2NkF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 29 Apr 2022 09:40:05 -0400
Received: from mail-pf1-x432.google.com (mail-pf1-x432.google.com [IPv6:2607:f8b0:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 50D2DCABB4
        for <linux-doc@vger.kernel.org>; Fri, 29 Apr 2022 06:36:47 -0700 (PDT)
Received: by mail-pf1-x432.google.com with SMTP id a11so6953695pff.1
        for <linux-doc@vger.kernel.org>; Fri, 29 Apr 2022 06:36:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=6HmhPOYQfQyw96XMQOEpsURE5/Z+FdPGWunRugIZ8bE=;
        b=IptdK2Nlzt+e9FhAHJZOhyofi5+WuZbLP0Ii/Ru4VJXlBwx3Jtv5GU1CtyjqaFxexS
         KY8mxkGvEwjwdKyqqQe9TUyh4sAekQ/hfIMYn0f36mdYafrTxAGiuzghQc89UaEolTsO
         blkiqeRCUyMFCYPfaVufQUh1xBHZr1JubX3N9JmXee3AqD5ax6McY5qa7yfJC7tnId0k
         Hl4C1AGpoKEpQOyU05qCdMKctzm14UjXlbAukdt+PdkHRxcC/rDScCQ2pyT5/1QzPYDH
         A5cJG+jlDrM3qMTFyQNF8Hrw3Hjkd3C/gEP++G4BVKJAYOU6+6IajYkXQhkcpIwumF8Z
         nJ9Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=6HmhPOYQfQyw96XMQOEpsURE5/Z+FdPGWunRugIZ8bE=;
        b=7GFB0Ierbt5qR/bxmrDWBqdxQ+jfGiBULcZ6hL0utRnJ+7mTw4KMfp/BPpRlUODX28
         oKuuKOkKTO5ba0mdcrgfPjR/xc3vcUsxODq1+knUseKrEVniIN/jBU8BibihilgsE+0c
         qsvd+iq+UMwGzLR1XkHNjB53UohcCDMYUQX9gxkG2eS21JRDHcXWvm7Nx5Msw/L16/ua
         UEM0rxHKefonjkel+j0hHeqPmsN9wM6dusy0ejd3ZXmyMGRIzI17s6pmXvuasVQDZiH0
         7AbHr5XwvO8jcqRuetIT6GRXUpL63uY61THDt+rVn7+/Z4qMiuRYn46J62I8XSzxAGGr
         p6yg==
X-Gm-Message-State: AOAM531qIUrQmJMWdGqsuB8f/X+Fn3JzXrbmSGmWmPV3MF9czbMCabEK
        Ho5YzieYRKf2aXij7jqCDd5cQQ==
X-Google-Smtp-Source: ABdhPJzqvZjOyyOerClbeLgfXGriI0EREvRRrSKg/2B9wt0ANwQMK0Q+vOCP30x0IB5WyOyWJThPqA==
X-Received: by 2002:a05:6a00:21c7:b0:4fd:f89f:ec17 with SMTP id t7-20020a056a0021c700b004fdf89fec17mr40167798pfj.72.1651239406601;
        Fri, 29 Apr 2022 06:36:46 -0700 (PDT)
Received: from localhost.localdomain ([139.177.225.240])
        by smtp.gmail.com with ESMTPSA id m8-20020a17090a414800b001d81a30c437sm10681977pjg.50.2022.04.29.06.36.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 29 Apr 2022 06:36:46 -0700 (PDT)
From:   Qi Zheng <zhengqi.arch@bytedance.com>
To:     akpm@linux-foundation.org, tglx@linutronix.de,
        kirill.shutemov@linux.intel.com, mika.penttila@nextfour.com,
        david@redhat.com, jgg@nvidia.com, tj@kernel.org, dennis@kernel.org,
        ming.lei@redhat.com
Cc:     linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-mm@kvack.org, songmuchun@bytedance.com,
        zhouchengming@bytedance.com, Qi Zheng <zhengqi.arch@bytedance.com>
Subject: [RFC PATCH 05/18] mm: split the related definitions of pte_offset_map_lock() into pgtable.h
Date:   Fri, 29 Apr 2022 21:35:39 +0800
Message-Id: <20220429133552.33768-6-zhengqi.arch@bytedance.com>
X-Mailer: git-send-email 2.24.3 (Apple Git-128)
In-Reply-To: <20220429133552.33768-1-zhengqi.arch@bytedance.com>
References: <20220429133552.33768-1-zhengqi.arch@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The pte_offset_map_lock() and its friend pte_offset_map() are in mm.h
and pgtable.h respectively, it would be better to have them in one file.
Considering that they are all helper functions related to page tables,
move pte_offset_map_lock() to pgtable.h.

The pte_lockptr() is required for pte_offset_map_lock(), so move it and
its friends {pmd,pud}_lockptr() to pgtable.h together.

Signed-off-by: Qi Zheng <zhengqi.arch@bytedance.com>
---
 include/linux/mm.h      | 149 ----------------------------------------
 include/linux/pgtable.h | 149 ++++++++++++++++++++++++++++++++++++++++
 2 files changed, 149 insertions(+), 149 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index e34edb775334..0afd3b097e90 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2252,70 +2252,6 @@ static inline pmd_t *pmd_alloc(struct mm_struct *mm, pud_t *pud, unsigned long a
 }
 #endif /* CONFIG_MMU */
 
-#if USE_SPLIT_PTE_PTLOCKS
-#if ALLOC_SPLIT_PTLOCKS
-void __init ptlock_cache_init(void);
-extern bool ptlock_alloc(struct page *page);
-extern void ptlock_free(struct page *page);
-
-static inline spinlock_t *ptlock_ptr(struct page *page)
-{
-	return page->ptl;
-}
-#else /* ALLOC_SPLIT_PTLOCKS */
-static inline void ptlock_cache_init(void)
-{
-}
-
-static inline bool ptlock_alloc(struct page *page)
-{
-	return true;
-}
-
-static inline void ptlock_free(struct page *page)
-{
-}
-
-static inline spinlock_t *ptlock_ptr(struct page *page)
-{
-	return &page->ptl;
-}
-#endif /* ALLOC_SPLIT_PTLOCKS */
-
-static inline spinlock_t *pte_lockptr(struct mm_struct *mm, pmd_t *pmd)
-{
-	return ptlock_ptr(pmd_page(*pmd));
-}
-
-static inline bool ptlock_init(struct page *page)
-{
-	/*
-	 * prep_new_page() initialize page->private (and therefore page->ptl)
-	 * with 0. Make sure nobody took it in use in between.
-	 *
-	 * It can happen if arch try to use slab for page table allocation:
-	 * slab code uses page->slab_cache, which share storage with page->ptl.
-	 */
-	VM_BUG_ON_PAGE(*(unsigned long *)&page->ptl, page);
-	if (!ptlock_alloc(page))
-		return false;
-	spin_lock_init(ptlock_ptr(page));
-	return true;
-}
-
-#else	/* !USE_SPLIT_PTE_PTLOCKS */
-/*
- * We use mm->page_table_lock to guard all pagetable pages of the mm.
- */
-static inline spinlock_t *pte_lockptr(struct mm_struct *mm, pmd_t *pmd)
-{
-	return &mm->page_table_lock;
-}
-static inline void ptlock_cache_init(void) {}
-static inline bool ptlock_init(struct page *page) { return true; }
-static inline void ptlock_free(struct page *page) {}
-#endif /* USE_SPLIT_PTE_PTLOCKS */
-
 static inline void pgtable_init(void)
 {
 	ptlock_cache_init();
@@ -2338,20 +2274,6 @@ static inline void pgtable_pte_page_dtor(struct page *page)
 	dec_lruvec_page_state(page, NR_PAGETABLE);
 }
 
-#define pte_offset_map_lock(mm, pmd, address, ptlp)	\
-({							\
-	spinlock_t *__ptl = pte_lockptr(mm, pmd);	\
-	pte_t *__pte = pte_offset_map(pmd, address);	\
-	*(ptlp) = __ptl;				\
-	spin_lock(__ptl);				\
-	__pte;						\
-})
-
-#define pte_unmap_unlock(pte, ptl)	do {		\
-	spin_unlock(ptl);				\
-	pte_unmap(pte);					\
-} while (0)
-
 #define pte_alloc(mm, pmd) (unlikely(pmd_none(*(pmd))) && __pte_alloc(mm, pmd))
 
 #define pte_alloc_map(mm, pmd, address)			\
@@ -2365,58 +2287,6 @@ static inline void pgtable_pte_page_dtor(struct page *page)
 	((unlikely(pmd_none(*(pmd))) && __pte_alloc_kernel(pmd))? \
 		NULL: pte_offset_kernel(pmd, address))
 
-#if USE_SPLIT_PMD_PTLOCKS
-
-static struct page *pmd_to_page(pmd_t *pmd)
-{
-	unsigned long mask = ~(PTRS_PER_PMD * sizeof(pmd_t) - 1);
-	return virt_to_page((void *)((unsigned long) pmd & mask));
-}
-
-static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
-{
-	return ptlock_ptr(pmd_to_page(pmd));
-}
-
-static inline bool pmd_ptlock_init(struct page *page)
-{
-#ifdef CONFIG_TRANSPARENT_HUGEPAGE
-	page->pmd_huge_pte = NULL;
-#endif
-	return ptlock_init(page);
-}
-
-static inline void pmd_ptlock_free(struct page *page)
-{
-#ifdef CONFIG_TRANSPARENT_HUGEPAGE
-	VM_BUG_ON_PAGE(page->pmd_huge_pte, page);
-#endif
-	ptlock_free(page);
-}
-
-#define pmd_huge_pte(mm, pmd) (pmd_to_page(pmd)->pmd_huge_pte)
-
-#else
-
-static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
-{
-	return &mm->page_table_lock;
-}
-
-static inline bool pmd_ptlock_init(struct page *page) { return true; }
-static inline void pmd_ptlock_free(struct page *page) {}
-
-#define pmd_huge_pte(mm, pmd) ((mm)->pmd_huge_pte)
-
-#endif
-
-static inline spinlock_t *pmd_lock(struct mm_struct *mm, pmd_t *pmd)
-{
-	spinlock_t *ptl = pmd_lockptr(mm, pmd);
-	spin_lock(ptl);
-	return ptl;
-}
-
 static inline bool pgtable_pmd_page_ctor(struct page *page)
 {
 	if (!pmd_ptlock_init(page))
@@ -2433,25 +2303,6 @@ static inline void pgtable_pmd_page_dtor(struct page *page)
 	dec_lruvec_page_state(page, NR_PAGETABLE);
 }
 
-/*
- * No scalability reason to split PUD locks yet, but follow the same pattern
- * as the PMD locks to make it easier if we decide to.  The VM should not be
- * considered ready to switch to split PUD locks yet; there may be places
- * which need to be converted from page_table_lock.
- */
-static inline spinlock_t *pud_lockptr(struct mm_struct *mm, pud_t *pud)
-{
-	return &mm->page_table_lock;
-}
-
-static inline spinlock_t *pud_lock(struct mm_struct *mm, pud_t *pud)
-{
-	spinlock_t *ptl = pud_lockptr(mm, pud);
-
-	spin_lock(ptl);
-	return ptl;
-}
-
 extern void __init pagecache_init(void);
 extern void free_initmem(void);
 
diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index bed9a559d45b..0928acca6b48 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -85,6 +85,141 @@ static inline unsigned long pud_index(unsigned long address)
 #define pgd_index(a)  (((a) >> PGDIR_SHIFT) & (PTRS_PER_PGD - 1))
 #endif
 
+#if USE_SPLIT_PTE_PTLOCKS
+#if ALLOC_SPLIT_PTLOCKS
+void __init ptlock_cache_init(void);
+extern bool ptlock_alloc(struct page *page);
+extern void ptlock_free(struct page *page);
+
+static inline spinlock_t *ptlock_ptr(struct page *page)
+{
+	return page->ptl;
+}
+#else /* ALLOC_SPLIT_PTLOCKS */
+static inline void ptlock_cache_init(void)
+{
+}
+
+static inline bool ptlock_alloc(struct page *page)
+{
+	return true;
+}
+
+static inline void ptlock_free(struct page *page)
+{
+}
+
+static inline spinlock_t *ptlock_ptr(struct page *page)
+{
+	return &page->ptl;
+}
+#endif /* ALLOC_SPLIT_PTLOCKS */
+
+static inline spinlock_t *pte_lockptr(struct mm_struct *mm, pmd_t *pmd)
+{
+	return ptlock_ptr(pmd_page(*pmd));
+}
+
+static inline bool ptlock_init(struct page *page)
+{
+	/*
+	 * prep_new_page() initialize page->private (and therefore page->ptl)
+	 * with 0. Make sure nobody took it in use in between.
+	 *
+	 * It can happen if arch try to use slab for page table allocation:
+	 * slab code uses page->slab_cache, which share storage with page->ptl.
+	 */
+	VM_BUG_ON_PAGE(*(unsigned long *)&page->ptl, page);
+	if (!ptlock_alloc(page))
+		return false;
+	spin_lock_init(ptlock_ptr(page));
+	return true;
+}
+
+#else	/* !USE_SPLIT_PTE_PTLOCKS */
+/*
+ * We use mm->page_table_lock to guard all pagetable pages of the mm.
+ */
+static inline spinlock_t *pte_lockptr(struct mm_struct *mm, pmd_t *pmd)
+{
+	return &mm->page_table_lock;
+}
+static inline void ptlock_cache_init(void) {}
+static inline bool ptlock_init(struct page *page) { return true; }
+static inline void ptlock_free(struct page *page) {}
+#endif /* USE_SPLIT_PTE_PTLOCKS */
+
+#if USE_SPLIT_PMD_PTLOCKS
+
+static struct page *pmd_to_page(pmd_t *pmd)
+{
+	unsigned long mask = ~(PTRS_PER_PMD * sizeof(pmd_t) - 1);
+	return virt_to_page((void *)((unsigned long) pmd & mask));
+}
+
+static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
+{
+	return ptlock_ptr(pmd_to_page(pmd));
+}
+
+static inline bool pmd_ptlock_init(struct page *page)
+{
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+	page->pmd_huge_pte = NULL;
+#endif
+	return ptlock_init(page);
+}
+
+static inline void pmd_ptlock_free(struct page *page)
+{
+#ifdef CONFIG_TRANSPARENT_HUGEPAGE
+	VM_BUG_ON_PAGE(page->pmd_huge_pte, page);
+#endif
+	ptlock_free(page);
+}
+
+#define pmd_huge_pte(mm, pmd) (pmd_to_page(pmd)->pmd_huge_pte)
+
+#else /* !USE_SPLIT_PMD_PTLOCKS */
+
+static inline spinlock_t *pmd_lockptr(struct mm_struct *mm, pmd_t *pmd)
+{
+	return &mm->page_table_lock;
+}
+
+static inline bool pmd_ptlock_init(struct page *page) { return true; }
+static inline void pmd_ptlock_free(struct page *page) {}
+
+#define pmd_huge_pte(mm, pmd) ((mm)->pmd_huge_pte)
+
+#endif /* USE_SPLIT_PMD_PTLOCKS */
+
+static inline spinlock_t *pmd_lock(struct mm_struct *mm, pmd_t *pmd)
+{
+	spinlock_t *ptl = pmd_lockptr(mm, pmd);
+	spin_lock(ptl);
+	return ptl;
+}
+
+/*
+ * No scalability reason to split PUD locks yet, but follow the same pattern
+ * as the PMD locks to make it easier if we decide to.  The VM should not be
+ * considered ready to switch to split PUD locks yet; there may be places
+ * which need to be converted from page_table_lock.
+ */
+static inline spinlock_t *pud_lockptr(struct mm_struct *mm, pud_t *pud)
+{
+	return &mm->page_table_lock;
+}
+
+static inline spinlock_t *pud_lock(struct mm_struct *mm, pud_t *pud)
+{
+	spinlock_t *ptl = pud_lockptr(mm, pud);
+
+	spin_lock(ptl);
+	return ptl;
+}
+
 #ifndef pte_offset_kernel
 static inline pte_t *pte_offset_kernel(pmd_t *pmd, unsigned long address)
 {
@@ -103,6 +238,20 @@ static inline pte_t *pte_offset_kernel(pmd_t *pmd, unsigned long address)
 #define pte_unmap(pte) ((void)(pte))	/* NOP */
 #endif
 
+#define pte_offset_map_lock(mm, pmd, address, ptlp)	\
+({							\
+	spinlock_t *__ptl = pte_lockptr(mm, pmd);	\
+	pte_t *__pte = pte_offset_map(pmd, address);	\
+	*(ptlp) = __ptl;				\
+	spin_lock(__ptl);				\
+	__pte;						\
+})
+
+#define pte_unmap_unlock(pte, ptl)	do {		\
+	spin_unlock(ptl);				\
+	pte_unmap(pte);					\
+} while (0)
+
 /* Find an entry in the second-level page table.. */
 #ifndef pmd_offset
 static inline pmd_t *pmd_offset(pud_t *pud, unsigned long address)
-- 
2.20.1

