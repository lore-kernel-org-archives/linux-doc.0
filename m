Received: from mail-pj2-f18.google.com (mail-pj2-f18.google.com [74.125.227.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7921A511E89
	for <linux-doc@vger.kernel.org>; Wed, 30 Sep 2026 14:08:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790777318; cv=none; b=ji4G9a+05WFCEkYj3VgIq6zcMUZkUcritpVq7cB0h74nQaIURRc3XMuIr8j5FPffh9s+5Lw3Iuqux208wlJWuhtMro13fodaQM1a7VtVwrl9L/VNP3FRQAQvSw8EUrjuIZNmFEhbqXa5fNMHlo3AXjvud4px5CeuXO0SVSZzTSo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790777318; c=relaxed/simple;
	bh=1AyjrPgQx/nxKqq6UcTsTHWPWznPqAjy5hY1ijksJUw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=T3YBDN87Aqean5B6p4BxWLfiND1g6I+ewaIRwo+VnZ4QB1AH3xIGS4vpJU0LFlbjsdmqsxsQkmNFaD7AA+E8OcE4Zo+iAZySvZ0KaezQaTrWhJGBPeFzyH5i6H+BwFhzVimwHS1bFqcp7HrTsAUu/cZaq8Vue5RCPoWHoj7+S6c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=B3A8VACv; arc=none smtp.client-ip=74.125.227.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="B3A8VACv"
Received: by mail-pj2-f18.google.com with SMTP id 98e67ed59e1d1-3a4c276e1c7so437122a91.0
        for <linux-doc@vger.kernel.org>; Wed, 30 Sep 2026 07:08:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1790777296; x=1791382096; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mwIkzvmvri0jNuEZQ8eiZ6f7IsoamN6cu2j85HlYjLQ=;
        b=B3A8VACvJy6bN+3JoFkK+lshIX+L0O7QeIYS+lRrG+9eU9zEh7qOON6dTcS/F4mTE5
         kVvqq8dV9jmFCUWC8p0a8vMfN0f0MivflyVA25t0G7PYkYGDx5pBhzPqNEFJIuYzjck+
         GLJjMJCyDjDHScg32cpS5nZgDiGlHf6gh/Ts9utfgZHcBP9lAcA5iM/K2f5lgndMT+Rf
         S7Drr+FOG83UvVbMUVBDCjfdoIjeu3SzRPycl++rLy4J/EVTGC4LKeBel7SKeQ3e8sAY
         M+tRWoSUgJjSAA5DiBDzFOg20U3CJHyZ0FVq/qybP7KMS+JkuvBQtQhFz8UAQZd3EHi1
         Cb+w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790777296; x=1791382096;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mwIkzvmvri0jNuEZQ8eiZ6f7IsoamN6cu2j85HlYjLQ=;
        b=Xul6MYpSptnuWqsNR8dj/67xi0wOmxkWvLE203YA+LGBTek8NxuiCKcTRJayMz9aEY
         JIKgK1HY8+T0W2iC9MS+1rBtRcy/v8lbIPH8/F/0pey8Cc3VhTlfqM0P8jybmF+4vCYw
         dvf/GS7IXIRvZDMWCv3nnRt7gX2AFQa4Jz3dyUmhFScFSjMVIxxjVAUG+a4fyLKSgtsG
         G2z54+DaaYHIPtY8k7OSmcMlr51icbCzxZP6uhdmZGpKE549u8XZa9mZmyTwpcxOlqvr
         rNbaVd7pVoey92e7SGxi/Mevdl9G6MwA+qnGQE+LR5ChlKHbxCeZMixUBU/ggjmABJua
         fwdw==
X-Forwarded-Encrypted: i=1; AKwUvByTOL/TS3lJy8foScAjed+YILrDp6EdWpvbs+yNN/NhWMBLQ1S0gSXSqqQ5seuQgMuDOcZ+eygKDaU=@vger.kernel.org
X-Gm-Message-State: AFq9FYJSVgOSd+YDL7gf5YpBWf9TxuyQH3brx9AKYbdG9w3oX+bwa8oN
	y3aMvI0ScI4sUB0J5P6UC5FrduqUdrjwGRjgI52/vtxh8ALrujvqvIg5nayuXI4+u60=
X-Gm-Gg: AYBFou1+8NRvArTfQ/RDhRG8kK3griWAANieqt6PwRJp96TLAzjO62JgARd09af41cC
	LQnHfwhvjiXbctJb7qyAbgWfmd6h4yjb5ghkqP5fbgM9AXirE+2nZQE57C/pnmrvuhhF9Hwj/ju
	ndV6aAbTaR2Ods9KcjsoWHQAOsqYUvNWLB599sZjRgT2VHxmsVvZsHhQaFeATcR6M6gDVhmZ+HN
	ZBk4KcegFbHO2x2cgcknOdp3pt4uCL1ewEmeEda3FJISsVvsHBCK4rxVSsxRmIFOxRH7iluxFsf
	M6/nE2T93towGefclfvWehJE+g+41OZQ3i0WNG9aKxJg55q2Tdr2LpH7QcHnQDtTgtCH4erwbcN
	FMh3gdwb5bsl6FhAyH5U3CaofS64HUGtm8kRj11uhObFKyzg7NZVSwBSVUceELCEivUYSAQjto/
	sxoFIysx/ABCbpELVHOnEH4FRv9QOBy8dSb1A45Xv9eV2CMEQaYS9BHlMaifI3FaspFPNglOUel
	8PXl8Eb9UyEIg==
X-Received: by 2002:a17:90b:4b11:b0:3a0:d79d:b6bf with SMTP id 98e67ed59e1d1-3a4d14de36bmr642331a91.20.1790777295537;
        Wed, 30 Sep 2026 07:08:15 -0700 (PDT)
Received: from G6L4RL2QG9 ([139.177.225.238])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4e60ea12csm639509a91.1.2026.09.30.07.08.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 30 Sep 2026 07:08:14 -0700 (PDT)
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
Subject: [PATCH v6 07/12] mm/sparse-vmemmap: switch device DAX to shared tail vmemmap pages
Date: Wed, 30 Sep 2026 22:06:22 +0800
Message-ID: <20260930140627.57431-8-songmuchun@bytedance.com>
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

HugeTLB vmemmap optimization now uses per-zone shared tail vmemmap pages.
Device DAX has not been switched to that mechanism yet.

Switch device DAX to vmemmap_shared_tail_page() as well. This aligns DAX
with HugeTLB by using the common per-zone shared tail vmemmap page.

The optimization is enabled only for DEV-DAX through pgmap->vmemmap_shift,
which supplies the compound page order recorded in section metadata before
vmemmap population. Unlike FS-DAX, DEV-DAX does not modify tail struct
pages, so sharing them is safe.

Since the shared tail page can now back ZONE_DEVICE vmemmap mappings,
initialize its entries with PG_reserved for device zones. Also skip
poisoning vmemmap-optimizable sections while their struct pages may be
shared.

Each PTE mapping the shared device DAX tail page takes a page reference.
A sufficiently large range could therefore cycle the reference count back
to zero if population were allowed to continue after it became
non-positive. Use try_get_page() so further mappings fail at that point.
The section population error path tears down mappings created for the
failed section, while the warning makes this currently impractical limit
visible.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Qi Zheng <qi.zheng@linux.dev>
---
v6:
- Prevent shared DAX tail-page refcount overflow with try_get_page()
  (suggested by Andrew Morton)
- Make order const and move it to the top of the function (suggested by
  David Hildenbrand)
- Clarify why optimized tail pages must not be poisoned (suggested by
  David Hildenbrand)

v3:
- Move device_zone() after the definition of NODE_DATA() to fix
  non-NUMA builds.
- Update the commit message to describe the compound page order stored
  in section metadata
- Collect Acked-by from Qi Zheng

v2:
- Explain why sharing tail vmemmap pages is safe for DEV-DAX
  (suggested by Qi Zheng)
---
 include/linux/mmzone.h | 10 +++++++
 mm/memory_hotplug.c    |  6 ++--
 mm/sparse-vmemmap.c    | 63 +++++++++++++++++-------------------------
 3 files changed, 40 insertions(+), 39 deletions(-)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index ee9cbaaa63f4..cd68c1904c91 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -2143,11 +2143,21 @@ static inline int online_device_section(const struct mem_section *section)
 
 	return section && ((section->section_mem_map & flags) == flags);
 }
+
+static inline struct zone *device_zone(int nid)
+{
+	return &NODE_DATA(nid)->node_zones[ZONE_DEVICE];
+}
 #else
 static inline int online_device_section(const struct mem_section *section)
 {
 	return 0;
 }
+
+static inline struct zone *device_zone(int nid)
+{
+	return NULL;
+}
 #endif
 
 static inline int online_section_nr(unsigned long nr)
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index b428da66d279..d7a59167bec4 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -43,6 +43,7 @@
 #include "mm_init.h"
 #include "page_alloc.h"
 #include "shuffle.h"
+#include "sparse.h"
 
 enum {
 	MEMMAP_ON_MEMORY_DISABLE = 0,
@@ -554,8 +555,9 @@ void remove_pfn_range_from_zone(struct zone *zone,
 		/* Select all remaining pages up to the next section boundary */
 		cur_nr_pages =
 			min(end_pfn - pfn, SECTION_ALIGN_UP(pfn + 1) - pfn);
-		page_init_poison(pfn_to_page(pfn),
-				 sizeof(struct page) * cur_nr_pages);
+		if (!section_vmemmap_optimizable(__pfn_to_section(pfn)))
+			page_init_poison(pfn_to_page(pfn),
+					 sizeof(struct page) * cur_nr_pages);
 	}
 
 	/*
diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index 26be355aaa37..d40a2f5b5fca 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -225,6 +225,8 @@ struct page __ref *vmemmap_shared_tail_page(unsigned int order, struct zone *zon
 		set_page_node(page, zone_to_nid(zone));
 		set_page_zone(page, zone_idx(zone));
 		prep_compound_tail(page, NULL, order);
+		if (zone_is_zone_device(zone))
+			__SetPageReserved(page);
 	}
 
 	page = virt_to_page(addr);
@@ -288,14 +290,18 @@ static pte_t * __meminit vmemmap_pte_populate(pmd_t *pmd, unsigned long addr, in
 			/*
 			 * When a PTE/PMD entry is freed from the init_mm
 			 * there's a free_pages() call to this page allocated
-			 * above. Thus this get_page() is paired with the
+			 * above. Thus this try_get_page() is paired with the
 			 * put_page_testzero() on the freeing path.
 			 * This can only called by certain ZONE_DEVICE path,
 			 * and through vmemmap_populate_compound_pages() when
 			 * slab is available.
+			 *
+			 * Use try_get_page() to prevent the shared page refcount
+			 * from overflowing.
 			 */
-			if (flags & VMEMMAP_POPULATE_DAX)
-				get_page(pfn_to_page(ptpfn));
+			if ((flags & VMEMMAP_POPULATE_DAX) &&
+			    !try_get_page(pfn_to_page(ptpfn)))
+				return NULL;
 		}
 		entry = pfn_pte(ptpfn, PAGE_KERNEL);
 		set_pte_at(&init_mm, addr, pte, entry);
@@ -529,47 +535,27 @@ static bool __meminit reuse_compound_section(unsigned long start_pfn,
 	return !IS_ALIGNED(offset, nr_pages) && nr_pages > PAGES_PER_SUBSECTION;
 }
 
-static pte_t * __meminit compound_section_tail_page(unsigned long addr)
-{
-	pte_t *pte;
-
-	addr -= PAGE_SIZE;
-
-	/*
-	 * Assuming sections are populated sequentially, the previous section's
-	 * page data can be reused.
-	 */
-	pte = pte_offset_kernel(pmd_off_k(addr), addr);
-	if (!pte)
-		return NULL;
-
-	return pte;
-}
-
 static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
 						     unsigned long start,
 						     unsigned long end, int node,
 						     struct dev_pagemap *pgmap)
 {
 	const unsigned long flags = VMEMMAP_POPULATE_DAX;
+	const unsigned int order = pfn_to_section_compound_order(start_pfn);
 	unsigned long size, addr;
 	pte_t *pte;
+	struct page *page;
 	int rc;
 
-	if (reuse_compound_section(start_pfn, pgmap)) {
-		pte = compound_section_tail_page(start);
-		if (!pte)
-			return -ENOMEM;
+	page = vmemmap_shared_tail_page(order, device_zone(node));
+	if (!page)
+		return -ENOMEM;
 
-		/*
-		 * Reuse the page that was populated in the prior iteration
-		 * with just tail struct pages.
-		 */
+	if (reuse_compound_section(start_pfn, pgmap))
 		return vmemmap_populate_range(start, end, node, NULL,
-					      pte_pfn(ptep_get(pte)), flags);
-	}
+					      page_to_pfn(page), flags);
 
-	size = min(end - start, pgmap_vmemmap_nr(pgmap) * sizeof(struct page));
+	size = min(end - start, (1UL << order) * sizeof(struct page));
 	for (addr = start; addr < end; addr += size) {
 		unsigned long next, last = addr + size;
 
@@ -585,12 +571,12 @@ static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
 			return -ENOMEM;
 
 		/*
-		 * Reuse the previous page for the rest of tail pages
+		 * Reuse the shared page for the rest of tail pages
 		 * See layout diagram in Documentation/mm/vmemmap_dedup.rst
 		 */
 		next += PAGE_SIZE;
 		rc = vmemmap_populate_range(next, last, node, NULL,
-					    pte_pfn(ptep_get(pte)), flags);
+					    page_to_pfn(page), flags);
 		if (rc)
 			return -ENOMEM;
 	}
@@ -922,13 +908,16 @@ int __meminit sparse_add_section(int nid, unsigned long start_pfn,
 	if (IS_ERR(memmap))
 		return PTR_ERR(memmap);
 
+	ms = __nr_to_section(section_nr);
 	/*
-	 * Poison uninitialized struct pages in order to catch invalid flags
-	 * combinations.
+	 * Poison uninitialized struct pages to catch invalid flag combinations.
+	 *
+	 * Tail struct pages in a vmemmap-optimized section are initialized and
+	 * shared during vmemmap population, so they must not be overwritten here.
 	 */
-	page_init_poison(memmap, sizeof(struct page) * nr_pages);
+	if (!section_vmemmap_optimizable(ms))
+		page_init_poison(memmap, sizeof(struct page) * nr_pages);
 
-	ms = __nr_to_section(section_nr);
 	__section_mark_present(ms, section_nr);
 
 	/* Align memmap to section boundary in the subsection case */
-- 
2.54.0

