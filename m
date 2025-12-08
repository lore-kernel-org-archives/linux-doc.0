Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDE322BEC4E
	for <linux-doc@vger.kernel.org>; Mon,  8 Dec 2025 10:40:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765190444; cv=none; b=dsuhq+PFc5Zd17HGnL8QHuHSCe3PwbdTTFZCnCSHTa7fCbQNyiYNeDENNEhfuc2CCx9dVzn7K+GVYFt1tmtFkVjxfRvb93PuaNAI6SFMtPFP4o6NChgWXLShqSL5ALuaYNk5Az1fR4T/RWYvxUZ75C8MXAuWTJp2vzYHgmErPks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765190444; c=relaxed/simple;
	bh=P0dL+8t4dY1bkxzyrYA3i4X0+ns0NC17VdJogz7i/q8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=OYHbJDFyG0ys+N9RKa9awplrCsHh6qfkKejMaGCyUcQD5b0MAy8qu3exSZxjeVFDeWYpsnUbg8xwNV1+XIsvhAOgEPF0F0RsjihyNxxvdTpAXd0oQXloNiQH86FxwlGVgF3Fyldd7CyPcPaI/0aR/49+S18uQqBJTcqvJDhNAbo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=CSRWeO8E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="CSRWeO8E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 00BB5C4CEF1;
	Mon,  8 Dec 2025 10:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765190443;
	bh=P0dL+8t4dY1bkxzyrYA3i4X0+ns0NC17VdJogz7i/q8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CSRWeO8EHpyINoSzLDwsSHppv5GLyqElaJywgFb6NtCT+JUyBXFVScKqfxXgU4R+V
	 Wxl0smsRfezo30/PjT7+B2YYXmlqE14GAu62fPlNagRFfGim+S+fif3nIkltsRBRRb
	 TWW9oix8Lm9rqhC2TiFAaSZ/uIAjqNQ2w5Zy1e30vJU5D6icp5/B3CMGS05/fah6k6
	 P7G3pzOGdbWKmCsf9cgGI095WTcb0aKqGAoEUXuZvDJk0HAhd8Mw/QWJ521s5JHw4j
	 fikw18UO6E1Pnd6M18h5cfb3+MAeqQASAEm7w2HQzCKQxgV3o4AkvBA/YrjIWofpjE
	 oDsob2ZknOmAg==
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfauth.phl.internal (Postfix) with ESMTP id 26C4CF40070;
	Mon,  8 Dec 2025 05:40:42 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Mon, 08 Dec 2025 05:40:42 -0500
X-ME-Sender: <xms:Kqs2aXNuxA6CEgFzb0M9fwHP-BwLqfFrKmfd2uSeKWuhxHsH8MSYPg>
    <xme:Kqs2aYy-AvUP-yJDCeN-CALpHOG2C4LRDOkXCcA-7sTwGYmSYqRGTgrNeUiy9fHCx
    JhojKCbKQDMLpS6xK2YNP4KGANXUcHWRDKc727iFliw5MIHy6XfBCc>
X-ME-Received: <xmr:Kqs2afN_-rd0ywZWpifrpXKfVcFZl2nK8fS5Ndzlv-_pz2HZnDaArb1vFAi6WQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduieegiecutefuodetggdotefrod
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
X-ME-Proxy: <xmx:Kqs2aeiXoiq-3V4nXgRYHdYPqDEf3lPKZB1NnrZ6ytIJCmud0nYYUw>
    <xmx:Kqs2aTuhRZUWHJZdM2o39ZCWbcHnxjGSUARZG-TukV_PoUeGbdltAQ>
    <xmx:Kqs2aWUQ00wgeLIjwfPOkzRLPEy0GWy34_GohHaFbpe9zOjmSOqD3A>
    <xmx:Kqs2abb1dBSV4pIbfLFMbd8Ea-QqHWc8EwC_jsfU0ZXKF9tZzN438g>
    <xmx:Kqs2aQtrv7WWG7wLoCnmHtdDFmkHdr6sbpx0a0PlHheVrxWyEmdsj2o2>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 8 Dec 2025 05:40:41 -0500 (EST)
Date: Mon, 8 Dec 2025 10:40:40 +0000
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
Subject: Re: [PATCH 06/11] mm/hugetlb: Remove fake head pages
Message-ID: <s7uxtfbfta45d26g5e5iznkkbj7ccpsar7dppacqmbwms5bcdb@7cr4bo4jqnd2>
References: <20251205194351.1646318-1-kas@kernel.org>
 <20251205194351.1646318-7-kas@kernel.org>
 <db4538c3-84f8-4fb4-8307-b4fcf46ebe38@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <db4538c3-84f8-4fb4-8307-b4fcf46ebe38@gmail.com>

On Sat, Dec 06, 2025 at 05:03:25PM +0000, Usama Arif wrote:
> > @@ -518,7 +519,24 @@ static bool vmemmap_should_optimize_folio(const struct hstate *h, struct folio *
> >  	return true;
> >  }
> >  
> > -static int __hugetlb_vmemmap_optimize_folio(const struct hstate *h,
> > +static void hugetlb_vmemmap_tail_alloc(struct hstate *h)
> > +{
> > +	struct page *p;
> > +
> > +	if (h->vmemmap_tail)
> > +		return;
> > +
> 
> The above check is unnecessary as we already check for
> !h->vmemmap_tail in __hugetlb_vmemmap_optimize_folio?

Right. I will streamline this codepath.

> Is it possible that we could have a race here? Where 2 threads both
> trying to allocate a hugetlb page when none exist in the system, both
> see h->vmemmap_tail == NULL, both call alloc_page and set
> h->vmemmap_tail?

Good catch. Will fix. I guess, serializing h-vmemmap_tail with
hugetlb_lock should be good enough.

> Also, is there a good point where we can see that the number of
> hstate->nr_huge_pages has gone down to 0 and free
> h->vmemmap_tail? Its a single page per hstate so not a big deal, but
> would be nice to have cleanup for it?

I didn't want to go to this complexity, but if you folks think that it
is needed, sure, can do.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
