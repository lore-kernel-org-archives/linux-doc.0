Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 62C69310625
	for <linux-doc@vger.kernel.org>; Mon,  8 Dec 2025 10:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765189863; cv=none; b=nbeH0igh0Kz3eL1+y8ODRgCe9HQ6P+Y0UZ6Q4aTr2fYIHKeE1y2Fy6V2FJm9GoUvdt4heeWRbYbMd2td2lODCMpkIlVe7BH/aphz8g/7HOCMJ3uAAWFycuBwTsItfKFIQ5Sw1xfIkjo45/RfQNdtSgV0F42zmlsI9V0QYc+yRwE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765189863; c=relaxed/simple;
	bh=MPhbQ8w2PifKk8ZZOySwJrX1kc9ihTIUWTezaz6STOU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RTwozglju/E3kGzPQqhh1Jv/JNHS/lxac806eLvCLWLI+mJCIm/gA8Kp27K1tHQBwcaYfkWQelbPS226ANFM5dXTCJm1aM30vZJXN3nRUGYZMEzsu6HetFbr3gdtQxeVv6hYvsOvUFU4Du8Cgf8FFEoMsPtdbTskefciZN3oOxA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=n/Qob695; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="n/Qob695"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4864EC4AF09;
	Mon,  8 Dec 2025 10:31:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765189862;
	bh=MPhbQ8w2PifKk8ZZOySwJrX1kc9ihTIUWTezaz6STOU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n/Qob695pgyiOrhNolFB/2eLD10InyU/e/1uUDs9SE9EXRsQr+EQUptNo30Xi0m0j
	 7iH9KA9sqrCVie+PBYqngneecGb4wSTl1YBbFHr1aDMiM/SvFIoYupUEATHT1HiL7U
	 WpgmmcBak+grdPOMuiBXumtlYInFe6OccQ6IG6ySpdQDpIdWXmVDysD+OfagiCMxdv
	 fRSUQSVnpYaQVLs2r7P1Ta4q8TeMBSvefGHij9EgSTq395BuBpsJWwr9uwMnwOdSdw
	 TCU59KjJVGQNq0u57c6lX0ou/hGoPjEYi3Fvp9DjKHhBs3p+OMHkX5LrImrduMtBAY
	 c0atgL1MFRgSg==
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfauth.phl.internal (Postfix) with ESMTP id 6FE89F40079;
	Mon,  8 Dec 2025 05:31:01 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Mon, 08 Dec 2025 05:31:01 -0500
X-ME-Sender: <xms:5ag2aflgg-acM0NFDRwtBqWcll-CxCkWcbJKfBAbOS8ORZtuMP45MQ>
    <xme:5ag2aZplvCaT8rVhuEPT5h8GTHYOn73g_zCRnMJlW-O86ncm80ShNF37ngOC4r8HU
    26BUkurv-Tp19SfEjY5-kiNg-lJU22baR_wLpwrc-5vJd-_yEz5XwQ>
X-ME-Received: <xmr:5ag2aek0BdXCKYYCL-YCtZqLXp6t5tyDzuebajliYXZPtS8tu2poKtGUT0BdSA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduieeggecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:5ag2aaaojk1yMYZUmuR4gcwcj4Nzlr6grY8mKIHbxxgIQ5Z4EjXjEg>
    <xmx:5ag2aSF2-71kqmjbmPvB46sRM-Ms6Nf6m09bhPfmHwAHbI3_YXr3Dw>
    <xmx:5ag2aVNajbfjPDA86e7Ow1XGd_sJep1qy6vq7YfbTw8_YIT6H4UUkQ>
    <xmx:5ag2aQxEmm-vXUeuqHyqJEHpffIBkQ1Z2djO2MC1s3XH_sfMuyENaA>
    <xmx:5ag2aakJS9SKMS1Fr164VYepjZi8wwszVq9mjeWefIgC3C56YIjFfc9E>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 8 Dec 2025 05:31:00 -0500 (EST)
Date: Mon, 8 Dec 2025 10:30:59 +0000
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
Subject: Re: [PATCH 05/11] mm/hugetlb: Refactor code around vmemmap_walk
Message-ID: <4zxckhvzzb6xag2pxcu5eimeuru6iauae4dlar3mmc3wrrnbwq@ddbzmgjuxego>
References: <20251205194351.1646318-1-kas@kernel.org>
 <20251205194351.1646318-6-kas@kernel.org>
 <3ed10ea4-347f-4d01-82aa-1d92d2804ced@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ed10ea4-347f-4d01-82aa-1d92d2804ced@gmail.com>

On Sat, Dec 06, 2025 at 04:42:30PM +0000, Usama Arif wrote:
> > @@ -308,7 +298,8 @@ static int vmemmap_remap_split(unsigned long start, unsigned long end,
> >   *		to remap.
> >   * @end:	end address of the vmemmap virtual address range that we want to
> >   *		remap.
> > - * @reuse:	reuse address.
> > + * @vmemmap_head: the page to be installed as first in the vmemmap range
> > + * @vmemmap_tail: the page to be installed as non-first in the vmemmap range
> >   * @vmemmap_pages: list to deposit vmemmap pages to be freed.  It is callers
> >   *		responsibility to free pages.
> >   * @flags:	modifications to vmemmap_remap_walk flags
> > @@ -316,69 +307,40 @@ static int vmemmap_remap_split(unsigned long start, unsigned long end,
> >   * Return: %0 on success, negative error code otherwise.
> >   */
> >  static int vmemmap_remap_free(unsigned long start, unsigned long end,
> > -			      unsigned long reuse,
> > +			      struct page *vmemmap_head,
> > +			      struct page *vmemmap_tail,
> >  			      struct list_head *vmemmap_pages,
> >  			      unsigned long flags)
> 
> Need to fix the doc above vmemmap_remap_free as it mentions reuse.

Ack.

> > +	vmemmap_remap_range(start + PAGE_SIZE, end, &walk);
> 
> 
> I think this should be vmemmap_remap_range(start, end, &walk)? Otherwise if start failed to remap,
> you wont restore it?

I think it should be safe to keep newly allocated vmemmap_head there and
free the old one.

I will add a comment.

> > @@ -592,9 +550,21 @@ static int __hugetlb_vmemmap_optimize_folio(const struct hstate *h,
> >  	 */
> >  	folio_set_hugetlb_vmemmap_optimized(folio);
> >  
> > +	nid = folio_nid(folio);
> > +	vmemmap_head = alloc_pages_node(nid, GFP_KERNEL, 0);
> 
> Should we add __GFP_NORETRY | __GFP_NOWARN here? It was there in the previous code. I am guessing
> that it was there in the previous code as its an optimization and if it fails its not a big issue.

I removed the fallback. Being noisy if we actually hit this in practice
makes sense to me. We can re-consider fallback path if we see it being a
problem.

> > @@ -602,8 +572,10 @@ static int __hugetlb_vmemmap_optimize_folio(const struct hstate *h,
> >  	 * mapping the range to vmemmap_pages list so that they can be freed by
> >  	 * the caller.
> >  	 */
> > -	ret = vmemmap_remap_free(vmemmap_start, vmemmap_end, vmemmap_reuse,
> > +	ret = vmemmap_remap_free(vmemmap_start, vmemmap_end,
> > +				 vmemmap_head, vmemmap_tail,
> >  				 vmemmap_pages, flags);
> 
> The doc above this also mentions vmemmap_reuse.

Ack.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
