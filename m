Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 79C1F375AC3;
	Thu, 30 Jul 2026 14:45:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785422712; cv=none; b=NYTP7xn0RHIAnIpbtknwmosgrIXbtRO9GrPbnopX1Q7U8S1HllVLz5ZzRYa8c2GojxCi0dxM3UJ2iV9SQgu3UA8AJmkakDDZPCY2gq9WJj+LvOx/E7zGK6/7AE4XIiY2hikQwH7OWvCoiBTkmRlBh7ACdBsrlnoe/HwdpXqvsEw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785422712; c=relaxed/simple;
	bh=ZCt/v3zTQTZ248pqMi5eqtsAzR01qITTY91aShvZwP8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lCIV1oHUaqjpmFPkHmgcR8Y+vyyawr5FnYAyxIpsV4I6SEzk/XK/5rcNHkOZW12qHmJEPY9tNOoVdwcYGSnFZzkmNFC4NE9ZuFcQRgKoJXinFeoVxLZ91+L6RS/9WYh4HYQgm7qL6NZ375GFO3Pn8UIVHQiyFNTEOP6budmDKa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=AFgpgcap; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="AFgpgcap"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9E2F1F00A3E;
	Thu, 30 Jul 2026 14:45:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785422711;
	bh=i0PRcloglS2eplyMT6C9pAo053hn3uqwraPzhkmyKgw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=AFgpgcapG7OU/hcXjDFHKIFCFmcCMN72NvzEDyn9FOt4KAKFujQN+u156ODNvlN3I
	 Wuc+FqHYixDczgEfW1b5x8yBPuXZ6mFh4A2CfomEXNaQWfBp5ioVb+vhI8GmhrPZF5
	 WAh7ipsUZtbMJ3YbF0jqFD8Taa9GPhGIgd7C6fN2XxroAIlVnp6TriEoQ2oQn/jdaL
	 S+eKQ5iUAffXqeU4+4jpn5ikCh+Ip78uSznja1SdXSbxBFX+mHpz5RZXmakJIM15G+
	 TJZoquq+Zq3WP+m6Qlh8zY7MD/d97N48IxkHBmFuQ7MnR8RUUtXWq5+qhD/0pmjsQt
	 bM0XzPmA2O3CQ==
Date: Thu, 30 Jul 2026 15:44:51 +0100
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
To: Nico Pache <npache@redhat.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mm@kvack.org, Baolin Wang <baolin.wang@linux.alibaba.com>, 
	Usama Arif <usama.arif@linux.dev>, Andrew Morton <akpm@linux-foundation.org>, 
	David Hildenbrand <david@kernel.org>, Zi Yan <ziy@nvidia.com>, "Liam R. Howlett" <liam@infradead.org>, 
	Ryan Roberts <ryan.roberts@arm.com>, Dev Jain <dev.jain@arm.com>, Barry Song <baohua@kernel.org>, 
	Lance Yang <lance.yang@linux.dev>, Vlastimil Babka <vbabka@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
	Michal Hocko <mhocko@suse.com>, Jonathan Corbet <corbet@lwn.net>, 
	Shuah Khan <skhan@linuxfoundation.org>
Subject: Re: [PATCH v2 1/7] mm/khugepaged: refactor per-scan state clearing
 into collapse_control_init_scan()
Message-ID: <amtjMRG7sXlGsj_t@lucifer>
References: <20260715025941.1571316-1-npache@redhat.com>
 <20260715025941.1571316-2-npache@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260715025941.1571316-2-npache@redhat.com>

On Tue, Jul 14, 2026 at 08:59:30PM -0600, Nico Pache wrote:
> Extract the repeated clearing of node_load, alloc_nmask, and
> mthp_present_ptes into a helper to reduce duplication in
> collapse_scan_pmd() and collapse_scan_file(). Althought file scans do not
> current use the bitmap, they will in the future, and clearing it now is
> harmless.
>
> Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> Acked-by: Usama Arif <usama.arif@linux.dev>
> Signed-off-by: Nico Pache <npache@redhat.com>

LGTM so:

Reviewed-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>

> ---
>  mm/khugepaged.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
>
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index 55157567dc4c..6ec0812210b6 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -629,6 +629,13 @@ void __khugepaged_exit(struct mm_struct *mm)
>  	}
>  }
>
> +static void collapse_control_init_scan(struct collapse_control *cc)
> +{
> +	memset(cc->node_load, 0, sizeof(cc->node_load));
> +	nodes_clear(cc->alloc_nmask);
> +	bitmap_zero(cc->mthp_present_ptes, MAX_PTRS_PER_PTE);
> +}
> +
>  static void release_pte_folio(struct folio *folio)
>  {
>  	node_stat_mod_folio(folio,
> @@ -1617,9 +1624,7 @@ static enum scan_result collapse_scan_pmd(struct mm_struct *mm,
>  		goto out;
>  	}
>
> -	bitmap_zero(cc->mthp_present_ptes, MAX_PTRS_PER_PTE);
> -	memset(cc->node_load, 0, sizeof(cc->node_load));
> -	nodes_clear(cc->alloc_nmask);
> +	collapse_control_init_scan(cc);
>
>  	enabled_orders = collapse_possible_orders(vma, vma->vm_flags, tva_flags);
>
> @@ -2691,8 +2696,7 @@ static enum scan_result collapse_scan_file(struct mm_struct *mm,
>
>  	present = 0;
>  	swap = 0;
> -	memset(cc->node_load, 0, sizeof(cc->node_load));
> -	nodes_clear(cc->alloc_nmask);
> +	collapse_control_init_scan(cc);
>  	rcu_read_lock();
>  	xas_for_each(&xas, folio, start + HPAGE_PMD_NR - 1) {
>  		if (xas_retry(&xas, folio))
> --
> 2.54.0
>

Cheers, Lorenzo
