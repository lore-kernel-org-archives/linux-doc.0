Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 401422FABE7
	for <linux-doc@vger.kernel.org>; Sat,  6 Dec 2025 16:29:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765038589; cv=none; b=s9ASEwK8kTrS7kZyPJQUbWOll84RDMvZXws64TMMIqG70lU7dRgmAq1mmB/Kc1H99DBjsAzMKLKRzMA9Pjziy8ct0AACoep7k5tWJI3n8BPTihvo2BsimCxLXSxZnmxAYveuSzpimwDHYg1/LDwMQop+RNDgTgkECsK+fktBCIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765038589; c=relaxed/simple;
	bh=ydJY48jaEnTeWZLT4Ctil4tgpHxl+l58477Lvf4liUM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j+Z1GhZiqc/OdE+oosMy36LFsQQVNDK+6YV5E+QrkY+BuZCZxDETfHBh14Ok2lz6fiQjFntSVgX8lCkx8/0DX/d/XojvNcnyKuU+eJ2r6xrDf/meNVRMsO+6/NNfg97DNHQY5o0MDcBIs1Y/XeT38wvMeSh5ZE5QmsV701soNe8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sd1L2zaE; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sd1L2zaE"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F7D3C116B1;
	Sat,  6 Dec 2025 16:29:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765038588;
	bh=ydJY48jaEnTeWZLT4Ctil4tgpHxl+l58477Lvf4liUM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=sd1L2zaE77SXY0th83w4AO6YFljH3I1z5lZjoGxmaeWoP9qDRRi0/POws4ltWgKXX
	 bc35Vm6oXkHJecU+DLwsI3kIv7G4bRCWNXSqMVGd4K7XP8e9nyEEUCr+cjj7Qp8BNi
	 wpoDa0Dqnlf18oSv1wYZAjXUSGwwpxUhQRkQw6BJ+VuazOAtpomzxgWocMrk5CQgN8
	 yoynvLFMHR87ogefiGjh/iafmG0CK+/J9qPGIwYZ3nZteuxMAI0lCshuCYGLs9YFv9
	 YprMjoi/02P/s4e4U+F0w8W5wmhypQapbI9DwVeU61jROxdvDHuEOWiG9hGJj/Pq6X
	 DvXcSjjAMnT2A==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 632C8F4007B;
	Sat,  6 Dec 2025 11:29:47 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Sat, 06 Dec 2025 11:29:47 -0500
X-ME-Sender: <xms:-1k0aSW_P3YnkBv0k1ojd8FUtfzoHWWa5p5bd2h2My7XBuxH-nFn3w>
    <xme:-1k0aVYGHI_hwLyNbKFMaRxQC-E2C8eO0rm70MVLFuESMQTxgMUYg8uUVLBr2MbEq
    4HP67pRiQky1lAQ7nHLhg1g1ow7hoJbUjjKld5701DYcfIwwKGJp3w>
X-ME-Received: <xmr:-1k0afWMdWUHEp4KPEsdd6l21BXw6EIU8XiTzimiNhFm7pUKx9r2_xY8RqskDQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduudegvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdfstddttddvnecuhfhrohhmpefmihhrhihlucfu
    hhhuthhsvghmrghuuceokhgrsheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrh
    hnpeehieekueevudehvedtvdffkefhueefhfevtdduheehkedthfdtheejveelueffgeen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehkihhrih
    hllhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqudeiudduiedvieehhedq
    vdekgeeggeejvdekqdhkrghspeepkhgvrhhnvghlrdhorhhgsehshhhuthgvmhhovhdrnh
    grmhgvpdhnsggprhgtphhtthhopeefiedpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    ohepuhhsrghmrggrrhhifheigedvsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprghkph
    hmsehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopehmuhgthhhu
    nhdrshhonhhgsehlihhnuhigrdguvghvpdhrtghpthhtohepuggrvhhiugeskhgvrhhnvg
    hlrdhorhhgpdhrtghpthhtohepohhsrghlvhgrughorhesshhushgvrdguvgdprhgtphht
    thhopehrphhptheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvhgsrggskhgrsehsuh
    hsvgdrtgiipdhrtghpthhtoheplhhorhgvnhiiohdrshhtohgrkhgvshesohhrrggtlhgv
    rdgtohhmpdhrtghpthhtohepfihilhhlhiesihhnfhhrrgguvggrugdrohhrgh
X-ME-Proxy: <xmx:-1k0acLtjk8yFSJiBvKd8TOwRoZcttXKzSffSbe9P4m7X_3V0kkuiA>
    <xmx:-1k0aQ0LANSrZyINz2z2E6vdGna-18A37mqzb9dGu9N83onDOqigxA>
    <xmx:-1k0ac_K3Caem0ZT12pJNlF6xCffjqXs3wXi2V4hfqUC0TjW58_veg>
    <xmx:-1k0adiQzG3GkWP-ELAeD05oeNgLOe3WD7jc7qCUNFg3ucktBEEDoA>
    <xmx:-1k0aYUExfRL64culUxnu2-wmazdCOii3rfDjfmXkBp1-4JLfwFrW_Tq>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sat,
 6 Dec 2025 11:29:46 -0500 (EST)
Date: Sat, 6 Dec 2025 16:29:44 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: Usama Arif <usamaarif642@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Muchun Song <muchun.song@linux.dev>, David Hildenbrand <david@kernel.org>, 
	Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>, 
	Vlastimil Babka <vbabka@suse.cz>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Matthew Wilcox <willy@infradead.org>, Zi Yan <ziy@nvidia.com>, Baoquan He <bhe@redhat.com>, 
	Michal Hocko <mhocko@suse.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Jonathan Corbet <corbet@lwn.net>, kernel-team@meta.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 04/11] mm: Rework compound_head() for power-of-2
 sizeof(struct page)
Message-ID: <t3z3msqpbtnkgwqs5fxvnd4zsymclxzzr6vcaubv7z5jtqd46i@g5vtuktue54s>
References: <20251205194351.1646318-1-kas@kernel.org>
 <20251205194351.1646318-5-kas@kernel.org>
 <22609798-e84b-46ca-9cb5-649ffba4a2a4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <22609798-e84b-46ca-9cb5-649ffba4a2a4@gmail.com>

On Sat, Dec 06, 2025 at 12:25:12AM +0000, Usama Arif wrote:
> 
> 
> On 05/12/2025 19:43, Kiryl Shutsemau wrote:
> > For tail pages, the kernel uses the 'compound_info' field to get to the
> > head page. The bit 0 of the field indicates whether the page is a
> > tail page, and if set, the remaining bits represent a pointer to the
> > head page.
> > 
> > For cases when size of struct page is power-of-2, change the encoding of
> > compound_info to store a mask that can be applied to the virtual address
> > of the tail page in order to access the head page. It is possible
> > because sturct page of the head page is naturally aligned with regards
> 
> nit: s/sturct/struct/

Ack.

> > to order of the page.
> 
> Might be good to add to state here that no change expected if the struct page
> is not a power of 2.

Okay.

> > 
> > The significant impact of this modification is that all tail pages of
> > the same order will now have identical 'compound_info', regardless of
> > the compound page they are associated with. This paves the way for
> > eliminating fake heads.
> > 
> > Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
> > ---
> >  include/linux/page-flags.h | 61 +++++++++++++++++++++++++++++++++-----
> >  mm/util.c                  | 15 +++++++---
> >  2 files changed, 64 insertions(+), 12 deletions(-)
> > 
> > diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
> > index 11d9499e5ced..eef02fbbb40f 100644
> > --- a/include/linux/page-flags.h
> > +++ b/include/linux/page-flags.h
> > @@ -210,6 +210,13 @@ static __always_inline const struct page *page_fixed_fake_head(const struct page
> >  	if (!static_branch_unlikely(&hugetlb_optimize_vmemmap_key))
> >  		return page;
> >  
> > +	/*
> > +	 * Fake heads only exists if size of struct page is power-of-2.
> > +	 * See hugetlb_vmemmap_optimizable_size().
> > +	 */
> > +	if (!is_power_of_2(sizeof(struct page)))
> > +		return page;
> > +
> 
> 
> hmm my understanding reviewing up until this patch of the series is that everything works
> the same as old code when struct page is not a power of 2. Returning page here means you dont
> fix page head when sizeof(struct page) is not a power of 2?

There's no change for non-power-of-2 sizeof(struct page) as there's no
fake heads because there's no HVO for such cases.

See hugetlb_vmemmap_optimizable_size() as I mentioned in the comment.

> 
> >  	/*
> >  	 * Only addresses aligned with PAGE_SIZE of struct page may be fake head
> >  	 * struct page. The alignment check aims to avoid access the fields (
> > @@ -223,10 +230,13 @@ static __always_inline const struct page *page_fixed_fake_head(const struct page
> >  		 * because the @page is a compound page composed with at least
> >  		 * two contiguous pages.
> >  		 */
> > -		unsigned long head = READ_ONCE(page[1].compound_info);
> > +		unsigned long info = READ_ONCE(page[1].compound_info);
> >  
> > -		if (likely(head & 1))
> > -			return (const struct page *)(head - 1);
> > +		if (likely(info & 1)) {
> > +			unsigned long p = (unsigned long)page;
> > +
> > +			return (const struct page *)(p & info);
> 
> Would it be worth writing a comment over here similar to what you have in set_compound_head
> to explain why this works? i.e. compound_info contains the mask derived from folio order that
> can be applied to the virtual address to get the head page.

But this code is about to be deleted. Is it really worth it?

> Also, it takes a few minutes to wrap your head around the fact that this works because the struct
> page of the head page is aligned wrt to the order. Maybe it might be good to add that somewhere as
> a comment somewhere? I dont see it documented in this patch, if its in a future patch, please ignore
> this comment. 

Okay, I will try to explain it better.

> 
> > +		}
> >  	}
> >  	return page;
> >  }
> > @@ -281,11 +291,27 @@ static __always_inline int page_is_fake_head(const struct page *page)
> >  
> >  static __always_inline unsigned long _compound_head(const struct page *page)
> >  {
> > -	unsigned long head = READ_ONCE(page->compound_info);
> > +	unsigned long info = READ_ONCE(page->compound_info);
> >  
> > -	if (unlikely(head & 1))
> > -		return head - 1;
> > -	return (unsigned long)page_fixed_fake_head(page);
> > +	/* Bit 0 encodes PageTail() */
> > +	if (!(info & 1))
> > +		return (unsigned long)page_fixed_fake_head(page);
> > +
> > +	/*
> > +	 * If the size of struct page is not power-of-2, the rest if
> 
> nit: s/if/of

Ack.

> 
> > +	 * compound_info is the pointer to the head page.
> > +	 */
> > +	if (!is_power_of_2(sizeof(struct page)))
> > +		return info - 1;
> > +
> > +	/*
> > +	 * If the size of struct page is power-of-2 it is set the rest of
> 
> nit: remove "it is set"

Ack.

> 
> > +	 * the info encodes the mask that converts the address of the tail
> > +	 * page to the head page.
> > +	 *
> > +	 * No need to clear bit 0 in the mask as 'page' always has it clear.
> > +	 */
> > +	return (unsigned long)page & info;
> >  }
> >  
> >  #define compound_head(page)	((typeof(page))_compound_head(page))
> > @@ -294,7 +320,26 @@ static __always_inline void set_compound_head(struct page *page,
> >  					      struct page *head,
> >  					      unsigned int order)
> >  {
> > -	WRITE_ONCE(page->compound_info, (unsigned long)head + 1);
> > +	unsigned int shift;
> > +	unsigned long mask;
> > +
> > +	if (!is_power_of_2(sizeof(struct page))) {
> > +		WRITE_ONCE(page->compound_info, (unsigned long)head | 1);
> > +		return;
> > +	}
> > +
> > +	/*
> > +	 * If the size of struct page is power-of-2, bits [shift:0] of the
> > +	 * virtual address of compound head are zero.
> > +	 *
> > +	 * Calculate mask that can be applied the virtual address of the
> 
> nit: applied to the ..

Ack.

> 
> > +	 * tail page to get address of the head page.
> > +	 */
> > +	shift = order + order_base_2(sizeof(struct page));
> > +	mask = GENMASK(BITS_PER_LONG - 1, shift);
> > +
> > +	/* Bit 0 encodes PageTail() */
> > +	WRITE_ONCE(page->compound_info, mask | 1);
> >  }
> >  
> >  static __always_inline void clear_compound_head(struct page *page)
> > diff --git a/mm/util.c b/mm/util.c
> > index cbf93cf3223a..6723d2bb7f1e 100644
> > --- a/mm/util.c
> > +++ b/mm/util.c
> > @@ -1234,7 +1234,7 @@ static void set_ps_flags(struct page_snapshot *ps, const struct folio *folio,
> >   */
> >  void snapshot_page(struct page_snapshot *ps, const struct page *page)
> >  {
> > -	unsigned long head, nr_pages = 1;
> > +	unsigned long info, nr_pages = 1;
> >  	struct folio *foliop;
> >  	int loops = 5;
> >  
> > @@ -1244,8 +1244,8 @@ void snapshot_page(struct page_snapshot *ps, const struct page *page)
> >  again:
> >  	memset(&ps->folio_snapshot, 0, sizeof(struct folio));
> >  	memcpy(&ps->page_snapshot, page, sizeof(*page));
> > -	head = ps->page_snapshot.compound_info;
> > -	if ((head & 1) == 0) {
> > +	info = ps->page_snapshot.compound_info;
> > +	if ((info & 1) == 0) {
> >  		ps->idx = 0;
> >  		foliop = (struct folio *)&ps->page_snapshot;
> >  		if (!folio_test_large(foliop)) {
> > @@ -1256,7 +1256,14 @@ void snapshot_page(struct page_snapshot *ps, const struct page *page)
> >  		}
> >  		foliop = (struct folio *)page;
> >  	} else {
> > -		foliop = (struct folio *)(head - 1);
> > +		unsigned long p = (unsigned long)page;
> > +
> > +		/* See compound_head() */
> > +		if (is_power_of_2(sizeof(struct page)))
> > +			foliop = (struct folio *)(p & info);
> > +		else
> > +			foliop = (struct folio *)(info - 1);
> > +
> 
> Would it be better to do below, as you dont need to than declare p if sizeof(struct page) is not
> a power of 2?
> 
> if (!is_power_of_2(sizeof(struct page)))
> 	foliop = (struct folio *)(info - 1);
> else {
> 	unsigned long p = (unsigned long)page;
> 	foliop = (struct folio *)(p & info);
> }

Okay.

> 	
> >  		ps->idx = folio_page_idx(foliop, page);
> >  	}
> >  
> 

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
