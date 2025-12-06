Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 014E5320A29
	for <linux-doc@vger.kernel.org>; Sat,  6 Dec 2025 00:25:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764980718; cv=none; b=WD5j4dAgcd2/0cdlEkUnh02I7D9FTWfNNXsaPu0EuIMUzXTkZhUqkotq1WV9JXwsVh0TZh+QboyRgXzn1z8AvBTxCz5jap8dOgh7Jezn5PhBdtCtv08flT9eyOrTdCTuPlWtwYkTzVwnTI66uU7aMQCy29r8OGNZWbg/u7BolCs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764980718; c=relaxed/simple;
	bh=C9BpUY8Z1WtPYUb6F/WX8Z/jlnJrwMwkcOBbQOMHrvI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=Slr1QpcBz2Qph4ouOaBS75/vTB6RrwtqGS0oxM1WnJZinkeArIhGFY1U3+zd0rQrZCwWyjZxyNjXjAXFoJbXPlraBXqIv2V9DusB4+ZOWgT3gSP+N+MnVxz7UWjt8XJvDliUQVSIiLNXivbRxHz/qiJT2FE2GQ41M6NlLbnpPlE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Ic7fO696; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Ic7fO696"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-47778b23f64so17046915e9.0
        for <linux-doc@vger.kernel.org>; Fri, 05 Dec 2025 16:25:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764980715; x=1765585515; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Are7xGB9aLuDwLpzYAyGdd0D/mGvP/om3sIgmOgR1cQ=;
        b=Ic7fO696tIiHNTWhxrySiklA8kVOD1Dz77jLKSWAxAliaofWIsAz1KIOXndB1QeC6I
         9tgWhH7ZL8xoyici5C++2+U1IPyj8fNOQeZ80YSl1nERljpqzP6XwwKqta/hltT32aOE
         zUiWd4MC34UVeeao/+kN40KpL28ndM3D0YbQcxd8sKnL63ByiWs02TLZKFcahpbNL7Tk
         iW2yWzswsyf+Y7rH2m4QKhG79sIgYEggNN9lcS/6/zov1yHf2OyG1uvxHQy5NjaBVNlH
         NskKGwHIvWX+FcOlYhcJkjroNxP4czOV53sprMx2dq1fsCQYAs2WB9tsKrZ9ZYcdmOYi
         uWUg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764980715; x=1765585515;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Are7xGB9aLuDwLpzYAyGdd0D/mGvP/om3sIgmOgR1cQ=;
        b=jNo1lRFuUisMQPLZp0GIDgD1IM099K6Z4bKBVYqwGOv4IvKyha5mEDsv1SgmUGAaVm
         3OtKkzbOg0WHmQ9ajs1LIY9a9Sjw4Y8pZ4zd/AyjT9ZTFEge27ZWsVZNXUVQ9YhrvnQh
         GdVC2WquZdnBdK33ZwyvkSGusMIKvkqInlxaNF2nphIcGhvI0vqJBcrhYmJ1vvPQ36Wz
         1tmCuL/+bktH1O2zbV6EStinV4EhFiVuqNWr8b7eEyt/XvWP0o9ZzfnYRU9DGTh8oxC6
         IXW5K5lz/Tn4mI12k0swktCGrGktefEW1Y2/xgkbGO2W23cPe1OodeDwf8Onpmk4zx2Y
         vwrQ==
X-Forwarded-Encrypted: i=1; AJvYcCWi9/098hoaSVIO/VwbNPLBpBNod7jry2HHWosJc32t4zlepDoksz7kEe2l4gYfwRrEh7VkPm9//ew=@vger.kernel.org
X-Gm-Message-State: AOJu0YyA22PWAKcwkBtFATcI7Qdb8g+21jF9pbeR0/akjIOLx1o+Ifj+
	+/1CW61Bi6QlmfF8OGFPd/WNpj982a+mIvpycyG5EOj1U1bjlBRBn5kt
X-Gm-Gg: ASbGncvQVdcktXUkLneUA6ZXHoZuJKfLh1Kj71Jmvx/NtTuoturFsahoxCCtfun6FBJ
	hs/7W5+ky1uF9MFT0f11flrRx91T4aLK7vUGK5yRRr3UfMkhtm3+i/QQjya8mLNmZMtCGjMIOSP
	kzO43HknlxxLhlIwd6aI36NIJbmC5rPc61qVGwQWRV5HLbHsxeDA+Fs1rNsqIbSlYS8lMrC944Y
	TSB41eSjSCj4uoeYSCNMKD9ASlxJxHTSGi/oEbrPGbM+3SxPGXkFzG2qv0isKe1iiPVbh2hW50V
	/TmFt8hlLTddEzo09RvHcdlxU93HH/RqnongeFHeMSzLLOEUmPTJAefbFT9797cVI/Xvidur4z9
	eigce8ycNAN7f5Vm0/8AjitX5YyIPhpa2z8NXibEwBs0IMlXLePrisBwxyL5g8puA7pCJd47/cw
	VTF38qnaWNrCNKvSjk3saYqHNaUySxOU7w4Jc3iCCg9RVb8w0Sz6ZyPQX6oEufbJ4rmUuUi1ZOD
	KwGNFU/IVNF
X-Google-Smtp-Source: AGHT+IEG5z5OFfCqSs3UOWXKpnum9NIRAHoICjCwbIml/RX8FyOQJmvNmQOOCV6GaGDvNVOUizI/ow==
X-Received: by 2002:a05:600c:4f15:b0:477:214f:bd95 with SMTP id 5b1f17b1804b1-47939e3a6dcmr8652175e9.23.1764980714999;
        Fri, 05 Dec 2025 16:25:14 -0800 (PST)
Received: from ?IPV6:2a02:6b6f:e750:1800:450:cba3:aec3:a1fd? ([2a02:6b6f:e750:1800:450:cba3:aec3:a1fd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4792b0d5e55sm112555095e9.2.2025.12.05.16.25.12
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 16:25:14 -0800 (PST)
Message-ID: <22609798-e84b-46ca-9cb5-649ffba4a2a4@gmail.com>
Date: Sat, 6 Dec 2025 00:25:12 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 04/11] mm: Rework compound_head() for power-of-2
 sizeof(struct page)
Content-Language: en-GB
To: Kiryl Shutsemau <kas@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Muchun Song <muchun.song@linux.dev>
Cc: David Hildenbrand <david@kernel.org>, Oscar Salvador <osalvador@suse.de>,
 Mike Rapoport <rppt@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Matthew Wilcox <willy@infradead.org>, Zi Yan <ziy@nvidia.com>,
 Baoquan He <bhe@redhat.com>, Michal Hocko <mhocko@suse.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Jonathan Corbet <corbet@lwn.net>,
 kernel-team@meta.com, linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org
References: <20251205194351.1646318-1-kas@kernel.org>
 <20251205194351.1646318-5-kas@kernel.org>
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <20251205194351.1646318-5-kas@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 05/12/2025 19:43, Kiryl Shutsemau wrote:
> For tail pages, the kernel uses the 'compound_info' field to get to the
> head page. The bit 0 of the field indicates whether the page is a
> tail page, and if set, the remaining bits represent a pointer to the
> head page.
> 
> For cases when size of struct page is power-of-2, change the encoding of
> compound_info to store a mask that can be applied to the virtual address
> of the tail page in order to access the head page. It is possible
> because sturct page of the head page is naturally aligned with regards

nit: s/sturct/struct/

> to order of the page.

Might be good to add to state here that no change expected if the struct page
is not a power of 2.

> 
> The significant impact of this modification is that all tail pages of
> the same order will now have identical 'compound_info', regardless of
> the compound page they are associated with. This paves the way for
> eliminating fake heads.
> 
> Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
> ---
>  include/linux/page-flags.h | 61 +++++++++++++++++++++++++++++++++-----
>  mm/util.c                  | 15 +++++++---
>  2 files changed, 64 insertions(+), 12 deletions(-)
> 
> diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
> index 11d9499e5ced..eef02fbbb40f 100644
> --- a/include/linux/page-flags.h
> +++ b/include/linux/page-flags.h
> @@ -210,6 +210,13 @@ static __always_inline const struct page *page_fixed_fake_head(const struct page
>  	if (!static_branch_unlikely(&hugetlb_optimize_vmemmap_key))
>  		return page;
>  
> +	/*
> +	 * Fake heads only exists if size of struct page is power-of-2.
> +	 * See hugetlb_vmemmap_optimizable_size().
> +	 */
> +	if (!is_power_of_2(sizeof(struct page)))
> +		return page;
> +


hmm my understanding reviewing up until this patch of the series is that everything works
the same as old code when struct page is not a power of 2. Returning page here means you dont
fix page head when sizeof(struct page) is not a power of 2?

>  	/*
>  	 * Only addresses aligned with PAGE_SIZE of struct page may be fake head
>  	 * struct page. The alignment check aims to avoid access the fields (
> @@ -223,10 +230,13 @@ static __always_inline const struct page *page_fixed_fake_head(const struct page
>  		 * because the @page is a compound page composed with at least
>  		 * two contiguous pages.
>  		 */
> -		unsigned long head = READ_ONCE(page[1].compound_info);
> +		unsigned long info = READ_ONCE(page[1].compound_info);
>  
> -		if (likely(head & 1))
> -			return (const struct page *)(head - 1);
> +		if (likely(info & 1)) {
> +			unsigned long p = (unsigned long)page;
> +
> +			return (const struct page *)(p & info);

Would it be worth writing a comment over here similar to what you have in set_compound_head
to explain why this works? i.e. compound_info contains the mask derived from folio order that
can be applied to the virtual address to get the head page.

Also, it takes a few minutes to wrap your head around the fact that this works because the struct
page of the head page is aligned wrt to the order. Maybe it might be good to add that somewhere as
a comment somewhere? I dont see it documented in this patch, if its in a future patch, please ignore
this comment. 

> +		}
>  	}
>  	return page;
>  }
> @@ -281,11 +291,27 @@ static __always_inline int page_is_fake_head(const struct page *page)
>  
>  static __always_inline unsigned long _compound_head(const struct page *page)
>  {
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
> +	 * If the size of struct page is not power-of-2, the rest if

nit: s/if/of

> +	 * compound_info is the pointer to the head page.
> +	 */
> +	if (!is_power_of_2(sizeof(struct page)))
> +		return info - 1;
> +
> +	/*
> +	 * If the size of struct page is power-of-2 it is set the rest of

nit: remove "it is set"

> +	 * the info encodes the mask that converts the address of the tail
> +	 * page to the head page.
> +	 *
> +	 * No need to clear bit 0 in the mask as 'page' always has it clear.
> +	 */
> +	return (unsigned long)page & info;
>  }
>  
>  #define compound_head(page)	((typeof(page))_compound_head(page))
> @@ -294,7 +320,26 @@ static __always_inline void set_compound_head(struct page *page,
>  					      struct page *head,
>  					      unsigned int order)
>  {
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
> +	 * Calculate mask that can be applied the virtual address of the

nit: applied to the ..

> +	 * tail page to get address of the head page.
> +	 */
> +	shift = order + order_base_2(sizeof(struct page));
> +	mask = GENMASK(BITS_PER_LONG - 1, shift);
> +
> +	/* Bit 0 encodes PageTail() */
> +	WRITE_ONCE(page->compound_info, mask | 1);
>  }
>  
>  static __always_inline void clear_compound_head(struct page *page)
> diff --git a/mm/util.c b/mm/util.c
> index cbf93cf3223a..6723d2bb7f1e 100644
> --- a/mm/util.c
> +++ b/mm/util.c
> @@ -1234,7 +1234,7 @@ static void set_ps_flags(struct page_snapshot *ps, const struct folio *folio,
>   */
>  void snapshot_page(struct page_snapshot *ps, const struct page *page)
>  {
> -	unsigned long head, nr_pages = 1;
> +	unsigned long info, nr_pages = 1;
>  	struct folio *foliop;
>  	int loops = 5;
>  
> @@ -1244,8 +1244,8 @@ void snapshot_page(struct page_snapshot *ps, const struct page *page)
>  again:
>  	memset(&ps->folio_snapshot, 0, sizeof(struct folio));
>  	memcpy(&ps->page_snapshot, page, sizeof(*page));
> -	head = ps->page_snapshot.compound_info;
> -	if ((head & 1) == 0) {
> +	info = ps->page_snapshot.compound_info;
> +	if ((info & 1) == 0) {
>  		ps->idx = 0;
>  		foliop = (struct folio *)&ps->page_snapshot;
>  		if (!folio_test_large(foliop)) {
> @@ -1256,7 +1256,14 @@ void snapshot_page(struct page_snapshot *ps, const struct page *page)
>  		}
>  		foliop = (struct folio *)page;
>  	} else {
> -		foliop = (struct folio *)(head - 1);
> +		unsigned long p = (unsigned long)page;
> +
> +		/* See compound_head() */
> +		if (is_power_of_2(sizeof(struct page)))
> +			foliop = (struct folio *)(p & info);
> +		else
> +			foliop = (struct folio *)(info - 1);
> +

Would it be better to do below, as you dont need to than declare p if sizeof(struct page) is not
a power of 2?

if (!is_power_of_2(sizeof(struct page)))
	foliop = (struct folio *)(info - 1);
else {
	unsigned long p = (unsigned long)page;
	foliop = (struct folio *)(p & info);
}
	
>  		ps->idx = folio_page_idx(foliop, page);
>  	}
>  

