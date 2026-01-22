Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02563659E8;
	Thu, 22 Jan 2026 17:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769104797; cv=none; b=klJ0Xvk1bQg1RFP3GTfLcokliCc761kGbJf96iFIsxh2FUD1AxqgBatJfLDuvpkuASZLotfobR4zticz4n6vkEQBAA0ocE/7hfAd6UWi4hLvAsoJN9lx6tsH+NaotA2ZDs71B527jA7/qG4PrH+rD3OrLBsT0QxvviCoTmqojww=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769104797; c=relaxed/simple;
	bh=cT6/GvZiYYHD0xqjiEm6vn61jo1kWgmPBjWYhruQBGI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=hfsLee9OaGXjK2G2990GUhKfhJKRsZxKaqGrYeHFrGJmu8sc+SXJBO7S0T3e+EpLXGVXTzxqvWAhJpih+/iXcvAGQxuNqiyWl+H0ExGzXH12CN5DYUnM1VlQ5kgLkcRavcsbzvlc05fyq9V2/Jd3muMdYp9fLYeM0ygg5jZG0aY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QOaubKEC; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QOaubKEC"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C8BEC116D0;
	Thu, 22 Jan 2026 17:59:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769104797;
	bh=cT6/GvZiYYHD0xqjiEm6vn61jo1kWgmPBjWYhruQBGI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=QOaubKECRFAbr8dMDWdAtSczfiJU/LAc1mZW+cNklcLHWxGeJWzmSYOWb2fWpaxkO
	 35pdoGeVyOC1rLnSAHPn2y8KLAyvhr5tpCdYXe8qYzUs3jjm90XB8FuM8ISzZDbcpY
	 P1KEbviQli9ImzEIBlPiIl10m0TypcEyluzdnydEgiJSmvMJqcR0Wcg7pSzuGkSeKs
	 UpXN5Qxm2BGm1B2Rli3gDgeMKt6pXevlE4gv+G7ePgoH8SdfOx/Do6AzmIklruXIyC
	 JP2B/p5LhcKcdVJZcNi4Z4kbZtPgHckwjK5VVfOlL5+lv1z6evYyWfvoUurRxLxl4T
	 Og/AnL8fhxHqQ==
Received: from phl-compute-04.internal (phl-compute-04.internal [10.202.2.44])
	by mailfauth.phl.internal (Postfix) with ESMTP id 62201F40068;
	Thu, 22 Jan 2026 12:59:55 -0500 (EST)
Received: from phl-frontend-03 ([10.202.2.162])
  by phl-compute-04.internal (MEProxy); Thu, 22 Jan 2026 12:59:55 -0500
X-ME-Sender: <xms:m2VyaXcIYubd4xlywkDlA0x1DRJmN-3o8H88RhSw5HiP3A63Vw040Q>
    <xme:m2VyafSKvVe4AJvHPGbEk49reSDK3dl6oGY3jjR89nJgu82dbeEz5LMhxb5gADhd7
    _ou_kFcICztd3hseJgJZW6b-Qie0WJ1YpbcnCvTqmPsjBdZ1no-YTw>
X-ME-Received: <xmr:m2Vyaamp5spSRu5V2FTwctZNDu4vs1Ejpafq-Dc9RP9Oue2kdKX-K6QwDAUeBg>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugeeikedvucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefmihhrhihl
    ucfuhhhuthhsvghmrghuuceokhgrsheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtth
    gvrhhnpeeigfdvtdekveejhfehtdduueeuieekjeekvdfggfdtkeegieevjedvgeetvdeh
    gfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehkih
    hrihhllhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqudeiudduiedvieeh
    hedqvdekgeeggeejvdekqdhkrghspeepkhgvrhhnvghlrdhorhhgsehshhhuthgvmhhovh
    drnhgrmhgvpdhnsggprhgtphhtthhopeefkedpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtohepmhhutghhuhhnrdhsohhngheslhhinhhugidruggvvhdprhgtphhtthhopegrkh
    hpmheslhhinhhugidqfhhouhhnuggrthhiohhnrdhorhhgpdhrtghpthhtohepuggrvhhi
    ugeskhgvrhhnvghlrdhorhhgpdhrtghpthhtohepfihilhhlhiesihhnfhhrrgguvggrug
    drohhrghdprhgtphhtthhopehushgrmhgrrghrihhfieegvdesghhmrghilhdrtghomhdp
    rhgtphhtthhopehfvhgulhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepohhsrghlvh
    grughorhesshhushgvrdguvgdprhgtphhtthhopehrphhptheskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtohepvhgsrggskhgrsehsuhhsvgdrtgii
X-ME-Proxy: <xmx:m2VyaTr-GJw4uzn9FXbpJzttI2akIIHUxKD2JGVF_Rb2_imDh0t4gg>
    <xmx:m2VyaaaE6TLy7fzbO2l9h2xEYX5BN9WEA5bZS94-UrBhXb22t95EPw>
    <xmx:m2VyafxoxH80fwXZ_jMLwgY6U5VtgM0BOxvPVPCvoZt6X37nkVNxOA>
    <xmx:m2Vyafh1pwBQrYmk-huetlLk9RpDyqvw96VnmWj34_qEHT8aK0YAiA>
    <xmx:m2VyaXJtVBN_FBu8tF19Fw6TpJn2JEwPvypG_uCJkw-TgmKzZgDos0yd>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 22 Jan 2026 12:59:54 -0500 (EST)
Date: Thu, 22 Jan 2026 17:59:48 +0000
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
Subject: Re: [PATCHv4 07/14] mm/sparse: Check memmap alignment for
 compound_info_has_mask()
Message-ID: <aXJHI8El7QHXQuwT@thinkstation>
References: <aXIaHZ5kNFelmuJi@thinkstation>
 <554FD2AA-16B5-498B-9F79-296798194DF7@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <554FD2AA-16B5-498B-9F79-296798194DF7@linux.dev>

On Thu, Jan 22, 2026 at 10:02:24PM +0800, Muchun Song wrote:
> 
> 
> > On Jan 22, 2026, at 20:43, Kiryl Shutsemau <kas@kernel.org> wrote:
> > 
> > ﻿On Thu, Jan 22, 2026 at 07:42:47PM +0800, Muchun Song wrote:
> >> 
> >> 
> >>>> On Jan 22, 2026, at 19:33, Muchun Song <muchun.song@linux.dev> wrote:
> >>> 
> >>> 
> >>> 
> >>>> On Jan 22, 2026, at 19:28, Kiryl Shutsemau <kas@kernel.org> wrote:
> >>>> 
> >>>> On Thu, Jan 22, 2026 at 11:10:26AM +0800, Muchun Song wrote:
> >>>>> 
> >>>>> 
> >>>>>> On Jan 22, 2026, at 00:22, Kiryl Shutsemau <kas@kernel.org> wrote:
> >>>>>> 
> >>>>>> If page->compound_info encodes a mask, it is expected that memmap to be
> >>>>>> naturally aligned to the maximum folio size.
> >>>>>> 
> >>>>>> Add a warning if it is not.
> >>>>>> 
> >>>>>> A warning is sufficient as MAX_FOLIO_ORDER is very rarely used, so the
> >>>>>> kernel is still likely to be functional if this strict check fails.
> >>>>>> 
> >>>>>> Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
> >>>>>> ---
> >>>>>> include/linux/mmzone.h | 1 +
> >>>>>> mm/sparse.c            | 5 +++++
> >>>>>> 2 files changed, 6 insertions(+)
> >>>>>> 
> >>>>>> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> >>>>>> index 390ce11b3765..7e4f69b9d760 100644
> >>>>>> --- a/include/linux/mmzone.h
> >>>>>> +++ b/include/linux/mmzone.h
> >>>>>> @@ -91,6 +91,7 @@
> >>>>>> #endif
> >>>>>> 
> >>>>>> #define MAX_FOLIO_NR_PAGES (1UL << MAX_FOLIO_ORDER)
> >>>>>> +#define MAX_FOLIO_SIZE (PAGE_SIZE << MAX_FOLIO_ORDER)
> >>>>>> 
> >>>>>> enum migratetype {
> >>>>>> MIGRATE_UNMOVABLE,
> >>>>>> diff --git a/mm/sparse.c b/mm/sparse.c
> >>>>>> index 17c50a6415c2..5f41a3edcc24 100644
> >>>>>> --- a/mm/sparse.c
> >>>>>> +++ b/mm/sparse.c
> >>>>>> @@ -600,6 +600,11 @@ void __init sparse_init(void)
> >>>>>> BUILD_BUG_ON(!is_power_of_2(sizeof(struct mem_section)));
> >>>>>> memblocks_present();
> >>>>>> 
> >>>>>> +  if (compound_info_has_mask()) {
> >>>>>> +  WARN_ON(!IS_ALIGNED((unsigned long)pfn_to_page(0),
> >>>>>> +     MAX_FOLIO_SIZE / sizeof(struct page)));
> >>>>> 
> >>>>> I still have concerns about this. If certain architectures or configurations,
> >>>>> especially when KASLR is enabled, do not meet the requirements during the
> >>>>> boot stage, only specific folios larger than a certain size might end up with
> >>>>> incorrect struct page entries as the system runs. How can we detect issues
> >>>>> arising from either updating the struct page or making incorrect logical
> >>>>> judgments based on information retrieved from the struct page?
> >>>>> 
> >>>>> After all, when we see this warning, we don't know when or if a problem will
> >>>>> occur in the future. It's like a time bomb in the system, isn't it? Therefore,
> >>>>> I would like to add a warning check to the memory allocation place, for
> >>>>> example:
> >>>>> 
> >>>>> WARN_ON(!IS_ALIGNED((unsigned long)&folio->page, folio_size / sizeof(struct page)));
> >>>> 
> >>>> I don't think it is needed. Any compound page usage would trigger the
> >>>> problem. It should happen pretty early.
> >>> 
> >>> Why would you think it would be discovered early? If the alignment of struct page
> >>> can only meet the needs of 4M pages (i.e., the largest pages that buddy can
> >>> allocate), how can you be sure that there will be a similar path using CMA
> >>> early on if the system allocates through CMA in the future (after all, CMA
> >>> is used much less than buddy)?
> > 
> > True.
> > 
> >> Suppose we are more aggressive. If the alignment requirement of struct page
> >> cannot meet the needs of 2GB pages (which is an uncommon memory allocation
> >> requirement), then users might not care about such a warning message after
> >> the system boots. And if there is no allocation of pages greater than or
> >> equal to 2GB for a period of time in the future, the system will have no
> >> problems. But once some path allocates pages greater than or equal to 2GB,
> >> the system will go into chaos. And by that time, the system log may no
> >> longer have this warning message. Is that not the case?
> > 
> > It is.
> > 
> > I expect the warning to be reported early if we have configurations that
> > do not satisfy the alignment requirement even in absence of the crash.
> 
> If you’re saying the issue was only caught during
> testing, keep in mind that with KASLR enabled the
> warning is triggered at run-time; you can’t assume it
> will never appear in production.

Let's look at what architectures actually do with vmemmap.

On 64-bit machines, we want vmemmap to be naturally aligned to
accommodate 16GiB pages.

Assuming 64 byte struct page, it requires 256 MiB alignment for 4K
PAGE_SIZE, 64MiB for 16K PAGE_SIZE and 16MiB for 64K PAGE_SIZE.

Only 3 architectures support HVO (select ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP):
loongarch, riscv and x86. We should make the feature conditional to HVO
to limit exposure.

I am not sure why arm64 is not in the club.

x86 aligns vmemmap to 1G - OK.

loongarch aligns vmemmap to PMD_SIZE does not fit us with 4K and 16K
PAGE_SIZE. It should be easily fixable. No KALSR.

riscv aligns vmemmap to section size (128MiB) which is not enough.
Again, easily fixable.

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
