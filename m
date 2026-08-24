Received: from mta1.migadu.com (out-124.mta1.migadu.com [95.215.58.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7800D367293
	for <linux-doc@vger.kernel.org>; Mon, 24 Aug 2026 16:27:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787588859; cv=none; b=fZIWYf4jGcL32t0TGHmMoIUFeLYLIP1g2kTeBj67r5uAXzfHre9FihX1cYpF9OUhWh4bG9ZPXhBpW6/hpSOirueSGN2vxeWICdnufyD6VvhsPJuY7IXtxddbfkLIJXTWHhssUgZGIgTEO9vRRilSRe1/ki5uIh1gplBzY1t62/Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787588859; c=relaxed/simple;
	bh=sprgsfzrs/7IhK9Lar1M59wV3GF+sASkTuKp0ItDHos=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=gkduK8UbTvAFfOoEPQw+UtAR4IgtD4mRdgneb95BpyBoDHviOR0bo+5lDU6X3iBL3b93X3g4mTFgruMs4vgioE5TqosfJQfYvnd+2IYrRhAdeuZ1JfhhyeCLuDzHa0SVly0zEL4usdmJH0vFXKeF44BDiqUPWUnLFwBSwwjoAo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=IIWBQts0; arc=none smtp.client-ip=95.215.58.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="IIWBQts0"
X-Envelope-To: linux-doc@vger.kernel.org
DKIM-Signature: a=rsa-sha256; bh=sprgsfzrs/7IhK9Lar1M59wV3GF+sASkTuKp0ItDHos=;
 c=simple/simple; d=linux.dev;
 h=from:to:subject:date:message-id:mime-version:content-type; s=key1;
 t=1787588855; v=1; x=1788193655;
 b=IIWBQts0KmqdqBnqGUqXxFPTIcwy7ig1RMMtYy3mOph7Q1VR3v8bchDS1rc5GJiKsBnlYobV
 EwoH6BC/2oMr2OTNa7ZvEKWglK2lZpiDXRPum3uYrTEIjS5Nt0v+6yrBIPAoWKIa4IbWyG4kLVK
 FSL7//xp9CcWDbig2jBgU3k4=
X-Envelope-To: linux-doc@vger.kernel.org
Received: from [IPV6:2601:282:1e00:c920::a061] (2601:282:1e00:c920::a061)
	by smtp.migadu.com with ESMTPS id ba7b8166db5dd483;
	Mon, 24 Aug 2026 16:27:25 +0000
X-Mizu-Trace-ID: ba7b8166db5dd483
X-Migadu-Flow: FLOW_OUT
Message-ID: <9038f552-926b-4c4c-b023-69271f45e3d5@linux.dev>
Date: Mon, 24 Aug 2026 10:27:20 -0600
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/7] mm/khugepaged: extract reference check into
 folio_pte_referenced() helper
To: linux-mm@kvack.org, linux-kernel@vger.kernel.org,
 linux-doc@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>
Cc: David Hildenbrand <david@kernel.org>, Lorenzo Stoakes <ljs@kernel.org>,
 Zi Yan <ziy@nvidia.com>, Baolin Wang <baolin.wang@linux.alibaba.com>,
 "Liam R. Howlett" <liam@infradead.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>,
 Lance Yang <lance.yang@linux.dev>, Usama Arif <usama.arif@linux.dev>,
 Vlastimil Babka <vbabka@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Suren Baghdasaryan <surenb@google.com>, Michal Hocko <mhocko@suse.com>,
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
References: <20260811-khugepaged_pte_refactor-v4-0-ddac39d61c4a@linux.dev>
 <20260811-khugepaged_pte_refactor-v4-2-ddac39d61c4a@linux.dev>
Content-Language: en-US, en-ZM
From: "Nico Pache (Red Hat)" <nico.pache@linux.dev>
In-Reply-To: <20260811-khugepaged_pte_refactor-v4-2-ddac39d61c4a@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 8/11/26 6:48 AM, Nico Pache (Red Hat) wrote:
> This change deduplicates the "is this PTE/folio referenced enough to be
> considered for a collapse" condition that was repeated in both
> __collapse_huge_page_isolate() and collapse_scan_pmd(), extracting it into
> a single inline helper function.
> 
> Also move the comment and use it as the function header. While we are at
> it, updated the comment to clarify that a young pte is a recently accessed
> one.
> 
> Acked-by: Usama Arif <usama.arif@linux.dev>
> Signed-off-by: Nico Pache (Red Hat) <nico.pache@linux.dev>
> ---

Hi Andrew, 

Can you please append the following fixup!

Thank you :) 

commit 20fa354b27d9be91e12c3c3144f6b3d8d38542f3
Author: Nico Pache (Red Hat) <nico.pache@linux.dev>
Date:   Fri Aug 21 04:27:18 2026 -0600

    fixup! mm/khugepaged: extract reference check into folio_pte_referenced() helper
    
    Drop the trivial helper kerneldoc and inline marker per review.
    
    Signed-off-by: Nico Pache (Red Hat) <nico.pache@linux.dev>

diff --git a/mm/khugepaged.c b/mm/khugepaged.c
index 8babd4c97db6..34654d1c1259 100644
--- a/mm/khugepaged.c
+++ b/mm/khugepaged.c
@@ -672,13 +672,7 @@ static void release_pte_pages(pte_t *pte, pte_t *_pte,
 	}
 }
 
-/*
- * folio_pte_referenced() - Check if a folio or its PTE mapping was recently used
- *
- * Return: true if recent access was observed through either the folio state
- * or the current PTE mapping.
- */
-static inline bool folio_pte_referenced(struct folio *folio,
+static bool folio_pte_referenced(struct folio *folio,
 		struct vm_area_struct *vma, unsigned long addr, pte_t pteval)
 {
 	/* The folio was referenced previously ... */


>  mm/khugepaged.c | 32 ++++++++++++++++++--------------
>  1 file changed, 18 insertions(+), 14 deletions(-)
> 
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index 1e26ea97381a..8babd4c97db6 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -672,6 +672,22 @@ static void release_pte_pages(pte_t *pte, pte_t *_pte,
>  	}
>  }
>  
> +/*
> + * folio_pte_referenced() - Check if a folio or its PTE mapping was recently used
> + *
> + * Return: true if recent access was observed through either the folio state
> + * or the current PTE mapping.
> + */
> +static inline bool folio_pte_referenced(struct folio *folio,
> +		struct vm_area_struct *vma, unsigned long addr, pte_t pteval)
> +{
> +	/* The folio was referenced previously ... */
> +	if (folio_test_young(folio) || folio_test_referenced(folio))
> +		return true;
> +	/* ... or the PTE mapping was recently used */
> +	return pte_young(pteval) || mmu_notifier_test_young(vma->vm_mm, addr);
> +}
> +
>  static enum scan_result __collapse_huge_page_isolate(struct vm_area_struct *vma,
>  		unsigned long start_addr, pte_t *pte, struct collapse_control *cc,
>  		unsigned int order, struct list_head *compound_pagelist)
> @@ -810,14 +826,8 @@ static enum scan_result __collapse_huge_page_isolate(struct vm_area_struct *vma,
>  		if (folio_test_large(folio))
>  			list_add_tail(&folio->lru, compound_pagelist);
>  next:
> -		/*
> -		 * If collapse was initiated by khugepaged, check that there is
> -		 * enough young pte to justify collapsing the page
> -		 */
>  		if (cc->is_khugepaged &&
> -		    (pte_young(pteval) || folio_test_young(folio) ||
> -		     folio_test_referenced(folio) ||
> -		     mmu_notifier_test_young(vma->vm_mm, addr)))
> +		    folio_pte_referenced(folio, vma, addr, pteval))
>  			referenced++;
>  	}
>  
> @@ -1766,14 +1776,8 @@ static enum scan_result collapse_scan_pmd(struct mm_struct *mm,
>  			goto out_unmap;
>  		}
>  
> -		/*
> -		 * If collapse was initiated by khugepaged, check that there is
> -		 * enough young pte to justify collapsing the page
> -		 */
>  		if (cc->is_khugepaged &&
> -		    (pte_young(pteval) || folio_test_young(folio) ||
> -		     folio_test_referenced(folio) ||
> -		     mmu_notifier_test_young(vma->vm_mm, addr)))
> +		    folio_pte_referenced(folio, vma, addr, pteval))
>  			referenced++;
>  	}
>  	if (cc->is_khugepaged &&
> 

