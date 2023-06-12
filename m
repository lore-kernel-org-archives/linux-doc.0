Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57037C7EE2E
	for <linux-doc@archiver.kernel.org>; Mon, 12 Jun 2023 15:05:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236325AbjFLPFW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 12 Jun 2023 11:05:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237130AbjFLPFV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 12 Jun 2023 11:05:21 -0400
Received: from pandora.armlinux.org.uk (pandora.armlinux.org.uk [IPv6:2001:4d48:ad52:32c8:5054:ff:fe00:142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E73BC12A
        for <linux-doc@vger.kernel.org>; Mon, 12 Jun 2023 08:05:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=armlinux.org.uk; s=pandora-2019; h=Sender:In-Reply-To:Content-Type:
        MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=fjw6/kOmcRvjbZMFwT2l68AeeEdTSyvr3VicSf1pM6c=; b=jrNDa+uLBk3X9v5NumTh6wad6t
        +buub1e26rqNsqU2l8Kxg7Q2O2GRpLRgix4GkSDfbFaInhTT4JZmxrWjx2Yl5nHAwLS78BZvX5kG1
        BTPjcIYoEkq/aL3OJGAe2mYUPiw88xqHKIO0fW9g2KT/WBF7AhAV10c8o+NDdcDw0DmKAEsldfs/+
        h901ax92APIGm+KH0Y52wrvBsZcyMQtVfndRfiZmoBMeJNy7RdpQWEy+GJq6rFSUJlc3Akg8M6zix
        sWIb82ySBu7qltqVt8uFihXgGs8JTXISD3HMs3eZm5MrgGy+2dQGl4y335VvA+7ge3qoQvFpCeTqI
        SAR7wQqQ==;
Received: from shell.armlinux.org.uk ([fd8f:7570:feb6:1:5054:ff:fe00:4ec]:38836)
        by pandora.armlinux.org.uk with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
        (Exim 4.94.2)
        (envelope-from <linux@armlinux.org.uk>)
        id 1q8j6L-0005uu-A9; Mon, 12 Jun 2023 16:05:01 +0100
Received: from linux by shell.armlinux.org.uk with local (Exim 4.94.2)
        (envelope-from <linux@shell.armlinux.org.uk>)
        id 1q8j6I-00053l-Pd; Mon, 12 Jun 2023 16:04:58 +0100
Date:   Mon, 12 Jun 2023 16:04:58 +0100
From:   "Russell King (Oracle)" <linux@armlinux.org.uk>
To:     Mark Rutland <mark.rutland@arm.com>
Cc:     Catalin Marinas <catalin.marinas@arm.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        Ard Biesheuvel <ardb@kernel.org>
Subject: Re: [PATCH RFC 02/17] arm64: place kernel in its own L0 page table
 entry
Message-ID: <ZIc0Glqg2HalujXJ@shell.armlinux.org.uk>
References: <ZHYCUVa8fzmB4XZV@shell.armlinux.org.uk>
 <E1q3zxo-00A5Js-9E@rmk-PC.armlinux.org.uk>
 <ZIb+Lg9F9b4ay90p@FVFF77S0Q05N>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ZIb+Lg9F9b4ay90p@FVFF77S0Q05N>
Sender: Russell King (Oracle) <linux@armlinux.org.uk>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jun 12, 2023 at 12:14:54PM +0100, Mark Rutland wrote:
> Hi Russell,
> 
> On Tue, May 30, 2023 at 03:04:40PM +0100, Russell King (Oracle) wrote:
> > Kernel text replication needs to maintain separate per-node page
> > tables for the kernel text. In order to do this without affecting
> > other kernel memory mappings, placing the kernel such that it does
> > not share a L0 page table entry with any other mapping is desirable.
> > 
> > Prior to this commit, the layout without KASLR was:
> > 
> > +----------+
> > |  vmalloc |
> > +----------+
> > |  Kernel  |
> > +----------+ MODULES_END, VMALLOC_START, KIMAGE_VADDR =
> > |  Modules |                 MODULES_VADDR + MODULES_VSIZE
> > +----------+ MODULES_VADDR = _PAGE_END(VA_BITS_MIN)
> > | VA space |
> > +----------+ 0
> > 
> > This becomes:
> > 
> > +----------+
> > |  vmalloc |
> > +----------+ VMALLOC_START = MODULES_END + PGDIR_SIZE
> > |  Kernel  |
> > +----------+ MODULES_END, KIMAGE_VADDR = _PAGE_END(VA_BITS_MIN) + PGDIR_SIZE
> > |  Modules |
> > +----------+ MODULES_VADDR = MODULES_END - MODULES_VSIZE
> > | VA space |
> > +----------+ 0
> 
> With KSASLR we may randomize the kernel and module space over a substantial
> portion of the vmalloc range. Are you expecting that text replication is going
> to restruct that range, or that we'd make it mutually exclusive with KASLR?

In the patch that adds the REPLICATE_KTEXT config option, I've made it
exclusive with RANDOMIZE_BASE, but this change in layout isn't dependent
on REPLICATE_KTEXT.

I've tested it with RANDOMIZE_BASE=y, and nothing seems to get upset,
so I believe that this patch doesn't cause any negative issues.

> I also note that the L0 table could have as few as two entries (with 16K pages
> and 4 levels). So either we'd need to also mess with an L1 table, or make text
> replication mutually exclusive with such configurations.

Ah, thanks for pointing that out - I was hoping to avoid needing
to touch anything but L0 tables.

However, it brings up a question: are there any NUMA systems that would
have just two entries in the L0 table? I suspect NUMA systems have lots
of RAM, and so would want a page table layout that results in multiple
L0 entries.

> > This assumes MODULES_VSIZE (128M) <= PGDIR_SIZE.
> 
> As a heads-up, we've just changed MODULES_VSIZE to be 2G in
> 
>   https://lore.kernel.org/linux-arm-kernel/20230530110328.2213762-1-mark.rutland@arm.com/
> 
> .. which is queued in the arm64 for-next/module-alloc branch:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git/log/?h=for-next/module-alloc

Ok - so I need to get a bit more clever about calculating MODULES_END
and KIMAGE_VADDR

> > One side effect of this change is that KIMAGE_VADDR's definition now
> > includes PGDIR_SIZE (to leave room for the modules) but this is not
> > defined when asm/memory.h is included. This means KIMAGE_VADDR can
> > not be used in inline functions within this file, so we convert
> > kaslr_offset() and kaslr_enabled() to be macros instead.
> 
> That series above also decoupled kaslr_enabled() from kaslr_offset(), 
> so we'd only need to change kaslr_offset().

Ok, I'll take a look to see how my changes are impacted.

> > diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> > index 4829abe017e9..baf74d0c43c9 100644
> > --- a/arch/arm64/mm/mmu.c
> > +++ b/arch/arm64/mm/mmu.c
> > @@ -478,7 +478,8 @@ void __init create_pgd_mapping(struct mm_struct *mm, phys_addr_t phys,
> >  static void update_mapping_prot(phys_addr_t phys, unsigned long virt,
> >  				phys_addr_t size, pgprot_t prot)
> >  {
> > -	if ((virt >= PAGE_END) && (virt < VMALLOC_START)) {
> > +	if ((virt >= PAGE_END) && (virt < VMALLOC_START) &&
> > +	    !is_kernel(virt)) {
> >  		pr_warn("BUG: not updating mapping for %pa at 0x%016lx - outside kernel range\n",
> >  			&phys, virt);
> >  		return;
> 
> I think the existing conditions here aren't quite right, and have become bogus
> over time, and I don't think that the is_kernel() check is necessary here.
> 
> Originally, back in commit:
> 
>   c1cc1552616d0f35 ("arm64: MMU initialisation")
> 
> We had:
> 
> 	if (virt < VMALLOC_START) {
> 		pr_warning("BUG: not creating mapping for 0x%016llx at 0x%016lx - outside kernel range\n",
> 			   phys, virt);
> 		return;
> 	}
> 
> ... which checked that the VA range we were manipulating was in the TTBR1 VA
> range, as at the time, VMALLOC_START happened to be the lowest TTBR1 address.
> 
> That didn't substantially change until commit:
> 
>   14c127c957c1c607 ("arm64: mm: Flip kernel VA space")
> 
> ... when the test was changed to:
> 
> 	if ((virt >= VA_START) && (virt < VMALLOC_START)) {
> 		pr_warn("BUG: not creating mapping for %pa at 0x%016lx - outside kernel range\n",
> 			&phys, virt);
> 		return;
> 	}
> 
> Note: in that commit, VA_START was actually the end of the linear map (which
> was itself a the start of the TTBR1 address space), so this is just checking if
> we're poking a small portion of the TTBR1 address space, rather than if we're
> poking *outside* of the TTBR1 address space.
> 
> That doesn't make much sense, and I'm pretty sure that was a thinko rather than
> an intentional change of semantic.
> 
> I "fixed" that without thinking in commit:
> 
>   77ad4ce69321abbe ("arm64: memory: rename VA_START to PAGE_END")
> 
> ... making that:
> 
> 	if ((virt >= PAGE_END) && (virt < VMALLOC_START)) {
> 		pr_warn("BUG: not creating mapping for %pa at 0x%016lx - outside kernel range\n",
> 			&phys, virt);
> 		return;
> 	}
> 
> ... but clearly it has lost the original semantic and doesn't make much sense.
> 
> I think the test should actually be something like:
> 
> 	/* Must be a TTBR1 address */
> 	if (virt < PAGE_OFFSET ) {
> 		...
> 	}
> 
> ... and then we won't randomly trip for kernel mappings if those fall between
> the linear map and vmalloc range.

Okay, so that sounds like if this is fixed, then I won't need to patch
it! Yay!

-- 
RMK's Patch system: https://www.armlinux.org.uk/developer/patches/
FTTP is here! 80Mbps down 10Mbps up. Decent connectivity at last!
