Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4E0D4258CD0
	for <linux-doc@vger.kernel.org>; Fri,  5 Dec 2025 20:54:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764968093; cv=none; b=lu3eTfc0GdVl3TnY+YBjV952WXlkYG9yJ7A5sC+mk5c10nY01BJDVubzTfliS69So6CggFyycw3BUREcXrgrgyJrRfMK7feobyFFMIV0Q/CQi/UIq7mc9hUS2DQgAKJ4a2t/g8cnU+nMk7D0RbFGZOCgCNQJhYO8exHJz1Odw1U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764968093; c=relaxed/simple;
	bh=3HzhDUItFLhL4WKaFFSsqNbgeDl5tzAw/wnROhrEui0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=GgflBke/NjdeRFKK/zvCZ2jZ0a5nUqWxmLW//xp+fAAyfzxgfyU2MkKW0gYJvZWryltFY/k9XBYnyTVHh549cV1+Z96kwZm8ynttI1BBlI0rlIcvjr0aSoZUz5zz0w/z3GmEHWHkvhxaeMi331KDLK2A3chYCNr5TWMwT6udonY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=de/emt0Z; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="de/emt0Z"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5E1EEC4AF0B;
	Fri,  5 Dec 2025 20:54:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764968093;
	bh=3HzhDUItFLhL4WKaFFSsqNbgeDl5tzAw/wnROhrEui0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=de/emt0ZFid7L69Y9kFMqAs7Az++aUY7Ekkjav4AYdlwdLmmSZBBoS5hXt6vg8Nla
	 TF2To9ZIxuEW5Cv4Mmb2aTPcybmCpwn+/E3jLSQwHW9NBOvL/pSa/YOoAbcyVpT8Dx
	 BJ1yPIVNVDNz0Vw13b0U2wtMiZcarghwRDdjMdj2aRyEHlVdBqf1SMdxpGq8SQASM2
	 e14W9L5FyULlKpkzuVexhmaLa+mLLEK6rMvaPlaGH2e+axWwueCNqdl88AgQ86SPBp
	 KitddyS3lzkrRIRZ9h1uXITXSOkBDC47OE6s0uRDoWrMJtFR94fyL/oEhB22mp7d+c
	 K0eaeuF/VWqDg==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 7CBB8F4006C;
	Fri,  5 Dec 2025 15:54:51 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Fri, 05 Dec 2025 15:54:51 -0500
X-ME-Sender: <xms:m0YzaVchA3Iv6PT9einV5JgeMvJFQkERSjBFRQf5zEaZx56ofcBnpA>
    <xme:m0YzaaDBnS04iE9rW6PpcaQ6BtiZwf49jW42Kzqh4r9iQiNglyuaU-Dof4ewUhX3Z
    gu5rWQLHVQ6JdxKskSvvZlKpN9qh24DdA8ysuK8wP3bA5hFgERWBGk>
X-ME-Received: <xmr:m0YzaXfHLkX_GwngSOlc0dWDhpSUgzO5jYFfM4HPIFL8rlvZrOL0ZEJ0C2c8fg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdelfeelucetufdoteggodetrfdotf
    fvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceurghi
    lhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujfgurh
    epfffhvfevuffkfhggtggujgesthdtsfdttddtvdenucfhrhhomhepmfhirhihlhcuufhh
    uhhtshgvmhgruhcuoehkrghssehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvghrnh
    epheeikeeuveduheevtddvffekhfeufefhvedtudehheektdfhtdehjeevleeuffegnecu
    vehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepkhhirhhilh
    hlodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieduudeivdeiheehqddv
    keeggeegjedvkedqkhgrsheppehkvghrnhgvlhdrohhrghesshhhuhhtvghmohhvrdhnrg
    hmvgdpnhgspghrtghpthhtohepfeeipdhmohguvgepshhmthhpohhuthdprhgtphhtthho
    pegurghvihgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrkhhpmheslhhinhhugi
    dqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepmhhutghhuhhnrdhsohhnghes
    lhhinhhugidruggvvhdprhgtphhtthhopeifihhllhihsehinhhfrhgruggvrggurdhorh
    hgpdhrtghpthhtohepohhsrghlvhgrughorhesshhushgvrdguvgdprhgtphhtthhopehr
    phhptheskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepvhgsrggskhgrsehsuhhsvgdrtg
    iipdhrtghpthhtoheplhhorhgvnhiiohdrshhtohgrkhgvshesohhrrggtlhgvrdgtohhm
    pdhrtghpthhtohepiihihiesnhhvihguihgrrdgtohhm
X-ME-Proxy: <xmx:m0YzaRyj1aerwRjmovq_zank8kZ7VzJ2FcCe4pu3rFFJk6aXqxg2bg>
    <xmx:m0YzaV8eAiz0r_PX5ZYuLJDFKXZcC0Iyr4Bq83RCNHOBX-1KwE_qKg>
    <xmx:m0Yzabmwsmi-t1T6tsSZqchCNUjQOGhuoG8KXXGXNV64a1kLEhQDRw>
    <xmx:m0YzaXqxJ4KTv2HXnmRRbNaRfV89gb_Cx7WrkWhjcOXO9y-N9CCrLA>
    <xmx:m0YzaX91OxC0IWaeyu0xi2Z-YNsQj6glNVQ18rJVhCHDioQ7_G-OA4O0>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Dec 2025 15:54:50 -0500 (EST)
Date: Fri, 5 Dec 2025 20:54:49 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: "David Hildenbrand (Red Hat)" <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	Muchun Song <muchun.song@linux.dev>, Matthew Wilcox <willy@infradead.org>, 
	Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>, 
	Vlastimil Babka <vbabka@suse.cz>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Zi Yan <ziy@nvidia.com>, Baoquan He <bhe@redhat.com>, Michal Hocko <mhocko@suse.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>, 
	Usama Arif <usamaarif642@gmail.com>, kernel-team@meta.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 00/11] mm/hugetlb: Eliminate fake head pages from vmemmap
 optimization
Message-ID: <ysvhofzg5mdtvxfujdsmffkuqna72pr52ehrpglmlhxnvwstas@xurgptkgtnbe>
References: <20251205194351.1646318-1-kas@kernel.org>
 <e1c50f7e-cec4-4676-b5d6-f6446cd64ba5@kernel.org>
 <bdie34dgpltxd5ayvjvqkusx4thdrrebgllvwp333psfuu4vgj@bkfxg2c5sfr2>
 <01e5d0b3-dbf8-4f77-b38a-f48c46f7c31e@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <01e5d0b3-dbf8-4f77-b38a-f48c46f7c31e@kernel.org>

On Fri, Dec 05, 2025 at 09:44:30PM +0100, David Hildenbrand (Red Hat) wrote:
> On 12/5/25 21:33, Kiryl Shutsemau wrote:
> > On Fri, Dec 05, 2025 at 09:16:08PM +0100, David Hildenbrand (Red Hat) wrote:
> > > On 12/5/25 20:43, Kiryl Shutsemau wrote:
> > > > This series removes "fake head pages" from the HugeTLB vmemmap
> > > > optimization (HVO) by changing how tail pages encode their relationship
> > > > to the head page.
> > > > 
> > > > It simplifies compound_head() and page_ref_add_unless(). Both are in the
> > > > hot path.
> > > > 
> > > > Background
> > > > ==========
> > > > 
> > > > HVO reduces memory overhead by freeing vmemmap pages for HugeTLB pages
> > > > and remapping the freed virtual addresses to a single physical page.
> > > > Previously, all tail page vmemmap entries were remapped to the first
> > > > vmemmap page (containing the head struct page), creating "fake heads" -
> > > > tail pages that appear to have PG_head set when accessed through the
> > > > deduplicated vmemmap.
> > > > 
> > > > This required special handling in compound_head() to detect and work
> > > > around fake heads, adding complexity and overhead to a very hot path.
> > > > 
> > > > New Approach
> > > > ============
> > > > 
> > > > For architectures/configs where sizeof(struct page) is a power of 2 (the
> > > > common case), this series changes how position of the head page is encoded
> > > > in the tail pages.
> > > > 
> > > > Instead of storing a pointer to the head page, the ->compound_info
> > > > (renamed from ->compound_head) now stores a mask.
> > > 
> > > (we're in the merge window)
> > > 
> > > That doesn't seem to be suitable for the memdesc plans, where we want all
> > > tail pages do directly point at the allocated memdesc (e.g., struct folio),
> > > no?
> > 
> > Sure. My understanding is that it is going to eliminate a need in
> > compound_head() completely. I don't see the conflict so far.
> 
> Right. All compound_head pointers will point at the allocated memdesc.
> 
> Would we still have to detect fake head pages though (at least for some
> transition period)?

If we need to detect if the memdesc is tail it should be as trivial as
comparing the given memdesc to the memdesc - 1. If they match, you are
looking at the tail.

But I don't think we wound need it.

The memdesc itself doesn't hold anything you want to touch if don't hold
reference to the folio. You wound need dereference memdesc and after it
you don't care if the memdesc it tail.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
