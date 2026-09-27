Received: from mail-pj2-f43.google.com (mail-pj2-f43.google.com [74.125.227.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A2D0C3AA1B0
	for <linux-doc@vger.kernel.org>; Sun, 27 Sep 2026 02:55:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790477738; cv=none; b=q/FlVx19X4sgO1K0HFIa+EZp9xTyRlYfN0lmNBnEeMveYyGOm8UhwhMUafdO6NetTuU2RyzVJ2/sB4OXKWskQSEB5HX8D+OtI3YHmRVxhyT2w7qE2mUZUJGj5pirT/6EVfJHKlB4huKXzoZTXWicGx0ODFGMtBfhWJ2633Vhxo4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790477738; c=relaxed/simple;
	bh=DGCbCYj0LTTFF5VzjXWjJn/XhTTGzoKZ0wzis9w35AQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=jIfpJWepkZcm2DJmD9nqFe0UmXbc3uEIVC0vkDNdwnSdoonzLqAUB0WQ8OYbI0edUzg2ww95U2cvsG1/KefHv6cdqUuwrbZZZINLT+q5AVWteSQwS79CyrEy0NxTONCIbRGbx9CVGWowDZ+wpNV6P7NbPbqSv/0yITxeUr2vRqk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=kS8nVh4q; arc=none smtp.client-ip=74.125.227.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="kS8nVh4q"
Received: by mail-pj2-f43.google.com with SMTP id 98e67ed59e1d1-396cccbba91so947873a91.1
        for <linux-doc@vger.kernel.org>; Sat, 26 Sep 2026 19:55:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1790477735; x=1791082535; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vDyOFF6NxHUIale2EKP70eICKc/klrg6ENuabN+7zVI=;
        b=kS8nVh4qqAknUhsY+/gq+9qJwy0UERPbfNNNepFfNqM8CtWsZ7JM/RpfbRwIxoocYr
         tgyToLj7cp8ktDaw7vB1M5JjdTVtg2HFujMfT/WHmbCNyVYuyPx4GjuhMFto+jYwZji3
         0awnffh30m4AI87h23OOCs2t+f9g2fryc/Z+OgSRTUwNRP7aJ2TlIR02AwNiNA8EDqN3
         GqlVy7IoP3FIbU6xsVAH+YK6/mwKC2o8FnCJZIo1y64hMZPuweuWVkwvs5AHyM4tyYNp
         TpK9+7jnC95KI0H53u4tFEyi/StZEv6mByZNESEj6vVN1J4QZwVeVSD8v1+QcphhMaX8
         xKWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790477735; x=1791082535;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vDyOFF6NxHUIale2EKP70eICKc/klrg6ENuabN+7zVI=;
        b=dH5AtMl1KoKCEX3myMWn+PZIdpRN39iApmTd6mmCxG+S/BKbzs7BT5WjzEG7P+hLKg
         0fbjZUWG96aRRdvF/1ChuMNe6RsesX8FAQyBbfi4B+jbD0lywXg8TUVQT/tt5pwRZwdv
         EJpH1AGzZ8vhUCqRGzpUxyzkoPOyH4khwgwBe0bdC/yde5TrejrrpQAY6HwTUwwhTXFb
         oRZqJvLmOzdNWZ0VJDIWyKPtHvhOC+brOgafX6NMSawQSVMYmLkOkoaX9w313m7taFMJ
         YBvNhP3shBxOCRrKgN+ArfJg7zbDVHJkC4rezExx22XJ0lcHDmp1egInUKUBk6b7tLxE
         mccw==
X-Forwarded-Encrypted: i=1; AKwUvBza4Y/+5VLnJ0wnHRHbfKd8X3P/TEg9DULsolPGB1YHrrD8SuHdVSoo0wTN3EY7NFB9V7cpZnS7lZI=@vger.kernel.org
X-Gm-Message-State: AFq9FYJhiWt28riMeRMw9rHsXmbVvWDhyon1YtZFCDQ+BoyXHsb1Dkb3
	dnc5vzHYy0bgTr9H+rPBPxpPl3lpDkXPwnvfnnRcwu6Shl2REEouvYWeHVhqrn+GEz0=
X-Gm-Gg: AYBFou3W2/BxMi9viCNrT5Cuf/OhbgOyvkLobSjKNlCu+K0IMjq/LFm0GqlESCVogIh
	aruuroIEA/MrA8kG5/Cpo3OVmefszATjg2+TL9NKtyvWGsK1yB3dDFUU8fxZZO3CVmbYqW6CHPI
	a7dDNqz+ns0ja9rS6szLpH62xaWM0xWNOZSIQFNFA8u4CLqtuhfgnqCm4Xf1RZQYgYvmoGGiCel
	Pc7yDBHPu40Z9Bk5w0rwb3T5Tz2El4GulqmY6EQtrz1jYDCLnX5YEln55KbVG2Wamb79MC4rlRv
	7vD+F9MaNzBmDO9A1yJTVZyzTNGgPs/z/JgVUJpjlqZ5ET9BghuzgyNV6PWlKF43c8QquvpqWcz
	LNLetX6M65HOIF74Tp0aKFcDKp/GmfHDCt11KAVzH+k1ksTIrosInw23v/M9dk/VIGDAdlS42IU
	cNowdZCGJyM4H8WtsJcHAqLP0BXU1yA3PX1AV4c5Flw5dqFzRL6yUqMSxkwlklzXfKA2QQpnhqS
	1J34vbR1QSVZXCVSPfD
X-Received: by 2002:a17:90b:51cb:b0:3a0:516d:9f87 with SMTP id 98e67ed59e1d1-3a0985710a5mr8073880a91.13.1790477734640;
        Sat, 26 Sep 2026 19:55:34 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.102])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a0b8efb156sm13461377a91.1.2026.09.26.19.55.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 26 Sep 2026 19:55:34 -0700 (PDT)
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
Subject: [PATCH v5 09/12] powerpc/mm: switch device DAX to shared tail vmemmap pages
Date: Sun, 27 Sep 2026 10:54:38 +0800
Message-ID: <20260927025441.741633-10-songmuchun@bytedance.com>
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

The powerpc radix compound vmemmap population path still finds a reusable
tail page by walking the vmemmap page tables.

Switch it to the common vmemmap_shared_tail_page() helper instead, so it
can use the shared vmemmap page directly to simplify the code.

This removes the powerpc-specific tail-page lookup and its fallback path
and aligns the device DAX vmemmap optimization path with HugeTLB.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
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
index 2bc78aa053a1..4309f8b626f5 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -236,12 +236,6 @@ struct page __ref *vmemmap_shared_tail_page(unsigned int order, struct zone *zon
 
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

