Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com [209.85.218.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73B471922F5
	for <linux-doc@vger.kernel.org>; Sat,  6 Dec 2025 16:42:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765039356; cv=none; b=F5g/3IZged8JOyrdsiMMUrSYStkbezaqq109r2hekT3p/cIitX0cKp5oOnnvsgyjimA2/AKyMem06aTycwBoDGCeODeJ4HiN0M8MXY9GjRWAH5SjI0w45mYLoFXdVsYFSaW8sq8H2iT0Mix/CR0kt0/jHS04HuVkfkwAytfbb14=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765039356; c=relaxed/simple;
	bh=cW0U6YFXi8NbXjsXDUGEuqJH+uAsyXMX9RiV42iu9CA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JiwVDi5g6jUPboq+ujMhsLXWlsbmNQ3nDiFFyDwQQYuGTn9tiwdHBLg0Ug+s278jCo0MJ1KIiK5kUT+37WpgymOEzi0buggYw7Y0qKYrLS8Ujs5CKwHQg3LQxgasebAnYFIDisBEBMQhQM3t9BZEi9+olaKsVRQ43g3SXEsxJlA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KyCbGc/k; arc=none smtp.client-ip=209.85.218.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KyCbGc/k"
Received: by mail-ej1-f43.google.com with SMTP id a640c23a62f3a-b73875aa527so447852566b.3
        for <linux-doc@vger.kernel.org>; Sat, 06 Dec 2025 08:42:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765039353; x=1765644153; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=IUVnhRgN/Rg7m5EOLZSinAiBqoc/zaIUE34tSehSniQ=;
        b=KyCbGc/kjyongbxw7RPM3ugv8uVUx2yIpDwRFphpHwzCGa5jmxLBG+7hFdduRI/Qj1
         PxHvQwcoZEP+6PYJ8LWOunIdM4aoNBV2MOMztKPTG/M/ILqyF7EhdifURnNIkECpY9cN
         t3aTchtOzpIiQu1nEEfVdYna9pbkSrIleyivvxevVFtDO9aPUaohouqyPUuuIe9zzf1m
         t5IY8iroonuWvVOfigVDsKmvTs4JF5Gbx6ljsXKvA+uSJuLBmcJPl7Nk07kKUc1DboG8
         FF0gIX9wklU1nkMR8y1frgLvvJCibIY4v9oKwvsB5tLoMably5GYwOk5cbMGXatU36MT
         inPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765039353; x=1765644153;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IUVnhRgN/Rg7m5EOLZSinAiBqoc/zaIUE34tSehSniQ=;
        b=fF3q0Ygjr2Kj9BuZjhvL0M1JDthjSfqoBFXAYRFeixl9y/YTJPZkchZmXK3gscsSZK
         P+g98VMQtZT7w1oS0moE2EK33h9LH+PKpOBmp+4gMjETpoMDmvv5T6l3nV1rXMFGtyz2
         nAUO9CMfWN0am3uYnjeAFBR4nplpkbhR+Goaw2aGEWhwj5+MJYvAv+G0iMtvGODDCvZx
         hvrQ/69GKTZNZwf35G9BZqL94dDPbOJinWbiRemsnCoB+lZjbVfbeMUqQtnRWcf+G1AD
         +EgEuBT6//2Kb/Vtj6J6GZLRMIF5+yXIJWpnFNPUC1ULB8wzvaO6zqJgybVXNPooA3rL
         u7kA==
X-Forwarded-Encrypted: i=1; AJvYcCVLCaQkeRegpPI7d34mN0Fl/7I/L/VZH0jvurn/xhTrG0BU0Blc7TwTtpnzAw9dwI/VShbVFCBRz2M=@vger.kernel.org
X-Gm-Message-State: AOJu0Yztq1UYFrJ7phCn3CDhw7PfiHL5CERlQTxoZgZDier5kveV++lo
	D3/ISdhesIHMC6D4+jy0Exd/mJ9sy+oeFXqs9vJGRuXzDeEqCMlDuPAj
X-Gm-Gg: ASbGncvqK3YD7VR+1ScjsHEXBBbGi2jvtfMzZhfHI/H5J3fqc64ExiecuSuWuGcLVM0
	5o5NquSzH0sIeXNQ4cjnqx48Ba49YOfjJ8Y0kbHtsBwG2UDD1JtytWb7bRTdr4SGvS+adz/TPmJ
	UQ9PdI1E3AXYw8YSYOcRSVWC7cMFU6KIY1f9pvKPusK9sTusrMKoWD/jC+RKrt1MTQO3GS0wHXL
	ppLFgDyIY5Bs/r0wAWjhiW63n4X/bysWzPQx9eo5hkWhT9VKsODCmU19458nXcJJLgQIzNlyPWR
	06hQWQLbIZK+Bvn235MrQXh7DWZ/M2OF4i7B2BTnWnZnqmWfOjsLFdYDN3jpf+kxgwzSam0bbIS
	dorQqlVIpjpPaPrF+CSfmMfvAe87Q7VQDSKAFAyZLAqst3kLoDMNbu1s9DxSSRdqvHlfYdtWCGv
	xGSA6IdQ2JKzfXVapQeJIVy/8q6ecZVQJYKLMTVKfYJVxokcIffPUX147ifq64mToZq1zmv6XUC
	NomY/n9H99z
X-Google-Smtp-Source: AGHT+IE+8Gk2g1muHy19wVmTqRZP+AXJSE6d+Qfl6STvjWPSPB4wFTbRv3maDzo8Xp0GtaUHkINJeA==
X-Received: by 2002:a17:907:da1:b0:b7a:1b3:5e52 with SMTP id a640c23a62f3a-b7a242bf4b2mr295821366b.17.1765039352297;
        Sat, 06 Dec 2025 08:42:32 -0800 (PST)
Received: from ?IPV6:2a02:6b6f:e750:1800:450:cba3:aec3:a1fd? ([2a02:6b6f:e750:1800:450:cba3:aec3:a1fd])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-b7a01a33399sm474489566b.58.2025.12.06.08.42.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 06 Dec 2025 08:42:31 -0800 (PST)
Message-ID: <3ed10ea4-347f-4d01-82aa-1d92d2804ced@gmail.com>
Date: Sat, 6 Dec 2025 16:42:30 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 05/11] mm/hugetlb: Refactor code around vmemmap_walk
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
 <20251205194351.1646318-6-kas@kernel.org>
From: Usama Arif <usamaarif642@gmail.com>
In-Reply-To: <20251205194351.1646318-6-kas@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 05/12/2025 19:43, Kiryl Shutsemau wrote:
> To prepare for removing fake head pages, the vmemmap_walk code is being reworked.
> 
> The reuse_page and reuse_addr variables are being eliminated. There will
> no longer be an expectation regarding the reuse address in relation to
> the operated range. Instead, the caller will provide head and tail
> vmemmap pages, along with the vmemmap_start address where the head page
> is located.
> 
> Currently, vmemmap_head and vmemmap_tail are set to the same page, but
> this will change in the future.
> 
> The only functional change is that __hugetlb_vmemmap_optimize_folio()
> will abandon optimization if memory allocation fails.
> 
> Signed-off-by: Kiryl Shutsemau <kas@kernel.org>
> ---
>  mm/hugetlb_vmemmap.c | 184 ++++++++++++++++++-------------------------
>  1 file changed, 77 insertions(+), 107 deletions(-)
> 
> diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
> index ba0fb1b6a5a8..f5ee499b8563 100644
> --- a/mm/hugetlb_vmemmap.c
> +++ b/mm/hugetlb_vmemmap.c
> @@ -24,8 +24,9 @@
>   *
>   * @remap_pte:		called for each lowest-level entry (PTE).
>   * @nr_walked:		the number of walked pte.
> - * @reuse_page:		the page which is reused for the tail vmemmap pages.
> - * @reuse_addr:		the virtual address of the @reuse_page page.
> + * @vmemmap_start:	the start of vmemmap range, where head page is located
> + * @vmemmap_head:	the page to be installed as first in the vmemmap range
> + * @vmemmap_tail:	the page to be installed as non-first in the vmemmap range
>   * @vmemmap_pages:	the list head of the vmemmap pages that can be freed
>   *			or is mapped from.
>   * @flags:		used to modify behavior in vmemmap page table walking
> @@ -34,11 +35,14 @@
>  struct vmemmap_remap_walk {
>  	void			(*remap_pte)(pte_t *pte, unsigned long addr,
>  					     struct vmemmap_remap_walk *walk);
> +
>  	unsigned long		nr_walked;
> -	struct page		*reuse_page;
> -	unsigned long		reuse_addr;
> +	unsigned long		vmemmap_start;
> +	struct page		*vmemmap_head;
> +	struct page		*vmemmap_tail;
>  	struct list_head	*vmemmap_pages;
>  
> +
>  /* Skip the TLB flush when we split the PMD */
>  #define VMEMMAP_SPLIT_NO_TLB_FLUSH	BIT(0)
>  /* Skip the TLB flush when we remap the PTE */
> @@ -140,14 +144,7 @@ static int vmemmap_pte_entry(pte_t *pte, unsigned long addr,
>  {
>  	struct vmemmap_remap_walk *vmemmap_walk = walk->private;
>  
> -	/*
> -	 * The reuse_page is found 'first' in page table walking before
> -	 * starting remapping.
> -	 */
> -	if (!vmemmap_walk->reuse_page)
> -		vmemmap_walk->reuse_page = pte_page(ptep_get(pte));
> -	else
> -		vmemmap_walk->remap_pte(pte, addr, vmemmap_walk);
> +	vmemmap_walk->remap_pte(pte, addr, vmemmap_walk);
>  	vmemmap_walk->nr_walked++;
>  
>  	return 0;
> @@ -207,18 +204,12 @@ static void free_vmemmap_page_list(struct list_head *list)
>  static void vmemmap_remap_pte(pte_t *pte, unsigned long addr,
>  			      struct vmemmap_remap_walk *walk)
>  {
> -	/*
> -	 * Remap the tail pages as read-only to catch illegal write operation
> -	 * to the tail pages.
> -	 */
> -	pgprot_t pgprot = PAGE_KERNEL_RO;
>  	struct page *page = pte_page(ptep_get(pte));
>  	pte_t entry;
>  
>  	/* Remapping the head page requires r/w */
> -	if (unlikely(addr == walk->reuse_addr)) {
> -		pgprot = PAGE_KERNEL;
> -		list_del(&walk->reuse_page->lru);
> +	if (unlikely(addr == walk->vmemmap_start)) {
> +		list_del(&walk->vmemmap_head->lru);
>  
>  		/*
>  		 * Makes sure that preceding stores to the page contents from
> @@ -226,9 +217,16 @@ static void vmemmap_remap_pte(pte_t *pte, unsigned long addr,
>  		 * write.
>  		 */
>  		smp_wmb();
> +
> +		entry = mk_pte(walk->vmemmap_head, PAGE_KERNEL);
> +	} else {
> +		/*
> +		 * Remap the tail pages as read-only to catch illegal write
> +		 * operation to the tail pages.
> +		 */
> +		entry = mk_pte(walk->vmemmap_tail, PAGE_KERNEL_RO);
>  	}
>  
> -	entry = mk_pte(walk->reuse_page, pgprot);
>  	list_add(&page->lru, walk->vmemmap_pages);
>  	set_pte_at(&init_mm, addr, pte, entry);
>  }
> @@ -255,16 +253,13 @@ static inline void reset_struct_pages(struct page *start)
>  static void vmemmap_restore_pte(pte_t *pte, unsigned long addr,
>  				struct vmemmap_remap_walk *walk)
>  {
> -	pgprot_t pgprot = PAGE_KERNEL;
>  	struct page *page;
>  	void *to;
>  
> -	BUG_ON(pte_page(ptep_get(pte)) != walk->reuse_page);
> -
>  	page = list_first_entry(walk->vmemmap_pages, struct page, lru);
>  	list_del(&page->lru);
>  	to = page_to_virt(page);
> -	copy_page(to, (void *)walk->reuse_addr);
> +	copy_page(to, (void *)walk->vmemmap_start);
>  	reset_struct_pages(to);
>  
>  	/*
> @@ -272,7 +267,7 @@ static void vmemmap_restore_pte(pte_t *pte, unsigned long addr,
>  	 * before the set_pte_at() write.
>  	 */
>  	smp_wmb();
> -	set_pte_at(&init_mm, addr, pte, mk_pte(page, pgprot));
> +	set_pte_at(&init_mm, addr, pte, mk_pte(page, PAGE_KERNEL));
>  }
>  
>  /**
> @@ -282,22 +277,17 @@ static void vmemmap_restore_pte(pte_t *pte, unsigned long addr,
>   *             to remap.
>   * @end:       end address of the vmemmap virtual address range that we want to
>   *             remap.
> - * @reuse:     reuse address.
> - *
>   * Return: %0 on success, negative error code otherwise.
>   */
> -static int vmemmap_remap_split(unsigned long start, unsigned long end,
> -			       unsigned long reuse)
> +static int vmemmap_remap_split(unsigned long start, unsigned long end)
>  {
>  	struct vmemmap_remap_walk walk = {
>  		.remap_pte	= NULL,
> +		.vmemmap_start	= start,
>  		.flags		= VMEMMAP_SPLIT_NO_TLB_FLUSH,
>  	};
>  
> -	/* See the comment in the vmemmap_remap_free(). */
> -	BUG_ON(start - reuse != PAGE_SIZE);
> -
> -	return vmemmap_remap_range(reuse, end, &walk);
> +	return vmemmap_remap_range(start, end, &walk);
>  }
>  
>  /**
> @@ -308,7 +298,8 @@ static int vmemmap_remap_split(unsigned long start, unsigned long end,
>   *		to remap.
>   * @end:	end address of the vmemmap virtual address range that we want to
>   *		remap.
> - * @reuse:	reuse address.
> + * @vmemmap_head: the page to be installed as first in the vmemmap range
> + * @vmemmap_tail: the page to be installed as non-first in the vmemmap range
>   * @vmemmap_pages: list to deposit vmemmap pages to be freed.  It is callers
>   *		responsibility to free pages.
>   * @flags:	modifications to vmemmap_remap_walk flags
> @@ -316,69 +307,40 @@ static int vmemmap_remap_split(unsigned long start, unsigned long end,
>   * Return: %0 on success, negative error code otherwise.
>   */
>  static int vmemmap_remap_free(unsigned long start, unsigned long end,
> -			      unsigned long reuse,
> +			      struct page *vmemmap_head,
> +			      struct page *vmemmap_tail,
>  			      struct list_head *vmemmap_pages,
>  			      unsigned long flags)

Need to fix the doc above vmemmap_remap_free as it mentions reuse.
>  {
>  	int ret;
>  	struct vmemmap_remap_walk walk = {
>  		.remap_pte	= vmemmap_remap_pte,
> -		.reuse_addr	= reuse,
> +		.vmemmap_start	= start,
> +		.vmemmap_head	= vmemmap_head,
> +		.vmemmap_tail	= vmemmap_tail,
>  		.vmemmap_pages	= vmemmap_pages,
>  		.flags		= flags,
>  	};
> -	int nid = page_to_nid((struct page *)reuse);
> -	gfp_t gfp_mask = GFP_KERNEL | __GFP_NORETRY | __GFP_NOWARN;
> +
> +	ret = vmemmap_remap_range(start, end, &walk);
> +	if (!ret || !walk.nr_walked)
> +		return ret;
> +
> +	end = start + walk.nr_walked * PAGE_SIZE;
>  
>  	/*
> -	 * Allocate a new head vmemmap page to avoid breaking a contiguous
> -	 * block of struct page memory when freeing it back to page allocator
> -	 * in free_vmemmap_page_list(). This will allow the likely contiguous
> -	 * struct page backing memory to be kept contiguous and allowing for
> -	 * more allocations of hugepages. Fallback to the currently
> -	 * mapped head page in case should it fail to allocate.
> +	 * vmemmap_pages contains pages from the previous vmemmap_remap_range()
> +	 * call which failed.  These are pages which were removed from
> +	 * the vmemmap. They will be restored in the following call.
>  	 */
> -	walk.reuse_page = alloc_pages_node(nid, gfp_mask, 0);
> -	if (walk.reuse_page) {
> -		copy_page(page_to_virt(walk.reuse_page),
> -			  (void *)walk.reuse_addr);
> -		list_add(&walk.reuse_page->lru, vmemmap_pages);
> -		memmap_pages_add(1);
> -	}
> +	walk = (struct vmemmap_remap_walk) {
> +		.remap_pte	= vmemmap_restore_pte,
> +		.vmemmap_start	= start,
> +		.vmemmap_pages	= vmemmap_pages,
> +		.flags		= 0,
> +	};
>  
> -	/*
> -	 * In order to make remapping routine most efficient for the huge pages,
> -	 * the routine of vmemmap page table walking has the following rules
> -	 * (see more details from the vmemmap_pte_range()):
> -	 *
> -	 * - The range [@start, @end) and the range [@reuse, @reuse + PAGE_SIZE)
> -	 *   should be continuous.
> -	 * - The @reuse address is part of the range [@reuse, @end) that we are
> -	 *   walking which is passed to vmemmap_remap_range().
> -	 * - The @reuse address is the first in the complete range.
> -	 *
> -	 * So we need to make sure that @start and @reuse meet the above rules.
> -	 */
> -	BUG_ON(start - reuse != PAGE_SIZE);
> -
> -	ret = vmemmap_remap_range(reuse, end, &walk);
> -	if (ret && walk.nr_walked) {
> -		end = reuse + walk.nr_walked * PAGE_SIZE;
> -		/*
> -		 * vmemmap_pages contains pages from the previous
> -		 * vmemmap_remap_range call which failed.  These
> -		 * are pages which were removed from the vmemmap.
> -		 * They will be restored in the following call.
> -		 */
> -		walk = (struct vmemmap_remap_walk) {
> -			.remap_pte	= vmemmap_restore_pte,
> -			.reuse_addr	= reuse,
> -			.vmemmap_pages	= vmemmap_pages,
> -			.flags		= 0,
> -		};
> -
> -		vmemmap_remap_range(reuse, end, &walk);
> -	}
> +	vmemmap_remap_range(start + PAGE_SIZE, end, &walk);


I think this should be vmemmap_remap_range(start, end, &walk)? Otherwise if start failed to remap,
you wont restore it?

>  
>  	return ret;
>  }
> @@ -415,29 +377,27 @@ static int alloc_vmemmap_page_list(unsigned long start, unsigned long end,
>   *		to remap.
>   * @end:	end address of the vmemmap virtual address range that we want to
>   *		remap.
> - * @reuse:	reuse address.
>   * @flags:	modifications to vmemmap_remap_walk flags
>   *
>   * Return: %0 on success, negative error code otherwise.
>   */
>  static int vmemmap_remap_alloc(unsigned long start, unsigned long end,
> -			       unsigned long reuse, unsigned long flags)
> +			       unsigned long flags)
>  {
>  	LIST_HEAD(vmemmap_pages);
>  	struct vmemmap_remap_walk walk = {
>  		.remap_pte	= vmemmap_restore_pte,
> -		.reuse_addr	= reuse,
> +		.vmemmap_start	= start,
>  		.vmemmap_pages	= &vmemmap_pages,
>  		.flags		= flags,
>  	};
>  
> -	/* See the comment in the vmemmap_remap_free(). */
> -	BUG_ON(start - reuse != PAGE_SIZE);
> +	start += HUGETLB_VMEMMAP_RESERVE_SIZE;
>  
>  	if (alloc_vmemmap_page_list(start, end, &vmemmap_pages))
>  		return -ENOMEM;
>  
> -	return vmemmap_remap_range(reuse, end, &walk);
> +	return vmemmap_remap_range(start, end, &walk);
>  }
>  
>  DEFINE_STATIC_KEY_FALSE(hugetlb_optimize_vmemmap_key);
> @@ -454,8 +414,7 @@ static int __hugetlb_vmemmap_restore_folio(const struct hstate *h,
>  					   struct folio *folio, unsigned long flags)
>  {
>  	int ret;
> -	unsigned long vmemmap_start = (unsigned long)&folio->page, vmemmap_end;
> -	unsigned long vmemmap_reuse;
> +	unsigned long vmemmap_start, vmemmap_end;
>  
>  	VM_WARN_ON_ONCE_FOLIO(!folio_test_hugetlb(folio), folio);
>  	VM_WARN_ON_ONCE_FOLIO(folio_ref_count(folio), folio);
> @@ -466,9 +425,8 @@ static int __hugetlb_vmemmap_restore_folio(const struct hstate *h,
>  	if (flags & VMEMMAP_SYNCHRONIZE_RCU)
>  		synchronize_rcu();
>  
> +	vmemmap_start	= (unsigned long)folio;
>  	vmemmap_end	= vmemmap_start + hugetlb_vmemmap_size(h);
> -	vmemmap_reuse	= vmemmap_start;
> -	vmemmap_start	+= HUGETLB_VMEMMAP_RESERVE_SIZE;
>  
>  	/*
>  	 * The pages which the vmemmap virtual address range [@vmemmap_start,
> @@ -477,7 +435,7 @@ static int __hugetlb_vmemmap_restore_folio(const struct hstate *h,
>  	 * When a HugeTLB page is freed to the buddy allocator, previously
>  	 * discarded vmemmap pages must be allocated and remapping.
>  	 */
> -	ret = vmemmap_remap_alloc(vmemmap_start, vmemmap_end, vmemmap_reuse, flags);
> +	ret = vmemmap_remap_alloc(vmemmap_start, vmemmap_end, flags);
>  	if (!ret) {
>  		folio_clear_hugetlb_vmemmap_optimized(folio);
>  		static_branch_dec(&hugetlb_optimize_vmemmap_key);
> @@ -565,9 +523,9 @@ static int __hugetlb_vmemmap_optimize_folio(const struct hstate *h,
>  					    struct list_head *vmemmap_pages,
>  					    unsigned long flags)
>  {
> -	int ret = 0;
> -	unsigned long vmemmap_start = (unsigned long)&folio->page, vmemmap_end;
> -	unsigned long vmemmap_reuse;
> +	unsigned long vmemmap_start, vmemmap_end;
> +	struct page *vmemmap_head, *vmemmap_tail;
> +	int nid, ret = 0;
>  
>  	VM_WARN_ON_ONCE_FOLIO(!folio_test_hugetlb(folio), folio);
>  	VM_WARN_ON_ONCE_FOLIO(folio_ref_count(folio), folio);
> @@ -592,9 +550,21 @@ static int __hugetlb_vmemmap_optimize_folio(const struct hstate *h,
>  	 */
>  	folio_set_hugetlb_vmemmap_optimized(folio);
>  
> +	nid = folio_nid(folio);
> +	vmemmap_head = alloc_pages_node(nid, GFP_KERNEL, 0);

Should we add __GFP_NORETRY | __GFP_NOWARN here? It was there in the previous code. I am guessing
that it was there in the previous code as its an optimization and if it fails its not a big issue.


> +
> +	if (!vmemmap_head) {
> +		ret = -ENOMEM;
> +		goto out;
> +	}
> +
> +	copy_page(page_to_virt(vmemmap_head), folio);
> +	list_add(&vmemmap_head->lru, vmemmap_pages);
> +	memmap_pages_add(1);
> +
> +	vmemmap_tail	= vmemmap_head;
> +	vmemmap_start	= (unsigned long)folio;
>  	vmemmap_end	= vmemmap_start + hugetlb_vmemmap_size(h);
> -	vmemmap_reuse	= vmemmap_start;
> -	vmemmap_start	+= HUGETLB_VMEMMAP_RESERVE_SIZE;
>  
>  	/*
>  	 * Remap the vmemmap virtual address range [@vmemmap_start, @vmemmap_end)
> @@ -602,8 +572,10 @@ static int __hugetlb_vmemmap_optimize_folio(const struct hstate *h,
>  	 * mapping the range to vmemmap_pages list so that they can be freed by
>  	 * the caller.
>  	 */
> -	ret = vmemmap_remap_free(vmemmap_start, vmemmap_end, vmemmap_reuse,
> +	ret = vmemmap_remap_free(vmemmap_start, vmemmap_end,
> +				 vmemmap_head, vmemmap_tail,
>  				 vmemmap_pages, flags);

The doc above this also mentions vmemmap_reuse.

> +out:
>  	if (ret) {
>  		static_branch_dec(&hugetlb_optimize_vmemmap_key);
>  		folio_clear_hugetlb_vmemmap_optimized(folio);
> @@ -632,21 +604,19 @@ void hugetlb_vmemmap_optimize_folio(const struct hstate *h, struct folio *folio)
>  
>  static int hugetlb_vmemmap_split_folio(const struct hstate *h, struct folio *folio)
>  {
> -	unsigned long vmemmap_start = (unsigned long)&folio->page, vmemmap_end;
> -	unsigned long vmemmap_reuse;
> +	unsigned long vmemmap_start, vmemmap_end;
>  
>  	if (!vmemmap_should_optimize_folio(h, folio))
>  		return 0;
>  
> +	vmemmap_start	= (unsigned long)folio;
>  	vmemmap_end	= vmemmap_start + hugetlb_vmemmap_size(h);
> -	vmemmap_reuse	= vmemmap_start;
> -	vmemmap_start	+= HUGETLB_VMEMMAP_RESERVE_SIZE;
>  
>  	/*
>  	 * Split PMDs on the vmemmap virtual address range [@vmemmap_start,
>  	 * @vmemmap_end]
>  	 */
> -	return vmemmap_remap_split(vmemmap_start, vmemmap_end, vmemmap_reuse);
> +	return vmemmap_remap_split(vmemmap_start, vmemmap_end);
>  }
>  
>  static void __hugetlb_vmemmap_optimize_folios(struct hstate *h,

