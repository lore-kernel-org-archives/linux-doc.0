Received: from mail-pj2-f41.google.com (mail-pj2-f41.google.com [74.125.227.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 709363B5314
	for <linux-doc@vger.kernel.org>; Sun, 27 Sep 2026 02:55:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790477718; cv=none; b=gVTbkHQ2SlLsAudCi+wrv1D/3WCMMNkolyXhUmmzOuzXfJQ3RsoVo0vFD0xRrrC4lOPItBgBzZ3HneAFL9yIEagLFD/KH4Uqa4JPx9esfOwqwhe/RSeBkfMDzsco/KEceI+Q0urZDEodZdhL7dEZZ8e8qaZ3Bxsy73Gamp+Gmbg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790477718; c=relaxed/simple;
	bh=bryz2dDq9Nby52aDcGSGfsebpkbeGdieGmASuE5PPXE=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=JwioLmEaPGzrJju3fvotf8Wj7ZIMQbBDxhW/pvhv7UT4tePkzWzNbfpn8JKvfkl3e+xvWSSL6pLE3+FFmPF9zuTPE8R/hMaRIIACtjZsXFrJrxS29lSxu7q81JSDSarDBLxbaqc83TWkoBfSWZgK7ZNDIT3caZQVh4n9+ev+uLw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=ccS54Uhg; arc=none smtp.client-ip=74.125.227.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="ccS54Uhg"
Received: by mail-pj2-f41.google.com with SMTP id 98e67ed59e1d1-3a0bcdf41a3so953869a91.2
        for <linux-doc@vger.kernel.org>; Sat, 26 Sep 2026 19:55:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1790477716; x=1791082516; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LUj4I6qYRPvWCdYjNQvAZHgpJ85hBpDlWBdY9AxEym4=;
        b=ccS54Uhg9rUsl5dgjHxtZkmUisaF1ESmBlb0tHwtNdxCrpVerARCRKVRlC2UJ6eU3G
         k6DUF24Nc4kEdysHIbtnjbSGQOpHWclqtdJNSj9AL/UV6dbAS8VVy6aUop2qTAb3zYsb
         Po6vg5pUNjbmL0MRz4Ft5r8MUasGMoC06FTSofax6WulyqMCmv4gWBu4Nm5fPYqP6kPo
         NC/ncZpRCUlzizCcTRv6c8lnUlZeX+nN/V1/PcduJue45AM+sZCLJNDPmggkh8Sd+/Aa
         ZD1ChEVaruuocT/gN3h8MF9y+Jen1TXMuQRjDP3O8ZRnT6UxDpsgl+phrKzUmvuEHRgM
         XnuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790477716; x=1791082516;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LUj4I6qYRPvWCdYjNQvAZHgpJ85hBpDlWBdY9AxEym4=;
        b=QYFDFvdwtVNls4ndC2hCcmsJHkaswF/u36tbFKGb6ca/HzXXX9BQqv5CiM/U0OrAzN
         G+ICQIywQUQkxU4c5moBpPcJ7SE1xShja6LVgHepLGsf4tIoUiuizueMuF8wJcNDWpnW
         SGotx/Gv5OHYpSauE6ZWpLxdDIMIyPS3QlgGK83/f2Zl6EkisyCi1YjH9T6IkE6VmRck
         G24vYLLs10eEg6epR6PJP6PPVTdDQD+jr3XX8cX8AJCTTSSQ6ydZ5B84pk3C0eoXt69U
         EYyMAIzriPQjDgPXMzxhXWF6gIvvyUSFUOCbfze0mNsfuYGpDSJU9i/HWJfrjEB6JZRy
         Ei5g==
X-Forwarded-Encrypted: i=1; AKwUvBxbs2daJZXpVl4WN6A5R2mK50FR9tMi9OZB7g7tathqcwJHMyAHpMmKLFVWGODOnyEjfmieZzOlefY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJec7LB3VyzOPkuNs8YlINgO5KACNbvmyMm2fS2FClGH8JnOEqC
	D16Aq+25RZ5sv1Ed3gLO0gIOd6C86A/sgIYV/xJa3DRHWtbbj0qb00GClDDktjop9FQ=
X-Gm-Gg: AYBFou2JUhk+EwfF07GJ8AJdmKCffz79JGlyceBYEGkIFmKrKVwcXAL2PTr/pPDlE49
	R4FQXAqzys7cPIYttm9z837i7yYcUaEKSANgljkX8xQ7tTVtHI3Ghf3AmSyAMzE5In4LRgz7j2I
	trkyqS0t82nEZ+Oz/cB9gJI0nBSy3xNxjuiNNUEIfnMJh8fNK7ClIo4wZRnYMCcJS0tBKEcl5ho
	uAIE934Ueuen+pxHfgMTi5tBrNi2+Pj9gan21WAD2nTYYdS1yl1p/xY5jGoqKUXY2xLO5REgG/Q
	KlFtMFgsIlt9/buYoiKouu7VscVX1TXHbEcZkA1DU798LawEiHg5h3xC0iMAGMDwV3h3XGcpHyo
	zTvN+XrTJWLuwhnWdqEp4kRv8bJ16oaK+fnF6LvC0fVcVoVwXx9/mtpaC3/hHcLsSQjc4oZNgTA
	gEURCLr2pAM5PXM1aQmLlLMW2KHwFNvWGSlGhmYuW7LAiOLjNcsTVUcOS2XmuZFrpNtQPcN/Ekq
	mwrxIOwgGt8SrwgcI+IYQ==
X-Received: by 2002:a17:90b:3888:b0:3a0:cc33:2287 with SMTP id 98e67ed59e1d1-3a0cc3324ccmr4179593a91.6.1790477715477;
        Sat, 26 Sep 2026 19:55:15 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.102])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b8efb156sm13461377a91.1.2026.09.26.19.55.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 19:55:15 -0700 (PDT)
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
	Muchun Song <songmuchun@bytedance.com>,
	Lance Yang <lance.yang@linux.dev>
Subject: [PATCH v5 05/12] mm/sparse-vmemmap: prepare DAX vmemmap population for compound page orders
Date: Sun, 27 Sep 2026 10:54:34 +0800
Message-ID: <20260927025441.741633-6-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260927025441.741633-1-songmuchun@bytedance.com>
References: <20260927025441.741633-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Device DAX still uses vmemmap_populate_compound_pages() to populate its
compound-page vmemmap mappings. That helper allocates the head and first
tail vmemmap pages explicitly, then reuses the first tail page for the
remaining tail page mappings.

Device DAX is being moved to the section-based vmemmap optimization
infrastructure, but it cannot switch to the generic section-based
population path yet. Once a later patch records the DAX compound page
order in section metadata, DAX head and first-tail PFNs can look
optimizable to the generic helpers as well.

Add a DAX-specific population flag for this transition. It keeps DAX
head/first-tail allocations on the normal vmemmap allocation path, while
preserving the existing page reference for reused DAX tail mappings.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Qi Zheng <qi.zheng@linux.dev>
---
v3:
- Update the subject and commit message to use compound page order
  terminology

v2:
- Collect Acked-by from Qi Zheng
---
 mm/sparse-vmemmap.c | 27 +++++++++++++++------------
 1 file changed, 15 insertions(+), 12 deletions(-)

diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index e4dae98ba7f8..2457ea2c6dca 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -35,8 +35,8 @@
 /*
  * Flags for vmemmap_populate_range and friends.
  */
-/* Get a ref on the head page struct page, for ZONE_DEVICE compound pages */
-#define VMEMMAP_POPULATE_PAGEREF	0x0001
+/* Vmemmap population for ZONE_DEVICE compound pages */
+#define VMEMMAP_POPULATE_DAX		0x0001
 
 #include "internal.h"
 #include "mm_init.h"
@@ -243,13 +243,17 @@ static inline struct page *vmemmap_shared_tail_page(unsigned int order,
 #endif
 
 static __meminit void *vmemmap_alloc_pte(unsigned long pfn, int node,
-					 struct vmem_altmap *altmap)
+		struct vmem_altmap *altmap, unsigned long flags)
 {
 	struct zone *zone;
 	struct page *page;
 	const unsigned int order = pfn_to_section_compound_order(pfn);
 
-	if (!vmemmap_optimizable_pfn(pfn))
+	/*
+	 * Device DAX still relies on vmemmap_populate_compound_pages() for
+	 * head/first-tail allocation and tail-page reuse.
+	 */
+	if (!vmemmap_optimizable_pfn(pfn) || flags & VMEMMAP_POPULATE_DAX)
 		return vmemmap_alloc_block_buf(PAGE_SIZE, node, altmap);
 
 	zone = pfn_to_zone(pfn, node);
@@ -271,7 +275,7 @@ static pte_t * __meminit vmemmap_pte_populate(pmd_t *pmd, unsigned long addr, in
 		pte_t entry;
 
 		if (ptpfn == (unsigned long)-1) {
-			void *p = vmemmap_alloc_pte(pfn, node, altmap);
+			void *p = vmemmap_alloc_pte(pfn, node, altmap, flags);
 
 			if (!p)
 				return NULL;
@@ -286,7 +290,7 @@ static pte_t * __meminit vmemmap_pte_populate(pmd_t *pmd, unsigned long addr, in
 			 * and through vmemmap_populate_compound_pages() when
 			 * slab is available.
 			 */
-			if (flags & VMEMMAP_POPULATE_PAGEREF)
+			if (flags & VMEMMAP_POPULATE_DAX)
 				get_page(pfn_to_page(ptpfn));
 		}
 		entry = pfn_pte(ptpfn, PAGE_KERNEL);
@@ -546,6 +550,7 @@ static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
 	unsigned long size, addr;
 	pte_t *pte;
 	int rc;
+	unsigned long flags = VMEMMAP_POPULATE_DAX;
 
 	if (reuse_compound_section(start_pfn, pgmap)) {
 		pte = compound_section_tail_page(start);
@@ -557,8 +562,7 @@ static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
 		 * with just tail struct pages.
 		 */
 		return vmemmap_populate_range(start, end, node, NULL,
-					      pte_pfn(ptep_get(pte)),
-					      VMEMMAP_POPULATE_PAGEREF);
+					      pte_pfn(ptep_get(pte)), flags);
 	}
 
 	size = min(end - start, pgmap_vmemmap_nr(pgmap) * sizeof(struct page));
@@ -566,13 +570,13 @@ static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
 		unsigned long next, last = addr + size;
 
 		/* Populate the head page vmemmap page */
-		pte = vmemmap_populate_address(addr, node, NULL, -1, 0);
+		pte = vmemmap_populate_address(addr, node, NULL, -1, flags);
 		if (!pte)
 			return -ENOMEM;
 
 		/* Populate the tail pages vmemmap page */
 		next = addr + PAGE_SIZE;
-		pte = vmemmap_populate_address(next, node, NULL, -1, 0);
+		pte = vmemmap_populate_address(next, node, NULL, -1, flags);
 		if (!pte)
 			return -ENOMEM;
 
@@ -582,8 +586,7 @@ static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
 		 */
 		next += PAGE_SIZE;
 		rc = vmemmap_populate_range(next, last, node, NULL,
-					    pte_pfn(ptep_get(pte)),
-					    VMEMMAP_POPULATE_PAGEREF);
+					    pte_pfn(ptep_get(pte)), flags);
 		if (rc)
 			return -ENOMEM;
 	}
-- 
2.54.0

