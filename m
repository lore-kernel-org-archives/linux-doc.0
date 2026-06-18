Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2849E1DC985;
	Thu, 18 Jun 2026 23:02:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.137.202.133
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781823771; cv=none; b=jCQPnxrUIxo5hYzMV/kFTwkAtb/LdqAN/4xHx0m/dN+azZRoKOKnhhYyYSktH2h257BYG2TCD74fhXwNOtEWnml4u8YNzTjntkBoYKq+fbTrYhnxSrtCpJMwhI/MZAW+GqBkDOiDri4YM3utLsjxO8gCQHXz489FvtMx44RYanI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781823771; c=relaxed/simple;
	bh=LX18yvoow+3hFObCWX3FR88lCJ5XgNxb1+Kdz6KzsLY=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=g4+++GJ5Rh+GlyPzGUJW5P9c7faoZZkZ3apdYjZ1lAMoZqMZezs//TMvhMBaDMziLb2/17HnDy6mjsxch0/ozjTcm5XgzccCGPOujx3pVrNfdl3dDRtph6WbXwVifNT7wdJo0ZI8M7a/7cVIE/wSSBNH+IAv+q+n/UuFfNhOPTQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=cCKIzVae; arc=none smtp.client-ip=198.137.202.133
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="cCKIzVae"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=bombadil.20210309; h=Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Sender:Reply-To:Content-ID:Content-Description;
	bh=4j6dypNydyNZWpcmpTVOpkkjjc8wCdYie1REZ5aJwCU=; b=cCKIzVaeKyEvueahgMfXWkQCmj
	Qe72fL1qIvGWlRb4X/kTKZSinScDQVhcTXU7H53EQroz4X8/a67OMv5i2LK6xtzX/5mfLyTeFE280
	rlSXvZeoDLLbTWwckGWZI/purqhGqXzcO4mRzdNKfvrPQ24QSFkM0C1L+ubryKPYap3x2J1wJ5xds
	wbkWWW8z81kUanG1PzqTakan53bNvm2nIYsN8I+D8jzVs1C4dCEYVgw5HkvPlg1hP5l6UmLUgsN5R
	1B6lVQyi2HcgnjxvBzaidSD0GQeX5r8IQXIz0v/ORHTB5Ipz/IKvxmHH14kKFVAGmu0RE5jS0tgHZ
	WdigT2QQ==;
Received: from [50.53.43.113] (helo=[192.168.254.34])
	by bombadil.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1waLky-00000001r4w-26uA;
	Thu, 18 Jun 2026 23:02:44 +0000
Message-ID: <0eaf3be2-5121-48b7-aeed-196405c0a480@infradead.org>
Date: Thu, 18 Jun 2026 16:02:43 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH] reserve_mem: add support for static memory
To: Shyam Saini <shyamsaini@linux.microsoft.com>, linux-mm@kvack.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: rppt@kernel.org, akpm@linux-foundation.org, kees@kernel.org,
 tony.luck@intel.com, gpiccoli@igalia.com, bp@alien8.de,
 peterz@infradead.org, feng.tang@linux.alibaba.com,
 dapeng1.mi@linux.intel.com, elver@google.com, enelsonmoore@gmail.com,
 kuba@kernel.org, lirongqing@baidu.com, ebiggers@kernel.org
References: <20260618224018.117978-1-shyamsaini@linux.microsoft.com>
Content-Language: en-US
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20260618224018.117978-1-shyamsaini@linux.microsoft.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit



On 6/18/26 3:40 PM, Shyam Saini wrote:
> reserve_mem relies on dynamic memory allocation, this limits the
> usecase where memory and its address is required to be preserved
> across the boots. Eg: ramoops memory reservation on ACPI platforms
> 
> So add support to pass a pre-determined static address and reserve
> memory at this specified address. This enables use case like ramoops
> on ACPI platforms to reliably access ramoops region across the boots.
> 
> Also skip parsing of "align" parameter when static address is passed.
> 
> Example syntax for static address
>  reserve_mem=4M@0x1E0000000:oops ramoops.mem_name=oops
> 
> Signed-off-by: Shyam Saini <shyamsaini@linux.microsoft.com>
> ---
>  .../admin-guide/kernel-parameters.txt         | 15 ++++++
>  mm/memblock.c                                 | 48 +++++++++++++------
>  2 files changed, 49 insertions(+), 14 deletions(-)
> 
> diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> index b5493a7f8f228..7e0baca564b97 100644
> --- a/Documentation/admin-guide/kernel-parameters.txt
> +++ b/Documentation/admin-guide/kernel-parameters.txt
> @@ -6563,6 +6563,21 @@ Kernel parameters
>  
>  			reserve_mem=12M:4096:oops ramoops.mem_name=oops
>  
> +	reserve_mem=	[RAM]

According to this file (kernel-parameters.txt), "RAM" means that this
option applies when "RAM disk support is enabled."
Is that correct here?
My guess is that it's incorrect for the other (existing) "reserve_mem=" also.


> +			Format: nn[KMG]:<@offset>:<label>
> +			Reserve physical memory at pre-determined location and label it with

Preferably		                           predetermined

> +			a name that other subsystems can use to access it. This is typically
> +			used for systems that do not wipe the RAM, and this command
> +			line will try to reserve the same physical memory on
> +			soft reboots. Note, it is guaranteed to be the same
> +			location unless some other early allocation for eg: crashkernel=256M

			                                 allocation, e.g.: crashkernel=256M

> +                        (without static address) is reserved or overlapps this region.

			                                           overlaps

> +
> +			The format is size:offset:label for example, to request
> +			4 megabytes for ramoops at 0x1E0000000:
> +
> +			reserve_mem=4M@0x1E0000000:oops ramoops.mem_name=oops
> +
>  	reservetop=	[X86-32,EARLY]
>  			Format: nn[KMG]
>  			Reserves a hole at the top of the kernel virtual
> diff --git a/mm/memblock.c b/mm/memblock.c
> index 6349c48154f4b..79f1f806ea364 100644
> --- a/mm/memblock.c
> +++ b/mm/memblock.c
> @@ -2721,6 +2721,7 @@ static int __init reserve_mem(char *p)
>  	char *name;
>  	char *oldp;
>  	int len;
> +	bool addr_is_static = false;
>  
>  	if (!p)
>  		goto err_param;
> @@ -2739,16 +2740,27 @@ static int __init reserve_mem(char *p)
>  	if (*p != ':')
>  		goto err_param;
>  
> -	align = memparse(p+1, &p);
> +	/* parse the static memory address */
> +	if (*p == '@') {
> +		start = memparse(p+1, &p);
> +		addr_is_static = true;
> +	}
> +
>  	if (*p != ':')
>  		goto err_param;
>  
> -	/*
> -	 * memblock_phys_alloc() doesn't like a zero size align,
> -	 * but it is OK for this command to have it.
> -	 */
> -	if (align < SMP_CACHE_BYTES)
> -		align = SMP_CACHE_BYTES;
> +	if (!addr_is_static) {
> +		align = memparse(p+1, &p);
> +		if (*p != ':')
> +			goto err_param;
> +
> +		/*
> +		 * memblock_phys_alloc() doesn't like a zero size align,
> +		 * but it is OK for this command to have it.
> +		 */
> +		if (align < SMP_CACHE_BYTES)
> +			align = SMP_CACHE_BYTES;
> +	}
>  
>  	name = p + 1;
>  	len = strlen(name);
> @@ -2772,16 +2784,24 @@ static int __init reserve_mem(char *p)
>  	}
>  
>  	/* Pick previous allocations up from KHO if available */
> -	if (reserve_mem_kho_revive(name, size, align))
> +	if (!addr_is_static && reserve_mem_kho_revive(name, size, align))
>  		return 1;
>  
> -	/* TODO: Allocation must be outside of scratch region */
> -	start = memblock_phys_alloc(size, align);
> -	if (!start) {
> -		pr_err("reserve_mem: memblock allocation failed\n");
> -		return -ENOMEM;
> -	}
> +	if (addr_is_static) {
> +		if (memblock_reserve(start, size)) {
> +			pr_err("reserve_mem: memblock reservation failed\n");
> +			return -ENOMEM;
> +		}
> +
> +	} else {
> +		/* TODO: Allocation must be outside of scratch region */
> +		start = memblock_phys_alloc(size, align);
> +		if (!start) {
> +			pr_err("reserve_mem: memblock allocation failed\n");
> +			return -ENOMEM;
> +		}
>  
> +	}
>  	reserved_mem_add(start, size, name);
>  
>  	return 1;

__setup() functions return 1 for "yes, I handled this option" (even if there
were errors in it) and 0 for failure ("no idea what this string/option means").
These -ENOMEM, -EINVAL, -EBUSY (in this function) are non-zero so they look like
success and should not be here.

-- 
~Randy

