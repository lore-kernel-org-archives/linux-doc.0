Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AF118EB64DA
	for <linux-doc@archiver.kernel.org>; Sun, 18 Jun 2023 13:16:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229509AbjFRNQu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 18 Jun 2023 09:16:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39118 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbjFRNQt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 18 Jun 2023 09:16:49 -0400
Received: from mail-wm1-x332.google.com (mail-wm1-x332.google.com [IPv6:2a00:1450:4864:20::332])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C2629B2
        for <linux-doc@vger.kernel.org>; Sun, 18 Jun 2023 06:16:47 -0700 (PDT)
Received: by mail-wm1-x332.google.com with SMTP id 5b1f17b1804b1-3f8d0d68530so26133835e9.0
        for <linux-doc@vger.kernel.org>; Sun, 18 Jun 2023 06:16:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1687094206; x=1689686206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ytKkmpKAbqV05nsEdFLSldQslsPSisBThz09ue+bjeM=;
        b=hyQWh99jZmtgSygvUSeOrvGfoH9muDXYKh4wZTV1UXoQm2lYxlKi4hRYtRLZVZ3ZFM
         QuE17uPT4gDi+Uo4Bcz0uivhhMYMZmRSNOVRYZnlrrDasgnkSqXPE2QGb4yTliHGVbxP
         1wMGW07Mj8tiXpJiVVoR7mWPNVftYyTPoiPPPHO04ddoCj56B/Di1O7GliomNPMYM2/i
         8uk6EC/g6+uqUkG2KfxxC+pRZ7gshlCUEjKY8SYeTTmyfWWvfBgH6EZLjVfctUF2DVIo
         1HT3cvz75j0XIViImojZ8yiSrsFv1eDb1kDyJplSCzzg7VR7WZtTr4y1cqwL6JXnyBKQ
         KhPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687094206; x=1689686206;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ytKkmpKAbqV05nsEdFLSldQslsPSisBThz09ue+bjeM=;
        b=jZfgojsgK4owM4ZOs9DfwEY2sHI89CtBLGJS035jXwsqlWtbkofu64JhnPAoTSXxR6
         1uhavSpnSEW6pPIjB8NyUiYuDArfx0+/6dMTmcz7DkhQ0st0fceYdqrRqFFU2nWbvG3h
         rAQ6/kC5vBHHt8c9GhQGsPiKjf4178MtWr7+rGjOD4/0zMxc7T6yKQmJiwOF9X5zHil9
         nsEJS30ZFlMWIw1EwaXXaN8ALLUiPfaLr46QPTZFPWA49nb9FhzjaIKuSCVM9wTos6yd
         9GrxCxFgjwvNLcadgFCUtsOrz6HtzC39tAuExBAbcZfpfrx7NfSP8nsISluqSCi6XNjf
         fOFw==
X-Gm-Message-State: AC+VfDynhM3q8aIUAvmbV7dHOZlqDLRmoedz+S2iaNSJALtxWnCjMcOj
        66CNea0vl57lpH3EvL+6aRM=
X-Google-Smtp-Source: ACHHUZ4WOWkQ8bErsoI7Ozhx9cg1+2dl3N0wieS4UCWyHlQ/N7ngfbUu00pMKMSxh2RQ0yz2WsAM3Q==
X-Received: by 2002:adf:e910:0:b0:30a:d8f3:3e41 with SMTP id f16-20020adfe910000000b0030ad8f33e41mr5594257wrm.7.1687094205847;
        Sun, 18 Jun 2023 06:16:45 -0700 (PDT)
Received: from suse.localnet (host-79-26-32-1.retail.telecomitalia.it. [79.26.32.1])
        by smtp.gmail.com with ESMTPSA id k18-20020adfe8d2000000b00311334c7fabsm2787732wrn.16.2023.06.18.06.16.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 18 Jun 2023 06:16:45 -0700 (PDT)
From:   "Fabio M. De Francesco" <fmdefrancesco@gmail.com>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linus Walleij <linus.walleij@linaro.org>
Cc:     linux-mm@kvack.org, linux-doc@vger.kernel.org,
        Linus Walleij <linus.walleij@linaro.org>,
        Matthew Wilcox <willy@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Mike Rapoport <rppt@kernel.org>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: [PATCH v5] Documentation/mm: Initial page table documentation
Date:   Sun, 18 Jun 2023 15:16:42 +0200
Message-ID: <3045029.CbtlEUcBR6@suse>
In-Reply-To: <20230614072548.996940-1-linus.walleij@linaro.org>
References: <20230614072548.996940-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On mercoled=C3=AC 14 giugno 2023 09:25:48 CEST Linus Walleij wrote:
> This is based on an earlier blog post at people.kernel.org,
> it describes the concepts about page tables that were hardest
> for me to grasp when dealing with them for the first time,
> such as the prevalent three-letter acronyms pfn, pgd, p4d,
> pud, pmd and pte.
> I don't know if this is what people want, but it's what I would
> have wanted. The wording, introduction, choice of initial subjects
> and choice of style is mine.
>=20
> I discussed at one point with Mike Rapoport to bring this into
> the kernel documentation, so here is a small proposal.
>=20
> The current form is augmented in response to feedback from
> Mike Rapoport, Matthew Wilcox, Jonathan Cameron, Kuan-Ying Lee,
> Randy Dunlap and Bagas Sanjaya.
>=20
> Cc: Matthew Wilcox <willy@infradead.org>
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Reviewed-by: Mike Rapoport <rppt@kernel.org>
> Reviewed-by: Jonathan Cameron <Jonathan.Cameron@huawei.com>
> Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>
> Link: https://people.kernel.org/linusw/arm32-page-tables
> Signed-off-by: Linus Walleij <linus.walleij@linaro.org>
> ---

I am writing to express my dissent regarding the proposal to add basic=20
information about the role of hierarchical (multi-level) page tables in=20
mapping virtual memory to physical page frames. While I understand the=20
importance of documentation, I believe that including such fundamental=20
operating system concepts in the specialized Linux kernel documentation wou=
ld=20
be redundant and unnecessary.

The proposed addition appears to be a combination of trivia and a basic=20
Operating Systems I course that one might encounter during their second yea=
r=20
as an undergraduate student studying Computer Science or Computer Engineeri=
ng.=20

AFAIK, these concepts are already taught extensively to individuals pursuin=
g a=20
B.Sc. degree in Computer Science or a related field, both in Italy, where I=
=20
live, and elsewhere. Therefore, it seems unlikely that Linux kernel develop=
ers=20
would be unfamiliar with such fundamental topics, such as the mapping of=20
virtual memory to physical page frames using multi-level (hierarchical) pag=
e=20
tables.

I question the target audience of this documentation. How can we expect any=
=20
developer working with Linux to be unaware of such basic concepts? Adding=20
documentation about these foundational concepts would create a precedent,=20
potentially leading to further documentation on other fundamental abstracti=
ons=20
like "task," "multi-threading," and "scheduling" =E2=80=93 concepts that ar=
e integral=20
to kernel management. The inclusion of such basic topics could quickly clut=
ter=20
up the specialized Linux kernel documentation.

Let us not forget that there is a wealth of resources available outside the=
=20
Linux kernel documentation. Books on OS theory or online courses from estee=
med=20
universities can easily provide individuals with the necessary knowledge on=
=20
these fundamental concepts. Encouraging developers to explore these externa=
l=20
resources fosters a culture of continuous learning and self-improvement,=20
benefiting the entire Linux development community.

In conclusion, I respectfully oppose the proposal to add basic operating=20
system concepts, such as the hierarchical page tables, to the official Linu=
x=20
kernel documentation. I believe that such information is readily accessible=
=20
through existing resources and that the specialized documentation should fo=
cus=20
on advanced topics and unique aspects specific to the Linux kernel.

Thank you for considering my perspective.

Regards,

=46abio M. De Francesco

P.S.: The only parts I find enough interesting are those regarding the name=
s=20
of the types and other few bits of information, only because these are inde=
ed=20
Linux kernel focused and may not be found in the above-mentioned wealth of=
=20
resources available outside, like Tanenbaum's and Silberschatz's books=20
(however I'm not entirely sure they miss those information).=20

> ChangeLog v4->v5:
> - Drop the word "target" from the paragraph about virtual
>   addresses as pointed out by Matthew Wilcox.
> - Drop "program counter" mention in paragraph about physical and
>   virtual addresses as pointed out by Matthew Wilcox.
> - Update the changelog below to reflect who provided which
>   feedback so everybode can see that their feedback is being
>   taken into account.
> - Collect Mike Rapoports Review tag.
> ChangeLog v3->v4:
> - Singularis to pluralis fix pointed out by Jonathan Cameron
> - Reword the origin story about hierarchical page tables a bit
>   inspired by the input from Mike Rapoport.
> ChangeLog v2->v3:
> - Fix the page size example, also have examples for both 4K and
>   16K pages since people will confront these in response to
>   feedback from Kuan-Ying Lee.
> - Add a section explaining a bit why we have hierarchical
>   page tables at all.
> ChangeLog v1->v2:
> - Fixed speling mistakes
> - Copyedit the paragraph on page frame numbers in response
>   to feedback from Matthew Wilcox.
> - Reverse the arrows in the page table hierarchy illustration in
>   response to feedback from Matthew Wilcox.
> - Reverse the order of description of the page hierarchy levels in
>   response to feedback from Matthew Wilcox.
> - Create a new section for folding
> - Emphasize that architectures should try to be page hierarchy
>   neutral in response to feedback from Mike Rapoport.
> - Trying to better describe the fact that the lowest page table PTE
>   is called like that for historical reasons, in response to
>   sevaral comments on earlier blog posts on the subject.
> ---
>  Documentation/mm/page_tables.rst | 149 +++++++++++++++++++++++++++++++
>  1 file changed, 149 insertions(+)
>=20
> diff --git a/Documentation/mm/page_tables.rst
> b/Documentation/mm/page_tables.rst index 96939571d7bc..7840c1891751 100644
> --- a/Documentation/mm/page_tables.rst
> +++ b/Documentation/mm/page_tables.rst
> @@ -3,3 +3,152 @@
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  Page Tables
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Paged virtual memory was invented along with virtual memory as a concept=
 in
> +1962 on the Ferranti Atlas Computer which was the first computer with pa=
ged
> +virtual memory. The feature migrated to newer computers and became a de=
=20
facto
> +feature of all Unix-like systems as time went by. In 1985 the feature was
> +included in the Intel 80386, which was the CPU Linux 1.0 was developed o=
n.=20
+
> +Page tables map virtual addresses as seen by the CPU into physical=20
addresses
> +as seen on the external memory bus.
> +
> +Linux defines page tables as a hierarchy which is currently five levels =
in
> +height. The architecture code for each supported architecture will then
> +map this to the restrictions of the hardware.
> +
> +The physical address corresponding to the virtual address is often=20
referenced
> +by the underlying physical page frame. The **page frame number** or **pf=
n**
> +is the physical address of the page (as seen on the external memory bus)
> +divided by `PAGE_SIZE`.
> +
> +Physical memory address 0 will be *pfn 0* and the highest pfn will be
> +the last page of physical memory the external address bus of the CPU can
> +address.
> +
> +With a page granularity of 4KB and a address range of 32 bits, pfn 0 is =
at
> +address 0x00000000, pfn 1 is at address 0x00001000, pfn 2 is at 0x000020=
00
> +and so on until we reach pfn 0xfffff at 0xfffff000. With 16KB pages pfs =
are
> +at 0x00004000, 0x00008000 ... 0xffffc000 and pfn goes from 0 to 0x3fffff.
> +
> +As you can see, with 4KB pages the page base address uses bits 12-31 of =
the
> +address, and this is why `PAGE_SHIFT` in this case is defined as 12 and
> +`PAGE_SIZE` is usually defined in terms of the page shift as `(1 <<
> PAGE_SHIFT)` +
> +Over time a deeper hierarchy has been developed in response to increasing
> memory +sizes. When Linux was created, 4KB pages and a single page table
> called +`swapper_pg_dir` with 1024 entries was used, covering 4MB which
> coincided with +the fact that Torvald's first computer had 4MB of physical
> memory. Entries in +this single table were referred to as *PTE*:s - page
> table entries. +
> +The software page table hierarchy reflects the fact that page table=20
hardware
> has +become hierarchical and that in turn is done to save page table memo=
ry
> and +speed up mapping.
> +
> +One could of course imagine a single, linear page table with enormous=20
amounts
> +of entries, breaking down the whole memory into single pages. Such a page
> table +would be very sparse, because large portions of the virtual memory
> usually +remains unused. By using hierarchical page tables large holes in=
=20
the
> virtual +address space does not waste valuable page table memory, because=
 it
> will suffice +to mark large areas as unmapped at a higher level in the pa=
ge
> table hierarchy. +
> +Additionally, on modern CPUs, a higher level page table entry can point
> directly +to a physical memory range, which allows mapping a contiguous=20
range
> of several +megabytes or even gigabytes in a single high-level page table
> entry, taking +shortcuts in mapping virtual memory to physical memory: th=
ere
> is no need to +traverse deeper in the hierarchy when you find a large map=
ped
> range like this. +
> +The page table hierarchy has now developed into this::
> +
> +  +-----+
> +  | PGD |
> +  +-----+
> +     |
> +     |   +-----+
> +     +-->| P4D |
> +         +-----+
> +            |
> +            |   +-----+
> +            +-->| PUD |
> +                +-----+
> +                   |
> +                   |   +-----+
> +                   +-->| PMD |
> +                       +-----+
> +                          |
> +                          |   +-----+
> +                          +-->| PTE |
> +                              +-----+
> +
> +
> +Symbols on the different levels of the page table hierarchy have the
> following +meaning beginning from the bottom:
> +
> +- **pte**, `pte_t`, `pteval_t` =3D **Page Table Entry** - mentioned earl=
ier.
> +  The *pte* is an array of `PTRS_PER_PTE` elements of the `pteval_t` typ=
e,
> each +  mapping a single page of virtual memory to a single page of physi=
cal
> memory. +  The architecture defines the size and contents of `pteval_t`.
> +
> +  A typical example is that the `pteval_t` is a 32- or 64-bit value with=
=20
the
> +  upper bits being a **pfn** (page frame number), and the lower bits bei=
ng
> some +  architecture-specific bits such as memory protection.
> +
> +  The **entry** part of the name is a bit confusing because while in Lin=
ux
> 1.0 +  this did refer to a single page table entry in the single top level
> page +  table, it was retrofitted to be an array of mapping elements when
> two-level +  page tables were first introduced, so the *pte* is the=20
lowermost
> page +  *table*, not a page table *entry*.
> +
> +- **pmd**, `pmd_t`, `pmdval_t` =3D **Page Middle Directory**, the hierar=
chy
> right +  above the *pte*, with `PTRS_PER_PMD` references to the *pte*:s.
> +
> +- **pud**, `pud_t`, `pudval_t` =3D **Page Upper Directory** was introduc=
ed
> after +  the other levels to handle 4-level page tables. It is potentially
> unused, +  or *folded* as we will discuss later.
> +
> +- **p4d**, `p4d_t`, `p4dval_t` =3D **Page Level 4 Directory** was introd=
uced=20
to
> +  handle 5-level page tables after the *pud* was introduced. Now it was
> clear +  that we needed to replace *pgd*, *pmd*, *pud* etc with a figure
> indicating the +  directory level and that we cannot go on with ad hoc na=
mes
> any more. This +  is only used on systems which actually have 5 levels of
> page tables, otherwise +  it is folded.
> +
> +- **pgd**, `pgd_t`, `pgdval_t` =3D **Page Global Directory** - the Linux=
=20
kernel
> +  main page table handling the PGD for the kernel memory is still found =
in=20
+
>  `swapper_pg_dir`, but each userspace process in the system also has its =
own
> +  memory context and thus its own *pgd*, found in `struct mm_struct` whi=
ch=20
+
>  in turn is referenced to in each `struct task_struct`. So tasks have mem=
ory
> +  context in the form of a `struct mm_struct` and this in turn has a +=20
> `struct pgt_t *pgd` pointer to the corresponding page global directory. +
> +To repeat: each level in the page table hierarchy is a *array of pointer=
s*,
> so +the **pgd** contains `PTRS_PER_PGD` pointers to the next level below,
> **p4d** +contains `PTRS_PER_P4D` pointers to **pud** items and so on. The
> number of +pointers on each level is architecture-defined.::
> +
> +        PMD
> +  --> +-----+           PTE
> +      | ptr |-------> +-----+
> +      | ptr |-        | ptr |-------> PAGE
> +      | ptr | \       | ptr |
> +      | ptr |  \        ...
> +      | ... |   \
> +      | ptr |    \         PTE
> +      +-----+     +----> +-----+
> +                         | ptr |-------> PAGE
> +                         | ptr |
> +                           ...
> +
> +
> +Page Table Folding
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +If the architecture does not use all the page table levels, they can be
> *folded* +which means skipped, and all operations performed on page tables
> will be +compile-time augmented to just skip a level when accessing the n=
ext
> lower +level.
> +
> +Page table handling code that wishes to be architecture-neutral, such as=
=20
the
> +virtual memory manager, will need to be written so that it traverses all=
 of
> the +currently five levels. This style should also be preferred for
> +architecture-specific code, so as to be robust to future changes.
> --
> 2.40.1




