Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3B5FA298987;
	Fri,  5 Dec 2025 22:10:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764972615; cv=none; b=E4o3odDt8pjuxpr+iwiTZy6VgUIm981cg3/+sHMaGywEjJdpu59BG4+D6xWdR1EBMHSp60AFDH6rj7ZZmnMzDqZrfhndC8l+YlCmHbNioWWqERlSAIudLcg68yLuUfrzcFQ1aKjPIvExOxJbmZaDXQ+5hXhJra/mEGGTNzgKITA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764972615; c=relaxed/simple;
	bh=lIKjTgPBkbtkNkZzV1zzL4vEwZKkRTteOsvjZIgfEmo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JCAjG5NN28iYH4dgZWrtRkRzwCpihmmUBvqGMo8yIZHB+csHuQSIj7lAqLqhbaPUIsIBiSF5PM7GQKHcfDarF637kT1+h7FvHT10PLYyCEar/HkNSSpMZTH1jQvnA0yUKFO1jasmin7iaw7rEpYdylt89muqhbb0vDdtjm6hcJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=r8p6WCFD; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="r8p6WCFD"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C799C116B1;
	Fri,  5 Dec 2025 22:10:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764972614;
	bh=lIKjTgPBkbtkNkZzV1zzL4vEwZKkRTteOsvjZIgfEmo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=r8p6WCFDaD0XZ84Y40DgvY3vCMYQKNgAimUEydRrJcE9QAczXRznmXKq3TLqbMTnU
	 TyHvCB1s4/W98OFiVD7Q3dkuNOlv5JeEmTuLvrFNg01TKH7SAC5rim6DAiC2Y+T6x0
	 np1dqvxkx6fLEW9C7lp9byI2Nw1S6UgRpZmMdH4/SUV3jeABCB6Yxn26u0xAnvoBZ3
	 xiRpk8KcquMzsaojM6wVvMr4bgnPOiFh5X8vqwhaxre/Z4X5NHS3VSOSoPgW3DM6Ro
	 NFD7o4Z9tpWDJ/DPy3UlRlR7heGm9tSaMuFvpYxsX44QlNoVFlKsqMePviwbKKQYgu
	 xZ503Cz36WbkA==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 8D19EF4006B;
	Fri,  5 Dec 2025 17:10:13 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Fri, 05 Dec 2025 17:10:13 -0500
X-ME-Sender: <xms:RVgzaaJdc8RyNAK-Xw-tiVY4O3QG2rzyhNDmTGubO6yVzS-aGdNK-w>
    <xme:RVgzaY_PtrxqgeNtnJJu3ILzPskav7gD9gUNnRgH3QrmHpzhOySxaLe31RDtrCDg_
    DKhrJO8YcAH2oXsbWNJ_t2ILLMMiJROUl8NNogs5qPuAa-eiuuYILI>
X-ME-Received: <xmr:RVgzaTpwss-vif6B3G4HY5c8r7Dyp9fwWRTh10Xa-KitZ2srFwKkn0bmUI9nyQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdelgeekucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggujgesthdtsfdttddtvdenucfhrhhomhepmfhirhihlhcuufhh
    uhhtshgvmhgruhcuoehkrghssehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnh
    epheeikeeuveduheevtddvffekhfeufefhvedtudehheektdfhtdehjeevleeuffegnecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepkhhirhhilh
    hlodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieduudeivdeiheehqddv
    keeggeegjedvkedqkhgrsheppehkvghrnhgvlhdrohhrghesshhhuhhtvghmohhvrdhnrg
    hmvgdpnhgspghrtghpthhtohepfeeipdhmohguvgepshhmthhpohhuthdprhgtphhtthho
    pehushgrmhgrrghrihhfieegvdesghhmrghilhdrtghomhdprhgtphhtthhopegrkhhpmh
    eslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepmhhutghhuhhn
    rdhsohhngheslhhinhhugidruggvvhdprhgtphhtthhopegurghvihgusehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehoshgrlhhvrgguohhrsehsuhhsvgdruggvpdhrtghpthht
    oheprhhpphhtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehvsggrsghkrgesshhush
    gvrdgtiidprhgtphhtthhopehlohhrvghniihordhsthhorghkvghssehorhgrtghlvgdr
    tghomhdprhgtphhtthhopeifihhllhihsehinhhfrhgruggvrggurdhorhhg
X-ME-Proxy: <xmx:RVgzaSOwR5lbPABwAXY_OiFWmselEho1L5jrEmxEnpdBMbY3BKv7Gw>
    <xmx:RVgzaVr0uYVHWSA5a4lJtiXj9WegyuOasfVUIt_5YNRfxjmO8O4sag>
    <xmx:RVgzaZhOnLOeqe11i7MJyeMM7duOTLSUkOqMnDwR83gOb90SoHggaw>
    <xmx:RVgzaW1DCjdlHwEHcc7DUmKFMD0KR1oM2llDFCTibQXJZcc9I8g2kw>
    <xmx:RVgzafbr1-n7T7JBITZvqBDnjRqL_EF8Yd5EtbvCUYPZ9dDN3TtUFhZv>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Dec 2025 17:10:12 -0500 (EST)
Date: Fri, 5 Dec 2025 22:10:11 +0000
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
Subject: Re: [PATCH 01/11] mm: Change the interface of prep_compound_tail()
Message-ID: <gdkhm6ckcrwy6ezetpb6u2m4sfdeqsf4ftg2vb557zipvdepyh@u4f6pyrompd7>
References: <20251205194351.1646318-1-kas@kernel.org>
 <20251205194351.1646318-2-kas@kernel.org>
 <77d1911d-7b67-41c0-933e-b2a0810cf3b4@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <77d1911d-7b67-41c0-933e-b2a0810cf3b4@gmail.com>

On Fri, Dec 05, 2025 at 09:49:36PM +0000, Usama Arif wrote:
> 
> 
> On 05/12/2025 19:43, Kiryl Shutsemau wrote:
> > Instead of passing down the head page and tail page index, pass the tail
> > and head pages directly, as well as the order of the compound page.
> > 
> > This is a preparation for changing how the head position is encoded in
> > the tail page.
> > 
> > Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
> > ---
> >  include/linux/page-flags.h |  4 +++-
> >  mm/hugetlb.c               |  8 +++++---
> >  mm/internal.h              | 11 +++++------
> >  mm/mm_init.c               |  2 +-
> >  mm/page_alloc.c            |  2 +-
> >  5 files changed, 15 insertions(+), 12 deletions(-)
> > 
> > diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
> > index 0091ad1986bf..2c1153dd7e0e 100644
> > --- a/include/linux/page-flags.h
> > +++ b/include/linux/page-flags.h
> > @@ -865,7 +865,9 @@ static inline bool folio_test_large(const struct folio *folio)
> >  	return folio_test_head(folio);
> >  }
> >  
> > -static __always_inline void set_compound_head(struct page *page, struct page *head)
> > +static __always_inline void set_compound_head(struct page *page,
> > +					      struct page *head,
> > +					      unsigned int order)
> 
> I can see that order is used later, I think patch 4, but probably this patch might cause a
> build warning as order is unused? Might be good to integrate that into the later patch?

Is there warning for unused function parameters?

I think it will blow up whole kernel, no?

> Other nit is, do we want const for head here? (Its not there before, but might be good to add).

Sure, can do.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
