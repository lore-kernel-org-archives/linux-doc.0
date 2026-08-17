Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3DAC23FBB6D;
	Mon, 17 Aug 2026 11:33:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786966407; cv=none; b=iv3V8vvXpWCrbINzuoWtVX/lqUxvK4eQEn6jOQS3Mzm0lxqNNg6vvlpBTRxq82LmA2ClpJoc9zNzNYVUCxiUJewIXBiIFGuvq89GwF5e8UDqkduYrAwrXQD7OBTBXDnHygNXq4m/zyjDi5pcI0BdZw89uAP6uvLXwmXro7z17Sg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786966407; c=relaxed/simple;
	bh=KSMotn4J5INq5i0I+GvFQkk/MXJ+PhKwD6/GBsyw3SY=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fWKEffr7OEMm2ihAo26eFmVRXZvHxadlUVQ/EUj3YIezuFTWM5dz1G2FmdNtNqByJtwFCV/Bep9D87Jw6GGeF8nDgB9FvoplwWYWTmJWX8MzDP2APX9KYJq71WEC9idrBm7NwDN8D7/fQMnBTvCgPi/A/jmwI7w64pVzhCTk4xw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LSlvKGye; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LSlvKGye"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 723F61F000E9;
	Mon, 17 Aug 2026 11:33:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786966397;
	bh=rooeZ8QU6qiTJ1cGCyiZI7tHS4KBiE0X6oZIZ8snEcA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=LSlvKGyeOtQd6EtwQ08LK7eerYTvIu2GijmsWNpdq1dIfFlOruBhleO1m1XcPBoV3
	 oXvkcy+ABqqeeMDMJijlBe66A6d7LluLyrV9vS4LmaRMu8fEulqddY8XGLDGSbbAeQ
	 6gto6EMlyVuCbDXiU76m8QfhC31wqx6LLaxy1Utfb+gE8lLwbQ/xHLN0vAc/sOYaSJ
	 ynkszPhai0xVCGLgSTDI0sVf/NbJCVAAW6+7zqSlxbOEm9P0q5OpZTuUlCAxibTg9Y
	 p55qCCoqzp/keYhgczSfa1wJ1gJ/BjyESFzqPMEOR6yEfsENjnlMWYWVjpsv/TgtK5
	 ELU8x42U+n9mw==
Date: Mon, 17 Aug 2026 12:32:58 +0100
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
Subject: Re: [PATCH v4 2/7] mm/khugepaged: extract reference check into
 folio_pte_referenced() helper
Message-ID: <aoLxMzu8-L7i_Xm0@lucifer>
References: <20260811-khugepaged_pte_refactor-v4-0-ddac39d61c4a@linux.dev>
 <20260811-khugepaged_pte_refactor-v4-2-ddac39d61c4a@linux.dev>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260811-khugepaged_pte_refactor-v4-2-ddac39d61c4a@linux.dev>

On Tue, Aug 11, 2026 at 06:48:34AM -0600, Nico Pache (Red Hat) wrote:
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

With below addressed nice cleanup so:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
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

As discussed please drop :)

> +static inline bool folio_pte_referenced(struct folio *folio,

Please remove inline, for any sane compiler (i.e. any we reasonably support)
this makes no difference for a static function within a compilation unit.

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
> --
> 2.55.0
>

--
Cheers, Lorenzo
