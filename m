Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 670D823D2B4
	for <linux-doc@vger.kernel.org>; Thu, 11 Dec 2025 15:03:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765465381; cv=none; b=ZH+Lt3A/MLY7CYUPjpdEq1OjTA/QQ3OvHD3r0TPgMiBgfYcMdshTLxOwu/TzXOEst+OW6KPHpxF58IOMKS/YhUUVY2wOEithm8nrv0R2wh4m7WWelNb755Xy2We/lHYfamop0h11yUSqsOWUgH4DVJCjGeHDzUVag6dzdqqSx68=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765465381; c=relaxed/simple;
	bh=xlZUXqejsN7ctbfX3Kr79uQ3a9/b8Jw3fxqYjPtNYZI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=llfvcNr7MiZDwvjkcM0X1wKEFdQddD8rUtsF6r7vL9k5qzKluHSVIhkamewNvQzs/huzmCX9EbIz4H4Fqhhx59T4ttTmGxWMRGBLc1NG2gSpr+eCFMO1czjdlmD7mQ+J/EGwEZVMV0Bz+TvYAoNoJonw4V1O22GA8RjgGP0fjEU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=c64mCKe7; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="c64mCKe7"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 71CA8C4AF09;
	Thu, 11 Dec 2025 15:03:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765465380;
	bh=xlZUXqejsN7ctbfX3Kr79uQ3a9/b8Jw3fxqYjPtNYZI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c64mCKe7kMYKCv2CvPl1RxrhxfCX0G8VRyGr0fGzLeMT7Nae8IkPcPgBRx/SzGPX1
	 TD0lXkIyPc4s4Z1distMh41pR5C1S0Aa60X2PpIF8/52lKG9/AT8DcB8bccfHFpWRF
	 AV8rHiRvLsXxqBZdYeGOmCtgysyCg+FlyjdD8wxWVOp5o6OFuuj/vx09mGlIsxL1H5
	 cXGz/SGiZzJIUYU0iH89wpNDPBhIRO3F/xYcLHLgY84slbdeHYk+9hLwyLfPxrSesJ
	 n0QZjKjzkgwh+25dQ6qpESBsZCiIud7TcBe3VkP29s9FPGLoAXoIUjyIdIEaKxvjLO
	 7Iyw1qgH1E4XA==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 9913CF4006A;
	Thu, 11 Dec 2025 10:02:59 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Thu, 11 Dec 2025 10:02:59 -0500
X-ME-Sender: <xms:I906aUhnw_m2u3AylnCxsUtuWhQyc9OxdIPfG1KxQX0NWRPi7qcQ9A>
    <xme:I906aYbInKvW5YPfJYzAnpNeaETDytsONHczLwD2eedTf08auvNpqR7xNWwiLA871
    akWfYXe6dggkzIBYpNr-yxBkFrqBidkZ-ndOQgVrf-g3XhUs-6mpQ>
X-ME-Received: <xmr:I906aVfLIiqFe88uvNNhArAalczm6TtaSwKjG0PRZYWc7g7iBc65vwbosyle9g>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvheeiudcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtugfgjgestheksfdttddtjeenucfhrhhomhepmfhirhihlhcu
    ufhhuhhtshgvmhgruhcuoehkrghssehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvg
    hrnhepvddufeetkedvheektdefhfefjeeujeejtdejuedufefhveekkeeffeetvedvffek
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepkhhirh
    hilhhlodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieduudeivdeiheeh
    qddvkeeggeegjedvkedqkhgrsheppehkvghrnhgvlhdrohhrghesshhhuhhtvghmohhvrd
    hnrghmvgdpnhgspghrtghpthhtohepfeekpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehfvhgulhesghhoohhglhgvrdgtohhmpdhrtghpthhtoheprghkphhmsehlihhnuh
    igqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehmuhgthhhunhdrshhonhhg
    sehlihhnuhigrdguvghvpdhrtghpthhtohepuggrvhhiugeskhgvrhhnvghlrdhorhhgpd
    hrtghpthhtohepohhsrghlvhgrughorhesshhushgvrdguvgdprhgtphhtthhopehrphhp
    theskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvhgsrggskhgrsehsuhhsvgdrtgiipd
    hrtghpthhtoheplhhorhgvnhiiohdrshhtohgrkhgvshesohhrrggtlhgvrdgtohhmpdhr
    tghpthhtohepfihilhhlhiesihhnfhhrrgguvggrugdrohhrgh
X-ME-Proxy: <xmx:I906adAFII0_3HQJ3ch1hllQct13BtZQQ-7617jSBs_hpTRYkVT79Q>
    <xmx:I906adVERJ2GsWK-l9HkA9St0MWKEnblXxNHA8FlY5_x3iDQJv5VKg>
    <xmx:I906aaXWqRQ6ELJDY6QFMQLrYkNzBl4qe4Ism8jUJzmFL2DW4BCtCA>
    <xmx:I906aY9sZiGQ1pLrfN5cNBF0a4KmiybyotA7q98aOpOzU_UCK1OQhQ>
    <xmx:I906aY8NXSe1T15uWMvWV-zrf6XdIiBCr7-GFiU0wGoM5afbXGFK2wB0>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 11 Dec 2025 10:02:59 -0500 (EST)
Date: Thu, 11 Dec 2025 15:02:58 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: Frank van der Linden <fvdl@google.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Muchun Song <muchun.song@linux.dev>, David Hildenbrand <david@kernel.org>, 
	Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>, 
	Vlastimil Babka <vbabka@suse.cz>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Matthew Wilcox <willy@infradead.org>, Zi Yan <ziy@nvidia.com>, Baoquan He <bhe@redhat.com>, 
	Michal Hocko <mhocko@suse.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Jonathan Corbet <corbet@lwn.net>, Usama Arif <usamaarif642@gmail.com>, kernel-team@meta.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 00/11] mm/hugetlb: Eliminate fake head pages from vmemmap
 optimization
Message-ID: <ackz7hv2oskh4yx4ebk6pkalt3i6buulcn23celgqfqrbkn2hi@hlrsm4ugw66n>
References: <20251205194351.1646318-1-kas@kernel.org>
 <CAPTztWaWnurc=9fOBpPO25JoZu6PHU6c7AYNJbE+xdWV4gwskA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAPTztWaWnurc=9fOBpPO25JoZu6PHU6c7AYNJbE+xdWV4gwskA@mail.gmail.com>

On Tue, Dec 09, 2025 at 10:20:14AM -0800, Frank van der Linden wrote:
> On Fri, Dec 5, 2025 at 11:44 AM Kiryl Shutsemau <kas@kernel.org> wrote:
> >
> > This series removes "fake head pages" from the HugeTLB vmemmap
> > optimization (HVO) by changing how tail pages encode their relationship
> > to the head page.
> >
> > It simplifies compound_head() and page_ref_add_unless(). Both are in the
> > hot path.
> >
> > Background
> > ==========
> >
> > HVO reduces memory overhead by freeing vmemmap pages for HugeTLB pages
> > and remapping the freed virtual addresses to a single physical page.
> > Previously, all tail page vmemmap entries were remapped to the first
> > vmemmap page (containing the head struct page), creating "fake heads" -
> > tail pages that appear to have PG_head set when accessed through the
> > deduplicated vmemmap.
> >
> > This required special handling in compound_head() to detect and work
> > around fake heads, adding complexity and overhead to a very hot path.
> >
> > New Approach
> > ============
> >
> > For architectures/configs where sizeof(struct page) is a power of 2 (the
> > common case), this series changes how position of the head page is encoded
> > in the tail pages.
> >
> > Instead of storing a pointer to the head page, the ->compound_info
> > (renamed from ->compound_head) now stores a mask.
> >
> > The mask can be applied to any tail page's virtual address to compute
> > the head page address. Critically, all tail pages of the same order now
> > have identical compound_info values, regardless of which compound page
> > they belong to.
> >
> > This enables a key optimization: instead of remapping tail vmemmap
> > entries to the head page (creating fake heads), we remap them to a
> > shared, pre-initialized vmemmap_tail page per hstate. The head page
> > gets its own dedicated vmemmap page, eliminating fake heads entirely.
> >
> > Benefits
> > ========
> >
> > 1. Smaller generated code. On defconfig, I see ~15K reduction of text
> >    in vmlinux:
> >
> >    add/remove: 6/33 grow/shrink: 54/262 up/down: 6130/-21922 (-15792)
> >
> > 2. Simplified compound_head(): No fake head detection needed. The
> >    function is now branchless for power-of-2 struct page sizes.
> >
> > 3. Eliminated race condition: The old scheme required synchronize_rcu()
> >    to coordinate between HVO remapping and speculative PFN walkers that
> >    might write to fake heads. With the head page always in writable
> >    memory, this synchronization is unnecessary.
> >
> > 4. Removed static key: hugetlb_optimize_vmemmap_key is no longer needed
> >    since compound_head() no longer has HVO-specific branches.
> >
> > 5. Cleaner architecture: The vmemmap layout is now straightforward -
> >    head page has its own vmemmap, tails share a read-only template.
> >
> > I had hoped to see performance improvement, but my testing thus far has
> > shown either no change or only a slight improvement within the noise.
> >
> > Series Organization
> > ===================
> >
> > Patches 1-3: Preparatory refactoring
> >   - Change prep_compound_tail() interface to take order
> >   - Rename compound_head field to compound_info
> >   - Move set/clear_compound_head() near compound_head()
> >
> > Patch 4: Core encoding change
> >   - Implement mask-based encoding for power-of-2 struct page
> >
> > Patches 5-6: HVO restructuring
> >   - Refactor vmemmap_walk to support separate head/tail pages
> >   - Introduce per-hstate vmemmap_tail, eliminate fake heads
> >
> > Patches 7-9: Cleanup
> >   - Remove fake head checks from compound_head(), PageTail(), etc.
> >   - Remove VMEMMAP_SYNCHRONIZE_RCU and synchronize_rcu() calls
> >   - Remove hugetlb_optimize_vmemmap_key static key
> >
> > Patch 10: Optimization
> >   - Implement branchless compound_head() for power-of-2 case
> >
> > Patch 11: Documentation
> >   - Update vmemmap_dedup.rst to reflect new architecture
> >
> > Kiryl Shutsemau (11):
> >   mm: Change the interface of prep_compound_tail()
> >   mm: Rename the 'compound_head' field in the 'struct page' to
> >     'compound_info'
> >   mm: Move set/clear_compound_head() to compound_head()
> >   mm: Rework compound_head() for power-of-2 sizeof(struct page)
> >   mm/hugetlb: Refactor code around vmemmap_walk
> >   mm/hugetlb: Remove fake head pages
> >   mm: Drop fake head checks and fix a race condition
> >   hugetlb: Remove VMEMMAP_SYNCHRONIZE_RCU
> >   mm/hugetlb: Remove hugetlb_optimize_vmemmap_key static key
> >   mm: Remove the branch from compound_head()
> >   hugetlb: Update vmemmap_dedup.rst
> >
> >  .../admin-guide/kdump/vmcoreinfo.rst          |   2 +-
> >  Documentation/mm/vmemmap_dedup.rst            |  62 ++---
> >  include/linux/hugetlb.h                       |   3 +
> >  include/linux/mm_types.h                      |  20 +-
> >  include/linux/page-flags.h                    | 163 +++++-------
> >  include/linux/page_ref.h                      |   8 +-
> >  include/linux/types.h                         |   2 +-
> >  kernel/vmcore_info.c                          |   2 +-
> >  mm/hugetlb.c                                  |   8 +-
> >  mm/hugetlb_vmemmap.c                          | 245 ++++++++----------
> >  mm/hugetlb_vmemmap.h                          |   4 +-
> >  mm/internal.h                                 |  11 +-
> >  mm/mm_init.c                                  |   2 +-
> >  mm/page_alloc.c                               |   4 +-
> >  mm/slab.h                                     |   2 +-
> >  mm/util.c                                     |  15 +-
> >  16 files changed, 242 insertions(+), 311 deletions(-)
> >
> > --
> > 2.51.2
> >
> >
> 
> I love this in general - I've always disliked the fake head
> construction (though I understand the reason behind it).
> 
> However, it seems like you didn't add support to vmemmap_populate_hvo,
> as far as I can tell. That's the function that is used to do HVO early
> on bootmem (memblock) allocated 'gigantic' pages. So I think that
> would break with this patch.

Ouch. Good catch. Will fix.

> Could you add support there too? I don't think it would be hard to.
> While at it, you could also do it for vmemmap_populate_hugepages to
> support devdax :-)

Yeah, DAX was on my radar. I will see if it makes sense to make part of
this patchset or make an follow up.

Other thing I want to change is that we probably want to make
vmemmap_tails per node, so each node would use local memory for it.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
