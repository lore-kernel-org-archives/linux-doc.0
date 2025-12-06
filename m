Received: from mail-wm1-f52.google.com (mail-wm1-f52.google.com [209.85.128.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 33DD01662E7
	for <linux-doc@vger.kernel.org>; Sat,  6 Dec 2025 17:03:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765040610; cv=none; b=gCh+iYksn/YnSwsFqVlbRyt/lyjT+wukPAuL2uRdjZEOe7LlOwCVoAAGA+mWfgDKOFter6n8T7M5MZ+q4eBTw/RZ6ZVImu+NVxj/YSgFR2yIzidhblJZiMt7OTrKRVXGtF+wffpuTJwVvn4tUKI9iC0naPA1y30Ze9Xl+OE6g94=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765040610; c=relaxed/simple;
	bh=B8FB/WbFECE39ujimQPvUm7MP1wYn93dpipoST8LKho=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=oXAsw29x8yFRcAO1Li2QuGXxuJgHNMxiDO+vaRgnM9puQQO8crdY/uImc4KfkDdyKl5pyQ8WY9UTgubQzniTpJe5tEtgP0Ls/N37CFWl2PKYE55eqb4LpZJCTDXbOrwf6QsaQzcz8WjRPxcwRbIKdiUapCy7DV2T3s/gC1c5Smg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bNbXgAt0; arc=none smtp.client-ip=209.85.128.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bNbXgAt0"
Received: by mail-wm1-f52.google.com with SMTP id 5b1f17b1804b1-47774d3536dso30279475e9.0
        for <linux-doc@vger.kernel.org>; Sat, 06 Dec 2025 09:03:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765040607; x=1765645407; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=arB2+q94C/RtjHwnCPSWjKQlAp5irwrD1W/n4e+MZLI=;
        b=bNbXgAt0zX47m4DW0iyA4v5cmUJpp965OgnATcb/nI8oZckrh9ZYx1FBXoi592RmUP
         05A1/00LCTv73ZOMeJnZRJqkKf+wbPsLE490MpDm4t2hUmF1EXaurTwFe83cSIzEx+bu
         bCoPMNZWDJw5j1DvUBUQSSacy683RBh+k4SJIaO1R8iC+7EP3ugXU8SD4KnqeYp1e4AO
         HaeDAd8eJzPqc1Vit2kyOo8boOnDaoiT+DX07f9JuwT1N4Q3/nkHyZ8z30jzU0y5lG34
         P/ujoEdqy8YVdpTpr/eAGlJKuNrwiN+hWxMQUZ9Oz/fVMB1YV9Rlf+fzkXEk9TjK8LQP
         mZGg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765040607; x=1765645407;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=arB2+q94C/RtjHwnCPSWjKQlAp5irwrD1W/n4e+MZLI=;
        b=cWlc2PwriHwgqfAeB/MPGlb4a5xRFDxXae1uksRHZpXIhKJPMBwjVcX17/m/cBpNUt
         3cH7yqPKTm27K1i9oNpA55AaXjdyi8OxBy22nasB42IzI6aRZC5ckskA9TaRzgx7FCqY
         EINfDr4MZ0mbtFxxQhC0LZyn6gO5Apw2tf2muK7515AHhAq8a3qtSwxEN3Dk2VS80oJ8
         uGSwhDxF20tMzZE8EcSoXhqicNqBZZ1bJpiV8XLecRgxnm3E+5RwFq8f1bGcxgmWMjpa
         YmceyCRbSgLSQiRneBYq+oZpOzOsb4GlUReWTcFnXm9QpFblfTmwBpmFPx2lO5jZXVsv
         dNDA==
X-Forwarded-Encrypted: i=1; AJvYcCWPPP1nLUm3L1ztD/n6I8X5Tw9VU9+7UEhU5ZWxtz+Uiw0iEgEsAjf3vUwmt2BoFSFTYByOXLg3Tg0=@vger.kernel.org
X-Gm-Message-State: AOJu0YwnertX6b9ejNPk1bNlZ2arpVjKfc2Eu7mpxFPDunqaYqtdZ+Vw
	2cZ7nEJsiByyZv1eaBi9ngAvVZ6d+GCtZD3fkuxvug0xDh+KAb5uEJRz
X-Gm-Gg: ASbGncs5urLl0kpSrUrOy/2qi/n41zlOB1nbni8Xtnqk3KWdz6BaVmde/JHB4/nfwpA
	LD7YM3QBT01nLLs5697niZuTGE+UT+OvXz/CpRazgqd0yDrQkw33Pevthd7E9zwfi3VD7NLS5OG
	l3ddIa0TjZFLABRpKtJUXMIk5ZKUwKuVGjILnxLcnlkUqGbWWHHfN04kAtELCQnHCauOMA8KwvV
	UdWnxw2iZg+iba6EuY7058jkZygLVz/qCt4ojb6bNllw7Gae/QBQMeXTe5GmHEfDSpC7Ci5Wa8d
	IH2tWwb1MXZO8Dw94jYoK644UWxvOMEiIqqdS5ukhWKPyPWzxy+J2c3VrHiBv47oh8wRGIKICm7
	XEKHMwXWor/xq4JA/wYq9KMChRVtFCZzShVRF3rEhd0dOabVxgpZirUzkdb5xiHUC+D/s5qftrS
	N0bX90oKaX1h8L1eCd2N6Z25EFrhYiMtO2/89XV9dU9/qlwcwWspjd4K6y8yBMcFzrkt9Tg/TRI
	i8hVYcDRHeM
X-Google-Smtp-Source: AGHT+IFxBQAvElMtsjBtc/pCHGLPoVK2DXxycN7rAshm0uLF2efeabEBubsprobpgBgCpVi5MMqong==
X-Received: by 2002:a05:600c:46c6:b0:477:7588:c8cc with SMTP id 5b1f17b1804b1-4792eb19ee1mr114517705e9.7.1765040607347;
        Sat, 06 Dec 2025 09:03:27 -0800 (PST)
Received: from ?IPV6:2a02:6b6f:e750:1800:450:cba3:aec3:a1fd? ([2a02:6b6f:e750:1800:450:cba3:aec3:a1fd])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4792b17588asm84544545e9.17.2025.12.06.09.03.26
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Dec 2025 09:03:26 -0800 (PST)
Message-ID: <db4538c3-84f8-4fb4-8307-b4fcf46ebe38@gmail.com>
Date: Sat, 6 Dec 2025 17:03:25 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 06/11] mm/hugetlb: Remove fake head pages
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
 <20251205194351.1646318-7-kas@kernel.org>
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <20251205194351.1646318-7-kas@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 05/12/2025 19:43, Kiryl Shutsemau wrote:
> HugeTLB optimizes vmemmap memory usage by freeing all but the first page
> of vmemmap memory for the huge page and remapping the rest of the pages
> to the first one.
> 
> This only occurs if the size of the struct page is a power of 2. In
> these instances, the compound head position encoding in the tail pages
> ensures that all tail pages of the same order are identical, regardless
> of the page to which they belong.
> 
> This allows for the elimination of fake head pages without significant
> memory overhead: a page full of tail struct pages is allocated per
> hstate and mapped instead of the page with the head page for all pages
> of the given hstate.
> 
> Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
> ---
>  include/linux/hugetlb.h |  3 +++
>  mm/hugetlb_vmemmap.c    | 31 +++++++++++++++++++++++++++----
>  mm/hugetlb_vmemmap.h    |  4 ++--
>  3 files changed, 32 insertions(+), 6 deletions(-)
> 
> diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
> index 8e63e46b8e1f..75dd940fda22 100644
> --- a/include/linux/hugetlb.h
> +++ b/include/linux/hugetlb.h
> @@ -676,6 +676,9 @@ struct hstate {
>  	unsigned int free_huge_pages_node[MAX_NUMNODES];
>  	unsigned int surplus_huge_pages_node[MAX_NUMNODES];
>  	char name[HSTATE_NAME_LEN];
> +#ifdef CONFIG_HUGETLB_PAGE_OPTIMIZE_VMEMMAP
> +	struct page *vmemmap_tail;
> +#endif
>  };
>  
>  struct cma;
> diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
> index f5ee499b8563..2543bdbcae20 100644
> --- a/mm/hugetlb_vmemmap.c
> +++ b/mm/hugetlb_vmemmap.c
> @@ -18,6 +18,7 @@
>  #include <asm/pgalloc.h>
>  #include <asm/tlbflush.h>
>  #include "hugetlb_vmemmap.h"
> +#include "internal.h"
>  
>  /**
>   * struct vmemmap_remap_walk - walk vmemmap page table
> @@ -518,7 +519,24 @@ static bool vmemmap_should_optimize_folio(const struct hstate *h, struct folio *
>  	return true;
>  }
>  
> -static int __hugetlb_vmemmap_optimize_folio(const struct hstate *h,
> +static void hugetlb_vmemmap_tail_alloc(struct hstate *h)
> +{
> +	struct page *p;
> +
> +	if (h->vmemmap_tail)
> +		return;
> +

The above check is unnecessary as we already check for !h->vmemmap_tail in __hugetlb_vmemmap_optimize_folio?

Is it possible that we could have a race here? Where 2 threads both trying to allocate a hugetlb page when none
exist in the system, both see h->vmemmap_tail == NULL, both call alloc_page and set h->vmemmap_tail?

Also, is there a good point where we can see that the number of hstate->nr_huge_pages has gone down to 0 and free
h->vmemmap_tail? Its a single page per hstate so not a big deal, but would be nice to have cleanup for it?

> +	h->vmemmap_tail = alloc_page(GFP_KERNEL | __GFP_ZERO);
> +	if (!h->vmemmap_tail)
> +		return;
> +
> +	p = page_to_virt(h->vmemmap_tail);
> +
> +	for (int i = 0; i < PAGE_SIZE / sizeof(struct page); i++)
> +		prep_compound_tail(p + i, p, huge_page_order(h));
> +}
> +
> +static int __hugetlb_vmemmap_optimize_folio(struct hstate *h,
>  					    struct folio *folio,
>  					    struct list_head *vmemmap_pages,
>  					    unsigned long flags)
> @@ -533,6 +551,11 @@ static int __hugetlb_vmemmap_optimize_folio(const struct hstate *h,
>  	if (!vmemmap_should_optimize_folio(h, folio))
>  		return ret;
>  
> +	if (!h->vmemmap_tail)
> +		hugetlb_vmemmap_tail_alloc(h);
> +	if (!h->vmemmap_tail)
> +		return -ENOMEM;
> +
>  	static_branch_inc(&hugetlb_optimize_vmemmap_key);
>  
>  	if (flags & VMEMMAP_SYNCHRONIZE_RCU)
> @@ -562,7 +585,7 @@ static int __hugetlb_vmemmap_optimize_folio(const struct hstate *h,
>  	list_add(&vmemmap_head->lru, vmemmap_pages);
>  	memmap_pages_add(1);
>  
> -	vmemmap_tail	= vmemmap_head;
> +	vmemmap_tail	= h->vmemmap_tail;
>  	vmemmap_start	= (unsigned long)folio;
>  	vmemmap_end	= vmemmap_start + hugetlb_vmemmap_size(h);
>  
> @@ -594,7 +617,7 @@ static int __hugetlb_vmemmap_optimize_folio(const struct hstate *h,
>   * can use folio_test_hugetlb_vmemmap_optimized(@folio) to detect if @folio's
>   * vmemmap pages have been optimized.
>   */
> -void hugetlb_vmemmap_optimize_folio(const struct hstate *h, struct folio *folio)
> +void hugetlb_vmemmap_optimize_folio(struct hstate *h, struct folio *folio)
>  {
>  	LIST_HEAD(vmemmap_pages);
>  
> @@ -868,7 +891,7 @@ static const struct ctl_table hugetlb_vmemmap_sysctls[] = {
>  
>  static int __init hugetlb_vmemmap_init(void)
>  {
> -	const struct hstate *h;
> +	struct hstate *h;
>  
>  	/* HUGETLB_VMEMMAP_RESERVE_SIZE should cover all used struct pages */
>  	BUILD_BUG_ON(__NR_USED_SUBPAGE > HUGETLB_VMEMMAP_RESERVE_PAGES);
> diff --git a/mm/hugetlb_vmemmap.h b/mm/hugetlb_vmemmap.h
> index 18b490825215..f44e40c44a21 100644
> --- a/mm/hugetlb_vmemmap.h
> +++ b/mm/hugetlb_vmemmap.h
> @@ -24,7 +24,7 @@ int hugetlb_vmemmap_restore_folio(const struct hstate *h, struct folio *folio);
>  long hugetlb_vmemmap_restore_folios(const struct hstate *h,
>  					struct list_head *folio_list,
>  					struct list_head *non_hvo_folios);
> -void hugetlb_vmemmap_optimize_folio(const struct hstate *h, struct folio *folio);
> +void hugetlb_vmemmap_optimize_folio(struct hstate *h, struct folio *folio);
>  void hugetlb_vmemmap_optimize_folios(struct hstate *h, struct list_head *folio_list);
>  void hugetlb_vmemmap_optimize_bootmem_folios(struct hstate *h, struct list_head *folio_list);
>  #ifdef CONFIG_SPARSEMEM_VMEMMAP_PREINIT
> @@ -64,7 +64,7 @@ static inline long hugetlb_vmemmap_restore_folios(const struct hstate *h,
>  	return 0;
>  }
>  
> -static inline void hugetlb_vmemmap_optimize_folio(const struct hstate *h, struct folio *folio)
> +static inline void hugetlb_vmemmap_optimize_folio(struct hstate *h, struct folio *folio)
>  {
>  }
>  

