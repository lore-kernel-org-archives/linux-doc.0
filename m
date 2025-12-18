Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79482314D00
	for <linux-doc@vger.kernel.org>; Thu, 18 Dec 2025 15:09:54 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766070594; cv=none; b=axJX38VuRmlnzH8KgzpdodPcgGdboD9MPspTbOfLHgxP1wU/HVq1ngXADBsz4a4XTAHZHE+rB/nz48AG/eIzh1CI9tJoy3/ikVNDqIGCicfuFLE6xpH9R0cupkPqFrtBe0HjM2Gpkp7cn9psWWuxPpaXQQAj8hsQmtmESLL0sBE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766070594; c=relaxed/simple;
	bh=O6GP+t8IQVJzoleFoYNiOb4xlvArbWf4kOGt3VXh7rw=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=K8o4ohzzsO8G7bB9p0uEARrdaORYJvyeZs766QfhE4LAgiVjEfHwih+boLV+f4p43sJWTPU4Q62Ax5rUl3Ar6zNXobmzL4kC639joJTr5qR3bbT6tDrHcXJhlT4Sb0O5TZwEoFMelRyarrlTWpxKPiIngngZtj9+Ctwsre2jLZU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tWrFCKZS; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tWrFCKZS"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B45D0C4AF0B;
	Thu, 18 Dec 2025 15:09:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766070594;
	bh=O6GP+t8IQVJzoleFoYNiOb4xlvArbWf4kOGt3VXh7rw=;
	h=From:To:Cc:Subject:Date:From;
	b=tWrFCKZSm/pbLlyurmjdxxHtCAvHG3U8OlVCKUCogeEA+1U068GLMP5zc9lpzWmFz
	 9+WZR+hGjsw7rOb+DGTPb4ZWbWNokXDkztk5FoZ2IDfg5+z2vwTcg08xVf7E1iHrKH
	 B4JvXaenngV0JXu6HlgXZetjzyf/WVRfJFn+Bthl8QkeWhnRXqmsP6dyNRwHKmPlZS
	 1yrCK+va2r6U0kJGF2z9XwHMHVsMBGQwvlNRNoggTSbENBgtXTfZcW+xvXjyanynJq
	 +A5rBd2fJh/3JH6+Ra4XLzW+LOcpBaivL6fTolqSKgxbYNJYwFQ+oCzlMnYLzLn1qd
	 ZHcyQC2bJEyAg==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id CFAC3F40072;
	Thu, 18 Dec 2025 10:09:52 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Thu, 18 Dec 2025 10:09:52 -0500
X-ME-Sender: <xms:QBlEaWY3-8eA78_LsIRDslmH29nCNItXafiw7olAl3Y8W5iMv-BcPA>
    <xme:QBlEaYpyeoS6AP-0xR0uCMoHKW309MBUad6NeQpQD8DFFOtNugeKHA6kO9rPtGC7b
    t4jke058qtg-2jEmrKwvbO4j8VT4p2qdil7o9Nax4XbZ980vafXl_Y>
X-ME-Received: <xmr:QBlEaTy1oci3tP3xz6MuGxJP-04oYbhc3qWXJoFA2dKmb4owR7C13sNr55Gicg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdegheejgecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpefhvfevufffkffoggfgsedtkeertdertddtnecuhfhrohhmpefmihhrhihlucfuhhhu
    thhsvghmrghuuceokhgrsheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrhhnpe
    ffvdfhtdfgkedutddtffegleejheeuffdvgfejjedvteeitdeffefgtefgfffhffenucev
    lhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehkihhrihhllh
    domhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqudeiudduiedvieehhedqvdek
    geeggeejvdekqdhkrghspeepkhgvrhhnvghlrdhorhhgsehshhhuthgvmhhovhdrnhgrmh
    gvpdhnsggprhgtphhtthhopedvtddpmhhouggvpehsmhhtphhouhhtpdhrtghpthhtohep
    rghkphhmsehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehmuh
    gthhhunhdrshhonhhgsehlihhnuhigrdguvghvpdhrtghpthhtohepuggrvhhiugeskhgv
    rhhnvghlrdhorhhgpdhrtghpthhtohepfihilhhlhiesihhnfhhrrgguvggrugdrohhrgh
    dprhgtphhtthhopehushgrmhgrrghrihhfieegvdesghhmrghilhdrtghomhdprhgtphht
    thhopehfvhgulhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepohhsrghlvhgrughorh
    esshhushgvrdguvgdprhgtphhtthhopehrphhptheskhgvrhhnvghlrdhorhhgpdhrtghp
    thhtohepvhgsrggskhgrsehsuhhsvgdrtgii
X-ME-Proxy: <xmx:QBlEaQLqz02TregJ9f8ttrlMcADx62ZDo1mvHg7KqYNxE_MucnoiVA>
    <xmx:QBlEaV636JZA9D-qkvJRBpPdZpGewOshUrLvqSQq70lFe5VyTzCTCA>
    <xmx:QBlEaezVf8A0u-3BtKN0dJvIM4e_31uEVqIsx5AjyNogSy9t1cmAeQ>
    <xmx:QBlEaX8ERLcd4Uta6oomL2eK_YYV3nb4E2LKbgwIcKf0A1pN4mKN2w>
    <xmx:QBlEaSHuhr4W2yFEJEEtqphv3UlPTfy0BzVCkvK_BcavLPAOsyKoRb85>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Dec 2025 10:09:52 -0500 (EST)
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
Subject: [PATCHv2 00/14] 
Date: Thu, 18 Dec 2025 15:09:31 +0000
Message-ID: <20251218150949.721480-1-kas@kernel.org>
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

Patches 1-2: Preparation - move MAX_FOLIO_ORDER, add alignment check
Patches 3-5: Refactoring - interface changes, field rename, code movement
Patch 6: Core change - new mask-based compound_head() encoding
Patch 7: Correctness fix - page_zonenum() must use head page
Patch 8: Refactor vmemmap_walk for new design
Patch 9: Eliminate fake heads with shared tail pages
Patches 10-13: Cleanup - remove fake head infrastructure
Patch 14: Documentation update

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
  mm/sparse: Check memmap alignment
  mm: Change the interface of prep_compound_tail()
  mm: Rename the 'compound_head' field in the 'struct page' to
    'compound_info'
  mm: Move set/clear_compound_head() next to compound_head()
  mm: Rework compound_head() for power-of-2 sizeof(struct page)
  mm: Make page_zonenum() use head page
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
 include/linux/page-flags.h                    | 163 ++++-------
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
 mm/sparse.c                                   |   3 +
 mm/util.c                                     |  16 +-
 18 files changed, 345 insertions(+), 353 deletions(-)

-- 
2.51.2

