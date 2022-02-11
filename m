Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 911A0C433FE
	for <linux-doc@archiver.kernel.org>; Fri, 11 Feb 2022 05:07:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233752AbiBKFHv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 11 Feb 2022 00:07:51 -0500
Received: from mxb-00190b01.gslb.pphosted.com ([23.128.96.19]:48704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231843AbiBKFHu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 11 Feb 2022 00:07:50 -0500
Received: from mail-yb1-xb34.google.com (mail-yb1-xb34.google.com [IPv6:2607:f8b0:4864:20::b34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 855A8109E
        for <linux-doc@vger.kernel.org>; Thu, 10 Feb 2022 21:07:49 -0800 (PST)
Received: by mail-yb1-xb34.google.com with SMTP id y6so21714084ybc.5
        for <linux-doc@vger.kernel.org>; Thu, 10 Feb 2022 21:07:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=33X30vxk37dYzlKfVsNBndW9y5tzzn+eqam1oXj5DfU=;
        b=K2t7CEZ+mg5lBHC6Nfm4ggzoDdrPcmY9ShGUEBWXtZTTQvZLFbbgmiiwAsXApjq/AY
         KRFAQR7JAxBB7aEXM2WuPUO/UIgyPUT/tQgHMAeoLiYmhpuj1/e8qLBM2fiqhsCDknYV
         D+d+hTQ6X2sh2NRFUlkpUYpmNGHmihDBR1FiXjy70Mz6t3nageB0Dmfg5QKNSjqCsPt4
         sBVaF1GursnStNLXh4RnDGjCKlzC5erE485WaGp0BbHyCJB3nNnVrFzZk9Gleo8YAGpP
         PijdDg9FS+yJyi5Aa6nhv97RLbRAG34Pg3vU6G2CNRrD5hw6lhV0vzYJa5CAQQad71/+
         Zb4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=33X30vxk37dYzlKfVsNBndW9y5tzzn+eqam1oXj5DfU=;
        b=7WaIe9+RhfILoU5Vjkc8gnybSwi3pjSVq9Fg7Ox4/mLUw4TPGdPC3NOiCoWuSpK2Gv
         mMY8kusys/WbwoyklppNE08dKVZupX2rjCBHUIFMxgsOFT7rOg/rrovZUbVMdAsd6Wtt
         UvIt6EZR4HxLuzk8qZcBoU8N9hTzGcukx51ZZimFYz1xxvG3Ay4ZwyLHxSr1W6OLHNdg
         FZ2jFv5nPRCO4f4wj2UCTZzHOKGmXZv3b6l4gtUYWf7E0x98Ra0mHb45lehlIN5HxTWy
         XZNzx2t7X32STLdivMinK57rEx1mmiaj9yA2/B/MmfvlEIUZVAP3U7QVvt0gkGntGEAU
         eURA==
X-Gm-Message-State: AOAM533w7+V9GNt4GLqOQ/IAv21cjjO1uOSOpc6kNqGDc441d/vsOSHH
        T1vE+360jz+18GMDYHgJvgD+WV5jK+55gK3SEo5Ipw==
X-Google-Smtp-Source: ABdhPJyxIcJRA3uyrQa6x9yxKUYyyPEjOzENFGfmwumjFTCzNfg1VvCaXqVbuX7V1DM5nDMFnV/WYvxy3qDITrJrmbc=
X-Received: by 2002:a81:ef04:: with SMTP id o4mr75353ywm.458.1644556068755;
 Thu, 10 Feb 2022 21:07:48 -0800 (PST)
MIME-Version: 1.0
References: <20220210193345.23628-1-joao.m.martins@oracle.com> <20220210193345.23628-6-joao.m.martins@oracle.com>
In-Reply-To: <20220210193345.23628-6-joao.m.martins@oracle.com>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Fri, 11 Feb 2022 13:07:11 +0800
Message-ID: <CAMZfGtXRPn3MPDpDEyFJJ98E3xTB65Q8_C+P92_XKsL-q8ah=w@mail.gmail.com>
Subject: Re: [PATCH v5 5/5] mm/page_alloc: reuse tail struct pages for
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

On Fri, Feb 11, 2022 at 3:34 AM Joao Martins <joao.m.martins@oracle.com> wrote:
>
> Currently memmap_init_zone_device() ends up initializing 32768 pages
> when it only needs to initialize 128 given tail page reuse. That
> number is worse with 1GB compound pages, 262144 instead of 128. Update
> memmap_init_zone_device() to skip redundant initialization, detailed
> below.
>
> When a pgmap @vmemmap_shift is set, all pages are mapped at a given
> huge page alignment and use compound pages to describe them as opposed
> to a struct per 4K.
>
> With @vmemmap_shift > 0 and when struct pages are stored in ram
> (!altmap) most tail pages are reused. Consequently, the amount of
> unique struct pages is a lot smaller that the total amount of struct
> pages being mapped.
>
> The altmap path is left alone since it does not support memory savings
> based on compound pages devmap.
>
> Signed-off-by: Joao Martins <joao.m.martins@oracle.com>
> ---
>  mm/page_alloc.c | 16 +++++++++++++++-
>  1 file changed, 15 insertions(+), 1 deletion(-)
>
> diff --git a/mm/page_alloc.c b/mm/page_alloc.c
> index cface1d38093..c10df2fd0ec2 100644
> --- a/mm/page_alloc.c
> +++ b/mm/page_alloc.c
> @@ -6666,6 +6666,20 @@ static void __ref __init_zone_device_page(struct page *page, unsigned long pfn,
>         }
>  }
>
> +/*
> + * With compound page geometry and when struct pages are stored in ram most
> + * tail pages are reused. Consequently, the amount of unique struct pages to
> + * initialize is a lot smaller that the total amount of struct pages being
> + * mapped. This is a paired / mild layering violation with explicit knowledge
> + * of how the sparse_vmemmap internals handle compound pages in the lack
> + * of an altmap. See vmemmap_populate_compound_pages().
> + */
> +static inline unsigned long compound_nr_pages(struct vmem_altmap *altmap,
> +                                             unsigned long nr_pages)
> +{
> +       return !altmap ? 2 * (PAGE_SIZE/sizeof(struct page)) : nr_pages;
> +}
> +

This means only the first 2 pages will be modified, the reset 6 or 4094 pages
do not.  In the HugeTLB case, those tail pages are mapped with read-only
to catch invalid usage on tail pages (e.g. write operations). Quick question:
should we also do similar things on DAX?

Thanks.
