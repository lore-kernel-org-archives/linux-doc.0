Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD3BA331A6A
	for <linux-doc@vger.kernel.org>; Mon, 22 Dec 2025 14:49:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766414989; cv=none; b=GTlwIgCMCiDmWzG8YBXDmm0p7MmUiyQwOxxe5uLEm9VgtH7rMTgx/jVzjFmiyIkikoQ/1pThgt43evvf/OjlUfyPsO/Yu1pSLgkC/kbFoLIjg9C0+upysSYn5B23rOHOkjS59ZX9EFnj47K3IW5TUYqsDbyJfWyfREUu4zttNRg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766414989; c=relaxed/simple;
	bh=vGX2ebHS3FUA9kDS3IHb3mZtMfSrYA7vMezy7bzyoVk=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=briwpkyHYFPLtRHRD5B8Nb6OiQwzO8zUmdHZMusfz6byIisZelkvd2lUo/0NMCmfXb9kZXfLbQoulKn2yzehf7tDzez166vVslsOfKY/jEgJsNLvh7AgyVdY+S7X9IGPEbl8k1v/O5xfEP6yoR7+bjXxx6MZ5xu+3iJ0uIWJRss=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=s3qFahro; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="s3qFahro"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A70B3C113D0;
	Mon, 22 Dec 2025 14:49:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766414989;
	bh=vGX2ebHS3FUA9kDS3IHb3mZtMfSrYA7vMezy7bzyoVk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s3qFahroge6rI/hBe6z07XE9a2/VK4+/lv9eCCDExK9vbGqgq/QB75DRuEdtMZe1p
	 fBr8VhzYpLc9pEt+xsWZZoO+bFFndyqwMzpMr1mDwteisrcygmlbLd+gyp2gDQ6U1o
	 PIonx7xV+e5tKwmzMiapJYPdxE+OyD8rzAwkRnCthVV8UVvejAAW/3++fAIh3MQG51
	 ESJLG85wRzbW5e7ktAUOX6AjEfGIyT9dTtUPi0ppx/gTz4mU0yOX0dd8gmokbeC2Us
	 50baRPjWIRA1IbY9GgGAJmviFXmr9nx2brZjYFYZesTvYT/vKBnRvmOui25IXiEutu
	 0tW8xP3X7YEQA==
Received: from phl-compute-06.internal (phl-compute-06.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id E85B8F4006A;
	Mon, 22 Dec 2025 09:49:47 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-06.internal (MEProxy); Mon, 22 Dec 2025 09:49:47 -0500
X-ME-Sender: <xms:i1pJadEB5s4PfmL4VfeBPa8rVwho-OmEcnN6121wT3usdCZIBcRL8w>
    <xme:i1pJaduqe8bBJZ2fNCk7UpOF4uie2JM2FP7iWf5R2MY9xE4AP9_0canUsCj-qqQ0S
    L29ghdlAmOVBJt7wln3grHD8ulZjXMCOpk8JX2wFcIPLkVC92t3sd0>
X-ME-Received: <xmr:i1pJaYiHvTY2m04sxTzBVGh8d8cCv6fRN94kGE3P02QhNVjd9PibOHoLjQ35rQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdehjedvvdcutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdfstddttddvnecuhfhrohhmpefmihhrhihlucfu
    hhhuthhsvghmrghuuceokhgrsheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtthgvrh
    hnpeehieekueevudehvedtvdffkefhueefhfevtdduheehkedthfdtheejveelueffgeen
    ucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehkihhrih
    hllhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqudeiudduiedvieehhedq
    vdekgeeggeejvdekqdhkrghspeepkhgvrhhnvghlrdhorhhgsehshhhuthgvmhhovhdrnh
    grmhgvpdhnsggprhgtphhtthhopeefkedpmhhouggvpehsmhhtphhouhhtpdhrtghpthht
    ohepmhhutghhuhhnrdhsohhngheslhhinhhugidruggvvhdprhgtphhtthhopegrkhhpmh
    eslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepuggrvhhiuges
    khgvrhhnvghlrdhorhhgpdhrtghpthhtohepfihilhhlhiesihhnfhhrrgguvggrugdroh
    hrghdprhgtphhtthhopehushgrmhgrrghrihhfieegvdesghhmrghilhdrtghomhdprhgt
    phhtthhopehfvhgulhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepohhsrghlvhgrug
    horhesshhushgvrdguvgdprhgtphhtthhopehrphhptheskhgvrhhnvghlrdhorhhgpdhr
    tghpthhtohepvhgsrggskhgrsehsuhhsvgdrtgii
X-ME-Proxy: <xmx:i1pJaa0sQuuP5-tF1CG2yd8RRV71mcDHOC8k7SEUEhenN5uvOAPlrg>
    <xmx:i1pJae5eddop5tXLgu3yJSPnvW2a8_O4MuAJuApNQgw67ollCkw4Xw>
    <xmx:i1pJaUppEP2SKKU2jE8oye7ZexoiZgUIvckyJaRl92VkTkSHoLD1cA>
    <xmx:i1pJadAa74JB_6hTAj2tU0BhjKZ_l9BvO9FtjdxJv_oc2LZiGdJXkw>
    <xmx:i1pJaTylCX1_5TSQ2u3mt5x1jWa40Rt1i7pGfKJBtV9aSLJp5KHr8Cb7>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 22 Dec 2025 09:49:47 -0500 (EST)
Date: Mon, 22 Dec 2025 14:49:46 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: Muchun Song <muchun.song@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Matthew Wilcox <willy@infradead.org>, 
	Usama Arif <usamaarif642@gmail.com>, Frank van der Linden <fvdl@google.com>, 
	Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>, 
	Vlastimil Babka <vbabka@suse.cz>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Zi Yan <ziy@nvidia.com>, Baoquan He <bhe@redhat.com>, Michal Hocko <mhocko@suse.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>, kernel-team@meta.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCHv2 06/14] mm: Rework compound_head() for power-of-2
 sizeof(struct page)
Message-ID: <4ftjalacw753dx7beowgtxs7heckx2eopfcgugxyomgn4qwujd@fxwey4d2wqtn>
References: <20251218150949.721480-1-kas@kernel.org>
 <20251218150949.721480-7-kas@kernel.org>
 <34BED0AB-22AF-4107-84FB-543D11BCA136@linux.dev>
 <78326B0A-7845-4D80-8BAE-C2191030F8BC@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <78326B0A-7845-4D80-8BAE-C2191030F8BC@linux.dev>

On Mon, Dec 22, 2025 at 05:45:16PM +0800, Muchun Song wrote:
> 
> 
> > On Dec 22, 2025, at 15:57, Muchun Song <muchun.song@linux.dev> wrote:
> > 
> > 
> > 
> >> On Dec 18, 2025, at 23:09, Kiryl Shutsemau <kas@kernel.org> wrote:
> >> 
> >> For tail pages, the kernel uses the 'compound_info' field to get to the
> >> head page. The bit 0 of the field indicates whether the page is a
> >> tail page, and if set, the remaining bits represent a pointer to the
> >> head page.
> >> 
> >> For cases when size of struct page is power-of-2, change the encoding of
> >> compound_info to store a mask that can be applied to the virtual address
> >> of the tail page in order to access the head page. It is possible
> >> because struct page of the head page is naturally aligned with regards
> >> to order of the page.
> >> 
> >> The significant impact of this modification is that all tail pages of
> >> the same order will now have identical 'compound_info', regardless of
> >> the compound page they are associated with. This paves the way for
> >> eliminating fake heads.
> >> 
> >> The HugeTLB Vmemmap Optimization (HVO) creates fake heads and it is only
> >> applied when the sizeof(struct page) is power-of-2. Having identical
> >> tail pages allows the same page to be mapped into the vmemmap of all
> >> pages, maintaining memory savings without fake heads.
> >> 
> >> If sizeof(struct page) is not power-of-2, there is no functional
> >> changes.
> >> 
> > 
> > Forgot to mention, I believe I stated in the previous version that this
> > mechanism only applies when CONFIG_SPARSEMEM_VMEMMAP is configured.
> > Therefore, you need to wrap the entire mechanism within CONFIG_SPARSEMEM_VMEMMAP.
> > For other configurations, it's difficult to guarantee alignment to a very
> > large size (for example, in the case of CONFIG_SPARSEMEM && !CONFIG_SPARSEMEM_VMEMMAP,
> > vmemmap allocation uses kvmalloc, which only guarantees PAGE_SIZE alignment
> > for the returned address).
> 
> I found that we can call kvmalloc_node_align inside populate_section_memmap (for
> memory hotplug case), so that we can specify the alignment parameter as the
> input size. Then, this mechanism can applied for CONFIG_SPARSEMEM &&
> !CONFIG_SPARSEMEM_VMEMMAP.
> 
> For CONFIG_FLATMEM, we also need similar approach to specify the correct alignment
> in alloc_node_mem_map().

I guess I will need to invest some time to make a test setup with
!VMEMMAP and FLATMEM.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
