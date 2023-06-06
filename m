Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CB643C7EE24
	for <linux-doc@archiver.kernel.org>; Tue,  6 Jun 2023 03:57:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231836AbjFFD5c (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 5 Jun 2023 23:57:32 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50740 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230483AbjFFD5b (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 5 Jun 2023 23:57:31 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 551D812B
        for <linux-doc@vger.kernel.org>; Mon,  5 Jun 2023 20:57:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=g7Pov4hYToHPPLgJtu0NNFS7UNME9MxY28Z3h6zECZg=; b=fRawv2FljXPWPo4iMDnIAB78Ja
        vAUsQEqKg4ZaRltM1F9iT0YTNF8Z1feyt1jGmoohDa1Ii52w+oBCPX5jVjUbfrcEo4hlp2roycFsT
        zYJMKtsA2WmUajztFsxvFc3fWY2LFxTdu9qKhR6KozL5ee1p9C1iBIvTdvt6cfeEf1YyE5WjAlbS4
        GlaK1jo8xBq6cDrehTqO8y1ltFS3h/H6TcIUuJrWQaJq0Ugd68u2l/NFPwr4sisCYCvjCLEckeclq
        cJG+7+evnVE164859LnhG2ypcY0CXDjJ3KtJyHhZcAI/79R1U+uis1YtJ13DwOTqQs/I9kY6fzZ9X
        ZWQAS66g==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1q6Now-00CicD-FS; Tue, 06 Jun 2023 03:57:22 +0000
Date:   Tue, 6 Jun 2023 04:57:22 +0100
From:   Matthew Wilcox <willy@infradead.org>
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>, linux-mm@kvack.org,
        linux-doc@vger.kernel.org, Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH] Documentation/mm: Initial page table documentation
Message-ID: <ZH6uolQWeyX9kb+j@casper.infradead.org>
References: <20230605221035.3681812-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230605221035.3681812-1-linus.walleij@linaro.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jun 06, 2023 at 12:10:35AM +0200, Linus Walleij wrote:
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

I'm not sure this is the best way to introduce the concept of the page
tables.  I might go with something more like ...

Page tables are a way to map virtual addresses to physical addresses.
While hardware architectures have many different ways of handling this,
Linux uses hierarchical tables, currently defined to be five levels in
height.  Architecture code takes care of mapping these software page
tables to whatever hardware requires on a given platform.

> +The physical address corresponding to the virtual address is commonly
> +defined by the index point in the hierarchy, and this is called a **page frame
> +number** or **pfn**. The first entry on the top level to the first entry in the
> +second and so on down the hierarchy will point out the virtual address for the
> +physical memory address 0, which will be *pfn 0* and the highest pfn will be
> +the last page of physical memory the external address bus of the CPU can
> +address.

This reads backwards to me.  The index point in the hierarchy (what an
unusual turn of phrase!) is surely the virtual address, since the
hierarchy is indexed by virtual addresses.  If this paragraph is
supposed to define what a pfn is, how about simply:

The pfn of a page of memory is the physical address of the page divided
by PAGE_SIZE

> +With a page granularity of 4KB and a address range of 32 bits, pfn 0 is at
> +address 0x00000000, pfn 1 is at address 0x00004000, pfn 2 is at 0x00008000
> +and so on until we reach pfn 0x3ffff at 0xffffc000.

Good example, keep that.

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

Your arrows are backwards.  The PTE doesn't point to the PMD; the PMD
points to PTEs.

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
> +  directory level and that we cannot go on with ad hoc names any more. This
> +  is only used on systems which actually have 5 levels of page tables.
> +
> +- **pud**, `pud_t`, `pudval_t` = **Page Upper Directory** was introduced after
> +  the other levels to handle 4-level page tables. Like *p4d*, it is potentially
> +  unused.

You have rather too many forward references in this description for my
taste.  Start with the PTE, then the PMD, then  PUD, P4D, PGD.

> +- **pmd**, `pmd_t`, `pmdval_t` = **Page Middle Directory**.
> +
> +- **pte**, `pte_t`, `pteval_t` = **Page Table Entry** - mentioned earlier.
> +  The name is a bit confusing because while in Linux 1.0 this did refer to a
> +  single page table entry in the top level page table, it was retrofitted
> +  to be "what the level above points to". So when two-level page tables were
> +  introduced, the *pte* became a list of pointers, which is why
> +  `PTRS_PER_PTE` exists. This oxymoronic term can be mildly confusing.

I don't think this is right.  PTRS_PER_PTE is how many pointers are in
the PMD page table, so it's how many pointers you can walk if you have a
pte *.  Yes, it's complicated and confusing, but I don't think this
explanation clears up any of that confusion.

> +As already mentioned, each level in the page table hierarchy is a *list of

array, not list

> +pointers*, so the **pgd** contains `PTRS_PER_PGD` pointers to the next level
> +below, **p4d** contains `PTRS_PER_P4D` pointers to **pud** items and so on. The
> +number of pointers on each level is architecture-defined. The most usual layout

I don't think it's helpful to say this.  It's really not that usual
(maybe half of our architectures behave that way?)


I think a document like this that talks about page tables really needs to
include a description of how some PMDs / PUDs / ... may not be pointers
to lower levels, but direct pointers to the actual memory (ie THPs /
hugetlb pages).


Sorry to take a wrecking ball to this, I'm sure you worked hard on it.
