Received: from mail-pz2-f12.google.com (mail-pz2-f12.google.com [74.125.228.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F78239E178
	for <linux-doc@vger.kernel.org>; Fri, 11 Sep 2026 05:03:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.228.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789103029; cv=none; b=imbWbW9Jul8W+iZ0mNLNHu5P5v0zCFZ9wuRVVPx1O+P5MY2i+EDDeKPng2bp6iSiHdjzyQPdiTAV+QwpdhCDWAhlaCbs1rVKrQDBzcJS30VqEh68dECd4q9zBrJoFo4+ncm4ZdxH5UDgoSlfM3lLc47xmUdgZTumjE8SHOFe1c4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789103029; c=relaxed/simple;
	bh=4C/H0OXURhGuKf+braJ+uKcmMn4yaEgFfA4J4Js2eLc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=iyt09hLb0q6GCLTdXAhPNs4wBnecZ/8PMZMTqiD/RkATzit4fu8c79vMd/sYyKt2JBMAH+sEKbP6QuIbYDn7o4SUfF2q5lqrsltdogyoW55Mnl+Is5o+Z5ShWrEODFIbN2TAMtP5mJh9cUdHeE70qhmGmVUyRQaGyTl0chshl/c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=EId8OT3s; arc=none smtp.client-ip=74.125.228.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="EId8OT3s"
Received: by mail-pz2-f12.google.com with SMTP id 41be03b00d2f7-cc4ae61629fso407475a12.2
        for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2026 22:03:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789103026; x=1789707826; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=jrSUwqa7xtL2ZBs1WlB04Z11tmz781BnHoaaNOznkvI=;
        b=EId8OT3ssGYVFUtSPjUI8PMyYQNJc793KFLxt4iaekVT4POWEWhqq4H/UM7GapqIAR
         ADTGlgJlDbChZb5eOAOS/DedQe/Xy4PJOLtT0A5TnzIHG3onKvtmv0glLdeTqiVqdFAG
         vWmv/0Ui3UCcVmp6nyqoFjqpHYBSpOJhzmwNKBBT9kQ0QckiVw135lxlIQuX3Db3ZWTu
         wAlKXU5IBrpMoKhn8PuS2tCPY7PvfyTTOke1N8803utTO6SPvimdzW8pfg7onWyLsOS7
         7w9wvXH7aAGNuCKrNrupEIoeUdgCC/v+7GXAPeCQ7YaG/KUrdCQGQLNqx2lCuR5BqUcm
         X4Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789103026; x=1789707826;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=jrSUwqa7xtL2ZBs1WlB04Z11tmz781BnHoaaNOznkvI=;
        b=WYkCETq59QkXTp+QVgFBudiNyfBGZlbk8JlTfc0VwuvRsoX77a+Z9aMgSWac7CgDQE
         u3+q3c5QDWJbI3MAyrbifDQQLmgnghku4AH9ZaxPO/adJM3egLWadeffR4Ukg1hdbIsu
         /W+W6hVQbHjhgjrhx8OL27venKdZSJGOplGqO8wyHJ+47gMcuGKFjPyKiSXWjfy0eBeN
         xT+Dee6VtBtmlphV2kQtTsyRODgh8yp6MCHMag5J4eZSYBtBy6UtD6zEnzqPwD1Rogpc
         AT8byP+klTRrrVRB4slXv0FUOTZgFWeF/h6dLIJFctlokuQcLuTtiNLHPav1DBNAs6gc
         GNuQ==
X-Forwarded-Encrypted: i=1; AKwUvBywhhrKdi0uY6fEQuhvDeMG6Y3KATuX3nT718VNvzBO7NTF5PcrTt3MF/QV3ZBlt8U0ceUdtYQLtyI=@vger.kernel.org
X-Gm-Message-State: AFuF++kkEbnUcX4mfUAgnejItmvMy4RzxyLRXvuQWTPD7Ia9nJK9Ft1t
	2SvD2Rsv1F8D4fcNs3hmeaPyeIyZQc1cudshfr5WijqTQN1d7LYBOFy/R0uDqwOP0bw=
X-Gm-Gg: AYBFou3rP1ouI82aCsGHYW+wPEHVJP4SbbrcATzgGyCc2kn6TOdyRr2F4fe8la8+mYi
	8PNeAUE2HynCusPxG8IRXK4Q6GFgdOv+/S1dMiJzIXW/t7zxUuxdgj3j+ZwZNzyikkX4oqSxvxT
	Y2l5yu4HzbcW9RmdQKYVIb9oLcoXaQKRUnQEXYLoG78ovKLMPm6wgRlK51KPZ7TYiag1YCHcc8a
	4ceyTlzVX6CHhbDv0e59HgnnFkflMNrR8qpRCCIxHtsyEnit8SI71JdYkaJ60MtakHeK9yM8U3n
	6mz4bgR778BqTdDH+rOrngacD5iSNrBRm4w4d8k6Q9UHf5OzmQCyx3wDdVfxSjYX/CBaYWnTTRz
	XWcKM8ZlaL/Zbkv7PrlFGCiFOXAIYn9EkfTBSMMLj0LM1qGieHolRPRYyv6HwfjSj+FDqNfVbst
	0XbIE1x0PnSsjH/5uy7bvdJG1LsJVyKpklKbb5OVCpMBwC7rIZobZ40ooEfU8k/SE9jN/ZRqmwK
	Lh24XTxaaAhTNCIAgCflTXC400v7/U9EP53
X-Received: by 2002:a17:90b:390f:b0:38e:bbf1:de3f with SMTP id 98e67ed59e1d1-39d9c0b7047mr3845524a91.12.1789103026376;
        Thu, 10 Sep 2026 22:03:46 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d99531b16sm2651561a91.14.2026.09.10.22.03.41
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 10 Sep 2026 22:03:46 -0700 (PDT)
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
Subject: [PATCH v3 04/11] mm/sparse-vmemmap: prepare DAX vmemmap population for compound page orders
Date: Fri, 11 Sep 2026 13:02:21 +0800
Message-ID: <20260911050228.58884-5-songmuchun@bytedance.com>
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
index 861e09b2b096..aa89c16f7fc7 100644
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
@@ -208,13 +208,17 @@ struct page __ref *vmemmap_shared_tail_page(unsigned int order, struct zone *zon
 }
 
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
@@ -236,7 +240,7 @@ static pte_t * __meminit vmemmap_pte_populate(pmd_t *pmd, unsigned long addr, in
 		pte_t entry;
 
 		if (ptpfn == (unsigned long)-1) {
-			void *p = vmemmap_alloc_pte(pfn, node, altmap);
+			void *p = vmemmap_alloc_pte(pfn, node, altmap, flags);
 
 			if (!p)
 				return NULL;
@@ -251,7 +255,7 @@ static pte_t * __meminit vmemmap_pte_populate(pmd_t *pmd, unsigned long addr, in
 			 * and through vmemmap_populate_compound_pages() when
 			 * slab is available.
 			 */
-			if (flags & VMEMMAP_POPULATE_PAGEREF)
+			if (flags & VMEMMAP_POPULATE_DAX)
 				get_page(pfn_to_page(ptpfn));
 		}
 		entry = pfn_pte(ptpfn, PAGE_KERNEL);
@@ -511,6 +515,7 @@ static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
 	unsigned long size, addr;
 	pte_t *pte;
 	int rc;
+	unsigned long flags = VMEMMAP_POPULATE_DAX;
 
 	if (reuse_compound_section(start_pfn, pgmap)) {
 		pte = compound_section_tail_page(start);
@@ -522,8 +527,7 @@ static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
 		 * with just tail struct pages.
 		 */
 		return vmemmap_populate_range(start, end, node, NULL,
-					      pte_pfn(ptep_get(pte)),
-					      VMEMMAP_POPULATE_PAGEREF);
+					      pte_pfn(ptep_get(pte)), flags);
 	}
 
 	size = min(end - start, pgmap_vmemmap_nr(pgmap) * sizeof(struct page));
@@ -531,13 +535,13 @@ static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
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
 
@@ -547,8 +551,7 @@ static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
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

