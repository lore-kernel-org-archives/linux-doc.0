Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5C9933FE34B
	for <linux-doc@vger.kernel.org>; Tue, 26 May 2026 14:38:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779806301; cv=none; b=rCz7MJCtxUq2+KVAHl5gSWMdIEEWVxEEXww3S369S6dK4TAeuNi9P1UTgmKkzfOv/QoJZel3RjVzCqNC9qRNpEcdp83XLEZ80oH72Gd0iga6BGA1IErO4LrpDbKitFg9IdzI35fzedjCuPISC/pYtadYuKVdsSGpnJ0XH3+VDBU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779806301; c=relaxed/simple;
	bh=dOBhh67uzTL6NPXqpEb0Gn9RfiUG0ml8NVOQ6gzIVLI=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=GRWxA9hxKmLlZRS2AsPIdsNG8ELhzGPj8OdbgD3KKJDhXCh32C3a2yFc8oLl6QZwjXnq5dLoNy4FtkZMdcQ/sjQzkAXtHOjUIi9FxBCDRoIsGn5bKYxl/R8uPCKuRqdgFUW69w8qbawqXx6S5WlnShYVq9mLHG3Acjn3gcLA0L4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=hmDGn4ps; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=cbrXiosU; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="hmDGn4ps";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="cbrXiosU"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1779806298;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=CPQhCilg9SmO+pAp9s9UTV9o3JLL/USiBgpYdpXlb7w=;
	b=hmDGn4ps8Vsw5Hfase8SiIlAiESsgT/GYDKrwl+zN/ahj3ssibPpeOBTHobOW4h0nwrhak
	6JQ1ShVJi6980fozl15nBI5NSRRLQOLLv55kQIsXQjqaxND7m9Kj4k69wvHBwBHhvhNx92
	AKXOvwVGoy+hLUYH87ckFB/TYw/FAtw=
Received: from mail-wr1-f70.google.com (mail-wr1-f70.google.com
 [209.85.221.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-39-PoVN0qwpPJSxU4nXVtVU-g-1; Tue, 26 May 2026 10:38:15 -0400
X-MC-Unique: PoVN0qwpPJSxU4nXVtVU-g-1
X-Mimecast-MFC-AGG-ID: PoVN0qwpPJSxU4nXVtVU-g_1779806293
Received: by mail-wr1-f70.google.com with SMTP id ffacd0b85a97d-45dbbbf8d57so12361227f8f.3
        for <linux-doc@vger.kernel.org>; Tue, 26 May 2026 07:38:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1779806293; x=1780411093; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=CPQhCilg9SmO+pAp9s9UTV9o3JLL/USiBgpYdpXlb7w=;
        b=cbrXiosUg134c7QLIdlLWIjCg1GmRjWYV50ChYdcRMO/5hBgLG5pPqyqMlLlj7Z1YL
         Qz10O35LF7LShD//URMm26jxbAnHXlAMwoq6/ft2trFolAIcy2lEQOcflsx0fvilZMdG
         HBuBdZxwNNL779q6+VFufQdaHHsSqeCbQzGlzELoSvA4jwiqHjz3aClkxEr/9OWCofzI
         rsUc8QIm4PeVlHIpbazeNznMBeUtds0e8rUP3dYkpUtmybuUfdUCfw+5o88+LRW6bWl4
         hmLEcoqkFJ35KSiKBBh45hN2t5gPgSfD2nX1YQJxQxMtKxqYx1KrAz/mMmwQaC/gb5ik
         pT9w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779806293; x=1780411093;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=CPQhCilg9SmO+pAp9s9UTV9o3JLL/USiBgpYdpXlb7w=;
        b=V7+FeXoj6GRHj+6S4OJCRmHeffju+yUVaLRtrPBLHSK96rCW+7RrgTCr02PUm7QXGs
         c7kcx5GhW8Vuk4KWhrX7Kmj4pBsSWK9xxvSK4LB/U2w1lZ8+w+AKH1BcG2bu+E5FSPu8
         5sYRJroTX30c/qtcZ4lHyeVMbQV/AgK7tvprDZBtR3jL4O/AbrSOPiwxbUGhhI1JjSDP
         tjxiZ/YICoyflOmjC/KA6p80JCCktIdbV50Nmtye7JjAND5aMM3Jzp6iQct8ErakD592
         CPODHG23Au1xyPAaPA55M52DJoX4Kn9z0FKvV8ddYMSTmc5sTGIUBk8M21iRqDt5fBB+
         ETGA==
X-Gm-Message-State: AOJu0YzV73GKWnDi3ZqrxjRe2Rj+9aoFAbAfWY2VZ1xlms2HB3xwGgIX
	82BFiu1535n/KCtt8vbq8xzHO/EPv5kfDslJl67FFsox0zzClyEDO28q+okmekzNlRWz77na/rJ
	q7qO1mN5UG0pP3Q7x8zTwlFes77EHT/kgvu3djFY3X5xjsjZL0iEyF5pgH3B4S1zEQHj301puCP
	WSfOBVbHrBAhL5Z1atX20xqiF+yxI57z7mmuT1yKbyPaTZ3w==
X-Gm-Gg: Acq92OHSBlhZHxrnv23sY8eiV05KkqGlEWh8/1xHK1nAGZPdBM+mBoDzGjM7DTbO6dR
	YSPqChvaQia3x8xydhsajY/f63j3+6nAFS5zx2IfKdPpdd/h1DB4T+1rMyCcJiJgesHnujuO/3j
	pgvEtTaLTmb3bZxyvmvTPoOaxLBb7zUcfZQF/Sl5UKW4SExT9bSkT7J83+l4hgQe1GiQebBIaDs
	RXzQDSq8gHQkgxyp29PgB3xu2HqMd+7Gzowcp7VPtyHaT7puAOEMCaVwSNeVC3Wrgj8DG/51rtu
	4lx0WH6kBijMinMtBQRzodGeTLYJjkuJPxgR/5wXO+kY5SmXJy3YWBwFSDXt4j+eIPX48bG4KeZ
	YopTU+iuGbD6hLknB7B5E7os=
X-Received: by 2002:a05:6000:29d3:b0:45c:1c89:b1c6 with SMTP id ffacd0b85a97d-45eb38bb149mr23274099f8f.33.1779806292958;
        Tue, 26 May 2026 07:38:12 -0700 (PDT)
X-Received: by 2002:a05:6000:29d3:b0:45c:1c89:b1c6 with SMTP id ffacd0b85a97d-45eb38bb149mr23273969f8f.33.1779806292197;
        Tue, 26 May 2026 07:38:12 -0700 (PDT)
Received: from [192.168.1.144] ([88.147.84.123])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45ed8873a35sm5348322f8f.14.2026.05.26.07.38.07
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 May 2026 07:38:11 -0700 (PDT)
Message-ID: <b5fa19c5-4b3e-40b8-8e78-fc31169a7a79@redhat.com>
Date: Tue, 26 May 2026 08:39:06 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH mm-unstable v18 04/14] mm/khugepaged: generalize
 __collapse_huge_page_* for mTHP support
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
 ying.huang@linux.alibaba.com, ziy@nvidia.com, zokeefe@google.com
References: <20260522150009.121603-1-npache@redhat.com>
 <20260522150009.121603-5-npache@redhat.com>
Content-Language: en-US
From: Nico Pache <npache@redhat.com>
In-Reply-To: <20260522150009.121603-5-npache@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 5/22/26 8:59 AM, Nico Pache wrote:
> generalize the order of the __collapse_huge_page_* and collapse_max_*
> functions to support future mTHP collapse.
> 
> The current mechanism for determining collapse with the
> khugepaged_max_ptes_none value is not designed with mTHP in mind. This
> raises a key design issue: if we support user defined max_pte_none values
> (even those scaled by order), a collapse of a lower order can introduces
> an feedback loop, or "creep", when max_ptes_none is set to a value greater
> than HPAGE_PMD_NR / 2. [1]
> 
> With this configuration, a successful collapse to order N will populate
> enough pages to satisfy the collapse condition on order N+1 on the next
> scan. This leads to unnecessary work and memory churn.
> 
> To fix this issue introduce a helper function that will limit mTHP
> collapse support to two max_ptes_none values, 0 and HPAGE_PMD_NR - 1.
> This effectively supports two modes: [2]
> 
> - max_ptes_none=0: never collapses if it encounters an empty PTE or a PTE
>   that maps the shared zeropage. Consequently, no memory bloat.
> - max_ptes_none=511 (on 4k pagesz): Always collapse to the highest
>   available mTHP order.
> 
> This removes the possibility of "creep", and a warning will be emitted if
> any non-supported max_ptes_none value is configured with mTHP enabled.
> Any intermediate value will default mTHP collapse to max_ptes_none=0.
> 
> mTHP collapse will not honor the khugepaged_max_ptes_shared or
> khugepaged_max_ptes_swap parameters, and will fail if it encounters a
> shared or swapped entry.
> 
> No functional changes in this patch; however it defines future behavior
> for mTHP collapse.

Hi Andrew,

Can you please append the following fixup to this commit.

Changes are described below but are very minor nits!

Thank you!

commit e3985903daa4fa77a27a632c1c2fa4c23aac9ad5
Author: Nico Pache <npache@redhat.com>
Date:   Tue May 26 05:40:03 2026 -0600

    fixup: cleanup collapse_max_ptes_none
    
    make max_ptes_none a const and cleanup the pr_warn_once
    
    Acked-by: David Hildenbrand (arm) <david@kernel.org>
    Signed-off-by: Nico Pache <npache@redhat.com>

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index e98ba5b15163..4c7e404b0f8d 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -360,7 +360,7 @@ static bool pte_none_or_zero(pte_t pte)
 static unsigned int collapse_max_ptes_none(struct collapse_control *cc,
 		struct vm_area_struct *vma, unsigned int order)
 {
-	unsigned int max_ptes_none = khugepaged_max_ptes_none;
+	const unsigned int max_ptes_none = khugepaged_max_ptes_none;
 
 	if (vma && userfaultfd_armed(vma))
 		return 0;
@@ -376,14 +376,13 @@ static unsigned int collapse_max_ptes_none(struct collapse_control *cc,
 	 */
 	if (max_ptes_none == KHUGEPAGED_MAX_PTES_LIMIT)
 		return (1 << order) - 1;
-	if (!max_ptes_none)
-		return 0;
 	/*
 	 * For mTHP collapse of values other than 0 or KHUGEPAGED_MAX_PTES_LIMIT,
 	 * emit a warning and return 0.
 	 */
-	pr_warn_once("mTHP collapse does not support max_ptes_none values"
-		     " other than 0 or %u, defaulting to 0.\n",
+	if (max_ptes_none)
+		pr_warn_once("mTHP collapse does not support max_ptes_none"
+		     " values other than 0 or %u, defaulting to 0.\n",
 		     KHUGEPAGED_MAX_PTES_LIMIT);
 	return 0;
 }


> 
> [1] - https://lore.kernel.org/all/e46ab3ab-a3d7-4fb7-9970-d0704bd5d05a@arm.com
> [2] - https://lore.kernel.org/all/37375ace-5601-4d6c-9dac-d1c8268698e9@redhat.com
> 
> Reviewed-by: Lance Yang <lance.yang@linux.dev>
> Co-developed-by: Dev Jain <dev.jain@arm.com>
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> Signed-off-by: Nico Pache <npache@redhat.com>
> ---
>  mm/khugepaged.c | 121 +++++++++++++++++++++++++++++++++++-------------
>  1 file changed, 88 insertions(+), 33 deletions(-)
> 
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index 116f39518948..e98ba5b15163 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -353,30 +353,52 @@ static bool pte_none_or_zero(pte_t pte)
>   * the shared zeropage for the given collapse operation.
>   * @cc: The collapse control struct
>   * @vma: The vma to check for userfaultfd
> + * @order: The folio order being collapsed to
>   *
>   * Return: Maximum number of empty/shared zeropage PTEs for the collapse operation
>   */
>  static unsigned int collapse_max_ptes_none(struct collapse_control *cc,
> -		struct vm_area_struct *vma)
> +		struct vm_area_struct *vma, unsigned int order)
>  {
> +	unsigned int max_ptes_none = khugepaged_max_ptes_none;
> +
>  	if (vma && userfaultfd_armed(vma))
>  		return 0;
>  	/* for MADV_COLLAPSE, allow any empty/shared zeropage PTEs */
>  	if (!cc->is_khugepaged)
>  		return HPAGE_PMD_NR;
> -	/* For all other cases respect the user defined maximum */
> -	return khugepaged_max_ptes_none;
> +	/* for PMD collapse, respect the user defined maximum */
> +	if (is_pmd_order(order))
> +		return max_ptes_none;
> +	/*
> +	 * for mTHP collapse with the sysctl value set to KHUGEPAGED_MAX_PTES_LIMIT,
> +	 * scale the maximum number of PTEs to the order of the collapse.
> +	 */
> +	if (max_ptes_none == KHUGEPAGED_MAX_PTES_LIMIT)
> +		return (1 << order) - 1;
> +	if (!max_ptes_none)
> +		return 0;
> +	/*
> +	 * For mTHP collapse of values other than 0 or KHUGEPAGED_MAX_PTES_LIMIT,
> +	 * emit a warning and return 0.
> +	 */
> +	pr_warn_once("mTHP collapse does not support max_ptes_none values"
> +		     " other than 0 or %u, defaulting to 0.\n",
> +		     KHUGEPAGED_MAX_PTES_LIMIT);
> +	return 0;
>  }
>  
>  /**
>   * collapse_max_ptes_shared - Calculate maximum allowed PTEs that map shared
>   * anonymous pages for the given collapse operation.
>   * @cc: The collapse control struct
> + * @order: The folio order being collapsed to
>   *
>   * Return: Maximum number of PTEs that map shared anonymous pages for the
>   * collapse operation
>   */
> -static unsigned int collapse_max_ptes_shared(struct collapse_control *cc)
> +static unsigned int collapse_max_ptes_shared(struct collapse_control *cc,
> +		unsigned int order)
>  {
>  	/*
>  	 * For MADV_COLLAPSE, do not restrict the number of PTEs that map shared
> @@ -384,6 +406,13 @@ static unsigned int collapse_max_ptes_shared(struct collapse_control *cc)
>  	 */
>  	if (!cc->is_khugepaged)
>  		return HPAGE_PMD_NR;
> +	/*
> +	 * for mTHP collapse do not allow collapsing anonymous memory pages that
> +	 * are shared between processes.
> +	 */
> +	if (!is_pmd_order(order))
> +		return 0;
> +	/* for PMD collapse, respect the user defined maximum */
>  	return khugepaged_max_ptes_shared;
>  }
>  
> @@ -391,11 +420,13 @@ static unsigned int collapse_max_ptes_shared(struct collapse_control *cc)
>   * collapse_max_ptes_swap - Calculate the maximum allowed non-present PTEs or the
>   * maximum allowed non-present pagecache entries for the given collapse operation.
>   * @cc: The collapse control struct
> + * @order: The folio order being collapsed to
>   *
>   * Return: Maximum number of non-present PTEs or the maximum allowed non-present
>   * pagecache entries for the collapse operation.
>   */
> -static unsigned int collapse_max_ptes_swap(struct collapse_control *cc)
> +static unsigned int collapse_max_ptes_swap(struct collapse_control *cc,
> +		unsigned int order)
>  {
>  	/*
>  	 * For MADV_COLLAPSE, do not restrict the number PTEs entries or
> @@ -403,6 +434,10 @@ static unsigned int collapse_max_ptes_swap(struct collapse_control *cc)
>  	 */
>  	if (!cc->is_khugepaged)
>  		return HPAGE_PMD_NR;
> +	/* for mTHP collapse do not allow any non-present PTEs or pagecache entries */
> +	if (!is_pmd_order(order))
> +		return 0;
> +	/* for PMD collapse, respect the user defined maximum */
>  	return khugepaged_max_ptes_swap;
>  }
>  
> @@ -596,10 +631,11 @@ static void release_pte_pages(pte_t *pte, pte_t *_pte,
>  
>  static enum scan_result __collapse_huge_page_isolate(struct vm_area_struct *vma,
>  		unsigned long start_addr, pte_t *pte, struct collapse_control *cc,
> -		struct list_head *compound_pagelist)
> +		unsigned int order, struct list_head *compound_pagelist)
>  {
> -	const unsigned int max_ptes_none = collapse_max_ptes_none(cc, vma);
> -	const unsigned int max_ptes_shared = collapse_max_ptes_shared(cc);
> +	const unsigned int max_ptes_none = collapse_max_ptes_none(cc, vma, order);
> +	const unsigned int max_ptes_shared = collapse_max_ptes_shared(cc, order);
> +	const unsigned long nr_pages = 1UL << order;
>  	struct page *page = NULL;
>  	struct folio *folio = NULL;
>  	unsigned long addr = start_addr;
> @@ -607,7 +643,7 @@ static enum scan_result __collapse_huge_page_isolate(struct vm_area_struct *vma,
>  	int none_or_zero = 0, shared = 0, referenced = 0;
>  	enum scan_result result = SCAN_FAIL;
>  
> -	for (_pte = pte; _pte < pte + HPAGE_PMD_NR;
> +	for (_pte = pte; _pte < pte + nr_pages;
>  	     _pte++, addr += PAGE_SIZE) {
>  		pte_t pteval = ptep_get(_pte);
>  		if (pte_none_or_zero(pteval)) {
> @@ -740,18 +776,18 @@ static enum scan_result __collapse_huge_page_isolate(struct vm_area_struct *vma,
>  }
>  
>  static void __collapse_huge_page_copy_succeeded(pte_t *pte,
> -						struct vm_area_struct *vma,
> -						unsigned long address,
> -						spinlock_t *ptl,
> -						struct list_head *compound_pagelist)
> +		struct vm_area_struct *vma, unsigned long address,
> +		spinlock_t *ptl, unsigned int order,
> +		struct list_head *compound_pagelist)
>  {
> -	unsigned long end = address + HPAGE_PMD_SIZE;
> +	const unsigned long nr_pages = 1UL << order;
> +	unsigned long end = address + (PAGE_SIZE << order);
>  	struct folio *src, *tmp;
>  	pte_t pteval;
>  	pte_t *_pte;
>  	unsigned int nr_ptes;
>  
> -	for (_pte = pte; _pte < pte + HPAGE_PMD_NR; _pte += nr_ptes,
> +	for (_pte = pte; _pte < pte + nr_pages; _pte += nr_ptes,
>  	     address += nr_ptes * PAGE_SIZE) {
>  		nr_ptes = 1;
>  		pteval = ptep_get(_pte);
> @@ -804,11 +840,10 @@ static void __collapse_huge_page_copy_succeeded(pte_t *pte,
>  }
>  
>  static void __collapse_huge_page_copy_failed(pte_t *pte,
> -					     pmd_t *pmd,
> -					     pmd_t orig_pmd,
> -					     struct vm_area_struct *vma,
> -					     struct list_head *compound_pagelist)
> +		pmd_t *pmd, pmd_t orig_pmd, struct vm_area_struct *vma,
> +		unsigned int order, struct list_head *compound_pagelist)
>  {
> +	const unsigned long nr_pages = 1UL << order;
>  	spinlock_t *pmd_ptl;
>  
>  	/*
> @@ -824,7 +859,7 @@ static void __collapse_huge_page_copy_failed(pte_t *pte,
>  	 * Release both raw and compound pages isolated
>  	 * in __collapse_huge_page_isolate.
>  	 */
> -	release_pte_pages(pte, pte + HPAGE_PMD_NR, compound_pagelist);
> +	release_pte_pages(pte, pte + nr_pages, compound_pagelist);
>  }
>  
>  /*
> @@ -844,16 +879,17 @@ static void __collapse_huge_page_copy_failed(pte_t *pte,
>   */
>  static enum scan_result __collapse_huge_page_copy(pte_t *pte, struct folio *folio,
>  		pmd_t *pmd, pmd_t orig_pmd, struct vm_area_struct *vma,
> -		unsigned long address, spinlock_t *ptl,
> +		unsigned long address, spinlock_t *ptl, unsigned int order,
>  		struct list_head *compound_pagelist)
>  {
> +	const unsigned long nr_pages = 1UL << order;
>  	unsigned int i;
>  	enum scan_result result = SCAN_SUCCEED;
>  
>  	/*
>  	 * Copying pages' contents is subject to memory poison at any iteration.
>  	 */
> -	for (i = 0; i < HPAGE_PMD_NR; i++) {
> +	for (i = 0; i < nr_pages; i++) {
>  		pte_t pteval = ptep_get(pte + i);
>  		struct page *page = folio_page(folio, i);
>  		unsigned long src_addr = address + i * PAGE_SIZE;
> @@ -872,10 +908,10 @@ static enum scan_result __collapse_huge_page_copy(pte_t *pte, struct folio *foli
>  
>  	if (likely(result == SCAN_SUCCEED))
>  		__collapse_huge_page_copy_succeeded(pte, vma, address, ptl,
> -						    compound_pagelist);
> +						    order, compound_pagelist);
>  	else
>  		__collapse_huge_page_copy_failed(pte, pmd, orig_pmd, vma,
> -						 compound_pagelist);
> +						 order, compound_pagelist);
>  
>  	return result;
>  }
> @@ -1042,16 +1078,20 @@ static enum scan_result check_pmd_still_valid(struct mm_struct *mm,
>   * Bring missing pages in from swap, to complete THP collapse.
>   * Only done if khugepaged_scan_pmd believes it is worthwhile.
>   *
> + * For mTHP orders the function bails on the first swap entry, because
> + * faulting pages back in during collapse could re-populate PTEs that
> + * push a later scan over the threshold for a higher-order collapse.
> + *
>   * Called and returns without pte mapped or spinlocks held.
>   * Returns result: if not SCAN_SUCCEED, mmap_lock has been released.
>   */
>  static enum scan_result __collapse_huge_page_swapin(struct mm_struct *mm,
> -		struct vm_area_struct *vma, unsigned long start_addr, pmd_t *pmd,
> -		int referenced)
> +		struct vm_area_struct *vma, unsigned long start_addr,
> +		pmd_t *pmd, int referenced, unsigned int order)
>  {
>  	int swapped_in = 0;
>  	vm_fault_t ret = 0;
> -	unsigned long addr, end = start_addr + (HPAGE_PMD_NR * PAGE_SIZE);
> +	unsigned long addr, end = start_addr + (PAGE_SIZE << order);
>  	enum scan_result result;
>  	pte_t *pte = NULL;
>  	spinlock_t *ptl;
> @@ -1083,6 +1123,19 @@ static enum scan_result __collapse_huge_page_swapin(struct mm_struct *mm,
>  		    pte_present(vmf.orig_pte))
>  			continue;
>  
> +		/*
> +		 * TODO: Support swapin without leading to further mTHP
> +		 * collapses. Currently bringing in new pages via swapin may
> +		 * cause a future higher order collapse on a rescan of the same
> +		 * range.
> +		 */
> +		if (!is_pmd_order(order)) {
> +			pte_unmap(pte);
> +			mmap_read_unlock(mm);
> +			result = SCAN_EXCEED_SWAP_PTE;
> +			goto out;
> +		}
> +
>  		vmf.pte = pte;
>  		vmf.ptl = ptl;
>  		ret = do_swap_page(&vmf);
> @@ -1203,7 +1256,7 @@ static enum scan_result collapse_huge_page(struct mm_struct *mm, unsigned long a
>  		 * that case.  Continuing to collapse causes inconsistency.
>  		 */
>  		result = __collapse_huge_page_swapin(mm, vma, address, pmd,
> -						     referenced);
> +						     referenced, HPAGE_PMD_ORDER);
>  		if (result != SCAN_SUCCEED)
>  			goto out_nolock;
>  	}
> @@ -1251,6 +1304,7 @@ static enum scan_result collapse_huge_page(struct mm_struct *mm, unsigned long a
>  	pte = pte_offset_map_lock(mm, &_pmd, address, &pte_ptl);
>  	if (pte) {
>  		result = __collapse_huge_page_isolate(vma, address, pte, cc,
> +						      HPAGE_PMD_ORDER,
>  						      &compound_pagelist);
>  		spin_unlock(pte_ptl);
>  	} else {
> @@ -1281,6 +1335,7 @@ static enum scan_result collapse_huge_page(struct mm_struct *mm, unsigned long a
>  
>  	result = __collapse_huge_page_copy(pte, folio, pmd, _pmd,
>  					   vma, address, pte_ptl,
> +					   HPAGE_PMD_ORDER,
>  					   &compound_pagelist);
>  	pte_unmap(pte);
>  	if (unlikely(result != SCAN_SUCCEED))
> @@ -1316,9 +1371,9 @@ static enum scan_result collapse_scan_pmd(struct mm_struct *mm,
>  		struct vm_area_struct *vma, unsigned long start_addr,
>  		bool *lock_dropped, struct collapse_control *cc)
>  {
> -	const unsigned int max_ptes_none = collapse_max_ptes_none(cc, vma);
> -	const unsigned int max_ptes_shared = collapse_max_ptes_shared(cc);
> -	const unsigned int max_ptes_swap = collapse_max_ptes_swap(cc);
> +	const unsigned int max_ptes_none = collapse_max_ptes_none(cc, vma, HPAGE_PMD_ORDER);
> +	const unsigned int max_ptes_shared = collapse_max_ptes_shared(cc, HPAGE_PMD_ORDER);
> +	const unsigned int max_ptes_swap = collapse_max_ptes_swap(cc, HPAGE_PMD_ORDER);
>  	pmd_t *pmd;
>  	pte_t *pte, *_pte;
>  	int none_or_zero = 0, shared = 0, referenced = 0;
> @@ -2372,8 +2427,8 @@ static enum scan_result collapse_scan_file(struct mm_struct *mm,
>  		unsigned long addr, struct file *file, pgoff_t start,
>  		struct collapse_control *cc)
>  {
> -	const unsigned int max_ptes_none = collapse_max_ptes_none(cc, NULL);
> -	const unsigned int max_ptes_swap = collapse_max_ptes_swap(cc);
> +	const unsigned int max_ptes_none = collapse_max_ptes_none(cc, NULL, HPAGE_PMD_ORDER);
> +	const unsigned int max_ptes_swap = collapse_max_ptes_swap(cc, HPAGE_PMD_ORDER);
>  	struct folio *folio = NULL;
>  	struct address_space *mapping = file->f_mapping;
>  	XA_STATE(xas, &mapping->i_pages, start);

