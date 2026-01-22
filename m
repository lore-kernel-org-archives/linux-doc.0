Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 092213B9607;
	Thu, 22 Jan 2026 11:21:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769080871; cv=none; b=ntTj9F/gNpNAJHfB84xjxQ91Fnt1GegURh8v36ym/NhJMN8i+fT0v2o3tY7D0gw7P8QcNm/OdRCefVayPNKj4pFOigQ+0+WRGEL+X4qp8/2isNVewN7+OAaLOalnIR+NxINwnFTJ8WRVmuS5EQhw2tm2lafBvuXDg5A4pajzu04=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769080871; c=relaxed/simple;
	bh=VVYB42EXsa5dHTnW7jkKj+G3U+OwviE4GOibQcUBCeE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=u5SJ9v77Av5HSncvl9zfZl/zmmlodM/CIrWRayOuMP+meVPk1EQEeoZ3qUvVUtR9UMsWQRQtd/PiOcwybOsbTRwxgxaDMrQcFK/kAxxjfohZW0wzLejIrHgZmjqa4VtoGnwdGPYDjQPgF4apfSepgIzrxJONsjm+A8TShgez87A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J8tDWLDF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J8tDWLDF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 04515C4AF09;
	Thu, 22 Jan 2026 11:21:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769080870;
	bh=VVYB42EXsa5dHTnW7jkKj+G3U+OwviE4GOibQcUBCeE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=J8tDWLDFZJ7a8EY05CViBW55Ec7GfQaMHJ7bQs5Nf29ogSH6AGdHuJRvtIhiBE/PF
	 RcSBwt2nDVNX6xmpEQA1GgWlN/ol7/G/e96zQzlf3LKKG1+ImTjkXCcJoyNB9jKRT9
	 wvuQ6vhVh8hg8eG75dcVoCws7iJpaYfBJhFYVWf8+clgRgFx3wK64PIprO+Xlc/r0b
	 Tb9CuQf/7s23tA4Z/CY0ACY3zzc8iPaGJ+FJm3mRm1Z1kQ0geg4YAaGkej7Hovrnd0
	 R0QTRnQylmOoV+zfB1T9q/twqZzDfNflKA1Wpbsv6ct+fQ554+EzaL6OrC7OvrBo/j
	 vOVZJ23bT0adQ==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 03631F40068;
	Thu, 22 Jan 2026 06:21:09 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Thu, 22 Jan 2026 06:21:09 -0500
X-ME-Sender: <xms:JAhyaSHblGvcUJSLJB_cXK7KFo9tSulKnNYWmc5d1jafjSpJb5mdKw>
    <xme:JAhyaesR7EmfZZCFKnbMePKwmdL6Edw5gMgbTbmgOuXlxrkb8YuwDbiLMWXkNrLxr
    MKwgYfWYLougID0kS4c0QaRI1JGp3EZLwV5cXkdeKMVjH1frENbgf7s>
X-ME-Received: <xmr:JAhyaVjJ8QwrYtsqqWkt92Dc2l6n1-PRQRNKYx2f4RZ895A3FouqpRDL9VcGiw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugeeitddvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefmihhrhihl
    ucfuhhhuthhsvghmrghuuceokhgrsheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtth
    gvrhhnpeegheduleehveejffdtueehgeduhfeiuedtgeejudekfeffueegveevhfetjeeu
    hfenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomhepkhhirhhilhhlodhmvghsmhhtphgruhhthhhp
    vghrshhonhgrlhhithihqdduieduudeivdeiheehqddvkeeggeegjedvkedqkhgrsheppe
    hkvghrnhgvlhdrohhrghesshhhuhhtvghmohhvrdhnrghmvgdpnhgspghrtghpthhtohep
    feekpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopeiiihihsehnvhhiughirgdrtg
    homhdprhgtphhtthhopehvsggrsghkrgesshhushgvrdgtiidprhgtphhtthhopegrkhhp
    mheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepmhhutghhuh
    hnrdhsohhngheslhhinhhugidruggvvhdprhgtphhtthhopegurghvihgusehkvghrnhgv
    lhdrohhrghdprhgtphhtthhopeifihhllhihsehinhhfrhgruggvrggurdhorhhgpdhrtg
    hpthhtohepuhhsrghmrggrrhhifheigedvsehgmhgrihhlrdgtohhmpdhrtghpthhtohep
    fhhvughlsehgohhoghhlvgdrtghomhdprhgtphhtthhopehoshgrlhhvrgguohhrsehsuh
    hsvgdruggv
X-ME-Proxy: <xmx:JAhyaT0SYx4WjkwcZtAqFfwXW9otD6VW8U4thpfdiXFWYVg1tVcA2Q>
    <xmx:JAhyaT59dq4WFuAOYPZHJDGV4ZZYreINFXtMUxF2sIncHtdYHJZlxQ>
    <xmx:JAhyaVoxhpRkVeakoFptGabghnw6mcKLxo3Y-WQSJeSmQjFDB5_UBg>
    <xmx:JAhyaaCpkyAhQeGRQIMdsdR4GUc_ZzBVTOkGm4WGRBLP2jDXuhdZ1A>
    <xmx:JAhyacxTKXwy2b4CVqVOVO1hYX1khOnZAMCpVLulNL2Pw7GIQdK734YW>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Jan 2026 06:21:07 -0500 (EST)
Date: Thu, 22 Jan 2026 11:21:00 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: Zi Yan <ziy@nvidia.com>
Cc: Vlastimil Babka <vbabka@suse.cz>, 
	Andrew Morton <akpm@linux-foundation.org>, Muchun Song <muchun.song@linux.dev>, 
	David Hildenbrand <david@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Usama Arif <usamaarif642@gmail.com>, Frank van der Linden <fvdl@google.com>, 
	Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Baoquan He <bhe@redhat.com>, Michal Hocko <mhocko@suse.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>, kernel-team@meta.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCHv4 00/14] mm: Eliminate fake head pages from vmemmap
 optimization
Message-ID: <aXIG96srTJw8_2aQ@thinkstation>
References: <20260121162253.2216580-1-kas@kernel.org>
 <bc7b8c62-a8b3-4407-a69f-30b3fd269566@suse.cz>
 <E99A40AF-1535-4FC0-BEE5-6F0F5B3FF840@nvidia.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <E99A40AF-1535-4FC0-BEE5-6F0F5B3FF840@nvidia.com>

On Wed, Jan 21, 2026 at 03:31:59PM -0500, Zi Yan wrote:
> On 21 Jan 2026, at 13:44, Vlastimil Babka wrote:
> 
> > On 1/21/26 17:22, Kiryl Shutsemau wrote:
> >> This series removes "fake head pages" from the HugeTLB vmemmap
> >> optimization (HVO) by changing how tail pages encode their relationship
> >> to the head page.
> >>
> >> It simplifies compound_head() and page_ref_add_unless(). Both are in the
> >> hot path.
> >
> > We never got the definitive answer in the previous version discussions
> > whether it's worth to do this now with the upcoming memdesc stuff, right?

Right. Willy shared some details[1] about memdesc plan, but I cannot say
I fully understand what it means for this patchset.

I guess we will find out :P

[1] https://lore.kernel.org/all/aWF3xg-72SV4tmLk@casper.infradead.org

> >> Background
> >> ==========
> >>
> >> HVO reduces memory overhead by freeing vmemmap pages for HugeTLB pages
> >> and remapping the freed virtual addresses to a single physical page.
> >> Previously, all tail page vmemmap entries were remapped to the first
> >> vmemmap page (containing the head struct page), creating "fake heads" -
> >> tail pages that appear to have PG_head set when accessed through the
> >> deduplicated vmemmap.
> >>
> >> This required special handling in compound_head() to detect and work
> >> around fake heads, adding complexity and overhead to a very hot path.
> >
> > So a very stupid question, why did we remap everything to the first page,
> > and not instead create two pages, where the first one would contain the head
> > and the first batch of tails, and the second one would be used for the rest
> > of the tails? I'd expect it wouldn't make the memory savings that much
> > worse, and eliminate most of the issues?
> 
> I think it was using 2 pages before[1]. The benefit of using one page is:
> “
> It further reduces the overhead of struct
> page by 12.5% for a 2MB HugeTLB compared to the previous approach,
> which means 2GB per 1TB HugeTLB (2MB type).
> “
> 
> [1] https://lore.kernel.org/all/20211101031651.75851-1-songmuchun@bytedance.com/T/#u

Yeah, the 12.5%.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
