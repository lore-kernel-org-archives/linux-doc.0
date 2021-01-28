Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DA24C433DB
	for <linux-doc@archiver.kernel.org>; Thu, 28 Jan 2021 17:03:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 134EC64E13
	for <linux-doc@archiver.kernel.org>; Thu, 28 Jan 2021 17:03:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232884AbhA1RDb (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 28 Jan 2021 12:03:31 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47442 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232683AbhA1RBv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 28 Jan 2021 12:01:51 -0500
Received: from mail-il1-x129.google.com (mail-il1-x129.google.com [IPv6:2607:f8b0:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 63936C061756
        for <linux-doc@vger.kernel.org>; Thu, 28 Jan 2021 09:01:11 -0800 (PST)
Received: by mail-il1-x129.google.com with SMTP id e7so5861564ile.7
        for <linux-doc@vger.kernel.org>; Thu, 28 Jan 2021 09:01:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=gar8fBlSsZFzuxpXobcokllNvMKbpQD2Smckqot5AV0=;
        b=R3385CEDtxrszE24UXwkp0ZU2U/OxxdtH7/PIESlm6ZDdnLzURn5PTJpKHAz3HOjFV
         4jddEodBYlle4AtEzG4w+16LjwVOb8uZLdLeydFODHiifeRe1u+cD6DkQHyQ70QWZRDh
         sLAUPg5YB8to0myR+Mth92WbIszUnr71jwtds=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=gar8fBlSsZFzuxpXobcokllNvMKbpQD2Smckqot5AV0=;
        b=JdhDYPk6y+yYsxjomv8Zy4sInNxNBB4i3ykENOiInO0S1RyB59vZRB9o1L5c0iW2zx
         XROiGeXdsR2gzsPnmcZAwS6eXRjyQ8WHQFlcVFlmSmo9jhTdh0FESbKn8sFoD2eruLPr
         0+X5LzZh6g7EODnH9Oau2bpRLzAXz7AL7/3UiEnF0O4wT7z5QJAnCwzOTD/A+VVE3vL7
         o30bRI0fC5aWjHzAys57aJTUsb1gQFFYw0b7Zktqnhd5sW6lKPM9pniVJufiCWKFmPue
         nNhQDp//djLPpI54OFhInLEZiuHfSCUFvT6Vb7IXKExeUGI4vIHFGJEjXj5ukmT3zej3
         ensw==
X-Gm-Message-State: AOAM533rvuZ/Ec1f5yyuE2NxHt77kczoopoWJfdHT7ZMFOzJhoLJL3pO
        gUb9uadty8UWyrAF0t1wau38t+TExu+++oyR
X-Google-Smtp-Source: ABdhPJyQ88FopdP+WfD886fUebVxW1D7k7noPTIjs5NJoprDEq1Jir2i4f7sC7OGE+FQKaX+/rZOKA==
X-Received: by 2002:a92:1b57:: with SMTP id b84mr13578244ilb.256.1611853270571;
        Thu, 28 Jan 2021 09:01:10 -0800 (PST)
Received: from mail-io1-f48.google.com (mail-io1-f48.google.com. [209.85.166.48])
        by smtp.gmail.com with ESMTPSA id t5sm2799329ioc.15.2021.01.28.09.01.09
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 28 Jan 2021 09:01:09 -0800 (PST)
Received: by mail-io1-f48.google.com with SMTP id n2so6278660iom.7
        for <linux-doc@vger.kernel.org>; Thu, 28 Jan 2021 09:01:09 -0800 (PST)
X-Received: by 2002:a5d:9717:: with SMTP id h23mr506478iol.4.1611853268632;
 Thu, 28 Jan 2021 09:01:08 -0800 (PST)
MIME-Version: 1.0
References: <20210128145837.2250561-1-hch@lst.de> <20210128145837.2250561-7-hch@lst.de>
 <20210128150955.GA30563@lst.de>
In-Reply-To: <20210128150955.GA30563@lst.de>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Thu, 28 Jan 2021 18:00:57 +0100
X-Gmail-Original-Message-ID: <CANiDSCtV8eiH7r6-mX3QhsYvJapqRfYufu4-iqmeiy6GiwwE_A@mail.gmail.com>
Message-ID: <CANiDSCtV8eiH7r6-mX3QhsYvJapqRfYufu4-iqmeiy6GiwwE_A@mail.gmail.com>
Subject: Re: [PATCH 6/6] media: uvcvideo: Use dma_alloc_noncontiguos API
To:     Christoph Hellwig <hch@lst.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@google.com>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

HI Christoph

Thanks for your comments

On Thu, Jan 28, 2021 at 4:09 PM Christoph Hellwig <hch@lst.de> wrote:
>
> I just included this patch as-is, but here are a few comments:
>
> On Thu, Jan 28, 2021 at 03:58:37PM +0100, Christoph Hellwig wrote:
> > +static void uvc_urb_dma_sync(struct uvc_urb *uvc_urb, bool for_device)
> > +{
> > +     struct device *dma_dev = dma_dev = stream_to_dmadev(uvc_urb->stream);
> > +
> > +     if (for_device)
> > +             dma_sync_sgtable_for_device(dma_dev, uvc_urb->sgt,
> > +                                         DMA_FROM_DEVICE);
> > +     else
> > +             dma_sync_sgtable_for_cpu(dma_dev, uvc_urb->sgt,
> > +                                      DMA_FROM_DEVICE);
> > +}
>
> Given that we vmap the addresses this also needs
> flush_kernel_vmap_range / invalidate_kernel_vmap_range calls for
> VIVT architectures.

We only read from the device to the cpu. Then can we run only
invalidate_kernel_vmap_range() ?

something like ?
else {
          dma_sync_sgtable_for_cpu(dma_dev, uvc_urb->sgt, DMA_FROM_DEVICE);
           invalidate_kernel_vmap_range(uvc_urb->buffer,
uvc_urb->stream->urb_size );
}

Thanks!






--
Ricardo Ribalda
