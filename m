Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31B09C433E6
	for <linux-doc@archiver.kernel.org>; Tue,  9 Feb 2021 14:47:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0E9EC64E30
	for <linux-doc@archiver.kernel.org>; Tue,  9 Feb 2021 14:47:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231996AbhBIOrP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 9 Feb 2021 09:47:15 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45196 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232146AbhBIOrI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 9 Feb 2021 09:47:08 -0500
Received: from mail-io1-xd36.google.com (mail-io1-xd36.google.com [IPv6:2607:f8b0:4864:20::d36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B9F21C06178B
        for <linux-doc@vger.kernel.org>; Tue,  9 Feb 2021 06:46:27 -0800 (PST)
Received: by mail-io1-xd36.google.com with SMTP id f6so19005982ioz.5
        for <linux-doc@vger.kernel.org>; Tue, 09 Feb 2021 06:46:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qVmduRDg6ZoezGmMc2NOjO9dKMtO5r7SHhLDuNpUA1w=;
        b=WFrX2nLmj6lzLxXwwRLmHplG+/4tGaqXd5F9tKmrpv0+CO88dg427I0RaNJUHcUdtl
         s+UXjDspolANS3R9Rg9KKCc/sy5aAZFcT22cgFhNe08kUqAs0wzlF+V6nniyL9Nz/4ff
         ABijo72HwNtukB2a0YkAo0BBqtLdSTQT9enFU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qVmduRDg6ZoezGmMc2NOjO9dKMtO5r7SHhLDuNpUA1w=;
        b=mg6rq1gjHBaU+hNlNKqKMKA3LXRaz+1iK0kgcq9CjkEkpkB+RM6ccFGww5RG4/g5n3
         iRqqBLAlqAWy3rum+CXEYHu/8asjYhD4XPSPj8+yjiPprEygfYR52y2YTIyOweN+LRu6
         0jgPnNJZ5AiqMojwvERC0xeYRgJnDkaS/AhfczMAJjvFNqy4yRe5OfbXROxxXGXjBuj2
         a2kuVqoWlP4thX+VQ02H+4ys2jgQZJz6gC8wxD8fMWs3tkM3XUE6DgnPaaijjkDlfNfF
         tdXa3Pu3jz+6YtCp4c6krd2b45geaodFBFMV5Ij33DUS0JcAITu3eP1FTlQ4sbVcwOvo
         dLsg==
X-Gm-Message-State: AOAM5310wix3bbPZAh9Q/tIOXmymOzCp0KJcaPkkzt+HM5MC/Up6UqAw
        pgAmMwwkE3QVIw1Gyv7gjDGUMA8fiN9Dyyp6
X-Google-Smtp-Source: ABdhPJzGH5dAcfBBSssAxDZ4FobBk//YA47DU3noZVoYRrGdWIZ2QxqsYuQFtVqE8aJc0uIzbg4IMA==
X-Received: by 2002:a02:a492:: with SMTP id d18mr22382568jam.11.1612881987053;
        Tue, 09 Feb 2021 06:46:27 -0800 (PST)
Received: from mail-il1-f170.google.com (mail-il1-f170.google.com. [209.85.166.170])
        by smtp.gmail.com with ESMTPSA id i8sm10667144ilb.38.2021.02.09.06.46.24
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Feb 2021 06:46:25 -0800 (PST)
Received: by mail-il1-f170.google.com with SMTP id u15so1313812iln.12
        for <linux-doc@vger.kernel.org>; Tue, 09 Feb 2021 06:46:24 -0800 (PST)
X-Received: by 2002:a05:6e02:1d0e:: with SMTP id i14mr18857395ila.69.1612881984309;
 Tue, 09 Feb 2021 06:46:24 -0800 (PST)
MIME-Version: 1.0
References: <20210202095110.1215346-1-hch@lst.de> <20210207184855.GA27553@lst.de>
 <CAAFQd5BzAvgiTLGFse+ZWUrFtZ1Ysf+p+e-4rW8gq_iP0xhWEA@mail.gmail.com>
 <20210209082213.GA31902@lst.de> <CANiDSCuzKczCnAdC9b0r-6WVBFYXYnvQHKbxSeYq2QW1uVsDLQ@mail.gmail.com>
In-Reply-To: <CANiDSCuzKczCnAdC9b0r-6WVBFYXYnvQHKbxSeYq2QW1uVsDLQ@mail.gmail.com>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Tue, 9 Feb 2021 15:46:13 +0100
X-Gmail-Original-Message-ID: <CANiDSCvPodsmcOi1fMwvZsyMxWsRQWNT7VkbZs4=XePYXfiXow@mail.gmail.com>
Message-ID: <CANiDSCvPodsmcOi1fMwvZsyMxWsRQWNT7VkbZs4=XePYXfiXow@mail.gmail.com>
Subject: Re: add a new dma_alloc_noncontiguous API v2
To:     Christoph Hellwig <hch@lst.de>
Cc:     Tomasz Figa <tfiga@chromium.org>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Sergey Senozhatsky <senozhatsky@google.com>,
        "open list:IOMMU DRIVERS" <iommu@lists.linux-foundation.org>,
        Linux Media Mailing List <linux-media@vger.kernel.org>,
        Robin Murphy <robin.murphy@arm.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Christoph

I have tested it in both arm and x86, since there are not significant
changes with the previous version I did not do a performance test.

Thanks!


On Tue, Feb 9, 2021 at 9:29 AM Ricardo Ribalda <ribalda@chromium.org> wrote:
>
> Hi Christoph
>
> On Tue, Feb 9, 2021 at 9:22 AM Christoph Hellwig <hch@lst.de> wrote:
> >
> > On Mon, Feb 08, 2021 at 08:33:50PM +0900, Tomasz Figa wrote:
> > > Sorry for the delay. The whole series looks very good to me. Thanks a lot.
> > >
> > > Reviewed-by: Tomasz Figa <tfiga@chromium.org>
> >
> > Thanks.
> >
> > Ricardo, do the uvcvideo changes look good to you?  I'd like to queue
> > the series up for this merge window.

Tested-by: Ricardo Ribalda <ribalda@chromium.org>

>
> Let me test them in real hardware today.
>
> Thanks!
>
>
> --
> Ricardo Ribalda



-- 
Ricardo Ribalda
