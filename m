Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6FE6D25F7B9;
	Mon,  9 Feb 2026 15:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770652136; cv=none; b=We2frvmMwdpn1P+PbG2xZ0l5Iv2Iqrsn87DIDOtovzcA1IyZBylasJKjSKmke/dvvLdE5jmst4WzmBZ3x36fP7gFnC3nTKXyHYtm/07YC0fN7wVav7A7zLWuGzWobQWk7MHop/M0ZZxxIy0ObhTJusudLba9RJcxgQ71euGsnko=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770652136; c=relaxed/simple;
	bh=FMtcv9Ix8+Vr6nzGWRRsgTCLzlhgG8J1kiyA3JCne8M=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=SzCz7AMI3F1SlK8ZkGccR0Qm9Hx1vc/SThMNJsppuvheXVY+spxqZLBbiA66awLYRAra/9eeacv5OnBkNlagn4VvYkYa7fPiCaS1uooHG7co5M0+A+PUDNKv9yjvfwwqR3V0872xhrLCpSz6GVONqkVn5i2uouqQwLMJTsS1kLA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=none smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=nmOjylNv; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="nmOjylNv"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=D4nGYWiGOfNXdVY+uWCPGlOgSj0sGcvKWLRnuu+D02Y=; b=nmOjylNvplNe7giU4xqfOfUmJU
	eHbhPCPsVxTvU9KnVqo6OBcmtBhVwhKTegmz1FTX0bzkabYdyeTYS1NF1oFA+ixhLXso+4CSwgm8G
	GpIB8zAK4rgSbf46I/s/9h//HxjyX3oW+H3n/+78v2JrcZqGyle02Xw1CILtpPmZw9ogNAUYlDbys
	l+a8NkdFYBnkcjrKV2s9EatUmDxRICT09+ZXNmTB0pCENAx6vLNMzO31GUqxrFa0EvOI43iF0mQA5
	gxjNtwSKm7kOfAoLmGd1sF4/Xszn7tteYcLH/eFB4h3rBA1SgrljlTzQUvMgRsBKmhEqzEzctpCxB
	z+4+6lRA==;
Received: from willy by casper.infradead.org with local (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpTVN-00000009iFw-0nJs;
	Mon, 09 Feb 2026 15:48:53 +0000
Date: Mon, 9 Feb 2026 15:48:52 +0000
From: Matthew Wilcox <willy@infradead.org>
To: Min-Hsun Chang <chmh0624@gmail.com>
Cc: corbet@lwn.net, akpm@linux-foundation.org, linux-doc@vger.kernel.org,
	linux-mm@kvack.org, linux-kernel@vger.kernel.org,
	Linus Walleij <linus.walleij@linaro.org>
Subject: Re: [PATCH v2] Docs/mm: fix typos and grammar in page_tables.rst
Message-ID: <aYoB5JatO60ouaMD@casper.infradead.org>
References: <20260209145603.96664-1-chmh0624@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260209145603.96664-1-chmh0624@gmail.com>

On Mon, Feb 09, 2026 at 10:56:03PM +0800, Min-Hsun Chang wrote:
> Correct several spelling and grammatical errors in the page tables
> documentation. This includes:
> - Fixing "a address" to "an address"
> - Fixing "pfs" to "pfns"
> - Correcting the possessive "Torvald's" to "Torvalds's"
> - Fixing "instruction that want" to "instruction that wants"
> - Fixing "code path" to "code paths"

It'd be polite to cc the original author.  Added.

(also see one question below)

Reviewed-by: Matthew Wilcox (Oracle) <willy@infradead.org>

> Signed-off-by: Min-Hsun Chang <chmh0624@gmail.com>
> ---
>  Documentation/mm/page_tables.rst | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/mm/page_tables.rst b/Documentation/mm/page_tables.rst
> index e7c69cc32493..126c87628250 100644
> --- a/Documentation/mm/page_tables.rst
> +++ b/Documentation/mm/page_tables.rst
> @@ -26,9 +26,9 @@ Physical memory address 0 will be *pfn 0* and the highest pfn will be
>  the last page of physical memory the external address bus of the CPU can
>  address.
>  
> -With a page granularity of 4KB and a address range of 32 bits, pfn 0 is at
> +With a page granularity of 4KB and an address range of 32 bits, pfn 0 is at
>  address 0x00000000, pfn 1 is at address 0x00001000, pfn 2 is at 0x00002000
> -and so on until we reach pfn 0xfffff at 0xfffff000. With 16KB pages pfs are
> +and so on until we reach pfn 0xfffff at 0xfffff000. With 16KB pages pfns are
>  at 0x00004000, 0x00008000 ... 0xffffc000 and pfn goes from 0 to 0x3ffff.
>  
>  As you can see, with 4KB pages the page base address uses bits 12-31 of the
> @@ -38,8 +38,8 @@ address, and this is why `PAGE_SHIFT` in this case is defined as 12 and
>  Over time a deeper hierarchy has been developed in response to increasing memory
>  sizes. When Linux was created, 4KB pages and a single page table called
>  `swapper_pg_dir` with 1024 entries was used, covering 4MB which coincided with
> -the fact that Torvald's first computer had 4MB of physical memory. Entries in
> -this single table were referred to as *PTE*:s - page table entries.
> +the fact that Torvalds's first computer had 4MB of physical memory. Entries in
> +this single table were referred to as *PTEs* - page table entries.

I'm unsure about this change of "*PTE*:s" to "*PTEs*".  Is that special
rst syntax to keep PTE highlighted without highlighting the 's'?

>  The software page table hierarchy reflects the fact that page table hardware has
>  become hierarchical and that in turn is done to save page table memory and
> @@ -212,7 +212,7 @@ threshold.
>  Additionally, page faults may be also caused by code bugs or by maliciously
>  crafted addresses that the CPU is instructed to access. A thread of a process
>  could use instructions to address (non-shared) memory which does not belong to
> -its own address space, or could try to execute an instruction that want to write
> +its own address space, or could try to execute an instruction that wants to write
>  to a read-only location.
>  
>  If the above-mentioned conditions happen in user-space, the kernel sends a
> @@ -277,5 +277,5 @@ To conclude this high altitude view of how Linux handles page faults, let's
>  add that the page faults handler can be disabled and enabled respectively with
>  `pagefault_disable()` and `pagefault_enable()`.
>  
> -Several code path make use of the latter two functions because they need to
> +Several code paths make use of the latter two functions because they need to
>  disable traps into the page faults handler, mostly to prevent deadlocks.
> -- 
> 2.50.1
> 
> 
