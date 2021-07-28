Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1688DC4338F
	for <linux-doc@archiver.kernel.org>; Wed, 28 Jul 2021 07:28:40 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E7AE360F9C
	for <linux-doc@archiver.kernel.org>; Wed, 28 Jul 2021 07:28:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233336AbhG1H2k (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 28 Jul 2021 03:28:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232691AbhG1H2h (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 28 Jul 2021 03:28:37 -0400
Received: from mail-pl1-x62a.google.com (mail-pl1-x62a.google.com [IPv6:2607:f8b0:4864:20::62a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 73107C061757
        for <linux-doc@vger.kernel.org>; Wed, 28 Jul 2021 00:28:36 -0700 (PDT)
Received: by mail-pl1-x62a.google.com with SMTP id k1so1579044plt.12
        for <linux-doc@vger.kernel.org>; Wed, 28 Jul 2021 00:28:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XS+VOHsvs0BDMQ7Od7Fj7wB7ploLT17zyS/Mm8uN2pI=;
        b=RBLhKPAQEl0F2Gk7RblrUV+/XCohL9gpRhVzsIVxCyc2DQdzWvvn+jvewaDvvFRanB
         vWcFL1JvXet7/7l75wRmtYp/zc4Et3/PNEzBvYmNp50wGUyvqSTdgEQGuONOUfI+KupC
         BzOYxi77TmxMxOf8FX9rJQ//sH/7NAwcBWEQjWi1ea7LbKbaTqmZr2KpAkT57AUeTcLY
         Z9FBgQKtSv7CU1syxDHaCTjmPHB2gFMVmbTMovy0nDukAB52Vs/qRIPdXhz6zDmxyfWq
         m1RqLviDyyL+TcMGX1isOUz0C3Qxrb67xq06SXpDMFgU1jn5c5eMmG5I1fdMU9ko9kMX
         uAfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XS+VOHsvs0BDMQ7Od7Fj7wB7ploLT17zyS/Mm8uN2pI=;
        b=slkvRk7c5aag8li8MUyI5fSuoLfWyheuGtaVpJM4jTnvprbmuzVDqYFtTDmxWbrbAK
         OJI+cOmh5czCATn66bt6il5JWBrLDT70ebyfPcddcgKqMMyq2K9tOxxWrgmhwQFsePyF
         /jezimqfYDFG4q6JFDynjKfKQx+US8XAXMnheMtz9Vq1sFvblg6VyYYC87+uVETZ+6x4
         /oLG0Sl3HuiAfq6tRPUM6wQE+c7W+hrwjawtdkkNNDKJBuRe8WPL4bG+lzVbMWQoDS/L
         DqdD5eD9fmRRJz77ovSGSF/+A5NA7hQ92ytcPtm9/Z1h/dEZpaqXJCQ3+kC2Kvi4tboJ
         LOpw==
X-Gm-Message-State: AOAM531vVkY7IaLXzmwPJcIQ5nFzOfwxyW/4c+VwX4jNDRMyDwnO1EuN
        qFgjcBcFFvZVOZdYzODhjp7Vu/35fZH8UhZAFR2BeQ==
X-Google-Smtp-Source: ABdhPJyJtFyGQxkovKsEPZbhRVYmu725P6VFThFRtFpV9oE1g4j6NFPrbbDX1aS5MD11jQfv3A+alKdgHAyZJ9Q0EG0=
X-Received: by 2002:a05:6a00:d53:b029:32a:2db6:1be3 with SMTP id
 n19-20020a056a000d53b029032a2db61be3mr26523778pfv.71.1627457315925; Wed, 28
 Jul 2021 00:28:35 -0700 (PDT)
MIME-Version: 1.0
References: <20210714193542.21857-1-joao.m.martins@oracle.com> <20210714193542.21857-10-joao.m.martins@oracle.com>
In-Reply-To: <20210714193542.21857-10-joao.m.martins@oracle.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Wed, 28 Jul 2021 00:28:25 -0700
Message-ID: <CAPcyv4gDndA612+1BKZcR518K_Rt3Q1gWpqK24KOqvoFp_PNGg@mail.gmail.com>
Subject: Re: [PATCH v3 09/14] mm/page_alloc: reuse tail struct pages for
 compound pagemaps
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

On Wed, Jul 14, 2021 at 12:36 PM Joao Martins <joao.m.martins@oracle.com> wrote:
>
> Currently memmap_init_zone_device() ends up initializing 32768 pages
> when it only needs to initialize 128 given tail page reuse. That
> number is worse with 1GB compound page geometries, 262144 instead of
> 128. Update memmap_init_zone_device() to skip redundant
> initialization, detailed below.
>
> When a pgmap @geometry is set, all pages are mapped at a given huge page
> alignment and use compound pages to describe them as opposed to a
> struct per 4K.
>
> With @geometry > PAGE_SIZE and when struct pages are stored in ram
> (!altmap) most tail pages are reused. Consequently, the amount of unique
> struct pages is a lot smaller that the total amount of struct pages
> being mapped.
>
> The altmap path is left alone since it does not support memory savings
> based on compound pagemap geometries.
>
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> ---
>  mm/page_alloc.c | 14 +++++++++++++-
>  1 file changed, 13 insertions(+), 1 deletion(-)
>
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 188cb5f8c308..96975edac0a8 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -6600,11 +6600,23 @@ static void __ref __init_zone_device_page(struct page *page, unsigned long pfn,
>  static void __ref memmap_init_compound(struct page *page, unsigned long pfn,
>                                         unsigned long zone_idx, int nid,
>                                         struct dev_pagemap *pgmap,
> +                                       struct vmem_altmap *altmap,
>                                         unsigned long nr_pages)
>  {
>         unsigned int order_align = order_base_2(nr_pages);
>         unsigned long i;
>
> +       /*
> +        * With compound page geometry and when struct pages are stored in ram
> +        * (!altmap) most tail pages are reused. Consequently, the amount of
> +        * unique struct pages to initialize is a lot smaller that the total
> +        * amount of struct pages being mapped.
> +        * See vmemmap_populate_compound_pages().
> +        */
> +       if (!altmap)
> +               nr_pages = min_t(unsigned long, nr_pages,

What's the scenario where nr_pages is < 128? Shouldn't alignment
already be guaranteed?

> +                                2 * (PAGE_SIZE/sizeof(struct page)));


> +
>         __SetPageHead(page);
>
>         for (i = 1; i < nr_pages; i++) {
> @@ -6657,7 +6669,7 @@ void __ref memmap_init_zone_device(struct zone *zone,
>                         continue;
>
>                 memmap_init_compound(page, pfn, zone_idx, nid, pgmap,
> -                                    pfns_per_compound);
> +                                    altmap, pfns_per_compound);

This feels odd, memmap_init_compound() doesn't really care about
altmap, what do you think about explicitly calculating the parameters
that memmap_init_compound() needs and passing them in?

Not a strong requirement to change, but take another look at let me know.



>         }
>
>         pr_info("%s initialised %lu pages in %ums\n", __func__,
> --
> 2.17.1
>
