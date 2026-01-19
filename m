Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 55F44363C4E
	for <linux-doc@vger.kernel.org>; Mon, 19 Jan 2026 15:26:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768836405; cv=none; b=QfJXoS6H8R4Apohyes4JnyOdfYN78nQXOpnU1S9PwW8oX7sKjvnbWiAF5wHSM+yTu7ZSsVW09OYwLuC5xjxMB0lPWkcZdESZBwcEIvei3X27aNxKFSDzOCoyKneZ+yMt5HWxiMK2vRkMf7iAwNlbfS7UWEo5OZ5EIOQCTm8VYrs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768836405; c=relaxed/simple;
	bh=KIfEZnvVSwR/fdHFcIyoOb+BmBvRKs+lPm5Ma8PC1uA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=p5fFdDthxeW224AGXxk9oU/kJPHLdlOSYObMX2/G7GZzISKEEsLLFFf2Zr7LKIWDZj2CEejPeN6UPo7/zGk2uTimR4DXdYgw05uBrOy923lZxctgnvBAaT8d2JmjBIQjJVLoo6AfYA9g5NI0rvA3Rxn0EBF7lOU7RJVzmUBjCTg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tHfpmwJQ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tHfpmwJQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49A57C19423;
	Mon, 19 Jan 2026 15:26:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768836405;
	bh=KIfEZnvVSwR/fdHFcIyoOb+BmBvRKs+lPm5Ma8PC1uA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tHfpmwJQ/PQFt2xT+SEpiFHyXKEtKz/2BaLIPmJFTjGDLdwNgwTlavG98jxxrWA6L
	 9Z8Aq2F6A4kWC2qL6Q7AI32SgejNCavBlO7aa9rY0Du+PSHA33H80rd2i9ubvMt0Hd
	 IZ+BE8PG4RDUldHmgV2LLjb0hE71ednPvvaIfUiEVbHO8lpHjehU4vjf9i81M5pSsQ
	 MBQKcd71P24mwPOvkVznKEFKVHF4cKqOPX8JQWjhF4IkSEeGNDUmkEhRAmETtchPt2
	 BLF8bpnWHUfrEbmA4D7GoJokGuCqFbRDSbsxC9VbrwFeoCAjs181+zVdecWsusnfHF
	 wDt8kowWDSa6g==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 6C75AF4006A;
	Mon, 19 Jan 2026 10:26:43 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Mon, 19 Jan 2026 10:26:43 -0500
X-ME-Sender: <xms:M01uaV8h5uYjMC3XhEQZoZQECbu4ekHgrt-xVwg39BT5oYT5SVNrKA>
    <xme:M01uaVGuylXEbUCNt0zochxUJ0xuojGjv33haUaJhjDjPkbeHyhjA2BqdoXX_gMO8
    HbrQRIHFT7u7YXNO-013mdtZ27Nexvwl7t2f-Hjv8rRi7v8SohzgOM>
X-ME-Received: <xmr:M01uacYERr1mWJ1MDmdYx4mDgbbeDi5s7mjE-syCDNl7k_EPdzjzJK6D4NNxiw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddufeejledvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefmihhrhihl
    ucfuhhhuthhsvghmrghuuceokhgrsheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtth
    gvrhhnpeeigfdvtdekveejhfehtdduueeuieekjeekvdfggfdtkeegieevjedvgeetvdeh
    gfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehkih
    hrihhllhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqudeiudduiedvieeh
    hedqvdekgeeggeejvdekqdhkrghspeepkhgvrhhnvghlrdhorhhgsehshhhuthgvmhhovh
    drnhgrmhgvpdhnsggprhgtphhtthhopeefkedpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtohepmhhutghhuhhnrdhsohhngheslhhinhhugidruggvvhdprhgtphhtthhopehosh
    grlhhvrgguohhrsehsuhhsvgdruggvpdhrtghpthhtoheprhhpphhtsehkvghrnhgvlhdr
    ohhrghdprhgtphhtthhopehvsggrsghkrgesshhushgvrdgtiidprhgtphhtthhopehloh
    hrvghniihordhsthhorghkvghssehorhgrtghlvgdrtghomhdprhgtphhtthhopeiiihih
    sehnvhhiughirgdrtghomhdprhgtphhtthhopegshhgvsehrvgguhhgrthdrtghomhdprh
    gtphhtthhopehmhhhotghkohesshhushgvrdgtohhmpdhrtghpthhtohephhgrnhhnvghs
    segtmhhpgigthhhgrdhorhhg
X-ME-Proxy: <xmx:M01uaRM0DQ2aJPP_GLYEZ8HJ0-d2wLosW4i98UrNgylbn5um2dF9Uw>
    <xmx:M01uaVwplewMWQ15ovxywgMf0zYWAv3McDkYhcESkmXxqLw228lDIw>
    <xmx:M01uaSBu4EUXzX-xiPFUbV_wwP2eqtLHFZds_EfIg6mJEWUJ7o3OSA>
    <xmx:M01uae5tIXEVxqD-1KZJAD_WlmLrP7gp93mERNpmTaJiTyOrSX-ASA>
    <xmx:M01uaQL9y8L0-fzdTOAhdcY8dB9mniwUEt5cfefhgTig97fm5fzZBULx>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Jan 2026 10:26:41 -0500 (EST)
Date: Mon, 19 Jan 2026 15:26:37 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: Muchun Song <muchun.song@linux.dev>
Cc: Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>, 
	Vlastimil Babka <vbabka@suse.cz>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Zi Yan <ziy@nvidia.com>, Baoquan He <bhe@redhat.com>, Michal Hocko <mhocko@suse.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>, kernel-team@meta.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Matthew Wilcox <willy@infradead.org>, Usama Arif <usamaarif642@gmail.com>, 
	Frank van der Linden <fvdl@google.com>
Subject: Re: [PATCHv3 09/15] mm/hugetlb: Refactor code around vmemmap_walk
Message-ID: <aW5NDEuP_pRLsq9d@thinkstation>
References: <20260115144604.822702-1-kas@kernel.org>
 <20260115144604.822702-10-kas@kernel.org>
 <72e04317-913e-4db1-89ed-61727bbdd01e@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <72e04317-913e-4db1-89ed-61727bbdd01e@linux.dev>

On Mon, Jan 19, 2026 at 06:04:32PM +0800, Muchun Song wrote:
> > @@ -415,29 +377,27 @@ static int alloc_vmemmap_page_list(unsigned long start, unsigned long end,
> >    *		to remap.
> >    * @end:	end address of the vmemmap virtual address range that we want to
> >    *		remap.
> > - * @reuse:	reuse address.
> >    * @flags:	modifications to vmemmap_remap_walk flags
> >    *
> >    * Return: %0 on success, negative error code otherwise.
> >    */
> >   static int vmemmap_remap_alloc(unsigned long start, unsigned long end,
> > -			       unsigned long reuse, unsigned long flags)
> > +			       unsigned long flags)
> >   {
> >   	LIST_HEAD(vmemmap_pages);
> >   	struct vmemmap_remap_walk walk = {
> >   		.remap_pte	= vmemmap_restore_pte,
> > -		.reuse_addr	= reuse,
> > +		.vmemmap_start	= start,
> >   		.vmemmap_pages	= &vmemmap_pages,
> >   		.flags		= flags,
> >   	};
> > -	/* See the comment in the vmemmap_remap_free(). */
> > -	BUG_ON(start - reuse != PAGE_SIZE);
> > +	start += HUGETLB_VMEMMAP_RESERVE_SIZE;
> 
> From the @start comment above this function, we can see that the @start
> address is the starting address for the remap operation we want to perform.
> However, the modification here does not conform to the semantics here.
> Therefore, I suggest letting the caller __hugetlb_vmemmap_restore_folio()
> pass the correct parameters itself.
> 
> The reason we previously used the reuse address here is that the
> initialization of ->reuse_page was inside vmemmap_pte_entry. Now,
> ->reuse_page has been removed in your patch.

Fair enough.

> > @@ -466,18 +425,16 @@ static int __hugetlb_vmemmap_restore_folio(const struct hstate *h,
> >   	if (flags & VMEMMAP_SYNCHRONIZE_RCU)
> >   		synchronize_rcu();
> > +	vmemmap_start	= (unsigned long)folio;
> 
> (unsigned long)&folio->page？The folio is the metadata for contiguous pages,
> while the page is our optimization target. Although their values are the
> same now, their semantics are different.

Okay.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
