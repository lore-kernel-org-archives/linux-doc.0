Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1865026B760
	for <linux-doc@vger.kernel.org>; Fri,  9 Jan 2026 19:16:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1767986180; cv=none; b=lBrcGHWbPpNQUal6jJjC+3uHVTqiuXK2LCLsfPSOdiHCDbCcDz72sLVjtM3CgvLLsBcFxoMGN5fxCxklUfHK0ltVcCcfqIZRtCNOzLC43f48J+c9ufHrk4kseZA8nr2AikCDTQ3+VHOdU4zt2li3Tw+28Fut1xWnQCARiOBBSMc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1767986180; c=relaxed/simple;
	bh=1nPt0jMenK9foxrM3p/sw5FChCH1n394SDkI1BEWCNo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BZ03lev9+lrei0rBovu6lMm1zsBsX6AhNJDaTM+sEvmkQGMitrOqaLjmzmcpBG9+ruhG5+37VG9a+NjE+TkVXs3MVGqB/0XBRR0HwthPN9JrsFos36JXhKDWx3MhaJiZvAyt5MjLTy0xTFkZI0NCUan9tiaeYEph4SAug4qKhZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=yPTbktrq; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="yPTbktrq"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a35ae38bdfso12765ad.1
        for <linux-doc@vger.kernel.org>; Fri, 09 Jan 2026 11:16:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1767986177; x=1768590977; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=OY298V/mlr0e0R/jNCYCk/cEMiQwxaFCVZQ5rO28hR8=;
        b=yPTbktrqMBipzxWSUIYwgIgnnI4u8uDQo4MKz8bw46b/nLo38heV9zh3JXP5golVDC
         64IMtgh7Vi6bRuPuA52/XnozSyWOOgq1pLxbt5SplJlZFEk+X0EZDOIVEFSSMyURgoYN
         KU7b+IgnbSz3UPPmtL0lx0Cn4W5RAp+wVcb4bbaCbkgiBvmXO0VXoA7e1tYaBOY4/srP
         n2yGxX7qWw9MaIXk0U1mH73JgUnhFxr9zD8CsG5rDaD/qJi3pU7yrVw2Ngf5gjBdWu3s
         ZMIWB2o5CkxtrJ8YEiXwS/CfGB27eaVLRK5gva7X3TGqYVxN+qgnUVUU/tUfN5rODcAu
         DEKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1767986177; x=1768590977;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=OY298V/mlr0e0R/jNCYCk/cEMiQwxaFCVZQ5rO28hR8=;
        b=EyKiY9enKbfximBnteUIt+Mi7ECiowrHVnu4mmu0Br67PccazN6fp+QY0kh420puFP
         nkGXzN96PK1TlJ8MD1Xo2MzwhemAUVzoB0cqYLL5+G/PjQP1vxZDPNI3Fq60J0itdw0z
         AsJNyge1ZUR2G0cOOCyEsteGVg9ql4nNUfnBNME67hDcjTvt9GCTu5HPYYXgmHAgNv5z
         tLme1lKL+GBtAeXDnhoaPRecRkggoJINAGv1t2DKz2wg4c+K7sQ8EgG5DFUcXTwNVOeO
         r7AIuPzStxjIA5jPYaT0Ob+F8iT9TCdi2SCcdLzDQ4ee1jwVHyO9Uyhat2CmMquuPDzP
         NQOg==
X-Forwarded-Encrypted: i=1; AJvYcCWKS5xQ+J9Ns601/VGCU0MIymfnYiY+Wm5xdHa5SAjg4nO5PpFRvNTsJOA6fvL5VaHCJ4CjRaapDk8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTirl6z7n0g2tIyjNDVSEsKsO3ZegcT9MlJR0KM7uCoahl5PK7
	gRu4oregwpVFCSbUKd7hULPt0W+gu7W+gPqSddrxkWgcD3IgK1KLrACy1CYNfpBNLg==
X-Gm-Gg: AY/fxX5mqbcoPA65UcUwLyc0C8+8OtPWRTmUkLFKF9PvetWm4p9pvUxJSypeo9Z100U
	VaXGp9KNNLbUdf3z28tgpE1Oy/C539UUYUtumWG9hNs/7+3bKquQ6TZeFmiSf+Z4RUMU4IHEX06
	YULQE4flSL3Cf4a3zkbpih/y1kgMfoY5mtCKAF85GGhMHkCZgnwNVpMkGe2wxd7WCBoMNu6SmFd
	IzvVIA37uOeZuupYmXtu4NdQ51F2DfIS25ddv7wqEDqpkOSZqOGlWj1xbbfD0x77WFOq8EShpzt
	ZExL6VE3YvAUd+XcOy3qNmF9gmt/7SuzYcFRVlJGmxy5Yh26cwhXa1OciKe/5QXqtw2tV7RKKNS
	TnQlQqH7G35PcRXTfoHIxoLSAg0MzOQpNh5zauzUzxwoUhhKpCPpCAHXO6Nb2pdCJQc4H1rQeQb
	0uc9HNAvSn8ZWuqgSDrywHkK13AHf8ccq6f+Xn0V3HDGj0gu5K
X-Received: by 2002:a17:902:f690:b0:2a1:3cda:8e99 with SMTP id d9443c01a7336-2a4149da4e3mr360525ad.21.1767986176660;
        Fri, 09 Jan 2026 11:16:16 -0800 (PST)
Received: from google.com (222.245.187.35.bc.googleusercontent.com. [35.187.245.222])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-81d87955bb6sm4087620b3a.50.2026.01.09.11.16.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Jan 2026 11:16:16 -0800 (PST)
Date: Fri, 9 Jan 2026 19:16:08 +0000
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
Subject: Re: [PATCH v6 4/4] iommu: debug-pagealloc: Check mapped/unmapped
 kernel memory
Message-ID: <aWFT-Oh9bQsbqrXj@google.com>
References: <20260109171805.901995-1-smostafa@google.com>
 <20260109171805.901995-5-smostafa@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260109171805.901995-5-smostafa@google.com>

On Fri, Jan 09, 2026 at 05:18:05PM +0000, Mostafa Saleh wrote:
> Now, as the page_ext holds count of IOMMU mappings, we can use it to
> assert that any page allocated/freed is indeed not in the IOMMU.
> 
> The sanitizer doesn’t protect against mapping/unmapping during this
> period. However, that’s less harmful as the page is not used by the
> kernel.
> 
> Reviewed-by: Samiullah Khawaja <skhawaja@google.com>
> Reviewed-by: Lu Baolu <baolu.lu@linux.intel.com>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>  drivers/iommu/iommu-debug-pagealloc.c | 23 +++++++++++++++++++++++
>  include/linux/iommu-debug-pagealloc.h | 14 ++++++++++++++
>  include/linux/mm.h                    |  5 +++++
>  3 files changed, 42 insertions(+)
> 

Reviewed-by: Pranjal Shrivastava <praan@google.com>

Thanks,
Praan

> diff --git a/drivers/iommu/iommu-debug-pagealloc.c b/drivers/iommu/iommu-debug-pagealloc.c
> index 9eb49e1230ee..c080a38f45a4 100644
> --- a/drivers/iommu/iommu-debug-pagealloc.c
> +++ b/drivers/iommu/iommu-debug-pagealloc.c
> @@ -9,6 +9,7 @@
>  #include <linux/iommu-debug-pagealloc.h>
>  #include <linux/kernel.h>
>  #include <linux/page_ext.h>
> +#include <linux/page_owner.h>
>  
>  #include "iommu-priv.h"
>  
> @@ -73,6 +74,28 @@ static size_t iommu_debug_page_size(struct iommu_domain *domain)
>  	return 1UL << __ffs(domain->pgsize_bitmap);
>  }
>  
> +static bool iommu_debug_page_count(const struct page *page)
> +{
> +	unsigned int ref;
> +	struct page_ext *page_ext = page_ext_get(page);
> +	struct iommu_debug_metadata *d = get_iommu_data(page_ext);
> +
> +	ref = atomic_read(&d->ref);
> +	page_ext_put(page_ext);
> +	return ref != 0;
> +}
> +
> +void __iommu_debug_check_unmapped(const struct page *page, int numpages)
> +{
> +	while (numpages--) {
> +		if (WARN_ON(iommu_debug_page_count(page))) {
> +			pr_warn("iommu: Detected page leak!\n");
> +			dump_page_owner(page);
> +		}
> +		page++;
> +	}
> +}
> +
>  void __iommu_debug_map(struct iommu_domain *domain, phys_addr_t phys, size_t size)
>  {
>  	size_t off, end;
> diff --git a/include/linux/iommu-debug-pagealloc.h b/include/linux/iommu-debug-pagealloc.h
> index a439d6815ca1..46c3c1f70150 100644
> --- a/include/linux/iommu-debug-pagealloc.h
> +++ b/include/linux/iommu-debug-pagealloc.h
> @@ -13,6 +13,20 @@ DECLARE_STATIC_KEY_FALSE(iommu_debug_initialized);
>  
>  extern struct page_ext_operations page_iommu_debug_ops;
>  
> +void __iommu_debug_check_unmapped(const struct page *page, int numpages);
> +
> +static inline void iommu_debug_check_unmapped(const struct page *page, int numpages)
> +{
> +	if (static_branch_unlikely(&iommu_debug_initialized))
> +		__iommu_debug_check_unmapped(page, numpages);
> +}
> +
> +#else
> +static inline void iommu_debug_check_unmapped(const struct page *page,
> +					      int numpages)
> +{
> +}
> +
>  #endif /* CONFIG_IOMMU_DEBUG_PAGEALLOC */
>  
>  #endif /* __LINUX_IOMMU_DEBUG_PAGEALLOC_H */
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 6f959d8ca4b4..32205d2a24b2 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -36,6 +36,7 @@
>  #include <linux/rcuwait.h>
>  #include <linux/bitmap.h>
>  #include <linux/bitops.h>
> +#include <linux/iommu-debug-pagealloc.h>
>  
>  struct mempolicy;
>  struct anon_vma;
> @@ -4133,12 +4134,16 @@ extern void __kernel_map_pages(struct page *page, int numpages, int enable);
>  #ifdef CONFIG_DEBUG_PAGEALLOC
>  static inline void debug_pagealloc_map_pages(struct page *page, int numpages)
>  {
> +	iommu_debug_check_unmapped(page, numpages);
> +
>  	if (debug_pagealloc_enabled_static())
>  		__kernel_map_pages(page, numpages, 1);
>  }
>  
>  static inline void debug_pagealloc_unmap_pages(struct page *page, int numpages)
>  {
> +	iommu_debug_check_unmapped(page, numpages);
> +
>  	if (debug_pagealloc_enabled_static())
>  		__kernel_map_pages(page, numpages, 0);
>  }
> -- 
> 2.52.0.457.g6b5491de43-goog
> 
> 
