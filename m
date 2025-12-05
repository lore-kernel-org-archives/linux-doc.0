Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 030FE2F8BD3
	for <linux-doc@vger.kernel.org>; Fri,  5 Dec 2025 19:43:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764963838; cv=none; b=dHgdeWWic4ET0igeTwEjuvmih8Cd2jx3tAbCVI/yKC0f26xvDRHgCcQ40VLu+uuj+V28K+UoSM19CrCoSGu7vSizQQUKtsHvdb8HeUr9juv95oaLG6RA4j9eD9TkE0xAPI3wyN+h1DDH5AdzlB37Q+riG4Q3/nKvHXOPhPVRgCc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764963838; c=relaxed/simple;
	bh=rsAZCC1GicmUXlKf4H8XnwfDPh7I06Agv/cIdYL5d/E=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=bviTnF3uIBlJXo8505oksa2CZlMRF/ahsCEX+QF6xSOlXGGkHh+pB9hJoO7Pvq3JNvc9IsSSR7HdfmjOsX2M2APO+TUcNxqHEQBd7+rzMfa0EOe4snfBllOTd2Vnz98Mkmj8UR3WFxlSjc+lXCBHZ6K8brwv28WGtZdqNeOun4Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=bG8r4+TG; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="bG8r4+TG"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DE8BBC19421;
	Fri,  5 Dec 2025 19:43:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764963837;
	bh=rsAZCC1GicmUXlKf4H8XnwfDPh7I06Agv/cIdYL5d/E=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=bG8r4+TGPBq8JdMI99CGKczNdBPbwqnDzkM39pqwwWU/vnFzi6Bag5ZEpW+u0Jirx
	 zboqNziGq/19qyAZZUCMcYrN7T8E1rAUj3RQXjzLOEAaFuXIu0Wo9tMXlv6/IC6QR8
	 1dwpal2sBw2psuWprfn6rWoV7sqlLfW8CWBpk3JhCuHrLUBI9DJI6CWljrVG93Rf8i
	 OEjJYUoEWxse11M5YQy9mxktK7KpO2f9t6myotcMwsR+CzA1wqdrrUI0qalyhREykG
	 o2d752teuo5arDTstYv7hdM0VB6i6CWZjwlbhbs/YQH7aE8tIvn8zUDvQ683FZMMj4
	 jirSfQpBGmKJQ==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 3A859F40070;
	Fri,  5 Dec 2025 14:43:56 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Fri, 05 Dec 2025 14:43:56 -0500
X-ME-Sender: <xms:_DUzafFcBaG4jPg4D8sbFMOWcqGX8o3my6R4h3xSbt71_PkDbMYL4A>
    <xme:_DUzaduvD2_2xIv1NNnxVlzlkFOmiHLzLY1NnWW2yQD-AxchrgIlakMWkFV3oq2dL
    IclhOjoqBe82OpC06-7FmFgGR3hu7NmcibVgVBkwSkHIwrFDSq5D94>
X-ME-Received: <xmr:_DUzaaZhRwWxCdA19CEbtsX6gwweRvFWjlTExz8NEu1DoJaCmeWVXAvLHhGfAw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdelvdehucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    ephffvvefufffkofgjfhgggfestdekredtredttdenucfhrhhomhepmfhirhihlhcuufhh
    uhhtshgvmhgruhcuoehkrghssehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnh
    ephfdufeejhefhkedtuedvfeevjeffvdfhvedtudfgudffjeefieekleehvdetvdevnecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepkhhirhhilh
    hlodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieduudeivdeiheehqddv
    keeggeegjedvkedqkhgrsheppehkvghrnhgvlhdrohhrghesshhhuhhtvghmohhvrdhnrg
    hmvgdpnhgspghrtghpthhtohepudelpdhmohguvgepshhmthhpohhuthdprhgtphhtthho
    pegrkhhpmheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepmh
    hutghhuhhnrdhsohhngheslhhinhhugidruggvvhdprhgtphhtthhopegurghvihgusehk
    vghrnhgvlhdrohhrghdprhgtphhtthhopehoshgrlhhvrgguohhrsehsuhhsvgdruggvpd
    hrtghpthhtoheprhhpphhtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehvsggrsghk
    rgesshhushgvrdgtiidprhgtphhtthhopehlohhrvghniihordhsthhorghkvghssehorh
    grtghlvgdrtghomhdprhgtphhtthhopeifihhllhihsehinhhfrhgruggvrggurdhorhhg
    pdhrtghpthhtohepiihihiesnhhvihguihgrrdgtohhm
X-ME-Proxy: <xmx:_DUzaVVuHl4NNy7AwcqTu9la-Qmhnw29Y4OuvUp3IahUpwgV5kwYhg>
    <xmx:_DUzacJhF-z7yibzS-YmPhdHp_VfBz6JmXtOpdJm-N_P7AlP79AnOQ>
    <xmx:_DUzaTFJhPf_gFQuVYGTsSidI5GTgHIXZigLo0rCYa0qvNihyBBuTw>
    <xmx:_DUzaRyCMOY1iKosHXX8lJdigAshRIR9QQ-XRbsbyE4Lu38MbtWr8w>
    <xmx:_DUzaQjGEvZq3ITBE7g0TO9w70jezsrMDU-zzQq8pTQ1x74XbKLKeYbX>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Dec 2025 14:43:55 -0500 (EST)
From: Kiryl Shutsemau <kas@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>
Cc: David Hildenbrand <david@kernel.org>,
	Oscar Salvador <osalvador@suse.de>,
	Mike Rapoport <rppt@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Matthew Wilcox <willy@infradead.org>,
	Zi Yan <ziy@nvidia.com>,
	Baoquan He <bhe@redhat.com>,
	Michal Hocko <mhocko@suse.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Usama Arif <usamaarif642@gmail.com>,
	kernel-team@meta.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Kiryl Shutsemau <kas@kernel.org>
Subject: [PATCH 01/11] mm: Change the interface of prep_compound_tail()
Date: Fri,  5 Dec 2025 19:43:37 +0000
Message-ID: <20251205194351.1646318-2-kas@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251205194351.1646318-1-kas@kernel.org>
References: <20251205194351.1646318-1-kas@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Instead of passing down the head page and tail page index, pass the tail
and head pages directly, as well as the order of the compound page.

This is a preparation for changing how the head position is encoded in
the tail page.

Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
---
 include/linux/page-flags.h |  4 +++-
 mm/hugetlb.c               |  8 +++++---
 mm/internal.h              | 11 +++++------
 mm/mm_init.c               |  2 +-
 mm/page_alloc.c            |  2 +-
 5 files changed, 15 insertions(+), 12 deletions(-)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 0091ad1986bf..2c1153dd7e0e 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -865,7 +865,9 @@ static inline bool folio_test_large(const struct folio *folio)
 	return folio_test_head(folio);
 }
 
-static __always_inline void set_compound_head(struct page *page, struct page *head)
+static __always_inline void set_compound_head(struct page *page,
+					      struct page *head,
+					      unsigned int order)
 {
 	WRITE_ONCE(page->compound_head, (unsigned long)head + 1);
 }
diff --git a/mm/hugetlb.c b/mm/hugetlb.c
index 0455119716ec..a55d638975bd 100644
--- a/mm/hugetlb.c
+++ b/mm/hugetlb.c
@@ -3212,6 +3212,7 @@ int __alloc_bootmem_huge_page(struct hstate *h, int nid)
 
 /* Initialize [start_page:end_page_number] tail struct pages of a hugepage */
 static void __init hugetlb_folio_init_tail_vmemmap(struct folio *folio,
+					struct hstate *h,
 					unsigned long start_page_number,
 					unsigned long end_page_number)
 {
@@ -3220,6 +3221,7 @@ static void __init hugetlb_folio_init_tail_vmemmap(struct folio *folio,
 	struct page *page = folio_page(folio, start_page_number);
 	unsigned long head_pfn = folio_pfn(folio);
 	unsigned long pfn, end_pfn = head_pfn + end_page_number;
+	unsigned int order = huge_page_order(h);
 
 	/*
 	 * As we marked all tail pages with memblock_reserved_mark_noinit(),
@@ -3227,7 +3229,7 @@ static void __init hugetlb_folio_init_tail_vmemmap(struct folio *folio,
 	 */
 	for (pfn = head_pfn + start_page_number; pfn < end_pfn; page++, pfn++) {
 		__init_single_page(page, pfn, zone, nid);
-		prep_compound_tail((struct page *)folio, pfn - head_pfn);
+		prep_compound_tail(page, &folio->page, order);
 		set_page_count(page, 0);
 	}
 }
@@ -3247,7 +3249,7 @@ static void __init hugetlb_folio_init_vmemmap(struct folio *folio,
 	__folio_set_head(folio);
 	ret = folio_ref_freeze(folio, 1);
 	VM_BUG_ON(!ret);
-	hugetlb_folio_init_tail_vmemmap(folio, 1, nr_pages);
+	hugetlb_folio_init_tail_vmemmap(folio, h, 1, nr_pages);
 	prep_compound_head((struct page *)folio, huge_page_order(h));
 }
 
@@ -3304,7 +3306,7 @@ static void __init prep_and_add_bootmem_folios(struct hstate *h,
 			 * time as this is early in boot and there should
 			 * be no contention.
 			 */
-			hugetlb_folio_init_tail_vmemmap(folio,
+			hugetlb_folio_init_tail_vmemmap(folio, h,
 					HUGETLB_VMEMMAP_RESERVE_PAGES,
 					pages_per_huge_page(h));
 		}
diff --git a/mm/internal.h b/mm/internal.h
index 1561fc2ff5b8..0355da7cb6df 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -810,13 +810,12 @@ static inline void prep_compound_head(struct page *page, unsigned int order)
 		INIT_LIST_HEAD(&folio->_deferred_list);
 }
 
-static inline void prep_compound_tail(struct page *head, int tail_idx)
+static inline void prep_compound_tail(struct page *tail,
+				      struct page *head, unsigned int order)
 {
-	struct page *p = head + tail_idx;
-
-	p->mapping = TAIL_MAPPING;
-	set_compound_head(p, head);
-	set_page_private(p, 0);
+	tail->mapping = TAIL_MAPPING;
+	set_compound_head(tail, head, order);
+	set_page_private(tail, 0);
 }
 
 void post_alloc_hook(struct page *page, unsigned int order, gfp_t gfp_flags);
diff --git a/mm/mm_init.c b/mm/mm_init.c
index 7712d887b696..87d1e0277318 100644
--- a/mm/mm_init.c
+++ b/mm/mm_init.c
@@ -1102,7 +1102,7 @@ static void __ref memmap_init_compound(struct page *head,
 		struct page *page = pfn_to_page(pfn);
 
 		__init_zone_device_page(page, pfn, zone_idx, nid, pgmap);
-		prep_compound_tail(head, pfn - head_pfn);
+		prep_compound_tail(page, head, order);
 		set_page_count(page, 0);
 	}
 	prep_compound_head(head, order);
diff --git a/mm/page_alloc.c b/mm/page_alloc.c
index ed82ee55e66a..fe77c00c99df 100644
--- a/mm/page_alloc.c
+++ b/mm/page_alloc.c
@@ -717,7 +717,7 @@ void prep_compound_page(struct page *page, unsigned int order)
 
 	__SetPageHead(page);
 	for (i = 1; i < nr_pages; i++)
-		prep_compound_tail(page, i);
+		prep_compound_tail(page + i, page, order);
 
 	prep_compound_head(page, order);
 }
-- 
2.51.2

