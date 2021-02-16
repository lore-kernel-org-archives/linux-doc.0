Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 19518C433E0
	for <linux-doc@archiver.kernel.org>; Tue, 16 Feb 2021 08:16:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CED7464E00
	for <linux-doc@archiver.kernel.org>; Tue, 16 Feb 2021 08:16:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229907AbhBPIQ2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 16 Feb 2021 03:16:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56338 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229889AbhBPIQS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 16 Feb 2021 03:16:18 -0500
Received: from mail-ej1-x632.google.com (mail-ej1-x632.google.com [IPv6:2a00:1450:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2DCFAC061794
        for <linux-doc@vger.kernel.org>; Tue, 16 Feb 2021 00:15:10 -0800 (PST)
Received: by mail-ej1-x632.google.com with SMTP id y26so15059464eju.13
        for <linux-doc@vger.kernel.org>; Tue, 16 Feb 2021 00:15:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vzhTdPHbs48+KQ9HqL9TbcxPy1qXKHCXgtGLrYyU4FA=;
        b=SDYBzdh1dpId2B0EUuMVomU+ozCkhWpfs1MII9Mq81AfCJSc5faOJLTlj6CGDwNpnt
         T9dVAPZB1KagNR6cQdi/Dzj1kgnJrLp40S5cinUkqaayF2B49k70Rc+BiTzPMm8pmkaH
         LGPq1CT/uAiDDKllkdLKDHWgXS5omwWtay4p4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vzhTdPHbs48+KQ9HqL9TbcxPy1qXKHCXgtGLrYyU4FA=;
        b=qQ3ZNSYojxxk68es3QoNjgI09F4Qduj5WGnHr87iWBRM7kwNJ1WPxBRCs+8qMnDh8k
         mA9ZTcZXtU9xH5x/cNZTPNuN7VG49g1jhtZK1djiRtGka/B7BbQhhSdW8/rdVwpzFq8V
         /StfPyUj481BS5L9z4gA6AgNr+BGT+IiV/q6zLJ1VzSFrdXc7DmM79HEuufrMPyNqeM+
         Hw2ri/ON7HqzQaDAORg0NskFKHzE+bfgMCZNzw2omechIXT/zk93fXyreSB0EiDiyvMc
         fQT647sGsH2gm6L3O7PTBbtO925OCWyXpbUFkmNGqo1m2qJXO9JCoNczrUgKV1sN5pU8
         qNbg==
X-Gm-Message-State: AOAM530olGTd3EwV4s0lSWJ7IXoC6NZUegIUflWy6p9iZ+GX0eMX3MhF
        KTCNiz5t79woI69UXUJgSc9sxA6RYMtsWV98
X-Google-Smtp-Source: ABdhPJw+HlaVC61gLSDPlUofz17m3AZz3ekXLvNRn7YWj9K9RzyOg7+AlxMpiMZZ6KxU5ft9YmpxDQ==
X-Received: by 2002:a17:907:a059:: with SMTP id gz25mr19525577ejc.400.1613463308680;
        Tue, 16 Feb 2021 00:15:08 -0800 (PST)
Received: from mail-wr1-f50.google.com (mail-wr1-f50.google.com. [209.85.221.50])
        by smtp.gmail.com with ESMTPSA id o26sm4703824edr.16.2021.02.16.00.15.07
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 16 Feb 2021 00:15:07 -0800 (PST)
Received: by mail-wr1-f50.google.com with SMTP id g6so11862543wrs.11
        for <linux-doc@vger.kernel.org>; Tue, 16 Feb 2021 00:15:07 -0800 (PST)
X-Received: by 2002:adf:ea48:: with SMTP id j8mr22504831wrn.197.1613463306880;
 Tue, 16 Feb 2021 00:15:06 -0800 (PST)
MIME-Version: 1.0
References: <20210202095110.1215346-1-hch@lst.de> <20210202095110.1215346-7-hch@lst.de>
In-Reply-To: <20210202095110.1215346-7-hch@lst.de>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 16 Feb 2021 17:14:55 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BXAWeB2h4RvqsF1q8ip-Rhew80c7y1_og22-x3rS8KOQ@mail.gmail.com>
Message-ID: <CAAFQd5BXAWeB2h4RvqsF1q8ip-Rhew80c7y1_og22-x3rS8KOQ@mail.gmail.com>
Subject: Re: [PATCH 6/7] dma-iommu: implement ->alloc_noncontiguous
To:     Christoph Hellwig <hch@lst.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Sergey Senozhatsky <senozhatsky@google.com>,
        "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Christoph


On Tue, Feb 2, 2021 at 6:51 PM Christoph Hellwig <hch@lst.de> wrote:
>
> Implement support for allocating a non-contiguous DMA region.
>
> Signed-off-by: Christoph Hellwig <hch@lst.de>
> ---
>  drivers/iommu/dma-iommu.c | 35 +++++++++++++++++++++++++++++++++++
>  1 file changed, 35 insertions(+)
>
> diff --git a/drivers/iommu/dma-iommu.c b/drivers/iommu/dma-iommu.c
> index 85cb004d7a44c6..4e0b170d38d57a 100644
> --- a/drivers/iommu/dma-iommu.c
> +++ b/drivers/iommu/dma-iommu.c
> @@ -718,6 +718,7 @@ static struct page **__iommu_dma_alloc_noncontiguous(struct device *dev,
>                 goto out_free_sg;
>
>         sgt->sgl->dma_address = iova;
> +       sgt->sgl->dma_length = size;
>         return pages;
>
>  out_free_sg:
> @@ -755,6 +756,36 @@ static void *iommu_dma_alloc_remap(struct device *dev, size_t size,
>         return NULL;
>  }
>
> +#ifdef CONFIG_DMA_REMAP
> +static struct sg_table *iommu_dma_alloc_noncontiguous(struct device *dev,
> +               size_t size, enum dma_data_direction dir, gfp_t gfp)
> +{
> +       struct dma_sgt_handle *sh;
> +
> +       sh = kmalloc(sizeof(*sh), gfp);
> +       if (!sh)
> +               return NULL;
> +
> +       sh->pages = __iommu_dma_alloc_noncontiguous(dev, size, &sh->sgt, gfp,
> +                                                   PAGE_KERNEL, 0);

When working on the videobuf2 integration with Sergey I noticed that
we always pass 0 as DMA attrs here, which removes the ability for
drivers to use DMA_ATTR_ALLOC_SINGLE_PAGES.

It's quite important from a system stability point of view, because by
default the iommu_dma allocator would prefer big order allocations for
TLB locality reasons. For many devices, though, it doesn't really
affect the performance, because of random access patterns, so single
pages are good enough and reduce the risk of allocation failures or
latency due to fragmentation.

Do you think we could add the attrs parameter to the
dma_alloc_noncontiguous() API?

Best regards,
Tomasz
