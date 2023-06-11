Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC4C7C7EE43
	for <linux-doc@archiver.kernel.org>; Sun, 11 Jun 2023 05:24:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232910AbjFKFYf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 11 Jun 2023 01:24:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47450 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229562AbjFKFYf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 11 Jun 2023 01:24:35 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F26C30F1
        for <linux-doc@vger.kernel.org>; Sat, 10 Jun 2023 22:24:33 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 1176461BB6
        for <linux-doc@vger.kernel.org>; Sun, 11 Jun 2023 05:24:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CFBA3C433D2;
        Sun, 11 Jun 2023 05:24:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1686461072;
        bh=nBz5ZAKG98XxWEj/i8c62WgI6RMXqSvSkQvA+drJYpU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=cVg7CNcDS7wOY3ZdDAEtKezxcxGKLg4glkOD857y1G3fQbINNQ4FFqVCk7KPrRZrM
         ELBq9znqPQnl2r8WuMDg+VKEVYgrcd3GCgLxWIJjKd4JR6DNyhJROP9bZLBbRHqTrZ
         WKetokBug3EPyw/hqKdImMdj6/W3FpCnkJjILeYA2BTg9UJw0l6iJpjcLPikxE6BNy
         vInEBjtoWiLViXnL3dSZ22n81XXaf9rUfpWVkVAO8ZrG2WEP20LPGKAgLRosZdedBX
         SPAOUuKD2tMlbU/S/Unpdu32NcidHmvjdzzAllc5Kg2k3ulBb1Nz+GFk4m6rKhSxkj
         vY2gaiUPSHtcg==
Date:   Sun, 11 Jun 2023 08:24:03 +0300
From:   Mike Rapoport <rppt@kernel.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, Matthew Wilcox <willy@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH v3] Documentation/mm: Initial page table documentation
Message-ID: <20230611052403.GK52412@kernel.org>
References: <20230608125501.3960093-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230608125501.3960093-1-linus.walleij@linaro.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Linus,

On Thu, Jun 08, 2023 at 02:55:01PM +0200, Linus Walleij wrote:
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
> 
> Cc: Matthew Wilcox <willy@infradead.org>
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Cc: Mike Rapoport <rppt@kernel.org>
> Link: https://people.kernel.org/linusw/arm32-page-tables
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---
> ChangeLog v2->v3:
> - Fix the page size example, also have examples for both 4K and
>   16K pages since people will confront these.
> - Add a section explaining a bit why we have hierarchical
>   page tables at all.
> ChangeLog v1->v2:
> - Fixed speling mistakes
> - Copyedit the paragraph on page frame numbers.
> - Reverse the arrows in the page table hierarchy illustration.
> - Reverse the order of description of the page hierarchy levels.
> - Create a new section for folding
> - Emphasize that architectures should try to be page hierarchy
>   neutral
> - Trying to better describe the fact that the lowest page table PTE
>   is called like that for historical reasons.
> ---
>  Documentation/mm/page_tables.rst | 142 +++++++++++++++++++++++++++++++
>  1 file changed, 142 insertions(+)
> 
> diff --git a/Documentation/mm/page_tables.rst b/Documentation/mm/page_tables.rst
> index 96939571d7bc..13c196bc48a1 100644
> --- a/Documentation/mm/page_tables.rst
> +++ b/Documentation/mm/page_tables.rst
> @@ -3,3 +3,145 @@
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
> +Page tables map virtual addresses as seen by the CPU program counter into
> +physical addresses as seen on the external memory bus.
> +
> +Linux defines page tables as a hierarchy which is currently five levels in
> +height. The target architecture code for each supported architecture will then
> +map this to the restrictions of the target hardware.
> +
> +The physical address corresponding to the virtual address is often referenced
> +by the underlying physical page frame. The **page frame number** or **pfn**
> +is the physical address of the page (as seen on the external memory bus)
> +divided by `PAGE_SIZE`.
> +
> +Physical memory address 0 will be *pfn 0* and the highest pfn will be
> +the last page of physical memory the external address bus of the CPU can
> +address.
> +
> +With a page granularity of 4KB and a address range of 32 bits, pfn 0 is at
> +address 0x00000000, pfn 1 is at address 0x00001000, pfn 2 is at 0x00002000
> +and so on until we reach pfn 0xfffff at 0xfffff000. With 16KB pages pfs are

                                                                      ^ pfns

> +at 0x00004000, 0x00008000 ... 0xffffc000 and pfn goes from 0 to 0x3fffff.
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
> +The hierarchy reflects the fact that page table hardware has become hierarchical

This is somehow tautological ;-)

> +and that in turn is done to save page table memory: one could of course imagine
> +a single page table with hundreds of kilobytes of entries, but in practice,
> +the hardware needs some help to traverse the memory where the page table is
> +stored, and large parts of the memory space is often empty, leading to
> +an unnecessarily large and sparse page table. For this reason page tables are
> +hierarchical, using parts of the virtual address to branch off at each level.
> +By marking a page table entry on a certain level invalid, the corresponding
> +range of the virtual address space is left unmapped.

How about 

One could of course imagine a linear page table with enormous amount of
entries, but that would be really wasteful because large parts of the
virtual address space are empty and such linear table would be extremely
sparse. With hierarchical page tables large holes in the virtual address
space do not waste memory because it is enough to mark them as unmapped at
a higher level of the page table. 

And on modern CPUs, a higher level page table can point directly to physical
memory range, which allows mapping of several megabytes or even gigabytes
by a single high level page table entry.

> +The page table hierarchy has now developed into this::
> +

-- 
Sincerely yours,
Mike.
