Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9299430E85D
	for <linux-doc@vger.kernel.org>; Tue,  8 Sep 2026 03:04:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788836682; cv=none; b=dwioZdI/Qx/OChsBiG3XwZKzkWafotu4xYT1938sXJi3AaCd1QCDA5lwLCALfP1IO4XNtD6g//QeKHxIbH3UC2HSKsmzZPMeFQdjiaQc3L0a11CeFlOEbVHnfi6wLekvo/7r/iNBbz9fjnYLeAIX2BSRbFt1VFLMf1zabUZmB80=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788836682; c=relaxed/simple;
	bh=gtGPqvfkgJXa2d045dU4tvwglGiVXOWcJDVT4mIHLzU=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=AvGLDNdnAhvEsjcjlvUqOLoNZcYdvjHjKxwYHtlb+QnRQL2OYyw+nP+FSG+MNwYLEt300LmW9I0cdvg/dfVTN6YKQypfhCbcNGZvl0a7mImnXy/N+i5q3xSr6x4DtMTRe+Ot1aljN+nTnkX4veW4F0LnGMNlMqbN/iQrrb4E3eQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=CF9EQOPF; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="CF9EQOPF"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-862815e2683so2525324b3a.2
        for <linux-doc@vger.kernel.org>; Mon, 07 Sep 2026 20:04:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1788836680; x=1789441480; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=wfKr3rCUX839N8PLHteC+GkG6En7LO38FWq77XHuH2Y=;
        b=CF9EQOPFzWd/lfo4G7zW6j3t8tVX397cTn+xqHuGxIE5PgNmWa98su+XIVpY6elH74
         im346FpKbuM5bQEtDpuvX9RV8CsXkviCsb9/W9G2NMiF+/oUBs1Fr1tNvdNWA/jHQN7x
         rsJ9DWBJpcmNtJOU1XKc74UEhOWmVLkkWK9qpQNyVB9xs2lnODThkS0Ctdl3q199khOY
         8kVZJIdoAOG4CUCcNLoNVfSgjr7zVArhZru5+DgszPJkw0Dh8zsunKk2MWs9FWTM4NXj
         r5wznQDVkJxaWeCi5jpXgQBfB4I5yjj7i1h/FCReMk8YTRVN2S0GJEP8B8u9WxGXiNFN
         cQxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788836680; x=1789441480;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=wfKr3rCUX839N8PLHteC+GkG6En7LO38FWq77XHuH2Y=;
        b=LIxuL9xxqDkkVHEfezQSSYJPMnuRPy7Rta6QYsAS1eNBZ7vWViOmSlzwG2xO6qTdxy
         V0Yg8gYUmKCLOYPqQFMQMHDXq4VTFbc4uye1RLqhzQwsovCJajUA6ryvhqwFq1o3K2M2
         4m8dEMb8UhPqCS3J9OqER44qKyAoDqiVm41B9GItxCOzYVHcBS30SB0rXXcZ2G/avNZS
         R1GRZbGzxP0f9JFK3W8c1N3jQF4AWlm6+gCNOUtzQXb7MIdtqOfacivM8AJd795MV7Me
         VRTjKBiWTgCbhVnEnuw0JzT7Ft4QaHBZqaIitypz6EaNP/3RMiponUIb9CzJsyswONmD
         Touw==
X-Forwarded-Encrypted: i=1; AKwUvBzrOFsijeOU/Mg3HzvZI1/8nnyFR06D7Jg8H0QqbppAWHnLOUCHpe6WogPTuOSUOJx/S/P9esxsAeA=@vger.kernel.org
X-Gm-Message-State: AFuF++mOXams5JGYYZcsBhnx0tiMmnAB/TLw7M1qVWO0yu2o3JNwpRBG
	2RoipXjjDolfZCvACYg88od/rnFFFO21+ZMYV96DSheqrZC8G72DhSNUNQ0PNVSbrjY=
X-Gm-Gg: AYBFou3gq3GbTha+mOd/eQgt6aFkrd4jUM5q2hcsNVFBIW5F6XWRcKDyes3uhtMXiP9
	JH0ySCjF/bD72Jo14+CMxFe4wlv39twVYer0fHDh1Qy9BLDe9WG8VxnTaB6kInRUCXZkqnd+Vs1
	/SuGW95LD2vP7wdb99amfDs580FsmXBFVYlfyhQuywVmeiluAYcClH77ixU72ZbPmmsO0/nDVee
	WtjONVN46e3cBGhitGfle4CWZzIJxvjf5iq67x3FuWQJ6KXQC/es3w3TXKpm/2H04TbTb0OZAic
	bQOo2OQcYiOqjKYkoKaTP1qjrIPyAOSCzakYapTLraNqknn04YFOqdKxZ6gRB1FACUqktznJy/C
	HpyzzXn/8HcTXtcEC0aUvDg7+ITNMV/wvEcHsu1SsZ4paeWI1MxzQ5jFRNbF8pDsczGLsEMumtD
	fs0cyDXR1LLJvjy/7ryodMqNlss7nAOuwXzoJPso4WjMNhyuHvYUrwjr1590sBjls9hkMzjTBQX
	3qDXac6i2UgYDdNeIsXV6TE
X-Received: by 2002:a05:6a00:4f81:b0:845:3033:6cb7 with SMTP id d2e1a72fcca58-86166bc01c9mr34022528b3a.9.1788836679806;
        Mon, 07 Sep 2026 20:04:39 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.9])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-86152a358a2sm4868234b3a.29.2026.09.07.20.04.35
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 07 Sep 2026 20:04:39 -0700 (PDT)
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
Subject: [PATCH v2 09/11] mm/sparse-vmemmap: drop the extra tail page from device DAX reservation
Date: Tue,  8 Sep 2026 11:03:33 +0800
Message-ID: <20260908030335.96549-10-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260908030335.96549-1-songmuchun@bytedance.com>
References: <20260908030335.96549-1-songmuchun@bytedance.com>
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
---
 arch/powerpc/mm/book3s64/radix_pgtable.c | 46 ++----------------------
 include/linux/mm.h                       |  3 +-
 mm/mm_init.c                             |  2 +-
 mm/sparse-vmemmap.c                      | 13 ++-----
 4 files changed, 7 insertions(+), 57 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index 831c231a4a18..e7e751c48dd2 100644
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
index 7a2e58d631c2..629420a83891 100644
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
index 0201877a7f80..e655d9d1348f 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -136,7 +136,6 @@ int __meminit section_nr_vmemmap_pages(unsigned long pfn, unsigned long nr_pages
 {
 	const struct mem_section *ms = __pfn_to_section(pfn);
 	const int order = section_order(ms);
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

