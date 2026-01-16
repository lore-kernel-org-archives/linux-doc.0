Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43CB623EAAB;
	Fri, 16 Jan 2026 15:52:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768578729; cv=none; b=FZS1BWPGjdC7SEyBQL7ew04deY2RS+TwtqWFe21h6fjoHZx3Hw4/9uZAm5ZpvTfXz4Dol1b6xG4q9R76/1UYLRqy8FL0ONImlUXyvrhsWlEg6wPX8fZ2sKC9wPigFcNRHTJEzs7GWFaxu1s7d+HpTW3YayTaEXqJjHSfZoFsnyg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768578729; c=relaxed/simple;
	bh=eCzWYaGZTUP+beL+9UPZ9ITMhEfxovlcFAIKTTrSvZ8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=j9ScvL3EFV+RWL/xhVb6zCP0f9Fws/NrwlyaRcnKlGe/Rir+Tw8ejOlIyV+7RL/JDozje6jVC0IvuBwr+MMmKzSa8JECLXYdNAtznoIpB8RuYYMWP/iWvv9UyPwgSjh3QoFSM7jT9nu9YJxSNHxdcJvZIwBkbG+ALyh/5nkFu1k=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Pmc1Imf4; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Pmc1Imf4"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29F03C4AF0B;
	Fri, 16 Jan 2026 15:52:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768578728;
	bh=eCzWYaGZTUP+beL+9UPZ9ITMhEfxovlcFAIKTTrSvZ8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Pmc1Imf4gORlu96JpBp6zNbihTHFSqK7nquXUULOcnBi+H3oSuXZqDIf3EsJk4hyL
	 kOFpLoL6gUi4aHMp4VLnv2zAxpYUGZqYaimnHf/1erVDCd2GxmyRmfCjcvCa4EMuYZ
	 fcoEMRqn8xmDVuYcWKqfQH9qsCNd1BWS+4aG5Zd5n/znFnTdgFw9+VMngHWb29MwLT
	 pRTELNA2C6yRXJLZt82Rm7FWCueuRkuCRW9TffkR8Uj3AwjpH+a3edVMZStEvMraYt
	 PapD2N5KDNcl/9HFrDmQA2fVJPlxf6NATUNFQQUyGxgrGe4hD6tZdtUQDhQezOnHDj
	 169915KiQrTdw==
Received: from phl-compute-11.internal (phl-compute-11.internal [10.202.2.51])
	by mailfauth.phl.internal (Postfix) with ESMTP id 4D3BCF4006A;
	Fri, 16 Jan 2026 10:52:07 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-11.internal (MEProxy); Fri, 16 Jan 2026 10:52:07 -0500
X-ME-Sender: <xms:p15qaYZ6tvRD3Pfui3Ky--bjoitvSOcIGky0pUw3ZhwJyHzu3EPhtQ>
    <xme:p15qaeytjWmVMUj8Qe-ArKb7jDI_O8UMrP1KgCSTWQeYok4isam0hRYQxJqpVTNq8
    saAcxudwFMSKdv7DI1NYivLj5YqS0fbwsFXfUHhbgfMIcF2t-bugMMY>
X-ME-Received: <xmr:p15qacUb1mXWq7b-vGdq7OksmrrxUdHq0FtAtTTvto5arJJ-9u1UYBBTAyip_w>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgdduvdelfeegucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtrodttddtvdenucfhrhhomhepmfhirhihlhcu
    ufhhuhhtshgvmhgruhcuoehkrghssehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvg
    hrnheptdetfeelteefteekfefggfffteelvedulefgveduvdeljeejjedtfeegfedvkeeg
    necuvehluhhsthgvrhfuihiivgeptdenucfrrghrrghmpehmrghilhhfrhhomhepkhhirh
    hilhhlodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqdduieduudeivdeiheeh
    qddvkeeggeegjedvkedqkhgrsheppehkvghrnhgvlhdrohhrghesshhhuhhtvghmohhvrd
    hnrghmvgdpnhgspghrtghpthhtohepfeekpdhmohguvgepshhmthhpohhuthdprhgtphht
    thhopehmuhgthhhunhdrshhonhhgsehlihhnuhigrdguvghvpdhrtghpthhtohepuggrvh
    hiugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtoheprghkphhmsehlihhnuhigqdhfohhu
    nhgurghtihhonhdrohhrghdprhgtphhtthhopeifihhllhihsehinhhfrhgruggvrggurd
    horhhgpdhrtghpthhtohepuhhsrghmrggrrhhifheigedvsehgmhgrihhlrdgtohhmpdhr
    tghpthhtohepfhhvughlsehgohhoghhlvgdrtghomhdprhgtphhtthhopehoshgrlhhvrg
    guohhrsehsuhhsvgdruggvpdhrtghpthhtoheprhhpphhtsehkvghrnhgvlhdrohhrghdp
    rhgtphhtthhopehvsggrsghkrgesshhushgvrdgtii
X-ME-Proxy: <xmx:p15qaaYYJJyRdPZU62RC-HDsWBgPudLkz1GCFCcdQbE7rUjNt0kgmQ>
    <xmx:p15qafONNJxOPFbr6xfWLJDLqO2KJpF-wy3sY2b45eYc9DXuhEK9uw>
    <xmx:p15qaWvsUe49MsUTq7CRnHmOketxvTSDNOoWx-bLzP8hgRNABo9_lQ>
    <xmx:p15qad2VD5hVFV_XwQ2E2lmWnCEhB590c3re0hKwJg_iONlxlDvw0Q>
    <xmx:p15qacW3Z2CMVXDDByGjRzPdsGxPU--NWxnLfDw4Vj46pIrUoXr12QZS>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 16 Jan 2026 10:52:06 -0500 (EST)
Date: Fri, 16 Jan 2026 15:52:05 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: Muchun Song <muchun.song@linux.dev>
Cc: "David Hildenbrand (Red Hat)" <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, Matthew Wilcox <willy@infradead.org>, 
	Usama Arif <usamaarif642@gmail.com>, Frank van der Linden <fvdl@google.com>, 
	Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>, 
	Vlastimil Babka <vbabka@suse.cz>, Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
	Zi Yan <ziy@nvidia.com>, Baoquan He <bhe@redhat.com>, Michal Hocko <mhocko@suse.com>, 
	Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>, kernel-team@meta.com, 
	linux-mm@kvack.org, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCHv3 10/15] mm/hugetlb: Remove fake head pages
Message-ID: <aWpTopypeRTOIVGR@thinkstation>
References: <20260115144604.822702-1-kas@kernel.org>
 <20260115144604.822702-11-kas@kernel.org>
 <30ae1623-63f9-4729-9c19-9b0a9a0ae9f1@kernel.org>
 <aWkhbWR-3fWjeTaE@thinkstation>
 <53980726-C7F0-4648-99E9-89E10645F2E7@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <53980726-C7F0-4648-99E9-89E10645F2E7@linux.dev>

On Fri, Jan 16, 2026 at 10:38:02AM +0800, Muchun Song wrote:
> 
> 
> > On Jan 16, 2026, at 01:23, Kiryl Shutsemau <kas@kernel.org> wrote:
> > 
> > On Thu, Jan 15, 2026 at 05:49:43PM +0100, David Hildenbrand (Red Hat) wrote:
> >> On 1/15/26 15:45, Kiryl Shutsemau wrote:
> >>> HugeTLB Vmemmap Optimization (HVO) reduces memory usage by freeing most
> >>> vmemmap pages for huge pages and remapping the freed range to a single
> >>> page containing the struct page metadata.
> >>> 
> >>> With the new mask-based compound_info encoding (for power-of-2 struct
> >>> page sizes), all tail pages of the same order are now identical
> >>> regardless of which compound page they belong to. This means the tail
> >>> pages can be truly shared without fake heads.
> >>> 
> >>> Allocate a single page of initialized tail struct pages per NUMA node
> >>> per order in the vmemmap_tails[] array in pglist_data. All huge pages
> >>> of that order on the node share this tail page, mapped read-only into
> >>> their vmemmap. The head page remains unique per huge page.
> >>> 
> >>> This eliminates fake heads while maintaining the same memory savings,
> >>> and simplifies compound_head() by removing fake head detection.
> >>> 
> >>> Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
> >>> ---
> >>>  include/linux/mmzone.h | 16 ++++++++++++++-
> >>>  mm/hugetlb_vmemmap.c   | 44 ++++++++++++++++++++++++++++++++++++++++--
> >>>  mm/sparse-vmemmap.c    | 44 ++++++++++++++++++++++++++++++++++--------
> >>>  3 files changed, 93 insertions(+), 11 deletions(-)
> >>> 
> >>> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> >>> index 322ed4c42cfc..2ee3eb610291 100644
> >>> --- a/include/linux/mmzone.h
> >>> +++ b/include/linux/mmzone.h
> >>> @@ -82,7 +82,11 @@
> >>>   * currently expect (see CONFIG_HAVE_GIGANTIC_FOLIOS): with hugetlb, we expect
> >>>   * no folios larger than 16 GiB on 64bit and 1 GiB on 32bit.
> >>>   */
> >>> -#define MAX_FOLIO_ORDER get_order(IS_ENABLED(CONFIG_64BIT) ? SZ_16G : SZ_1G)
> >>> +#ifdef CONFIG_64BIT
> >>> +#define MAX_FOLIO_ORDER (34 - PAGE_SHIFT)
> >>> +#else
> >>> +#define MAX_FOLIO_ORDER (30 - PAGE_SHIFT)
> >>> +#endif
> >> 
> >> Where do these magic values stem from, and how do they related to the
> >> comment above that clearly spells out 16G vs. 1G ?
> > 
> > This doesn't change the resulting value: 1UL << 34 is 16GiB, 1UL << 30
> > is 1G. Subtract PAGE_SHIFT to get the order.
> > 
> > The change allows the value to be used to define NR_VMEMMAP_TAILS which
> > is used specify size of vmemmap_tails array.
> 
> How about allocate ->vmemmap_tails array dynamically? If sizeof of struct
> page is not power of two, then we could optimize away this array. Besides,
> the original MAX_FOLIO_ORDER could work as well.

This is tricky.

We need vmemmap_tails array to be around early, in
hugetlb_vmemmap_init_early(). By the time, we don't have slab
functional yet.

I think getting the array compile-time is the best shot.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
