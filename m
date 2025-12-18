Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 198AE22A1E1
	for <linux-doc@vger.kernel.org>; Thu, 18 Dec 2025 22:18:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766096299; cv=none; b=DRI7WSnPa3ocMdNdIQcNKdvQIcerMv56n3FNz7YS09P+krj0Cc4iSkg9pYr3L2behy/mLPLsRw3PAw2RsGO75gJokTGYYeYQqJwwj7Hmrd/1gaQG04l6qvvJydDo2D/vwNDHUAY1iIjDeZ49n0/C4xEzQ1VUI6dAJgBBZXgqiT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766096299; c=relaxed/simple;
	bh=FUgCeuiQNT4muIFBCmCzgaZfGQk40jmJWu4fIl3oYKg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=awjEuXR1lbwR7NTK9dpvF+RbCs/1bYG6as6y84RBeLRMikPlK7KEKHGIfowY0x5mpmQlUlNABx1j3hzw9Hk8PtW0o+/yszPUpOXLGIdzKGHedapa02EmN85PMaNHSTIBZQ6Q38AKGKUYyL118A8rNLLgOVnz4O5UABdixSjUJZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=eyJgYb7t; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="eyJgYb7t"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20046C113D0;
	Thu, 18 Dec 2025 22:18:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766096298;
	bh=FUgCeuiQNT4muIFBCmCzgaZfGQk40jmJWu4fIl3oYKg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=eyJgYb7tg2MAyuKG6rI5UMjAdV3cDZNb9nU9LITotkmynISVw6eD/yPFDWZREz9vc
	 TF5DAwkRgvFQ1eSeGM0OJlP267Ahm3WbPM5LZqb/VJTwAWDija/3HEJo0MNstuc2Hv
	 93WEJWYFsihbwo2Jg9oO00IaoMXWYnvi+2d/cNO1EZoO7XIDKlivVDslLTuA/VIrU+
	 47Ol2bd48vSkaueLGIx5kINEJeQCQWLQAl1Z06FkxnhI5WYnlx24e15q8/CFlwqZEd
	 wur4hOBdx9Fhqig5THqzTZxSPHPhOKAJN8aIVd1dzd1O4v9vrafv2uRmIsjZh+AEE/
	 uJQuF/nCCR/sg==
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id 601C4F4006D;
	Thu, 18 Dec 2025 17:18:17 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Thu, 18 Dec 2025 17:18:17 -0500
X-ME-Sender: <xms:qX1EaTz7izvLcduUg_22qEkWYwvSQKkS767iaRTZ_AefNM1zIW1abg>
    <xme:qX1EadXmUu5mhezqQPZMguY3coq1_DaOHq-wdNtsbhpc-eNBt7z57l4ImB35k5FA1
    B6kJmWEBuRceL_ji1nbuYKFiprIEyvCfWUJ_o1h5u1ocs1ERnZxQuaI>
X-ME-Received: <xmr:qX1EaXbuduq-XfSLSednr-WC547i5NufmCeS_MoAIo49zTXUpG2lue4BuCD6jw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdegieeitdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdfstddttddvnecuhfhrohhmpefmihhrhihlucfu
    hhhuthhsvghmrghuuceokhgrsheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrh
    hnpeehieekueevudehvedtvdffkefhueefhfevtdduheehkedthfdtheejveelueffgeen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehkihhrih
    hllhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqudeiudduiedvieehhedq
    vdekgeeggeejvdekqdhkrghspeepkhgvrhhnvghlrdhorhhgsehshhhuthgvmhhovhdrnh
    grmhgvpdhnsggprhgtphhtthhopeefkedpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    oheprghkphhmsehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhope
    hmuhgthhhunhdrshhonhhgsehlihhnuhigrdguvghvpdhrtghpthhtohepuggrvhhiuges
    khgvrhhnvghlrdhorhhgpdhrtghpthhtohepfihilhhlhiesihhnfhhrrgguvggrugdroh
    hrghdprhgtphhtthhopehushgrmhgrrghrihhfieegvdesghhmrghilhdrtghomhdprhgt
    phhtthhopehfvhgulhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepohhsrghlvhgrug
    horhesshhushgvrdguvgdprhgtphhtthhopehrphhptheskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtohepvhgsrggskhgrsehsuhhsvgdrtgii
X-ME-Proxy: <xmx:qX1EaYN3Ut09ZxqGoJd7XQHjVn2v9-CjaYEQ55sURW6WMfKIdR6ZpA>
    <xmx:qX1Eabu-pbi6_iJ7-E9PpWEBG9kBksqjrInQovTtek8uqPM3mX308A>
    <xmx:qX1Eae0BdE73PogicHJtHPSjs76zOCGfcACPYnH36G71iX6ew8GONQ>
    <xmx:qX1EaZUaAMF0a6DbR9gUnSeEsKM4zxuVtybMoEg2ta2gSDDVer78vg>
    <xmx:qX1EaUuSs4NqwYdss3vvgbRdATZV5nf85GISJc6bdTGWXiwjUZHWfAHV>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 18 Dec 2025 17:18:16 -0500 (EST)
Date: Thu, 18 Dec 2025 22:18:15 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: Andrew Morton <akpm@linux-foundation.org>, 
	Muchun Song <muchun.song@linux.dev>, David Hildenbrand <david@kernel.org>, 
	Matthew Wilcox <willy@infradead.org>, Usama Arif <usamaarif642@gmail.com>, 
	Frank van der Linden <fvdl@google.com>
Cc: Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>, 
	Vlastimil Babka <vbabka@suse.cz>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Zi Yan <ziy@nvidia.com>, Baoquan He <bhe@redhat.com>, Michal Hocko <mhocko@suse.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>, kernel-team@meta.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCHv2 00/14] Eliminate fake head pages from vmemmap
 optimization
Message-ID: <pr22ew7pmqercu5tlabw2ros4cdeoyhlqbqmogvfqgekesfbfz@f5nls3gxj76t>
References: <20251218150949.721480-1-kas@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251218150949.721480-1-kas@kernel.org>


Oopsie. Add the Subject.

On Thu, Dec 18, 2025 at 03:09:31PM +0000, Kiryl Shutsemau wrote:
> This series removes "fake head pages" from the HugeTLB vmemmap
> optimization (HVO) by changing how tail pages encode their relationship
> to the head page.
> 
> It simplifies compound_head() and page_ref_add_unless(). Both are in the
> hot path.
> 
> Background
> ==========
> 
> HVO reduces memory overhead by freeing vmemmap pages for HugeTLB pages
> and remapping the freed virtual addresses to a single physical page.
> Previously, all tail page vmemmap entries were remapped to the first
> vmemmap page (containing the head struct page), creating "fake heads" -
> tail pages that appear to have PG_head set when accessed through the
> deduplicated vmemmap.
> 
> This required special handling in compound_head() to detect and work
> around fake heads, adding complexity and overhead to a very hot path.
> 
> New Approach
> ============
> 
> For architectures/configs where sizeof(struct page) is a power of 2 (the
> common case), this series changes how position of the head page is encoded
> in the tail pages.
> 
> Instead of storing a pointer to the head page, the ->compound_info
> (renamed from ->compound_head) now stores a mask.
> 
> The mask can be applied to any tail page's virtual address to compute
> the head page address. Critically, all tail pages of the same order now
> have identical compound_info values, regardless of which compound page
> they belong to.
> 
> The key insight is that all tail pages of the same order now have
> identical compound_info values, regardless of which compound page they
> belong to. This allows a single page of tail struct pages to be shared
> across all huge pages of the same order on a NUMA node.
> 
> Benefits
> ========
> 
> 1. Simplified compound_head(): No fake head detection needed, can be
>    implemented in a branchless manner.
> 
> 2. Simplified page_ref_add_unless(): RCU protection removed since there's
>    no race with fake head remapping.
> 
> 3. Cleaner architecture: The shared tail pages are truly read-only and
>    contain valid tail page metadata.
> 
> If sizeof(struct page) is not power-of-2, there are no functional changes.
> HVO is not supported in this configuration.
> 
> I had hoped to see performance improvement, but my testing thus far has
> shown either no change or only a slight improvement within the noise.
> 
> Series Organization
> ===================
> 
> Patches 1-2: Preparation - move MAX_FOLIO_ORDER, add alignment check
> Patches 3-5: Refactoring - interface changes, field rename, code movement
> Patch 6: Core change - new mask-based compound_head() encoding
> Patch 7: Correctness fix - page_zonenum() must use head page
> Patch 8: Refactor vmemmap_walk for new design
> Patch 9: Eliminate fake heads with shared tail pages
> Patches 10-13: Cleanup - remove fake head infrastructure
> Patch 14: Documentation update
> 
> Changes in v2:
> ==============
> 
> - Handle boot-allocated huge pages correctly. (Frank)
> 
> - Changed from per-hstate vmemmap_tail to per-node vmemmap_tails[] array
>   in pglist_data. (Muchun)
> 
> - Added spin_lock(&hugetlb_lock) protection in vmemmap_get_tail() to fix
>   a race condition where two threads could both allocate tail pages.
>   The losing thread now properly frees its allocated page. (Usama)
> 
> - Add warning if memmap is not aligned to MAX_FOLIO_SIZE, which is
>   required for the mask approach. (Muchun)
> 
> - Make page_zonenum() use head page - correctness fix since shared
>   tail pages cannot have valid zone information. (Muchun)
> 
> - Added 'const' qualifier to head parameter in set_compound_head() and
>   prep_compound_tail(). (Usama)
> 
> - Updated commit messages.
> 
> Kiryl Shutsemau (14):
>   mm: Move MAX_FOLIO_ORDER definition to mmzone.h
>   mm/sparse: Check memmap alignment
>   mm: Change the interface of prep_compound_tail()
>   mm: Rename the 'compound_head' field in the 'struct page' to
>     'compound_info'
>   mm: Move set/clear_compound_head() next to compound_head()
>   mm: Rework compound_head() for power-of-2 sizeof(struct page)
>   mm: Make page_zonenum() use head page
>   mm/hugetlb: Refactor code around vmemmap_walk
>   mm/hugetlb: Remove fake head pages
>   mm: Drop fake head checks
>   hugetlb: Remove VMEMMAP_SYNCHRONIZE_RCU
>   mm/hugetlb: Remove hugetlb_optimize_vmemmap_key static key
>   mm: Remove the branch from compound_head()
>   hugetlb: Update vmemmap_dedup.rst
> 
>  .../admin-guide/kdump/vmcoreinfo.rst          |   2 +-
>  Documentation/mm/vmemmap_dedup.rst            |  62 ++--
>  include/linux/mm.h                            |  31 --
>  include/linux/mm_types.h                      |  20 +-
>  include/linux/mmzone.h                        |  47 +++
>  include/linux/page-flags.h                    | 163 ++++-------
>  include/linux/page_ref.h                      |   8 +-
>  include/linux/types.h                         |   2 +-
>  kernel/vmcore_info.c                          |   2 +-
>  mm/hugetlb.c                                  |   8 +-
>  mm/hugetlb_vmemmap.c                          | 270 +++++++++---------
>  mm/internal.h                                 |  12 +-
>  mm/mm_init.c                                  |   2 +-
>  mm/page_alloc.c                               |   4 +-
>  mm/slab.h                                     |   2 +-
>  mm/sparse-vmemmap.c                           |  44 ++-
>  mm/sparse.c                                   |   3 +
>  mm/util.c                                     |  16 +-
>  18 files changed, 345 insertions(+), 353 deletions(-)
> 
> -- 
> 2.51.2
> 

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
