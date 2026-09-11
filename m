Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B3DA3A4521
	for <linux-doc@vger.kernel.org>; Fri, 11 Sep 2026 05:04:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789103053; cv=none; b=mcNeGrdHTRQgMJCR0sZhflKzGI+DyNC1SvSgJMQUxd/mz1WylRg0JdfmfXQSQ7qt1UQ2r2emp2a//dNkV/MvEFXun123Mo5WuHEbz+T3mXwyABBCD92ocFfyH/UdRoXVyBC93Fx/9DYe30LFDO4oUrZ8GbqeEpGr5TQFNWd6lYo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789103053; c=relaxed/simple;
	bh=XXJonAu5v5lmenvG0H3fDY0XU6EMxiTGRHxJPTiZN5c=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=lMmdd34LL9vejwLPjBRQUS1ETm1lpJBU9BghqAWmfkI4rTqLxUNXwo4Sr3KjhZj0LLEz35mc1U+iQn88sgD9XASALWC7O4nSMa6i9uHxfSA1Zpt0UhBpWStSB36ibHof49Reohqlw1HU3Td5ILJ3sEIcq3qX+BCg8NfoulFqVcE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=EFkHFbJy; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="EFkHFbJy"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-cc1c73645a1so561176a12.1
        for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2026 22:04:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789103051; x=1789707851; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=TZbZ6WC7vZbHjIhgnid+8T29mCn5dRvITTk6eMnH6Vk=;
        b=EFkHFbJyWQn0LqcjCTjBLEAWLYL2gknAA3f0COLJqMUsJp+7G0D+yTh7L8n+RfzcCy
         n2FnhKZWFoUvNgdTsvbbjfRMFjnJXzXDXk0G8ecZdIp6liL6JjAzpFBi0RkYot4WiH9u
         jFfMEilMDl8dzhPpVcMvz1ydlAxusOb4pXZbte0M4hwS1Eq8aDI0z924O3+vB2Xz0iyR
         5NaoQj5FQBiz9CaQrHC+vwcc5sTOcnXF1rQVBX15lHqtafGo3sfGa/B0odIp9FDBHVzn
         CMKio9v7pdssEYlgWxAH7cPoIYt62CGG0EqWGobYhpABXmuq7DFfVUagMoG/RzAcacrh
         Gvgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789103051; x=1789707851;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=TZbZ6WC7vZbHjIhgnid+8T29mCn5dRvITTk6eMnH6Vk=;
        b=YSKrjwf9SoQtxIzcoIOKmZUkb03M62ld7Xpb+bZE1kPEdKYld2zUGSagK1i2AYAsVP
         cuhz0mF6TYZZ6vV8d35WkdbznVHFhbO6saXIZ1joOdQhFAgMV11hnfuj4092ZYjLXbJL
         kT7I182V1zkGb0OkS2eAyOtIc/o4pNGGHELX5WP+pG8HD2sM+tsSSZ7cPAaGMW3dTR3h
         kdGN3aWW2nGGvQQ5hXiQMsm4rWU4IFRxlrzv4mn2NrOG6uKPkO25hkTysnq7RA7aQJxD
         oxxtALKhCcwdFOBPeuo94i6zmoec4nu3npXTPjWQcGH9wfvgBaAYmtWGY+hdiTZgkdFm
         Uyvw==
X-Forwarded-Encrypted: i=1; AKwUvBzMZFovpXDLvjWrh2U++RLyydRdtqU8DiFuFlkyaHpT89s3xo9Wy/B1/pHwCpRjqkLl3lP+AtfgMVA=@vger.kernel.org
X-Gm-Message-State: AFuF++mxYXyO9SJrIdF49iAAkEayeMVOPNHlx0kds6tqFNDjCsTLJY7f
	avDLMehRgovFFehzPvakjgwJ8DZE2OKZqEmP6JEAzh+ek8zhbhxcAMXW8Znt/jaBOoY=
X-Gm-Gg: AYBFou169gNGiCX3WvKkfCB7KtvukAO2hJxXxhIOKpZHSyhwjSjilUgEzMmkSnaBBCW
	nwUsfzkwW8qjcblXzk4FhqOPMqRdmNJ5SklJUE3YAYmOkSYVJk0xPk9a36agmmCNGqwPBRRoPz6
	Ffbfz6wLL8f79+5ZhfVEkBlAbqcMfK/PMUmpqEH8Fz6G26rzAatjg1L5ZyVf3Wz3uzecQZAzHzX
	/nZ48hkPGCZj6m8WnVdYOVubAzrvYzRzattROA9qukNsx9ob8lKbwTP5FkfiWG502SHZzzyaxYK
	KKovboOlQstOi/eNEJZt3pz9aUT06xF2/C8dJuun5iPN37bD3MbNqtcfUA3Hyc5vWa7OSphvyLM
	iP4S9tnK44RwzSQtQwTdGoqofm15zs4bUdk6B37ssfuxm4WCTPqgjpCura7PMS68FSOlODaXoLK
	tOIC6u3apad5p7gzd1lfEhGhRyH3KiB+Ytm2Ve36tqgejItJxzWpO2IEv+965VeESTvTqsh5AN6
	qG9NC0HgiRHGOisZI+PzKU896bCNgGmEwIu
X-Received: by 2002:a17:90a:fc48:b0:39a:e983:d4bd with SMTP id 98e67ed59e1d1-39d9c3527b5mr3643408a91.24.1789103045863;
        Thu, 10 Sep 2026 22:04:05 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d99531b16sm2651561a91.14.2026.09.10.22.04.01
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 10 Sep 2026 22:04:05 -0700 (PDT)
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
Subject: [PATCH v3 08/11] powerpc/mm: switch device DAX to shared tail vmemmap pages
Date: Fri, 11 Sep 2026 13:02:25 +0800
Message-ID: <20260911050228.58884-9-songmuchun@bytedance.com>
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

The powerpc radix compound vmemmap population path still finds a reusable
tail page by walking the vmemmap page tables.

Switch it to the common vmemmap_shared_tail_page() helper instead, so it
can use the shared vmemmap page directly to simplify the code.

This removes the powerpc-specific tail-page lookup and its fallback path
and aligns the device DAX vmemmap optimization path with HugeTLB.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 arch/powerpc/mm/book3s64/radix_pgtable.c | 80 +++---------------------
 1 file changed, 9 insertions(+), 71 deletions(-)

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
-- 
2.54.0

