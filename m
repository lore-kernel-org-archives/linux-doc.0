Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E44E03358B6;
	Wed, 21 Jan 2026 16:22:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769012578; cv=none; b=qzgubaPKlAdH0dBsMVASKlcK51f5HfP0gZ2mLM0mxNDDjhpnU35ecB02LOWmiZdLe9J9Ghs1mf9nuRkGr/w3o9/VcEMLoqUd4vKGkPeFtoDL63XlQhW5CFd/kl4YmHIiXZIl/jsbCcXmvlQjjlbDcPTgehztI+pKFfw52B4NxZw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769012578; c=relaxed/simple;
	bh=Xnuw+c/iLJZjrLd0wecx/FbQaI4UgnUbSlka1WpVQYo=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=LG7ag/hDXphMN1+TjtAa3eZye7kFUie3H1d1HIcjRQrQNfIZ/Wm5IQv9a353XjVPKP/jmNUeOsww/5fCdVVBPKuWX4zfnD6T70fa7hP7FmbAj4JtRn2dzrV7MpV2iiVLDTSC2Dm5lQgVBc3BJ7ejo2sLaTTHYyF8AQnlZYClASM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Lpu+TlRo; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Lpu+TlRo"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B69AEC19425;
	Wed, 21 Jan 2026 16:22:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769012577;
	bh=Xnuw+c/iLJZjrLd0wecx/FbQaI4UgnUbSlka1WpVQYo=;
	h=From:To:Cc:Subject:Date:From;
	b=Lpu+TlRoyGvUUnSYYTSWdfrxSc1fOHocf5h7GaIKz+caFECzJOV3oyj/1OcexADJH
	 686AZhb6LZzc2d0pvsVdtJ6SPG3Qz4thmhBjCwVSgpBt5OIl9s2P6b6mL6cQQCftwa
	 +wZhb8c6DDUCiEiSAXPnnfG0ZkK7uFAN3aqcgZjxclmpLKbDya/4wV/o6AsQ2pwSB8
	 OAj524tqlbXfhhE/b8NWBrM3IB5mdSC0TlaoGdVQxoS00pvlGZsgOkZa0ZnHReFNHR
	 LAiBcNnsSEF53LoRHGbATq6d7uY5EQlda2bBnv66IyzJvPF7EZSTJzEde5SfhYDFea
	 bxXV1l437yaIg==
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id CF1D0F4006B;
	Wed, 21 Jan 2026 11:22:55 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Wed, 21 Jan 2026 11:22:55 -0500
X-ME-Sender: <xms:X_1waTmyHEPxKZjcvJ0Yj9yK7cXA8lMa09X-OaBlrt9jr5GYEmx4iw>
    <xme:X_1waWFQmTrpZ4VkYpDhlrMyxeRIPpeNydx8sxHAcWYekVBgkADS3t4eE-16qRJcD
    JruDKIC48rGhXPYLVQY7AhwWt1pxO8wnT4AvJabGD_xiQazKf1B8w>
X-ME-Received: <xmr:X_1wacdTSQOfb1v_RINZjbA4n-N4Y1URK0gK22eUTV1ZlVnxkeibuqidW99VCA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugeefjeehucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhephffvvefufffkofgggfestdekredtredttdenucfhrhhomhepmfhirhihlhcuufhh
    uhhtshgvmhgruhcuoehkrghssehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnh
    epffdvhfdtgfekuddttdffgeeljeehueffvdfgjeejvdetiedtfeefgfetgfffhfffnecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepkhhirhhilh
    hlodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieduudeivdeiheehqddv
    keeggeegjedvkedqkhgrsheppehkvghrnhgvlhdrohhrghesshhhuhhtvghmohhvrdhnrg
    hmvgdpnhgspghrtghpthhtohepvddtpdhmohguvgepshhmthhpohhuthdprhgtphhtthho
    pegrkhhpmheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepmh
    hutghhuhhnrdhsohhngheslhhinhhugidruggvvhdprhgtphhtthhopegurghvihgusehk
    vghrnhgvlhdrohhrghdprhgtphhtthhopeifihhllhihsehinhhfrhgruggvrggurdhorh
    hgpdhrtghpthhtohepuhhsrghmrggrrhhifheigedvsehgmhgrihhlrdgtohhmpdhrtghp
    thhtohepfhhvughlsehgohhoghhlvgdrtghomhdprhgtphhtthhopehoshgrlhhvrgguoh
    hrsehsuhhsvgdruggvpdhrtghpthhtoheprhhpphhtsehkvghrnhgvlhdrohhrghdprhgt
    phhtthhopehvsggrsghkrgesshhushgvrdgtii
X-ME-Proxy: <xmx:X_1waTFNw5EwbKpojJbef3mTObHIXcWLvQbStSKCfq1JPpy3MmbKyQ>
    <xmx:X_1waWEs-mFewr0KY6jWRZpxl70Pk9ZrkAUSU5tRl5LquuGd3z1G3Q>
    <xmx:X_1waTNa015ng0suFiSaR18-ClCmqLh63uwMa4eCW7eEAgNO1pNn3g>
    <xmx:X_1wabogH60hSushpaF33RzC0jIuTfpi10mNvsKuOl_z8GxuANf7PQ>
    <xmx:X_1waUD1knhjsZzCqM8QahfMRqLXRUFHOZg_WZ6vcv44fbNo35vuLEFS>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 21 Jan 2026 11:22:55 -0500 (EST)
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
Subject: [PATCHv4 00/14] mm: Eliminate fake head pages from vmemmap optimization
Date: Wed, 21 Jan 2026 16:22:37 +0000
Message-ID: <20260121162253.2216580-1-kas@kernel.org>
X-Mailer: git-send-email 2.51.2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

This series removes "fake head pages" from the HugeTLB vmemmap
optimization (HVO) by changing how tail pages encode their relationship
to the head page.

It simplifies compound_head() and page_ref_add_unless(). Both are in the
hot path.

Background
==========

HVO reduces memory overhead by freeing vmemmap pages for HugeTLB pages
and remapping the freed virtual addresses to a single physical page.
Previously, all tail page vmemmap entries were remapped to the first
vmemmap page (containing the head struct page), creating "fake heads" -
tail pages that appear to have PG_head set when accessed through the
deduplicated vmemmap.

This required special handling in compound_head() to detect and work
around fake heads, adding complexity and overhead to a very hot path.

New Approach
============

For architectures/configs where sizeof(struct page) is a power of 2 (the
common case), this series changes how position of the head page is encoded
in the tail pages.

Instead of storing a pointer to the head page, the ->compound_info
(renamed from ->compound_head) now stores a mask.

The mask can be applied to any tail page's virtual address to compute
the head page address. Critically, all tail pages of the same order now
have identical compound_info values, regardless of which compound page
they belong to.

The key insight is that all tail pages of the same order now have
identical compound_info values, regardless of which compound page they
belong to. This allows a single page of tail struct pages to be shared
across all huge pages of the same order on a NUMA node.

Benefits
========

1. Simplified compound_head(): No fake head detection needed, can be
   implemented in a branchless manner.

2. Simplified page_ref_add_unless(): RCU protection removed since there's
   no race with fake head remapping.

3. Cleaner architecture: The shared tail pages are truly read-only and
   contain valid tail page metadata.

If sizeof(struct page) is not power-of-2, there are no functional changes.
HVO is not supported in this configuration.

I had hoped to see performance improvement, but my testing thus far has
shown either no change or only a slight improvement within the noise.

Series Organization
===================

Patch 1: Preparation - move MAX_FOLIO_ORDER to mmzone.h
Patches 2-4: Refactoring - interface changes, field rename, code movement
Patch 5: Core change - new mask-based compound_head() encoding
Patch 6: Correctness fix - page_zonenum() must use head page
Patch 7: Add memmap alignment check for compound_info_has_mask()
Patch 8: Refactor vmemmap_walk for new design
Patch 9: Eliminate fake heads with shared tail pages
Patches 10-13: Cleanup - remove fake head infrastructure
Patch 14: Documentation update

Changes in v4:
==============
  - Fix build issues due to linux/mmzone.h <-> linux/pgtable.h
    dependency loop by avoiding including linux/pgtable.h into
    linux/mmzone.h

  - Rework vmemmap_remap_alloc() interface. (Muchun)

  - Use &folio->page instead of folio address for optimization
    target. (Muchun)

Changes in v3:
==============
  - Fixed error recovery path in vmemmap_remap_free() to pass correct start
    address for TLB flush. (Muchun)

  - Wrapped the mask-based compound_info encoding within CONFIG_SPARSEMEM_VMEMMAP
    check via compound_info_has_mask(). For other memory models, alignment
    guarantees are harder to verify. (Muchun)

  - Updated vmemmap_dedup.rst documentation wording: changed "vmemmap_tail
    shared for the struct hstate" to "A single, per-node page frame shared
    among all hugepages of the same size". (Muchun)

  - Fixed build error with MAX_FOLIO_ORDER expanding to undefined PUD_ORDER
    in certain configurations. (kernel test robot)

Changes in v2:
==============

- Handle boot-allocated huge pages correctly. (Frank)

- Changed from per-hstate vmemmap_tail to per-node vmemmap_tails[] array
  in pglist_data. (Muchun)

- Added spin_lock(&hugetlb_lock) protection in vmemmap_get_tail() to fix
  a race condition where two threads could both allocate tail pages.
  The losing thread now properly frees its allocated page. (Usama)

- Add warning if memmap is not aligned to MAX_FOLIO_SIZE, which is
  required for the mask approach. (Muchun)

- Make page_zonenum() use head page - correctness fix since shared
  tail pages cannot have valid zone information. (Muchun)

- Added 'const' qualifier to head parameter in set_compound_head() and
  prep_compound_tail(). (Usama)

- Updated commit messages.

Kiryl Shutsemau (14):
  mm: Move MAX_FOLIO_ORDER definition to mmzone.h
  mm: Change the interface of prep_compound_tail()
  mm: Rename the 'compound_head' field in the 'struct page' to
    'compound_info'
  mm: Move set/clear_compound_head() next to compound_head()
  mm: Rework compound_head() for power-of-2 sizeof(struct page)
  mm: Make page_zonenum() use head page
  mm/sparse: Check memmap alignment for compound_info_has_mask()
  mm/hugetlb: Refactor code around vmemmap_walk
  mm/hugetlb: Remove fake head pages
  mm: Drop fake head checks
  hugetlb: Remove VMEMMAP_SYNCHRONIZE_RCU
  mm/hugetlb: Remove hugetlb_optimize_vmemmap_key static key
  mm: Remove the branch from compound_head()
  hugetlb: Update vmemmap_dedup.rst

 .../admin-guide/kdump/vmcoreinfo.rst          |   2 +-
 Documentation/mm/vmemmap_dedup.rst            |  62 ++--
 include/linux/mm.h                            |  31 --
 include/linux/mm_types.h                      |  20 +-
 include/linux/mmzone.h                        |  47 +++
 include/linux/page-flags.h                    | 167 +++++-----
 include/linux/page_ref.h                      |   8 +-
 include/linux/types.h                         |   2 +-
 kernel/vmcore_info.c                          |   2 +-
 mm/hugetlb.c                                  |   8 +-
 mm/hugetlb_vmemmap.c                          | 300 ++++++++----------
 mm/internal.h                                 |  12 +-
 mm/mm_init.c                                  |   2 +-
 mm/page_alloc.c                               |   4 +-
 mm/slab.h                                     |   2 +-
 mm/sparse-vmemmap.c                           |  44 ++-
 mm/sparse.c                                   |   5 +
 mm/util.c                                     |  16 +-
 18 files changed, 369 insertions(+), 365 deletions(-)

-- 
2.51.2

