Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 48153C433E9
	for <linux-doc@archiver.kernel.org>; Thu,  4 Feb 2021 03:56:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1B4AA64F60
	for <linux-doc@archiver.kernel.org>; Thu,  4 Feb 2021 03:56:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232203AbhBDDz6 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 3 Feb 2021 22:55:58 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232069AbhBDDz3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 3 Feb 2021 22:55:29 -0500
Received: from mail-pl1-x62c.google.com (mail-pl1-x62c.google.com [IPv6:2607:f8b0:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EFF68C0613D6
        for <linux-doc@vger.kernel.org>; Wed,  3 Feb 2021 19:54:41 -0800 (PST)
Received: by mail-pl1-x62c.google.com with SMTP id b17so1032772plz.6
        for <linux-doc@vger.kernel.org>; Wed, 03 Feb 2021 19:54:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=mzEE5dMYm3uaH3H3dlBrJOpsyDd+Maq9i6h9c/DgK5c=;
        b=ANvsIfyFgYUgwvAmNnBti4IVtWO0awEgD/8GT4aqnmwDMFnkWF3xL2n6SCFsfr5Mz8
         EvjtopyRs5DyXMk2j6n/WG8xQYbRBhX/AbrbVTCC+LMFt7MEnPfxl8pAk+FyL0E05Ffr
         kw1tdzQ0wPHhskCAPSFGFHl2dhY/2O1GMrAdVV1wY+DlicDQhPuc2WpRRTjNNIWF8qq2
         VMLOpD7KP/pQJAq7XYUE3RNlq4E4VckA/tc7l2AVrBqnlFYtzm8J8VTWSarCCmW0sNX6
         JgCl2EbZvPA6ulpvq8pHigXLynbaitBhZb/NI7lpnKFXNyDsITgI4+baMx+qvJvB62tI
         zQaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=mzEE5dMYm3uaH3H3dlBrJOpsyDd+Maq9i6h9c/DgK5c=;
        b=qlrB1oY+pB+plBlhx0KiW+OJyPMjHnxTGJ9DdGcvfGm6uvtOKidgxMqy6+zlNFbnUY
         uCEQRfRdED0P6nwtY/7Ar7zRlmdEaHsUEvIxFKqcev+XpCRC57AMFsrvlZu1Z28opsIU
         0//jvbq54Kv0VTH4r504xQY74/vFPGkl6xm/YBP0SZlt2n9VCxuKZQgAHWpXkK+9T2BF
         vplAlCbDJqLvbySyOYH2jnTP9U14eVnJ4T0REiiUSV0jwJuT77X20X78szPA8UKZAbzo
         GBFkbQdb8iHfeurNOsqO4X3k47plxRMaPsPJ8rUl+OBYkyzyGSq5afR2iWYJsVo/ktA8
         Ibbg==
X-Gm-Message-State: AOAM531pKyA02eVvduqtzXw09sLiylKCFJVLXCGO7rKmmdbaeK3Tpiwt
        J+mc59F3rEXHUeTX6YNp6W/Qiw==
X-Google-Smtp-Source: ABdhPJznX6V2uFsLCVlQPVHV1yCg/5uHfNmlj6D5ICIjl4lRF9gHv3KZY4Dt3XrXZMr8e2TfNavlxQ==
X-Received: by 2002:a17:90a:ca8d:: with SMTP id y13mr6301179pjt.76.1612410881505;
        Wed, 03 Feb 2021 19:54:41 -0800 (PST)
Received: from localhost.localdomain ([139.177.225.239])
        by smtp.gmail.com with ESMTPSA id 9sm3747466pfy.110.2021.02.03.19.54.30
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 03 Feb 2021 19:54:40 -0800 (PST)
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
Subject: [PATCH v14 4/8] mm: hugetlb: alloc the vmemmap pages associated with each HugeTLB page
Date:   Thu,  4 Feb 2021 11:50:39 +0800
Message-Id: <20210204035043.36609-5-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.21.0 (Apple Git-122)
In-Reply-To: <20210204035043.36609-1-songmuchun@bytedance.com>
References: <20210204035043.36609-1-songmuchun@bytedance.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

When we free a HugeTLB page to the buddy allocator, we should allocate the
vmemmap pages associated with it. But we may cannot allocate vmemmap pages
when the system is under memory pressure, in this case, we just refuse to
free the HugeTLB page instead of looping forever trying to allocate the
pages.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 include/linux/mm.h   |  2 ++
 mm/hugetlb.c         | 19 ++++++++++++-
 mm/hugetlb_vmemmap.c | 30 +++++++++++++++++++++
 mm/hugetlb_vmemmap.h |  8 ++++++
 mm/sparse-vmemmap.c  | 75 +++++++++++++++++++++++++++++++++++++++++++++++++++-
 5 files changed, 132 insertions(+), 2 deletions(-)

diff --git a/include/linux/mm.h b/include/linux/mm.h
index d7dddf334779..33c5911afe18 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -2981,6 +2981,8 @@ static inline void print_vma_addr(char *prefix, unsigned long rip)
 
 void vmemmap_remap_free(unsigned long start, unsigned long end,
 			unsigned long reuse);
+int vmemmap_remap_alloc(unsigned long start, unsigned long end,
+			unsigned long reuse, gfp_t gfp_mask);
 
 void *sparse_buffer_alloc(unsigned long size);
 struct page * __populate_section_memmap(unsigned long pfn,
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 4cfca27c6d32..5518283aa667 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -1397,16 +1397,26 @@ static void __free_huge_page(struct page *page)
 		h->resv_huge_pages++;
 
 	if (HPageTemporary(page)) {
-		list_del(&page->lru);
 		ClearHPageTemporary(page);
+
+		if (alloc_huge_page_vmemmap(h, page, GFP_ATOMIC)) {
+			h->surplus_huge_pages++;
+			h->surplus_huge_pages_node[nid]++;
+			goto enqueue;
+		}
+		list_del(&page->lru);
 		update_and_free_page(h, page);
 	} else if (h->surplus_huge_pages_node[nid]) {
+		if (alloc_huge_page_vmemmap(h, page, GFP_ATOMIC))
+			goto enqueue;
+
 		/* remove the page from active list */
 		list_del(&page->lru);
 		update_and_free_page(h, page);
 		h->surplus_huge_pages--;
 		h->surplus_huge_pages_node[nid]--;
 	} else {
+enqueue:
 		arch_clear_hugepage_flags(page);
 		enqueue_huge_page(h, page);
 	}
@@ -1693,6 +1703,10 @@ static int free_pool_huge_page(struct hstate *h, nodemask_t *nodes_allowed,
 			struct page *page =
 				list_entry(h->hugepage_freelists[node].next,
 					  struct page, lru);
+
+			if (alloc_huge_page_vmemmap(h, page, GFP_ATOMIC))
+				break;
+
 			list_del(&page->lru);
 			h->free_huge_pages--;
 			h->free_huge_pages_node[node]--;
@@ -1760,6 +1774,9 @@ int dissolve_free_huge_page(struct page *page)
 			goto retry;
 		}
 
+		if (alloc_huge_page_vmemmap(h, head, GFP_ATOMIC))
+			goto out;
+
 		/*
 		 * Move PageHWPoison flag from head page to the raw error page,
 		 * which makes any subpages rather than the error page reusable.
diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
index ddd872ab6180..0bd6b8d7282d 100644
--- a/mm/hugetlb_vmemmap.c
+++ b/mm/hugetlb_vmemmap.c
@@ -169,6 +169,8 @@
  * (last) level. So this type of HugeTLB page can be optimized only when its
  * size of the struct page structs is greater than 2 pages.
  */
+#define pr_fmt(fmt)	"HugeTLB: " fmt
+
 #include "hugetlb_vmemmap.h"
 
 /*
@@ -198,6 +200,34 @@ static inline unsigned long free_vmemmap_pages_size_per_hpage(struct hstate *h)
 	return (unsigned long)free_vmemmap_pages_per_hpage(h) << PAGE_SHIFT;
 }
 
+int alloc_huge_page_vmemmap(struct hstate *h, struct page *head, gfp_t gfp_mask)
+{
+	int ret;
+	unsigned long vmemmap_addr = (unsigned long)head;
+	unsigned long vmemmap_end, vmemmap_reuse;
+
+	if (!free_vmemmap_pages_per_hpage(h))
+		return 0;
+
+	vmemmap_addr += RESERVE_VMEMMAP_SIZE;
+	vmemmap_end = vmemmap_addr + free_vmemmap_pages_size_per_hpage(h);
+	vmemmap_reuse = vmemmap_addr - PAGE_SIZE;
+
+	/*
+	 * The pages which the vmemmap virtual address range [@vmemmap_addr,
+	 * @vmemmap_end) are mapped to are freed to the buddy allocator, and
+	 * the range is mapped to the page which @vmemmap_reuse is mapped to.
+	 * When a HugeTLB page is freed to the buddy allocator, previously
+	 * discarded vmemmap pages must be allocated and remapping.
+	 */
+	ret = vmemmap_remap_alloc(vmemmap_addr, vmemmap_end, vmemmap_reuse,
+				  gfp_mask | __GFP_NOWARN | __GFP_THISNODE);
+	if (ret == -ENOMEM)
+		pr_info("cannot alloc vmemmap pages\n");
+
+	return ret;
+}
+
 void free_huge_page_vmemmap(struct hstate *h, struct page *head)
 {
 	unsigned long vmemmap_addr = (unsigned long)head;
diff --git a/mm/hugetlb_vmemmap.h b/mm/hugetlb_vmemmap.h
index 6923f03534d5..6f89a9eed02c 100644
--- a/mm/hugetlb_vmemmap.h
+++ b/mm/hugetlb_vmemmap.h
@@ -11,8 +11,16 @@
 #include <linux/hugetlb.h>
 
 #ifdef CONFIG_HUGETLB_PAGE_FREE_VMEMMAP
+int alloc_huge_page_vmemmap(struct hstate *h, struct page *head,
+			    gfp_t gfp_mask);
 void free_huge_page_vmemmap(struct hstate *h, struct page *head);
 #else
+static inline int alloc_huge_page_vmemmap(struct hstate *h, struct page *head,
+					  gfp_t gfp_mask)
+{
+	return 0;
+}
+
 static inline void free_huge_page_vmemmap(struct hstate *h, struct page *head)
 {
 }
diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index 50c1dc00b686..277eb43aebd5 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -40,7 +40,8 @@
  * @remap_pte:		called for each non-empty PTE (lowest-level) entry.
  * @reuse_page:		the page which is reused for the tail vmemmap pages.
  * @reuse_addr:		the virtual address of the @reuse_page page.
- * @vmemmap_pages:	the list head of the vmemmap pages that can be freed.
+ * @vmemmap_pages:	the list head of the vmemmap pages that can be freed
+ *			or is mapped from.
  */
 struct vmemmap_remap_walk {
 	void (*remap_pte)(pte_t *pte, unsigned long addr,
@@ -237,6 +238,78 @@ void vmemmap_remap_free(unsigned long start, unsigned long end,
 	free_vmemmap_page_list(&vmemmap_pages);
 }
 
+static void vmemmap_restore_pte(pte_t *pte, unsigned long addr,
+				struct vmemmap_remap_walk *walk)
+{
+	pgprot_t pgprot = PAGE_KERNEL;
+	struct page *page;
+	void *to;
+
+	BUG_ON(pte_page(*pte) != walk->reuse_page);
+
+	page = list_first_entry(walk->vmemmap_pages, struct page, lru);
+	list_del(&page->lru);
+	to = page_to_virt(page);
+	copy_page(to, (void *)walk->reuse_addr);
+
+	set_pte_at(&init_mm, addr, pte, mk_pte(page, pgprot));
+}
+
+static int alloc_vmemmap_page_list(unsigned long start, unsigned long end,
+				   gfp_t gfp_mask, struct list_head *list)
+{
+	unsigned long addr;
+	int nid = page_to_nid((const void *)start);
+	struct page *page, *next;
+
+	for (addr = start; addr < end; addr += PAGE_SIZE) {
+		page = alloc_pages_node(nid, gfp_mask, 0);
+		if (!page)
+			goto out;
+		list_add_tail(&page->lru, list);
+	}
+
+	return 0;
+out:
+	list_for_each_entry_safe(page, next, list, lru)
+		__free_pages(page, 0);
+	return -ENOMEM;
+}
+
+/**
+ * vmemmap_remap_alloc - remap the vmemmap virtual address range [@start, end)
+ *			 to the page which is from the @vmemmap_pages
+ *			 respectively.
+ * @start:	start address of the vmemmap virtual address range that we want
+ *		to remap.
+ * @end:	end address of the vmemmap virtual address range that we want to
+ *		remap.
+ * @reuse:	reuse address.
+ * @gpf_mask:	GFP flag for allocating vmemmap pages.
+ */
+int vmemmap_remap_alloc(unsigned long start, unsigned long end,
+			unsigned long reuse, gfp_t gfp_mask)
+{
+	LIST_HEAD(vmemmap_pages);
+	struct vmemmap_remap_walk walk = {
+		.remap_pte	= vmemmap_restore_pte,
+		.reuse_addr	= reuse,
+		.vmemmap_pages	= &vmemmap_pages,
+	};
+
+	/* See the comment in the vmemmap_remap_free(). */
+	BUG_ON(start - reuse != PAGE_SIZE);
+
+	might_sleep_if(gfpflags_allow_blocking(gfp_mask));
+
+	if (alloc_vmemmap_page_list(start, end, gfp_mask, &vmemmap_pages))
+		return -ENOMEM;
+
+	vmemmap_remap_range(reuse, end, &walk);
+
+	return 0;
+}
+
 /*
  * Allocate a block of memory to be used to back the virtual memory map
  * or to back the page tables that are used to create the mapping.
-- 
2.11.0

