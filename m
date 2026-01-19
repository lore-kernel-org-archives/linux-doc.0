Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 291AD37E2E4
	for <linux-doc@vger.kernel.org>; Mon, 19 Jan 2026 15:15:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768835731; cv=none; b=mQxSuDCgxUR80dNqnx7G0tfBnRvMhv/FB+9j7v2raeHu22aecIRMI7fhcwEgZAN1Xft9FtmHLyzZo9NHC+1Bpxzuvp3nFmhISQaJw4Vq5MenWEyGMaupdsYjt0zyvDCEcX3yBNMBJydHI5hAD1W8HASKxZ505DktlCEyHTNUVbs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768835731; c=relaxed/simple;
	bh=ERVCOL+UrRNglZlm0SAA4pm43qoW2KUHl1G7b7RQrY8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=RQCQI4v5fMzwnqETrQfTgby3al+kMApnbt9xaqLkINiEY7dphBbaAJP4DrRzdDUlmsrPRqMT/Na20RI4NoQZNr84bUYwpKxKhrFkqcYgHOggRSDuzq/7zJPRFG1ByOq0j+bgv/vYwDoL1T5oxJCihctyqjbnqYqEUI0/yrWpTJc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=gxI4WxL2; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="gxI4WxL2"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69928C19425;
	Mon, 19 Jan 2026 15:15:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768835731;
	bh=ERVCOL+UrRNglZlm0SAA4pm43qoW2KUHl1G7b7RQrY8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gxI4WxL2KeCTrT1loBHKBH3ovIoJwmhprmU+FOkz/6UyJBRwPCNr91rYtPs6PacDe
	 evX53ZMWitptOXs+a3Ou7dX4Xl7PmJINTpXNimVuMmPELldGgGgKwE2orlnX9vEBbA
	 S9zf8vJdjTnTTiLxvnFe2ubuKaYj64JwQjSin/DwAW3DE/lzdxLVrNDK3MlujZxjT+
	 auNDVo7pJ+mHRuSAIW33BPcxSTaUZq4xYlOFTkSYXUX7H4tbKhvuq5FRWoiNUs2Ic3
	 6jFzSqIiw323NAlGa63b3YOUyaHnNdp0Pp40lygpqNqT+dC/94X03xDChegrMtacb8
	 sg4uCUhJ1nfMg==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 8CFD9F4006A;
	Mon, 19 Jan 2026 10:15:29 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Mon, 19 Jan 2026 10:15:29 -0500
X-ME-Sender: <xms:kUpuadZdQgQcT-hJnAcxqwQrRPWBaTZjjZ6sEmDykyxNPXKPPr6BAg>
    <xme:kUpuafxWF6RhjiGh0ZhMwjKoYzkIaY-9rVryNen3QkT2jWGMQRb_RBHCNXgjUUTYI
    iQQZKt-MbbhJpCw8FR-vV9DofZVC5ydYQG004hiA9NA71GB8v17i4s>
X-ME-Received: <xmr:kUpuaZV3F7vtVH6jOmDpG767nABDfS7nrvyfbyLEdZfOSa3-0kzC6GGfpsd8vg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddufeejkeelucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggujgesthdtredttddtvdenucfhrhhomhepmfhirhihlhcu
    ufhhuhhtshgvmhgruhcuoehkrghssehkvghrnhgvlhdrohhrgheqnecuggftrfgrthhtvg
    hrnhepueeijeeiffekheeffffftdekleefleehhfefhfduheejhedvffeluedvudefgfek
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
X-ME-Proxy: <xmx:kUpuaTYQNaUhzdNBpaYFc1P_rbbk59geGHZ0hl22WoKGrCcyyaqVmg>
    <xmx:kUpuaUNWmc-LybbWiCZGW4vtfkyMTsoMNExVXE3u9jJhf_W7ocF73Q>
    <xmx:kUpuaXsW82VIWNabQV2XLV1pbDgDsJmzYu-Uw5RdcERSSnjuO55nWw>
    <xmx:kUpuaa3eOPoICmiQDysPOIx1LxU0w755ZSyaZuzAFyTuFHVwwgHMug>
    <xmx:kUpuaVWYJsNLs_16nkft-ftjAmGrP2kreJwGpoYPpku3zr3CnEXalXSB>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 19 Jan 2026 10:15:27 -0500 (EST)
Date: Mon, 19 Jan 2026 15:15:22 +0000
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
Message-ID: <aW5JqibNe4CVBa07@thinkstation>
References: <20260115144604.822702-1-kas@kernel.org>
 <20260115144604.822702-11-kas@kernel.org>
 <30ae1623-63f9-4729-9c19-9b0a9a0ae9f1@kernel.org>
 <aWkhbWR-3fWjeTaE@thinkstation>
 <53980726-C7F0-4648-99E9-89E10645F2E7@linux.dev>
 <aWpTopypeRTOIVGR@thinkstation>
 <0F1C93F3-9A1A-4929-9157-589CF8C0588D@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0F1C93F3-9A1A-4929-9157-589CF8C0588D@linux.dev>

On Sat, Jan 17, 2026 at 10:38:48AM +0800, Muchun Song wrote:
> 
> 
> > On Jan 16, 2026, at 23:52, Kiryl Shutsemau <kas@kernel.org> wrote:
> > 
> > On Fri, Jan 16, 2026 at 10:38:02AM +0800, Muchun Song wrote:
> >> 
> >> 
> >>> On Jan 16, 2026, at 01:23, Kiryl Shutsemau <kas@kernel.org> wrote:
> >>> 
> >>> On Thu, Jan 15, 2026 at 05:49:43PM +0100, David Hildenbrand (Red Hat) wrote:
> >>>> On 1/15/26 15:45, Kiryl Shutsemau wrote:
> >>>>> HugeTLB Vmemmap Optimization (HVO) reduces memory usage by freeing most
> >>>>> vmemmap pages for huge pages and remapping the freed range to a single
> >>>>> page containing the struct page metadata.
> >>>>> 
> >>>>> With the new mask-based compound_info encoding (for power-of-2 struct
> >>>>> page sizes), all tail pages of the same order are now identical
> >>>>> regardless of which compound page they belong to. This means the tail
> >>>>> pages can be truly shared without fake heads.
> >>>>> 
> >>>>> Allocate a single page of initialized tail struct pages per NUMA node
> >>>>> per order in the vmemmap_tails[] array in pglist_data. All huge pages
> >>>>> of that order on the node share this tail page, mapped read-only into
> >>>>> their vmemmap. The head page remains unique per huge page.
> >>>>> 
> >>>>> This eliminates fake heads while maintaining the same memory savings,
> >>>>> and simplifies compound_head() by removing fake head detection.
> >>>>> 
> >>>>> Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
> >>>>> ---
> >>>>> include/linux/mmzone.h | 16 ++++++++++++++-
> >>>>> mm/hugetlb_vmemmap.c   | 44 ++++++++++++++++++++++++++++++++++++++++--
> >>>>> mm/sparse-vmemmap.c    | 44 ++++++++++++++++++++++++++++++++++--------
> >>>>> 3 files changed, 93 insertions(+), 11 deletions(-)
> >>>>> 
> >>>>> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> >>>>> index 322ed4c42cfc..2ee3eb610291 100644
> >>>>> --- a/include/linux/mmzone.h
> >>>>> +++ b/include/linux/mmzone.h
> >>>>> @@ -82,7 +82,11 @@
> >>>>>  * currently expect (see CONFIG_HAVE_GIGANTIC_FOLIOS): with hugetlb, we expect
> >>>>>  * no folios larger than 16 GiB on 64bit and 1 GiB on 32bit.
> >>>>>  */
> >>>>> -#define MAX_FOLIO_ORDER get_order(IS_ENABLED(CONFIG_64BIT) ? SZ_16G : SZ_1G)
> >>>>> +#ifdef CONFIG_64BIT
> >>>>> +#define MAX_FOLIO_ORDER (34 - PAGE_SHIFT)
> >>>>> +#else
> >>>>> +#define MAX_FOLIO_ORDER (30 - PAGE_SHIFT)
> >>>>> +#endif
> >>>> 
> >>>> Where do these magic values stem from, and how do they related to the
> >>>> comment above that clearly spells out 16G vs. 1G ?
> >>> 
> >>> This doesn't change the resulting value: 1UL << 34 is 16GiB, 1UL << 30
> >>> is 1G. Subtract PAGE_SHIFT to get the order.
> >>> 
> >>> The change allows the value to be used to define NR_VMEMMAP_TAILS which
> >>> is used specify size of vmemmap_tails array.
> >> 
> >> How about allocate ->vmemmap_tails array dynamically? If sizeof of struct
> >> page is not power of two, then we could optimize away this array. Besides,
> >> the original MAX_FOLIO_ORDER could work as well.
> > 
> > This is tricky.
> > 
> > We need vmemmap_tails array to be around early, in
> > hugetlb_vmemmap_init_early(). By the time, we don't have slab
> > functional yet.
> 
> I mean zero-size array at the end of pg_data_t, no slab is needed.

For !NUMA, the struct is in BSS. See contig_page_data.

Dynamic array won't fly there.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
