Received: from mail-pj1-f42.google.com (mail-pj1-f42.google.com [209.85.216.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C2033C9EF0
	for <linux-doc@vger.kernel.org>; Mon, 31 Aug 2026 07:54:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788162895; cv=none; b=TaMMeT6L+7eVbaIw0DZRD35IylcYOIBNq1rTaEyEKK0Yv5Vo3/T9kUZGfsytpCXFnWUt6DrAJdFXBaBf0Xhaxd5g19CORWVG0mDz5vTxWVCLW738vv1w/lckMGrVuIxLxKi3P3njOLD6neIM4UkmSUBRUL7Zij5suiOeWGN3SUI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788162895; c=relaxed/simple;
	bh=Yhk2qT4J6yuXuggajr5zs+V+I0LBgnI5qbnHpBCNQE8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=GDM4QptJT780QtHJkHkbS1nL9COGvmUzRE0TPuwqn6Pu4oGD487PeufVCnHjuTcgJS0WwHMTW0tFwZ+j3mKbVddMabzvEuNPx8x/FUZ20TypcxIOScJtQnglKjzVLMp7pKVGm7Z+YBVRhpPiRfySHnxF04chuZG+cVR+LYPZjQA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=fcPI9HWq; arc=none smtp.client-ip=209.85.216.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="fcPI9HWq"
Received: by mail-pj1-f42.google.com with SMTP id 98e67ed59e1d1-3966791a6eeso3804405a91.3
        for <linux-doc@vger.kernel.org>; Mon, 31 Aug 2026 00:54:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1788162891; x=1788767691; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=d85H49jI1quBgxYs+PQ2R3ebCcg9h4JyI/UtxSGskms=;
        b=fcPI9HWqYXp4dM9ElRdrypDs3QU5JD2kSaGVRfeb9GLY/5dqGftchpwoQ4wioV0NJK
         hYeZwUuH77pRyovM0aPVH6+sORs332Ri9L+XNBL4WqqhoQlYXAMnBZGa+5HnBEKNctMM
         yCvvX2mUbrtKBsKpexI8AlTpP1p6Q2SWtWY/pKbjbzPKAvaspQm+MZjj3qdTpbbDEqVR
         AogoBSfkHezxxlesfuPp0sm7Bl2s8FViLCtporgIIbK7e6WEkoAZwhJ0F+AIfpEDiyhE
         kEM3b07/X2HdSfVq05fnWNhQHyOgVpfC2D6RmhKJ7trNWpfIXUGfc66CuWvyNMLR/KmZ
         jZJw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788162891; x=1788767691;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=d85H49jI1quBgxYs+PQ2R3ebCcg9h4JyI/UtxSGskms=;
        b=UgtJbJ/B5XlDlUhYjwdInxP2s25ANTEJVj6oVxIuNzWD7sqO+dAOfW3CFCqLGObSIc
         j3ZAtXUAyFmRXSaqiPUg8Pv0GmJRJofA+C2/eQ+cfLMFsbQpX6tED3z73ilYxqxtYhMv
         kchcpqh7EgOZRlCSiU4/D2qw0MJ71WZYHKbgoTRrYEnDM70Hnz6EakJUf6Hia+U23UJ3
         /0LcThCef1eLi/+FsKygfxMwhyyr7k1pZNJoQ8j8FQaYYjZUiSnFIA+/ReOfy0RNWJjo
         RMKxsqfW6rba6VRytf72KqBqEN3ikBOjVdKOPsRsPvtqr4s0l47N7MT3t3/A+ItKvWm8
         JBUQ==
X-Forwarded-Encrypted: i=1; AHgh+Rrw5y3oBus9uD06GqMyc+pRN0f3Fno/k1GAqeaNWEb/zDbasFCxMtUT29quXCLuYIRG7re+gBgyfLI=@vger.kernel.org
X-Gm-Message-State: AFuF++mNsUA1AWS8vfh9hB/8+u5G8vVo9B3oQmlhDlDRpjwZDpmEXpMG
	St8nKBmTvPOkIgERv5+AEsI+MRgIst/EEUUVlQMmWjmLpNmZP1hMMz9Z54PV5Xa0hwY=
X-Gm-Gg: AR+sD12siCu5Kvx9cZ6ObR1w3p7rJFJOkCQiDfxjt90vYtOSEykrC94ZOGmSHgxC7/M
	3FlQICKYC4SZRwmYF5GPrPydblEcBa6G5TFWU4crV7q+xuNbcPFzKhlN9b3bJJQAEQOLK0tpwMm
	F9ZkcuhOCvf93jEauHpAYEcwmVGNsaD3vPOkzZ+0V9N32/Nh2JxFilYDm7u0w8ORzKrVWI/pxEl
	0dVdJ18UiM8wXFi+UiJS1JlrA7NbZEOTZZ7j2jzf/2ZUEdRiZyjYIzl2RmIxaj24O5ItcuThpSK
	lr2yXUChr4zg7l/zS+qyrIbiKvXCTvpJBs4NSAf5z1OdKe6zh9vO4hlzYWoYjFCxsdvV+Pry5Y3
	4SXBtzZ0Bhjgk0/TR5DdZmbesl3aBEey4pD4IuriuaGYFa+RMnYsT1vbmkYPiEiuFlEzxUtIH0N
	7wv197JUTcFljpkLpGZY/wRANkqbK1FyeZZCu8zG7B2e91lHpJE++RUQfvA9WBgAV6a/wLQXS3z
	OxDeCTfT5dDjSd7UvwDLk8/
X-Received: by 2002:a05:6300:220d:b0:3cc:faf3:331a with SMTP id adf61e73a8af0-3d2686aa479mr43643171637.10.1788162891372;
        Mon, 31 Aug 2026 00:54:51 -0700 (PDT)
Received: from G6L4RL2QG9.bytedance.net ([61.213.176.9])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cc1f330f88csm3590256a12.10.2026.08.31.00.54.46
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 31 Aug 2026 00:54:50 -0700 (PDT)
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
Subject: [PATCH 05/11] mm/sparse-vmemmap: set section order for device DAX
Date: Mon, 31 Aug 2026 15:53:36 +0800
Message-ID: <20260831075342.57563-6-songmuchun@bytedance.com>
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

Device DAX can use vmemmap optimization only when a full section is
populated with a compound-page geometry. Record that geometry in the
section order before populating the section, so later vmemmap accounting
and population decisions can use the section state directly.

Clear the section order when the section becomes empty again. Also reject
partial additions to a section that already has optimized vmemmap mappings,
because a section cannot safely mix optimized and ordinary vmemmap layouts.

Partial additions continue to use ordinary vmemmap population, so they do
not save vmemmap memory. Such additions are uncommon, and the lost saving
is negligible.

Signed-off-by: Muchun Song <songmuchun@bytedance.com>
---
 mm/mm_init.c        | 13 ++++---------
 mm/sparse-vmemmap.c | 16 ++++++++++++----
 2 files changed, 16 insertions(+), 13 deletions(-)

diff --git a/mm/mm_init.c b/mm/mm_init.c
index 33ff95141adb..c4cd61978ce8 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -1042,16 +1042,11 @@ static void __ref __init_zone_device_page(struct page *page, unsigned long pfn,
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
@@ -1121,7 +1116,7 @@ void __ref memmap_init_zone_device(struct zone *zone,
 			continue;
 
 		memmap_init_compound(page, pfn, zone_idx, nid, pgmap,
-				     compound_nr_pages(pfn, altmap, pgmap));
+				     compound_nr_pages(pfn, pgmap));
 	}
 
 	pageblock_migratetype_init_range(start_pfn, nr_pages, MIGRATE_MOVABLE,
diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
index 54ae8c284324..aed1e7429daa 100644
--- a/mm/sparse-vmemmap.c
+++ b/mm/sparse-vmemmap.c
@@ -135,14 +135,14 @@ int __meminit section_nr_vmemmap_pages(unsigned long pfn, unsigned long nr_pages
 		struct vmem_altmap *altmap, struct dev_pagemap *pgmap)
 {
 	const struct mem_section *ms = __pfn_to_section(pfn);
-	const int order = pgmap ? pgmap->vmemmap_shift : section_order(ms);
+	const int order = section_order(ms);
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
+		section_set_order(ms, 0);
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
+	if (nr_pages < PAGES_PER_SECTION && section_order(ms))
+		return ERR_PTR(-ENOTSUPP);
+
 	if (!ms->usage) {
 		usage = kzalloc(mem_section_usage_size(), GFP_KERNEL);
 		if (!usage)
@@ -830,6 +837,7 @@ static struct page * __meminit section_activate(int nid, unsigned long pfn,
 	if (nr_pages < PAGES_PER_SECTION && early_section(ms))
 		return pfn_to_page(pfn);
 
+	section_set_order_range(pfn, nr_pages, order);
 	memmap = populate_section_memmap(pfn, nr_pages, nid, altmap, pgmap);
 	if (!memmap) {
 		section_deactivate(pfn, nr_pages, altmap, pgmap);
-- 
2.54.0

