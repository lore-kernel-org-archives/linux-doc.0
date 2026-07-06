Received: from out-182.mta0.migadu.com (out-182.mta0.migadu.com [91.218.175.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AF652F1FEA
	for <linux-doc@vger.kernel.org>; Mon,  6 Jul 2026 17:08:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=91.218.175.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783357701; cv=none; b=OR+ieIBu0nVYgWkbUPA7wcdODWSPhzxM/B50pFMuhL39I7SIUAZ32DydftW8Prwc6/EJCyU95PzNGpSEveOAZl2ZdHfuL/KwB3M2uTQtzPTVba6HcZx+YzITdd5NBllgQJn3A2b84rS1A3vMTx3DzsLOg7mH+m4ObE79kzLlwLE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783357701; c=relaxed/simple;
	bh=7Xv7aLJ+YNZ5iN1Oo+ob+wkqjUtpQJrWPpt8G3sgKZ8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Wy5Gdxa7FlGVxU8YxM8wbkPFGBciEVmXqpnSKTlyBMb7rleiZA36aAs+QAyV7bAaz4icw8oWoZMn7Pc5E4G1vYxNa8wkc6mBCrG8m6qG9PtL7OWZOm8Wd0uX1qJf6FQBXaWKFzTrC+cMzINDmcVpJ4kRC0S7FSSk1LUHwDAWK2I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev; spf=pass smtp.mailfrom=linux.dev; dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b=YWhV4O5/; arc=none smtp.client-ip=91.218.175.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.dev header.i=@linux.dev header.b="YWhV4O5/"
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.dev; s=key1;
	t=1783357687;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=cjJeDZhpR70EaRE9MTzxl+iC6NvcG5zg6LLdCRsvLWI=;
	b=YWhV4O5/JSqoyxxc8P4VH9cUltAOYZa6czk/FoV7SIrN7O7giEOBrioKyDDyyv43d1WKW0
	xbMUY650Kh+kwmjGvvhfaN9HHZuN+Pci0jAgdxz9+gcnjnNDfYMN2dbdS4bgZrEfytUOEo
	fGsO8hsGH+anXKjoAnt2x3PAKOGf/1M=
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
Subject: Re: [PATCH 1/8] mm/khugepaged: refactor per-scan state clearing into collapse_control_init_scan()
Date: Mon,  6 Jul 2026 10:07:52 -0700
Message-ID: <20260706170755.3387204-1-usama.arif@linux.dev>
In-Reply-To: <20260706154500.39178-2-npache@redhat.com>
References: 
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Migadu-Flow: FLOW_OUT

On Mon,  6 Jul 2026 09:44:48 -0600 Nico Pache <npache@redhat.com> wrote:

> Extract the repeated clearing of node_load, alloc_nmask, and
> mthp_present_ptes into a helper to reduce duplication in
> collapse_scan_pmd() and collapse_scan_file(). Althought file scans do not
> current use the bitmap, they will in the future, and clearing it now is
> harmless.
> 
> Signed-off-by: Nico Pache <npache@redhat.com>
> ---
>  mm/khugepaged.c | 18 +++++++++++++-----
>  1 file changed, 13 insertions(+), 5 deletions(-)
> 
> diff --git a/mm/khugepaged.c b/mm/khugepaged.c
> index 617bca76db49..b3985b854e77 100644
> --- a/mm/khugepaged.c
> +++ b/mm/khugepaged.c
> @@ -628,6 +628,17 @@ void __khugepaged_exit(struct mm_struct *mm)
>  	}
>  }
>  
> +/*
> + * collapse_control_init_scan() - initialize/reset collapse_control variables
> + * that require being cleared once per-scan.
> + */

Probably don't need the above comment, but apart from that

Acked-by: Usama Arif <usama.arif@linux.dev>

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
> @@ -1616,9 +1627,7 @@ static enum scan_result collapse_scan_pmd(struct mm_struct *mm,
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
> @@ -2686,8 +2695,7 @@ static enum scan_result collapse_scan_file(struct mm_struct *mm,
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
> 
