Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB8D9C48BE0
	for <linux-doc@archiver.kernel.org>; Wed,  9 Jun 2021 12:16:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B851B61364
	for <linux-doc@archiver.kernel.org>; Wed,  9 Jun 2021 12:16:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235195AbhFIMSM (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 9 Jun 2021 08:18:12 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37214 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235092AbhFIMSL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 9 Jun 2021 08:18:11 -0400
Received: from mail-pj1-x102d.google.com (mail-pj1-x102d.google.com [IPv6:2607:f8b0:4864:20::102d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DC75FC061760
        for <linux-doc@vger.kernel.org>; Wed,  9 Jun 2021 05:16:16 -0700 (PDT)
Received: by mail-pj1-x102d.google.com with SMTP id m13-20020a17090b068db02901656cc93a75so1266076pjz.3
        for <linux-doc@vger.kernel.org>; Wed, 09 Jun 2021 05:16:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=Q5gMWEv9tC8/vo4nEZxaNdZR95vKmKnlaLF90wl0oFU=;
        b=fF+rSzdrOYcR9ijjFVFrOhei1ZRjgv4y5N87LenL7irAqVNjAsEvLUOZbVHDTOBl27
         5GyM0gAB28wmHolfQQszATK2NLf0pC1NXbWBfc4O2tHsS5xwlTnj4pVa5e2cyPTow1Mi
         t750zb5lZNj4wElyK/c4dZJ0KZ406xm1z0oCfs6yn7A3LcrvojwLivhUbr+RT2meDfV6
         WdPy+xrxr7qLkGmoP4Ry12kceUi99PdX8EZlpknB36edvksdwxJ8We63qW2Arq2eCeTl
         2yZDbJiOrJU1Y2s9z4oM2CaR63D8ZK8+lR0FmeG8mAvgtTEfLiXm13+vG3J8R5SNq7To
         ZSUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=Q5gMWEv9tC8/vo4nEZxaNdZR95vKmKnlaLF90wl0oFU=;
        b=T4CrZI7kwzzxOHyYZJ31W6SwAL4rkE4kg9cbXB79UoXTnOQq6E3v9J8IkwpZ1g6Soq
         9BdrxWxlA0EVpH1HhEWWJm4RvTSlGeWGA51pAhvFhS9YIWNGpw3wtEleYQhtk4C3AhDz
         bUF3fs3SzP/OwWXAeMDQk1mpGK1FALu+sW/3tpVZSvy9i2+39j4yTfHKxTJznsfI5JXi
         YvjAvgOEqyeF/8Ne9V+ZO7h627k0qQWvYZl889O05tqDZnzJghHg5J6AzCZSwDTt36p5
         A83rqqf5UOiRM1rQEWhbK9LUT5Ue9fn816QxRQKbwR3WyUWRBK8HC/7Fqem5wcz1M47B
         f1hQ==
X-Gm-Message-State: AOAM531/WpTLHmeveKjdz7o9eEgV/V5jfwkmb8UacdPMetoXO+jcq/cd
        NamVsu++tgAtpAzBTJP4YjV1sg==
X-Google-Smtp-Source: ABdhPJzOgyiAQiBObGnuElieU/iq/wW8CUGGkfOtZNVadqwy30FNgVSA44A84vH2Tc9oftskRcB8zw==
X-Received: by 2002:a17:902:d305:b029:10d:c8a3:657f with SMTP id b5-20020a170902d305b029010dc8a3657fmr4756404plc.0.1623240976435;
        Wed, 09 Jun 2021 05:16:16 -0700 (PDT)
Received: from localhost.localdomain ([139.177.225.254])
        by smtp.gmail.com with ESMTPSA id h16sm13689224pfk.119.2021.06.09.05.16.11
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 09 Jun 2021 05:16:16 -0700 (PDT)
From:   Muchun Song <songmuchun@bytedance.com>
To:     mike.kravetz@oracle.com, akpm@linux-foundation.org,
        osalvador@suse.de, mhocko@suse.com, song.bao.hua@hisilicon.com,
        david@redhat.com, chenhuang5@huawei.com, bodeddub@amazon.com,
        corbet@lwn.net
Cc:     duanxiongchun@bytedance.com, fam.zheng@bytedance.com,
        zhengqi.arch@bytedance.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH 2/5] mm: hugetlb: introduce helpers to preallocate page tables from bootmem allocator
Date:   Wed,  9 Jun 2021 20:13:07 +0800
Message-Id: <20210609121310.62229-3-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20210609121310.62229-1-songmuchun@bytedance.com>
References: <20210609121310.62229-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

If we want to split the huge PMD of vmemmap pages associated with each
gigantic page allocated from bootmem allocator, we should pre-allocate
the page tables from bootmem allocator. In this patch, we introduce
some helpers to preallocate page tables for gigantic pages.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 include/linux/hugetlb.h |  3 +++
 mm/hugetlb_vmemmap.c    | 63 +++++++++++++++++++++++++++++++++++++++++++++++++
 mm/hugetlb_vmemmap.h    | 13 ++++++++++
 3 files changed, 79 insertions(+)

diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
index 03ca83db0a3e..c27a299c4211 100644
--- a/include/linux/hugetlb.h
+++ b/include/linux/hugetlb.h
@@ -622,6 +622,9 @@ struct hstate {
 struct huge_bootmem_page {
 	struct list_head list;
 	struct hstate *hstate;
+#ifdef CONFIG_HUGETLB_PAGE_FREE_VMEMMAP
+	pte_t *vmemmap_pte;
+#endif
 };
 
 int isolate_or_dissolve_huge_page(struct page *page, struct list_head *list);
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index 628e2752714f..6f3a47b4ebd3 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -171,6 +171,7 @@
 #define pr_fmt(fmt)	"HugeTLB: " fmt
 
 #include <linux/list.h>
+#include <linux/memblock.h>
 #include <asm/pgalloc.h>
 
 #include "hugetlb_vmemmap.h"
@@ -263,6 +264,68 @@ int vmemmap_pgtable_prealloc(struct hstate *h, struct list_head *pgtables)
 	return -ENOMEM;
 }
 
+unsigned long __init gigantic_vmemmap_pgtable_prealloc(void)
+{
+	struct huge_bootmem_page *m, *tmp;
+	unsigned long nr_free = 0;
+
+	list_for_each_entry_safe(m, tmp, &huge_boot_pages, list) {
+		struct hstate *h = m->hstate;
+		unsigned int nr = pgtable_pages_to_prealloc_per_hpage(h);
+		unsigned long size;
+
+		if (!nr)
+			continue;
+
+		size = nr << PAGE_SHIFT;
+		m->vmemmap_pte = memblock_alloc_try_nid(size, PAGE_SIZE, 0,
+							MEMBLOCK_ALLOC_ACCESSIBLE,
+							NUMA_NO_NODE);
+		if (!m->vmemmap_pte) {
+			nr_free++;
+			list_del(&m->list);
+			memblock_free_early(__pa(m), huge_page_size(h));
+		}
+	}
+
+	return nr_free;
+}
+
+void __init gigantic_vmemmap_pgtable_init(struct huge_bootmem_page *m,
+					  struct page *head)
+{
+	struct hstate *h = m->hstate;
+	unsigned long pte = (unsigned long)m->vmemmap_pte;
+	unsigned int nr = pgtable_pages_to_prealloc_per_hpage(h);
+
+	if (!nr)
+		return;
+
+	/*
+	 * If we had gigantic hugepages allocated at boot time, we need
+	 * to restore the 'stolen' pages to totalram_pages in order to
+	 * fix confusing memory reports from free(1) and another
+	 * side-effects, like CommitLimit going negative.
+	 */
+	adjust_managed_page_count(head, nr);
+
+	/*
+	 * Use the huge page lru list to temporarily store the preallocated
+	 * pages. The preallocated pages are used and the list is emptied
+	 * before the huge page is put into use. When the huge page is put
+	 * into use by prep_new_huge_page() the list will be reinitialized.
+	 */
+	INIT_LIST_HEAD(&head->lru);
+
+	while (nr--) {
+		struct page *pte_page = virt_to_page(pte);
+
+		__ClearPageReserved(pte_page);
+		list_add(&pte_page->lru, &head->lru);
+		pte += PAGE_SIZE;
+	}
+}
+
 /*
  * Previously discarded vmemmap pages will be allocated and remapping
  * after this function returns zero.
diff --git a/mm/hugetlb_vmemmap.h b/mm/hugetlb_vmemmap.h
index 306e15519da1..f6170720f183 100644
--- a/mm/hugetlb_vmemmap.h
+++ b/mm/hugetlb_vmemmap.h
@@ -16,6 +16,9 @@ void free_huge_page_vmemmap(struct hstate *h, struct page *head);
 void hugetlb_vmemmap_init(struct hstate *h);
 int vmemmap_pgtable_prealloc(struct hstate *h, struct list_head *pgtables);
 void vmemmap_pgtable_free(struct list_head *pgtables);
+unsigned long gigantic_vmemmap_pgtable_prealloc(void);
+void gigantic_vmemmap_pgtable_init(struct huge_bootmem_page *m,
+				   struct page *head);
 
 /*
  * How many vmemmap pages associated with a HugeTLB page that can be freed
@@ -45,6 +48,16 @@ static inline void vmemmap_pgtable_free(struct list_head *pgtables)
 {
 }
 
+static inline unsigned long gigantic_vmemmap_pgtable_prealloc(void)
+{
+	return 0;
+}
+
+static inline void gigantic_vmemmap_pgtable_init(struct huge_bootmem_page *m,
+						 struct page *head)
+{
+}
+
 static inline void hugetlb_vmemmap_init(struct hstate *h)
 {
 }
-- 
2.11.0

