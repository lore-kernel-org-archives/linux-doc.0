Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CD21C433E0
	for <linux-doc@archiver.kernel.org>; Fri, 15 Jan 2021 13:09:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 76FEC221FA
	for <linux-doc@archiver.kernel.org>; Fri, 15 Jan 2021 13:09:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733080AbhAONJJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 15 Jan 2021 08:09:09 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732911AbhAONJI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 15 Jan 2021 08:09:08 -0500
Received: from mail-io1-xd2b.google.com (mail-io1-xd2b.google.com [IPv6:2607:f8b0:4864:20::d2b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 15C39C0613D3
        for <linux-doc@vger.kernel.org>; Fri, 15 Jan 2021 05:08:28 -0800 (PST)
Received: by mail-io1-xd2b.google.com with SMTP id y19so17982126iov.2
        for <linux-doc@vger.kernel.org>; Fri, 15 Jan 2021 05:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RTaj+kQTI0f7LZEXnhvKOz2cpPUJhSCbtgTVKj7/e7M=;
        b=EH9Lf/Qh5uutAxEfsjPu9Tu0c9s5EADzA4pymQanveSRfO8osic1lzoqlLFpKqmKgM
         ePUT9SwlH1pgv9q9fuQy6uxulz1L+MdF/UTIPxzPc9vEm7feTrhKPS0IT9sN69GG/h/D
         8x/BZqmWKrCkVwyxr6q7Or83KJQbyw2b5IrvU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RTaj+kQTI0f7LZEXnhvKOz2cpPUJhSCbtgTVKj7/e7M=;
        b=WG+QP77B3LbIsGIJetpyGx+WzPOSSJ14yKH3ZqjI7YxlRH/Dn20rAm2SfU0uh7nvJW
         L5hXyXNS4c85zVRixSvS9oKBLzfsF5uVZnn+F2/jv3mes4dXzPsqiFzPC9mRDwATK+iD
         bc4bM6T3L7lNCOmLqXS2bF/jodHErbCSy4z9B4EBMgNWZ23aXMMhmTGXqddgVhRlff52
         2QXNzK1fO/Vh6hcZctqPeiEVd84H+mRHX1OiRxWrfGDGnUXHQ889o/N6/06WaX0+RVvs
         LYylFBd24nZ2PisHkah75l1AWgKMznfa7hXmUayP/CQyO5xnlPvDEyfVVLC5Jl7AKlOa
         EElg==
X-Gm-Message-State: AOAM531wRIitHakvNHk6cJcVsqlThDgogmQRhed9ORjjsUbeDr4HnSPn
        8dqTtReKES6NOxxo4dR/uV5wZ7QMh8rTdA==
X-Google-Smtp-Source: ABdhPJwj6Ipv8EUMDzpRfijXmxnWwUDsLT22KgJLBaB0TyNYU0rggpPpO1Q7JxguWmmYBJjhy5fptw==
X-Received: by 2002:a02:969a:: with SMTP id w26mr10252106jai.96.1610716107135;
        Fri, 15 Jan 2021 05:08:27 -0800 (PST)
Received: from mail-io1-f53.google.com (mail-io1-f53.google.com. [209.85.166.53])
        by smtp.gmail.com with ESMTPSA id n11sm4038707ioh.37.2021.01.15.05.08.25
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 15 Jan 2021 05:08:26 -0800 (PST)
Received: by mail-io1-f53.google.com with SMTP id d13so14717794ioy.4
        for <linux-doc@vger.kernel.org>; Fri, 15 Jan 2021 05:08:25 -0800 (PST)
X-Received: by 2002:a05:6e02:cc7:: with SMTP id c7mr10850857ilj.218.1610716105308;
 Fri, 15 Jan 2021 05:08:25 -0800 (PST)
MIME-Version: 1.0
References: <20201125221917.150463-1-ribalda@chromium.org> <20201130083410.GD32234@lst.de>
 <20201201033658.GE3723071@google.com> <20201201144916.GA14682@lst.de>
 <CAAFQd5BBEbmENrrZ-vMK9cKOap19XWmfcxwrxKfjWx-wEew8rg@mail.gmail.com>
 <20201208071320.GA1667627@google.com> <20201209111639.GB22806@lst.de>
 <CANiDSCtsOdJUK3r_t8UNKhh7Px0ANNFJkuwM1fBgZ7wnVh0JFA@mail.gmail.com> <20210111083614.GA27589@lst.de>
In-Reply-To: <20210111083614.GA27589@lst.de>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Fri, 15 Jan 2021 14:08:14 +0100
X-Gmail-Original-Message-ID: <CANiDSCvuvj47=nhoWhvzc5raMxM60w+JYRWjd0YepcbcbkrUjA@mail.gmail.com>
Message-ID: <CANiDSCvuvj47=nhoWhvzc5raMxM60w+JYRWjd0YepcbcbkrUjA@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] media: uvcvideo: Use dma_alloc_noncontiguos API
To:     ". Christoph Hellwig" <hch@lst.de>
Cc:     Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
        Joerg Roedel <joro@8bytes.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Sergey Senozhatsky <senozhatsky@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jan 11, 2021 at 9:36 AM . Christoph Hellwig <hch@lst.de> wrote:
>
> On Thu, Jan 07, 2021 at 03:14:08PM +0100, Ricardo Ribalda wrote:
> > > So I think we do want these branches for coherent vs non-coherent as they
> > > have very different semantics and I do not think that hiding them under
> > > the same API helps people to understand those vastly different semantics.
> > >
> > > OTOH we should look into a fallback for DMA API instances that do not
> > > support the discontigous allocations.
> > >
> > > I think between your comments and those from Ricardo I have a good idea
> > > for a somewhat updated API.  I'll try to post something in the next days.
> >
> > Did you have time to look into this?
> >
> > No hurry, I just want to make sure that I didn't miss anything ;)
>
> Haven't managed to get to it, sorry.

No worries!, is there something we can do to help you with this?

>
> >
> > Best regards!
> >
> >
> >
> > --
> > Ricardo Ribalda
> ---end quoted text---



-- 
Ricardo Ribalda
