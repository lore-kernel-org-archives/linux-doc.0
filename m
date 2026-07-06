Received: from out-179.mta1.migadu.com (out-179.mta1.migadu.com [95.215.58.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F6872EEE77
	for <linux-doc@vger.kernel.org>; Mon,  6 Jul 2026 17:09:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=95.215.58.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783357761; cv=none; b=dZmi+Uvp1iEHksTh5T0PVl6jGLOLFNJvjqklLWcjwX2svjrgQPOQIdb6VLEhy8o/lNr5TQioFDccCx1HWKl7QXFnxNZLOYc8mMUdpUTLDaIvoiV7YO/HlfMbFQoKsW6SMDjiZbVScwlz65ckVDqb0T2WlQjO1Q9uvNKhJaPL5zk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783357761; c=relaxed/simple;
	bh=uLpzbllAGwIQvPMDl8rbXGDnFn91nWvYDcQqQZnxUsA=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BkaX02aGSnw+OKfbK/kcjanI3vuY4kFIjNYSG4USrac3bOquORI9nRFaKbpi2on+3QRUuX2nm1wNpOLtglgl/VzOXQRAFSUCKcP9eRQZo2qutCjaH9BV/PrsGY5KbJKsDvuiAGxbYxCip3q53XDimbMTWiUwUsQMLoddcL+COY4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=d3jbBOgl; arc=none smtp.client-ip=95.215.58.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="d3jbBOgl"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783357757;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=jEEP6HfNVLyOFs0jzNs9G2ZgaVMSbs/x+hiGxEjlRwg=;
	b=d3jbBOglN5JIdR5PvfpA9r5yTSpxdTGLlTAddwub7ON2jgkA4BLg6CTNx3NX91nSSQuhKh
	ZvA5ZuWBvxyC5yOncbu3EI5qeCONFBOlhUsqgoG9lhfPiTAuhnwRd/BESEgtj3KotF31MJ
	pa4uj4gP7TL/bMZtUu9wbTfYwMD8XoU=
From: Usama Arif <usama.arif@linux.dev>
To: Nico Pache <npache@redhat.com>
Cc: Usama Arif <usama.arif@linux.dev>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Zi Yan <ziy@nvidia.com>,
	Baolin Wang <baolin.wang@linux.alibaba.com>,
	"Liam R. Howlett" <liam@infradead.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Dev Jain <dev.jain@arm.com>,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>,
	Vlastimil Babka <vbabka@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Suren Baghdasaryan <surenb@google.com>,
	Michal Hocko <mhocko@suse.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH 2/8] mm/khugepaged: extract young page check into collapse_is_young() helper
Date: Mon,  6 Jul 2026 10:09:09 -0700
Message-ID: <20260706170911.3430281-1-usama.arif@linux.dev>
In-Reply-To: <20260706154500.39178-3-npache@redhat.com>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On Mon,  6 Jul 2026 09:44:49 -0600 Nico Pache <npache@redhat.com> wrote:

> The change deduplicates the "is this PTE young enough to count as
> referenced" condition that was repeated in both
> __collapse_huge_page_isolate() and collapse_scan_pmd(), extracting it into
> a single inline helper function.
> 
> Also move the comment and use it as the function header. While we are at
> it, updated the comment to clarify that a young pte is a recently accessed
> one.
> 
> Signed-off-by: Nico Pache <npache@redhat.com>

Acked-by: Usama Arif <usama.arif@linux.dev>


> ---
>  mm/khugepaged.c | 35 +++++++++++++++++++----------------
>  1 file changed, 19 insertions(+), 16 deletions(-)
> 
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index b3985b854e77..48b008a3c891 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -675,6 +675,23 @@ static void release_pte_pages(pte_t *pte, pte_t *_pte,
>  	}
>  }
>  
> +/*
> + * collapse_is_young() - Check for enough young pte to justify collapsing
> + *
> + * If collapse was initiated by khugepaged, check that the page has been
> + * recently accessed (young pte) to justify collapsing the page.
> + *
> + * Return: true if the page has been recently accessed (young pte).
> + */
> +static inline bool collapse_is_young(struct collapse_control *cc, pte_t pteval,
> +	struct folio *folio, struct vm_area_struct *vma, unsigned long addr)
> +{
> +	return cc->is_khugepaged &&
> +	       (pte_young(pteval) || folio_test_young(folio) ||
> +		folio_test_referenced(folio) ||
> +		mmu_notifier_test_young(vma->vm_mm, addr));
> +}
> +
>  static enum scan_result __collapse_huge_page_isolate(struct vm_area_struct *vma,
>  		unsigned long start_addr, pte_t *pte, struct collapse_control *cc,
>  		unsigned int order, struct list_head *compound_pagelist)
> @@ -813,14 +830,7 @@ static enum scan_result __collapse_huge_page_isolate(struct vm_area_struct *vma,
>  		if (folio_test_large(folio))
>  			list_add_tail(&folio->lru, compound_pagelist);
>  next:
> -		/*
> -		 * If collapse was initiated by khugepaged, check that there is
> -		 * enough young pte to justify collapsing the page
> -		 */
> -		if (cc->is_khugepaged &&
> -		    (pte_young(pteval) || folio_test_young(folio) ||
> -		     folio_test_referenced(folio) ||
> -		     mmu_notifier_test_young(vma->vm_mm, addr)))
> +		if (collapse_is_young(cc, pteval, folio, vma, addr))
>  			referenced++;
>  	}
>  
> @@ -1769,14 +1779,7 @@ static enum scan_result collapse_scan_pmd(struct mm_struct *mm,
>  			goto out_unmap;
>  		}
>  
> -		/*
> -		 * If collapse was initiated by khugepaged, check that there is
> -		 * enough young pte to justify collapsing the page
> -		 */
> -		if (cc->is_khugepaged &&
> -		    (pte_young(pteval) || folio_test_young(folio) ||
> -		     folio_test_referenced(folio) ||
> -		     mmu_notifier_test_young(vma->vm_mm, addr)))
> +		if (collapse_is_young(cc, pteval, folio, vma, addr))
>  			referenced++;
>  	}
>  	if (cc->is_khugepaged &&
> -- 
> 2.54.0
> 
> 
