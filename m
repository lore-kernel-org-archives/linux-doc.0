Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 39671C432BE
	for <linux-doc@archiver.kernel.org>; Tue, 27 Jul 2021 23:51:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2231B60F6C
	for <linux-doc@archiver.kernel.org>; Tue, 27 Jul 2021 23:51:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233693AbhG0Xvz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 27 Jul 2021 19:51:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233553AbhG0Xvz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 27 Jul 2021 19:51:55 -0400
Received: from mail-pl1-x635.google.com (mail-pl1-x635.google.com [IPv6:2607:f8b0:4864:20::635])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B6035C061757
        for <linux-doc@vger.kernel.org>; Tue, 27 Jul 2021 16:51:54 -0700 (PDT)
Received: by mail-pl1-x635.google.com with SMTP id i1so452427plr.9
        for <linux-doc@vger.kernel.org>; Tue, 27 Jul 2021 16:51:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=MWdRDaBfoW5PPzzR7Hq7j4SJL6MRL4DymqLhS8uwcpU=;
        b=uu+mARo/11EfZ3JgX9cseNPjnRu/OEw1UbYrBE+Pe///dniIaeVlWuUP8bC98QGNnk
         zsiIUgi4DOenKBbUoznrHWM1+E9rJ1KFvDcBoEertOz+G0oR7ZBajO2WQDxNc22KHBOM
         hKaIGiBfQxcXhplZULU3i+4U1Dt0IBSTP8RKw2DOGh1IMmoPyMJLDNI+KcLaTNsXmeuq
         Qi4YirUR1wh5crzK59kqnYkdMdlPXa97aq5os5vBUQeMTNNEFXapI5hUF83HQt7+g+Vw
         Pw28mqqfK0euq7E1FrLIZSJLLINgjlDR5oD94hc6/3T8/qR2GPePGqlzV2SkORmKdf/4
         Z4VA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=MWdRDaBfoW5PPzzR7Hq7j4SJL6MRL4DymqLhS8uwcpU=;
        b=JQwVYc8Q9Y98fZ3gq6N9ORss0icrJGoB408PwGBD0DaXfcgS/Tt8VraXd6HTWOKGSN
         2MhfXhKAwH/O21FxLVs7Yf1IkNZe0ojK5NpIUNgUxbJ0mjtt0sN7q7ahzcY58tE6BKTn
         xiSrcYg14roo8pAmJkWkKbd/9OCy2IiVGquD70mNdljmS9+umWv7/CX4Uyzd91BUH6Au
         ZRqDKRQ01CqhjfcnIAfhhqyZssywK2GnnY9e/9/mdFdsUa6uwcwPmSWDTjFD002WLfHi
         bsqqxh49q8XF/JifBneWyx0v7Ed7+UlDznak8nTuEA5b7jqhjZ9YgbZftmzVpfXG+/98
         MGFg==
X-Gm-Message-State: AOAM533R3SUKYWKxFvZ3dv41+F7euqtetSwTGzlIMkmlCSBXjRkExJpy
        /cQpE3BG6Xtp6NV0WX+gU9leEorUhey0hDjJ0rClew==
X-Google-Smtp-Source: ABdhPJx7m66XqlSlNSIxMIRPDrdT8mKgrEeYJQaSly6V49raVmDKExqC5qQXY0gqPfJK+81APv/4wb6J6saf9VnmR+8=
X-Received: by 2002:a05:6a00:d53:b029:32a:2db6:1be3 with SMTP id
 n19-20020a056a000d53b029032a2db61be3mr25016662pfv.71.1627429914201; Tue, 27
 Jul 2021 16:51:54 -0700 (PDT)
MIME-Version: 1.0
References: <20210714193542.21857-1-joao.m.martins@oracle.com>
 <20210714193542.21857-13-joao.m.martins@oracle.com> <CAPcyv4h5c9afuxXy=UhrRr_tTwHB62RODyCKWNFU5TumXHc76A@mail.gmail.com>
 <f7217b61-c845-eaed-501e-c9e7067a6b87@oracle.com>
In-Reply-To: <f7217b61-c845-eaed-501e-c9e7067a6b87@oracle.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Tue, 27 Jul 2021 16:51:43 -0700
Message-ID: <CAPcyv4hRQhG+0ika-wbxSFYrpmMJHxxX456qE64PMxDoxS+Fwg@mail.gmail.com>
Subject: Re: [PATCH v3 12/14] device-dax: compound pagemap support
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

On Thu, Jul 15, 2021 at 5:01 AM Joao Martins <joao.m.martins@oracle.com> wrote:
>
> On 7/15/21 12:36 AM, Dan Williams wrote:
> > On Wed, Jul 14, 2021 at 12:36 PM Joao Martins <joao.m.martins@oracle.com> wrote:
> >>
> >> Use the newly added compound pagemap facility which maps the assigned dax
> >> ranges as compound pages at a page size of @align. Currently, this means,
> >> that region/namespace bootstrap would take considerably less, given that
> >> you would initialize considerably less pages.
> >>
> >> On setups with 128G NVDIMMs the initialization with DRAM stored struct
> >> pages improves from ~268-358 ms to ~78-100 ms with 2M pages, and to less
> >> than a 1msec with 1G pages.
> >>
> >> dax devices are created with a fixed @align (huge page size) which is
> >> enforced through as well at mmap() of the device. Faults, consequently
> >> happen too at the specified @align specified at the creation, and those
> >> don't change through out dax device lifetime. MCEs poisons a whole dax
> >> huge page, as well as splits occurring at the configured page size.
> >>
> >
> > Hi Joao,
> >
> > With this patch I'm hitting the following with the 'device-dax' test [1].
> >
> Ugh, I can reproduce it too -- apologies for the oversight.

No worries.

>
> This patch is not the culprit, the flaw is early in the series, specifically the fourth patch.
>
> It needs this chunk below change on the fourth patch due to the existing elevated page ref
> count at zone device memmap init. put_page() called here in memunmap_pages():
>
> for (i = 0; i < pgmap->nr_ranges; i++)
>         for_each_device_pfn(pfn, pgmap, i)
>                 put_page(pfn_to_page(pfn));
>
> ... on a zone_device compound memmap would otherwise always decrease head page refcount by
> @geometry pfn amount (leading to the aforementioned splat you reported).
>
> diff --git a/mm/memremap.c b/mm/memremap.c
> index b0e7b8cf3047..79a883af788e 100644
> --- a/mm/memremap.c
> +++ b/mm/memremap.c
> @@ -102,15 +102,15 @@ static unsigned long pfn_end(struct dev_pagemap *pgmap, int range_id)
>         return (range->start + range_len(range)) >> PAGE_SHIFT;
>  }
>
> -static unsigned long pfn_next(unsigned long pfn)
> +static unsigned long pfn_next(struct dev_pagemap *pgmap, unsigned long pfn)
>  {
>         if (pfn % 1024 == 0)
>                 cond_resched();
> -       return pfn + 1;
> +       return pfn + pgmap_pfn_geometry(pgmap);

The cond_resched() would need to be fixed up too to something like:

if (pfn % (1024 << pgmap_geometry_order(pgmap)))
    cond_resched();

...because the goal is to take a break every 1024 iterations, not
every 1024 pfns.

>  }
>
>  #define for_each_device_pfn(pfn, map, i) \
> -       for (pfn = pfn_first(map, i); pfn < pfn_end(map, i); pfn = pfn_next(pfn))
> +       for (pfn = pfn_first(map, i); pfn < pfn_end(map, i); pfn = pfn_next(map, pfn))
>
>  static void dev_pagemap_kill(struct dev_pagemap *pgmap)
>  {
>
> It could also get this hunk below, but it is sort of redundant provided we won't touch
> tail page refcount through out the devmap pages lifetime. This setting of tail pages
> refcount to zero was in pre-v5.14 series, but it got removed under the assumption it comes
> from the page allocator (where tail pages are already zeroed in refcount).

Wait, devmap pages never see the page allocator?

>
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 96975edac0a8..469a7aa5cf38 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -6623,6 +6623,7 @@ static void __ref memmap_init_compound(struct page *page, unsigned
> long pfn,
>                 __init_zone_device_page(page + i, pfn + i, zone_idx,
>                                         nid, pgmap);
>                 prep_compound_tail(page, i);
> +               set_page_count(page + i, 0);

Looks good to me and perhaps a for elevated tail page refcount at
teardown as a sanity check that the tail pages was never pinned
directly?

>
>                 /*
>                  * The first and second tail pages need to
