Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3C783CAA49
	for <linux-doc@vger.kernel.org>; Mon, 31 Aug 2026 07:55:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788162908; cv=none; b=FLbWap1gNXA5Tg6MF9cHqprZvixcm6OFeE1vyK33PQaW1c05gTC7lgHLKT5jaAx0DtkKeg5DwsSJDMFWfLO0a13YAV7Uq7oO9KREKOvmT0XMk+pHW+s8aUCmRnUno0Y5A371jmLWowxaNkQujbbLLhc33zuW3ei1qYQ4VvQ9YCU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788162908; c=relaxed/simple;
	bh=Vxc/pXcxmB+iFgkrcwmPIqJ1huzGQ8x23bFD3zc2UMc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=ChUbtp5AyyiiWa0L/3xl/myyqK2JiajCkR9AbWKn1H5O8yTwogaMba3K25VbTWP4u+UWz6nuWHOe8WWpO1z55X8ITcQ9DAAA9Z4Xu9kkYwjzzah4bk92V3GqGHg/LdOs2CxeqOZu1pnjKbaOwTi6Bf9B9TGXnA5O7j4YRGrNYDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=GZoX5PrO; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="GZoX5PrO"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-851cbd64814so1337528b3a.1
        for <linux-doc@vger.kernel.org>; Mon, 31 Aug 2026 00:55:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1788162905; x=1788767705; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=l5VVmQasiv9FjgFp8hyWKR9WL3WpfimdUt+OCxubG2c=;
        b=GZoX5PrOPy//UEPS6/+2ocw20SMN1kOhzOIwfTcGXfNj96LwjutBuNoKEymEKKYrlG
         /H+O8Y7KDcuJyCsdMBUjLbK8uFVeu60ZmLcFFZeTBDlOdSKHU5vhbbFI1ZwD/sWCYQ+Q
         UqkEbh7BGBnRCtbpbvpI+DYSzjZG/oPlhOGQ+RqRc16O1bMvYcsLk8JzE4OT1pW+/N96
         cqvvjuTI0Oe1cZPlkOaC70+2e8WOLd/Y4/VPc9jSibpqpOHPh9fuy1ptcF+5M5f6ZELx
         EMESunyA7vVAjHyaTHOXSi//cSCTLbtSUqtIKokGGtY0ysJkSB2EiQk59423ZQkQvefc
         Fg7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788162905; x=1788767705;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=l5VVmQasiv9FjgFp8hyWKR9WL3WpfimdUt+OCxubG2c=;
        b=hDnZ9pKg5Eb1tvttWp6JkfIph8/oU2zrN1+bxx3HO/igmcrZxwLjNpOHm+Z1HIDIqT
         RMdUVhkF+JnYfQBmyyafRkCiJ4ANKFJZBNY9fGL5oITRA475thprAIoqviCwHGZh6p+K
         /zbn7fwThaOtgoL3pzTQNdqPRfwwU4CShGoCIuzx776esRACviZ0nhB4cHuZ824Dbhuc
         Pynu8U2v7stAtU1ZcoeVJWsB94AQrQLKbAS64N82xCyV/wHN+tWYLoSgBgC48hFmZ8ql
         mFYtVeBZ0VkT3ApzKOnVsdE/mTtVUgLoIRj+Y8tsLSsuF2Zw9JePOkwykmP1bfLcRTwg
         hJ4Q==
X-Forwarded-Encrypted: i=1; AHgh+Ro4DoYSP5gkbWjDCOgSNO4vMcZHGliB/wbCzyqiO0y1ykc0tmj7m0ylXpgPZIZuqqbQG++ivczXZx8=@vger.kernel.org
X-Gm-Message-State: AFuF++kClskuxXNRUreAlZiFX5+6q1YG9umK/5xJcBc/9XRQsluX/raH
	j1AV1VE9eFI/WR3FbzuddHsRXpMo+gi1tpVr+hjoAdS9qmnEa2M4a3FsSJInu1nxmUQ=
X-Gm-Gg: AR+sD12BFNTqGUQvmlYF96tZJdi/eO5Bj8p15qCUFrUc0kxKk6cb8yDEFchKSnWI4IU
	frdBO2LPcIIH1VL9XN6rZnpan7xvmRM2kEKREAbaUkKfBbp+woQh2Zk2P27Qszcnfc6rvRXAd5R
	YNaVJRlnw1m6acueOv9g/hz9M/U5nS0B5Te8rutOxOz0rGZiUnyhExglDKfvVjKcHGBaomUOWVU
	kQpCHS2nr1z5P3uCok/ikl68WIBpcTFwkvgsZHRplRjyzuwJ6lglqikA4f5me9b+45SXRaUKjc8
	waYpZrc6QDM7dtila/0KkR8AL2dGE+MjOTaWHsjOmv4bVCUm0uBTxtp5rB2ONVfuwef424BRtjA
	DdYLANuF2Gmje4eu/oR1BV/TjtgICHDAlYpjnfTuho2twTEYN+BBnXY6zEPD2CM0DmcWJxtMB68
	33GDqEP8lanKLnGXyQ9njYi7/DFKmznnptskwwD4e3gYKLDesIDRqn1oZ2knVOaPiuyhgVlkFsM
	e9B564VN16UXe2Ygd+KnXXk
X-Received: by 2002:a05:6a00:c4d1:b0:856:30dd:91ba with SMTP id d2e1a72fcca58-85630dd920dmr21751321b3a.2.1788162905187;
        Mon, 31 Aug 2026 00:55:05 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1f330f88csm3590256a12.10.2026.08.31.00.55.00
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 31 Aug 2026 00:55:04 -0700 (PDT)
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
Subject: [PATCH 08/11] powerpc/mm: switch device DAX to shared tail vmemmap pages
Date: Mon, 31 Aug 2026 15:53:39 +0800
Message-ID: <20260831075342.57563-9-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260831075342.57563-1-songmuchun@bytedance.com>
References: <20260831075342.57563-1-songmuchun@bytedance.com>
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
index cf692b2b5f7b..831c231a4a18 100644
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
+	unsigned int order = pfn_to_section_order(start_pfn);
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

