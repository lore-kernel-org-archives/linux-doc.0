Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7499EEB64DA
	for <linux-doc@archiver.kernel.org>; Wed,  5 Jul 2023 11:17:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231734AbjGELRK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 5 Jul 2023 07:17:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229772AbjGELRJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 5 Jul 2023 07:17:09 -0400
Received: from mail-qv1-xf34.google.com (mail-qv1-xf34.google.com [IPv6:2607:f8b0:4864:20::f34])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62118F2
        for <linux-doc@vger.kernel.org>; Wed,  5 Jul 2023 04:17:08 -0700 (PDT)
Received: by mail-qv1-xf34.google.com with SMTP id 6a1803df08f44-635eedf073eso45412186d6.2
        for <linux-doc@vger.kernel.org>; Wed, 05 Jul 2023 04:17:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1688555826; x=1691147826;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gLYbyyTNl2Zb/qjIIe6Qi+9jxk/pFwwBytcz2lbXZbY=;
        b=n9q+aZJ92FmViihc3PgbYyXboMxqgX5yjUrMehgL2YkOKQS8Q124VGBlFT6SrvnHQ+
         FablCQ64bt4FPIsq+6T+zM1U2uSZk+mykldx4YDRN4HB7hyl7mrTutmoG2joPgBVdX6S
         LqgbcrUJ30u/txmD+jETyZSSFXwImstD/opJ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1688555826; x=1691147826;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gLYbyyTNl2Zb/qjIIe6Qi+9jxk/pFwwBytcz2lbXZbY=;
        b=HJ3YIAYISnTDMyqwbED5mwKVL7Ww0uuLEU3zBs9QFNsqdVLGyLLbtZe6Yhxmw1a3ov
         BG3kWmTzgxnax8tbXz9NrE7oSqVH07g8blLmsSQfH6O0CxXQga+7FkAs1l6yt5qZ/0Ti
         g4rBTTF1qtAvZr+F+Vw0Tv8HIzuIrVe5OVBrqVOCxie2exeejQJKUPs5oWoD58CTXqI/
         OsmmQM/0+JGC06xPfoQcbuQjtFu8UTP2X0mL+RMvW8vHOku0fE/Ir+B/ET+bPvCx7YaO
         9mXf7dxdO/QrpKuMAqLar+MxnBKziDVUx7sjBE2ds58ClC48DO2LDzuf/24qtjRuPqNI
         ZaUw==
X-Gm-Message-State: ABy/qLYrAv4jssaU3hl/QCflGTzzf+Oi4CjOT6iOMh23k4SxDNBaug8m
        9XgE5D+4mIcA1rKz9yBf5N9m/n9TIHoHeLpH3TjGYg==
X-Google-Smtp-Source: APBJJlFHTD35mbKc10V3FfQvXUgzS8kkYf2yMSnh8VDu4jBTc+YfXNVTWnx4auQI7kOST0tI244I8Q==
X-Received: by 2002:a0c:f94a:0:b0:636:4f74:6e46 with SMTP id i10-20020a0cf94a000000b006364f746e46mr15012056qvo.56.1688555825811;
        Wed, 05 Jul 2023 04:17:05 -0700 (PDT)
Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com. [209.85.219.48])
        by smtp.gmail.com with ESMTPSA id l15-20020ad4444f000000b0062439f05b87sm13553814qvt.45.2023.07.05.04.17.04
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 05 Jul 2023 04:17:05 -0700 (PDT)
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-6348a8045a2so45407936d6.1
        for <linux-doc@vger.kernel.org>; Wed, 05 Jul 2023 04:17:04 -0700 (PDT)
X-Received: by 2002:a05:6214:15ce:b0:626:2e65:cb2b with SMTP id
 p14-20020a05621415ce00b006262e65cb2bmr15434310qvz.4.1688555824535; Wed, 05
 Jul 2023 04:17:04 -0700 (PDT)
MIME-Version: 1.0
References: <20210301085236.947011-1-hch@lst.de> <20210301085236.947011-4-hch@lst.de>
 <94d4b082-7b08-82e0-bb42-6ac36821ea61@arm.com>
In-Reply-To: <94d4b082-7b08-82e0-bb42-6ac36821ea61@arm.com>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 5 Jul 2023 20:16:54 +0900
X-Gmail-Original-Message-ID: <CAAFQd5AeoRwuXo9j0=AK-eBhUQx-S8qvJVHDoOf0=B+20FAn9g@mail.gmail.com>
Message-ID: <CAAFQd5AeoRwuXo9j0=AK-eBhUQx-S8qvJVHDoOf0=B+20FAn9g@mail.gmail.com>
Subject: Re: [PATCH 3/6] dma-mapping: add a dma_alloc_noncontiguous API
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Christoph Hellwig <hch@lst.de>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
        Sergey Senozhatsky <senozhatsky@google.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        iommu@lists.linux-foundation.org, linux-media@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jun 30, 2023 at 2:21=E2=80=AFAM Robin Murphy <robin.murphy@arm.com>=
 wrote:
>
> [Archaeology ensues...]
>
> On 2021-03-01 08:52, Christoph Hellwig wrote:
> [...]
> > +static struct sg_table *alloc_single_sgt(struct device *dev, size_t si=
ze,
> > +             enum dma_data_direction dir, gfp_t gfp)
> > +{
> > +     struct sg_table *sgt;
> > +     struct page *page;
> > +
> > +     sgt =3D kmalloc(sizeof(*sgt), gfp);
> > +     if (!sgt)
> > +             return NULL;
> > +     if (sg_alloc_table(sgt, 1, gfp))
> > +             goto out_free_sgt;
> > +     page =3D __dma_alloc_pages(dev, size, &sgt->sgl->dma_address, dir=
, gfp);
> > +     if (!page)
> > +             goto out_free_table;
> > +     sg_set_page(sgt->sgl, page, PAGE_ALIGN(size), 0);
> > +     sg_dma_len(sgt->sgl) =3D sgt->sgl->length;
> > +     return sgt;
> > +out_free_table:
> > +     sg_free_table(sgt);
> > +out_free_sgt:
> > +     kfree(sgt);
> > +     return NULL;
> > +}
> > +
> > +struct sg_table *dma_alloc_noncontiguous(struct device *dev, size_t si=
ze,
> > +             enum dma_data_direction dir, gfp_t gfp, unsigned long att=
rs)
> > +{
> > +     const struct dma_map_ops *ops =3D get_dma_ops(dev);
> > +     struct sg_table *sgt;
> > +
> > +     if (WARN_ON_ONCE(attrs & ~DMA_ATTR_ALLOC_SINGLE_PAGES))
> > +             return NULL;
> > +
> > +     if (ops && ops->alloc_noncontiguous)
> > +             sgt =3D ops->alloc_noncontiguous(dev, size, dir, gfp, att=
rs);
> > +     else
> > +             sgt =3D alloc_single_sgt(dev, size, dir, gfp);
> > +
> > +     if (sgt) {
> > +             sgt->nents =3D 1;
> > +             debug_dma_map_sg(dev, sgt->sgl, sgt->orig_nents, 1, dir);
>
> It turns out this is liable to trip up DMA_API_DEBUG_SG (potentially
> even in the alloc_single_sgt() case), since we've filled in sgt without
> paying attention to the device's segment boundary/size parameters.
>
> Now, it would be entirely possible to make the allocators "properly"
> partition the pages into multiple segments per those constraints, but
> given that there's no actual dma_map_sg() operation involved, and AFAIR
> the intent here is really only to describe a single DMA-contiguous
> buffer as pages, rather than represent a true scatter-gather operation,

Yeah, the name noncontiguous comes from potentially allocating
non-contiguous physical pages, which based on a few people I talked
with, ended up being quite confusing, but I can't really think of a
better name either.

Do we know how common devices with segment boundary/size constraints
are and how likely they are to use this API?

> I'm now wondering whether it makes more sense to just make dma-debug a
> bit cleverer instead. Any other opinions?

If we could assume that drivers for those devices shouldn't use this
API, we could just fail if the segment boundary/size are set to
something other than unlimited.

Best regards,
Tomasz

>
> Thanks,
> Robin.
>
> > +     }
> > +     return sgt;
> > +}
