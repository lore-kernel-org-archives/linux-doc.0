Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35891C64E90
	for <linux-doc@archiver.kernel.org>; Mon, 30 Nov 2020 10:50:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BAD1320727
	for <linux-doc@archiver.kernel.org>; Mon, 30 Nov 2020 10:50:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="EqEeBGdI"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728475AbgK3KuD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 30 Nov 2020 05:50:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41392 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727571AbgK3KuC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 30 Nov 2020 05:50:02 -0500
Received: from mail-io1-xd44.google.com (mail-io1-xd44.google.com [IPv6:2607:f8b0:4864:20::d44])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BF965C0613D3
        for <linux-doc@vger.kernel.org>; Mon, 30 Nov 2020 02:49:22 -0800 (PST)
Received: by mail-io1-xd44.google.com with SMTP id i9so11258792ioo.2
        for <linux-doc@vger.kernel.org>; Mon, 30 Nov 2020 02:49:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FrBQ+cllYh0Y6esR/SPkKcDu8fDsRwcNF9P9vUYZvL4=;
        b=EqEeBGdID896KqQP2wGl3MacDZiftoQYvHOoa+q0ty3hiMysQXNvD+Cbzd5XWyH6oC
         /R/jipmJirrS7xxuCq09QfhPWJ6BcZs6J5DXml/OSDTep21CZvCNfFppev46/gu0R/Dp
         L8taqeCxff7s2jiuUfS1zwdg22lepLaEZGuQ0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FrBQ+cllYh0Y6esR/SPkKcDu8fDsRwcNF9P9vUYZvL4=;
        b=n8xoUDm//FNL7jJpvID0bZZbfHB/BS08pCrnq/08+7IZaCILZJrnnc3d39L5dGmeyW
         fsHCeGNnmF0t6QeTVXZMAHKBJ65Nb5e6JKXCpis29GZvfJQzWkwozd2YjyGK2Y5aJVFg
         bvLXWbfaOsP8Q/lLFemKsQnofRqECRKnBfphoeYHavblzGeC61QBvxN1tc2TC+/TEDzj
         QfLFKkg+6wiLFyjt8v/8jfGDHYlZU+VkAsV6AKP/MNhYsPMIvQRQZbS1J6dLaBuUqveT
         MLGfmwAc12Kj7cdgzWuxG43+SeLqLIk6w1AMQPewZpCey22Q/vBTDztB2OB1YPrGRTNj
         Esgg==
X-Gm-Message-State: AOAM531D4fSlJVYg4rRT8iXjb90sLn8FThbY64Q9BKq/BHD8ka8ZZ33F
        cZRpLNmPtnlyD9fR/ctTWBD/xBCdNLJziw==
X-Google-Smtp-Source: ABdhPJxYcSwJYQRZw+WJrYntCW1Eaey5wOa0vf9VMAjC5PcaQ2xglOlRPNaY22WkFu7ybtCSldd86Q==
X-Received: by 2002:a02:1007:: with SMTP id 7mr18802403jay.73.1606733361638;
        Mon, 30 Nov 2020 02:49:21 -0800 (PST)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com. [209.85.166.43])
        by smtp.gmail.com with ESMTPSA id h70sm5586066iof.31.2020.11.30.02.49.20
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 30 Nov 2020 02:49:20 -0800 (PST)
Received: by mail-io1-f43.google.com with SMTP id d8so10053524ioc.13
        for <linux-doc@vger.kernel.org>; Mon, 30 Nov 2020 02:49:20 -0800 (PST)
X-Received: by 2002:a02:c042:: with SMTP id u2mr12243455jam.32.1606733360204;
 Mon, 30 Nov 2020 02:49:20 -0800 (PST)
MIME-Version: 1.0
References: <20201125221917.150463-1-ribalda@chromium.org> <20201130083410.GD32234@lst.de>
In-Reply-To: <20201130083410.GD32234@lst.de>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Mon, 30 Nov 2020 11:49:09 +0100
X-Gmail-Original-Message-ID: <CANiDSCtE3TqOK0cbw0SJ3LfqCsM3B8AFjBomfj4hcftyHXYXLg@mail.gmail.com>
Message-ID: <CANiDSCtE3TqOK0cbw0SJ3LfqCsM3B8AFjBomfj4hcftyHXYXLg@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] media: uvcvideo: Use dma_alloc_noncontiguos API
To:     Christoph Hellwig <hch@lst.de>
Cc:     Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
        Joerg Roedel <joro@8bytes.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Christoph

On Mon, Nov 30, 2020 at 9:34 AM Christoph Hellwig <hch@lst.de> wrote:
>
> > +#ifndef CONFIG_DMA_NONCOHERENT
>
> I think you need to drop this ifdef.  This code should work just fine
> on noncoherent mips and sh platforms.
>
> > +     uvc_urb->pages = dma_alloc_noncontiguous(dma_dev, stream->urb_size,
> > +                                              &uvc_urb->dma,
> > +                                              gfp_flags | __GFP_NOWARN, 0);
> > +     if (!uvc_urb->pages)
> > +             return false;
> > +
> > +     uvc_urb->buffer = vmap(uvc_urb->pages,
> > +                            PAGE_ALIGN(stream->urb_size) >> PAGE_SHIFT,
> > +                            VM_DMA_COHERENT, PAGE_KERNEL);
> > +     if (!uvc_urb->buffer) {
> > +             dma_free_noncontiguous(dma_dev, stream->urb_size,
> > +                                    uvc_urb->pages, uvc_urb->dma);
> > +             return false;
> > +     }
> > +
> > +     if (sg_alloc_table_from_pages(&uvc_urb->sgt, uvc_urb->pages,
> > +                             PAGE_ALIGN(stream->urb_size) >> PAGE_SHIFT, 0,
> > +                             stream->urb_size, GFP_KERNEL)) {
> > +             vunmap(uvc_urb->buffer);
> > +             dma_free_noncontiguous(dma_dev, stream->urb_size,
> > +                                    uvc_urb->pages, uvc_urb->dma);
> > +             return false;
> > +     }
> > +
> > +     return true;
> > +}
>
> I wonder if we should lift this into a helper.  On the one hand I had
> proliferating struct scatterlist usage, on the other hand it is all over
> the media and drm code anyway, and duplicating this doesn't help anyone.
>
> Possibly including the fallback to the coherent allocating.

Probably Sergey has best opinion of this than mine. I only had to look
into one driver, he has been working with the vb2, which uses the API
much more.



-- 
Ricardo Ribalda
