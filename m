Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 45C85221F20;
	Thu,  8 Jan 2026 13:30:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767879040; cv=none; b=Md4ddrUdLPsvIYEtgumqbzNjirjqhvgV3wK83nPNeHEBktsTXV12WlU8FbOOubsII97EHBsS2iBfomlLO+52CRgjxvpLv40GxGPe3I7tXP48E8/7JaFUMwTOCBmcig2hLr0aveQ6urOebTKXBqx/nrVwcOdd87alyRfdWYZvjzA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767879040; c=relaxed/simple;
	bh=vRUk+XqHdvozmufdhhIaefKBZmKIIV937W1GpquE0Gg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=CwuazZKpT4KRFwbHRppHJm2FWnXALQcOCOH7X4g01T/FThRihA7FmeqdZQXV1HeBVWpnyx5SOkUQHqrDttOIwfswsa85hd12VJWlCzmmKd8aYQyvesf1zYgTVsTCkDCpmrxIyNdo4xlwum1G9VrUrgXFqAVF8INZmgBMUKeJMP8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=e3SNoI51; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="e3SNoI51"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46FACC16AAE;
	Thu,  8 Jan 2026 13:30:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767879040;
	bh=vRUk+XqHdvozmufdhhIaefKBZmKIIV937W1GpquE0Gg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=e3SNoI512Jq2WsK3jWXFvrCXqZxYATnr2MFOw1GS3OUDwHz7ovVSuG+UMwYc5IcqG
	 DLLI3vCgWSuVmjxjp0cbw2az5WvJhmm2ohNbl7JlMZn+z1HzmLlm+T7adMHW/o5hzv
	 +LD0z5p/WzDKYQAorf4pXEL+2VF8qsU1e7btkdIR6lerBPDe7W2svCU3UiPgsjj+p0
	 GX+V/h61PxeeL5R0kAXkkVjESn0pcQeBPZvcPblTmn95EFWbj9FUdYxCdsJQmwfZkh
	 ulFWviQ04Xh+VHSZKA7SZcreNeOCJYa3e1SgKLVP/GjT79AWrbLL8UgD2Jb8bt+bhH
	 OBYmfetiUkOZQ==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 7E85FF40068;
	Thu,  8 Jan 2026 08:30:38 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Thu, 08 Jan 2026 08:30:38 -0500
X-ME-Sender: <xms:frFfaSRVif06nMdRiz4KFPZI_aQ3K3I-IefcKid0aVrKPMCQuI-NNw>
    <xme:frFfaTK3ZimaT6zVwlCW2sgm4lY_qU17X6P2uBP9M3hrOlly8W2aGl9PJwFy0G5vb
    i5trDp2p6qQATtIxRuJr7gsURlICa6sw6o69Agbejqe3Y4boFGgo7Y>
X-ME-Received: <xmr:frFfaZPyG1RB9djcAbCbCeBhwN2SzNjS8IXYKBrjxxsLWJzrPOqjVqLNimSPdA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddutdeitdejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtsfdttddtvdenucfhrhhomhepmfhirhihlhcu
    ufhhuhhtshgvmhgruhcuoehkrghssehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvg
    hrnhepheeikeeuveduheevtddvffekhfeufefhvedtudehheektdfhtdehjeevleeuffeg
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepkhhirh
    hilhhlodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieduudeivdeiheeh
    qddvkeeggeegjedvkedqkhgrsheppehkvghrnhgvlhdrohhrghesshhhuhhtvghmohhvrd
    hnrghmvgdpnhgspghrtghpthhtohepfeekpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopegurghvihgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopeifihhllhihsehinh
    hfrhgruggvrggurdhorhhgpdhrtghpthhtohepmhhutghhuhhnrdhsohhngheslhhinhhu
    gidruggvvhdprhgtphhtthhopehoshgrlhhvrgguohhrsehsuhhsvgdruggvpdhrtghpth
    htoheprhhpphhtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehvsggrsghkrgesshhu
    shgvrdgtiidprhgtphhtthhopehlohhrvghniihordhsthhorghkvghssehorhgrtghlvg
    drtghomhdprhgtphhtthhopeiiihihsehnvhhiughirgdrtghomhdprhgtphhtthhopegs
    hhgvsehrvgguhhgrthdrtghomh
X-ME-Proxy: <xmx:frFfaVyixXgHd_9H9W4VAbjseEKGgabddGnqE47gOuP0zxIxTLM4AA>
    <xmx:frFfaXG0fXZwzoOa8P9t2XHzZOEGDt6g8Qw89Yy2Q9vgZUVqOFRevg>
    <xmx:frFfaRGENFgJrPnjS9W59vKz2_tB2_YDYBJsko9kRO8_XptEqycdjA>
    <xmx:frFfaYtL0QLr5WGK5GuzkKcCBZ_x5-5pcaXDrn6vv5Dd6_zRFNM3Kw>
    <xmx:frFfadtmhD6O7-VIj2avk77_ct4uJtnf7CyFVfN5Xr8QowIoRMDsLVQy>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 8 Jan 2026 08:30:37 -0500 (EST)
Date: Thu, 8 Jan 2026 13:30:36 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: "David Hildenbrand (Red Hat)" <david@kernel.org>
Cc: Matthew Wilcox <willy@infradead.org>, 
	Muchun Song <muchun.song@linux.dev>, Oscar Salvador <osalvador@suse.de>, 
	Mike Rapoport <rppt@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Zi Yan <ziy@nvidia.com>, Baoquan He <bhe@redhat.com>, 
	Michal Hocko <mhocko@suse.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Jonathan Corbet <corbet@lwn.net>, kernel-team@meta.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Usama Arif <usamaarif642@gmail.com>, 
	Frank van der Linden <fvdl@google.com>
Subject: Re: [PATCHv2 02/14] mm/sparse: Check memmap alignment
Message-ID: <fwgrsslq74vk4dhkuh5hji3xnrql7nxuia6wdeexjltzb4feh3@nbshswn3egkb>
References: <3b758468-9985-49b8-948a-e5837decf52d@kernel.org>
 <CDAEC896-E3EB-4EAB-9F0F-70BC448B3B9A@linux.dev>
 <4f82b8ef-77de-422b-a9a5-691c4eca24a3@kernel.org>
 <glu3noshgeh7ktwwqofk7xcwkvhek2x3hrbdmyyo56gmctdx3t@adsfih557p7g>
 <2ace6fc2-6891-4d6c-98de-c027da03d516@kernel.org>
 <yup3hvfsn4tvfnv32mdf4yoabt4igb2lkvllfac72g3abdkovm@auqdaijzby7d>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <yup3hvfsn4tvfnv32mdf4yoabt4igb2lkvllfac72g3abdkovm@auqdaijzby7d>

On Thu, Jan 08, 2026 at 12:32:47PM +0000, Kiryl Shutsemau wrote:
> On Thu, Jan 08, 2026 at 12:08:35AM +0100, David Hildenbrand (Red Hat) wrote:
> > > > "Then we make page->compound_head point to the dynamically allocated memdesc
> > > > rather than the first page. Then we can transition to the above layout. "
> > > 
> > 
> > Sorry for the late reply, it's been a bit crazy over here.
> > 
> > > I am not sure I understand how it is going to work.
> > > 
> > 
> > I don't recall all the details that Willy shared over the last years while
> > working on folios, but I will try to answer as best as I can from the top of
> > my head. (there are plenty of resources on the list, on the web, in his
> > presentations etc.).
> > 
> > > 32-byte layout indicates that flags will stay in the statically
> > > allocated part, but most (all?) flags are in the head page and we would
> > > need a way to redirect from tail to head in the statically allocated
> > > pages.
> > 
> > When working with folios we will never go through the head page flags.
> > That's why Willy has incrementally converted most folio code that worked on
> > pages to work on folios.
> > 
> > For example, PageUptodate() does a
> > 
> > 	folio_test_uptodate(page_folio(page));
> > 
> > The flags in the 32-byte layout will be used by some non-folio things for
> > which we won't allocate memdescs (just yet) (e.g., free pages in the buddy
> > and other things that does not require a lot of metadata). Some of these
> > flags will be moved into the memdesc pointer in the future as the conversion
> > proceeeds.
> 
> Okay, makes sense.
> 
> > > > The "memdesc" could be a pointer to a "struct folio" that is allocated from
> > > > the slab.
> > > > 
> > > > So in the new memdesc world, all pages part of a folio will point at the
> > > > allocated "struct folio", not the head page where "struct folio" currently
> > > > overlays "struct page".
> > > > 
> > > > That would mean that the proposal in this patch set will have to be reverted
> > > > again.
> > > > 
> > > > 
> > > > At LPC, Willy said that he wants to have something out there in the first
> > > > half of 2026.
> > > 
> > > Okay, seems ambitious to me.
> > 
> > When the program was called "2025" I considered it very ambitious :) Now I
> > consider it ambitious. I think Willy already shared early versions of the
> > "struct slab" split and the "struct ptdesc" split recently on the list.
> > 
> > > 
> > > Last time I asked, we had no idea how much performance would additional
> > > indirection cost us. Do we have a clue?
> > 
> > I raised that in the past, and I think the answer I got was that
> > 
> > (a) We always had these indirection cost when going from tail page to
> >     head page / folio.
> > (b) We must convert the code to do as little page_folio() as possible.
> >     That's why we saw so much code conversion to stop working on pages
> >     and only work on folios.
> > 
> > There are certainly cases where we cannot currently avoid the indirection,
> > like when we traverse a page table and go
> > 
> > 	pfn -> page -> folio
> > 
> > and cannot simply go
> > 
> > 	pfn -> folio
> > 
> > On the bright side, we'll lose the head-page checks and can simply
> > dereference the pointer.
> > 
> > I don't know whether Willy has more information yet, but I would assume that
> > in most cases this will be similar to the performance summary in your cover
> > letter: "... has shown either no change or only a slight improvement within
> > the noise.", just that it will be "only a slight degradation within the
> > noise". :)
> > 
> > We'll learn I guess, in particular which other page -> folio conversions
> > cannot be optimized out by caching the folio.
> > 
> > 
> > For quite some time there will be a magical config option that will switch
> > between both layouts. I'd assume that things will get more complicated if we
> > suddenly have a "compound_head/folio" pointer and a "compound_info" pointer
> > at the same time.
> > 
> > But it's really Willy who has the concept in mind as he is very likely right
> > now busy writing some of that code.
> > 
> > I'm just the messenger.
> > 
> > :)
> > 
> > [I would hope that Willy could share his thoughts]
> 
> If you or Willy think that this patch will impede memdesc progress, I am
> okay not pushing this patchset upstream.

Or other option is to get this patchset upstream (I need to fix/test few
things still) and revert it later when (if?) memdesc lands.

What do you think?

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
