Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EEE8CC55ABD
	for <linux-doc@archiver.kernel.org>; Tue, 10 Nov 2020 09:33:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 903A5207D3
	for <linux-doc@archiver.kernel.org>; Tue, 10 Nov 2020 09:33:22 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="i7K+5/+7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729240AbgKJJdW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 10 Nov 2020 04:33:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42620 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726213AbgKJJdU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 10 Nov 2020 04:33:20 -0500
Received: from mail-oi1-x242.google.com (mail-oi1-x242.google.com [IPv6:2607:f8b0:4864:20::242])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB58CC0613D1
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2020 01:33:18 -0800 (PST)
Received: by mail-oi1-x242.google.com with SMTP id t16so13573497oie.11
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2020 01:33:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4UkFzS0xqfoJt9doPeSUXNjV1Z9m4QzgZeqM5Nk8Yss=;
        b=i7K+5/+7cLZ5ZRdhNEamXRcWw2QQ5XKCYG2d+/ImIPCzSBjpmq/0TvrywlA9n7NxpH
         B766buJa+ieQ3fgGJlGjHosI3xzo0781KmeChVDqeRbxFFNxJfRC7WWIFV7adexCwpx+
         NTIuE0Bpoi0kHCRsaU97HNjA1Reud/62RUqaQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4UkFzS0xqfoJt9doPeSUXNjV1Z9m4QzgZeqM5Nk8Yss=;
        b=e20ssHiWkD+g109pqVwzMyQ3RJH45iwhVjJX0BiFbKmRks3k6loz8zsRxcqUZsciiF
         Z7/oFHtp4GYZ3j6/E0DdaWgNTK5e5RqQZBgomGjdMmDbKJH0dbxnFj606XpCVx5WPXpH
         ks4EARIGLY/ZBYxQxnn+3bouLviN+Cb92D2xoRwlj09u6sgdMjmE0DneP4NifBgpoQED
         +2z1n0raS5RFMU8+AQe5IKHFKBO/V+9CFJVLygUL5IxKG0RAGLvdOn+E8BOwRWI3xHDb
         QcRftR0TVeqMjlZiGGdNey91s/WgZ3kM6FYfLBq8znQtkRKgk4dh6heV/f1RXXJ+6izU
         9rIw==
X-Gm-Message-State: AOAM531OWQdhauXchhidW4rByJlTVuM9o1HkBscsBcLKsySp105RR+Vj
        e5WVt2QsqTzS+VL07NHW5oUgrXsIN3nHZs0X
X-Google-Smtp-Source: ABdhPJwIKkgHLXnS76FPqyVrx2jz+c9praanUP3tpEJhFb+5ggvDte/zVmNHoWNT9e17i6iPiywX4g==
X-Received: by 2002:aca:c188:: with SMTP id r130mr2278820oif.99.1605000798114;
        Tue, 10 Nov 2020 01:33:18 -0800 (PST)
Received: from mail-oi1-f172.google.com (mail-oi1-f172.google.com. [209.85.167.172])
        by smtp.gmail.com with ESMTPSA id i82sm1418407oia.2.2020.11.10.01.33.17
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 10 Nov 2020 01:33:17 -0800 (PST)
Received: by mail-oi1-f172.google.com with SMTP id w188so8045320oib.1
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2020 01:33:17 -0800 (PST)
X-Received: by 2002:aca:3c54:: with SMTP id j81mr551270oia.11.1605000796616;
 Tue, 10 Nov 2020 01:33:16 -0800 (PST)
MIME-Version: 1.0
References: <20200930160917.1234225-1-hch@lst.de> <20200930160917.1234225-9-hch@lst.de>
 <CAAFQd5CttttqMXb=iDPb+Z0WGUa2g=W6JwXJ-5HbhmrDyxP+cQ@mail.gmail.com>
 <CANiDSCtefXKw-xC3bskyggW-BzCmVPj6GGLvO=cCPZHbS1oTDA@mail.gmail.com> <20201110092506.GA24469@lst.de>
In-Reply-To: <20201110092506.GA24469@lst.de>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Tue, 10 Nov 2020 10:33:05 +0100
X-Gmail-Original-Message-ID: <CANiDSCsBUBV1WA2To9x26Uhc5SU-4xuh3m4wUwXBcGwA6n8now@mail.gmail.com>
Message-ID: <CANiDSCsBUBV1WA2To9x26Uhc5SU-4xuh3m4wUwXBcGwA6n8now@mail.gmail.com>
Subject: Re: [PATCH 8/8] WIP: add a dma_alloc_contiguous API
To:     Christoph Hellwig <hch@lst.de>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        "list@263.net:IOMMU DRIVERS <iommu@lists.linux-foundation.org>, Joerg
        Roedel <joro@8bytes.org>," <iommu@lists.linux-foundation.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Christoph

On Tue, Nov 10, 2020 at 10:25 AM Christoph Hellwig <hch@lst.de> wrote:
>
> On Mon, Nov 09, 2020 at 03:53:55PM +0100, Ricardo Ribalda wrote:
> > Hi Christoph
> >
> > I have started now to give a try to your patchset. Sorry for the delay.
> >
> > For uvc I have prepared this patch:
> > https://github.com/ribalda/linux/commit/9094fe223fe38f8c8ff21366d893b43cbbdf0113
> >
> > I have tested successfully in a x86_64 noteboot..., yes I know there
> > is no change for that platform :).
> > I am trying to get hold of an arm device that can run the latest
> > kernel from upstream.
> >
> > On the meanwhile if you could take a look to the patch to verify that
> > this the way that you expect the drivers to use your api I would
> > appreciate it
>
> This looks pretty reaosnable.
>

Great

Also FYI, I managed to boot an ARM device with that tree. But I could
not test the uvc driver (it was a remote device with no usb device
attached)

Hopefully I will be able to test it for real this week.

Any suggestions for how to measure performance difference?

Thanks!

> Note that ifdef  CONFIG_DMA_NONCOHERENT in the old code doesn't actually
> work, as that option is an internal thing just for mips and sh..



-- 
Ricardo Ribalda
