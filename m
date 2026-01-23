Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAAAD1B808
	for <linux-doc@vger.kernel.org>; Fri, 23 Jan 2026 12:07:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769170071; cv=none; b=XLrBFdr8IGF7lNywevG9vmakRHc9eiGIgRWq4HrgI7Cxi9An1bODBR064VQa0k05WNYXwiPUDfRC8gsgqZzeJ4Az6o9QtJVnFJTxnvcx2uPkz0mk7X9tCFBAt2iuWMk1mB4wfuRmrO510JBO+nYDO+d6wNfpJyPnnQwPAuHx0yU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769170071; c=relaxed/simple;
	bh=3H/odp/t23Ct26qULejLGL9eCx2uigeb9KE7ad9Nqds=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=NEyEhkdDiVHTDseX5EjvdRZHs7LIffvjM4OmBGVldItRySt34uHoCYzFde+SAFjtnJ+nqEWaEa4wXYMRIp25hBEqm52R/wE4MfanE2XyYECiQZl5AoI57qBa5e03moDDVxgAcPZJH+uQB3ECYpB05OGVnWu2xdoIneeg1kAdulA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=jFNNf5Pg; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="jFNNf5Pg"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1FC2CC19421;
	Fri, 23 Jan 2026 12:07:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1769170071;
	bh=3H/odp/t23Ct26qULejLGL9eCx2uigeb9KE7ad9Nqds=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jFNNf5PgBvA6BXYYEnsMhlWKfn1lJ/V12WSYZh5tcWeIyR9691i70Lb4zFCdS7TJK
	 DFBHeobW7LBixvxiNKnJ1vEgnp9X2E3t6aubncLuCcs6w/yDGfqMX90nVqlr7MPM5Q
	 FtSq1+u/fDDSup/fxBnnfJ84HYzYOcyF0yuG+Zba/M0rdjJWau+gipY+ziy4DHPC2A
	 7RzZiXUPOdXLCWFQ/ysJgdSozU3kjWnnV1MocjW4jK+oLSDGatgINWefyAYveWlbCK
	 O/YHnCArLpvgoj4xbEmmC4nvOY6AFxMTWzJuLx1GIy8q9+MrUw2nvOy3BuSerJmiyl
	 HYgQbJ1niDhqg==
Received: from phl-compute-01.internal (phl-compute-01.internal [10.202.2.41])
	by mailfauth.phl.internal (Postfix) with ESMTP id 1F11CF4006E;
	Fri, 23 Jan 2026 07:07:50 -0500 (EST)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-01.internal (MEProxy); Fri, 23 Jan 2026 07:07:50 -0500
X-ME-Sender: <xms:lmRzaVIOlB_JV0csn_DGddlprFl-djXl57SIdYFQJqaOSUXjP6yHKA>
    <xme:lmRzacjjvuTRntHvOZ7LYaNiPQXyo5qgDHhkLFNzJwguJhs4PIp4TX-K2R3xZkPq8
    JNGu0tWB0KdA1VohAH7XJUZwCtu2SnWQS6FhUW21tDvVAvSxZL1Gj5W>
X-ME-Received: <xmr:lmRzaXGy_X4xOaXiwJhA1MnRwtUtrJJrhQ-NnwmQ-qJ93uMTCcdv0HgLRMtSoQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefgedrtddtgddugeeltddtucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdfurfetoffkrfgpnffqhgenuceu
    rghilhhouhhtmecufedttdenucesvcftvggtihhpihgvnhhtshculddquddttddmnecujf
    gurhepfffhvfevuffkfhggtggugfgjsehtkeertddttdejnecuhfhrohhmpefmihhrhihl
    ucfuhhhuthhsvghmrghuuceokhgrsheskhgvrhhnvghlrdhorhhgqeenucggtffrrghtth
    gvrhhnpeeigfdvtdekveejhfehtdduueeuieekjeekvdfggfdtkeegieevjedvgeetvdeh
    gfenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehkih
    hrihhllhdomhgvshhmthhprghuthhhphgvrhhsohhnrghlihhthidqudeiudduiedvieeh
    hedqvdekgeeggeejvdekqdhkrghspeepkhgvrhhnvghlrdhorhhgsehshhhuthgvmhhovh
    drnhgrmhgvpdhnsggprhgtphhtthhopeefkedpmhhouggvpehsmhhtphhouhhtpdhrtghp
    thhtohepmhhutghhuhhnrdhsohhngheslhhinhhugidruggvvhdprhgtphhtthhopeifih
    hllhihsehinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheprghkphhmsehlihhnuhig
    qdhfohhunhgurghtihhonhdrohhrghdprhgtphhtthhopegurghvihgusehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehushgrmhgrrghrihhfieegvdesghhmrghilhdrtghomhdp
    rhgtphhtthhopehfvhgulhesghhoohhglhgvrdgtohhmpdhrtghpthhtohepohhsrghlvh
    grughorhesshhushgvrdguvgdprhgtphhtthhopehrphhptheskhgvrhhnvghlrdhorhhg
    pdhrtghpthhtohepvhgsrggskhgrsehsuhhsvgdrtgii
X-ME-Proxy: <xmx:lmRzaeLH7fGtUqXPn84rRWAxcgwO29mKn-NbPpiSQaMlJo1mfcVewg>
    <xmx:lmRzaX8S1OlDMjVb7OvvndvBr36gICH9PPOFEGUsJvmn4MmgzxHcWw>
    <xmx:lmRzaQckY-XiwGUwo4TRAopHVSj1aDco_KO8QhuvpkyYhVRHDk1NNQ>
    <xmx:lmRzaUlrKs7VAJegHzk_vokV1GqFTBj-5ntvyvrg6ot7coW1kldZ7w>
    <xmx:lmRzacGeI-3sB01QJFXGdogSAWv1rweKyFwg4C2SvUHqOTWX_NsaZzx5>
Feedback-ID: i10464835:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Fri,
 23 Jan 2026 07:07:49 -0500 (EST)
Date: Fri, 23 Jan 2026 12:07:47 +0000
From: Kiryl Shutsemau <kas@kernel.org>
To: Muchun Song <muchun.song@linux.dev>, 
	Matthew Wilcox <willy@infradead.org>
Cc: Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Usama Arif <usamaarif642@gmail.com>, 
	Frank van der Linden <fvdl@google.com>, Oscar Salvador <osalvador@suse.de>, 
	Mike Rapoport <rppt@kernel.org>, Vlastimil Babka <vbabka@suse.cz>, 
	Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Zi Yan <ziy@nvidia.com>, Baoquan He <bhe@redhat.com>, 
	Michal Hocko <mhocko@suse.com>, Johannes Weiner <hannes@cmpxchg.org>, 
	Jonathan Corbet <corbet@lwn.net>, kernel-team@meta.com, linux-mm@kvack.org, 
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCHv4 07/14] mm/sparse: Check memmap alignment for
 compound_info_has_mask()
Message-ID: <aXNkSpO0WsvPz6h4@thinkstation>
References: <aXIaHZ5kNFelmuJi@thinkstation>
 <554FD2AA-16B5-498B-9F79-296798194DF7@linux.dev>
 <aXJHI8El7QHXQuwT@thinkstation>
 <BFECEA67-90EC-444A-87A3-A220168B1B67@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <BFECEA67-90EC-444A-87A3-A220168B1B67@linux.dev>

On Fri, Jan 23, 2026 at 10:32:28AM +0800, Muchun Song wrote:
> 
> 
> > On Jan 23, 2026, at 01:59, Kiryl Shutsemau <kas@kernel.org> wrote:
> > 
> > On Thu, Jan 22, 2026 at 10:02:24PM +0800, Muchun Song wrote:
> >> 
> >> 
> >>> On Jan 22, 2026, at 20:43, Kiryl Shutsemau <kas@kernel.org> wrote:
> >>> 
> >>> ﻿On Thu, Jan 22, 2026 at 07:42:47PM +0800, Muchun Song wrote:
> >>>> 
> >>>> 
> >>>>>> On Jan 22, 2026, at 19:33, Muchun Song <muchun.song@linux.dev> wrote:
> >>>>> 
> >>>>> 
> >>>>> 
> >>>>>> On Jan 22, 2026, at 19:28, Kiryl Shutsemau <kas@kernel.org> wrote:
> >>>>>> 
> >>>>>> On Thu, Jan 22, 2026 at 11:10:26AM +0800, Muchun Song wrote:
> >>>>>>> 
> >>>>>>> 
> >>>>>>>> On Jan 22, 2026, at 00:22, Kiryl Shutsemau <kas@kernel.org> wrote:
> >>>>>>>> 
> >>>>>>>> If page->compound_info encodes a mask, it is expected that memmap to be
> >>>>>>>> naturally aligned to the maximum folio size.
> >>>>>>>> 
> >>>>>>>> Add a warning if it is not.
> >>>>>>>> 
> >>>>>>>> A warning is sufficient as MAX_FOLIO_ORDER is very rarely used, so the
> >>>>>>>> kernel is still likely to be functional if this strict check fails.
> >>>>>>>> 
> >>>>>>>> Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
> >>>>>>>> ---
> >>>>>>>> include/linux/mmzone.h | 1 +
> >>>>>>>> mm/sparse.c            | 5 +++++
> >>>>>>>> 2 files changed, 6 insertions(+)
> >>>>>>>> 
> >>>>>>>> diff --git a/include/linux/mmzone.h b/include/linux/mmzone.h
> >>>>>>>> index 390ce11b3765..7e4f69b9d760 100644
> >>>>>>>> --- a/include/linux/mmzone.h
> >>>>>>>> +++ b/include/linux/mmzone.h
> >>>>>>>> @@ -91,6 +91,7 @@
> >>>>>>>> #endif
> >>>>>>>> 
> >>>>>>>> #define MAX_FOLIO_NR_PAGES (1UL << MAX_FOLIO_ORDER)
> >>>>>>>> +#define MAX_FOLIO_SIZE (PAGE_SIZE << MAX_FOLIO_ORDER)
> >>>>>>>> 
> >>>>>>>> enum migratetype {
> >>>>>>>> MIGRATE_UNMOVABLE,
> >>>>>>>> diff --git a/mm/sparse.c b/mm/sparse.c
> >>>>>>>> index 17c50a6415c2..5f41a3edcc24 100644
> >>>>>>>> --- a/mm/sparse.c
> >>>>>>>> +++ b/mm/sparse.c
> >>>>>>>> @@ -600,6 +600,11 @@ void __init sparse_init(void)
> >>>>>>>> BUILD_BUG_ON(!is_power_of_2(sizeof(struct mem_section)));
> >>>>>>>> memblocks_present();
> >>>>>>>> 
> >>>>>>>> +  if (compound_info_has_mask()) {
> >>>>>>>> +  WARN_ON(!IS_ALIGNED((unsigned long)pfn_to_page(0),
> >>>>>>>> +     MAX_FOLIO_SIZE / sizeof(struct page)));
> >>>>>>> 
> >>>>>>> I still have concerns about this. If certain architectures or configurations,
> >>>>>>> especially when KASLR is enabled, do not meet the requirements during the
> >>>>>>> boot stage, only specific folios larger than a certain size might end up with
> >>>>>>> incorrect struct page entries as the system runs. How can we detect issues
> >>>>>>> arising from either updating the struct page or making incorrect logical
> >>>>>>> judgments based on information retrieved from the struct page?
> >>>>>>> 
> >>>>>>> After all, when we see this warning, we don't know when or if a problem will
> >>>>>>> occur in the future. It's like a time bomb in the system, isn't it? Therefore,
> >>>>>>> I would like to add a warning check to the memory allocation place, for
> >>>>>>> example:
> >>>>>>> 
> >>>>>>> WARN_ON(!IS_ALIGNED((unsigned long)&folio->page, folio_size / sizeof(struct page)));
> >>>>>> 
> >>>>>> I don't think it is needed. Any compound page usage would trigger the
> >>>>>> problem. It should happen pretty early.
> >>>>> 
> >>>>> Why would you think it would be discovered early? If the alignment of struct page
> >>>>> can only meet the needs of 4M pages (i.e., the largest pages that buddy can
> >>>>> allocate), how can you be sure that there will be a similar path using CMA
> >>>>> early on if the system allocates through CMA in the future (after all, CMA
> >>>>> is used much less than buddy)?
> >>> 
> >>> True.
> >>> 
> >>>> Suppose we are more aggressive. If the alignment requirement of struct page
> >>>> cannot meet the needs of 2GB pages (which is an uncommon memory allocation
> >>>> requirement), then users might not care about such a warning message after
> >>>> the system boots. And if there is no allocation of pages greater than or
> >>>> equal to 2GB for a period of time in the future, the system will have no
> >>>> problems. But once some path allocates pages greater than or equal to 2GB,
> >>>> the system will go into chaos. And by that time, the system log may no
> >>>> longer have this warning message. Is that not the case?
> >>> 
> >>> It is.
> >>> 
> >>> I expect the warning to be reported early if we have configurations that
> >>> do not satisfy the alignment requirement even in absence of the crash.
> >> 
> >> If you’re saying the issue was only caught during
> >> testing, keep in mind that with KASLR enabled the
> >> warning is triggered at run-time; you can’t assume it
> >> will never appear in production.
> > 
> > Let's look at what architectures actually do with vmemmap.
> > 
> > On 64-bit machines, we want vmemmap to be naturally aligned to
> > accommodate 16GiB pages.
> > 
> > Assuming 64 byte struct page, it requires 256 MiB alignment for 4K
> > PAGE_SIZE, 64MiB for 16K PAGE_SIZE and 16MiB for 64K PAGE_SIZE.
> > 
> > Only 3 architectures support HVO (select ARCH_WANT_OPTIMIZE_HUGETLB_VMEMMAP):
> > loongarch, riscv and x86. We should make the feature conditional to HVO
> > to limit exposure.
> > 
> > I am not sure why arm64 is not in the club.
> > 
> > x86 aligns vmemmap to 1G - OK.
> > 
> > loongarch aligns vmemmap to PMD_SIZE does not fit us with 4K and 16K
> > PAGE_SIZE. It should be easily fixable. No KALSR.
> > 
> > riscv aligns vmemmap to section size (128MiB) which is not enough.
> > Again, easily fixable.
> > 
> 
> OK. After we fix all problems, I think changing WARN_ON to BUG_ON is fine.

David was explicitly against the BUG_ON() in the patch.

David, is it still the case?

-- 
  Kiryl Shutsemau / Kirill A. Shutemov
