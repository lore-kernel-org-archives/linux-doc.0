Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4CDA6299AAA
	for <linux-doc@vger.kernel.org>; Mon, 22 Dec 2025 14:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766412210; cv=none; b=BLBCj2pyvzpU2KmD/z+SgtVEGf7sXyHp+YNafz/tLqNXVK/OEJPSRcdi14kzKIbb1OwFxcQHkLpNQeab0+YIw0079Qmfc5xMvpKO9v0YwR3wVfV+2JpwhI4j48fic5DNYvdHLH4kgq7rlun5uNdVTkGvO+rwf6SRanzaMf9riP8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766412210; c=relaxed/simple;
	bh=9DgOj5Gptqy76zjThDN8kQAxpjk/REjj41+b5ZSphmE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tKUttvCGWsyjIN7qoi310XimX5HMMCNuFvUSYQ8SZJg2df0le+qj66qCuIPVPZJnvMRFXl9ErHPdGbm+pKsZcRGZa9M+daSkjLQL1kuK6LV8DBmrGX2zmXZAU9X5t3daUWnBHYLQRddYQwBs6ne4UGw/A+VDzpg7uWdRDwrTaRE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=M7tLTNCr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="M7tLTNCr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F8CBC116D0;
	Mon, 22 Dec 2025 14:03:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766412209;
	bh=9DgOj5Gptqy76zjThDN8kQAxpjk/REjj41+b5ZSphmE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=M7tLTNCrWNYQ/7PrrMLvyEuYgjCH5LfOyArwaHv34S9lryP33WsrcctluI1On7ufk
	 O4FjFp/HZ7UFjdJ61/7HofWzqiRHCs/NZ4myKKWq9dnY1SMVnCN70wzdRyaioNekdh
	 2WhXNmhYfJ8MuQuhGYxB7JakVMyX1AFtj77TpApljHRBCRuPA+0gfMaIMfjrxhQ1vp
	 l+HejWUGdOKQJZQf9t0BmaFBa+dCyawx++TDWMNFpwd7Tisy5blHRpZG4L5mPMDbDT
	 xf5RBCqKROmD2P+H5V6OqzsqU+547/51VbvV0v3/cVWfdsqb3TfQMSwjnY9fa7QbFZ
	 7NhbBau7Km+/Q==
Received: from phl-compute-02.internal (phl-compute-02.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id 8AD5FF4006A;
	Mon, 22 Dec 2025 09:03:27 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Mon, 22 Dec 2025 09:03:27 -0500
X-ME-Sender: <xms:r09JaYhAmSRKPUlPB3BoDqrrIbqOl9wEMMStQD_JUGHsLIaZtnGX6Q>
    <xme:r09JacbI2dCUOJNCCf3bLh7e3fLkW8EWcryrz558T-81Epo2H7RZnUf0Q44JTRTDF
    sdu6wkXJ_uWo4iymHMBkLeZm1Xtl9w5drLySza6YCzhhZHmQuraMYE>
X-ME-Received: <xmr:r09JaZdmVY7xd7-ysD7ZCHGGX300vEJqIU2cct-wbmZ716u9RNU_yBsJJuVpfA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdehjedufecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdfstddttddvnecuhfhrohhmpefmihhrhihlucfu
    hhhuthhsvghmrghuuceokhgrsheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrh
    hnpeehieekueevudehvedtvdffkefhueefhfevtdduheehkedthfdtheejveelueffgeen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehkihhrih
    hllhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqudeiudduiedvieehhedq
    vdekgeeggeejvdekqdhkrghspeepkhgvrhhnvghlrdhorhhgsehshhhuthgvmhhovhdrnh
    grmhgvpdhnsggprhgtphhtthhopeefkedpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    ohepmhhutghhuhhnrdhsohhngheslhhinhhugidruggvvhdprhgtphhtthhopehoshgrlh
    hvrgguohhrsehsuhhsvgdruggvpdhrtghpthhtoheprhhpphhtsehkvghrnhgvlhdrohhr
    ghdprhgtphhtthhopehvsggrsghkrgesshhushgvrdgtiidprhgtphhtthhopehlohhrvg
    hniihordhsthhorghkvghssehorhgrtghlvgdrtghomhdprhgtphhtthhopeiiihihsehn
    vhhiughirgdrtghomhdprhgtphhtthhopegshhgvsehrvgguhhgrthdrtghomhdprhgtph
    htthhopehmhhhotghkohesshhushgvrdgtohhmpdhrtghpthhtohephhgrnhhnvghssegt
    mhhpgigthhhgrdhorhhg
X-ME-Proxy: <xmx:r09JaRCgJ039la30vo_qqr-9kOQP0qCiXjx2GbIQcf3hF-_ftldq5A>
    <xmx:r09JaRVyFujtE5uiO6E2PKZjUuXhjJlWhm1EWw3UG9pkob4PR4WHJQ>
    <xmx:r09JaeWazvttAo1_43_twks3uTrkiC1KiryBBeiMigwccGCLKawbRA>
    <xmx:r09Jac97X_9X381pbCn2ATFmED9uoemQlsTqhhjrTECjiv9jnCzVJA>
    <xmx:r09Jac8LHP2VjBiMnCs_9LObcgdLVnUppshRM_ODIXVHFL60Ii8YRuyw>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 22 Dec 2025 09:03:26 -0500 (EST)
Date: Mon, 22 Dec 2025 14:03:25 +0000
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
Subject: Re: [PATCHv2 06/14] mm: Rework compound_head() for power-of-2
 sizeof(struct page)
Message-ID: <jre3fk4ojcw4qbnp2feq7ed4iwo4zjj5leehv6l6jtw6soigm2@iybzeqz7jyi7>
References: <20251218150949.721480-1-kas@kernel.org>
 <20251218150949.721480-7-kas@kernel.org>
 <bde227ef-b072-4f48-ab68-bf184dfe7421@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <bde227ef-b072-4f48-ab68-bf184dfe7421@linux.dev>

On Mon, Dec 22, 2025 at 11:20:48AM +0800, Muchun Song wrote:
> 
> 
> On 2025/12/18 23:09, Kiryl Shutsemau wrote:
> > For tail pages, the kernel uses the 'compound_info' field to get to the
> > head page. The bit 0 of the field indicates whether the page is a
> > tail page, and if set, the remaining bits represent a pointer to the
> > head page.
> > 
> > For cases when size of struct page is power-of-2, change the encoding of
> > compound_info to store a mask that can be applied to the virtual address
> > of the tail page in order to access the head page. It is possible
> > because struct page of the head page is naturally aligned with regards
> > to order of the page.
> > 
> > The significant impact of this modification is that all tail pages of
> > the same order will now have identical 'compound_info', regardless of
> > the compound page they are associated with. This paves the way for
> > eliminating fake heads.
> > 
> > The HugeTLB Vmemmap Optimization (HVO) creates fake heads and it is only
> > applied when the sizeof(struct page) is power-of-2. Having identical
> > tail pages allows the same page to be mapped into the vmemmap of all
> > pages, maintaining memory savings without fake heads.
> > 
> > If sizeof(struct page) is not power-of-2, there is no functional
> > changes.
> > 
> > Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
> 
> Reviewed-by: Muchun Song <muchun.song@linux.dev>
> 
> One nit bellow.
> 
> > ---
> >   include/linux/page-flags.h | 62 +++++++++++++++++++++++++++++++++-----
> >   mm/util.c                  | 16 +++++++---
> >   2 files changed, 66 insertions(+), 12 deletions(-)
> > 
> > diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
> > index 0de7db7efb00..fac5f41b3b27 100644
> > --- a/include/linux/page-flags.h
> > +++ b/include/linux/page-flags.h
> > @@ -210,6 +210,13 @@ static __always_inline const struct page *page_fixed_fake_head(const struct page
> >   	if (!static_branch_unlikely(&hugetlb_optimize_vmemmap_key))
> >   		return page;
> > +	/*
> > +	 * Fake heads only exists if size of struct page is power-of-2.
> > +	 * See hugetlb_vmemmap_optimizable_size().
> > +	 */
> > +	if (!is_power_of_2(sizeof(struct page)))
> > +		return page;
> > +
> >   	/*
> >   	 * Only addresses aligned with PAGE_SIZE of struct page may be fake head
> >   	 * struct page. The alignment check aims to avoid access the fields (
> > @@ -223,10 +230,14 @@ static __always_inline const struct page *page_fixed_fake_head(const struct page
> >   		 * because the @page is a compound page composed with at least
> >   		 * two contiguous pages.
> >   		 */
> > -		unsigned long head = READ_ONCE(page[1].compound_info);
> > +		unsigned long info = READ_ONCE(page[1].compound_info);
> > -		if (likely(head & 1))
> > -			return (const struct page *)(head - 1);
> > +		/* See set_compound_head() */
> > +		if (likely(info & 1)) {
> > +			unsigned long p = (unsigned long)page;
> > +
> > +			return (const struct page *)(p & info);
> > +		}
> >   	}
> >   	return page;
> >   }
> > @@ -281,11 +292,27 @@ static __always_inline int page_is_fake_head(const struct page *page)
> >   static __always_inline unsigned long _compound_head(const struct page *page)
> >   {
> > -	unsigned long head = READ_ONCE(page->compound_info);
> > +	unsigned long info = READ_ONCE(page->compound_info);
> > -	if (unlikely(head & 1))
> > -		return head - 1;
> > -	return (unsigned long)page_fixed_fake_head(page);
> > +	/* Bit 0 encodes PageTail() */
> > +	if (!(info & 1))
> > +		return (unsigned long)page_fixed_fake_head(page);
> > +
> > +	/*
> > +	 * If the size of struct page is not power-of-2, the rest of
> > +	 * compound_info is the pointer to the head page.
> > +	 */
> > +	if (!is_power_of_2(sizeof(struct page)))
> > +		return info - 1;
> > +
> > +	/*
> > +	 * If the size of struct page is power-of-2 the rest of the info
> > +	 * encodes the mask that converts the address of the tail page to
> > +	 * the head page.
> > +	 *
> > +	 * No need to clear bit 0 in the mask as 'page' always has it clear.
> > +	 */
> > +	return (unsigned long)page & info;
> >   }
> >   #define compound_head(page)	((typeof(page))_compound_head(page))
> > @@ -294,7 +321,26 @@ static __always_inline void set_compound_head(struct page *page,
> >   					      const struct page *head,
> >   					      unsigned int order)
> >   {
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
> > +	 * Calculate mask that can be applied to the virtual address of
> > +	 * the tail page to get address of the head page.
> > +	 */
> > +	shift = order + order_base_2(sizeof(struct page));
> 
> We already have a macro for order_base_2(sizeof(struct page)),
> that is STRUCT_PAGE_MAX_SHIFT.

I used it before, but the name is obscure and opencoded version is
easier to follow in my view.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
