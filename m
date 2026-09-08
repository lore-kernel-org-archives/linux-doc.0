Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FECF382F23
	for <linux-doc@vger.kernel.org>; Tue,  8 Sep 2026 06:49:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788850146; cv=none; b=MLqynXQfKQ6PuFfdj+wHthiZs61thHl4z72k0XwfRosgK11qnnttiM5C5iBlbUneIKTDeCfpycVhQw5iPNZiHsNXiaEfCXDk9pdiZtkNynMIFc5+8zb3dU9z1XWYXgKSGV8YSjvtuUgb01E5dL9UaZYQ98e2SIY/ptRkI7IwuKI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788850146; c=relaxed/simple;
	bh=36oo2iTYzqAEUdCH6JpPl0537b7bFUtybehzo72K3Bo=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=AvKS8ED4m8ybVlNtdcMrbBnRNJk61vnkGljK7eq1eSR2Rj2XflHiemm/XtAco6W7lureCin76oLX0cF/ujhUraNkCKVeDh1MvYbIBaAIn6KPbEp8jbZo9TMQHaJOokJ0cI+kxNh2oJA8i6e6qI2qWWwUQoGs4MU57goULnwZhIY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=GodIgLic; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="GodIgLic"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 201601F00A3A;
	Tue,  8 Sep 2026 06:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788850145;
	bh=M+V0gQUek4roVUIMGP5SuDI1Fxh1F92NftXXq9vzYLk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GodIgLiculBgnr1L+B/xHVBA/lvCV0+GpGc5f33ROX4ultFHutW9kCTSGKHsBeTmN
	 D1sZCeS9pgzZLXBnMZQ0gAKQRJqWU2ROPjZydEUoxjGnRsUNpXcZ+sHFrV1teWQmhZ
	 Ll9mQf3FUTUk3jS6iI5bBCpoJxE+O9p9JhlQcbE16ODDCQY+JuejoU4b6oNV3mjOUl
	 CT9+XBB0Q8REvLmfdvrZSEyWn9EYNJKdzEW3roxzBrqPYlXw/xXyQONeefURgnR+YL
	 HCVP5D9EIkxOY0fjgqb5xtPRq3JYC7GY98qRTn12zUWSQqGqa8OlqLApyhsWuus/f2
	 329hnatAS22IA==
Date: Tue, 8 Sep 2026 09:48:57 +0300
From: Mike Rapoport <rppt@kernel.org>
To: Sang-Heon Jeon <ekffu200098@gmail.com>
Cc: Andrew Morton <akpm@linux-foundation.org>,
	Jonathan Corbet <corbet@lwn.net>, Jason Gunthorpe <jgg@ziepe.ca>,
	linux-doc@vger.kernel.org, linux-mm@kvack.org,
	Pratyush Yadav <pratyush@kernel.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Steven Rostedt <rostedt@goodmis.org>,
	Masami Hiramatsu <mhiramat@kernel.org>, Kees Cook <kees@kernel.org>
Subject: Re: [PATCH v2] memblock: reject non-page-aligned reserve_mem regions
Message-ID: <ap-v2XUH2Usov_RK@kernel.org>
References: <20260905141526.1546478-1-ekffu200098@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260905141526.1546478-1-ekffu200098@gmail.com>

(adding tracing and pstore folks)

On Sat, Sep 05, 2026 at 11:15:24PM +0900, Sang-Heon Jeon wrote:
> When map->start or map->size is not page aligned,
> reserved_mem_preserve() does not preserve the last one or two pages of
> the region from map->start to map->start + map->size.
> 
> After kexec the new kernel reserves only the preserved pages, so those
> pages are released to the buddy allocator. But
> reserve_mem_find_by_name() still returns the whole region including
> them, so they can be allocated while the subsystem is still using them.
> 
> So reject a reserve_mem= size or alignment that is not a multiple of
> PAGE_SIZE to keep both map->start and map->size page aligned.
> 
> Fixes: 8375b76517cb ("kho: replace kho_preserve_phys() with kho_preserve_pages()")
> Signed-off-by: Sang-Heon Jeon <ekffu200098@gmail.com>
> ---
> Changes from v1 [1]
> - reject non-page-aligned size and align instead of fix page count when
>   preserving reserve_mem regions
> 
> [1] https://lore.kernel.org/all/20260901165237.1025973-1-ekffu200098@gmail.com/
> ---
>  Documentation/admin-guide/kernel-parameters.txt | 3 +++
>  mm/memblock.c                                   | 9 +++++++--
>  2 files changed, 10 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index 68647ff4bdd2..f969085fffb7 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -6648,6 +6648,9 @@ Kernel parameters
>  
>  			reserve_mem=12M:4096:oops ramoops.mem_name=oops
>  
> +			Both the size and the alignment must be multiples of
> +			the page size.
> +
>  	reservetop=	[X86-32,EARLY]
>  			Format: nn[KMG]
>  			Reserves a hole at the top of the kernel virtual
> diff --git a/mm/memblock.c b/mm/memblock.c
> index 4302fb4ab85c..5e93b6da53e3 100644
> --- a/mm/memblock.c
> +++ b/mm/memblock.c
> @@ -2816,12 +2816,17 @@ static int __init reserve_mem(char *p)
>  	if (*p != ':')
>  		goto err_param;
>  
> +	if (!IS_ALIGNED(size, PAGE_SIZE) || !IS_ALIGNED(align, PAGE_SIZE)) {
> +		pr_err("reserve_mem: size and align must be multiples of the page size\n");
> +		return -EINVAL;
> +	}
> +
>  	/*
>  	 * memblock_phys_alloc() doesn't like a zero size align,
>  	 * but it is OK for this command to have it.
>  	 */
> -	if (align < SMP_CACHE_BYTES)
> -		align = SMP_CACHE_BYTES;
> +	if (!align)
> +		align = PAGE_SIZE;
>  
>  	name = p + 1;
>  	len = strlen(name);
> 
> base-commit: dbffc67777cd752ef3f77818109e1d2ef13e2949
> -- 
> 2.43.0
> 

-- 
Sincerely yours,
Mike.
