Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4FC0924DCE5
	for <linux-doc@vger.kernel.org>; Thu, 11 Dec 2025 15:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765465696; cv=none; b=hvXuDdURx18w0t8LBavX0iO447mMavtvx/qLb5J5aaXwaTrKChVCGL3xvjr3BBWwGs8ByHZCOV3INdQEBjOFO1jeOk4P/2i2mbBdQe9BzuMJzDLiTjyU7IFYycBDBCIpwNN/s8w/LKXrqaqRaxb1vg7q+OdAqQPkMTPgSc2bsaY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765465696; c=relaxed/simple;
	bh=BuXXa+/Hd8aPc2VP87UCC7y68C4whjwugE7BDLLteE4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lbYljj67mYtjFg1Ntk0cNahllF6RaLlCxNEBafiToPfStfOYRCCahmFtH1u6AdhbpIF9zU64fAZeNyfgcZ8oJ6vZFZWiEdHJ5SteUTewZuEJO+osxTMjFJrS6xSOho111wMbbd+uggtzw5tZ5Y246T6jDWJMtIP43hnj5jsWxdY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=EqFupcXP; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="EqFupcXP"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4004AC4CEF7;
	Thu, 11 Dec 2025 15:08:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765465695;
	bh=BuXXa+/Hd8aPc2VP87UCC7y68C4whjwugE7BDLLteE4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=EqFupcXPpIbRjNZERBCqb+BaJvA5S8+pSFDVI9Ec6bet+KxCQVCiItBgp1rAVnR31
	 NQcBTYgKzQqTy83O5YKzWAUPj84zJa7K4kWXL+sw1zSm1OXkmTaq/a4trqeegtuMPi
	 NyZMFTLUB7ogGliTF1OLBMmSYgMhledSvNQvvscbt4BxG6HXD4/lZtmBHlDRparOQ9
	 vPXjkSVfGeC0U46iP9aMerWp1WPQ7+JY7qeo0r1N+TkcHYPSlIZX0MEtwe0+UvU9rl
	 BJpf2HeErqoLC+ymh33s6uV2Y2aW7NyjUK8j8amPFqOQr63Gbat57xmC3zVhOqAu9f
	 pIGqPdygm1yCQ==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 791C7F40074;
	Thu, 11 Dec 2025 10:08:14 -0500 (EST)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-01.internal (MEProxy); Thu, 11 Dec 2025 10:08:14 -0500
X-ME-Sender: <xms:Xt46aduxeH6TjbuWN3YyUpuoKhZIZ9C9SgxLB1HiHbWBnW4ypgZ_tQ>
    <xme:Xt46aZYSoAb6cz9vVpS1uNVo_sqv0Y8BDls1wPInwWxbBSJN6pwyue1Rx6fqWOI3n
    sS3cralpP8lb5To0VfEj5TJKfijfD64NKZ_NG6but_9aGz-oVQTNJ5N>
X-ME-Received: <xmr:Xt46aU95JPHUmvLYymSDNlDt7g35jW-AW7gARaL4VR9UEPPU7RfOSlXyA0gHTw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddvheeivdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtugfgjgestheksfdttddtjeenucfhrhhomhepmfhirhihlhcu
    ufhhuhhtshgvmhgruhcuoehkrghssehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvg
    hrnhepvddufeetkedvheektdefhfefjeeujeejtdejuedufefhveekkeeffeetvedvffek
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepkhhirh
    hilhhlodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieduudeivdeiheeh
    qddvkeeggeegjedvkedqkhgrsheppehkvghrnhgvlhdrohhrghesshhhuhhtvghmohhvrd
    hnrghmvgdpnhgspghrtghpthhtohepfeeipdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehmuhgthhhunhdrshhonhhgsehlihhnuhigrdguvghvpdhrtghpthhtoheprghkph
    hmsehlihhnuhigqdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopegurghvihgu
    sehkvghrnhgvlhdrohhrghdprhgtphhtthhopehoshgrlhhvrgguohhrsehsuhhsvgdrug
    gvpdhrtghpthhtoheprhhpphhtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehvsggr
    sghkrgesshhushgvrdgtiidprhgtphhtthhopehlohhrvghniihordhsthhorghkvghsse
    horhgrtghlvgdrtghomhdprhgtphhtthhopeifihhllhihsehinhhfrhgruggvrggurdho
    rhhgpdhrtghpthhtohepiihihiesnhhvihguihgrrdgtohhm
X-ME-Proxy: <xmx:Xt46aRYkCeiSFSsNVmqHqXPbtAxiMe7PRj6SkOXHHNm2iUj-ZQhsSQ>
    <xmx:Xt46aaSJhr1AIk53q-_-w6gmNx8Ldz3q41N5QRsW067qFyjUsdzuYw>
    <xmx:Xt46aYkv4rd8XbECYhIG7zLybfU8rjUpQQCzZEqS0ns_7X-MNVv7vQ>
    <xmx:Xt46aeKbuLXfFuVtCBFdM0HsN4mjkKiun8yEgSI30IFS8PmfaZXzLw>
    <xmx:Xt46acrgi93rqXo8ciNjWMSP4k_1iRFgGXHniNp192frSC-_BzBM4X9u>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 11 Dec 2025 10:08:14 -0500 (EST)
Date: Thu, 11 Dec 2025 15:08:13 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: Muchun Song <muchun.song@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>, 
	Mike Rapoport <rppt@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Matthew Wilcox <willy@infradead.org>, Zi Yan <ziy@nvidia.com>, 
	Baoquan He <bhe@redhat.com>, Michal Hocko <mhocko@suse.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>, 
	Usama Arif <usamaarif642@gmail.com>, kernel-team@meta.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 00/11] mm/hugetlb: Eliminate fake head pages from vmemmap
 optimization
Message-ID: <5twlonzi3rooao7gyp5g4tyaeevemcx6qhuf4xvdtsi2cykuo4@wrhxmxz63wvn>
References: <20251205194351.1646318-1-kas@kernel.org>
 <4F9E5F2F-4B4D-4CE2-929D-1D12B1DB44F8@linux.dev>
 <m63ub6lxljw7m2mmc3ovbsyfurl7hp4cvx27tmwelcxxrra5m3@eva5tqcdjxtn>
 <6396CF70-E10F-4939-8E38-C58BE5BF6F91@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <6396CF70-E10F-4939-8E38-C58BE5BF6F91@linux.dev>

On Wed, Dec 10, 2025 at 11:39:24AM +0800, Muchun Song wrote:
> 
> 
> > On Dec 9, 2025, at 22:44, Kiryl Shutsemau <kas@kernel.org> wrote:
> > 
> > On Tue, Dec 09, 2025 at 02:22:28PM +0800, Muchun Song wrote:
> >> The prerequisite is that the starting address of vmemmap must be aligned to
> >> 16MB boundaries (for 1GB huge pages). Right? We should add some checks
> >> somewhere to guarantee this (not compile time but at runtime like for KASLR).
> > 
> > I have hard time finding the right spot to put the check.
> > 
> > I considered something like the patch below, but it is probably too late
> > if we boot preallocating huge pages.
> > 
> > I will dig more later, but if you have any suggestions, I would
> > appreciate.
> 
> If you opt to record the mask information, then even when HVO is
> disabled compound_head will still compute the head-page address
> by means of the mask. Consequently this constraint must hold for
> **every** compound page.  
> 
> Therefore adding your code in hugetlb_vmemmap.c is not appropriate:
> that file only turns HVO off, yet the calculation remains broken
> for all other large compound pages.
> 
> From MAX_FOLIO_ORDER we know that folio_alloc_gigantic() can allocate
> at most 16 GB of physically contiguous memory. We must therefore
> guarantee that the vmemmap area starts on an address aligned to at
> least 256 MB.
> 
> When KASLR is disabled the vmemmap base is normally fixed by a
> macro, so the check can be done at compile time; when KASLR is enabled
> we have to ensure that the randomly chosen offset is a multiple
> of 256 MB. These two spots are, in my view, the places that need
> to be changed.
> 
> Moreover, this approach requires the virtual addresses of struct
> page (possibly spanning sections) to be contiguous, so the method is
> valid **only** under CONFIG_SPARSEMEM_VMEMMAP.
> 
> Also, when I skimmed through the overall patch yesterday, one detail
> caught my eye: the shared tail page is **not** "per hstate"; it is
> "per hstate, per zone, per node", because the zone and node
> information is encoded in the tail page’s flags field. We should make
> sure both page_to_nid() and page_zone() work properly.

Right. Or we can slap compound_head() inside them. 

I stepped onto VM_BUG_ON_PAGE() in get_pfnblock_bitmap_bitidx().
Workarounded with compound_head() for now.

I am not sure if we want to allocate them per-zone. Seems excessive.
But per-node is reasonable.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
