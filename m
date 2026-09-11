Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 235D3306B3D
	for <linux-doc@vger.kernel.org>; Fri, 11 Sep 2026 05:03:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789103033; cv=none; b=j7Q8eOYVT4OupB68k9zHwfbM6LgT7R4oUYL3AKkfEFhFRo32UJnVjGBHy+NgjbPq5gWdDId4h8BtWZoJSULPjNmyPGk2LqkASojAT0dpnfk0l39eqxPTDdTK1H4UB4kmEKRqKsesJBsxqqyH6zZWoB3/UdjAHhg1qLgQ6mBKP6E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789103033; c=relaxed/simple;
	bh=q4sE4pbRykd1vhFCtA51ekVFkV6gQ95xL4RRztXC6GQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=PGjbzTyW9hYlQflAzewAf1dpuJCuGLL6alTgl0Gaz0DmTV47a9YiD7ZCWUqt9fcZX5bWzR1w6obHLtAPFY5S/fQfFDAtBJs/Xf2prW0++d1A/dMXvo4JQL/471N/AUvwkZoKiQBRLRjvC0YS6fIR6h0dT4DD+SNjVkzP44g+EL8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=X7rk64k0; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="X7rk64k0"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2d6e954afbdso3342845ad.2
        for <linux-doc@vger.kernel.org>; Thu, 10 Sep 2026 22:03:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1789103031; x=1789707831; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=6sM9zpfll+quDztLFFF0jfXeRCau4il9IJzrgeT16pM=;
        b=X7rk64k0BrCqji/e9/gqOIT/4LWlUxZI/XtJvgPah5bqpAebchlL+ey4lztPs5r7RL
         HB2yp1afNCL69uocoQFLPPpGT8kU7oUuhoV5KbH5WTX6hyg17LNhw/VTf3HfBWtGNQ91
         6BrvQMRHrm6kSLPAmNIDpLVYq2o+m/q9lUixmH+aWJHxDJe/5I78kND/fM97LAwebpNx
         2V2xANSVN1pC6i54FItRGqjV9O/OiTiYlEkswNCqze3o9seWh3pPvaFyptZDfhZ2Nkow
         3dok0A5LSovEJuALUy0GMBsp2W0JexZAI1fmmQD649KkRa3SCjCfoADeYjJrV07MiaZI
         1nHQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1789103031; x=1789707831;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=6sM9zpfll+quDztLFFF0jfXeRCau4il9IJzrgeT16pM=;
        b=Qlk1eq/URafo30KdRLcXB+IW0RhsfSFhqXq3iIOX4MMVngqnTbab7jxuv/Gc+E8ji3
         30AOrypm7ZVDf8kKslgWBDKW7uKpJoGp2OFbtiFQiW/mV/3M2TW085JEbfEJoXp0mKAW
         vxfPH2dQFwbUYVl9o0m545hHFRxoVwcWbdxmMngTI6KLyOI4eCm0rnJ020753RCudIml
         ehEUN7o8KRFIW25jRMe68a2k7z4vs4MzdACinhdTXk1QMAaqS3e4LW/U//L7ciWtDlAg
         Cr11yQ20kmh5LzCqo6C8tuplqZ9NNG+rKGGL8+gvE/vfC44CDBKxqAMHM/LC44KQcTSZ
         yL+Q==
X-Forwarded-Encrypted: i=1; AKwUvBzs9VyqxCvGAcSitGJW/mnYecxIIc4n208wnjNgoHv9KQ3x0ouqXL8A3CPKyQ2bTrS1pkn5h/lOJCg=@vger.kernel.org
X-Gm-Message-State: AFuF++lgvAQUHaMMW9JYvUlxQfgVKm58NX4v8JgRhDvIbCmxJDdBtcdN
	hiTP9cV0Q4HdSOpi7KkfN6Cv+RbDHXHg+r/FB7z2qMtaDVy8LTNU15ouC6pY6UbJuLA=
X-Gm-Gg: AYBFou1CA4Y+Q2PDzD9lLTUxLtJi2HuV0OBvX4YHL5tFJTY07/TNEuHS9o/mpYmLgaE
	s754jUHZFbESD5b3HCCEas2gVPlT1by5C+6F/N4/cdR+nyKut3DSXJlRnJahTYSYQTzFPtBuuP2
	/H+1etFo9HpR8jDab0RKqHaE7xeN80eaatnHUfcK9Ytf3gWCHTZ9v0JJ+5HloG93ONpCrCgANbp
	7Da0lmZFQ2x715+KjKlQ/5HygMKnoHGF6CQ+zxMqdn5tyHYYK6Yq2Tn3IU2vuYls0a90w2+pHSd
	0OAZeNqOBR3NMqjbzyJvb6ekosAvOCIOlPrqoORMwC46Z0iSNxNlhfWjzCeAtTFvZbzazNGk6lF
	pB0jQ/NYK0jFbb4Chh+G8+hSXhpcAeruhkeJLw6+yVPItI9OzFNamU9iy/EyNfk6CKvRWWhPg6x
	kZsplQZC0TxLs+fNn1VgqglpUsamnSjSECo58yWhZxQqQlmjr+Oy8RFwLE4WPK8fPs3lrfm4ka4
	3sr6yfo84yXRf80WjSld0QQcisBPKhxXhg1
X-Received: by 2002:a17:90b:2b43:b0:398:a2a3:b631 with SMTP id 98e67ed59e1d1-39d9c21f8c9mr4085781a91.19.1789103031225;
        Thu, 10 Sep 2026 22:03:51 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.11])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-39d99531b16sm2651561a91.14.2026.09.10.22.03.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 10 Sep 2026 22:03:50 -0700 (PDT)
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
Subject: [PATCH v3 05/11] mm/sparse-vmemmap: set compound page order for device DAX
Date: Fri, 11 Sep 2026 13:02:22 +0800
Message-ID: <20260911050228.58884-6-songmuchun@bytedance.com>
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

Device DAX can use vmemmap optimization only when a full section is
populated with a compound-page geometry. Record that geometry as the
compound page order in section metadata before populating the section, so
later vmemmap accounting and population decisions can use the section state
directly.

Clear the compound page order when the section becomes empty again. Also
reject partial additions to a section that already has optimized vmemmap
mappings. compound_nr_pages() determines how many struct pages to
initialize with a section as the smallest granularity. A section therefore
cannot safely mix optimized and ordinary vmemmap layouts.

Partial additions continue to use ordinary vmemmap population, so they do
not save vmemmap memory. Such additions are uncommon, and the lost saving
is negligible.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
Acked-by: Qi Zheng <qi.zheng@linux.dev>
---
v3:
- Update the subject and commit message to use compound page order
  terminology
- Use EOPNOTSUPP instead of ENOTSUPP

v2:
- Explain why optimized and ordinary layouts cannot share a section
  (suggested by Qi Zheng)
- Collect Acked-by from Qi Zheng
---
 mm/mm_init.c        | 15 +++++----------
 mm/sparse-vmemmap.c | 16 ++++++++++++----
 2 files changed, 17 insertions(+), 14 deletions(-)

diff --git a/mm/mm_init.c b/mm/mm_init.c
index 97e0158d2aca..efffa8609b85 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -1049,16 +1049,11 @@ static void zone_device_page_init_from_template(struct page *page,
  * of an altmap. See vmemmap_populate_compound_pages().
  */
 static inline unsigned long compound_nr_pages(unsigned long pfn,
-					      struct vmem_altmap *altmap,
 					      struct dev_pagemap *pgmap)
 {
-	/*
-	 * If DAX memory is hot-plugged into an unoccupied subsection
-	 * of an early section, the unoptimized boot memmap is reused.
-	 * See section_activate().
-	 */
-	if (early_section(__pfn_to_section(pfn)) ||
-	    !vmemmap_can_optimize(altmap, pgmap))
+	const struct mem_section *ms = __pfn_to_section(pfn);
+
+	if (!section_vmemmap_optimizable(ms))
 		return pgmap_vmemmap_nr(pgmap);
 
 	return VMEMMAP_RESERVE_NR * (PAGE_SIZE / sizeof(struct page));
@@ -1144,7 +1139,7 @@ void __ref memmap_init_zone_device(struct zone *zone,
 	memcpy(&template, page, sizeof(*page));
 	if (pfns_per_compound != 1)
 		memmap_init_compound(page, pfn, zone_idx, nid, pgmap,
-				     compound_nr_pages(pfn, altmap, pgmap));
+				     compound_nr_pages(pfn, pgmap));
 	pfn += pfns_per_compound;
 
 	/* Initialize the remaining head pages from template. */
@@ -1160,7 +1155,7 @@ void __ref memmap_init_zone_device(struct zone *zone,
 			continue;
 
 		memmap_init_compound(page, pfn, zone_idx, nid, pgmap,
-				     compound_nr_pages(pfn, altmap, pgmap));
+				     compound_nr_pages(pfn, pgmap));
 	}
 
 	pageblock_migratetype_init_range(start_pfn, nr_pages, MIGRATE_MOVABLE,
diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index aa89c16f7fc7..02da1321197d 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -135,14 +135,14 @@ int __meminit section_nr_vmemmap_pages(unsigned long pfn, unsigned long nr_pages
 		struct vmem_altmap *altmap, struct dev_pagemap *pgmap)
 {
 	const struct mem_section *ms = __pfn_to_section(pfn);
-	const int order = pgmap ? pgmap->vmemmap_shift : section_compound_order(ms);
+	const int order = section_compound_order(ms);
 	const int vmemmap_pages = pgmap ? VMEMMAP_RESERVE_NR : VMEMMAP_OPTIMIZATION_PAGES;
 	const unsigned long pages_per_compound = 1UL << order;
 
 	VM_WARN_ON_ONCE(!IS_ALIGNED(pfn | nr_pages, PAGES_PER_SUBSECTION));
 	VM_WARN_ON_ONCE(nr_pages > PAGES_PER_SECTION);
 
-	if (!vmemmap_can_optimize(altmap, pgmap) && !section_vmemmap_optimizable(ms))
+	if (!section_vmemmap_optimizable(ms))
 		return DIV_ROUND_UP(nr_pages * sizeof(struct page), PAGE_SIZE);
 
 	if (order < PFN_SECTION_SHIFT) {
@@ -573,7 +573,7 @@ struct page * __meminit __populate_section_memmap(unsigned long pfn,
 		!IS_ALIGNED(nr_pages, PAGES_PER_SUBSECTION)))
 		return NULL;
 
-	if (vmemmap_can_optimize(altmap, pgmap))
+	if (pgmap && section_vmemmap_optimizable(__pfn_to_section(pfn)))
 		r = vmemmap_populate_compound_pages(pfn, start, end, nid, pgmap);
 	else
 		r = vmemmap_populate(start, end, nid, altmap);
@@ -792,8 +792,10 @@ static void section_deactivate(unsigned long pfn, unsigned long nr_pages,
 	else if (memmap)
 		free_map_bootmem(memmap);
 
-	if (empty)
+	if (empty) {
 		ms->section_mem_map = (unsigned long)NULL;
+		section_set_compound_order(ms, 0);
+	}
 }
 
 static struct page * __meminit section_activate(int nid, unsigned long pfn,
@@ -803,8 +805,13 @@ static struct page * __meminit section_activate(int nid, unsigned long pfn,
 	struct mem_section *ms = __pfn_to_section(pfn);
 	struct mem_section_usage *usage = NULL;
 	struct page *memmap;
+	unsigned int order;
 	int rc;
 
+	order = vmemmap_can_optimize(altmap, pgmap) ? pgmap->vmemmap_shift : 0;
+	if (nr_pages < PAGES_PER_SECTION && section_compound_order(ms))
+		return ERR_PTR(-EOPNOTSUPP);
+
 	if (!ms->usage) {
 		usage = kzalloc(mem_section_usage_size(), GFP_KERNEL);
 		if (!usage)
@@ -830,6 +837,7 @@ static struct page * __meminit section_activate(int nid, unsigned long pfn,
 	if (nr_pages < PAGES_PER_SECTION && early_section(ms))
 		return pfn_to_page(pfn);
 
+	section_set_compound_order_range(pfn, nr_pages, order);
 	memmap = populate_section_memmap(pfn, nr_pages, nid, altmap, pgmap);
 	if (!memmap) {
 		section_deactivate(pfn, nr_pages, altmap, pgmap);
-- 
2.54.0

