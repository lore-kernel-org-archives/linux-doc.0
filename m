Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 976F9C12002
	for <linux-doc@archiver.kernel.org>; Thu, 15 Jul 2021 01:08:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6E43761005
	for <linux-doc@archiver.kernel.org>; Thu, 15 Jul 2021 01:08:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230072AbhGOBLS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 14 Jul 2021 21:11:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40032 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229909AbhGOBLS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 14 Jul 2021 21:11:18 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DCDAFC06175F
        for <linux-doc@vger.kernel.org>; Wed, 14 Jul 2021 18:08:25 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id b5-20020a17090a9905b029016fc06f6c5bso2913599pjp.5
        for <linux-doc@vger.kernel.org>; Wed, 14 Jul 2021 18:08:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=intel-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NN59F4vDIomsgEBtl8RXR+we5E2TKHGqeWPAOiMz83k=;
        b=ebWDJrPYcGhCMLRRnJefgXT043Kg8pFLEAtlL3VyJQiDiZuQH3KQFfdprQeMEabNar
         UjePn/JW7BVX+VHqq1f27aRC8x+jwZ4crlPjawlupdFEgvsQ/DHPfzbwBSF2aZ8JDbXL
         2j80xem3naLZ6+voKnmlWBi6wyVAuHp5lXxgpQ/nquuUr6bU/oYokMNyPB6vD01ZDvjE
         z4jtZbWC+NM0+HVC1eTdLJBu9CeRNHJZ8Tc7oTENW4cQYeO4G/+NrbUybGkxggjaEvU+
         dksLg470Niwmd+16f1F6FSO6fV6xwPqzT2uSgVmtfF0T53LSybyC7vidRzKAFL6lyviW
         0cIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NN59F4vDIomsgEBtl8RXR+we5E2TKHGqeWPAOiMz83k=;
        b=d951dJfM/X5z6tykY19nppFLU9HqsidZ1jnyOdauNjcQ7a6AGNFlOlk+KeQvxqmYS7
         SPCRkzvy/tWN8OjEOjGjKRaxACxRG8QYaUATr0uKHb2ssVGkoW5SOiQtqcKlAmcT1LYD
         e0UsxjV+Gp/l2I7ZxEM2RYcJJOUrddFJIjU6fhi+1blPGUFrBcIGWBpvBmR6dDNQys5W
         Bppbw8+opTT4r/f5hHZv/5z2uTPdbU4IvbrTyODYlphxNn9glbUmJ1rOmfkwrkJBzIWY
         ETJh9VhiicbCqjrAbuT6JITRTuf+qldpIUK/Ygw6rIoZuVaa/Re2kiKZvfYcQ6/Nto0+
         Y58Q==
X-Gm-Message-State: AOAM532SO2/Vna47aDseOg21okWkxZMd2ntz/+GRlV4UPGZsXi0ZQoAE
        H3QIVEaliShjtHekzUCYnWRgKjnRfdNDDCcH7kz/4Q==
X-Google-Smtp-Source: ABdhPJwtcooUH/eYMB5vJXqE/PQhaN/7W0oePw41gDnxWZv+L/ZaInmAjJON0D+NGCN2uutz7j4LgWuQlh82L9fw7cA=
X-Received: by 2002:a17:90a:8407:: with SMTP id j7mr6550677pjn.13.1626311305135;
 Wed, 14 Jul 2021 18:08:25 -0700 (PDT)
MIME-Version: 1.0
References: <20210714193542.21857-1-joao.m.martins@oracle.com> <20210714193542.21857-5-joao.m.martins@oracle.com>
In-Reply-To: <20210714193542.21857-5-joao.m.martins@oracle.com>
From:   Dan Williams <dan.j.williams@intel.com>
Date:   Wed, 14 Jul 2021 18:08:14 -0700
Message-ID: <CAPcyv4jwd_dzTH1H+cbiKqfK5=Xaa9JY=EVKHhPbjicVZA-URQ@mail.gmail.com>
Subject: Re: [PATCH v3 04/14] mm/memremap: add ZONE_DEVICE support for
 compound pages
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
> Add a new align property for struct dev_pagemap which specifies that a

s/align/@geometry/

> pagemap is composed of a set of compound pages of size @align,

s/@align/@geometry/

> instead of
> base pages. When a compound page geometry is requested, all but the first
> page are initialised as tail pages instead of order-0 pages.
>
> For certain ZONE_DEVICE users like device-dax which have a fixed page size,
> this creates an opportunity to optimize GUP and GUP-fast walkers, treating
> it the same way as THP or hugetlb pages.
>
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> ---
>  include/linux/memremap.h | 17 +++++++++++++++++
>  mm/memremap.c            |  8 ++++++--
>  mm/page_alloc.c          | 34 +++++++++++++++++++++++++++++++++-
>  3 files changed, 56 insertions(+), 3 deletions(-)
>
> diff --git a/include/linux/memremap.h b/include/linux/memremap.h
> index 119f130ef8f1..e5ab6d4525c1 100644
> --- a/include/linux/memremap.h
> +++ b/include/linux/memremap.h
> @@ -99,6 +99,10 @@ struct dev_pagemap_ops {
>   * @done: completion for @internal_ref
>   * @type: memory type: see MEMORY_* in memory_hotplug.h
>   * @flags: PGMAP_* flags to specify defailed behavior
> + * @geometry: structural definition of how the vmemmap metadata is populated.
> + *     A zero or PAGE_SIZE defaults to using base pages as the memmap metadata
> + *     representation. A bigger value but also multiple of PAGE_SIZE will set
> + *     up compound struct pages representative of the requested geometry size.
>   * @ops: method table
>   * @owner: an opaque pointer identifying the entity that manages this
>   *     instance.  Used by various helpers to make sure that no
> @@ -114,6 +118,7 @@ struct dev_pagemap {
>         struct completion done;
>         enum memory_type type;
>         unsigned int flags;
> +       unsigned long geometry;
>         const struct dev_pagemap_ops *ops;
>         void *owner;
>         int nr_range;
> @@ -130,6 +135,18 @@ static inline struct vmem_altmap *pgmap_altmap(struct dev_pagemap *pgmap)
>         return NULL;
>  }
>
> +static inline unsigned long pgmap_geometry(struct dev_pagemap *pgmap)
> +{
> +       if (!pgmap || !pgmap->geometry)
> +               return PAGE_SIZE;
> +       return pgmap->geometry;
> +}
> +
> +static inline unsigned long pgmap_pfn_geometry(struct dev_pagemap *pgmap)
> +{
> +       return PHYS_PFN(pgmap_geometry(pgmap));
> +}

Are both needed? Maybe just have ->geometry natively be in nr_pages
units directly, because pgmap_pfn_geometry() makes it confusing
whether it's a geometry of the pfn or the geometry of the pgmap.

> +
>  #ifdef CONFIG_ZONE_DEVICE
>  bool pfn_zone_device_reserved(unsigned long pfn);
>  void *memremap_pages(struct dev_pagemap *pgmap, int nid);
> diff --git a/mm/memremap.c b/mm/memremap.c
> index 805d761740c4..ffcb924eb6a5 100644
> --- a/mm/memremap.c
> +++ b/mm/memremap.c
> @@ -318,8 +318,12 @@ static int pagemap_range(struct dev_pagemap *pgmap, struct mhp_params *params,
>         memmap_init_zone_device(&NODE_DATA(nid)->node_zones[ZONE_DEVICE],
>                                 PHYS_PFN(range->start),
>                                 PHYS_PFN(range_len(range)), pgmap);
> -       percpu_ref_get_many(pgmap->ref, pfn_end(pgmap, range_id)
> -                       - pfn_first(pgmap, range_id));
> +       if (pgmap_geometry(pgmap) > PAGE_SIZE)

This would become

if (pgmap_geometry(pgmap) > 1)

> +               percpu_ref_get_many(pgmap->ref, (pfn_end(pgmap, range_id)
> +                       - pfn_first(pgmap, range_id)) / pgmap_pfn_geometry(pgmap));

...and this would be pgmap_geometry()

> +       else
> +               percpu_ref_get_many(pgmap->ref, pfn_end(pgmap, range_id)
> +                               - pfn_first(pgmap, range_id));
>         return 0;
>
>  err_add_memory:
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index 79f3b38afeca..188cb5f8c308 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -6597,6 +6597,31 @@ static void __ref __init_zone_device_page(struct page *page, unsigned long pfn,
>         }
>  }
>
> +static void __ref memmap_init_compound(struct page *page, unsigned long pfn,

I'd feel better if @page was renamed @head... more below:

> +                                       unsigned long zone_idx, int nid,
> +                                       struct dev_pagemap *pgmap,
> +                                       unsigned long nr_pages)
> +{
> +       unsigned int order_align = order_base_2(nr_pages);
> +       unsigned long i;
> +
> +       __SetPageHead(page);
> +
> +       for (i = 1; i < nr_pages; i++) {

The switch of loop styles is jarring. I.e. the switch from
memmap_init_zone_device() that is using pfn, end_pfn, and a local
'struct page *' variable to this helper using pfn + i and a mix of
helpers (__init_zone_device_page,  prep_compound_tail) that have
different expectations of head page + tail_idx and current page.

I.e. this reads more obviously correct to me, but maybe I'm just in
the wrong headspace:

        for (pfn = head_pfn + 1; pfn < end_pfn; pfn++) {
                struct page *page = pfn_to_page(pfn);

                __init_zone_device_page(page, pfn, zone_idx, nid, pgmap);
                prep_compound_tail(head, pfn - head_pfn);

> +               __init_zone_device_page(page + i, pfn + i, zone_idx,
> +                                       nid, pgmap);
> +               prep_compound_tail(page, i);
> +
> +               /*
> +                * The first and second tail pages need to
> +                * initialized first, hence the head page is
> +                * prepared last.

I'd change this comment to say why rather than restate what can be
gleaned from the code. It's actually not clear to me why this order is
necessary.

> +                */
> +               if (i == 2)
> +                       prep_compound_head(page, order_align);
> +       }
> +}
> +
>  void __ref memmap_init_zone_device(struct zone *zone,
>                                    unsigned long start_pfn,
>                                    unsigned long nr_pages,
> @@ -6605,6 +6630,7 @@ void __ref memmap_init_zone_device(struct zone *zone,
>         unsigned long pfn, end_pfn = start_pfn + nr_pages;
>         struct pglist_data *pgdat = zone->zone_pgdat;
>         struct vmem_altmap *altmap = pgmap_altmap(pgmap);
> +       unsigned int pfns_per_compound = pgmap_pfn_geometry(pgmap);
>         unsigned long zone_idx = zone_idx(zone);
>         unsigned long start = jiffies;
>         int nid = pgdat->node_id;
> @@ -6622,10 +6648,16 @@ void __ref memmap_init_zone_device(struct zone *zone,
>                 nr_pages = end_pfn - start_pfn;
>         }
>
> -       for (pfn = start_pfn; pfn < end_pfn; pfn++) {
> +       for (pfn = start_pfn; pfn < end_pfn; pfn += pfns_per_compound) {
>                 struct page *page = pfn_to_page(pfn);
>
>                 __init_zone_device_page(page, pfn, zone_idx, nid, pgmap);
> +
> +               if (pfns_per_compound == 1)
> +                       continue;
> +
> +               memmap_init_compound(page, pfn, zone_idx, nid, pgmap,
> +                                    pfns_per_compound);

I otherwise don't see anything broken with this patch, so feel free to include:

Reviewed-by: Dan Williams <dan.j.williams@intel.com>

...on the resend with the fixups.
