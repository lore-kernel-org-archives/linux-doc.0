Received: from mail-pj2-f12.google.com (mail-pj2-f12.google.com [74.125.227.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8713F20ED
	for <linux-doc@vger.kernel.org>; Fri, 11 Sep 2026 05:04:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.140
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789103057; cv=none; b=aum7+stCVTf5Aa6j1Qsrf6u8z9z8662Ajh3YN17uk1Lz54oqr7vZPSzqAI3FGnMeB/ezd+4oy3s5RToPaMs6O1LExMK6ANmOnOBUwjdcdwv9uHZLAX/wan1OCl3gYvcTn1Ej+AqEgNrZoWoywh1XJaBtsMbbB/5H8kshext83pM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789103057; c=relaxed/simple;
	bh=gShyvx+/cniTHn6nFfCC/e3ahAHIaLdaIffqkvBBwuY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=QRaLJ6gSaKR/Ma2NK2D2AbklrCzS/8QiuHOk+yW+lX6cvII6OdE5l4ps33sn0eioeoMeHLXTc4O3ixOwkkUBOpIvNGu413tbpiloh3h5HRxKrSj6bY3abtDDEiKpWG4Y0OAqqQgkLorK6MMI/6bWDKB2OH/Q+PJLqXkBxkncVPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=AhzOArLG; arc=none smtp.client-ip=74.125.227.140
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="AhzOArLG"
Received: by mail-pj2-f12.google.com with SMTP id 98e67ed59e1d1-398beb616f5so163159a91.1
        for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2026 22:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789103053; x=1789707853; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OZ9EEhriv4uQFVrwFElKF7ZgZH1tSjYdJIJZrcuS8I4=;
        b=AhzOArLG/xCSTx0ktuUt0CpNlWsaPcXE49mb0Nnb7l1O/owB17LwOZhKIJ+aRvzEoA
         DDi6Mduj18mL5K8qQ5dyWDFVMijkzqCjC8qa3FPQgeQw3rdKZGlQb5BAj/6cCo3Ev0QC
         2tla06gkstdCYvYgaT4zgcqlTHsPE9kiet1tduNE+02f1Tr69SHuhN4tDTatIQJpp4cD
         9Yd57tkNIrSUNuN28jcbszHC3p88GpEc7/CDFnvNwSglt2jJ8NLWW8H5CNCYWLrxYjNY
         mbiGDojPwRIadp1NXWd1gVHNQnJnksfcipxIv2MJchTs/Mr+nu5gbix46DBynF2e3su6
         Pgkg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789103053; x=1789707853;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=OZ9EEhriv4uQFVrwFElKF7ZgZH1tSjYdJIJZrcuS8I4=;
        b=WgXdQv6wNaAqta7Bx90LinokGyOZpuPK7L457UvlDzBDIj5EECTP+teNbLPaBpOk90
         GDEaocD/Ui+2ujXfq1i+fhBGxrqwhsJsiCtmItzmY80K7P1a6dJN+Slavx6XPts/C6BH
         SNK4ZBgYimcXbDM7MWFCvlSphSgoElNtznvwpfvKqrsigO8sXPL4KKDjHSLCaCOzuvxH
         ask85sqdscv8DbfoIqqFpp8n+5shHLzwdTE2HCebtYu8wmomwnyPSSAOGYYoT7K924pr
         M47RzAW3yqb1cRFA53aYRqT96ymlolICNk1+KKUezCY4bL+cIgDyutuPtZocWh6w0bfF
         lQpw==
X-Forwarded-Encrypted: i=1; AKwUvBxwjC6SMCwmL2LrswIonTJXTbdxrgYqQXPaa3OBZvqb+Nue3KymJFCQkpu5U+KknrVhb77hADjMOUo=@vger.kernel.org
X-Gm-Message-State: AFuF++n6WnXucw4NuR+KB2AosscmUTO2LeBppCTjo3crgnr2g5R8XW8e
	HSGH/9Q+RrtUpuF2rVh5c3WaSSEE8olksvzaUmbMWuEW0R8xa0ujVQW9ywl/5N83Lj4=
X-Gm-Gg: AYBFou3cRkcejAbCQ6GzPQEkL2tQEfhMWbk1fWoudowaNF00lMgj2FeW8fqcs4yLEVX
	oMHEX4dJBXd5bgl1AXmrRjXSWlbMGwm1fJ44Y0tOCZIMobhcYSeW5jOd+1J2ZjGiBnE9mToHZUI
	RJZWLGXCkxVn6cgR9sFSSY2hXOrvvEvBVAKDzi+/53yOSKhwL/DIjHlXVd+UhKEtu4B9/qGB+CF
	e7CTlcw2Hy428fYLjW/EUDoa5Tt/Sg3BXqPuOHzwWBtyi4qKj240Fxu934zdK015hWiiGhGuGmZ
	+u4+niNU/f9BLnbAs6ABx+8ReKPnMUu/guxQ08R3rXA+EmBAWUqB3gwEarz3oAgNrCtzzU0XMnY
	4kEeOq/Q5OUsnjG1CmZ+ea9gUaEsa9ZXm2R101qMCw4XEEER16MpwRuV1L9k8bwRcy1hNaAg19Z
	M2h88QIPxYhhwvJwpzCQfLDa3czj/bD2lrDuReBBNo8yo+TFd2X7mC07VSbp2xjWksHJVm1WlU5
	lVCVmIbnnOVsL8TANAZ6tGkLUEuyrp1jLYt
X-Received: by 2002:a17:90b:4c4e:b0:38e:7297:a92e with SMTP id 98e67ed59e1d1-39d9805da27mr2729392a91.9.1789103051065;
        Thu, 10 Sep 2026 22:04:11 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d99531b16sm2651561a91.14.2026.09.10.22.04.06
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 10 Sep 2026 22:04:10 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Jonathan Corbet <corbet@lwn.net>
Cc: linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-doc@vger.kernel.org,
	Muchun Song <muchun.song@linux.dev>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Qi Zheng <qi.zheng@linux.dev>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH v3 09/11] mm/sparse-vmemmap: drop the extra tail page from device DAX reservation
Date: Fri, 11 Sep 2026 13:02:26 +0800
Message-ID: <20260911050228.58884-10-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260911050228.58884-1-songmuchun@bytedance.com>
References: <20260911050228.58884-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The device DAX vmemmap population still reserves one extra tail vmemmap
page after the head page.

Drop that extra reservation and let the shared tail page cover all tail
vmemmap pages after the head page, so DAX follows the same reservation
model as HugeTLB.

This reduces the reserved vmemmap pages for optimized DAX mappings to
one and removes the now-unneeded first-tail population from the generic
and powerpc paths to simplify the code as well.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Qi Zheng <qi.zheng@linux.dev>
---
v3:
- Collect Acked-by from Qi Zheng
---
 arch/powerpc/mm/book3s64/radix_pgtable.c | 46 ++----------------------
 include/linux/mm.h                       |  3 +-
 mm/mm_init.c                             |  2 +-
 mm/sparse-vmemmap.c                      | 13 ++-----
 4 files changed, 7 insertions(+), 57 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index ee068f24a79f..9ca28e4a610a 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -1218,39 +1218,6 @@ int __meminit radix__vmemmap_populate(unsigned long start, unsigned long end, in
 	return 0;
 }
 
-static pte_t * __meminit radix__vmemmap_populate_address(unsigned long addr, int node,
-							 struct vmem_altmap *altmap,
-							 struct page *reuse)
-{
-	pgd_t *pgd;
-	p4d_t *p4d;
-	pud_t *pud;
-	pmd_t *pmd;
-	pte_t *pte;
-
-	pgd = pgd_offset_k(addr);
-	p4d = p4d_offset(pgd, addr);
-	pud = vmemmap_pud_alloc(p4d, node, addr);
-	if (!pud)
-		return NULL;
-	pmd = vmemmap_pmd_alloc(pud, node, addr);
-	if (!pmd)
-		return NULL;
-	if (pmd_leaf(*pmd))
-		/*
-		 * The second page is mapped as a hugepage due to a nearby request.
-		 * Force our mapping to page size without deduplication
-		 */
-		return NULL;
-	pte = vmemmap_pte_alloc(pmd, node, addr);
-	if (!pte)
-		return NULL;
-	radix__vmemmap_pte_populate(pmd, addr, node, NULL, NULL);
-	vmemmap_verify(pte, node, addr, addr + PAGE_SIZE);
-
-	return pte;
-}
-
 int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
 					      unsigned long start,
 					      unsigned long end, int node,
@@ -1297,7 +1264,7 @@ int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
 		if (!pte_none(*pte)) {
 			/*
 			 * This could be because we already have a compound
-			 * page whose VMEMMAP_RESERVE_NR pages were mapped and
+			 * page whose retained vmemmap page was mapped and
 			 * this request fall in those pages.
 			 */
 			next = addr + PAGE_SIZE;
@@ -1318,16 +1285,7 @@ int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
 					return -ENOMEM;
 				vmemmap_verify(pte, node, addr, addr + PAGE_SIZE);
 
-				/*
-				 * Populate the tail pages vmemmap page
-				 * It can fall in different pmd, hence
-				 * vmemmap_populate_address()
-				 */
-				pte = radix__vmemmap_populate_address(addr + PAGE_SIZE, node, NULL, NULL);
-				if (!pte)
-					return -ENOMEM;
-
-				next = addr + 2 * PAGE_SIZE;
+				next = addr + PAGE_SIZE;
 				continue;
 			}
 
diff --git a/include/linux/mm.h b/include/linux/mm.h
index a2ebe87e7654..969594074fd2 100644
--- a/include/linux/mm.h
+++ b/include/linux/mm.h
@@ -5167,7 +5167,6 @@ static inline void vmem_altmap_free(struct vmem_altmap *altmap,
 }
 #endif
 
-#define VMEMMAP_RESERVE_NR	2
 #ifdef CONFIG_ARCH_WANT_OPTIMIZE_DAX_VMEMMAP
 static inline bool __vmemmap_can_optimize(struct vmem_altmap *altmap,
 					  struct dev_pagemap *pgmap)
@@ -5187,7 +5186,7 @@ static inline bool __vmemmap_can_optimize(struct vmem_altmap *altmap,
 	 * For vmemmap optimization with DAX we need minimum 2 vmemmap
 	 * pages. See layout diagram in Documentation/mm/vmemmap_dedup.rst
 	 */
-	return !altmap && (nr_vmemmap_pages > VMEMMAP_RESERVE_NR);
+	return !altmap && (nr_vmemmap_pages > VMEMMAP_OPTIMIZATION_PAGES);
 }
 /*
  * If we don't have an architecture override, use the generic rule
diff --git a/mm/mm_init.c b/mm/mm_init.c
index efffa8609b85..56bb4567a494 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -1056,7 +1056,7 @@ static inline unsigned long compound_nr_pages(unsigned long pfn,
 	if (!section_vmemmap_optimizable(ms))
 		return pgmap_vmemmap_nr(pgmap);
 
-	return VMEMMAP_RESERVE_NR * (PAGE_SIZE / sizeof(struct page));
+	return VMEMMAP_OPTIMIZATION_PAGES * (PAGE_SIZE / sizeof(struct page));
 }
 
 static void __ref memmap_init_compound(struct page *head,
diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index 7b5b9ceec697..39f0cfeefc6a 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -136,7 +136,6 @@ int __meminit section_nr_vmemmap_pages(unsigned long pfn, unsigned long nr_pages
 {
 	const struct mem_section *ms = __pfn_to_section(pfn);
 	const int order = section_compound_order(ms);
-	const int vmemmap_pages = pgmap ? VMEMMAP_RESERVE_NR : VMEMMAP_OPTIMIZATION_PAGES;
 	const unsigned long pages_per_compound = 1UL << order;
 
 	VM_WARN_ON_ONCE(!IS_ALIGNED(pfn | nr_pages, PAGES_PER_SUBSECTION));
@@ -147,13 +146,13 @@ int __meminit section_nr_vmemmap_pages(unsigned long pfn, unsigned long nr_pages
 
 	if (order < PFN_SECTION_SHIFT) {
 		VM_WARN_ON_ONCE(!IS_ALIGNED(pfn | nr_pages, pages_per_compound));
-		return vmemmap_pages * nr_pages / pages_per_compound;
+		return VMEMMAP_OPTIMIZATION_PAGES * nr_pages / pages_per_compound;
 	}
 
 	VM_WARN_ON_ONCE(!IS_ALIGNED(pfn | nr_pages, PAGES_PER_SECTION));
 
 	if (IS_ALIGNED(pfn, pages_per_compound))
-		return vmemmap_pages;
+		return VMEMMAP_OPTIMIZATION_PAGES;
 
 	return 0;
 }
@@ -521,17 +520,11 @@ static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
 		if (!pte)
 			return -ENOMEM;
 
-		/* Populate the tail pages vmemmap page */
-		next = addr + PAGE_SIZE;
-		pte = vmemmap_populate_address(next, node, NULL, -1, flags);
-		if (!pte)
-			return -ENOMEM;
-
 		/*
 		 * Reuse the shared page for the rest of tail pages
 		 * See layout diagram in Documentation/mm/vmemmap_dedup.rst
 		 */
-		next += PAGE_SIZE;
+		next = addr + PAGE_SIZE;
 		rc = vmemmap_populate_range(next, last, node, NULL,
 					    page_to_pfn(page), flags);
 		if (rc)
-- 
2.54.0

