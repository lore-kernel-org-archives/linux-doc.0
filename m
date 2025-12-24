Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5CD492882CD
	for <linux-doc@vger.kernel.org>; Wed, 24 Dec 2025 14:13:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766585611; cv=none; b=URDEBM0UgEj6tED4u2zb6qNqVB2CtGV3e+7JtjNIIzTKcZzv36Ixw3Hunza/fGgfhYq1rcle0yx2od9KaAk0sAmSLUuSE8iWnTSHPH+R4DcosCCebpF7ndVi1Jd3E6Vhr4cCnmFGpZh7XXQcuSbtUPMQg6zeO4WusVZ4Hv+vvtk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766585611; c=relaxed/simple;
	bh=x8pJJIM/R06HelItOz0mnR+O24PLB75z92hRRpCFFeo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ugc/u4Bhd2I0cbHTWi2dL41wDDAfDI27NhNm7hPYVdT93Nc4MjOOn8sFHy4V/0Tf7AAJzIQkBFkSyUaAI98Of/PaeQ6WMwQf5NX7W6EaFdx10dCQRGxxyqAeOeK6/lDicmv+y+jLoV39QJ6vWa6ZwlUogOPW1meQLibD4I5wYfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=pTOSExkU; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="pTOSExkU"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D6FBC4CEF7;
	Wed, 24 Dec 2025 14:13:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766585611;
	bh=x8pJJIM/R06HelItOz0mnR+O24PLB75z92hRRpCFFeo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pTOSExkUKpjzCNkKM4XRqcER33A4BloR9ew66rphUXocMGJtT1hYJrhJBWBepz2jU
	 0AY0KEJZ3kPgQLrS/wFRJBu4bsmMASBtbLZL3SU4zi9mGY3rKnuNPsHY/S2MPB/AJi
	 /8L8oavjE728O8UiMQKSlQzpvpMoXF0QN2Nn0vxA9lOcpxzNkMa7qGnCUkr1cu1qyJ
	 qbx+e4wT81KKmforYbN4cvbgL6u3QU2saJVbtneZqcsyK84eZP94/LzeruJ9nPpFgD
	 e0sbjBjr6iqlJWoeQM3Q/H0ptY6QcQH+rgafijesN80/gkobrFCCgsHM8RSnN85ZqX
	 5+rW0aF6lYz6g==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 834B7F40068;
	Wed, 24 Dec 2025 09:13:29 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Wed, 24 Dec 2025 09:13:29 -0500
X-ME-Sender: <xms:CfVLac-XX2AxodhMm2mUM5fRSkfYO3sjew5HQLb5H_m7r92kjH_Glw>
    <xme:CfVLaQG8Kn4K6xiF50TYZCxH_2Uz-uASo_yTsKOi9vkkLfCCYAshPunSctm6b8LvI
    MgLIUuefwwwIiID7se007ajPfGyu0zELphyntpfFGm-G4OHGgegUqA>
X-ME-Received: <xmr:CfVLabb4t3iCERwBSA2ye8Xqd2k23DDo9Y_G32SgQqovU6hLGfVGUOwoj8tzJg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdeivdeludcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtugfgjgestheksfdttddtjeenucfhrhhomhepmfhirhihlhcu
    ufhhuhhtshgvmhgruhcuoehkrghssehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvg
    hrnhepvddufeetkedvheektdefhfefjeeujeejtdejuedufefhveekkeeffeetvedvffek
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepkhhirh
    hilhhlodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieduudeivdeiheeh
    qddvkeeggeegjedvkedqkhgrsheppehkvghrnhgvlhdrohhrghesshhhuhhtvghmohhvrd
    hnrghmvgdpnhgspghrtghpthhtohepfeekpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopegurghvihgusehkvghrnhgvlhdrohhrghdprhgtphhtthhopehmuhgthhhunhdrsh
    honhhgsehlihhnuhigrdguvghvpdhrtghpthhtohepfihilhhlhiesihhnfhhrrgguvggr
    ugdrohhrghdprhgtphhtthhopehoshgrlhhvrgguohhrsehsuhhsvgdruggvpdhrtghpth
    htoheprhhpphhtsehkvghrnhgvlhdrohhrghdprhgtphhtthhopehvsggrsghkrgesshhu
    shgvrdgtiidprhgtphhtthhopehlohhrvghniihordhsthhorghkvghssehorhgrtghlvg
    drtghomhdprhgtphhtthhopeiiihihsehnvhhiughirgdrtghomhdprhgtphhtthhopegs
    hhgvsehrvgguhhgrthdrtghomh
X-ME-Proxy: <xmx:CfVLaUOx-z6rz2cOkZTXqlMD7SVzr_JasznpUOQR_W4nbGIocrSoPw>
    <xmx:CfVLacyW2XttqkD_f7r3SSyY329K9l__Gd6JRd2zpul-LSdyEFzl1A>
    <xmx:CfVLadCmlcOXe_qvSVLcH65ZUWmmT7zCnJ_DPdjzrVIXPYfb5aO7Og>
    <xmx:CfVLad6weKrosgU6y7QTtpOYp-LbHLKKriDGpJvsEcGMVH2be6LVnA>
    <xmx:CfVLaTIdV2jFWK8oq9ccPbQ88T8QPugBXrDk1urbA8innEyGNP2Nr0Z3>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Wed,
 24 Dec 2025 09:13:28 -0500 (EST)
Date: Wed, 24 Dec 2025 14:13:27 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: "David Hildenbrand (Red Hat)" <david@kernel.org>
Cc: Muchun Song <muchun.song@linux.dev>, 
	Matthew Wilcox <willy@infradead.org>, Oscar Salvador <osalvador@suse.de>, 
	Mike Rapoport <rppt@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Zi Yan <ziy@nvidia.com>, Baoquan He <bhe@redhat.com>, 
	Michal Hocko <mhocko@suse.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Jonathan Corbet <corbet@lwn.net>, kernel-team@meta.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	Andrew Morton <akpm@linux-foundation.org>, Usama Arif <usamaarif642@gmail.com>, 
	Frank van der Linden <fvdl@google.com>
Subject: Re: [PATCHv2 02/14] mm/sparse: Check memmap alignment
Message-ID: <glu3noshgeh7ktwwqofk7xcwkvhek2x3hrbdmyyo56gmctdx3t@adsfih557p7g>
References: <3b758468-9985-49b8-948a-e5837decf52d@kernel.org>
 <CDAEC896-E3EB-4EAB-9F0F-70BC448B3B9A@linux.dev>
 <4f82b8ef-77de-422b-a9a5-691c4eca24a3@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <4f82b8ef-77de-422b-a9a5-691c4eca24a3@kernel.org>

On Tue, Dec 23, 2025 at 10:38:26AM +0100, David Hildenbrand (Red Hat) wrote:
> On 12/22/25 15:55, Muchun Song wrote:
> > 
> > 
> > > On Dec 22, 2025, at 22:18, David Hildenbrand (Red Hat) <david@kernel.org> wrote:
> > > 
> > > ﻿On 12/22/25 15:02, Kiryl Shutsemau wrote:
> > > > > On Mon, Dec 22, 2025 at 04:34:40PM +0800, Muchun Song wrote:
> > > > > 
> > > > > 
> > > > > On 2025/12/18 23:09, Kiryl Shutsemau wrote:
> > > > > > The upcoming changes in compound_head() require memmap to be naturally
> > > > > > aligned to the maximum folio size.
> > > > > > 
> > > > > > Add a warning if it is not.
> > > > > > 
> > > > > > A warning is sufficient as MAX_FOLIO_ORDER is very rarely used, so the
> > > > > > kernel is still likely to be functional if this strict check fails.
> > > > > 
> > > > > Different architectures default to 2 MB alignment (mainly to
> > > > > enable huge mappings), which only accommodates folios up to
> > > > > 128 MB. Yet 1 GB huge pages are still fairly common, so
> > > > > validating 16 GB (MAX_FOLIO_SIZE) alignment seems likely to
> > > > > miss the most frequent case.
> > > > I don't follow. 16 GB check is more strict that anything smaller.
> > > > How can it miss the most frequent case?
> > > > > I’m concerned that this might plant a hidden time bomb: it
> > > > > could detonate at any moment in later code, silently triggering
> > > > > memory corruption or similar failures. Therefore, I don’t
> > > > > think a WARNING is a good choice.
> > > > We can upgrade it BUG_ON(), but I want to understand your logic here
> > > > first.
> > > 
> > > Definitely no BUG_ON(). I would assume this is something we would find early during testing, so even a VM_WARN_ON_ONCE() should be good enough?
> > > 
> > > This smells like a possible problem, though, as soon as some architecture wants to increase the folio size. What would be the expected step to ensure the alignment is done properly?
> > > 
> > > But OTOH, as I raised Willy's work will make all of that here obsolete either way, so maybe not worth worrying about that case too much,
> > 
> > Hi David,
> > 
> 
> Hi! :)
> 
> > I hope you're doing well. I must admit I have limited knowledge of Willy's work, and I was wondering if you might be kind enough to share any publicly available links where I could learn more about the future direction of this project. I would be truly grateful for your guidance.
> > Thank you very much in advance.
> 
> There is some information to be had at [1], but more at [2]. Take a look at
> [2] in "After those projects are complete - Then we can shrink struct page
> to 32 bytes:"
> 
> In essence, all pages (belonging to a memdesc) will have a "memdesc" pointer
> (that replaces the compound_head pointer).
> 
> "Then we make page->compound_head point to the dynamically allocated memdesc
> rather than the first page. Then we can transition to the above layout. "

I am not sure I understand how it is going to work.

32-byte layout indicates that flags will stay in the statically
allocated part, but most (all?) flags are in the head page and we would
need a way to redirect from tail to head in the statically allocated
pages.

> The "memdesc" could be a pointer to a "struct folio" that is allocated from
> the slab.
> 
> So in the new memdesc world, all pages part of a folio will point at the
> allocated "struct folio", not the head page where "struct folio" currently
> overlays "struct page".
> 
> That would mean that the proposal in this patch set will have to be reverted
> again.
> 
> 
> At LPC, Willy said that he wants to have something out there in the first
> half of 2026.

Okay, seems ambitious to me.

Last time I asked, we had no idea how much performance would additional
indirection cost us. Do we have a clue?

I like memdesc idea, but indirection cost always bothered me.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
