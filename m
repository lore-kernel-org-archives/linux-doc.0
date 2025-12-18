Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C538833C1A5
	for <linux-doc@vger.kernel.org>; Thu, 18 Dec 2025 15:09:59 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766070599; cv=none; b=Jle3GF9pO2i7iP07u/XZMXTbxWvhq61xyxzyDAZMic34bQd2QnpsGyjOZWs4xA41H/2XM8l3RmM9cC2odRHunJmaD1kbXEWInB23EgCI0v8tfALViJFBUwzsP9/JIs0n7cshzLRuLYZEX89KkB+Z06IKwcNTytZdl7ry9eK6kGY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766070599; c=relaxed/simple;
	bh=K9GBlBtYpSZXuseHmhW2j1ffiV/Lm8i046/4kaLeIKQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qKeIGdhCciE2STm9xfjjuTYNNH23x5NOfPz0Rk6n8BhYcWuM6NFDAvu7xLZ8mY3DtyH7iFOyzF6HaetNibSRDbgXeNvlsYa05pgROdK12+e9pxuFL2ppz0ImHt/hMKDWCqqqtC/FbM9iZEuOqu5zu6WVFtY5YztPRRQgL057d2g=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Kia1AatV; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Kia1AatV"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BDCA6C4AF09;
	Thu, 18 Dec 2025 15:09:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766070599;
	bh=K9GBlBtYpSZXuseHmhW2j1ffiV/Lm8i046/4kaLeIKQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Kia1AatVxZOsB20/SxEWErcPFd9EHhiAYUqqkkoAh0P9S8BdqkFQi5nGpKlkgwpnV
	 VzF6uMsQ+Am22gEnOMKBrlWqbjdQIyBzQoXyr/T4M3IUctQcaUvqOoJ/Ik/NqG9ZG8
	 HpQqszWX9JArH7DKIcLR5mEpkn0CnRlGOf6BcfM02rA0EQYjc5ijFwKeUMHap2bYQY
	 Ej/+1w7EG1fPAslfD5bYxRztYAzsTg4YiGoj/ReiR6yFdh9Tb2TWgLSQ1OSIAguaCf
	 dz+9mkj4Jx3zEpvmnKVqugyZIcxqYv/+ORsw4uFKlIVBHIlG+vqD6oxoRcgVlLkTfm
	 g2VgC+ZHLc1RA==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 14C63F40072;
	Thu, 18 Dec 2025 10:09:58 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Thu, 18 Dec 2025 10:09:58 -0500
X-ME-Sender: <xms:RhlEadXExsBizzWcFUrmGmbiK65pUlI8j1H0ax2s_sor-Pq7jsdyNg>
    <xme:RhlEac1ki_iuIXQJLBO_RyBu8KAKjkDvVx80E1t9rJMjgkxExS-TFFaaveh_VBaGt
    wEtjMX9iiWz_yWc15batORPEg5w4NNL58hHw98l4u-XaOpI9VNAv3s>
X-ME-Received: <xmr:RhlEacMNRd2fWU-zo6voeYRwclawpgMci7fjMT5iVdcMT5F60A33gsGSnBmOcg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdegheejgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffojghfggfgsedtkeertdertddtnecuhfhrohhmpefmihhrhihlucfu
    hhhuthhsvghmrghuuceokhgrsheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrh
    hnpefhudefjeehhfektdeuvdefveejffdvhfevtddugfduffejfeeikeelhedvtedvveen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehkihhrih
    hllhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqudeiudduiedvieehhedq
    vdekgeeggeejvdekqdhkrghspeepkhgvrhhnvghlrdhorhhgsehshhhuthgvmhhovhdrnh
    grmhgvpdhnsggprhgtphhtthhopedvtddpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    oheprghkphhmsehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhope
    hmuhgthhhunhdrshhonhhgsehlihhnuhigrdguvghvpdhrtghpthhtohepuggrvhhiuges
    khgvrhhnvghlrdhorhhgpdhrtghpthhtohepfihilhhlhiesihhnfhhrrgguvggrugdroh
    hrghdprhgtphhtthhopehushgrmhgrrghrihhfieegvdesghhmrghilhdrtghomhdprhgt
    phhtthhopehfvhgulhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepohhsrghlvhgrug
    horhesshhushgvrdguvgdprhgtphhtthhopehrphhptheskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtohepvhgsrggskhgrsehsuhhsvgdrtgii
X-ME-Proxy: <xmx:RhlEaX3lWYefVWdllp2u7kf0qywXu1ub1n3M8wHNlyw5RcIsFLN-SQ>
    <xmx:RhlEab1M_Y1rn8ZJJKVzHRDHLaDaVytHNYUYevHW-HnRDM2j156lHQ>
    <xmx:RhlEaV_JCojPiW5CrfUG1DnXo0GLWgGymrjqovQyde8y44qDgHW95g>
    <xmx:RhlEaXb-KqwfgHcoE8pPXMqPy6e-i0uCLGbtIDp0ZEaUnf_eMCrNdg>
    <xmx:RhlEaUxGJyvz34X5R1IuRQAQN3CBNrwkhrBny2PZyp8OVqvAnopnkrAq>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Dec 2025 10:09:57 -0500 (EST)
From: Kiryl Shutsemau <kas@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>,
	Muchun Song <muchun.song@linux.dev>,
	David Hildenbrand <david@kernel.org>,
	Matthew Wilcox <willy@infradead.org>,
	Usama Arif <usamaarif642@gmail.com>,
	Frank van der Linden <fvdl@google.com>
Cc: Oscar Salvador <osalvador@suse.de>,
	Mike Rapoport <rppt@kernel.org>,
	Vlastimil Babka <vbabka@suse.cz>,
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
	Zi Yan <ziy@nvidia.com>,
	Baoquan He <bhe@redhat.com>,
	Michal Hocko <mhocko@suse.com>,
	Johannes Weiner <hannes@cmpxchg.org>,
	Jonathan Corbet <corbet@lwn.net>,
	kernel-team@meta.com,
	linux-mm@kvack.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Kiryl Shutsemau <kas@kernel.org>
Subject: [PATCHv2 03/14] mm: Change the interface of prep_compound_tail()
Date: Thu, 18 Dec 2025 15:09:34 +0000
Message-ID: <20251218150949.721480-4-kas@kernel.org>
X-Mailer: git-send-email 2.51.2
In-Reply-To: <20251218150949.721480-1-kas@kernel.org>
References: <20251218150949.721480-1-kas@kernel.org>
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
 mm/internal.h              | 12 ++++++------
 mm/mm_init.c               |  2 +-
 mm/page_alloc.c            |  2 +-
 5 files changed, 16 insertions(+), 12 deletions(-)

diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
index 0091ad1986bf..d4952573a4af 100644
--- a/include/linux/page-flags.h
+++ b/include/linux/page-flags.h
@@ -865,7 +865,9 @@ static inline bool folio_test_large(const struct folio *folio)
 	return folio_test_head(folio);
 }
 
-static __always_inline void set_compound_head(struct page *page, struct page *head)
+static __always_inline void set_compound_head(struct page *page,
+					      const struct page *head,
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
index 1561fc2ff5b8..f385370256b9 100644
--- a/mm/internal.h
+++ b/mm/internal.h
@@ -810,13 +810,13 @@ static inline void prep_compound_head(struct page *page, unsigned int order)
 		INIT_LIST_HEAD(&folio->_deferred_list);
 }
 
-static inline void prep_compound_tail(struct page *head, int tail_idx)
+static inline void prep_compound_tail(struct page *tail,
+				      const struct page *head,
+				      unsigned int order)
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

