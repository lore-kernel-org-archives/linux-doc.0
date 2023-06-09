Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4FFBEC7EE25
	for <linux-doc@archiver.kernel.org>; Fri,  9 Jun 2023 01:32:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237582AbjFIBcr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 8 Jun 2023 21:32:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230094AbjFIBcq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 8 Jun 2023 21:32:46 -0400
Received: from mail-pg1-x52b.google.com (mail-pg1-x52b.google.com [IPv6:2607:f8b0:4864:20::52b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D2FAD1FDF
        for <linux-doc@vger.kernel.org>; Thu,  8 Jun 2023 18:32:45 -0700 (PDT)
Received: by mail-pg1-x52b.google.com with SMTP id 41be03b00d2f7-53063897412so334650a12.0
        for <linux-doc@vger.kernel.org>; Thu, 08 Jun 2023 18:32:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20221208; t=1686274365; x=1688866365;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5tNkXumxetonM0fhivI/TpcSUbLoy7MO28arowfqEU4=;
        b=DFIunZ533S9VKwnlIt/Fo/F0nXze0Vz9ERPRq1yoiHBaSQ2HWEEYnLdgkk3Jh0iL22
         guDoQlsb8Z9XGmZL7bsaxOjRlWrvR127S9qQdcf2N11zciUcRHJm4QR6gv3Ep0gF+CxK
         2JQW5PObzga51vImum14dwwuRVoYamQCMtt+NPSuxr9bHhuGRBeQ3nTtlfLR4gtO9ZRl
         LkgdPWrKmayp2/wrqPbj+Y4z9JY66iBdUEv9EZCVOlMIRLfizDU0UXlcnT71S05Q8Fkh
         syC26iTJnG+C1ODQtRT9SKkHqLOtEVXqWOh/XweN536jC9rNr+WkOIIZ5Zh8FUGMjDn2
         5jEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686274365; x=1688866365;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5tNkXumxetonM0fhivI/TpcSUbLoy7MO28arowfqEU4=;
        b=e2EJQ7Y5vi/gITm1v5OdSuGCOPRzbc+ED7/OBKQLTRgAV5Gje4QVnewV7VWOQX9KfO
         OQ0hdOylhsC9o8iUBKnm2hGf6b7JfhFxkD7t8bhobXGP22JL2DAZZ478rgW08e88NqPr
         s9iz0PJNKmxMjXWykTODsC65XbDlhvK10TJgd/iC23Z7QzDcBlKDKLuHAx8n8X36xudG
         tIT96B9WfmVjfnRUsu/+PPnu0IdbsK6ukdgZSzsrWPP9c63EDPe/AN6ueLcf/taDMKxI
         vhAPTkcDGLN2ugsiEUnYWjZFV4gmZBaN0+8tDGnwKDUu6RFQ4vRMPfgHYCxemX0Q4ycz
         kj3w==
X-Gm-Message-State: AC+VfDy0vK2iJl2RQHhYplFcCoIDs4aS/Kaz7vPg3ewurykp5ZzNKfie
        JSHO9Cwvbw1cqDYZS2x0cHk=
X-Google-Smtp-Source: ACHHUZ74Vewvj94rPC4ucxrnK0wEjw3V2mPBQmuVWlONF/FB1bdFoxLz9oHBd8kBlCL5Cncqc57HBw==
X-Received: by 2002:a17:90a:194e:b0:256:2efc:270e with SMTP id 14-20020a17090a194e00b002562efc270emr206616pjh.5.1686274365005;
        Thu, 08 Jun 2023 18:32:45 -0700 (PDT)
Received: from debian.me (subs32-116-206-28-24.three.co.id. [116.206.28.24])
        by smtp.gmail.com with ESMTPSA id jj15-20020a170903048f00b001ae5d21e95csm2015575plb.117.2023.06.08.18.32.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 08 Jun 2023 18:32:44 -0700 (PDT)
Received: by debian.me (Postfix, from userid 1000)
        id 4C7C9106A94; Fri,  9 Jun 2023 08:32:42 +0700 (WIB)
Date:   Fri, 9 Jun 2023 08:32:42 +0700
From:   Bagas Sanjaya <bagasdotme@gmail.com>
To:     Linus Walleij <linus.walleij@linaro.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     linux-mm@kvack.org, linux-doc@vger.kernel.org,
        Matthew Wilcox <willy@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Mike Rapoport <rppt@kernel.org>
Subject: Re: [PATCH v2] Documentation/mm: Initial page table documentation
Message-ID: <ZIKBOs979PoNg_Xq@debian.me>
References: <20230608114928.3955640-1-linus.walleij@linaro.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
        protocol="application/pgp-signature"; boundary="vOKD3zxyvtxjk/dt"
Content-Disposition: inline
In-Reply-To: <20230608114928.3955640-1-linus.walleij@linaro.org>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org


--vOKD3zxyvtxjk/dt
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Jun 08, 2023 at 01:49:28PM +0200, Linus Walleij wrote:
> diff --git a/Documentation/mm/page_tables.rst b/Documentation/mm/page_tab=
les.rst
> index 96939571d7bc..315d295d1740 100644
> --- a/Documentation/mm/page_tables.rst
> +++ b/Documentation/mm/page_tables.rst
> @@ -3,3 +3,134 @@
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>  Page Tables
>  =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +Paged virtual memory was invented along with virtual memory as a concept=
 in
> +1962 on the Ferranti Atlas Computer which was the first computer with pa=
ged
> +virtual memory. The feature migrated to newer computers and became a de =
facto
> +feature of all Unix-like systems as time went by. In 1985 the feature was
> +included in the Intel 80386, which was the CPU Linux 1.0 was developed o=
n.
> +
> +Page tables map virtual addresses as seen by the CPU program counter into
> +physical addresses as seen on the external memory bus.
> +
> +Linux defines page tables as a hierarchy which is currently five levels =
in
> +height. The target architecture code for each supported architecture wil=
l then
> +map this to the restrictions of the target hardware.
> +
> +The physical address corresponding to the virtual address is often refer=
enced
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
> +address 0x00000000, pfn 1 is at address 0x00004000, pfn 2 is at 0x000080=
00
> +and so on until we reach pfn 0x3ffff at 0xffffc000.
> +
> +As you can see, with 4KB pages the page base address uses bits 12-31 of =
the
> +address, and this is why `PAGE_SHIFT` in this case is defined as 12 and
> +`PAGE_SIZE` is usually defined in terms of the page shift as `(1 << PAGE=
_SHIFT)`
> +
> +Over time a deeper hierarchy has been developed in response to increasin=
g memory
> +sizes. When Linux was created, 4KB pages and a single page table called
> +`swapper_pg_dir` with 1024 entries was used, covering 4MB which coincide=
d with
> +the fact that Torvald's first computer had 4MB of physical memory. Entri=
es in
> +this single table was referred to as *PTE*:s - page table entries.
> +
> +Over time the page table hierarchy has developed into this::
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
> +Symbols on the different levels of the page table hierarchy have the fol=
lowing
> +meaning beginning from the bottom:
> +
> +- **pte**, `pte_t`, `pteval_t` =3D **Page Table Entry** - mentioned earl=
ier.
> +  The *pte* is an array of `PTRS_PER_PTE` elements of the `pteval_t` typ=
e, each
> +  mapping a single page of virtual memory to a single page of physical m=
emory.
> +  The architecture defines the size and contents of `pteval_t`.
> +
> +  A typical example is that the `pteval_t` is a 32- or 64-bit value with=
 the
> +  upper bits being a **pfn** (page frame number), and the lower bits bei=
ng some
> +  architecture-specific bits such as memory protection.
> +
> +  The **entry** part of the name is a bit confusing because while in Lin=
ux 1.0
> +  this did refer to a single page table entry in the single top level pa=
ge
> +  table, it was retrofitted to be an array of mapping elements when two-=
level
> +  page tables were first introduced, so the *pte* is the lowermost page
> +  *table*, not a page table *entry*.
> +
> +- **pmd**, `pmd_t`, `pmdval_t` =3D **Page Middle Directory**, the hierar=
chy right
> +  above the *pte*, with `PTRS_PER_PMD` references to the *pte*:s.
> +
> +- **pud**, `pud_t`, `pudval_t` =3D **Page Upper Directory** was introduc=
ed after
> +  the other levels to handle 4-level page tables. It is potentially unus=
ed,
> +  or *folded* as we will discuss later.
> +
> +- **p4d**, `p4d_t`, `p4dval_t` =3D **Page Level 4 Directory** was introd=
uced to
> +  handle 5-level page tables after the *pud* was introduced. Now it was =
clear
> +  that we needed to replace *pgd*, *pmd*, *pud* etc with a figure indica=
ting the
> +  directory level and that we cannot go on with ad hoc names any more. T=
his
> +  is only used on systems which actually have 5 levels of page tables, o=
therwise
> +  it is folded.
> +
> +- **pgd**, `pgd_t`, `pgdval_t` =3D **Page Global Directory** - the Linux=
 kernel
> +  main page table handling the PGD for the kernel memory is still found =
in
> +  `swapper_pg_dir`, but each userspace process in the system also has it=
s own
> +  memory context and thus its own *pgd*, found in `struct mm_struct` whi=
ch
> +  in turn is referenced to in each `struct task_struct`. So tasks have m=
emory
> +  context in the form of a `struct mm_struct` and this in turn has a
> +  `struct pgt_t *pgd` pointer to the corresponding page global directory.
> +
> +To repeat: each level in the page table hierarchy is a *array of pointer=
s*, so
> +the **pgd** contains `PTRS_PER_PGD` pointers to the next level below, **=
p4d**
> +contains `PTRS_PER_P4D` pointers to **pud** items and so on. The number =
of
> +pointers on each level is architecture-defined.::
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
> +If the architecture does not use all the page table levels, they can be =
*folded*
> +which means skipped, and all operations performed on page tables will be
> +compile-time augmented to just skip a level when accessing the next lower
> +level.
> +
> +Page table handling code that wishes to be architecture-neutral, such as=
 the
> +virtual memory manager, will need to be written so that it traverses all=
 of the
> +currently five levels. This style should also be preferred for
> +architecture-specific code, so as to be robust to future changes.

LGTM, thanks!

Reviewed-by: Bagas Sanjaya <bagasdotme@gmail.com>

--=20
An old man doll... just what I always wanted! - Clara

--vOKD3zxyvtxjk/dt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQSSYQ6Cy7oyFNCHrUH2uYlJVVFOowUCZIKBOgAKCRD2uYlJVVFO
oyWPAP4tPIicRLVkVeIxyLxtXiboyASXfD6Xv4bT5nxiYRD7YwEAjafjjvukPGCh
wMMiWxbSOQdMvL/UHWlOTbljnsNiQwk=
=Z6Xj
-----END PGP SIGNATURE-----

--vOKD3zxyvtxjk/dt--
