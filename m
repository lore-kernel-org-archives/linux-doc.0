Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 172793C5DB6;
	Mon, 11 May 2026 13:03:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1778504599; cv=none; b=TUj4297aV9y4rmrktK9JWg1lSTvaFMnZlh/QDBw4Tc039kbQmaDu1mwOwREcqmzLhJCBpnWPtLBTj+hmLc8b6rJ97j33t8tRaxl1Yyh18D0tXz1em4hRpT0NSs2g/cNb1FvMxauBEahuGLf0R52Io9c8fs31/VsdK+4jkZ5CObg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1778504599; c=relaxed/simple;
	bh=kQwSfNCCLbUhti9udnSk7pt8oY35FAkzLyI7ofDZFwg=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=R8dSdc9snEGoPKrreOr+enNjxboo5Wy1adlOskAxHYNvbHmY6jVKtVbODriTnkwD7HdTeKl3ER+3uAxGBxWSBMHc05IOFjmGlp8zm6qI0HZPE5SeIVZha0nMWeNciKpyE+qk50RmLlGM2d2iMD8p7R9dNzDVKoanV5Ata+DKmrc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=uMdWgIVZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="uMdWgIVZ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 830B2C2BCF7;
	Mon, 11 May 2026 13:03:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1778504598;
	bh=kQwSfNCCLbUhti9udnSk7pt8oY35FAkzLyI7ofDZFwg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=uMdWgIVZkHHB8pLI8a6wy8l2UtNjohCfS4udur4TYvZI+6hgM/SCtu3TMmbt8W1Oq
	 9/7BqjCUhPdbLlhv9AZIL8bcTT0c0lJgQkjCmHghkh6p7C5lrFp84dFqA7tLaqVyrC
	 II41nrIt02dHlHV9sOsvZHjRsMWz97TpDCVOIMRsdkOOpqgaVeeCSTUK2YUsOIBEnh
	 CbpQkdTELCzO4rdWW5Vn3+7jOiKiaLqiyjskP3xRe5+chEhnqFiYBsey5tvNGscfZa
	 uzIAtCR5mJoeV3TVdj2Yo0mHwpJDSq8kYREQso4SIsMHQTACS+z1TqLsMKBp48llkS
	 AqktpPLfYjMAg==
Message-ID: <24edd9d6-99f2-4d3d-83eb-69b406f4a9a0@kernel.org>
Date: Mon, 11 May 2026 15:03:14 +0200
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 4/5] mm: swap: fall back to order-0 after large swapin
 races
To: fujunjie <fujunjie1@qq.com>, Andrew Morton <akpm@linux-foundation.org>,
 Chris Li <chrisl@kernel.org>, Kairui Song <kasong@tencent.com>,
 Johannes Weiner <hannes@cmpxchg.org>, Nhat Pham <nphamcs@gmail.com>,
 Yosry Ahmed <yosry@kernel.org>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
 Ryan Roberts <ryan.roberts@arm.com>, Barry Song <baohua@kernel.org>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Chengming Zhou <chengming.zhou@linux.dev>, Baoquan He <bhe@redhat.com>,
 Lorenzo Stoakes <ljs@kernel.org>
References: <tencent_8B437BE4F586C162950BF71954316C1EDB05@qq.com>
 <tencent_CD11FE9B4A0B362E95E776C5F679598FAA07@qq.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <tencent_CD11FE9B4A0B362E95E776C5F679598FAA07@qq.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 5/8/26 22:20, fujunjie wrote:
> swapin_folio() documents that a large folio insertion race returns NULL
> so the caller can fall back to order-0 swapin. do_swap_page() currently
> turns that NULL into VM_FAULT_OOM if the PTE is unchanged, which is
> harsher than necessary and gets in the way of rejecting large folio
> ranges for backend reasons.
> 
> Move the synchronous swapin sequence into a helper and retry with an
> order-0 folio when a large folio cannot be inserted into the swap cache.
> Count the event as an mTHP swapin fallback before dropping the failed
> large allocation.
> 
> Signed-off-by: fujunjie <fujunjie1@qq.com>
> ---
>  mm/memory.c | 50 +++++++++++++++++++++++++++++++++++++++-----------
>  1 file changed, 39 insertions(+), 11 deletions(-)
> 
> diff --git a/mm/memory.c b/mm/memory.c
> index ea6568571131..84e3b77b8293 100644
> --- a/mm/memory.c
> +++ b/mm/memory.c
> @@ -4757,6 +4757,44 @@ static struct folio *alloc_swap_folio(struct vm_fault *vmf)
>  }
>  #endif /* CONFIG_TRANSPARENT_HUGEPAGE */
>  
> +static struct folio *swapin_synchronous_folio(swp_entry_t entry,
> +					      struct vm_fault *vmf)
> +{
> +	struct folio *swapcache, *folio;
> +	bool large;
> +	int order;
> +
> +	folio = alloc_swap_folio(vmf);
> +	if (!folio)
> +		return NULL;
> +
> +	large = folio_test_large(folio);
> +	order = folio_order(folio);
> +
> +	/*
> +	 * folio is charged, so swapin can only fail due to raced swapin and
> +	 * return NULL.
> +	 */
> +	swapcache = swapin_folio(entry, folio);
> +	if (swapcache == folio)
> +		return folio;
> +
> +	if (!swapcache && large)
> +		count_mthp_stat(order, MTHP_STAT_SWPIN_FALLBACK);
> +	folio_put(folio);
> +	if (swapcache || !large)
> +		return swapcache;
> +
> +	folio = __alloc_swap_folio(vmf);
> +	if (!folio)
> +		return NULL;
> +
> +	swapcache = swapin_folio(entry, folio);
> +	if (swapcache != folio)
> +		folio_put(folio);
> +	return swapcache;
> +}
> +
>  /* Sanity check that a folio is fully exclusive */
>  static void check_swap_exclusive(struct folio *folio, swp_entry_t entry,
>  				 unsigned int nr_pages)
> @@ -4860,17 +4898,7 @@ vm_fault_t do_swap_page(struct vm_fault *vmf)
>  		swap_update_readahead(folio, vma, vmf->address);
>  	if (!folio) {
>  		if (data_race(si->flags & SWP_SYNCHRONOUS_IO)) {
> -			folio = alloc_swap_folio(vmf);
> -			if (folio) {
> -				/*
> -				 * folio is charged, so swapin can only fail due
> -				 * to raced swapin and return NULL.
> -				 */
> -				swapcache = swapin_folio(entry, folio);
> -				if (swapcache != folio)
> -					folio_put(folio);
> -				folio = swapcache;
> -			}
> +			folio = swapin_synchronous_folio(entry, vmf);
>  		} else {
>  			folio = swapin_readahead(entry, GFP_HIGHUSER_MOVABLE, vmf);
>  		}

There are some upcoming changes with:

https://lore.kernel.org/r/20260421-swap-table-p4-v3-5-2f23759a76bc@tencent.com


All the of that logic you have in swapin_synchronous_folio() should ideally not
go into memory.c, but into some swap specific code.

But

https://lore.kernel.org/r/20260421-swap-table-p4-v3-0-2f23759a76bc@tencent.com

Already changes a lot of that.

-- 
Cheers,

David
