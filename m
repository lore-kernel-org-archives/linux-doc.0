Received: from mail-pj2-f38.google.com (mail-pj2-f38.google.com [74.125.227.166])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 99110511E9C
	for <linux-doc@vger.kernel.org>; Wed, 30 Sep 2026 14:08:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.166
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790777308; cv=none; b=KoQpbPiY4mHilUkFHvXn14k8vNU1Xkl6VPqnD8F7gBPlvhdF02mRNF3Fk0Xnx2DxaEk82q1aJ3nbkI+uhXeUtIdtBo/23nOPmH2cXLSAq3jUPp+syNV6tpJ4d7it/YvNkIvS49Ii4T2N+BoJw3euWhUafh0HWx/nQbpYUYKFeYI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790777308; c=relaxed/simple;
	bh=CW794GLq8aYXySJ442CNdXXavTe/+tqC10T7QU9EJ44=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=VI+fIBpTyuvsn1RzLZu/H5wi1GQIE4qQW3ZJciAXkwAxZeRGK61ZHjMmWqmecGexWc9R5OsApE80nwXTKnBCAyQXMD2YqRnuJQKxic5FqidJvmH5DmYArjKHHjwjIgXGiYIOYiOfXXK6R3/9DHeYmYU8Xza7jOOfdV6IuVyIs58=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com; spf=pass smtp.mailfrom=bytedance.com; dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b=ClXOTvsh; arc=none smtp.client-ip=74.125.227.166
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance.com header.i=@bytedance.com header.b="ClXOTvsh"
Received: by mail-pj2-f38.google.com with SMTP id 98e67ed59e1d1-3a4bd597d68so593615a91.2
        for <linux-doc@vger.kernel.org>; Wed, 30 Sep 2026 07:08:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1790777288; x=1791382088; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=u02WzeDH0Bf7WSzC/uPCm2Q+d5VUN+9hTC8v7YtK7B0=;
        b=ClXOTvshkpA2nDgREiPfm4Zr+AG/ihgfXP2WTfgyb1YtnROZMs+LZU97W8cNKI9Gft
         d1YuDUahf2vLMILNzN3wqPDwFcM3DxyCmdx5jZkH7dh5jOo5LThDiHYBNG5JfFCgG27o
         e3xQiX6nOlO1xP0VmWPziLHBsvgvSXqfHu1v2XDj99BNGapU07btC7dLDH46uqPDcyt7
         akApGl/PNCM7htQMyOp8FmO0lwJuYY8HazlW6FGQG7ix1CDDZEbQC3Go15CbpjqQvXw0
         flbzYpdUUiDlqpomAY0U8sCBsVSmRZ1tgSp3td+8LQUZ09HxLsW9XDZ8a5AeYE+U/bu8
         ozGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790777288; x=1791382088;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=u02WzeDH0Bf7WSzC/uPCm2Q+d5VUN+9hTC8v7YtK7B0=;
        b=QuG3PtVltdt/P9ZmYfeKMd1t+S6NN4rg2uLP4FKiVMB53s+JlZ4CBh7cLAqhPlV1lM
         4GT1Nvj/xTYVY3t7d64douWsBeoSewz5SYNgNtTCwkxx4H0sXfeiZnQh4OTWdKJHvPpF
         7DznSIfGbw5LsR/s4ymg9+K1lAkqRu7t0gDFBjf7R9Ag9o5eCo2kG9+LbwPM5i4sjFkS
         ZV62dDwdUMM770MQVllgaw5bLT9PR4A+81zv9GoxhlwUBeKjZpAaqZWweCD1RDhNObSx
         3zi+rLD/xdwKUYrWpwfccPePcQTc1sx1jbJ0b9sFvOp26NLZ5nYCw4Zkohaxd5A1IvWk
         lbqA==
X-Forwarded-Encrypted: i=1; AKwUvBx46uWggUOMuWnIpX7z2wO0qq9XyqUf5u1ppCvAJZNH4LjawfR3eiQOLFeQxCvfYZb9LIxdmEHs4c8=@vger.kernel.org
X-Gm-Message-State: AFq9FYKx/gbv0JJqBBEQnrXUzJY1PJTor2oy3PZR0m3tz8XmrU/6kEDH
	nKPANbe+0Oo52T6Wyle8p5E1ETG0Sa3IHE2hno9t8CQE42dZ15um5qrhJtIHyy6oBUQ=
X-Gm-Gg: AYBFou0Dj3+p7al3Gxi1Kfw3adKpmApuzk1bWNmoBoVEGy2Ns0d0Q9ZtOKSwMZxwrFx
	wZhma5Ikz5v4l5e9UrSy6bjwzXlJiVhjf4Uu3JPxz4O7esIpgzEbIx7kawFCpQXr0ltFb8ywiSR
	0ajPLkJB3f+u+8at8YNtfVB/Umo07nN+c4ZUnkr51BRKAf+801SyxxHc6gGfUs6DvfPGetNvsAE
	IVwuhmCv1t1EDsvsGOF9vZjyVEPAQr0GT6uOTlicNeQvpUGKhsuTRjSnPZzxz/sF9qYG4Bc7kzy
	6IPUDKpy6WeKKiF8eBcLUswDNA/n6A3Rm8xlBDNGvteXhXBopc6Mq4KJilOF5uv6TaaZudqMb4J
	3quPWLxU/2IsVOcs4zeXgXbrXdpYEu74/4sCn3HoXehmS9Hu/zfpoxIGula1UHDhb6jvHoGDim6
	89rkJdUTn0TleNcscPV4jzxG30OpxgQQWyNVyWlIWE8LOvOfYSvYRw0w70bFBx4oOFOCRx1ow4g
	h+nXwRtUW4mOw==
X-Received: by 2002:a17:90b:35cc:b0:3a4:9656:413 with SMTP id 98e67ed59e1d1-3a4d1795eefmr1315479a91.41.1790777287518;
        Wed, 30 Sep 2026 07:08:07 -0700 (PDT)
Received: from G6L4RL2QG9 ([139.177.225.238])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3a4e60ea12csm639509a91.1.2026.09.30.07.07.59
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 30 Sep 2026 07:08:06 -0700 (PDT)
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
Subject: [PATCH v6 06/12] mm/sparse-vmemmap: set compound page order for device DAX
Date: Wed, 30 Sep 2026 22:06:21 +0800
Message-ID: <20260930140627.57431-7-songmuchun@bytedance.com>
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
Acked-by: David Hildenbrand (Arm) <david@kernel.org>
---
v6:
- Collect Acked-by from David Hildenbrand

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
index b4b72f233bf6..26be355aaa37 100644
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
@@ -612,7 +612,7 @@ struct page * __meminit __populate_section_memmap(unsigned long pfn,
 		!IS_ALIGNED(nr_pages, PAGES_PER_SUBSECTION)))
 		return NULL;
 
-	if (vmemmap_can_optimize(altmap, pgmap))
+	if (pgmap && section_vmemmap_optimizable(__pfn_to_section(pfn)))
 		r = vmemmap_populate_compound_pages(pfn, start, end, nid, pgmap);
 	else
 		r = vmemmap_populate(start, end, nid, altmap);
@@ -831,8 +831,10 @@ static void section_deactivate(unsigned long pfn, unsigned long nr_pages,
 	else if (memmap)
 		free_map_bootmem(memmap);
 
-	if (empty)
+	if (empty) {
 		ms->section_mem_map = (unsigned long)NULL;
+		section_set_compound_order(ms, 0);
+	}
 }
 
 static struct page * __meminit section_activate(int nid, unsigned long pfn,
@@ -842,8 +844,13 @@ static struct page * __meminit section_activate(int nid, unsigned long pfn,
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
@@ -869,6 +876,7 @@ static struct page * __meminit section_activate(int nid, unsigned long pfn,
 	if (nr_pages < PAGES_PER_SECTION && early_section(ms))
 		return pfn_to_page(pfn);
 
+	section_set_compound_order_range(pfn, nr_pages, order);
 	memmap = populate_section_memmap(pfn, nr_pages, nid, altmap, pgmap);
 	if (!memmap) {
 		section_deactivate(pfn, nr_pages, altmap, pgmap);
-- 
2.54.0

