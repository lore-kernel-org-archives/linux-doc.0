Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B30B03C9EEE
	for <linux-doc@vger.kernel.org>; Mon, 31 Aug 2026 07:54:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788162898; cv=none; b=Nbch+nJSMLQdSg2aLiYO6M5IHu6USRoxs8V2MiIdtxmL/JI001lPjV9yNA6FO5q1OSaakP/p8GhCIBTPTZL1GfiMG0ykvM3vlwV1z2JnZxkCUQIpHIwp4yo5/8eOAwRdHrQnGaXSh01JPbKyw5PwB+3n1QLYBCWflWIi3WJMaWE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788162898; c=relaxed/simple;
	bh=01t7KBgXm2nUEn5QJqpbkkRv+YguN+ZQDkImEkyxlKY=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=nwSOezsTE5wnZFzCW9swrxj0qvTVsFwC+cRr0nYmskcP6NSIQBGpe8O2lvc2UhNIbCKgUNWgjbdCYgJOjFUOEfc/TYYN6KFh8L04kH8B8G8Y8UKvLXciHLXNlNkIsv0Wzbu1FJpJMwZIsxzGTqANwaOBuDK/Fkp5nb9AyG1aXyE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=lYhd7iKU; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="lYhd7iKU"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-84fa3b14ee1so2825201b3a.0
        for <linux-doc@vger.kernel.org>; Mon, 31 Aug 2026 00:54:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1788162896; x=1788767696; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=RFw62PZ7fKSG6PmMZYyDraeWannjZPtyw6lLCfcFAXM=;
        b=lYhd7iKUPS2I3n+cVUUaAp3KpgZRlpa8Qf6Rfln4oMb7KPYXBK3PNb03S4QLHIh2gC
         zt1WnmPVDk93/01ux/sMB2UOTkjAfQ+mBkKI1kFWyYWABrRssBdEfm1ni/Yfla0iZFeq
         7/yGCKqcyf86Mgi/ATGuu5eQzB/WgF17a+2sE/W7pwS13l/StI5rnJiv7KgPGNO/Z5oL
         aRs4BTXTHc6bNH5GIMrs2Au6NQLU2Zb4hH2dbELhCGN4RYQvRxhmtWoIXgsr3r2A7u06
         yqUTxYs68E2T2FUPwmX+yCM6pOkz9q6bV1nCMeRaEplZtu6jQJA8r5whMinJJb0D0JPG
         jp/g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788162896; x=1788767696;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=RFw62PZ7fKSG6PmMZYyDraeWannjZPtyw6lLCfcFAXM=;
        b=TCH07HJsy4XL3wqaqvD+kznew3w5uFINLnoCEs7okyO3S47u30Tm2bkoIKQOCBCYed
         lHHm3E7+zdkTe8FdXuRS5l0ygmgxJmYMFoMHjggohb1fGcFr9uZoroQQMdkZsHIqFTHq
         1l5XpV0ySBrBgCRO8cFKojYt2DW6XoqNaBiWOJMUTxTHtW5oDcyrmELCNUO4NLVinqtH
         qLRu5w0TaVfx9mjp8+HI3t3sNV/lwGzpItlC57pr2p4SK3lP/5chllMpkIe5DBK+jmLk
         KDR9O21H1/Jy5Nl8rdalvbMB7tzwwMRa/ilnqDviWP6VXQihYz35mbry4PKEGYXSzC9Y
         5+pg==
X-Forwarded-Encrypted: i=1; AHgh+RpBR3gzFVWcyqnl3c/N5uB5FBS/aKEzGUoT6g8Sa+XAG6YdvSiHwHUFZo/szkKPGlb4F1vq6vV7DuY=@vger.kernel.org
X-Gm-Message-State: AFuF++lY50g4pJw7dua9qrMo+jY7IWjzGPq3xc6J/Jv6oAyCjqgRy3kX
	YkwasEdqilKQNTK17UFY4SWnmbzy5w6GvqBNHERBUbAUfyPhYhJQ1LIra2PfidSar3o=
X-Gm-Gg: AR+sD10IqwUDzByOuIINd4jZl0sMh/LJJhu57CZEHPmBkVUhgsFgBHk8etwELlRmVNI
	POu7IjVaJqnKMn85ns98HQsXmD49aCu1GkqSU9jm3xFNZ7xPsyF6dObGWGQxxqlJs9pusCUj1sh
	QJG9eCqQlfRBAh1a7yLAopnyeoEgWi98QIsa/20w1oMrDDCK5AJhvDuMXeedDDmrHlsAsblojwb
	v16frCsa+q+eqCDbSdW8B7hju+sAGu1gjK3ui2PaqgU9xNCX2WPIYzn5A6T0uI0orBJ/RUhuZnH
	gMfKcRip7OYXXt7Ht1ilo41TvUaPL5N5I+xGqEHRqgLP007PMXvwTsVcB99xXTYKCUGi2FShh86
	Bp75RvSJ4MS5Lr1sJlA5j2ITwEFrBYRsU7NNbExvI3NCKEfWk+wafJLLnmhCtC+GHto1JisDKeP
	klvwl6iABNeSMPZ2uwgJE+mVT9fBQUvrNBkEf6RVK9xipIx7EfcHDRiaC+svt5XTqFcRWJlGkYw
	qi/SaG4GYz4CPIc9zJAkJ7L118GTvyx4bA=
X-Received: by 2002:aa7:888a:0:b0:84f:dd30:1890 with SMTP id d2e1a72fcca58-85adb7bdb1dmr2240316b3a.15.1788162896019;
        Mon, 31 Aug 2026 00:54:56 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1f330f88csm3590256a12.10.2026.08.31.00.54.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 31 Aug 2026 00:54:55 -0700 (PDT)
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
Subject: [PATCH 06/11] mm/sparse-vmemmap: switch device DAX to shared tail vmemmap pages
Date: Mon, 31 Aug 2026 15:53:37 +0800
Message-ID: <20260831075342.57563-7-songmuchun@bytedance.com>
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

HugeTLB vmemmap optimization now uses per-zone shared tail vmemmap pages.
Device DAX has not been switched to that mechanism yet.

Switch device DAX to vmemmap_shared_tail_page() as well. This aligns DAX
with HugeTLB by using the common per-zone shared tail vmemmap page.

Since the shared tail page can now back ZONE_DEVICE vmemmap mappings,
initialize its entries with PG_reserved for device zones. Also skip
poisoning vmemmap-optimizable sections while their struct pages may be
shared.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 include/linux/mmzone.h | 10 +++++++++
 mm/memory_hotplug.c    |  5 +++--
 mm/sparse-vmemmap.c    | 47 ++++++++++++++----------------------------
 3 files changed, 28 insertions(+), 34 deletions(-)

diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
index d3778ba976a5..03ed9232f186 100644
--- a/include/linux/mmzone.h
+++ b/include/linux/mmzone.h
@@ -1686,11 +1686,21 @@ static inline bool zone_is_zone_device(const struct zone *zone)
 {
 	return zone_idx(zone) == ZONE_DEVICE;
 }
+
+static inline struct zone *device_zone(int nid)
+{
+	return &NODE_DATA(nid)->node_zones[ZONE_DEVICE];
+}
 #else
 static inline bool zone_is_zone_device(const struct zone *zone)
 {
 	return false;
 }
+
+static inline struct zone *device_zone(int nid)
+{
+	return NULL;
+}
 #endif
 
 /*
diff --git a/mm/memory_hotplug.c b/mm/memory_hotplug.c
index 226ab9cb078a..d28bafb6fd53 100644
--- a/mm/memory_hotplug.c
+++ b/mm/memory_hotplug.c
@@ -554,8 +554,9 @@ void remove_pfn_range_from_zone(struct zone *zone,
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
index aed1e7429daa..0201877a7f80 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -193,6 +193,8 @@ struct page __ref *vmemmap_shared_tail_page(unsigned int order, struct zone *zon
 		set_page_node(page, zone_to_nid(zone));
 		set_page_zone(page, zone_idx(zone));
 		prep_compound_tail(page, NULL, order);
+		if (zone_is_zone_device(zone))
+			__SetPageReserved(page);
 	}
 
 	page = virt_to_page(addr);
@@ -490,23 +492,6 @@ static bool __meminit reuse_compound_section(unsigned long start_pfn,
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
@@ -516,21 +501,18 @@ static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
 	pte_t *pte;
 	int rc;
 	unsigned long flags = VMEMMAP_POPULATE_DAX;
+	struct page *page;
+	unsigned int order = pfn_to_section_order(start_pfn);
 
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
 
@@ -546,12 +528,12 @@ static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
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
@@ -883,13 +865,14 @@ int __meminit sparse_add_section(int nid, unsigned long start_pfn,
 	if (IS_ERR(memmap))
 		return PTR_ERR(memmap);
 
+	ms = __nr_to_section(section_nr);
 	/*
 	 * Poison uninitialized struct pages in order to catch invalid flags
 	 * combinations.
 	 */
-	page_init_poison(memmap, sizeof(struct page) * nr_pages);
+	if (!section_vmemmap_optimizable(ms))
+		page_init_poison(memmap, sizeof(struct page) * nr_pages);
 
-	ms = __nr_to_section(section_nr);
 	__section_mark_present(ms, section_nr);
 
 	/* Align memmap to section boundary in the subsection case */
-- 
2.54.0

