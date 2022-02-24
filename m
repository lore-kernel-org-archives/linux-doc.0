Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8DB0EC433F5
	for <linux-doc@archiver.kernel.org>; Thu, 24 Feb 2022 05:55:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230200AbiBXF4D (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 24 Feb 2022 00:56:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59332 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229873AbiBXF4C (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 24 Feb 2022 00:56:02 -0500
Received: from mail-yw1-x112c.google.com (mail-yw1-x112c.google.com [IPv6:2607:f8b0:4864:20::112c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2F6C2649B6
        for <linux-doc@vger.kernel.org>; Wed, 23 Feb 2022 21:55:32 -0800 (PST)
Received: by mail-yw1-x112c.google.com with SMTP id 00721157ae682-2d646fffcc2so13474547b3.4
        for <linux-doc@vger.kernel.org>; Wed, 23 Feb 2022 21:55:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kvhU+1d1xBuiwuTvVQmOP1FBfYrMuzDuvR5ypoAEjro=;
        b=CEt6WoNPJExnK4pZ3D56UCeA564FCpoElTbHUG7guQrxewH8Ef4bcrKv615NXBRlGg
         vBtPBeEeoQNZU2567HdocwW4qpALbKec2QFSlYDInWSsnOW9/wYQI+frra60lxHZ7ej6
         KA492jINm/YiiL6pOlnXDFLQiP7GcwKeFrkBl20tJ3fcDCto8o94c472V781OracUOuN
         UBhtq3m3eMFoVLMR7ZohfgfjkR04+UvHT35hf/wePMDEOiF2kkqpub3oDeKVbp51W+Wn
         BnexbEPlDwQhzil3kFMp4DDSV2lqRwKClXc4VIDKzeyVgImJeXRENSj9cnUzXqXJnxun
         uY2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kvhU+1d1xBuiwuTvVQmOP1FBfYrMuzDuvR5ypoAEjro=;
        b=spvnRltWOt+Em9zKMxVZ0c5TrtNR1zHgItDqcTN2ODM7MnEBtGXGQFZId1Mm8p8sJO
         1wyQV7oInXsePrO+Z15N6Er1qmWVPbIzupXMadvbpyKHwkwukGleBoO6Kn+x+jLTz4vs
         T3lIaEb5QqYlkEwRooPzM34h+WphCepIi86bJ7jzM+ngHsCPIySS6WX1Iasqpd+5Ieqs
         /4ml04iTnnW2tphvgYwQyit6LCZtpDncf/logb+hILD1GB4cXf0qcexfvm+Pmar/3O1U
         sKbAwYLX2xdj05EgC4CiQvGXWLe4YYBSUaeQMTlYWueQiJVnhpV2JfxwygB/1yKM05hX
         kw6w==
X-Gm-Message-State: AOAM5312BiBLE4Rcqi6ZzdBKjKX9hodTWODMnr1Y3mEFExjWR2Pr6ugO
        sYgqO4N29fRC9jRsuuAejpunI+ugitHVCXE0qNlPKw==
X-Google-Smtp-Source: ABdhPJxQBX3Dc+MjzYS5ebkRBFbDibF6wIJL7Bn+424LeZUsSwel/NdC9XRIpxfLvof5dstbTtuwpAn4KzhMnTIfxz8=
X-Received: by 2002:a81:5dd6:0:b0:2d6:3041:12e0 with SMTP id
 r205-20020a815dd6000000b002d6304112e0mr976524ywb.331.1645682132153; Wed, 23
 Feb 2022 21:55:32 -0800 (PST)
MIME-Version: 1.0
References: <20220223194807.12070-1-joao.m.martins@oracle.com> <20220223194807.12070-5-joao.m.martins@oracle.com>
In-Reply-To: <20220223194807.12070-5-joao.m.martins@oracle.com>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Thu, 24 Feb 2022 13:54:54 +0800
Message-ID: <CAMZfGtXm5pLbTnzMCrWPg8Vm3gykB8XEg5DHFm0z1p1x2fhySQ@mail.gmail.com>
Subject: Re: [PATCH v6 4/5] mm/sparse-vmemmap: improve memory savings for
 compound devmaps
To:     Joao Martins <joao.m.martins@oracle.com>
Cc:     Linux Memory Management List <linux-mm@kvack.org>,
        Dan Williams <dan.j.williams@intel.com>,
        Vishal Verma <vishal.l.verma@intel.com>,
        Matthew Wilcox <willy@infradead.org>,
        Jason Gunthorpe <jgg@ziepe.ca>, Jane Chu <jane.chu@oracle.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Christoph Hellwig <hch@lst.de>, nvdimm@lists.linux.dev,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Feb 24, 2022 at 3:48 AM Joao Martins <joao.m.martins@oracle.com> wrote:
>
> A compound devmap is a dev_pagemap with @vmemmap_shift > 0 and it
> means that pages are mapped at a given huge page alignment and utilize
> uses compound pages as opposed to order-0 pages.
>
> Take advantage of the fact that most tail pages look the same (except
> the first two) to minimize struct page overhead. Allocate a separate
> page for the vmemmap area which contains the head page and separate for
> the next 64 pages. The rest of the subsections then reuse this tail
> vmemmap page to initialize the rest of the tail pages.
>
> Sections are arch-dependent (e.g. on x86 it's 64M, 128M or 512M) and
> when initializing compound devmap with big enough @vmemmap_shift (e.g.
> 1G PUD) it may cross multiple sections. The vmemmap code needs to
> consult @pgmap so that multiple sections that all map the same tail
> data can refer back to the first copy of that data for a given
> gigantic page.
>
> On compound devmaps with 2M align, this mechanism lets 6 pages be
> saved out of the 8 necessary PFNs necessary to set the subsection's
> 512 struct pages being mapped. On a 1G compound devmap it saves
> 4094 pages.
>
> Altmap isn't supported yet, given various restrictions in altmap pfn
> allocator, thus fallback to the already in use vmemmap_populate().  It
> is worth noting that altmap for devmap mappings was there to relieve the
> pressure of inordinate amounts of memmap space to map terabytes of pmem.
> With compound pages the motivation for altmaps for pmem gets reduced.
>
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
[...]
> diff --git a/include/linux/mm.h b/include/linux/mm.h
> index 5f549cf6a4e8..b0798b9c6a6a 100644
> --- a/include/linux/mm.h
> +++ b/include/linux/mm.h
> @@ -3118,7 +3118,7 @@ p4d_t *vmemmap_p4d_populate(pgd_t *pgd, unsigned long addr, int node);
>  pud_t *vmemmap_pud_populate(p4d_t *p4d, unsigned long addr, int node);
>  pmd_t *vmemmap_pmd_populate(pud_t *pud, unsigned long addr, int node);
>  pte_t *vmemmap_pte_populate(pmd_t *pmd, unsigned long addr, int node,
> -                           struct vmem_altmap *altmap);
> +                           struct vmem_altmap *altmap, struct page *block);

Have forgotten to update @block to @reuse here.

[...]
> +
> +static int __meminit vmemmap_populate_range(unsigned long start,
> +                                           unsigned long end,
> +                                           int node, struct page *page)

All of the users are passing a valid parameter of @page. This function
will populate the vmemmap with the @page and without memory
allocations. So the @node parameter seems to be unnecessary.

If you want to make this function more generic like
vmemmap_populate_address() to handle memory allocations
(the case of @page == NULL). I think vmemmap_populate_range()
should add another parameter of `struct vmem_altmap *altmap`.
Otherwise, is it better to remove @node and rename @page to @reuse?

Thanks.
