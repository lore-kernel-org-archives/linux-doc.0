Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 481FAC4338F
	for <linux-doc@archiver.kernel.org>; Wed, 28 Jul 2021 18:03:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2A10C60EE2
	for <linux-doc@archiver.kernel.org>; Wed, 28 Jul 2021 18:03:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229620AbhG1SDa (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 28 Jul 2021 14:03:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229542AbhG1SD3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 28 Jul 2021 14:03:29 -0400
Received: from mail-pj1-x102e.google.com (mail-pj1-x102e.google.com [IPv6:2607:f8b0:4864:20::102e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B776C061757
        for <linux-doc@vger.kernel.org>; Wed, 28 Jul 2021 11:03:28 -0700 (PDT)
Received: by mail-pj1-x102e.google.com with SMTP id pf12-20020a17090b1d8cb0290175c085e7a5so11352537pjb.0
        for <linux-doc@vger.kernel.org>; Wed, 28 Jul 2021 11:03:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=R1mxyscdyw51Q+xf2U4a9dfGTlTYfyhHnE9YRUiO79A=;
        b=SezFOYExPlp2dNoYE7NNWxkf9d08LcuwryvGTIgNr4enzdy1NZPbjKqzT067NwUsj+
         gEBJgxQcIlH7d1D0ySI8ZNjxmiIPC45JQWjzaiZcTsEPkE9tnOm9cV0FV3x0I5toyM81
         F+vkMTUGoa/bsDR8/raykp4tWGlhNqaJvLZwL+kAGGQqA+7dEeTq5OjXTYYk808qWzPX
         KVrhPXeps4RmHXPf5kIqT0dsEE9y6YUtcrv4slqPS73Uh7k7ohYoeAACdAy1mMW6Dsay
         G7LIFkJXfyy2iAhfCoW5ldaFu0gigb5sA8O+u8es4k7h2tXuZPZ1l1Vb9wsxRtux7m0i
         xkUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=R1mxyscdyw51Q+xf2U4a9dfGTlTYfyhHnE9YRUiO79A=;
        b=OdSQBLl7/KLm8I/OhnEM/pGI2gzfHSu7VRNUC6vTS1rc+m27ggTZ1fuSSyaaKVrmo7
         SwwDGiUWrKnFgTPZSnH44G9ChkGa67PpmVo0yTwrffOzgX7+gA/F0XJHkiUD7MUBnLZw
         iicna1WKZ+Pn5wmdTwS69uEX9fYwpI0E0XjxLdk/2lMRWRnKUt+5YcQgfVitXTQaR3Xs
         3+X4QkXuOxoqzdLdWG0s9NHOOv3QfPUbDrQLzhkKQ1QkV+N4bmbsCGM2QuYrUup5Jg7Z
         gjB8s1/wbXAi4saAW5biUO4M0kL6L//S8Rjzz3tgwD+tLeLwYKDI0vpvjDGN0GgMrzEb
         +JuQ==
X-Gm-Message-State: AOAM531rglIRwZjeoJt1afXHR5erH70NG4rVfyhDzU97v8zvfA3Mj1cq
        G2z70gEClJvm+WGDlWGFpMkcF1AmFrq75SmAIspAcw==
X-Google-Smtp-Source: ABdhPJzYa5H9v4fabmNToov9Ab65TCi56koXLkxBg5XiPcwGw8nhQ8zvGZgpQia+SnmV+M49yjLIgI7TyF0MgjR/K/Q=
X-Received: by 2002:a17:90a:708c:: with SMTP id g12mr10908790pjk.13.1627495407682;
 Wed, 28 Jul 2021 11:03:27 -0700 (PDT)
MIME-Version: 1.0
References: <20210714193542.21857-1-joao.m.martins@oracle.com>
 <20210714193542.21857-9-joao.m.martins@oracle.com> <CAPcyv4jPWSeP3jOKiEy0ko4Yy5SgAFmuD64ABgv=cRxHaQM7ew@mail.gmail.com>
 <131e77ec-6de4-8401-e7b0-7ff12abac04c@oracle.com>
In-Reply-To: <131e77ec-6de4-8401-e7b0-7ff12abac04c@oracle.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Wed, 28 Jul 2021 11:03:16 -0700
Message-ID: <CAPcyv4jR9atodmLqk4O+RdbM9DJDvoQvAZqH03UAgAKB71Fcdg@mail.gmail.com>
Subject: Re: [PATCH v3 08/14] mm/sparse-vmemmap: populate compound pagemaps
To:     Joao Martins <joao.m.martins@oracle.com>
Cc:     Linux MM <linux-mm@kvack.org>,
        Vishal Verma <vishal.l.verma@intel.com>,
        Dave Jiang <dave.jiang@intel.com>,
        Naoya Horiguchi <naoya.horiguchi@nec.com>,
        Matthew Wilcox <willy@infradead.org>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        John Hubbard <jhubbard@nvidia.com>,
        Jane Chu <jane.chu@oracle.com>,
        Muchun Song <songmuchun@bytedance.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux NVDIMM <nvdimm@lists.linux.dev>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jul 28, 2021 at 8:36 AM Joao Martins <joao.m.martins@oracle.com> wrote:
[..]
> +/*
> + * For compound pages bigger than section size (e.g. x86 1G compound
> + * pages with 2M subsection size) fill the rest of sections as tail
> + * pages.
> + *
> + * Note that memremap_pages() resets @nr_range value and will increment
> + * it after each range successful onlining. Thus the value or @nr_range
> + * at section memmap populate corresponds to the in-progress range
> + * being onlined here.
> + */
> +static bool compound_section_index(unsigned long start_pfn,

Oh, I was thinking this would return the actual Nth index number for
the section within the compound page. A bool is ok too, but then the
function name would be something like:

reuse_compound_section()

...right?


[..]
> [...] And here's compound_section_tail_huge_page() (for the last patch in the series):
>
>
> @@ -690,6 +727,33 @@ static struct page * __meminit compound_section_tail_page(unsigned
> long addr)
>         return pte_page(*ptep);
>  }
>
> +static struct page * __meminit compound_section_tail_huge_page(unsigned long addr,
> +                               unsigned long offset, struct dev_pagemap *pgmap)
> +{
> +       unsigned long geometry_size = pgmap_geometry(pgmap) << PAGE_SHIFT;
> +       pmd_t *pmdp;
> +
> +       addr -= PAGE_SIZE;
> +
> +       /*
> +        * Assuming sections are populated sequentially, the previous section's
> +        * page data can be reused.
> +        */
> +       pmdp = pmd_off_k(addr);
> +       if (!pmdp)
> +               return ERR_PTR(-ENOMEM);
> +
> +       /*
> +        * Reuse the tail pages vmemmap pmd page
> +        * See layout diagram in Documentation/vm/vmemmap_dedup.rst
> +        */
> +       if (offset % geometry_size > PFN_PHYS(PAGES_PER_SECTION))
> +               return pmd_page(*pmdp);
> +
> +       /* No reusable PMD fallback to PTE tail page*/
> +       return NULL;
> +}
> +
>  static int __meminit vmemmap_populate_compound_pages(unsigned long start_pfn,
>                                                      unsigned long start,
>                                                      unsigned long end, int node,
> @@ -697,14 +761,22 @@ static int __meminit vmemmap_populate_compound_pages(unsigned long
> start_pfn,
>  {
>         unsigned long offset, size, addr;
>
> -       if (compound_section_index(start_pfn, pgmap)) {
> -               struct page *page;
> +       if (compound_section_index(start_pfn, pgmap, &offset)) {
> +               struct page *page, *hpage;
> +
> +               hpage = compound_section_tail_huge_page(addr, offset);
> +               if (IS_ERR(hpage))
> +                       return -ENOMEM;
> +               else if (hpage)

No need for "else" after return... other than that these helpers and
this arrangement looks good to me.
