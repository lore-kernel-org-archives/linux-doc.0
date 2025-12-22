Received: from out-179.mta0.migadu.com (out-179.mta0.migadu.com [91.218.175.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5F89317BEBF
	for <linux-doc@vger.kernel.org>; Mon, 22 Dec 2025 03:21:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766373670; cv=none; b=VXP8AcOmzpHtksDl7Zh5qUjF1TjBMwWgW5chtd2DgSqOzhvUZelmg7fLDHagNqFWa+8HXOI7VUkHzVVlLetqB8s7EjYwjas5tqJNb6Dx1uHHZtl9ion8LsH58dWR/ryAYQBl42/AgbgZcmh/cDu+j2GlWcGZmRANVRGuhStv0xE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766373670; c=relaxed/simple;
	bh=I+KYC3/0uae/J/MZFStK+n85rKTzfPtpnDPJd0FNSGQ=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=i/sZWzhG79lSU1sDmfOHGw9g+oTWqF66srn5umjhfPke5GQ38PF2C/EupoUZ0kH5bk4RNKere+16xLikzQdJC/MVQv2Oj+mECzT024PIrKr/KYhEExSHZN2HkuyQl5eUE42xgr/jwOGbZSszHtIOa79NEwzefvM2uJid2ykCfag=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=ZG5NUDro; arc=none smtp.client-ip=91.218.175.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="ZG5NUDro"
Message-ID: <bde227ef-b072-4f48-ab68-bf184dfe7421@linux.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1766373659;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=mRaJGFt+vlTFGLTUwqQaBUPjdGLSPn/OwcHDbY+ZMEY=;
	b=ZG5NUDro0/i21vz+0aMvKJEzXOTRmTrUUuiMppqJ+PD6m4MsHba7KvEKL/Ozfg6IiuUwhb
	R0od14uEIdvKnltvpIO+azH49SjrarckOIEem363dARU3WeV8VX0WQOtAyRAspCmOOzA72
	0aqBgNgm7dynd63jGt/3AYGSo5nXXiM=
Date: Mon, 22 Dec 2025 11:20:48 +0800
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Subject: Re: [PATCHv2 06/14] mm: Rework compound_head() for power-of-2
 sizeof(struct page)
To: Kiryl Shutsemau <kas@kernel.org>
Cc: Oscar Salvador <osalvador@suse.de>, Mike Rapoport <rppt@kernel.org>,
 Vlastimil Babka <vbabka@suse.cz>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Zi Yan <ziy@nvidia.com>,
 Baoquan He <bhe@redhat.com>, Michal Hocko <mhocko@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>,
 kernel-team@meta.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Usama Arif <usamaarif642@gmail.com>, Frank van der Linden <fvdl@google.com>
References: <20251218150949.721480-1-kas@kernel.org>
 <20251218150949.721480-7-kas@kernel.org>
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Muchun Song <muchun.song@linux.dev>
In-Reply-To: <20251218150949.721480-7-kas@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Migadu-Flow: FLOW_OUT



On 2025/12/18 23:09, Kiryl Shutsemau wrote:
> For tail pages, the kernel uses the 'compound_info' field to get to the
> head page. The bit 0 of the field indicates whether the page is a
> tail page, and if set, the remaining bits represent a pointer to the
> head page.
>
> For cases when size of struct page is power-of-2, change the encoding of
> compound_info to store a mask that can be applied to the virtual address
> of the tail page in order to access the head page. It is possible
> because struct page of the head page is naturally aligned with regards
> to order of the page.
>
> The significant impact of this modification is that all tail pages of
> the same order will now have identical 'compound_info', regardless of
> the compound page they are associated with. This paves the way for
> eliminating fake heads.
>
> The HugeTLB Vmemmap Optimization (HVO) creates fake heads and it is only
> applied when the sizeof(struct page) is power-of-2. Having identical
> tail pages allows the same page to be mapped into the vmemmap of all
> pages, maintaining memory savings without fake heads.
>
> If sizeof(struct page) is not power-of-2, there is no functional
> changes.
>
> Signed-off-by: Kiryl Shutsemau <kas@kernel.org>

Reviewed-by: Muchun Song <muchun.song@linux.dev>

One nit bellow.

> ---
>   include/linux/page-flags.h | 62 +++++++++++++++++++++++++++++++++-----
>   mm/util.c                  | 16 +++++++---
>   2 files changed, 66 insertions(+), 12 deletions(-)
>
> diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
> index 0de7db7efb00..fac5f41b3b27 100644
> --- a/include/linux/page-flags.h
> +++ b/include/linux/page-flags.h
> @@ -210,6 +210,13 @@ static __always_inline const struct page *page_fixed_fake_head(const struct page
>   	if (!static_branch_unlikely(&hugetlb_optimize_vmemmap_key))
>   		return page;
>   
> +	/*
> +	 * Fake heads only exists if size of struct page is power-of-2.
> +	 * See hugetlb_vmemmap_optimizable_size().
> +	 */
> +	if (!is_power_of_2(sizeof(struct page)))
> +		return page;
> +
>   	/*
>   	 * Only addresses aligned with PAGE_SIZE of struct page may be fake head
>   	 * struct page. The alignment check aims to avoid access the fields (
> @@ -223,10 +230,14 @@ static __always_inline const struct page *page_fixed_fake_head(const struct page
>   		 * because the @page is a compound page composed with at least
>   		 * two contiguous pages.
>   		 */
> -		unsigned long head = READ_ONCE(page[1].compound_info);
> +		unsigned long info = READ_ONCE(page[1].compound_info);
>   
> -		if (likely(head & 1))
> -			return (const struct page *)(head - 1);
> +		/* See set_compound_head() */
> +		if (likely(info & 1)) {
> +			unsigned long p = (unsigned long)page;
> +
> +			return (const struct page *)(p & info);
> +		}
>   	}
>   	return page;
>   }
> @@ -281,11 +292,27 @@ static __always_inline int page_is_fake_head(const struct page *page)
>   
>   static __always_inline unsigned long _compound_head(const struct page *page)
>   {
> -	unsigned long head = READ_ONCE(page->compound_info);
> +	unsigned long info = READ_ONCE(page->compound_info);
>   
> -	if (unlikely(head & 1))
> -		return head - 1;
> -	return (unsigned long)page_fixed_fake_head(page);
> +	/* Bit 0 encodes PageTail() */
> +	if (!(info & 1))
> +		return (unsigned long)page_fixed_fake_head(page);
> +
> +	/*
> +	 * If the size of struct page is not power-of-2, the rest of
> +	 * compound_info is the pointer to the head page.
> +	 */
> +	if (!is_power_of_2(sizeof(struct page)))
> +		return info - 1;
> +
> +	/*
> +	 * If the size of struct page is power-of-2 the rest of the info
> +	 * encodes the mask that converts the address of the tail page to
> +	 * the head page.
> +	 *
> +	 * No need to clear bit 0 in the mask as 'page' always has it clear.
> +	 */
> +	return (unsigned long)page & info;
>   }
>   
>   #define compound_head(page)	((typeof(page))_compound_head(page))
> @@ -294,7 +321,26 @@ static __always_inline void set_compound_head(struct page *page,
>   					      const struct page *head,
>   					      unsigned int order)
>   {
> -	WRITE_ONCE(page->compound_info, (unsigned long)head + 1);
> +	unsigned int shift;
> +	unsigned long mask;
> +
> +	if (!is_power_of_2(sizeof(struct page))) {
> +		WRITE_ONCE(page->compound_info, (unsigned long)head | 1);
> +		return;
> +	}
> +
> +	/*
> +	 * If the size of struct page is power-of-2, bits [shift:0] of the
> +	 * virtual address of compound head are zero.
> +	 *
> +	 * Calculate mask that can be applied to the virtual address of
> +	 * the tail page to get address of the head page.
> +	 */
> +	shift = order + order_base_2(sizeof(struct page));

We already have a macro for order_base_2(sizeof(struct page)),
that is STRUCT_PAGE_MAX_SHIFT.

Thanks.

> +	mask = GENMASK(BITS_PER_LONG - 1, shift);
> +
> +	/* Bit 0 encodes PageTail() */
> +	WRITE_ONCE(page->compound_info, mask | 1);
>   }
>   
>   static __always_inline void clear_compound_head(struct page *page)
> diff --git a/mm/util.c b/mm/util.c
> index cbf93cf3223a..3c00f6cec3f0 100644
> --- a/mm/util.c
> +++ b/mm/util.c
> @@ -1234,7 +1234,7 @@ static void set_ps_flags(struct page_snapshot *ps, const struct folio *folio,
>    */
>   void snapshot_page(struct page_snapshot *ps, const struct page *page)
>   {
> -	unsigned long head, nr_pages = 1;
> +	unsigned long info, nr_pages = 1;
>   	struct folio *foliop;
>   	int loops = 5;
>   
> @@ -1244,8 +1244,8 @@ void snapshot_page(struct page_snapshot *ps, const struct page *page)
>   again:
>   	memset(&ps->folio_snapshot, 0, sizeof(struct folio));
>   	memcpy(&ps->page_snapshot, page, sizeof(*page));
> -	head = ps->page_snapshot.compound_info;
> -	if ((head & 1) == 0) {
> +	info = ps->page_snapshot.compound_info;
> +	if ((info & 1) == 0) {
>   		ps->idx = 0;
>   		foliop = (struct folio *)&ps->page_snapshot;
>   		if (!folio_test_large(foliop)) {
> @@ -1256,7 +1256,15 @@ void snapshot_page(struct page_snapshot *ps, const struct page *page)
>   		}
>   		foliop = (struct folio *)page;
>   	} else {
> -		foliop = (struct folio *)(head - 1);
> +		/* See compound_head() */
> +		if (is_power_of_2(sizeof(struct page))) {
> +			unsigned long p = (unsigned long)page;
> +
> +			foliop = (struct folio *)(p & info);
> +		} else {
> +			foliop = (struct folio *)(info - 1);
> +		}
> +
>   		ps->idx = folio_page_idx(foliop, page);
>   	}
>   

