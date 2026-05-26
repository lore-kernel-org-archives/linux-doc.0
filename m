Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8DE443FE660
	for <linux-doc@vger.kernel.org>; Tue, 26 May 2026 14:42:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779806524; cv=none; b=OXECK0LbVDvQYEV1CgxtAZxvSt3cSqHNNFeyq1s81BS7jeR36LkxO5GmwR+IuOaq6MYbnzSKyZpjuNX2T/LK2rA/HsrpgYvSBUWiFJUiWnvo2Ez9AHq0qGwzInXekSLVAwoNyP0vbKgT1gv3YGHzIsgL6WIMFjt0kenq6Vv4K24=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779806524; c=relaxed/simple;
	bh=wpU+LNm+B0eIgaDTspLM4P9amt4l5UFyumM4B4w0M1k=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KYhUC+Yn+RIVyyLZj8wpVrYu6WHFU5idlL/skorhxKFlWPOn5eK0hZEY5Tr5qfLY/rSV7SJ/raOVHBoS5Kz7fidg52uN+RkhOQogwQWQHdHaGFZxgH6m3X2eSFjq5fu7KCO3gm/WfWY7ulNNVlm9vKq6+CLT0UYG29WtdLwWPuU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=jNNbT1hR; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=ULJEe1oM; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="jNNbT1hR";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="ULJEe1oM"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779806521;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=p+9Pg6pe8laYawihyMaaO6J8jVwFkXlO5bNdGB91WSE=;
	b=jNNbT1hR2DW+yMcs66onaKw/CTD0AHidGe6WRENyMH02Bkqu+yjH9Yz6odIiQjT5+347/s
	Ek6JhACjIuM3JNCUzMP70vF3pist97YoGrnpdmSxzBKqg6SujHnXFBITXkItWziaPzzFUM
	mkKtPJ0FAizRijfMhJfJuK7HIhovRC8=
Received: from mail-wm1-f72.google.com (mail-wm1-f72.google.com
 [209.85.128.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-150-P8XaJHQiNMyiG-pUlF3siQ-1; Tue, 26 May 2026 10:41:59 -0400
X-MC-Unique: P8XaJHQiNMyiG-pUlF3siQ-1
X-Mimecast-MFC-AGG-ID: P8XaJHQiNMyiG-pUlF3siQ_1779806515
Received: by mail-wm1-f72.google.com with SMTP id 5b1f17b1804b1-48fe6894f3fso62358125e9.2
        for <linux-doc@vger.kernel.org>; Tue, 26 May 2026 07:41:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779806515; x=1780411315; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=p+9Pg6pe8laYawihyMaaO6J8jVwFkXlO5bNdGB91WSE=;
        b=ULJEe1oMF0dRQWS/xts7V0N5gFSKG00MJKamLokrH03zEXPwiA9WuRHvCddA9vq9Bn
         TKzTo2FdbDL1LavOurwEQtVbKsxCDNPD0Kdo9jIbmmTziLHQQ54C3EkI4XHTyLChq9q6
         nsYX5DqqIr834n7ebLo4nBzdqt1TR40XbwhdJHoETn7veAZ52m27dlsqoh8gBi0VVUOU
         lM2YSkGj3xG1XyMmuj2IGxxuHDXqw52mGRC3E1TG0mhvTTpmiL+79HC5zudgYGufKluM
         3jR2H00C/82ATGHBYGcCiGUslikVzBt9Ww5n/LD0z7+6LOBKZHLKsGA39PuRqHiCNH0+
         p9fA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779806515; x=1780411315;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=p+9Pg6pe8laYawihyMaaO6J8jVwFkXlO5bNdGB91WSE=;
        b=bsZHfaY/dR8llNbPbNMSIeRcLqP9p3vJIofQntw05e7zJ8rxJQk2f1ix8TjoSepi4b
         NMm64eZ5kVwyXST1ieNTCxtjZg3wU7hp5bfoscMm2jsa/3d5OkQ+ngjng3wYtcHZf1D/
         O6gzijiBVunmkQ10t95E42m4I97Oki3EUz9QHDob0/iRcWjUvR5lWZz0tSbNvEc3mjL9
         4TsSSXqAbYiH3mh+uOH84Q2My7MPVR3yxJ6DYmPO4osxlt4Rh3rpEZ1yZERzsCIL52VQ
         DNBFplCGowzP5R1WMQ2DG2/yNtwVgk1i11PUfYSVHjQJt/VRRZpIQjvgsn4qLwU7WmKW
         QJ7w==
X-Gm-Message-State: AOJu0YyNyhVVC4EHF6cgv9hmyWaqcfWjJUpakZ7moERjW03ggbZXZCQo
	ZDWzwkahPXgPqntsNI0JVS25mLTKQkJolqGnkuEti3OIIj/d2b92ILGVazpYf2qFziEPkH3J6D5
	sEUIYDWLowyIpREWf88eWYV++Ew1IRFCGMnfpqW59NPhWDRIzQrbv2uebFZ5Q6Oqly6nGNBPQBo
	btrL+xqc5FG3fo5pms50vwTIooLqmECPfGqa25e1wfVHBk8A==
X-Gm-Gg: Acq92OEa2iuybn6EYNQWkANxI7m1bpaZZud6LPSFKrvNXna4tdEldup1ZvLLnUit5Ih
	nxUbDQShq6J/juFyplA4+3Rm/7xj6Yx0Y+i0kCRUKPjJCz8YotjizUbSjvGepPAHzNTVqAvyZ6u
	QWktrz/sa/s5f51PUbx4X2/N9E72+85cURUtNwWFcvXbYuIg6s1bQH/R/elJ59Wt80xGRybOmR8
	BHKy5NOtIn/oU2scSb4bQdsNQDQwz1BHVYWMxc0A1wbl7OZG1Nj4czYn+nKabsCwEhJ2wISx6wT
	Y0fCi2E1WSE/TBqKlDiC5e0hAZEjd+qND2uDEPBv7XF+RGrVXIAmicWc/FJWdo/RNtbFzXyJ5bB
	dK7gUGQssMoreywcG3ZpSV9k=
X-Received: by 2002:a05:600c:3496:b0:48e:6f39:f7be with SMTP id 5b1f17b1804b1-490424a683bmr332133205e9.10.1779806515039;
        Tue, 26 May 2026 07:41:55 -0700 (PDT)
X-Received: by 2002:a05:600c:3496:b0:48e:6f39:f7be with SMTP id 5b1f17b1804b1-490424a683bmr332131765e9.10.1779806514301;
        Tue, 26 May 2026 07:41:54 -0700 (PDT)
Received: from [192.168.1.144] ([88.147.84.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6d48e23sm34838505f8f.20.2026.05.26.07.41.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 07:41:53 -0700 (PDT)
Message-ID: <a48032dd-7881-43c0-b439-5cda6124ea58@redhat.com>
Date: Tue, 26 May 2026 08:42:49 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH mm-unstable v18 06/14] mm/khugepaged: generalize
 collapse_huge_page for mTHP collapse
To: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org, linux-trace-kernel@vger.kernel.org,
 akpm@linux-foundation.org
Cc: aarcange@redhat.com, anshuman.khandual@arm.com, apopple@nvidia.com,
 baohua@kernel.org, baolin.wang@linux.alibaba.com, byungchul@sk.com,
 catalin.marinas@arm.com, cl@gentwo.org, corbet@lwn.net,
 dave.hansen@linux.intel.com, david@kernel.org, dev.jain@arm.com,
 gourry@gourry.net, hannes@cmpxchg.org, hughd@google.com, jack@suse.cz,
 jackmanb@google.com, jannh@google.com, jglisse@google.com,
 joshua.hahnjy@gmail.com, kas@kernel.org, lance.yang@linux.dev,
 liam@infradead.org, ljs@kernel.org, mathieu.desnoyers@efficios.com,
 matthew.brost@intel.com, mhiramat@kernel.org, mhocko@suse.com,
 peterx@redhat.com, pfalcato@suse.de, rakie.kim@sk.com, raquini@redhat.com,
 rdunlap@infradead.org, richard.weiyang@gmail.com, rientjes@google.com,
 rostedt@goodmis.org, rppt@kernel.org, ryan.roberts@arm.com,
 shivankg@amd.com, sunnanyong@huawei.com, surenb@google.com,
 thomas.hellstrom@linux.intel.com, tiwai@suse.de, usamaarif642@gmail.com,
 vbabka@suse.cz, vishal.moola@gmail.com, wangkefeng.wang@huawei.com,
 will@kernel.org, willy@infradead.org, yang@os.amperecomputing.com,
 ying.huang@linux.alibaba.com, ziy@nvidia.com, zokeefe@google.com,
 Usama Arif <usama.arif@linux.dev>
References: <20260522150009.121603-1-npache@redhat.com>
 <20260522150009.121603-7-npache@redhat.com>
Content-Language: en-US
From: Nico Pache <npache@redhat.com>
In-Reply-To: <20260522150009.121603-7-npache@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/22/26 9:00 AM, Nico Pache wrote:
> Pass an order and offset to collapse_huge_page to support collapsing anon
> memory to arbitrary orders within a PMD. order indicates what mTHP size we
> are attempting to collapse to, and offset indicates were in the PMD to
> start the collapse attempt.
> 
> For non-PMD collapse we must leave the anon VMA write locked until after
> we collapse the mTHP-- in the PMD case all the pages are isolated, but in
> the mTHP case this is not true, and we must keep the lock to prevent
> access/changes to the page tables. This can happen if the rmap walkers hit
> a pmd_none while the PMD entry is currently unavailable due to being
> temporarily removed during the collapse phase.
> 
> Acked-by: Usama Arif <usama.arif@linux.dev>
> Signed-off-by: Nico Pache <npache@redhat.com>
> ---

Hi Andrew can you please append the following fixup to this commit!

Changes are described below. 

Thank you :)

commit ed96f34ba40ffd2d6a5b54abe46fd6b480fc89af
Author: Nico Pache <npache@redhat.com>
Date:   Tue May 26 05:54:04 2026 -0600

    fixup: add a clarifying comment and change warn_on
    
    Add a clarifying comment describing how the locking/mmu notifer is handled
    and change the WARN_ON_ONCE to VM_WARN_ON_ONCE per davids suggestion.
    
    Acked-by: David Hildenbrand (arm) <david@kernel.org>
    Signed-off-by: Nico Pache <npache@redhat.com>

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 9ab54397ae08..61d9494293b9 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -1283,6 +1283,13 @@ static enum scan_result collapse_huge_page(struct mm_struct *mm, unsigned long s
 	anon_vma_lock_write(vma->anon_vma);
 	anon_vma_locked = true;
 
+	/*
+	 * Only notify about the PTE range we will actually modify. While we
+	 * temporary unmap the whole PTE table for mTHP collapse, we'll remap
+	 * it later, leaving other PTEs effectively unmodified. The locks we
+	 * hold prevent anybody from stumbling over such temporarily unmapped
+	 * PTE tables.
+	 */
 	mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, mm, start_addr,
 				end_addr);
 	mmu_notifier_invalidate_range_start(&range);
@@ -1348,7 +1355,7 @@ static enum scan_result collapse_huge_page(struct mm_struct *mm, unsigned long s
 	 */
 	__folio_mark_uptodate(folio);
 	spin_lock(pmd_ptl);
-	WARN_ON_ONCE(!pmd_none(*pmd));
+	VM_WARN_ON_ONCE(!pmd_none(*pmd));
 	if (is_pmd_order(order)) {
 		pgtable = pmd_pgtable(_pmd);
 		pgtable_trans_huge_deposit(mm, pmd, pgtable);


>  mm/khugepaged.c | 93 +++++++++++++++++++++++++++++--------------------
>  1 file changed, 55 insertions(+), 38 deletions(-)
> 
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index fab35d318641..d64f42f66236 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -1214,34 +1214,36 @@ static enum scan_result alloc_charge_folio(struct folio **foliop, struct mm_stru
>   * while allocating a THP, as that could trigger direct reclaim/compaction.
>   * Note that the VMA must be rechecked after grabbing the mmap_lock again.
>   */
> -static enum scan_result collapse_huge_page(struct mm_struct *mm, unsigned long address,
> -		int referenced, int unmapped, struct collapse_control *cc)
> +static enum scan_result collapse_huge_page(struct mm_struct *mm, unsigned long start_addr,
> +		int referenced, int unmapped, struct collapse_control *cc,
> +		unsigned int order)
>  {
> +	const unsigned long pmd_addr = start_addr & HPAGE_PMD_MASK;
> +	const unsigned long end_addr = start_addr + (PAGE_SIZE << order);
>  	LIST_HEAD(compound_pagelist);
>  	pmd_t *pmd, _pmd;
> -	pte_t *pte;
> +	pte_t *pte = NULL;
>  	pgtable_t pgtable;
>  	struct folio *folio;
>  	spinlock_t *pmd_ptl, *pte_ptl;
>  	enum scan_result result = SCAN_FAIL;
>  	struct vm_area_struct *vma;
>  	struct mmu_notifier_range range;
> +	bool anon_vma_locked = false;
>  
> -	VM_BUG_ON(address & ~HPAGE_PMD_MASK);
> -
> -	result = alloc_charge_folio(&folio, mm, cc, HPAGE_PMD_ORDER);
> +	result = alloc_charge_folio(&folio, mm, cc, order);
>  	if (result != SCAN_SUCCEED)
>  		goto out_nolock;
>  
>  	mmap_read_lock(mm);
> -	result = hugepage_vma_revalidate(mm, address, true, &vma, cc,
> -					 HPAGE_PMD_ORDER);
> +	result = hugepage_vma_revalidate(mm, pmd_addr, /*expect_anon=*/ true,
> +					 &vma, cc, order);
>  	if (result != SCAN_SUCCEED) {
>  		mmap_read_unlock(mm);
>  		goto out_nolock;
>  	}
>  
> -	result = find_pmd_or_thp_or_none(mm, address, &pmd);
> +	result = find_pmd_or_thp_or_none(mm, pmd_addr, &pmd);
>  	if (result != SCAN_SUCCEED) {
>  		mmap_read_unlock(mm);
>  		goto out_nolock;
> @@ -1253,8 +1255,8 @@ static enum scan_result collapse_huge_page(struct mm_struct *mm, unsigned long a
>  		 * released when it fails. So we jump out_nolock directly in
>  		 * that case.  Continuing to collapse causes inconsistency.
>  		 */
> -		result = __collapse_huge_page_swapin(mm, vma, address, pmd,
> -						     referenced, HPAGE_PMD_ORDER);
> +		result = __collapse_huge_page_swapin(mm, vma, start_addr, pmd,
> +						     referenced, order);
>  		if (result != SCAN_SUCCEED)
>  			goto out_nolock;
>  	}
> @@ -1269,20 +1271,21 @@ static enum scan_result collapse_huge_page(struct mm_struct *mm, unsigned long a
>  	 * mmap_lock.
>  	 */
>  	mmap_write_lock(mm);
> -	result = hugepage_vma_revalidate(mm, address, true, &vma, cc,
> -					 HPAGE_PMD_ORDER);
> +	result = hugepage_vma_revalidate(mm, pmd_addr, /*expect_anon=*/ true,
> +					 &vma, cc, order);
>  	if (result != SCAN_SUCCEED)
>  		goto out_up_write;
>  	/* check if the pmd is still valid */
>  	vma_start_write(vma);
> -	result = check_pmd_still_valid(mm, address, pmd);
> +	result = check_pmd_still_valid(mm, pmd_addr, pmd);
>  	if (result != SCAN_SUCCEED)
>  		goto out_up_write;
>  
>  	anon_vma_lock_write(vma->anon_vma);
> +	anon_vma_locked = true;
>  
> -	mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, mm, address,
> -				address + HPAGE_PMD_SIZE);
> +	mmu_notifier_range_init(&range, MMU_NOTIFY_CLEAR, 0, mm, start_addr,
> +				end_addr);
>  	mmu_notifier_invalidate_range_start(&range);
>  
>  	pmd_ptl = pmd_lock(mm, pmd); /* probably unnecessary */
> @@ -1294,26 +1297,23 @@ static enum scan_result collapse_huge_page(struct mm_struct *mm, unsigned long a
>  	 * Parallel GUP-fast is fine since GUP-fast will back off when
>  	 * it detects PMD is changed.
>  	 */
> -	_pmd = pmdp_collapse_flush(vma, address, pmd);
> +	_pmd = pmdp_collapse_flush(vma, pmd_addr, pmd);
>  	spin_unlock(pmd_ptl);
>  	mmu_notifier_invalidate_range_end(&range);
>  	tlb_remove_table_sync_one();
>  
> -	pte = pte_offset_map_lock(mm, &_pmd, address, &pte_ptl);
> +	pte = pte_offset_map_lock(mm, &_pmd, start_addr, &pte_ptl);
>  	if (pte) {
> -		result = __collapse_huge_page_isolate(vma, address, pte, cc,
> -						      HPAGE_PMD_ORDER,
> -						      &compound_pagelist);
> +		result = __collapse_huge_page_isolate(vma, start_addr, pte, cc,
> +						      order, &compound_pagelist);
>  		spin_unlock(pte_ptl);
>  	} else {
>  		result = SCAN_NO_PTE_TABLE;
>  	}
>  
>  	if (unlikely(result != SCAN_SUCCEED)) {
> -		if (pte)
> -			pte_unmap(pte);
>  		spin_lock(pmd_ptl);
> -		BUG_ON(!pmd_none(*pmd));
> +		WARN_ON_ONCE(!pmd_none(*pmd));
>  		/*
>  		 * We can only use set_pmd_at when establishing
>  		 * hugepmds and never for establishing regular pmds that
> @@ -1321,21 +1321,24 @@ static enum scan_result collapse_huge_page(struct mm_struct *mm, unsigned long a
>  		 */
>  		pmd_populate(mm, pmd, pmd_pgtable(_pmd));
>  		spin_unlock(pmd_ptl);
> -		anon_vma_unlock_write(vma->anon_vma);
>  		goto out_up_write;
>  	}
>  
>  	/*
> -	 * All pages are isolated and locked so anon_vma rmap
> -	 * can't run anymore.
> +	 * For PMD collapse all pages are isolated and locked so anon_vma
> +	 * rmap can't run anymore. For mTHP collapse the PMD entry has been
> +	 * removed and not all pages are isolated and locked, so we must hold
> +	 * the lock to prevent neighboring folios from attempting to access
> +	 * this PMD until its reinstalled.
>  	 */
> -	anon_vma_unlock_write(vma->anon_vma);
> +	if (is_pmd_order(order)) {
> +		anon_vma_unlock_write(vma->anon_vma);
> +		anon_vma_locked = false;
> +	}
>  
>  	result = __collapse_huge_page_copy(pte, folio, pmd, _pmd,
> -					   vma, address, pte_ptl,
> -					   HPAGE_PMD_ORDER,
> -					   &compound_pagelist);
> -	pte_unmap(pte);
> +					   vma, start_addr, pte_ptl,
> +					   order, &compound_pagelist);
>  	if (unlikely(result != SCAN_SUCCEED))
>  		goto out_up_write;
>  
> @@ -1345,18 +1348,32 @@ static enum scan_result collapse_huge_page(struct mm_struct *mm, unsigned long a
>  	 * write.
>  	 */
>  	__folio_mark_uptodate(folio);
> -	pgtable = pmd_pgtable(_pmd);
> -
>  	spin_lock(pmd_ptl);
> -	BUG_ON(!pmd_none(*pmd));
> -	pgtable_trans_huge_deposit(mm, pmd, pgtable);
> -	map_anon_folio_pmd_nopf(folio, pmd, vma, address);
> +	WARN_ON_ONCE(!pmd_none(*pmd));
> +	if (is_pmd_order(order)) {
> +		pgtable = pmd_pgtable(_pmd);
> +		pgtable_trans_huge_deposit(mm, pmd, pgtable);
> +		map_anon_folio_pmd_nopf(folio, pmd, vma, pmd_addr);
> +	} else {
> +		/*
> +		 * set_ptes is called in map_anon_folio_pte_nopf with the
> +		 * pmd_ptl lock still held; this is safe as the PMD is expected
> +		 * to be none. The pmd entry is then repopulated below.
> +		 */
> +		map_anon_folio_pte_nopf(folio, pte, vma, start_addr, /*uffd_wp=*/ false);
> +		smp_wmb(); /* make PTEs visible before PMD. See pmd_install() */
> +		pmd_populate(mm, pmd, pmd_pgtable(_pmd));
> +	}
>  	spin_unlock(pmd_ptl);
>  
>  	folio = NULL;
>  
>  	result = SCAN_SUCCEED;
>  out_up_write:
> +	if (anon_vma_locked)
> +		anon_vma_unlock_write(vma->anon_vma);
> +	if (pte)
> +		pte_unmap(pte);
>  	mmap_write_unlock(mm);
>  out_nolock:
>  	if (folio)
> @@ -1536,7 +1553,7 @@ static enum scan_result collapse_scan_pmd(struct mm_struct *mm,
>  		/* collapse_huge_page expects the lock to be dropped before calling */
>  		mmap_read_unlock(mm);
>  		result = collapse_huge_page(mm, start_addr, referenced,
> -					    unmapped, cc);
> +					    unmapped, cc, HPAGE_PMD_ORDER);
>  		/* collapse_huge_page will return with the mmap_lock released */
>  		*lock_dropped = true;
>  	}

