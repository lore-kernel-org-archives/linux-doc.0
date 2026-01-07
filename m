Received: from mail-pl1-f176.google.com (mail-pl1-f176.google.com [209.85.214.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B32A43321A7
	for <linux-doc@vger.kernel.org>; Wed,  7 Jan 2026 15:21:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767799320; cv=none; b=LbugszN/vjvPWbGbV4ndR6hRlrNqC3KtozdMgpBYwsxFkILlYn/kTpDQijMUBaIj9lwl8CGqAKUeLH9Aix1KAhO3xBZY3gH3Yi5IY64VGpPyYc6waucoyLsNe2GzufjVCB2OsvudDN6ahB1A4cYKUf6IH12rBAkhVDW7nncp+Gg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767799320; c=relaxed/simple;
	bh=P51quK2PEeR7N5qjWdExzjkcsRHUy5F8IFwj6ZoDy3U=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=VrcXWMxJKg/RyzJhbePVEXmRAVQTIAY4rQUrLf2D9iET3Q8ax2SpuGkKsvvcaj3OXCA7c6ky3tj+rTT1w6xGZ8r0pqUUPZF/zAMbDize2gvu1Uqo1QLWxOMTCJMetzZcnXnVi5d6ujZNKdLvQQRmmXOg4hycyN9e+I75k1aP/T8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Y5d5EneQ; arc=none smtp.client-ip=209.85.214.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Y5d5EneQ"
Received: by mail-pl1-f176.google.com with SMTP id d9443c01a7336-2a35ae38bdfso72205ad.1
        for <linux-doc@vger.kernel.org>; Wed, 07 Jan 2026 07:21:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767799310; x=1768404110; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=av5/MRE4yF0I2OFo4G0L4h2O1Biqj9eGUDHDZYxFrTQ=;
        b=Y5d5EneQ5vPUEmM0vpYsrr++asxGMIMuMboXIO7gtD6BZO+KI1ghxVsFSnyBOlS6+B
         HXvrRMKy3u/WDR9TTUW4+DTs/jaxBP4Z5mDJvkXXlkHQNAlRY80nHXua+PdljqayVJLy
         Nil4SvFEelrXL0obc5iqly1exb4hqbPuEiU+PH55Iz4ptaqZavogIL1i0wPnQd/f6WpN
         qHORyH8k1ELZRDyam8GGteEg2gmC1R3FwT9z4/vd4GGFjJMgKbqPosTijeghHhIfQ/3B
         T/59Krjcggt2MAc5xtBTqjIr6y8B8hMnh4DW8BtYKXy+CzbiLRD1B5b/XLjX6MyyYTzL
         sewQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767799310; x=1768404110;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=av5/MRE4yF0I2OFo4G0L4h2O1Biqj9eGUDHDZYxFrTQ=;
        b=dENvUr/4sY2NdNtacMBZc2jambbAXt3XkCTPJtR/FTt6XptgheX7qZS7v6gDKYM+pU
         uKE7GRcrhuaNBgrkpzgFwTpkxTZL2Td2hEE8Bz7YFAn940Kv2ajt9SS6U2/HGVlfLhML
         8DQA+3fdr6FPQXeXLT4CuGdP/ztGA5z7340MTZ2vxqTVRINTKOjC6NpA+p8QakH3j5zR
         erhqEqHXWFTdpaiPOi6MPUVQQ/NDc0huNkOFfmSm/nF+IZqvW+a5jmQdEHOF3lGW7bC7
         1GAWEbYviA/fAru7CADqAEbvWfRIIvnL2THgGVanwedAGzFFb2ZUusuXS+b2HnjigshN
         nMhA==
X-Forwarded-Encrypted: i=1; AJvYcCWYIqZ8gLJ2sI0ApYHn3dvWujz3adfwxMA/Bqa4iolUNhq87aUKiL6VH7/n3utfU7mJJ1E/98LYBoY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzC0mzkuq2ERD0It2g2SL5HQKr7gTk/+9A8WpxTdGqEpnXhDeBF
	LgWLaZaK/WdJ3goXIkSovw0GA+ajTtiXwM4Vl+MKMOOIeoNdjH4d60grZfRFMtRZCw==
X-Gm-Gg: AY/fxX4hIKIcGXlNnEMQA4Cri7jSB9u3tyrIltmqZqtlzOooVVCg1yNcAzoGwwRqDqr
	5yi7XtOoGu9nzCSB7TdXrHe95b1XfMLGNwx5TyiIuG8657/LSyIEszpZ3NBDbp6u9edr+WSHwLj
	L5++zgvYkysDOBCH8JP/9PYsevHdMvBk5NTiKr6KEdMjJkuAh1jjs6AO8Ovm2FTC0euLWyqIyss
	HmFaBZ3YPcI2TyVZtIpqA6o/RUzHiessOo3lilBBoh/ocLZEhJ1tS9X/a+lF//+oPIA4gHgQGf8
	EV4IpK6ntSVDXb9UqH3NjMbv9LeU8d5pw0jYCOpxh9czoO+3s3LB6MQi4+5uvjqEVU30lIasQI8
	BEEmtht4v0B44a3nIZ1nrtWoDCNl6XJA0oGoCqUdDRXJNWKQFzIaJ8mvIZBIax1oyA/Vf7KpFvv
	o53RhAvdTg6b9JQtiT45MB50QcxxQKMpu1x4aIguUa5/SF7Ywl
X-Received: by 2002:a17:903:2c9:b0:298:45b1:6ef4 with SMTP id d9443c01a7336-2a3edbbee8fmr2891085ad.12.1767799309447;
        Wed, 07 Jan 2026 07:21:49 -0800 (PST)
Received: from google.com (222.245.187.35.bc.googleusercontent.com. [35.187.245.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a3e3c47221sm53772985ad.23.2026.01.07.07.21.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 07 Jan 2026 07:21:48 -0800 (PST)
Date: Wed, 7 Jan 2026 15:21:41 +0000
From: Pranjal Shrivastava <praan@google.com>
To: Mostafa Saleh <smostafa@google.com>
Cc: linux-mm@kvack.org, iommu@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, corbet@lwn.net, joro@8bytes.org,
	will@kernel.org, robin.murphy@arm.com, akpm@linux-foundation.org,
	vbabka@suse.cz, surenb@google.com, mhocko@suse.com,
	jackmanb@google.com, hannes@cmpxchg.org, ziy@nvidia.com,
	david@redhat.com, lorenzo.stoakes@oracle.com,
	Liam.Howlett@oracle.com, rppt@kernel.org, xiaqinxin@huawei.com,
	baolu.lu@linux.intel.com, rdunlap@infradead.org
Subject: Re: [PATCH v5 3/4] iommu: debug-pagealloc: Track IOMMU pages
Message-ID: <aV56BWisUQTMK2Gk@google.com>
References: <20260106162200.2223655-1-smostafa@google.com>
 <20260106162200.2223655-4-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260106162200.2223655-4-smostafa@google.com>

On Tue, Jan 06, 2026 at 04:21:59PM +0000, Mostafa Saleh wrote:
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
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  drivers/iommu/iommu-debug-pagealloc.c | 91 +++++++++++++++++++++++++++
>  1 file changed, 91 insertions(+)
> 
> diff --git a/drivers/iommu/iommu-debug-pagealloc.c b/drivers/iommu/iommu-debug-pagealloc.c
> index 1d343421da98..86ccb310a4a8 100644
> --- a/drivers/iommu/iommu-debug-pagealloc.c
> +++ b/drivers/iommu/iommu-debug-pagealloc.c
> @@ -29,19 +29,110 @@ struct page_ext_operations page_iommu_debug_ops = {
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

This might loop for too long when we're unmapping a big buffer (say 1GB)
which is backed by multiple 4K mappings (i.e. not mapped using large
mappings) it may hold the CPU for too long, per the above example:

1,073,741,824 / 4096 = 262,144 iterations each with an iova_to_phys walk
in a tight loop, could hold the CPU for a little too long and could
potentially result in soft lockups (painful to see in a debug kernel).
Since, iommu_unmap can be called in atomic contexts (i.e. interrupts,
spinlocks with pre-emption disabled) we cannot simply add cond_resched()
here as well.

Maybe we can cross that bridge once we get there, but if we can't solve
the latency now, it'd be nice to explicitly document this risk
(potential soft lockups on large unmaps) in the Kconfig or cmdline help text?

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
> +	if (unmapped == size)
> +		return;
> +
> +	/*
> +	 * If unmap failed, re-increment the refcount, but if it unmapped
> +	 * larger size, decrement the extra part.
> +	 */
> +	if (unmapped < size)
> +		__iommu_debug_update_iova(domain, iova + unmapped,
> +					  size - unmapped, true);
> +	else
> +		__iommu_debug_update_iova(domain, iova + size,
> +					  unmapped - size, false);
>  }

I'm a little concerned about this part, when we unmap more than requested,
the __iommu_debug_update_iova relies on 
iommu_iova_to_phys(domain, iova + off) to find the physical page to
decrement. However, since __iommu_debug_unmap_end is called *after* the
IOMMU driver has removed the mapping (in __iommu_unmap). Thus, the
iommu_iova_to_phys return 0 (fail) causing the loop in update_iova:
`if (!phys ...)` to silently continue.

Since the refcounts for the physical pages in the range:
[iova + size, iova + unmapped] are never decremented. Won't this result
in false positives (warnings about page leaks) when those pages are
eventually freed?

For example:

- A driver maps a 2MB region (512 x 4KB). All 512 pgs have refcount = 1.

- A driver / IOMMU-client calls iommu_unmap(iova, 4KB)

- unmap_begin(4KB) calls iova_to_phys, succeeds, and decrements the
  refcount for the 1st page to 0.

- __iommu_unmap calls the IOMMU driver. The driver (unable to split the
  block) zaps the entire 2MB range and returns unmapped = 2MB.

- unmap_end(size=4KB, unmapped=2MB) sees that more was unmapped than
  requested & attempts to decrement refcounts for the remaining 511 pgs

- __iommu_debug_update_iova is called for the remaining range, which
  ends up calling iommu_iova_to_phys. Since the mapping was destroyed,
  iova_to_phys returns 0.

- The loop skips the decrement causing the remaining 511 pages to leak
  with refcount = 1.

Thanks,
Praan
