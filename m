Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 490EA1DDF3;
	Fri,  5 Dec 2025 20:33:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764966815; cv=none; b=ddwetKA3pkKIKMNUWERmcYTGIFYj/zfpmwiAYjeVkEkPxHUemAb54N4T7PYOb535RebjjCHhMAgXgocE0t3CX98HcmhZ/guplkZqUo5Xp2vHAIFhuk7mdZcM39UtsII40AVqkLBMTgEGlGtHhbnlhbzqXUC4U1BiBdMsNsRhBuI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764966815; c=relaxed/simple;
	bh=xhGlEmAWqnSy+8gr4vj1cz9rV+6yNQAySY4hUU4VR+g=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=uX2EQLqgwCdZnj9zOVS2DkWhggepCM+QmzkWJBI98oyBGabNIPlBSUnlVvhzwRq5zn9t1d0SGEnvAAKXE7U7ipu7xc1BFZA6ZqKeDhM2jZ+Jpf/IAGy27cuuzHRYTX6j3RZTpefEcUpd0eJvBeDX13WgBkEHUIXSFqLrqXPb/nE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=BUk3epvr; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="BUk3epvr"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 46377C116B1;
	Fri,  5 Dec 2025 20:33:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764966814;
	bh=xhGlEmAWqnSy+8gr4vj1cz9rV+6yNQAySY4hUU4VR+g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BUk3epvrOvhjhOPMD+eL/H/4doXstHmZ2gSEaIgronqjx/FxpEi9nzF+iExr+//p8
	 3fEHSFq/p/wsdUE7TvZkQrO9o95uvcwCG6iEMMIPlRCGJT+D/IZOX6A/WFo598xpwO
	 5U2+z4/EkrfKyURHwuJ7+jnYNXotW9lcvL0Wx/qzVaELR3bqWxlAavj1fn1PzbQegl
	 25hdt8x/2fmB6ooQuCUoZ1MeYjmj2hNMkucm6KfzGN9w2O/XE52sJA17wvkL7D2Iyr
	 JQuLu8yRz4bgCmhDH3vaJww4IeSQKsoS3D2YnpOzo/kc+wv9x/E0qFJ+LP6ssoixPu
	 ONCjn2TvLlDRQ==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 8A6F3F40077;
	Fri,  5 Dec 2025 15:33:33 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Fri, 05 Dec 2025 15:33:33 -0500
X-ME-Sender: <xms:nUEzaToK8vfqo6dh409MXSk_OjeCWqLA6qZTx3dgMbPGWy7Tg1BXYg>
    <xme:nUEzaUfc1mSZHxmqEEFe1sig3AudEfXOMPH9M_I1Fk4rO3VD_-AEH0M2a0TYfj05U
    -2YDZ5JcH8_i4wL2LpAY6_5EJVbuH1EZFaBsyv55GoGwqc4sPyjVeg>
X-ME-Received: <xmr:nUEzaZIqZXpIRQjeR7qmZX3_7BJ4uqJk3RfTWpaJRs0GsTnKUY-MsrI0uEgeEw>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdelfeegucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:nUEzaZsX7POKH__6uLu-qVHKCjFoiDHVVMf0YcoaUvNqpxLjgqxORQ>
    <xmx:nUEzaXLST0XHQL37-mMZGOi1CiNdUJ0KOo6Bjbe9LYTr6ibLVXkZyg>
    <xmx:nUEzadBuFXreBMVNhYRmDxOcBBRhJnmQP_Zg83fXVFA3uoJqshiAJw>
    <xmx:nUEzaUVLL89j3kcpCsuyBngO2nJ5IEL7rnYulH7RlIX7ftE4K9HvDA>
    <xmx:nUEzae5SyIGyHDxUGRWipE-aji05Lwsd_qAaKBd4Dtc-9iFujFKMcP-A>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Dec 2025 15:33:32 -0500 (EST)
Date: Fri, 5 Dec 2025 20:33:31 +0000
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
Message-ID: <bdie34dgpltxd5ayvjvqkusx4thdrrebgllvwp333psfuu4vgj@bkfxg2c5sfr2>
References: <20251205194351.1646318-1-kas@kernel.org>
 <e1c50f7e-cec4-4676-b5d6-f6446cd64ba5@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e1c50f7e-cec4-4676-b5d6-f6446cd64ba5@kernel.org>

On Fri, Dec 05, 2025 at 09:16:08PM +0100, David Hildenbrand (Red Hat) wrote:
> On 12/5/25 20:43, Kiryl Shutsemau wrote:
> > This series removes "fake head pages" from the HugeTLB vmemmap
> > optimization (HVO) by changing how tail pages encode their relationship
> > to the head page.
> > 
> > It simplifies compound_head() and page_ref_add_unless(). Both are in the
> > hot path.
> > 
> > Background
> > ==========
> > 
> > HVO reduces memory overhead by freeing vmemmap pages for HugeTLB pages
> > and remapping the freed virtual addresses to a single physical page.
> > Previously, all tail page vmemmap entries were remapped to the first
> > vmemmap page (containing the head struct page), creating "fake heads" -
> > tail pages that appear to have PG_head set when accessed through the
> > deduplicated vmemmap.
> > 
> > This required special handling in compound_head() to detect and work
> > around fake heads, adding complexity and overhead to a very hot path.
> > 
> > New Approach
> > ============
> > 
> > For architectures/configs where sizeof(struct page) is a power of 2 (the
> > common case), this series changes how position of the head page is encoded
> > in the tail pages.
> > 
> > Instead of storing a pointer to the head page, the ->compound_info
> > (renamed from ->compound_head) now stores a mask.
> 
> (we're in the merge window)
> 
> That doesn't seem to be suitable for the memdesc plans, where we want all
> tail pages do directly point at the allocated memdesc (e.g., struct folio),
> no?

Sure. My understanding is that it is going to eliminate a need in
compound_head() completely. I don't see the conflict so far.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
