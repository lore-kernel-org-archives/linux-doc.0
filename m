Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38AED1DE8AD
	for <linux-doc@vger.kernel.org>; Fri,  9 Jan 2026 19:15:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767986128; cv=none; b=oNQatdPwMJ6OUXtWMfOtjgVct2sA6g8kdboYnjE0Us5/ep1mJcOpWaHjWQETrEmZ3xjXJb7tOlSeAxqA1kc3orCfA9CVowdX9rQGMVSKH//AfWeY41NpjBoR7lX9a1K1JkhOe0gCfcVE0BY23XLroOet7yl8tThyROknOpRN1iQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767986128; c=relaxed/simple;
	bh=gCmfukYXOYMCPHKWzeqGY4ZB2HY/C9NV4Gw5rQYU+S8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=M/fsqp0gkKw4jA3dEpExZBOXukoemwZXRyAPTHFRdMQ8xebppm2DOnmqfI1LDCot1msNOmBsJ9D0jY917f8MSoJJNmdt7f52f+6kT1dS2nQ3bA+onxPh9G70lSWYb7fA91vd0GeFiOEkSYikB0eeHdiDtkHr7sKhj3e8ORfC+g0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TyKKVyUA; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TyKKVyUA"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-2a0d06cfa93so12835ad.1
        for <linux-doc@vger.kernel.org>; Fri, 09 Jan 2026 11:15:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767986126; x=1768590926; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=1zIYiJ3AeStpupvGSL4Hm+WwwUI7TJ76QSjzNdMxPRw=;
        b=TyKKVyUAeANorje6FOM0miCb9XUslBX2Bt/OWqzuFudwp/pthHpZI1Dsbo16qVZxlQ
         r26NWfCf8Tenrw/Thrv5Kub3DjfxJ/xQov9rfUR1l6oOHI2FM43EAIUrWnLRpTs+ic5q
         KDPMZsZj6KH6eirB+fSEpv/w5fvxNAcNzeakyTnoBYWksxoNB76E4G588rCysHhiMwyy
         dlxUn/yjFE87y+yoBcOt2a+zVCKAIiJdA1Dq72eQD6/i0hVssPzFrD6KUUj78GTZ0OAt
         5IAJScn5FYk/OllkCIKCFW0hFBPK3y82N9CWa+WcCqwlwtUuLtrebYYrKbWIG7xU+qOB
         dzjA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767986126; x=1768590926;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=1zIYiJ3AeStpupvGSL4Hm+WwwUI7TJ76QSjzNdMxPRw=;
        b=nza5ue4qGY7pkVY2oR0WlavGNl6yu+5B0TTxguGefaCLeNguA7o185c4nFmqT1GYAM
         lB1m4xe3VdLPpcFGT5gE6417O5COjSXvlszyyuLWuu9A5i9OtUXslIozG5nVcbc5B/cO
         pS8pX+cxsurCZdn7h8JsTNDo546G/HkOwmIWZVxvNwsOmWRR1uSevecrpm2HPbTAbesZ
         yvgi3yAQYjVKHcxR6cXk9gaA2954EfGMZVd5GYlYUp0fG9qde2L1DnQRxHYFB/3GNvM5
         kh8ePTAPr0cytPXKNBnMPubMC/SX2uoMY/75fngN3rCHf6wLjBO/kBZkI/rEJceZ5VCs
         tvgQ==
X-Forwarded-Encrypted: i=1; AJvYcCUfG7PZVjNFkVIPxmrgzCw6a+bsCq7ATF2MLjTooJPmMDkMuvHWS8uEtuomohuegLbWF/Yh4rVlWb8=@vger.kernel.org
X-Gm-Message-State: AOJu0YzcZnz1jtdjCy8FSHz4RKyQD5oWFCJwVcaZnVYQ0OKfFBGXfPeh
	wMqDkiXHhlS2JNGj7ngj70izwal5qwbrPp5a9cMZxyXzF6N6Cey/FtmTofwL6cwGog==
X-Gm-Gg: AY/fxX4yKPZdJDUaM/EZv3O7aDDtuWh4x0RpV0DtOHMYvTZ+AtlbmwJuQTfA0nYe6FW
	XryF1JUnxE446iFJzbUhHFEwF0f55fGPkcbb7cbUjTPS6E7lEljW7qVdGZpdlWto3Fb3oAKXIbV
	1XkYEL+tz5XNdEcDLOWlfOba0OQGxirrEiM0OmiopSQp1MhNbeGLcxrbLcZGujRYQU5rFXnkwZr
	7QUlCInzLcJaUWiO3HrG9cLTTNUhhrU3UKKX8sODAyD9NruPw6c2zkSCSbpGGbsXYjCM0IPZyJC
	Fu/bmekL7U7Zx4qC2/0F5NGiU3Lam2WAHd0whRipB34zbQ4sskIV4Vg59VWMY+rjms6Hgsv649f
	Iu/WzIVZIBFxgeYUA+7bH+fAk0AGMH7PvH5erQR2r/mgGOU8fcDJg0idhWeJ5Z5F3FZq7b4sqnh
	Jl0C9jgCfEOqMBHSZyHyEcsrlkDC2HTPK7dInklq1hNDDrFQDk
X-Received: by 2002:a17:903:40ce:b0:292:b6a0:80df with SMTP id d9443c01a7336-2a414932d4bmr384275ad.10.1767986126281;
        Fri, 09 Jan 2026 11:15:26 -0800 (PST)
Received: from google.com (222.245.187.35.bc.googleusercontent.com. [35.187.245.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c3a2ecsm110215965ad.6.2026.01.09.11.15.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 11:15:25 -0800 (PST)
Date: Fri, 9 Jan 2026 19:15:18 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-mm@kvack.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, corbet@lwn.net, joro@8bytes.org,
	will@kernel.org, robin.murphy@arm.com, akpm@linux-foundation.org,
	vbabka@suse.cz, surenb@google.com, mhocko@suse.com,
	jackmanb@google.com, hannes@cmpxchg.org, ziy@nvidia.com,
	david@redhat.com, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, rppt@kernel.org, xiaqinxin@huawei.com,
	baolu.lu@linux.intel.com, rdunlap@infradead.org,
	Samiullah Khawaja <skhawaja@google.com>
Subject: Re: [PATCH v6 3/4] iommu: debug-pagealloc: Track IOMMU pages
Message-ID: <aWFTxlaGWy23R-Qs@google.com>
References: <20260109171805.901995-1-smostafa@google.com>
 <20260109171805.901995-4-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260109171805.901995-4-smostafa@google.com>

On Fri, Jan 09, 2026 at 05:18:04PM +0000, Mostafa Saleh wrote:
> Using the new calls, use an atomic refcount to track how many times
> a page is mapped in any of the IOMMUs.
> 
> For unmap we need to use iova_to_phys() to get the physical address
> of the pages.
> 
> We use the smallest supported page size as the granularity of tracking
> per domain.
> This is important as it is possible to map pages and unmap them with
> larger sizes (as in map_sg()) cases.
> 
> Reviewed-by: Samiullah Khawaja <skhawaja@google.com>
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  drivers/iommu/iommu-debug-pagealloc.c | 84 +++++++++++++++++++++++++++
>  1 file changed, 84 insertions(+)
> 
> diff --git a/drivers/iommu/iommu-debug-pagealloc.c b/drivers/iommu/iommu-debug-pagealloc.c
> index 1d343421da98..9eb49e1230ee 100644
> --- a/drivers/iommu/iommu-debug-pagealloc.c
> +++ b/drivers/iommu/iommu-debug-pagealloc.c
> @@ -29,19 +29,103 @@ struct page_ext_operations page_iommu_debug_ops = {
>  	.need = need_iommu_debug,
>  };
>  
> +static struct page_ext *get_iommu_page_ext(phys_addr_t phys)
> +{
> +	struct page *page = phys_to_page(phys);
> +	struct page_ext *page_ext = page_ext_get(page);
> +
> +	return page_ext;
> +}
> +
> +static struct iommu_debug_metadata *get_iommu_data(struct page_ext *page_ext)
> +{
> +	return page_ext_data(page_ext, &page_iommu_debug_ops);
> +}
> +
> +static void iommu_debug_inc_page(phys_addr_t phys)
> +{
> +	struct page_ext *page_ext = get_iommu_page_ext(phys);
> +	struct iommu_debug_metadata *d = get_iommu_data(page_ext);
> +
> +	WARN_ON(atomic_inc_return_relaxed(&d->ref) <= 0);
> +	page_ext_put(page_ext);
> +}
> +
> +static void iommu_debug_dec_page(phys_addr_t phys)
> +{
> +	struct page_ext *page_ext = get_iommu_page_ext(phys);
> +	struct iommu_debug_metadata *d = get_iommu_data(page_ext);
> +
> +	WARN_ON(atomic_dec_return_relaxed(&d->ref) < 0);
> +	page_ext_put(page_ext);
> +}
> +
> +/*
> + * IOMMU page size doesn't have to match the CPU page size. So, we use
> + * the smallest IOMMU page size to refcount the pages in the vmemmap.
> + * That is important as both map and unmap has to use the same page size
> + * to update the refcount to avoid double counting the same page.
> + * And as we can't know from iommu_unmap() what was the original page size
> + * used for map, we just use the minimum supported one for both.
> + */
> +static size_t iommu_debug_page_size(struct iommu_domain *domain)
> +{
> +	return 1UL << __ffs(domain->pgsize_bitmap);
> +}
> +
>  void __iommu_debug_map(struct iommu_domain *domain, phys_addr_t phys, size_t size)
>  {
> +	size_t off, end;
> +	size_t page_size = iommu_debug_page_size(domain);
> +
> +	if (WARN_ON(!phys || check_add_overflow(phys, size, &end)))
> +		return;
> +
> +	for (off = 0 ; off < size ; off += page_size) {
> +		if (!pfn_valid(__phys_to_pfn(phys + off)))
> +			continue;
> +		iommu_debug_inc_page(phys + off);
> +	}
> +}
> +
> +static void __iommu_debug_update_iova(struct iommu_domain *domain,
> +				      unsigned long iova, size_t size, bool inc)
> +{
> +	size_t off, end;
> +	size_t page_size = iommu_debug_page_size(domain);
> +
> +	if (WARN_ON(check_add_overflow(iova, size, &end)))
> +		return;
> +
> +	for (off = 0 ; off < size ; off += page_size) {
> +		phys_addr_t phys = iommu_iova_to_phys(domain, iova + off);
> +
> +		if (!phys || !pfn_valid(__phys_to_pfn(phys)))
> +			continue;
> +
> +		if (inc)
> +			iommu_debug_inc_page(phys);
> +		else
> +			iommu_debug_dec_page(phys);
> +	}
>  }
>  
>  void __iommu_debug_unmap_begin(struct iommu_domain *domain,
>  			       unsigned long iova, size_t size)
>  {
> +	__iommu_debug_update_iova(domain, iova, size, false);
>  }
>  
>  void __iommu_debug_unmap_end(struct iommu_domain *domain,
>  			     unsigned long iova, size_t size,
>  			     size_t unmapped)
>  {
> +	if ((unmapped == size) || WARN_ON_ONCE(unmapped > size))
> +		return;
> +

Looks good!

> +	/* If unmap failed, re-increment the refcount. */
> +	__iommu_debug_update_iova(domain, iova + unmapped,
> +				  size - unmapped, true);
>  }
>  

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks!

>  void iommu_debug_init(void)
> -- 
> 2.52.0.457.g6b5491de43-goog
> 
> 
