Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31232C7EE2E
	for <linux-doc@archiver.kernel.org>; Mon, 12 Jun 2023 10:53:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235846AbjFLKxY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 12 Jun 2023 06:53:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55552 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236037AbjFLKxB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 12 Jun 2023 06:53:01 -0400
Received: from foss.arm.com (foss.arm.com [217.140.110.172])
        by lindbergh.monkeyblade.net (Postfix) with ESMTP id ABF08AD08
        for <linux-doc@vger.kernel.org>; Mon, 12 Jun 2023 03:37:37 -0700 (PDT)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
        by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 94DE3D75;
        Mon, 12 Jun 2023 03:38:22 -0700 (PDT)
Received: from FVFF77S0Q05N (unknown [10.57.27.163])
        by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 48A573F663;
        Mon, 12 Jun 2023 03:37:36 -0700 (PDT)
Date:   Mon, 12 Jun 2023 11:37:33 +0100
From:   Mark Rutland <mark.rutland@arm.com>
To:     "Russell King (Oracle)" <rmk+kernel@armlinux.org.uk>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH RFC 01/17] arm64: consolidate rox page protection logic
Message-ID: <ZIb1bcIA60OoAqUW@FVFF77S0Q05N>
References: <ZHYCUVa8fzmB4XZV@shell.armlinux.org.uk>
 <E1q3zxj-00A5Jm-5k@rmk-PC.armlinux.org.uk>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <E1q3zxj-00A5Jm-5k@rmk-PC.armlinux.org.uk>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, May 30, 2023 at 03:04:35PM +0100, Russell King (Oracle) wrote:
> Consolidate the arm64 decision making for the page protections used
> for executable pages, used by both the trampoline code and the kernel
> text mapping code.
> 
> Signed-off-by: Russell King (Oracle) <rmk+kernel@armlinux.org.uk>

It seems nice to ensure this is consistent, so regardless of whether we want
the series as a whole:

Acked-by: Mark Rutland <mark.rutland@arm.com>

Mark.

> ---
>  arch/arm64/mm/mmu.c | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index af6bc8403ee4..4829abe017e9 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -663,12 +663,17 @@ static void __init map_kernel_segment(pgd_t *pgdp, void *va_start, void *va_end,
>  	vm_area_add_early(vma);
>  }
>  
> +static pgprot_t kernel_exec_prot(void)
> +{
> +	return rodata_enabled ? PAGE_KERNEL_ROX : PAGE_KERNEL_EXEC;
> +}
> +
>  #ifdef CONFIG_UNMAP_KERNEL_AT_EL0
>  static int __init map_entry_trampoline(void)
>  {
>  	int i;
>  
> -	pgprot_t prot = rodata_enabled ? PAGE_KERNEL_ROX : PAGE_KERNEL_EXEC;
> +	pgprot_t prot = kernel_exec_prot();
>  	phys_addr_t pa_start = __pa_symbol(__entry_tramp_text_start);
>  
>  	/* The trampoline is always mapped and can therefore be global */
> @@ -723,7 +728,7 @@ static void __init map_kernel(pgd_t *pgdp)
>  	 * mapping to install SW breakpoints. Allow this (only) when
>  	 * explicitly requested with rodata=off.
>  	 */
> -	pgprot_t text_prot = rodata_enabled ? PAGE_KERNEL_ROX : PAGE_KERNEL_EXEC;
> +	pgprot_t text_prot = kernel_exec_prot();
>  
>  	/*
>  	 * If we have a CPU that supports BTI and a kernel built for
> -- 
> 2.30.2
> 
> 
> _______________________________________________
> linux-arm-kernel mailing list
> linux-arm-kernel@lists.infradead.org
> http://lists.infradead.org/mailman/listinfo/linux-arm-kernel
