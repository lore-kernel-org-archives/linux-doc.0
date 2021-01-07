Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AC79C433E6
	for <linux-doc@archiver.kernel.org>; Thu,  7 Jan 2021 14:15:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E03712311E
	for <linux-doc@archiver.kernel.org>; Thu,  7 Jan 2021 14:15:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728322AbhAGOPC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 7 Jan 2021 09:15:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54078 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728246AbhAGOPC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 7 Jan 2021 09:15:02 -0500
Received: from mail-io1-xd2e.google.com (mail-io1-xd2e.google.com [IPv6:2607:f8b0:4864:20::d2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DDD35C0612F8
        for <linux-doc@vger.kernel.org>; Thu,  7 Jan 2021 06:14:21 -0800 (PST)
Received: by mail-io1-xd2e.google.com with SMTP id 81so6209145ioc.13
        for <linux-doc@vger.kernel.org>; Thu, 07 Jan 2021 06:14:21 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5EKjm5VT/QdJn/B1BYcuiBIUG9oQpN1/AMx3O8ZLC64=;
        b=LF4UpleR6FsIZbyEpjiLbQPE887zOCnrGlHR7ccv+cu7FlMU1Yo0SbefHfeSAgdlMR
         Ldk5bvNrxJgg/hf9f0gZ+xMoDsCQ22tTW1nM1jLgelWwGVg4lSQdm+o+adk3MQZrjP26
         oyA4A0yU9yq7NCGzqcSM5ysirka/OI141IFrs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5EKjm5VT/QdJn/B1BYcuiBIUG9oQpN1/AMx3O8ZLC64=;
        b=RnwOhNnSBtIoxLdGsQncyx98kw1YtdHVdeNwqi7eLMjzYOzICaps3QnR2LVUcn09Ew
         2u+KJ5bhd/oy6nl0b1xrORRaFvEd4asmheqVaNr0xBVR84B+qHSEfpZpPZ+UIPrRFSn1
         dUgqJU0xDz65aHGtB6HOVubwrcdrT2PVCHXvSg+Dh/+ZFRYJ6qTKiE+X5Obky8u2GCMp
         R7uhLgyw8j9SpUaGS70jyylIHjJtQQ6A2/o7LDmR2pfqw+1T0093Mciz4QiPMdqFZnAp
         OaoAhndNdakAf9FEIBFDKwLfUp95BP7ThqMdiC02/nMo2criuiDPvemEhj2Nx5qHZHSI
         usnA==
X-Gm-Message-State: AOAM533JSgocwHOpXvP2/xDpLPc/3OZZVjE6kkH76ex1T5jtIYltcqzk
        xsFIGxgyKwmpVEXpyh9vz+gQ47IhgRT7xw==
X-Google-Smtp-Source: ABdhPJzarUOmrZtbaQZOX+M+Rj5R6DSrDkSVgpxlFTGE1DaVAkO/uCj+mSspS1HwlH/8aZuEFvTtJg==
X-Received: by 2002:a5d:8d8b:: with SMTP id b11mr1440719ioj.68.1610028861018;
        Thu, 07 Jan 2021 06:14:21 -0800 (PST)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com. [209.85.166.44])
        by smtp.gmail.com with ESMTPSA id w9sm4531116ilq.43.2021.01.07.06.14.19
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 07 Jan 2021 06:14:19 -0800 (PST)
Received: by mail-io1-f44.google.com with SMTP id n4so6222287iow.12
        for <linux-doc@vger.kernel.org>; Thu, 07 Jan 2021 06:14:19 -0800 (PST)
X-Received: by 2002:a6b:cd02:: with SMTP id d2mr1461830iog.4.1610028858785;
 Thu, 07 Jan 2021 06:14:18 -0800 (PST)
MIME-Version: 1.0
References: <20201125221917.150463-1-ribalda@chromium.org> <20201130083410.GD32234@lst.de>
 <20201201033658.GE3723071@google.com> <20201201144916.GA14682@lst.de>
 <CAAFQd5BBEbmENrrZ-vMK9cKOap19XWmfcxwrxKfjWx-wEew8rg@mail.gmail.com>
 <20201208071320.GA1667627@google.com> <20201209111639.GB22806@lst.de>
In-Reply-To: <20201209111639.GB22806@lst.de>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Thu, 7 Jan 2021 15:14:08 +0100
X-Gmail-Original-Message-ID: <CANiDSCtsOdJUK3r_t8UNKhh7Px0ANNFJkuwM1fBgZ7wnVh0JFA@mail.gmail.com>
Message-ID: <CANiDSCtsOdJUK3r_t8UNKhh7Px0ANNFJkuwM1fBgZ7wnVh0JFA@mail.gmail.com>
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

Hi Christoph

Happy new year!

On Wed, Dec 9, 2020 at 12:16 PM . Christoph Hellwig <hch@lst.de> wrote:
>
> On Tue, Dec 08, 2020 at 04:13:20PM +0900, Sergey Senozhatsky wrote:
> > On (20/12/08 13:54), Tomasz Figa wrote:
> > >
> > > In any case, Sergey is going to share a preliminary patch on how the
> > > current API would be used in the V4L2 videobuf2 framework. That should
> > > give us more input on how such a helper could look.
> >
> > HUGE apologies for the previous screw up! I replied in the
> > gmail web-interface and that did not work out as expected
> > (at all, big times).
>
> Actually the previous mail was a mime multipart one, and the plain text
> version displayed just fine here.  My the gmail engineers finally learned
> something after all.
>
> > Another thing to notice is that the new API requires us to have two execution branches
> > in allocators - one for the current API; and one for the new API (if it's supported and
> > if user-space requested non-coherent allocation).
>
> So I think we do want these branches for coherent vs non-coherent as they
> have very different semantics and I do not think that hiding them under
> the same API helps people to understand those vastly different semantics.
>
> OTOH we should look into a fallback for DMA API instances that do not
> support the discontigous allocations.
>
> I think between your comments and those from Ricardo I have a good idea
> for a somewhat updated API.  I'll try to post something in the next days.

Did you have time to look into this?

No hurry, I just want to make sure that I didn't miss anything ;)

Best regards!



-- 
Ricardo Ribalda
