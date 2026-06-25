Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 825FB367B94;
	Thu, 25 Jun 2026 01:10:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782349805; cv=none; b=a8dxZ8Po2g9wXTHzyHbNLbGffNHxSy+yA5g2dqMgWoSekxxUuxDMaYZibRYnCOiliGBzIiEL4fckexzKNR6DYTYNrV5FfrfCCBkBQ1ec+H0xlmgWfyoO/CN34iV/zBm8sPOIPEbD+JrwQPuFNX+PjYm2gr5fHA8VcE8gD8VhDpQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782349805; c=relaxed/simple;
	bh=JxhxpmYd0AJVuWt6iix71KwH4nGqgXsWvUE+5bGyIA0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=dsiKeGnn7wElPHWHsBkEvpGTolaIDKYJG3jD1mGJ1E4VllHWIPrLpZvtb2ugKi6fP4XN7IzkwkWyP6RdPpw8u3z8A6kOvKnOVxjNxNP2ZGsYGXm0EqbiWGwdiByFl37YQ+0o1nCIT7PlH0as9aOF5mRggsnhnGSENOlgDcJTWjE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=cNz23Aaz; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="cNz23Aaz"
Received: by linux.microsoft.com (Postfix, from userid 1152)
	id C240020B7166; Wed, 24 Jun 2026 18:09:59 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com C240020B7166
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1782349799;
	bh=fdL5ky5QslHZZ1UUPV0liQfja1fdH+v7qo0MRXJymE8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cNz23AazWeTVcCK/VsdMTXHj0/vMhFYqvCWcM2jNt78aW2J9c7lXuC4YIhd8tytmN
	 OCTt1p2w9BxaENZCnC8EfPoLQXJvTbemLU9Tl1t2Ouxg+4RS9z/gvOIkhvHSQUqOD1
	 ECeQ2FiSD9Pe1XWZXxMT9Co+YIM6HeizhfW7BIlA=
Date: Wed, 24 Jun 2026 18:09:59 -0700
From: Shyam Saini <shyamsaini@linux.microsoft.com>
To: Randy Dunlap <rdunlap@infradead.org>
Cc: linux-mm@kvack.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, rppt@kernel.org,
	akpm@linux-foundation.org, tgopinath@linux.microsoft.com,
	bboscaccy@linux.microsoft.com, kees@kernel.org, tony.luck@intel.com,
	gpiccoli@igalia.com, bp@alien8.de, peterz@infradead.org,
	feng.tang@linux.alibaba.com, dapeng1.mi@linux.intel.com,
	elver@google.com, enelsonmoore@gmail.com, kuba@kernel.org,
	lirongqing@baidu.com, ebiggers@kernel.org
Subject: Re: [RFC v2 PATCH] reserve_mem: add support for static memory
Message-ID: <ajx/51eB91fX3e3n@linuxonhyperv3.guj3yctzbm1etfxqx2vob5hsef.xx.internal.cloudapp.net>
References: <20260619062331.348789-1-shyamsaini@linux.microsoft.com>
 <3e206be0-3ef4-468f-b7e7-7bc03848b0d0@infradead.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3e206be0-3ef4-468f-b7e7-7bc03848b0d0@infradead.org>

Hi,


On 19 Jun 2026 11:35, Randy Dunlap wrote:
> Hi,
> 
> On 6/18/26 11:23 PM, Shyam Saini wrote:
> > reserve_mem relies on dynamic memory allocation, this limits the
> > usecase where memory is required to be preserved across the boots.
> > Eg: ramoops memory reservation on ACPI platforms
> > 
> > So add support to pass a pre-determined static address and reserve
> > memory at a specified location. This enables use case like ramoops
> > on ACPI platforms to reliably access ramoops region with previous
> > boot logs.
> > 
> > Also skip the parsing of <align> when static address is passed.
> > 
> > Example syntax for static address
> >  reserve_mem=4M@0x1E0000000:oops
> > 
> > Signed-off-by: Shyam Saini <shyamsaini@linux.microsoft.com>
> > ---
> > v1: https://lore.kernel.org/lkml/0eaf3be2-5121-48b7-aeed-196405c0a480@infradead.org/
> > v2: Fix code logic and incorporate Randy's suggestion
> 
> OK, you fixed a few typos.
> There are some bigger things that you seem to have ignored.

Thanks for calling this out. You are right that I did not address all
comments in v2.
My goal for v2 was to quickly fix the core logic issue and keep
discussion focused on the reserve_mem static address direction in this
RFC cycle. I should have stated that clearly.
 
> > ---
> >  .../admin-guide/kernel-parameters.txt         | 15 ++++++
> >  mm/memblock.c                                 | 47 +++++++++++++------
> >  2 files changed, 47 insertions(+), 15 deletions(-)
> > 
> > diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
> > index b5493a7f8f228..7e0baca564b97 100644
> > --- a/Documentation/admin-guide/kernel-parameters.txt
> > +++ b/Documentation/admin-guide/kernel-parameters.txt
> > @@ -6563,6 +6563,21 @@ Kernel parameters
> >  
> >  			reserve_mem=12M:4096:oops ramoops.mem_name=oops
> >  
> > +	reserve_mem=	[RAM]
> 
> [RAM] means "RAM disk support is enabled."
> Is that the case here?  Is "reserve_mem=" only for use in case
> RAM disk support is enabled?
> 
> ISTM that you need a new designator instead of RAM...
> or overload the use of RAM by adding more info near the top of
> Documentation/admin-guide/kernel-parameters.txt.

will address them in future iterations
> 
> > +			Format: nn[KMG]:<@offset>:<label>
> > +			Reserve physical memory at predetermined location and label it with
> > +			a name that other subsystems can use to access it. This is typically
> > +			used for systems that do not wipe the RAM, and this command
> > +			line will try to reserve the same physical memory on
> > +			soft reboots. Note, it is guaranteed to be the same
> > +			location unless some other early allocation, e.g.: crashkernel=256M
> > +                        (without static address) is reserved or overlaps this region.
> > +
> > +			The format is size:offset:label for example, to request
> > +			4 megabytes for ramoops at 0x1E0000000:
> > +
> > +			reserve_mem=4M@0x1E0000000:oops ramoops.mem_name=oops
> > +
> >  	reservetop=	[X86-32,EARLY]
> >  			Format: nn[KMG]
> >  			Reserves a hole at the top of the kernel virtual
> > diff --git a/mm/memblock.c b/mm/memblock.c
> > index 6349c48154f4b..c76cefa0a8a83 100644
> > --- a/mm/memblock.c
> > +++ b/mm/memblock.c
> > @@ -2721,6 +2721,7 @@ static int __init reserve_mem(char *p)
> >  	char *name;
> >  	char *oldp;
> >  	int len;
> > +	bool addr_is_static = false;
> >  
> >  	if (!p)
> >  		goto err_param;
> > @@ -2736,19 +2737,27 @@ static int __init reserve_mem(char *p)
> >  	if (!size || p == oldp)
> >  		goto err_param;
> >  
> > -	if (*p != ':')
> > -		goto err_param;
> > +	/* parse the static memory address */
> > +	if (*p == '@') {
> > +		start = memparse(p+1, &p);
> > +		addr_is_static = true;
> > +	}
> >  
> > -	align = memparse(p+1, &p);
> >  	if (*p != ':')
> >  		goto err_param;
> >  
> > -	/*
> > -	 * memblock_phys_alloc() doesn't like a zero size align,
> > -	 * but it is OK for this command to have it.
> > -	 */
> > -	if (align < SMP_CACHE_BYTES)
> > -		align = SMP_CACHE_BYTES;
> > +	if (!addr_is_static) {
> > +		align = memparse(p+1, &p);
> > +		if (*p != ':')
> > +			goto err_param;
> > +
> > +		/*
> > +		 * memblock_phys_alloc() doesn't like a zero size align,
> > +		 * but it is OK for this command to have it.
> > +		 */
> > +		if (align < SMP_CACHE_BYTES)
> > +			align = SMP_CACHE_BYTES;
> > +	}
> >  
> >  	name = p + 1;
> >  	len = strlen(name);
> > @@ -2772,14 +2781,22 @@ static int __init reserve_mem(char *p)
> >  	}
> >  
> >  	/* Pick previous allocations up from KHO if available */
> > -	if (reserve_mem_kho_revive(name, size, align))
> > +	if (!addr_is_static && reserve_mem_kho_revive(name, size, align))
> >  		return 1;
> >  
> > -	/* TODO: Allocation must be outside of scratch region */
> > -	start = memblock_phys_alloc(size, align);
> > -	if (!start) {
> > -		pr_err("reserve_mem: memblock allocation failed\n");
> > -		return -ENOMEM;
> 
> 		return 1;
> 
> > +	if (addr_is_static) {
> > +		if (memblock_reserve(start, size)) {
> > +			pr_err("reserve_mem: memblock reservation failed\n");
> > +			return -ENOMEM;
> 
> 			return 1;
> 
> > +		}
> > +
> > +	} else {
> > +		/* TODO: Allocation must be outside of scratch region */
> > +		start = memblock_phys_alloc(size, align);
> > +		if (!start) {
> > +			pr_err("reserve_mem: memblock allocation failed\n");
> > +			return -ENOMEM;
> 
> 			return 1;
> 
> > +		}
> >  	}
> >  
> >  	reserved_mem_add(start, size, name);
> 
> 
> __setup() functions return 1 for "yes, I recognized this string/option
> and attempted to handle it" or 0 for "This string/option is meaningless."
> There is no "return -Eerror".
> If you need that, you could consider using early_param() [see
> <linux/init.h>].
> 
same for this concern, will address them in next iteration.

Thanks,
Shyam
