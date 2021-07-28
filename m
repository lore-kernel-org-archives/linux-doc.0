Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4C9AC4338F
	for <linux-doc@archiver.kernel.org>; Wed, 28 Jul 2021 16:10:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B769B60EE6
	for <linux-doc@archiver.kernel.org>; Wed, 28 Jul 2021 16:10:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237461AbhG1QKh (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 28 Jul 2021 12:10:37 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34122 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237142AbhG1QJJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 28 Jul 2021 12:09:09 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A2B86C0613C1
        for <linux-doc@vger.kernel.org>; Wed, 28 Jul 2021 09:09:07 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id f13so3284511plj.2
        for <linux-doc@vger.kernel.org>; Wed, 28 Jul 2021 09:09:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=dCQLDiGzGaw5khKMcicFqIWA7WbxBFG59Mi4mmTKjP0=;
        b=Zh7MdYG5QgOP64vqrb7lbYeY93i3cwWAvTTjVgdU6ZiR5NgBFW3bdALx6J7uPOQoRb
         6B23hH/qIey5KgUh98nt4YGqo+DWrvTNM+ZaDIEddtjOUPjuJSw2CTBiXfvfiFGFp9i5
         mg7Kcb8eH5gsWTYezGJgQIh5losNkyz74gS7NSLLqEkItB7FaKz+dpKyLfeqwVFWtvds
         GGFjQzbJ9vfYvbLEyiYfwWqVkI86pfpezrWtplwONff5jp66jw9DY2yrdvpLhGwoV6zj
         VHjeU2lt95i22FfdytELXe06fUp59d1EpQgfecz6Z6GEWwwV8xAgqklIozocVIxfS2sm
         4sZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=dCQLDiGzGaw5khKMcicFqIWA7WbxBFG59Mi4mmTKjP0=;
        b=All6gUKZ6pX0Tg92OD9OIOp1MdpUZmYOv69Jghzq0USKPlO/8+bzFGWJADwHBrix2L
         G4I0Va7WKqCfKe84dr6qsh9CZjvnKLwOKCSfaMbYAkTFEsWZMolQJIIyk9lqlIA8GwzQ
         cKVQW+c9atM2ctn/pnJQygjakITEMPJmu8M0tddG5YWCZ38zVXREZZ5b9vFO7rmwCcuk
         rGvM568g0pALzSQhUhOhNdhItJqmsIFFKdWpoZKN9/Uaqlusx3SRnwRLB9US2M3djUh3
         RJ86Wpm3D5nde5nqWrBTzNjyRDPyyXi0WhXStolNKsGygIwrH9szXQs/ls7unA4TmRhn
         CoEQ==
X-Gm-Message-State: AOAM530qFGveD3vMweTvpv+0cd0uekIuL82LCL1bqRxK/hk997p0ssp2
        Tw3G9HSpHmfvVAsKVAzl7XhAFnCODBaMAX4lCuBsKg==
X-Google-Smtp-Source: ABdhPJwhvTdmZ49xWIqwGIKOae57+qV07eOtZyDgQmpn/2iflEi2gfPYAwXeBWCiOl/KnWL8UWSxbu19S+E3ldWNuf8=
X-Received: by 2002:a17:902:ab91:b029:12b:8dae:b1ff with SMTP id
 f17-20020a170902ab91b029012b8daeb1ffmr407924plr.52.1627488547209; Wed, 28 Jul
 2021 09:09:07 -0700 (PDT)
MIME-Version: 1.0
References: <20210714193542.21857-1-joao.m.martins@oracle.com>
 <20210714193542.21857-10-joao.m.martins@oracle.com> <CAPcyv4gDndA612+1BKZcR518K_Rt3Q1gWpqK24KOqvoFp_PNGg@mail.gmail.com>
 <dd8f9a7a-1036-bda9-73a0-a2c6bcad5a56@oracle.com>
In-Reply-To: <dd8f9a7a-1036-bda9-73a0-a2c6bcad5a56@oracle.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Wed, 28 Jul 2021 09:08:56 -0700
Message-ID: <CAPcyv4iROoeKcVTKpVyUr+hrmKJxj7QnCS5pGPAnhLDvChHXJw@mail.gmail.com>
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

On Wed, Jul 28, 2021 at 8:56 AM Joao Martins <joao.m.martins@oracle.com> wrote:
>
> On 7/28/21 8:28 AM, Dan Williams wrote:
> > On Wed, Jul 14, 2021 at 12:36 PM Joao Martins <joao.m.martins@oracle.com> wrote:
> >>
> >> +       /*
> >> +        * With compound page geometry and when struct pages are stored in ram
> >> +        * (!altmap) most tail pages are reused. Consequently, the amount of
> >> +        * unique struct pages to initialize is a lot smaller that the total
> >> +        * amount of struct pages being mapped.
> >> +        * See vmemmap_populate_compound_pages().
> >> +        */
> >> +       if (!altmap)
> >> +               nr_pages = min_t(unsigned long, nr_pages,
> >
> > What's the scenario where nr_pages is < 128? Shouldn't alignment
> > already be guaranteed?
> >
> Oh yeah, that's right.
>
> >> +                                2 * (PAGE_SIZE/sizeof(struct page)));
> >
> >
> >> +
> >>         __SetPageHead(page);
> >>
> >>         for (i = 1; i < nr_pages; i++) {
> >> @@ -6657,7 +6669,7 @@ void __ref memmap_init_zone_device(struct zone *zone,
> >>                         continue;
> >>
> >>                 memmap_init_compound(page, pfn, zone_idx, nid, pgmap,
> >> -                                    pfns_per_compound);
> >> +                                    altmap, pfns_per_compound);
> >
> > This feels odd, memmap_init_compound() doesn't really care about
> > altmap, what do you think about explicitly calculating the parameters
> > that memmap_init_compound() needs and passing them in?
> >
> > Not a strong requirement to change, but take another look at let me know.
> >
>
> Yeah, memmap_init_compound() indeed doesn't care about @altmap itself -- but a previous
> comment was to abstract this away in memmap_init_compound() given the mix of complexity in
> memmap_init_zone_device() PAGE_SIZE geometry case and the compound case:
>
> https://lore.kernel.org/linux-mm/CAPcyv4gtSqfmuAaX9cs63OvLkf-h4B_5fPiEnM9p9cqLZztXpg@mail.gmail.com/
>
> Before this was called @ntails above and I hide that calculation in memmap_init_compound().
>
> But I can move this back to the caller:
>
> memmap_init_compound(page, pfn, zone_idx, nid, pgmap,
>         (!altmap ? 2 * (PAGE_SIZE/sizeof(struct page))) : pfns_per_compound);
>
> Or with another helper like:
>
> #define compound_nr_pages(__altmap, __nr_pages) \
>                 (!__altmap ? 2 * (PAGE_SIZE/sizeof(struct page))) : __nr_pages);
>
> memmap_init_compound(page, pfn, zone_idx, nid, pgmap,
>                      compound_nr_pages(altmap, pfns_per_compound));

I like the helper, but I'd go further to make it a function with a
comment that it is a paired / mild layering violation with explicit
knowledge of how the sparse_vmemmap() internals handle compound pages
in the presence of an altmap. I.e. if someone later goes to add altmap
support, leave them a breadcrumb that they need to update both
locations.
