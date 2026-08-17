Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5E073F482E;
	Mon, 17 Aug 2026 11:34:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786966498; cv=none; b=JpgUwKwOutNKR9tht7Aj6L1PhvLM3qHh9IGtWhAFGrXZkqjbRO+WiLypvnbNV0RGRl3G0CWDmv+dQhxEjDhqtF/ziX9ciDcRSf3FI7NLGLJPZ0vjnH5yNnqy7oCzn1c4yelJeg6X2Ge1tBpGSfgocM8VWjTByWCBtBpNaBbPP6U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786966498; c=relaxed/simple;
	bh=YIH1uv2a3XLeIR8X6C7b6ayC/5syT6hgSQyhNxGlbYA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jc1OlsqXWTdd5evWvdvhkY30GCKaqv68kEilD9L2UQpgqMilGxrrI+Hv8b58Z69vlx6gtQ2ccSsgv54mtoXrzrOUHB0DHSM2zQc66uDfZH5SMVDJdBkBLZ2FeTcCWH9Mm/7H8RzZae9EAg3jpJMtGyUw4Ca+D4mHgv4qP+e1X1s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=JNfLwRIf; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="JNfLwRIf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A91351F000E9;
	Mon, 17 Aug 2026 11:34:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786966497;
	bh=ZhUYJ0ZuwJek6vTA3gaMgg4QsB61Vmg04/nAHXi8Jj8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JNfLwRIfVaBYgaBoNkym1UWIbh/mCvBOZXQeFxobpoFb8TQKZ0rD4diFy6IjGtjih
	 0J77bz+08aLdAQ5M47GBPHjs+f92By9fcMZ+cL2UMsSpCMGX7ECHS0jk5d/5B8ZBvS
	 BvkJHFcD3cSbDvCtwTgsJPH0VZdyTAPz8AxPrm9D26CAVuRvA65Sj9TzEHSD6ev593
	 5+E5Wo49JnNuLKPTNHEnfdGXYSJX7Jla3ORwcMjQephwZOSvosdrmUO7U6QASJEi4O
	 WxNZ3xdQPB8m+unAI8PesxXM0OpACbxw/HaSRbL/DwVJnz4GsFyENQ2xCM1Kdvmmzj
	 bai02Jy5m6VrA==
Date: Mon, 17 Aug 2026 12:34:37 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: "Nico Pache (Red Hat)" <nico.pache@linux.dev>
Cc: linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, 
	Baolin Wang <baolin.wang@linux.alibaba.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>, 
	Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>, 
	Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v4 3/7] mm/khugepaged: introduce a count_collapse_event()
 helper
Message-ID: <aoLxhe1-eZ-G-_sF@lucifer>
References: <20260811-khugepaged_pte_refactor-v4-0-ddac39d61c4a@linux.dev>
 <20260811-khugepaged_pte_refactor-v4-3-ddac39d61c4a@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811-khugepaged_pte_refactor-v4-3-ddac39d61c4a@linux.dev>

On Tue, Aug 11, 2026 at 06:48:35AM -0600, Nico Pache (Red Hat) wrote:
> Provide a simple helper function to help reduce a often used, and
> duplicate pattern across the khugepaged code.
>
> When collapsing to a PMD we need to record a vm_event and the mTHP_stat
> event. When doing mTHP collapse we only update the mTHP stat.
>
> Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> Acked-by: David Hildenbrand (Arm) <david@kernel.org>
> Acked-by: Usama Arif <usama.arif@linux.dev>
> Signed-off-by: Nico Pache (Red Hat) <nico.pache@linux.dev>

LGTM so:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  mm/khugepaged.c | 42 +++++++++++++++++++++---------------------
>  1 file changed, 21 insertions(+), 21 deletions(-)
>
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index 8babd4c97db6..cae510aa2914 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -688,6 +688,14 @@ static inline bool folio_pte_referenced(struct folio *folio,
>  	return pte_young(pteval) || mmu_notifier_test_young(vma->vm_mm, addr);
>  }
>
> +static void count_collapse_event(unsigned int order, enum vm_event_item vm_event,
> +		enum mthp_stat_item mthp_event)

Add a comment! Lol no only joking ;)

> +{
> +	if (is_pmd_order(order))
> +		count_vm_event(vm_event);
> +	count_mthp_stat(order, mthp_event);
> +}
> +
>  static enum scan_result __collapse_huge_page_isolate(struct vm_area_struct *vma,
>  		unsigned long start_addr, pte_t *pte, struct collapse_control *cc,
>  		unsigned int order, struct list_head *compound_pagelist)
> @@ -708,9 +716,8 @@ static enum scan_result __collapse_huge_page_isolate(struct vm_area_struct *vma,
>  		if (pte_none_or_zero(pteval)) {
>  			if (++none_or_zero > max_ptes_none) {
>  				result = SCAN_EXCEED_NONE_PTE;
> -				if (is_pmd_order(order))
> -					count_vm_event(THP_SCAN_EXCEED_NONE_PTE);
> -				count_mthp_stat(order, MTHP_STAT_COLLAPSE_EXCEED_NONE);
> +				count_collapse_event(order, THP_SCAN_EXCEED_NONE_PTE,
> +						     MTHP_STAT_COLLAPSE_EXCEED_NONE);
>  				goto out;
>  			}
>  			continue;
> @@ -752,9 +759,8 @@ static enum scan_result __collapse_huge_page_isolate(struct vm_area_struct *vma,
>  			 */
>  			if (++shared > max_ptes_shared) {
>  				result = SCAN_EXCEED_SHARED_PTE;
> -				if (is_pmd_order(order))
> -					count_vm_event(THP_SCAN_EXCEED_SHARED_PTE);
> -				count_mthp_stat(order, MTHP_STAT_COLLAPSE_EXCEED_SHARED);
> +				count_collapse_event(order, THP_SCAN_EXCEED_SHARED_PTE,
> +						     MTHP_STAT_COLLAPSE_EXCEED_SHARED);
>  				goto out;
>  			}
>  		}
> @@ -1264,15 +1270,12 @@ static enum scan_result alloc_charge_folio(struct folio **foliop, struct mm_stru
>  	folio = __folio_alloc(gfp, order, node, &cc->alloc_nmask);
>  	if (!folio) {
>  		*foliop = NULL;
> -		if (is_pmd_order(order))
> -			count_vm_event(THP_COLLAPSE_ALLOC_FAILED);
> -		count_mthp_stat(order, MTHP_STAT_COLLAPSE_ALLOC_FAILED);
> +		count_collapse_event(order, THP_COLLAPSE_ALLOC_FAILED,
> +				     MTHP_STAT_COLLAPSE_ALLOC_FAILED);
>  		return SCAN_ALLOC_HUGE_PAGE_FAIL;
>  	}
>
> -	if (is_pmd_order(order))
> -		count_vm_event(THP_COLLAPSE_ALLOC);
> -	count_mthp_stat(order, MTHP_STAT_COLLAPSE_ALLOC);
> +	count_collapse_event(order, THP_COLLAPSE_ALLOC, MTHP_STAT_COLLAPSE_ALLOC);
>
>  	if (unlikely(mem_cgroup_charge(folio, mm, gfp))) {
>  		folio_put(folio);
> @@ -1662,9 +1665,8 @@ static enum scan_result collapse_scan_pmd(struct mm_struct *mm,
>  		if (pte_none_or_zero(pteval)) {
>  			if (++none_or_zero > max_ptes_none) {
>  				result = SCAN_EXCEED_NONE_PTE;
> -				count_vm_event(THP_SCAN_EXCEED_NONE_PTE);
> -				count_mthp_stat(HPAGE_PMD_ORDER,
> -						MTHP_STAT_COLLAPSE_EXCEED_NONE);
> +				count_collapse_event(HPAGE_PMD_ORDER, THP_SCAN_EXCEED_NONE_PTE,
> +						     MTHP_STAT_COLLAPSE_EXCEED_NONE);
>  				goto out_unmap;
>  			}
>  			continue;
> @@ -1672,9 +1674,8 @@ static enum scan_result collapse_scan_pmd(struct mm_struct *mm,
>  		if (!pte_present(pteval)) {
>  			if (++unmapped > max_ptes_swap) {
>  				result = SCAN_EXCEED_SWAP_PTE;
> -				count_vm_event(THP_SCAN_EXCEED_SWAP_PTE);
> -				count_mthp_stat(HPAGE_PMD_ORDER,
> -						MTHP_STAT_COLLAPSE_EXCEED_SWAP);
> +				count_collapse_event(HPAGE_PMD_ORDER, THP_SCAN_EXCEED_SWAP_PTE,
> +						     MTHP_STAT_COLLAPSE_EXCEED_SWAP);
>  				goto out_unmap;
>  			}
>  			/*
> @@ -1731,9 +1732,8 @@ static enum scan_result collapse_scan_pmd(struct mm_struct *mm,
>  		if (folio_maybe_mapped_shared(folio)) {
>  			if (++shared > max_ptes_shared) {
>  				result = SCAN_EXCEED_SHARED_PTE;
> -				count_vm_event(THP_SCAN_EXCEED_SHARED_PTE);
> -				count_mthp_stat(HPAGE_PMD_ORDER,
> -						MTHP_STAT_COLLAPSE_EXCEED_SHARED);
> +				count_collapse_event(HPAGE_PMD_ORDER, THP_SCAN_EXCEED_SHARED_PTE,
> +						     MTHP_STAT_COLLAPSE_EXCEED_SHARED);
>  				goto out_unmap;
>  			}
>  		}
>
> --
> 2.55.0
>

--
Cheers, Lorenzo
