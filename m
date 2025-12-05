Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A7B1E1DFC
	for <linux-doc@vger.kernel.org>; Fri,  5 Dec 2025 21:49:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764971381; cv=none; b=U4SmFX5JNCSXRclh/N/RV5uIdnxgNrNr8kibtLabMuPUiW+/29FSG+Ak1p2IbzqFR5jA7TM/KfpmCAUtm2RZ/qov1uPuf/ToknDlRXoRj+5HYJixoW0epTm31DE3i0kx0NyYYi+28Mhqyufoatur6vfaD+0tYjrmJH7lsaWZ63g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764971381; c=relaxed/simple;
	bh=SSKHFPUbeJtpAqLpVhDsokevcw3NMJ0Lh1vHJdO6cfs=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=lPARm2Og0GSSxNj7DE0maXg4rwfPJYASB2rug+mlYhJrHlXkQVkwlg95XvYXoA+DhGpAoWKWbJ6uB59VdFkUw9MLveg5Z7ymZ75se7WIR8bDHsT+skI2bERQK8hmrbkplxKEqK93xlCfMEchD+fP6nBLFWWhUzisasINF+Unx+o=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=acm4dR0Y; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="acm4dR0Y"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-47775fb6cb4so21344615e9.0
        for <linux-doc@vger.kernel.org>; Fri, 05 Dec 2025 13:49:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764971378; x=1765576178; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=vbYHxiv2k68IUzFKcDelHcanl/w9WtEHhqSwTcDSWB4=;
        b=acm4dR0YR35u5duhJKj9mbSHuwcayYULphwAl32o1/24KnbnhFHfmKzMR8yP2nQNN+
         k5vkLUYKRMYsrUhGxFKMXkvRwwXJmkauT1Pv9o1/BG9zjIv99p4dvWrCAkM5Kv0WGCHW
         ToRLuJESmDFVSgIgDp5XgPW/S3HsIFYecSCq41Wi6tclG++1B53t65ksC7IYPuU+qrm0
         /tra6y6S/q7LE7arrBAckhF+t9IZmnUU7JzG6Z1IEH+ov8RYj8hGP/11goKwrNJLPjxw
         4LUIoI90rQ7pv2L+GQ3tsQPqh3q7RRB0wmaA/BRYTc8n4hm+Z6xWOYxLnspgjnyvScP3
         mikw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764971378; x=1765576178;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=vbYHxiv2k68IUzFKcDelHcanl/w9WtEHhqSwTcDSWB4=;
        b=TcViNWDF57o5m3jXB12YxuyoATct3J3M8H+sGlda3wyIt0Ub+y201wyyA1YkYSqB1f
         kHyjHKjdUqQZj3Xq9woPyglRAAZfTJelgwRI0oI7ek4xij100+byUARH70GQ0L1EONMY
         KKg6mfDuuOUmJmVx76+mjZymgxFzbTGRFtH5nAhUdlEBJQZG0yLAHb8u5UafAJLJOJ+F
         QhBQwF9ZB/+LrZjhMM5voj7j+VfL6jFgCyLH3rbejs6+bXUE0uXzAOJbK/sEDyJ3w/H2
         5qwb0ivyHMs3+PmuP07u/G/cnsIv0pK/4wOzaFQT/8Fn0lLUz7Y0HMr29442JHuPfHwB
         zViQ==
X-Forwarded-Encrypted: i=1; AJvYcCWJ/u/PorDwnAC7ZWBaOqmnivaf8kWbtJwRjPAxfI/rrRZQbCjctj23wPhtA3uEe3ONlcLLB1hpr1o=@vger.kernel.org
X-Gm-Message-State: AOJu0YwZg3UCt+KgFffviI5Qcl76tgeTKDDNCJqC65CaoRYkc1B3c6S2
	vnu/nMcjsyg619eQWsAmPT8ue4V7TY3/LvzA5/jRv8PjDG3IEACq3cag
X-Gm-Gg: ASbGncugLwCrUoiBg9Nv07ke2JTnAcupsY8dQ3ZEpUcz1CoZow/x5dsRYG2LS1I3aZN
	0j1iEuNgBAdBCW/x0lEVM8ch4OT5C7VEbNXKb8V+grkQ7lQIEimw8uJHIRrzbDkLM7PXO3nUmcG
	ai03w49tcAdAnKjqtBWCkNzA67gR3+VIbCJZD+wccZ5+/k+juuLby7Pl7oKVEbqG+29aWgom5Fi
	4gI5udfmJdqqHgTAyn10l9sQ8zFulKMk5nnvb0CTyha/vJACc8ABouK3VfLO6qM4uwvJmGY1twJ
	w61NfxwyMvuGXjqyVsn0EIfjBdDZOHV36WyvFaAyfbIzKefWXAYf0A4i7PwzeG1G/agWuU+Wyb8
	NFSKZAx9E8ak2w3/G880f8kq7zKEbOQm7AVaAiAHqyyLSdULh0B0rg1zB76vVu8EUYkHe0yT1VN
	LhhTEZ99fDe4sz7bsoOKwdkKlgVJMhEqz0C87UAsF+NI0EafoVmquISj06wHy9WwqBnyoniWkso
	gZbSlclMAs5
X-Google-Smtp-Source: AGHT+IEAmF5Xs4UUd6p05OhlkXAzodVRvjjJJ8btSF2zz1UqgDaB1gM22axrMV2Vi20ZCyiSptlI5g==
X-Received: by 2002:a05:600c:500d:b0:475:daba:d03c with SMTP id 5b1f17b1804b1-47939df5414mr7057155e9.13.1764971377503;
        Fri, 05 Dec 2025 13:49:37 -0800 (PST)
Received: from ?IPV6:2a02:6b6f:e750:1800:450:cba3:aec3:a1fd? ([2a02:6b6f:e750:1800:450:cba3:aec3:a1fd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4792b152a68sm65715995e9.15.2025.12.05.13.49.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 05 Dec 2025 13:49:36 -0800 (PST)
Message-ID: <77d1911d-7b67-41c0-933e-b2a0810cf3b4@gmail.com>
Date: Fri, 5 Dec 2025 21:49:36 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 01/11] mm: Change the interface of prep_compound_tail()
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
 <20251205194351.1646318-2-kas@kernel.org>
Content-Language: en-GB
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <20251205194351.1646318-2-kas@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 05/12/2025 19:43, Kiryl Shutsemau wrote:
> Instead of passing down the head page and tail page index, pass the tail
> and head pages directly, as well as the order of the compound page.
> 
> This is a preparation for changing how the head position is encoded in
> the tail page.
> 
> Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
> ---
>  include/linux/page-flags.h |  4 +++-
>  mm/hugetlb.c               |  8 +++++---
>  mm/internal.h              | 11 +++++------
>  mm/mm_init.c               |  2 +-
>  mm/page_alloc.c            |  2 +-
>  5 files changed, 15 insertions(+), 12 deletions(-)
> 
> diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
> index 0091ad1986bf..2c1153dd7e0e 100644
> --- a/include/linux/page-flags.h
> +++ b/include/linux/page-flags.h
> @@ -865,7 +865,9 @@ static inline bool folio_test_large(const struct folio *folio)
>  	return folio_test_head(folio);
>  }
>  
> -static __always_inline void set_compound_head(struct page *page, struct page *head)
> +static __always_inline void set_compound_head(struct page *page,
> +					      struct page *head,
> +					      unsigned int order)

I can see that order is used later, I think patch 4, but probably this patch might cause a
build warning as order is unused? Might be good to integrate that into the later patch?

Other nit is, do we want const for head here? (Its not there before, but might be good to add).

>  {
>  	WRITE_ONCE(page->compound_head, (unsigned long)head + 1);
>  }
> diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> index 0455119716ec..a55d638975bd 100644
> --- a/mm/hugetlb.c
> +++ b/mm/hugetlb.c
> @@ -3212,6 +3212,7 @@ int __alloc_bootmem_huge_page(struct hstate *h, int nid)
>  
>  /* Initialize [start_page:end_page_number] tail struct pages of a hugepage */
>  static void __init hugetlb_folio_init_tail_vmemmap(struct folio *folio,
> +					struct hstate *h,
>  					unsigned long start_page_number,
>  					unsigned long end_page_number)
>  {
> @@ -3220,6 +3221,7 @@ static void __init hugetlb_folio_init_tail_vmemmap(struct folio *folio,
>  	struct page *page = folio_page(folio, start_page_number);
>  	unsigned long head_pfn = folio_pfn(folio);
>  	unsigned long pfn, end_pfn = head_pfn + end_page_number;
> +	unsigned int order = huge_page_order(h);
>  
>  	/*
>  	 * As we marked all tail pages with memblock_reserved_mark_noinit(),
> @@ -3227,7 +3229,7 @@ static void __init hugetlb_folio_init_tail_vmemmap(struct folio *folio,
>  	 */
>  	for (pfn = head_pfn + start_page_number; pfn < end_pfn; page++, pfn++) {
>  		__init_single_page(page, pfn, zone, nid);
> -		prep_compound_tail((struct page *)folio, pfn - head_pfn);
> +		prep_compound_tail(page, &folio->page, order);
>  		set_page_count(page, 0);
>  	}
>  }
> @@ -3247,7 +3249,7 @@ static void __init hugetlb_folio_init_vmemmap(struct folio *folio,
>  	__folio_set_head(folio);
>  	ret = folio_ref_freeze(folio, 1);
>  	VM_BUG_ON(!ret);
> -	hugetlb_folio_init_tail_vmemmap(folio, 1, nr_pages);
> +	hugetlb_folio_init_tail_vmemmap(folio, h, 1, nr_pages);
>  	prep_compound_head((struct page *)folio, huge_page_order(h));
>  }
>  
> @@ -3304,7 +3306,7 @@ static void __init prep_and_add_bootmem_folios(struct hstate *h,
>  			 * time as this is early in boot and there should
>  			 * be no contention.
>  			 */
> -			hugetlb_folio_init_tail_vmemmap(folio,
> +			hugetlb_folio_init_tail_vmemmap(folio, h,
>  					HUGETLB_VMEMMAP_RESERVE_PAGES,
>  					pages_per_huge_page(h));
>  		}
> diff --git a/mm/internal.h b/mm/internal.h
> index 1561fc2ff5b8..0355da7cb6df 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -810,13 +810,12 @@ static inline void prep_compound_head(struct page *page, unsigned int order)
>  		INIT_LIST_HEAD(&folio->_deferred_list);
>  }
>  
> -static inline void prep_compound_tail(struct page *head, int tail_idx)
> +static inline void prep_compound_tail(struct page *tail,
> +				      struct page *head, unsigned int order)
>  {
> -	struct page *p = head + tail_idx;
> -
> -	p->mapping = TAIL_MAPPING;
> -	set_compound_head(p, head);
> -	set_page_private(p, 0);
> +	tail->mapping = TAIL_MAPPING;
> +	set_compound_head(tail, head, order);
> +	set_page_private(tail, 0);
>  }
>  
>  void post_alloc_hook(struct page *page, unsigned int order, gfp_t gfp_flags);
> diff --git a/mm/mm_init.c b/mm/mm_init.c
> index 7712d887b696..87d1e0277318 100644
> --- a/mm/mm_init.c
> +++ b/mm/mm_init.c
> @@ -1102,7 +1102,7 @@ static void __ref memmap_init_compound(struct page *head,
>  		struct page *page = pfn_to_page(pfn);
>  
>  		__init_zone_device_page(page, pfn, zone_idx, nid, pgmap);
> -		prep_compound_tail(head, pfn - head_pfn);
> +		prep_compound_tail(page, head, order);
>  		set_page_count(page, 0);
>  	}
>  	prep_compound_head(head, order);
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index ed82ee55e66a..fe77c00c99df 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -717,7 +717,7 @@ void prep_compound_page(struct page *page, unsigned int order)
>  
>  	__SetPageHead(page);
>  	for (i = 1; i < nr_pages; i++)
> -		prep_compound_tail(page, i);
> +		prep_compound_tail(page + i, page, order);
>  
>  	prep_compound_head(page, order);
>  }

