Received: from mail-pz2-f37.google.com (mail-pz2-f37.google.com [74.125.228.37])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D7450E5AF
	for <linux-doc@vger.kernel.org>; Wed, 30 Sep 2026 14:08:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.37
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790777340; cv=none; b=HA6JPvIp4p71ivk3JD7GUR1B3eb3Kyf8D8bbn5IPSkKh5DhBtbn7/ZPpmOMgFf8YP6aSnAeZLVObSJsmh2xInFzXkIIK+tHmO3tKLZZPleVBnEMBeEBxrJVYwZ51WNEVYDD8iuvTLLqWeSfJZXjjgtX5Dmdqb3JgwfwBJVpEBac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790777340; c=relaxed/simple;
	bh=g4YmSOMQbizjdThG5EAEgVSONOXV8Fc7brqQuUyDI4U=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bv/ImsmO9xQC0/WMyFxr3O1g9DpXntXP/nhXSqr3bPjGUZrNnBqT5OgYmB4p5GqsPj3/1y+1Y69YYHkdX+9ndf3E4A374Jbktv6x2zpv3JKiOI5w9r1k4WUA40N1QyEzpgRkMuY5+wLacfPibVr24VB4KtDk0+QzFEj8AIK2KXU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=KW9l3hqa; arc=none smtp.client-ip=74.125.228.37
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="KW9l3hqa"
Received: by mail-pz2-f37.google.com with SMTP id 41be03b00d2f7-cc7c4c92477so1257933a12.0
        for <linux-doc@vger.kernel.org>; Wed, 30 Sep 2026 07:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1790777312; x=1791382112; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Z9xel/71txHnw7brYLWC7OAspVaWnOG/eiO9DEfyBSY=;
        b=KW9l3hqabaMWqW/fE+w4coeZxECMGoPHlUz4VfZQxuFEgsPFuDT9cmCY3QqbNRWtYc
         psK9Cwb1vJO/Y009tt0pHPOVlCLI5djf4IuhsiEvfT3Ouzsm4O4jn0JrKWVnIzC+64eU
         37AH7Anz/7skC6Uh16fRdxRWjdhhZ9ARPGqc1Noy+F9DXku/OrVIW7OEJKdRW01o9CfN
         ko8lOGCIxkXpVL/pG7C69YtWprq6z6N4TbNFzH0Om1qll79GW9TS23sQ2EaZPIVfmqnn
         KepUG5Nkr5V+6eK0rSnTGqVlhs0t73F/YbpTc6nqJCcGLLHW5RLK0pMQZIc/f6I/JI64
         cbow==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790777312; x=1791382112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Z9xel/71txHnw7brYLWC7OAspVaWnOG/eiO9DEfyBSY=;
        b=FgUckQJEhEfKzIULKTKdM+9yRM0UJCk0nFKVixL8cylvfS9GGn0zGJdt8A9+alqnub
         +9/C71ad3rM8SgoWAjiWoNBN9kScmZwJxIu4D9Kkyrx5LYGB38F1A1SKbCaB/qfDzcO4
         xFq865ZHaazQQ6S0N/NTEjowwh+Qa6Z6NQCu8XOT7PsjBtNsjM85f2mcoVovtXGVPaqS
         cHbPDDfORSjpwxpIreGilyUz45LPihTle8t0V7XlUGLcmoiOHgylYZTGBWM2bvRcmiXP
         drubs4TvgYRM7ihrElh6xzRrjJFodqHlBfOR4qazRUQXM2Qjri2WJj4dedlDVTLNutxc
         3+Vw==
X-Forwarded-Encrypted: i=1; AKwUvBzhxgd7jiPIwmZpvTTZ8Mq6FO9M0gyt4pEJ1SP6wcTlVt/syj9EENB9akPiU2CZuqpOtpnfsYdA+PQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIyzwEI9q6B2AHbfjsUHZ8ISR6MUqBl++798GLvcRQIiHScRVVG
	pgEVZQbNig5k5452l663HEy2enM4Zxaaak+X1rHDTM2lGqoDOSkEHXpzmFfqALkN6Pw=
X-Gm-Gg: AYBFou2zJKYl0DayHulCtCO+YLjUeqz7WQEdkdvQxOJbLYQrz0JTL2x2CUK0DkVlNCL
	kqRTpyivrg4xywYSVwp4zNgxHaB26XMafN1EX2VdC9SvoOw5FhfA3dgYmbGonLWFeuCSyOoyzPQ
	Vx10ZkUeP6l/UNTRpUL6JTI3hrXoIsD+jA1dDNN1Mb4PRzRKEswqrLGJrxl3KNMGz8VUrW2o5Sl
	qFYaDisMS8/Eo/8EacvgnyOLWvzO69/f7n5GR9xeOhe0krkvHYJ2jLvXacd2G9gIyhPox/C/Bfe
	QPzMZtkY6jaGEh2SjKWcMWhqiv91BjSXh5NVoaJZg255Abc5XhUCLcoTwEA1ouCm9QABQ1SOljS
	pVQw0FvCLj3fOdxf8akP7c30EsNznMsYqpam0lEEpJt9ualT1XOThNcLNfTVpWMhSUlQf3aKqwy
	1mbND0ue8uOqzagW+Q2kBStaQWDwrmzdVTSqWXLEpUC/VqocVinxhzE4VZ4Gq427mE/udUm3ZgH
	Kk96ZT+NzR1FguFAg0VRlte
X-Received: by 2002:a17:90b:2e42:b0:3a0:f2c8:9ad6 with SMTP id 98e67ed59e1d1-3a4d193d340mr1404438a91.64.1790777312124;
        Wed, 30 Sep 2026 07:08:32 -0700 (PDT)
Received: from G6L4RL2QG9 ([139.177.225.238])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4e60ea12csm639509a91.1.2026.09.30.07.08.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 30 Sep 2026 07:08:31 -0700 (PDT)
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
	Ritesh Harjani <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Randy Dunlap <rdunlap@infradead.org>,
	Muchun Song <songmuchun@bytedance.com>,
	Lance Yang <lance.yang@linux.dev>
Subject: [PATCH v6 09/12] powerpc/mm: switch device DAX to shared tail vmemmap pages
Date: Wed, 30 Sep 2026 22:06:24 +0800
Message-ID: <20260930140627.57431-10-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260930140627.57431-1-songmuchun@bytedance.com>
References: <20260930140627.57431-1-songmuchun@bytedance.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The powerpc radix compound vmemmap population path still finds a reusable
tail page by walking the vmemmap page tables.

Switch it to the common vmemmap_shared_tail_page() helper instead, so it
can use the shared vmemmap page directly to simplify the code.

This removes the powerpc-specific tail-page lookup and its fallback path
and aligns the device DAX vmemmap optimization path with HugeTLB.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
---
v6:
- Collect Acked-by from David Hildenbrand
---
 arch/powerpc/mm/book3s64/radix_pgtable.c | 80 +++---------------------
 include/linux/vmemmap-optimization.h     |  6 ++
 mm/sparse-vmemmap.c                      |  6 --
 3 files changed, 15 insertions(+), 77 deletions(-)

diff --git a/arch/powerpc/mm/book3s64/radix_pgtable.c b/arch/powerpc/mm/book3s64/radix_pgtable.c
index cf692b2b5f7b..ee068f24a79f 100644
--- a/arch/powerpc/mm/book3s64/radix_pgtable.c
+++ b/arch/powerpc/mm/book3s64/radix_pgtable.c
@@ -19,6 +19,7 @@
 #include <linux/string_helpers.h>
 #include <linux/memory.h>
 #include <linux/kfence.h>
+#include <linux/vmemmap-optimization.h>
 
 #include <asm/pgalloc.h>
 #include <asm/mmu_context.h>
@@ -1250,59 +1251,6 @@ static pte_t * __meminit radix__vmemmap_populate_address(unsigned long addr, int
 	return pte;
 }
 
-static pte_t * __meminit vmemmap_compound_tail_page(unsigned long addr,
-						    unsigned long pfn_offset, int node)
-{
-	pgd_t *pgd;
-	p4d_t *p4d;
-	pud_t *pud;
-	pmd_t *pmd;
-	pte_t *pte;
-	unsigned long map_addr;
-
-	/* the second vmemmap page which we use for duplication */
-	map_addr = addr - pfn_offset * sizeof(struct page) + PAGE_SIZE;
-	pgd = pgd_offset_k(map_addr);
-	p4d = p4d_offset(pgd, map_addr);
-	pud = vmemmap_pud_alloc(p4d, node, map_addr);
-	if (!pud)
-		return NULL;
-	pmd = vmemmap_pmd_alloc(pud, node, map_addr);
-	if (!pmd)
-		return NULL;
-	if (pmd_leaf(*pmd))
-		/*
-		 * The second page is mapped as a hugepage due to a nearby request.
-		 * Force our mapping to page size without deduplication
-		 */
-		return NULL;
-	pte = vmemmap_pte_alloc(pmd, node, map_addr);
-	if (!pte)
-		return NULL;
-	/*
-	 * Check if there exist a mapping to the left
-	 */
-	if (pte_none(*pte)) {
-		/*
-		 * Populate the head page vmemmap page.
-		 * It can fall in different pmd, hence
-		 * vmemmap_populate_address()
-		 */
-		pte = radix__vmemmap_populate_address(map_addr - PAGE_SIZE, node, NULL, NULL);
-		if (!pte)
-			return NULL;
-		/*
-		 * Populate the tail pages vmemmap page
-		 */
-		pte = radix__vmemmap_pte_populate(pmd, map_addr, node, NULL, NULL);
-		if (!pte)
-			return NULL;
-		vmemmap_verify(pte, node, map_addr, map_addr + PAGE_SIZE);
-		return pte;
-	}
-	return pte;
-}
-
 int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
 					      unsigned long start,
 					      unsigned long end, int node,
@@ -1320,6 +1268,12 @@ int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
 	pud_t *pud;
 	pmd_t *pmd;
 	pte_t *pte;
+	struct page *tail_page;
+	unsigned int order = pfn_to_section_compound_order(start_pfn);
+
+	tail_page = vmemmap_shared_tail_page(order, device_zone(node));
+	if (!tail_page)
+		return -ENOMEM;
 
 	for (addr = start; addr < end; addr = next) {
 
@@ -1349,10 +1303,9 @@ int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
 			next = addr + PAGE_SIZE;
 			continue;
 		} else {
-			unsigned long nr_pages = pgmap_vmemmap_nr(pgmap);
+			unsigned long nr_pages = 1UL << order;
 			unsigned long addr_pfn = page_to_pfn((struct page *)addr);
 			unsigned long pfn_offset = addr_pfn - ALIGN_DOWN(addr_pfn, nr_pages);
-			pte_t *tail_page_pte;
 
 			/*
 			 * if the address is aligned to huge page size it is the
@@ -1377,23 +1330,8 @@ int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
 				next = addr + 2 * PAGE_SIZE;
 				continue;
 			}
-			/*
-			 * get the 2nd mapping details
-			 * Also create it if that doesn't exist
-			 */
-			tail_page_pte = vmemmap_compound_tail_page(addr, pfn_offset, node);
-			if (!tail_page_pte) {
-
-				pte = radix__vmemmap_pte_populate(pmd, addr, node, NULL, NULL);
-				if (!pte)
-					return -ENOMEM;
-				vmemmap_verify(pte, node, addr, addr + PAGE_SIZE);
-
-				next = addr + PAGE_SIZE;
-				continue;
-			}
 
-			pte = radix__vmemmap_pte_populate(pmd, addr, node, NULL, pte_page(*tail_page_pte));
+			pte = radix__vmemmap_pte_populate(pmd, addr, node, NULL, tail_page);
 			if (!pte)
 				return -ENOMEM;
 			vmemmap_verify(pte, node, addr, addr + PAGE_SIZE);
diff --git a/include/linux/vmemmap-optimization.h b/include/linux/vmemmap-optimization.h
index bd0974b262a4..fa9e9abd6656 100644
--- a/include/linux/vmemmap-optimization.h
+++ b/include/linux/vmemmap-optimization.h
@@ -83,6 +83,12 @@ static inline unsigned int pfn_to_section_compound_order(unsigned long pfn)
 {
 	return 0;
 }
+
+static inline struct page *vmemmap_shared_tail_page(unsigned int order,
+						    struct zone *zone)
+{
+	return NULL;
+}
 #endif /* CONFIG_VMEMMAP_OPTIMIZATION */
 
 static inline bool vmemmap_optimizable_pfn(unsigned long pfn)
diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index d40a2f5b5fca..e1f8a03e3d49 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -240,12 +240,6 @@ struct page __ref *vmemmap_shared_tail_page(unsigned int order, struct zone *zon
 
 	return page;
 }
-#else
-static inline struct page *vmemmap_shared_tail_page(unsigned int order,
-						    struct zone *zone)
-{
-	return NULL;
-}
 #endif
 
 static __meminit void *vmemmap_alloc_pte(unsigned long pfn, int node,
-- 
2.54.0

