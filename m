Return-Path: <SRS0=+dB3=DO=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25E5FC4363D
	for <linux-doc@archiver.kernel.org>; Wed,  7 Oct 2020 12:22:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BCC8220789
	for <linux-doc@archiver.kernel.org>; Wed,  7 Oct 2020 12:22:05 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="IxPec1in"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728039AbgJGMWD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 7 Oct 2020 08:22:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728313AbgJGMV7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 7 Oct 2020 08:21:59 -0400
Received: from mail-ed1-x544.google.com (mail-ed1-x544.google.com [IPv6:2a00:1450:4864:20::544])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7537FC061755
        for <linux-doc@vger.kernel.org>; Wed,  7 Oct 2020 05:21:58 -0700 (PDT)
Received: by mail-ed1-x544.google.com with SMTP id o18so1937999edq.4
        for <linux-doc@vger.kernel.org>; Wed, 07 Oct 2020 05:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=7rvcLVVp+iunfwmEIXwaT4iDFBQHHexJb1eiNV9hSvU=;
        b=IxPec1inBA3XKBVEkijHSe0RQpCGY6i5Zx4zjTGEvIdZRZSojpCqwegqlq2Nq47fA9
         ETWPZvj3lKfnnCodpnQMTpne/EEaRSnqKApQLAY/QOOMuJ6ODlUD5K+xr8MH0mWFKI+v
         b4AQOPg5faD6fDmYthS1vWnOiZeopihoSJ764=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=7rvcLVVp+iunfwmEIXwaT4iDFBQHHexJb1eiNV9hSvU=;
        b=IkPOFBD5qq/zcMzrHUvAUJMdAVJjSflsnyS0vcrqrIowS8mpOc+9sqaaqNuWjOA6Xo
         kR95hreFZ55d7osaB885TWETJMBUuZ3tPo6kq8Q2wElTSqmmuhAHUl11pbp3MUCak+6z
         aBheZy0ywOP56eNOMIuqvIQoMpqS4jUDVPjsmfA5YJrVeYz9GI2M+3P9A9wS64kozd7I
         01vtIdKdZiEVG1t9B7rombmdhThgC3Gh6RlZav3huHvHO5gD7Svo2FYU1zEMzBHIV46m
         WjkcCP7BsROeHj/x0TBLo9kg+baRAhWD3k1iZJqPa7WrIK94/Ls8o4P612J7ttXgmUOa
         GC9g==
X-Gm-Message-State: AOAM531M4vmH0wM5r7Crfe1d0B6p7ItskWBHgwnYDUBcnShzAIzPRGJq
        7QzesW2BYcPEA9xcSwqgl1QONcQ9ViLClg==
X-Google-Smtp-Source: ABdhPJxN2NyHB/HF0ofqeNsTItmWIVnwyv8ISKKxeAC+rOnG2WF3ZfNfYxpj/0z5W30hZGD4jSCfPw==
X-Received: by 2002:aa7:c3d4:: with SMTP id l20mr3343382edr.263.1602073316937;
        Wed, 07 Oct 2020 05:21:56 -0700 (PDT)
Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com. [209.85.221.51])
        by smtp.gmail.com with ESMTPSA id j22sm1208019edp.77.2020.10.07.05.21.54
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 07 Oct 2020 05:21:55 -0700 (PDT)
Received: by mail-wr1-f51.google.com with SMTP id n18so1920553wrs.5
        for <linux-doc@vger.kernel.org>; Wed, 07 Oct 2020 05:21:54 -0700 (PDT)
X-Received: by 2002:adf:f2ce:: with SMTP id d14mr2420557wrp.32.1602073314520;
 Wed, 07 Oct 2020 05:21:54 -0700 (PDT)
MIME-Version: 1.0
References: <20200930160917.1234225-1-hch@lst.de> <20200930160917.1234225-9-hch@lst.de>
 <20201002175040.GA1131147@chromium.org> <20201005082629.GA13850@lst.de>
 <CAAFQd5DcFjTUpOYkaz4nGxozgOc9oGf9QngjbpXWdcwXTT=kmw@mail.gmail.com> <20201007062150.GA10601@lst.de>
In-Reply-To: <20201007062150.GA10601@lst.de>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Wed, 7 Oct 2020 14:21:43 +0200
X-Gmail-Original-Message-ID: <CAAFQd5AtN-ykAF_2mAqGxVugeEegYxfYdS6gD4O3zCY1jznNYA@mail.gmail.com>
Message-ID: <CAAFQd5AtN-ykAF_2mAqGxVugeEegYxfYdS6gD4O3zCY1jznNYA@mail.gmail.com>
Subject: Re: [PATCH 8/8] WIP: add a dma_alloc_contiguous API
To:     Christoph Hellwig <hch@lst.de>
Cc:     Sergey Senozhatsky <senozhatsky@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Oct 7, 2020 at 8:21 AM Christoph Hellwig <hch@lst.de> wrote:
>
> On Tue, Oct 06, 2020 at 10:56:04PM +0200, Tomasz Figa wrote:
> > > Yes.  And make sure the API isn't implemented when VIVT caches are
> > > used, but that isn't really different from the current interface.
> >
> > Okay, thanks. Let's see if we can make necessary changes to the videobuf2.
> >
> > +Sergey Senozhatsky for awareness too.
>
> I can defer the changes a bit to see if you'd really much prefer
> the former interface.  I think for now the most important thing is
> that it works properly for the potential users, and the prime one is
> videobuf2 for now.  drm also seems like a big potential users, but I
> had a really hard time getting the developers to engage in API
> development.

My initial feeling is that it should work, but we'll give you a
definitive answer once we prototype it. :)

We might actually give it a try in the USB HCD subsystem as well, to
implement usb_alloc_noncoherent(), as an optimization for drivers
which have to perform multiple random accesses to the URB buffers. I
think you might recall discussing this by the way of the pwc and
uvcvideo camera drivers.

Best regards,
Tomasz
