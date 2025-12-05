Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94EBC1DED42
	for <linux-doc@vger.kernel.org>; Fri,  5 Dec 2025 21:41:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764970881; cv=none; b=kpHRGaoiJ+U+0tac5VzfWUC0JYFFsy+Qoh4qVmr8jSS31VyWzOLZXH4Hl+8HXxAtEtRBDshq4fbhOka4jmNCaX5OP3Wp0fS1s24KBvNBLB7N0ZhrK2XiLTKXm+jxEcHq6Wmy1S2Bp2AHSC90u5PlcF0GNJH2IwXxe/YFIIWNdoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764970881; c=relaxed/simple;
	bh=p9bCuddlU0so7It/V5QQDTOU/BfpR+4mc0CoT4AQ0Co=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=N/JOrsBq+NDiAjZIYnimx+mays7XSEkIftU8a8ISDfOWuQnSP5mQ66mrzaN0dwgPXysjFu+ZhcRI4TNwLmMydf9GFq+bsRZgWlDjkw1X/hLKzxTzC9VMmRCY+yuViipbtKvI/dGqSF3o2wXlF6RK98ozvyo3kEXs1sQsucn9MfU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QZ/OnQgW; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QZ/OnQgW"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C30F3C116B1;
	Fri,  5 Dec 2025 21:41:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764970881;
	bh=p9bCuddlU0so7It/V5QQDTOU/BfpR+4mc0CoT4AQ0Co=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QZ/OnQgWxz4rZhoKIiOXM6gAGLyKmtTLN8rxbMat8nNydfGE69Xv0lT74fDUIHp6n
	 9/Q5wn674/he8Qoy0K3S5FrDWfqqBLUcqm7w5cMJa+bmMpPk+vytQ8qIE8awwdVLhw
	 piwJKhXi9LDPOw/Ymv+SfTm+VM2EqpiuVWwajGK5SkGvuQ3gazHEXqMRPTufpahNut
	 fv8FrUV++SdF1WqVieuaYTnVUB3+TrA91VWkm2eC86NQUST7chVxm0FY8P+qwyvm59
	 DtpQUTEZGJf2WSYV2IcMQENYgxx4Q3NiaKrCaNuWUivvH8VNN1Xa3StQ5p8s9UvlIH
	 ZPL/42p81xm1Q==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 01197F4006A;
	Fri,  5 Dec 2025 16:41:19 -0500 (EST)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-04.internal (MEProxy); Fri, 05 Dec 2025 16:41:20 -0500
X-ME-Sender: <xms:f1EzaT5rRXNgqUMFcaw3QYRZ1OFC7nl-N4Wa7IUDHJYYYzgRmrjQXA>
    <xme:f1EzafvCMLhDjA8lh2UZEARDP_LRYpapGQxsQF54Y2IIn0TnquFlL25OIBNdFHzc7
    gvcAZUtm-fBlfRYfDZUzn4QVsG69dcGQCrNlX2sVm_2nhzEbJoQg_o>
X-ME-Received: <xmr:f1EzaTYd4oIliimr1RVCDW_ctRR1Y2EYAY4_VXKC0GZByy5Fr2cDc0z-WWsaKA>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdelgeegucetufdoteggodetrfdotf
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
X-ME-Proxy: <xmx:f1EzaW-_TroeQG2jCbntYDB4kQeAA-gXyvY-PTpHFJMt4gAPVfve7w>
    <xmx:f1Ezaba_ie_pSiIElbmQzeYNWbepBm_k4E0xE3uIPC1RGazUeJXVVg>
    <xmx:f1EzacSMmrITBTwbaGBGYg2wFBh9PhiG2Al9qdJlpYqHfo1S60VR9w>
    <xmx:f1EzaSlEtq07IH2VoT5xhgysbfXKpQgVOLUMTtT1fQsv6gDGJsG8JA>
    <xmx:f1EzaQIkDa-O594T7dQhn-lf84kvTu4Iq5cCv0ucB_3tMm-rZpiCy9yi>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 5 Dec 2025 16:41:19 -0500 (EST)
Date: Fri, 5 Dec 2025 21:41:18 +0000
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
Message-ID: <3v5hdubqnil6w54kimvbgapghj7irjp7xuqma6uxtsrpvj22ph@6t47vsevdwyi>
References: <20251205194351.1646318-1-kas@kernel.org>
 <e1c50f7e-cec4-4676-b5d6-f6446cd64ba5@kernel.org>
 <bdie34dgpltxd5ayvjvqkusx4thdrrebgllvwp333psfuu4vgj@bkfxg2c5sfr2>
 <01e5d0b3-dbf8-4f77-b38a-f48c46f7c31e@kernel.org>
 <ysvhofzg5mdtvxfujdsmffkuqna72pr52ehrpglmlhxnvwstas@xurgptkgtnbe>
 <1b659d59-b1c1-4910-baab-0eef7cda234f@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1b659d59-b1c1-4910-baab-0eef7cda234f@kernel.org>

On Fri, Dec 05, 2025 at 10:34:48PM +0100, David Hildenbrand (Red Hat) wrote:
> On 12/5/25 21:54, Kiryl Shutsemau wrote:
> > On Fri, Dec 05, 2025 at 09:44:30PM +0100, David Hildenbrand (Red Hat) wrote:
> > > On 12/5/25 21:33, Kiryl Shutsemau wrote:
> > > > On Fri, Dec 05, 2025 at 09:16:08PM +0100, David Hildenbrand (Red Hat) wrote:
> > > > > On 12/5/25 20:43, Kiryl Shutsemau wrote:
> > > > > > This series removes "fake head pages" from the HugeTLB vmemmap
> > > > > > optimization (HVO) by changing how tail pages encode their relationship
> > > > > > to the head page.
> > > > > > 
> > > > > > It simplifies compound_head() and page_ref_add_unless(). Both are in the
> > > > > > hot path.
> > > > > > 
> > > > > > Background
> > > > > > ==========
> > > > > > 
> > > > > > HVO reduces memory overhead by freeing vmemmap pages for HugeTLB pages
> > > > > > and remapping the freed virtual addresses to a single physical page.
> > > > > > Previously, all tail page vmemmap entries were remapped to the first
> > > > > > vmemmap page (containing the head struct page), creating "fake heads" -
> > > > > > tail pages that appear to have PG_head set when accessed through the
> > > > > > deduplicated vmemmap.
> > > > > > 
> > > > > > This required special handling in compound_head() to detect and work
> > > > > > around fake heads, adding complexity and overhead to a very hot path.
> > > > > > 
> > > > > > New Approach
> > > > > > ============
> > > > > > 
> > > > > > For architectures/configs where sizeof(struct page) is a power of 2 (the
> > > > > > common case), this series changes how position of the head page is encoded
> > > > > > in the tail pages.
> > > > > > 
> > > > > > Instead of storing a pointer to the head page, the ->compound_info
> > > > > > (renamed from ->compound_head) now stores a mask.
> > > > > 
> > > > > (we're in the merge window)
> > > > > 
> > > > > That doesn't seem to be suitable for the memdesc plans, where we want all
> > > > > tail pages do directly point at the allocated memdesc (e.g., struct folio),
> > > > > no?
> > > > 
> > > > Sure. My understanding is that it is going to eliminate a need in
> > > > compound_head() completely. I don't see the conflict so far.
> > > 
> > > Right. All compound_head pointers will point at the allocated memdesc.
> > > 
> > > Would we still have to detect fake head pages though (at least for some
> > > transition period)?
> > 
> > If we need to detect if the memdesc is tail it should be as trivial as
> > comparing the given memdesc to the memdesc - 1. If they match, you are
> > looking at the tail.
> 
> How could you assume memdesc - 1 exists without performing other checks?

Map zero page in front of every discontinuous vmemmap region :P

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
