Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1CDAB3A0B01
	for <linux-doc@vger.kernel.org>; Thu, 15 Jan 2026 14:46:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768488371; cv=none; b=tY7d8DJ03EbLH07c0Fckd2pltXggH62Z2tKEwPx6dqTEGX8Gwbo2LlPPx9MU7ZjdI9u0jZ/1KCWoihVV4+rAhSXs+G5Il9EJKcKpUQG1JcCGW5OicvomA8PvoGItJ9tBTkO0Xcs969O0rM8LDaZuUz9mF0NrkrzHwgKtQEq/Dac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768488371; c=relaxed/simple;
	bh=gQRwWiu8OTubVEWpNxxTKEntQZOwqK9ndn+7y2YfMeU=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=hO+r13cWXKdgswdiee168S2NzU0Nq7s9lAvjv/2Odtt+0xAmQ86HirryQ9ES2IjxQRUIVYT2BHodKeX0tc3fKk1mX8C6kbHbvEeyUc2SsnCS2gDPM41JOt6D53yxLed7sIgetIfiaQuLmrS7VIPYdyAcORQ+udp2BsuCB8Jl+3Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=cG6Ewkbg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="cG6Ewkbg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67937C16AAE;
	Thu, 15 Jan 2026 14:46:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768488370;
	bh=gQRwWiu8OTubVEWpNxxTKEntQZOwqK9ndn+7y2YfMeU=;
	h=From:To:Cc:Subject:Date:From;
	b=cG6EwkbgwyQKiLnv66s7SFzmatUHBIUCDM4QOIPn3aHNm+DxGqEmq6GSAGlgCj3en
	 gpt3RxzOzbPF6eJxvJfv/Io6AGesEpb6hqKxA+N5WR989xL6SpoiPu/ytrhtEl/LRN
	 LpsMHF0KFLnJlKragLkc4V3sylyiyUV8R1GN9wjsO6p7jfquWji1R0Y7JXsQzdyEfV
	 cg42UU2RklQ+Gsku0mXjsxCdrWKZgJwq0H8rtsYfcq1HJFyCRzZMziFWFDO6ykgIyr
	 62dGP/Q4BfLAeFNdc8TUfxEnI+Zb3KCid8E4d3ehpug/OO8+aLHXBbLs6DEgchTSxY
	 U4dS5Ox+gz3ZQ==
Received: from phl-compute-08.internal (phl-compute-08.internal [10.202.2.48])
	by mailfauth.phl.internal (Postfix) with ESMTP id 6AACEF40068;
	Thu, 15 Jan 2026 09:46:09 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-08.internal (MEProxy); Thu, 15 Jan 2026 09:46:09 -0500
X-ME-Sender: <xms:sf1oadnLh2YuLJOioJebnpzBn0vcbhSQWSD2Ag_y8rFrTMdsWEisIA>
    <xme:sf1oaYH5uOerwzSkL3dCtfBdFpUSjFZbEOTdsdodjyViuqE9LEWjMd69qiDvaU53n
    M-XfEcUF29lFl5Etrm0M5JtudlcDgcQWngUHgBT4iNaHKiFGmcABw>
X-ME-Received: <xmr:sf1oaWcWN9U8UNtzu5p11s9xoeMYoOWaE_HOAFrHm6RnYwRvZSuKO02OKwIZtQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduvdeifeegucetufdoteggodetrf
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
X-ME-Proxy: <xmx:sf1oaVHrWryzUdOzZ14M3enusyGEmDAHD4Vm2Uul6hY9OWPzUKptcg>
    <xmx:sf1oaQFAGUKKfQ1xmFZolW5VZLUH4od4MbpruHINr-eQ9J_mQjgtnw>
    <xmx:sf1oaVN1MI_BkFzsWtV8-xb2zbpGjVxQFOpaEf94mTNhqI5PQASYBg>
    <xmx:sf1oaVptoqwqOVYrOERtpaQaoucIG1jc1ILJMxrXgQ-FyyMvw1Yrtg>
    <xmx:sf1oaWBV0p0rGR-26joNdEz2-iPXwxkjrmOMQrT7nKycHK4RjgF4eYl4>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 15 Jan 2026 09:46:08 -0500 (EST)
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
Subject: [PATCHv3 00/15] mm: Eliminate fake head pages from vmemmap optimization
Date: Thu, 15 Jan 2026 14:45:46 +0000
Message-ID: <20260115144604.822702-1-kas@kernel.org>
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

Patch 1-2: Preparation - move MAX_FOLIO_ORDER to mmzone.h and build fix
	   for x86/vdso32
Patches 3-5: Refactoring - interface changes, field rename, code movement
Patch 6: Core change - new mask-based compound_head() encoding
Patch 7: Correctness fix - page_zonenum() must use head page
Patch 8: Add memmap alignment check for compound_info_has_mask()
Patch 9: Refactor vmemmap_walk for new design
Patch 10: Eliminate fake heads with shared tail pages
Patches 11-14: Cleanup - remove fake head infrastructure
Patch 15: Documentation update

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

Kiryl Shutsemau (15):
  x86/vdso32: Prepare for <linux/pgtable.h> inclusion
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
 arch/x86/entry/vdso/vdso32/fake_32bit_build.h |   2 +
 include/linux/mm.h                            |  31 --
 include/linux/mm_types.h                      |  20 +-
 include/linux/mmzone.h                        |  48 ++++
 include/linux/page-flags.h                    | 167 +++++------
 include/linux/page_ref.h                      |   8 +-
 include/linux/types.h                         |   2 +-
 kernel/vmcore_info.c                          |   2 +-
 mm/hugetlb.c                                  |   8 +-
 mm/hugetlb_vmemmap.c                          | 270 +++++++++---------
 mm/internal.h                                 |  12 +-
 mm/mm_init.c                                  |   2 +-
 mm/page_alloc.c                               |   4 +-
 mm/slab.h                                     |   2 +-
 mm/sparse-vmemmap.c                           |  44 ++-
 mm/sparse.c                                   |   5 +
 mm/util.c                                     |  16 +-
 19 files changed, 363 insertions(+), 344 deletions(-)

-- 
2.51.2

