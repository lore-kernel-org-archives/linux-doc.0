Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7006C7EE25
	for <linux-doc@archiver.kernel.org>; Mon, 12 Jun 2023 11:37:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233203AbjFLLhF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 12 Jun 2023 07:37:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233121AbjFLLg2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 12 Jun 2023 07:36:28 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id 70B81E51
        for <linux-doc@vger.kernel.org>; Mon, 12 Jun 2023 04:14:58 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 69C6F1FB;
        Mon, 12 Jun 2023 04:15:43 -0700 (PDT)
Received: from FVFF77S0Q05N (unknown [10.57.27.163])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 02D8E3F587;
        Mon, 12 Jun 2023 04:14:56 -0700 (PDT)
Date:   Mon, 12 Jun 2023 12:14:54 +0100
From:   Mark Rutland <mark.rutland@arm.com>
To:     "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH RFC 02/17] arm64: place kernel in its own L0 page table
 entry
Message-ID: <ZIb+Lg9F9b4ay90p@FVFF77S0Q05N>
References: <ZHYCUVa8fzmB4XZV@shell.armlinux.org.uk>
 <E1q3zxo-00A5Js-9E@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1q3zxo-00A5Js-9E@rmk-PC.armlinux.org.uk>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Russell,

On Tue, May 30, 2023 at 03:04:40PM +0100, Russell King (Oracle) wrote:
> Kernel text replication needs to maintain separate per-node page
> tables for the kernel text. In order to do this without affecting
> other kernel memory mappings, placing the kernel such that it does
> not share a L0 page table entry with any other mapping is desirable.
> 
> Prior to this commit, the layout without KASLR was:
> 
> +----------+
> |  vmalloc |
> +----------+
> |  Kernel  |
> +----------+ MODULES_END, VMALLOC_START, KIMAGE_VADDR =
> |  Modules |                 MODULES_VADDR + MODULES_VSIZE
> +----------+ MODULES_VADDR = _PAGE_END(VA_BITS_MIN)
> | VA space |
> +----------+ 0
> 
> This becomes:
> 
> +----------+
> |  vmalloc |
> +----------+ VMALLOC_START = MODULES_END + PGDIR_SIZE
> |  Kernel  |
> +----------+ MODULES_END, KIMAGE_VADDR = _PAGE_END(VA_BITS_MIN) + PGDIR_SIZE
> |  Modules |
> +----------+ MODULES_VADDR = MODULES_END - MODULES_VSIZE
> | VA space |
> +----------+ 0

With KSASLR we may randomize the kernel and module space over a substantial
portion of the vmalloc range. Are you expecting that text replication is going
to restruct that range, or that we'd make it mutually exclusive with KASLR?

I also note that the L0 table could have as few as two entries (with 16K pages
and 4 levels). So either we'd need to also mess with an L1 table, or make text
replication mutually exclusive with such configurations.

> This assumes MODULES_VSIZE (128M) <= PGDIR_SIZE.

As a heads-up, we've just changed MODULES_VSIZE to be 2G in

  https://lore.kernel.org/linux-arm-kernel/20230530110328.2213762-1-mark.rutland@arm.com/

.. which is queued in the arm64 for-next/module-alloc branch:

  https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git/log/?h=for-next/module-alloc

> One side effect of this change is that KIMAGE_VADDR's definition now
> includes PGDIR_SIZE (to leave room for the modules) but this is not
> defined when asm/memory.h is included. This means KIMAGE_VADDR can
> not be used in inline functions within this file, so we convert
> kaslr_offset() and kaslr_enabled() to be macros instead.

That series above also decoupled kaslr_enabled() from kaslr_offset(), 
so we'd only need to change kaslr_offset().

> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>
> ---
>  arch/arm64/include/asm/memory.h  | 26 ++++++++++----------------
>  arch/arm64/include/asm/pgtable.h |  2 +-
>  arch/arm64/mm/mmu.c              |  3 ++-
>  3 files changed, 13 insertions(+), 18 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/memory.h b/arch/arm64/include/asm/memory.h
> index c735afdf639b..089f556b7387 100644
> --- a/arch/arm64/include/asm/memory.h
> +++ b/arch/arm64/include/asm/memory.h
> @@ -43,9 +43,9 @@
>  #define VA_BITS			(CONFIG_ARM64_VA_BITS)
>  #define _PAGE_OFFSET(va)	(-(UL(1) << (va)))
>  #define PAGE_OFFSET		(_PAGE_OFFSET(VA_BITS))
> -#define KIMAGE_VADDR		(MODULES_END)
> -#define MODULES_END		(MODULES_VADDR + MODULES_VSIZE)
> -#define MODULES_VADDR		(_PAGE_END(VA_BITS_MIN))
> +#define KIMAGE_VADDR		(_PAGE_END(VA_BITS_MIN) + PGDIR_SIZE)
> +#define MODULES_END		(KIMAGE_VADDR)
> +#define MODULES_VADDR		(MODULES_END - MODULES_VSIZE)
>  #define MODULES_VSIZE		(SZ_128M)
>  #define VMEMMAP_START		(-(UL(1) << (VA_BITS - VMEMMAP_SHIFT)))
>  #define VMEMMAP_END		(VMEMMAP_START + VMEMMAP_SIZE)
> @@ -199,20 +199,14 @@ extern u64			kimage_vaddr;
>  /* the offset between the kernel virtual and physical mappings */
>  extern u64			kimage_voffset;
>  
> -static inline unsigned long kaslr_offset(void)
> -{
> -	return kimage_vaddr - KIMAGE_VADDR;
> -}
> +#define kaslr_offset()	((unsigned long)(kimage_vaddr - KIMAGE_VADDR))
>  
> -static inline bool kaslr_enabled(void)
> -{
> -	/*
> -	 * The KASLR offset modulo MIN_KIMG_ALIGN is taken from the physical
> -	 * placement of the image rather than from the seed, so a displacement
> -	 * of less than MIN_KIMG_ALIGN means that no seed was provided.
> -	 */
> -	return kaslr_offset() >= MIN_KIMG_ALIGN;
> -}
> +/*
> + * The KASLR offset modulo MIN_KIMG_ALIGN is taken from the physical
> + * placement of the image rather than from the seed, so a displacement
> + * of less than MIN_KIMG_ALIGN means that no seed was provided.
> + */
> +#define kaslr_enabled()	(kaslr_offset() >= MIN_KIMG_ALIGN)
>  
>  /*
>   * Allow all memory at the discovery stage. We will clip it later.
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index 0bd18de9fd97..cb526e69299d 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -21,7 +21,7 @@
>   * VMALLOC_END: extends to the available space below vmemmap, PCI I/O space
>   *	and fixed mappings
>   */
> -#define VMALLOC_START		(MODULES_END)
> +#define VMALLOC_START		(MODULES_END + PGDIR_SIZE)
>  #define VMALLOC_END		(VMEMMAP_START - SZ_256M)
>  
>  #define vmemmap			((struct page *)VMEMMAP_START - (memstart_addr >> PAGE_SHIFT))
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 4829abe017e9..baf74d0c43c9 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -478,7 +478,8 @@ void __init create_pgd_mapping(struct mm_struct *mm, phys_addr_t phys,
>  static void update_mapping_prot(phys_addr_t phys, unsigned long virt,
>  				phys_addr_t size, pgprot_t prot)
>  {
> -	if ((virt >= PAGE_END) && (virt < VMALLOC_START)) {
> +	if ((virt >= PAGE_END) && (virt < VMALLOC_START) &&
> +	    !is_kernel(virt)) {
>  		pr_warn("BUG: not updating mapping for %pa at 0x%016lx - outside kernel range\n",
>  			&phys, virt);
>  		return;

I think the existing conditions here aren't quite right, and have become bogus
over time, and I don't think that the is_kernel() check is necessary here.

Originally, back in commit:

  c1cc1552616d0f35 ("arm64: MMU initialisation")

We had:

	if (virt < VMALLOC_START) {
		pr_warning("BUG: not creating mapping for 0x%016llx at 0x%016lx - outside kernel range\n",
			   phys, virt);
		return;
	}

... which checked that the VA range we were manipulating was in the TTBR1 VA
range, as at the time, VMALLOC_START happened to be the lowest TTBR1 address.

That didn't substantially change until commit:

  14c127c957c1c607 ("arm64: mm: Flip kernel VA space")

... when the test was changed to:

	if ((virt >= VA_START) && (virt < VMALLOC_START)) {
		pr_warn("BUG: not creating mapping for %pa at 0x%016lx - outside kernel range\n",
			&phys, virt);
		return;
	}

Note: in that commit, VA_START was actually the end of the linear map (which
was itself a the start of the TTBR1 address space), so this is just checking if
we're poking a small portion of the TTBR1 address space, rather than if we're
poking *outside* of the TTBR1 address space.

That doesn't make much sense, and I'm pretty sure that was a thinko rather than
an intentional change of semantic.

I "fixed" that without thinking in commit:

  77ad4ce69321abbe ("arm64: memory: rename VA_START to PAGE_END")

... making that:

	if ((virt >= PAGE_END) && (virt < VMALLOC_START)) {
		pr_warn("BUG: not creating mapping for %pa at 0x%016lx - outside kernel range\n",
			&phys, virt);
		return;
	}

... but clearly it has lost the original semantic and doesn't make much sense.

I think the test should actually be something like:

	/* Must be a TTBR1 address */
	if (virt < PAGE_OFFSET ) {
		...
	}

... and then we won't randomly trip for kernel mappings if those fall between
the linear map and vmalloc range.

Thanks,
Mark.
