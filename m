Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 05FCBC64E75
	for <linux-doc@archiver.kernel.org>; Tue, 24 Nov 2020 12:01:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9F79F2087D
	for <linux-doc@archiver.kernel.org>; Tue, 24 Nov 2020 12:01:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="B3BwzQba"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733219AbgKXMBs (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 24 Nov 2020 07:01:48 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48470 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1733214AbgKXMBr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 24 Nov 2020 07:01:47 -0500
Received: from mail-io1-xd42.google.com (mail-io1-xd42.google.com [IPv6:2607:f8b0:4864:20::d42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id BFAEEC061A4D
        for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2020 04:01:47 -0800 (PST)
Received: by mail-io1-xd42.google.com with SMTP id t8so21606190iov.8
        for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2020 04:01:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=OtTStFZ1K4vG9mf1OSlywjo0WPS9A+qPTfMdwg+0WeU=;
        b=B3BwzQbaXFU3fhtDdHR+Fmv8MKnhR2mxgOp2ryIc5wuXL4rXiS85tpU6q5H3eR6qE+
         6qzQoaoL8DgM+BofPoZTBWmfryCnozhhBT+EEK6ATwmvGtVQzE0xjmM4qt+tQ5k0iE0J
         0hdGRkNaK/blbkiRCF/yNOj+MFI3+N1/U+yak=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=OtTStFZ1K4vG9mf1OSlywjo0WPS9A+qPTfMdwg+0WeU=;
        b=Wm9oODOa9tcLsS7/3hDbRuEfqrFtFyEA/bsQigJ7azeieD1acl84JqwCHi2Ehp7aDy
         kPFh0iqyJ/RMqtAkm7Edg7PDvcDNR0+VVUypHvQ2igPzx29MTRh3y+nyqSncgxRhSs2N
         YjIHKoIVm5l+kFg0YdB46rR7v5DfoJdIaAExRvZrrIds5GhfLHgvCD/YyuxSHAqpviqN
         NhGSTeqh+02PhSrcPw1d0oDazzwfbQcMajQX3Nvbklf6XdM9MbUUe0djeR84UQ3vFLhe
         AewPuv+f4rUln985r3LoelqzLuMSdPgHb+15VYypwfPpXD9QF8RaS9NR3pM+YDPIS/w6
         oaeg==
X-Gm-Message-State: AOAM531Gzx8Y7Daix/1EWC+Pc3dC4zfKoGafcK4Da21ef3cN+smqmCzb
        05l1IXOgEiEdBaK11gd/ywqc+KLg9uUJkg==
X-Google-Smtp-Source: ABdhPJx8pnSnlYY3gRxcsIdqrvtm4Yazruqzvkm6JnjEE7bT0xYNEikEKtoAg0+gFPaFl/rkLnMswA==
X-Received: by 2002:a5d:9683:: with SMTP id m3mr3610076ion.192.1606219306852;
        Tue, 24 Nov 2020 04:01:46 -0800 (PST)
Received: from mail-il1-f176.google.com (mail-il1-f176.google.com. [209.85.166.176])
        by smtp.gmail.com with ESMTPSA id a13sm9744614ilh.0.2020.11.24.04.01.45
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 24 Nov 2020 04:01:46 -0800 (PST)
Received: by mail-il1-f176.google.com with SMTP id z12so6255529ilu.8
        for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2020 04:01:45 -0800 (PST)
X-Received: by 2002:a05:6e02:12ab:: with SMTP id f11mr757703ilr.89.1606219305436;
 Tue, 24 Nov 2020 04:01:45 -0800 (PST)
MIME-Version: 1.0
References: <20200930160917.1234225-9-hch@lst.de> <20201118142546.170621-1-ribalda@chromium.org>
 <20201124113512.GA21974@lst.de>
In-Reply-To: <20201124113512.GA21974@lst.de>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Tue, 24 Nov 2020 13:01:33 +0100
X-Gmail-Original-Message-ID: <CANiDSCtLrqWBOmC9X91V8P-aahQr2=L-GQNjHM6YauT69_QcEg@mail.gmail.com>
Message-ID: <CANiDSCtLrqWBOmC9X91V8P-aahQr2=L-GQNjHM6YauT69_QcEg@mail.gmail.com>
Subject: Re: [PATCH] WIP! media: uvcvideo: Use dma_alloc_noncontiguos API
To:     Christoph Hellwig <hch@lst.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        IOMMU DRIVERS <iommu@lists.linux-foundation.org>,
        Joerg Roedel <joro@8bytes.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@google.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

HI Christoph

On Tue, Nov 24, 2020 at 12:35 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Wed, Nov 18, 2020 at 03:25:46PM +0100, Ricardo Ribalda wrote:
> > On architectures where the is no coherent caching such as ARM use the
> > dma_alloc_noncontiguos API and handle manually the cache flushing using
> > dma_sync_single().
> >
> > With this patch on the affected architectures we can measure up to 20x
> > performance improvement in uvc_video_copy_data_work().
>
> This has a bunch of crazy long lines, but otherwise looks fine to me.

That is easy to solve :)

https://github.com/ribalda/linux/commit/17ab65a08302e845ad7ae7775ce54b387a5=
8a887

>
> >
> > Signed-off-by: Ricardo Ribalda <ribalda@chromium.org>
> > ---
> >
> > This patch depends on dma_alloc_contiguous API=EF=BF=BC1315351diffmboxs=
eries
>
> How do we want to proceed?  Do the media maintainers want to pick up
> that patch?  Should I pick up the media patch in the dma-mapping tree?

I was hoping that you could answer that question :).

Do you have other use-cases than linux-media in mind?

I think Sergey wants to experiment also with vb2, to figure out how
much it affects it.
His change will be much more complicated than mine thought, there are
more cornercases there.

>
> Can you respost a combined series to get started?

Sure. Shall I also include the profiling patch?


Best regards
--=20
Ricardo Ribalda
