Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A0B681DE4E1;
	Mon, 22 Dec 2025 14:52:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766415142; cv=none; b=uJQuLI3BDSwQLS0LJOI56qZ2psSZX4H/gXqxYG+DDU7rAvF34mn68o2UXGYMqposB0eQ8eYoqf/ff9V9/3w986o4FCZRjKGZauh3iE28oAfhn4m2SQj3IopGB0/itVtpRC+Z0wLDbaJZ4tvb7Kjj4P8uHYekJkiJbwS+KbPhR/8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766415142; c=relaxed/simple;
	bh=LxpT0xwEZp0OshbwMp3ZnX/N3w4Cls4+fhHuEvVMmIM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=g3fztEkCTujk72RwP3jAHZ7K4jsL2eiyx66pSRwLpoOTOsBJlFQ+B9knCmaktfizhRjHJSINVY9+jCqjTpTzEje/wht3xl1TUvSbAr1DQDgKkSd1ZRIXnJqQQX0RAstlUzx2oRRRT2s86096qdh7Ul+6at8Z0tL2V4uPwv7wMjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=qaHRa2RF; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="qaHRa2RF"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BD08C4CEF1;
	Mon, 22 Dec 2025 14:52:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766415142;
	bh=LxpT0xwEZp0OshbwMp3ZnX/N3w4Cls4+fhHuEvVMmIM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qaHRa2RFU8+HqIIb2PIHFkpAabd1Je1CeVbMgQLJvsnew+XW82hHeJPygR/E9oj31
	 kAGNjUXsmULzc8v6wjGF4zzE8QacPYQSDgCqFLOuawI0aQ0f4ubryaY3T9of6Chyqi
	 Ts50MZWPnvsOcZylN8nPBmHiVQ+IP52rcIBww7sir9gWMxwUHUwcaOwaF+/EkykGet
	 znnwkq9ozr1UiCzw/WyPVoNWEjOU05pxJ/B+Hys2vqKEiCSGJMMMxnpkYycBb9NmcF
	 15D3d8RJJ5Xe+isbziJmKoR/3mdgzwmTVOlj+MKusg8Jo0PmIpxM4mD0SGY3XAfgGP
	 hwsThEm2nrPKw==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id B3D3BF4006C;
	Mon, 22 Dec 2025 09:52:20 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Mon, 22 Dec 2025 09:52:20 -0500
X-ME-Sender: <xms:JFtJabWcW4NqPOSYVBylgF3WTXMh3M2hwYkU-hHTl0q9YOs6LhjKhQ>
    <xme:JFtJae9158c4yiXslpx6CLORmpxvBQ6Of58OqECFKDMID4mIq16WO6M8D1x6NPESo
    MNYnB82VQyUyt2xTfxDvA7qM6AJxYOAhi3eT-FJoufhac0iNpzr71Y3>
X-ME-Received: <xmr:JFtJaQz3hjiBb0FzniDb2nZ2_uFz62HKLbpfvY0K-VWz3PH2QGaQWzZxaqrnEg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdehjedvfecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtugfgjgestheksfdttddtjeenucfhrhhomhepmfhirhihlhcu
    ufhhuhhtshgvmhgruhcuoehkrghssehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvg
    hrnhepvddufeetkedvheektdefhfefjeeujeejtdejuedufefhveekkeeffeetvedvffek
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
X-ME-Proxy: <xmx:JFtJaeE_5-2BnXckVp5f_Eb0ScrQGWz251EFJaXeykioHTOZZmgF2A>
    <xmx:JFtJaRJE7xWqTKFB69WX53AZp2EuWjIj-DUBdFwX3_0c9wv-gml6Bw>
    <xmx:JFtJaZ5RBUm8poiTu6Y4EKsP_ZB1JIZcVTLTqzMS-27i0KYONPIdFw>
    <xmx:JFtJaZR-YeiVh7P9OFrFEmeWytjehqvYVvnEyqCOoaISq730oEOi4g>
    <xmx:JFtJabA3EGU1VsrnwVz3zFHk8rkp5xgwQvkUmvzvPSJUoQRxT3FsJq73>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 22 Dec 2025 09:52:20 -0500 (EST)
Date: Mon, 22 Dec 2025 14:52:19 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: "David Hildenbrand (Red Hat)" <david@kernel.org>, 
	Wilcox <willy@infradead.org>
Cc: Muchun Song <muchun.song@linux.dev>, 
	Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>, 
	Vlastimil Babka <vbabka@suse.cz>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Zi Yan <ziy@nvidia.com>, Baoquan He <bhe@redhat.com>, Michal Hocko <mhocko@suse.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>, kernel-team@meta.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Usama Arif <usamaarif642@gmail.com>, 
	Frank van der Linden <fvdl@google.com>
Subject: Re: [PATCHv2 02/14] mm/sparse: Check memmap alignment
Message-ID: <mqvgofzudkucibhyr7gsjgtb47rjibqkqce3wdd62p6kqzosxb@tv4fkzewgkt2>
References: <20251218150949.721480-1-kas@kernel.org>
 <20251218150949.721480-3-kas@kernel.org>
 <430d554c-840f-4813-b715-5191d74571a0@linux.dev>
 <4ctnfkw5zqneume6px2wqgdgusfdricr4uuonv7bfjheknrt2g@fdb5ceiiar4q>
 <3b758468-9985-49b8-948a-e5837decf52d@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3b758468-9985-49b8-948a-e5837decf52d@kernel.org>

On Mon, Dec 22, 2025 at 03:18:29PM +0100, David Hildenbrand (Red Hat) wrote:
> On 12/22/25 15:02, Kiryl Shutsemau wrote:
> > On Mon, Dec 22, 2025 at 04:34:40PM +0800, Muchun Song wrote:
> > > 
> > > 
> > > On 2025/12/18 23:09, Kiryl Shutsemau wrote:
> > > > The upcoming changes in compound_head() require memmap to be naturally
> > > > aligned to the maximum folio size.
> > > > 
> > > > Add a warning if it is not.
> > > > 
> > > > A warning is sufficient as MAX_FOLIO_ORDER is very rarely used, so the
> > > > kernel is still likely to be functional if this strict check fails.
> > > 
> > > Different architectures default to 2 MB alignment (mainly to
> > > enable huge mappings), which only accommodates folios up to
> > > 128 MB. Yet 1 GB huge pages are still fairly common, so
> > > validating 16 GB (MAX_FOLIO_SIZE) alignment seems likely to
> > > miss the most frequent case.
> > 
> > I don't follow. 16 GB check is more strict that anything smaller.
> > How can it miss the most frequent case?
> > 
> > > I’m concerned that this might plant a hidden time bomb: it
> > > could detonate at any moment in later code, silently triggering
> > > memory corruption or similar failures. Therefore, I don’t
> > > think a WARNING is a good choice.
> > 
> > We can upgrade it BUG_ON(), but I want to understand your logic here
> > first.
> 
> Definitely no BUG_ON(). I would assume this is something we would find early
> during testing, so even a VM_WARN_ON_ONCE() should be good enough?
> 
> This smells like a possible problem, though, as soon as some architecture
> wants to increase the folio size. What would be the expected step to ensure
> the alignment is done properly?

It depends on memory model and whether the arch has KASLR for memmap.

> But OTOH, as I raised Willy's work will make all of that here obsolete
> either way, so maybe not worth worrying about that case too much,

Willy, what is timeline here?

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
