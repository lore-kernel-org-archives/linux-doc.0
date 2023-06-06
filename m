Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1767C7EE24
	for <linux-doc@archiver.kernel.org>; Tue,  6 Jun 2023 05:35:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232252AbjFFFff (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Jun 2023 01:35:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48000 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229596AbjFFFfe (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Jun 2023 01:35:34 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DA1641B1
        for <linux-doc@vger.kernel.org>; Mon,  5 Jun 2023 22:35:32 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 68A4F62D31
        for <linux-doc@vger.kernel.org>; Tue,  6 Jun 2023 05:35:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E212CC433EF;
        Tue,  6 Jun 2023 05:35:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686029731;
        bh=PJnB2BJbg0oIcNPzIQ9kocufYiht8LDFVYJIPM+Nvpg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=X50peefh4k8VPMOowER2aTCYUXtXrkYvcBgHETa04zEmEQJz3zRzkDiV4M69uo8JT
         TrqttTv5BaxZi8nPbdrsa0QHHADf3ODXSNwqEsEx1nG/jEMgz3VzbxjGSF6/RIf5z4
         pjtNx26UWVfMjnpVr6oReWJWJ/Gzsn/lKVfG19heuoWGy7FwAXH9ICjFOhTmVFbIc6
         okgHfciXp1fTq8WLLDulIOjT/oplRnKQw0oH/kyCfNUkd6Q3hfeoKGxFI9gVpR7zKl
         Bm8xJDgyXIX2jP36Rj4smLWftsflqVdlgdDNGnflIrqx2D+UTvVcMQxVz3kFYi8FUM
         Jl9l6yvTe9GmA==
Date:   Tue, 6 Jun 2023 08:35:10 +0300
From:   Mike Rapoport <rppt@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH] Documentation/mm: Initial page table documentation
Message-ID: <20230606053510.GB52412@kernel.org>
References: <20230605221035.3681812-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230605221035.3681812-1-linus.walleij@linaro.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Linus,

On Tue, Jun 06, 2023 at 12:10:35AM +0200, Linus Walleij wrote:
> This is based on an earlier blog post at people.kernel.org,
> it describes the concepts about page tables that were hardest
> for me to grasp when dealing with them for the first time,
> such as the prevalent three-letter acronyms pfn, pgd, p4d,
> pud, pmd and pte.
> 
> I don't know if this is what people want, but it's what I would
> have wanted.
> 
> I discussed at one point with Mike Rapoport to bring this into
> the kernel documentation, so here is a small proposal.
 
Thanks for the documentation. And I love asciiart :)

> Cc: Mike Rapoport <rppt@kernel.org>
> Link: https://people.kernel.org/linusw/arm32-page-tables
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
>  Documentation/mm/page_tables.rst | 125 +++++++++++++++++++++++++++++++
>  1 file changed, 125 insertions(+)
> 
> diff --git a/Documentation/mm/page_tables.rst b/Documentation/mm/page_tables.rst
> index 96939571d7bc..a2e1671a0f1d 100644
> --- a/Documentation/mm/page_tables.rst
> +++ b/Documentation/mm/page_tables.rst
> @@ -3,3 +3,128 @@
>  ===========
>  Page Tables
>  ===========
> +
> +Paged virtual memory was invented along with virtual memory as a concept in
> +1962 on the Ferranti Atlas Computer which was the first computer with paged
> +virtual memory. The feature migrated to newer computers and became a de facto
> +feature of all Unix-like systems as time went by. In 1985 the feature was
> +included in the Intel 80386, which was the CPU Linux 1.0 was developed on.
> +
> +The first computers with virtual memory had one single page table, but the
> +increased size of physical memories demanded that the page tables be split in
> +two hierarchical levels. This happens because a single page table cannot cover
> +the desired amount of memory with the desired granualarity, such as a page size
> +of 4KB.
> +
> +The physical address corresponding to the virtual address is commonly
> +defined by the index point in the hierarchy, and this is called a **page frame
> +number** or **pfn**. The first entry on the top level to the first entry in the

                                                        ^ points?

I'd add this sentence before "The first entry":
A virtual address is split to indexes into every table in the page table
hierarchy.

> +second and so on down the hierarchy will point out the virtual address for the

Maybe something like:

... so on down the hierarchy so that virtual address that has all indexes
as 0 will point out to physical memory address 0 ...

> +physical memory address 0, which will be *pfn 0* and the highest pfn will be
> +the last page of physical memory the external address bus of the CPU can
> +address.
> +
> +With a page granularity of 4KB and a address range of 32 bits, pfn 0 is at
> +address 0x00000000, pfn 1 is at address 0x00004000, pfn 2 is at 0x00008000
> +and so on until we reach pfn 0x3ffff at 0xffffc000.
> +
> +As you can see, with 4KB pages the page base address uses bits 12-31 of the
> +address, and this is why `PAGE_SHIFT` in this case is defined as 12 and
> +`PAGE_SIZE` is usually defined in terms of the page shift as `(1 << PAGE_SHIFT)`
> +
> +Over time a deeper hierarchy has been developed in response to increasing memory
> +sizes. When Linux was created, 4KB pages and a single page table called
> +`swapper_pg_dir` with 1024 entries was used, covering 4MB which coincided with
> +the fact that Torvald's first computer had 4MB of physical memory. Entries in
> +this single table was referred to as *PTE*:s - page table entries.
> +
> +Over time the page table hierarchy has developed into this::
> +
> +  +-----+
> +  | PGD |
> +  +-----+
> +     ^
> +     |   +-----+
> +     +---| P4D |
> +         +-----+
> +            ^
> +            |   +-----+
> +            +---| PUD |
> +                +-----+
> +                   ^
> +                   |   +-----+
> +                   +---| PMD |
> +                       +-----+
> +                          ^
> +                          |   +-----+
> +                          +---| PTE |
> +                              +-----+
> +
> +
> +Symbols on the different levels of the page table hierarchy have the following
> +meaning:
> +
> +- **pgd**, `pgd_t`, `pgdval_t` = **Page Global Directory** - the Linux kernel
> +  main page table handling the PGD for the kernel memory is still found in
> +  `swapper_pg_dir`, but each userspace process in the system also has its own
> +  memory context and thus its own *pgd*, found in `struct mm_struct` which
> +  in turn is referenced to in each `struct task_struct`. So tasks have memory
> +  context in the form of a `struct mm_struct` and this in turn has a
> +  `struct pgt_t *pgd` pointer to the corresponding page global directory.
> +
> +- **p4d**, `p4d_t`, `p4dval_t` = **Page Level 4 Directory** was introduced to
> +  handle 5-level page tables after the *pud* was introduced. Now it was clear
> +  that we nee to replace *pgd*, *pmd*, *pud* etc with a figure indicating the

            ^ need

> +  directory level and that we cannot go on with ad hoc names any more. This
> +  is only used on systems which actually have 5 levels of page tables.
> +
> +- **pud**, `pud_t`, `pudval_t` = **Page Upper Directory** was introduced after
> +  the other levels to handle 4-level page tables. Like *p4d*, it is potentially
> +  unused.
> +
> +- **pmd**, `pmd_t`, `pmdval_t` = **Page Middle Directory**.
> +
> +- **pte**, `pte_t`, `pteval_t` = **Page Table Entry** - mentioned earlier.
> +  The name is a bit confusing because while in Linux 1.0 this did refer to a
> +  single page table entry in the top level page table, it was retrofitted
> +  to be "what the level above points to". So when two-level page tables were
> +  introduced, the *pte* became a list of pointers, which is why
> +  `PTRS_PER_PTE` exists. This oxymoronic term can be mildly confusing.
> +
> +As already mentioned, each level in the page table hierarchy is a *list of
> +pointers*, so the **pgd** contains `PTRS_PER_PGD` pointers to the next level
> +below, **p4d** contains `PTRS_PER_P4D` pointers to **pud** items and so on. The
> +number of pointers on each level is architecture-defined. The most usual layout
> +is the `PAGE_SIZE` of the system divided by the number of bytes in a virtual
> +address on the system so each page table level is exactly one page worth of
> +pointers, which is usually what computer architects choose::
> +
> +    PMD
> +  +-----+           PTE
> +  | ptr |-------> +-----+
> +  | ptr |-        | ptr |-------> PAGE
> +  | ptr | \       | ptr |
> +  | ptr |  \        ...
> +  | ... |   \
> +  | ptr |    \         PTE
> +  +-----+     +----> +-----+
> +                     | ptr |-------> PAGE
> +                     | ptr |
> +                       ...
> +
> +
> +Each pointer in the lowest level of the page table hierarchy, i.e. each
> +`pteval_t`-entry of the `PTRS_PER_PTE` entries in a `pte_t *`, will map exactly
> +one `PAGE_SIZE`:d page of physical memory to exactly one page of virtual memory.
> +
> +The pte page table entries (pointers) on the lowest level of the hierarchy
> +typically contain the high bits of a virtual address in its high bits, and in
> +the lower bits it contains architecture-dependent control bits pertaining to
> +the page.

... typically contain PFN in their high bits and architecture-dependent
control bits in the lower bits.

> +
> +If the architecture does not use all the page table levels, they can be *folded*
> +which means skipped, and all operations performed on page tables will be
> +compile-time augmented to just skip a level when accessing the next lower
> +level. Page table handling code that wish to be architecture-neutral, such as
> +the virtual memory manager, will however need to be written so that it
> +traverses all of the currently five levels.

I'd add something like

And even architecture specific page table traversals are better off with
using all the levels for better robustness against future changes.

> -- 
> 2.40.1
> 
> 

-- 
Sincerely yours,
Mike.
