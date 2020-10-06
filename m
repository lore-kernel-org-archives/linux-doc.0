Return-Path: <SRS0=3O92=DN=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02390C4363D
	for <linux-doc@archiver.kernel.org>; Tue,  6 Oct 2020 20:56:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 92A3D208B8
	for <linux-doc@archiver.kernel.org>; Tue,  6 Oct 2020 20:56:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="Qfg5p3wm"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727334AbgJFU4U (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Oct 2020 16:56:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727166AbgJFU4U (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Oct 2020 16:56:20 -0400
Received: from mail-ed1-x543.google.com (mail-ed1-x543.google.com [IPv6:2a00:1450:4864:20::543])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 949F3C061755
        for <linux-doc@vger.kernel.org>; Tue,  6 Oct 2020 13:56:19 -0700 (PDT)
Received: by mail-ed1-x543.google.com with SMTP id o18so1069023edq.4
        for <linux-doc@vger.kernel.org>; Tue, 06 Oct 2020 13:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kZ33m0een3FmBO5zM6YS30Fhun5lzxt8LRsuBmJ9np8=;
        b=Qfg5p3wmaIK8FSiIu4IdCn4X7nejDPhFFZhUVBVUejoaklw0Xl8abJMx/NPlE+GAYD
         GFFRBTXhLKiSTLhMEWACUyrBty03El/kGu4Ye5XJJWvvK/JT9MZ2EHl/BwOPsWpbvWqd
         6hSErfchiydyFBZt3FeeoxPWw3eNiC6MJ1Mv4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kZ33m0een3FmBO5zM6YS30Fhun5lzxt8LRsuBmJ9np8=;
        b=lzeaaii2taa07/3ITXYgQmnoCHskS3JeK7sAmNDoG7QYQOOecXOPTnZ7BJRB5YC26N
         i6hyAVN4Czbr34sFRO5OtmesSP/+LYxFj0cXuW9PRKcUclEn5iXkqNf3x/72JJOyH0eX
         gvxr0WuXasmSCmdfBOo1KXLgPn8SkMTIgUIdtcakyWxWBQWZBjwdFzCA4T/x1YkTZG6H
         zZmJHJoL/9Qv0mFTUt2ieqoA2EZt2BEKHVVzUkcAYG+S+fRoUEjOPuxVeoSGRNsrminN
         cTjHhv4o3V5QAtsVXooTvTQ08lpwD/TxL/qWyzmLExgFRMsXP+a0iSQxj26eDfros6sa
         aspA==
X-Gm-Message-State: AOAM532OA815QC7r3c1ddOClhOsdUGhytuHTFny85rrfr8cBcydA0I4Q
        6rl4ey8H12dq3LB2Okk/x/2LS5269P4aWQ==
X-Google-Smtp-Source: ABdhPJxHlAxFMkYqDptt5mtSL0bjAotfwTB19NOCeTMMBGk8k9AFFVFNAmBITsvGIOKuEKomzTFXeA==
X-Received: by 2002:a05:6402:1007:: with SMTP id c7mr7755716edu.339.1602017777907;
        Tue, 06 Oct 2020 13:56:17 -0700 (PDT)
Received: from mail-wr1-f45.google.com (mail-wr1-f45.google.com. [209.85.221.45])
        by smtp.gmail.com with ESMTPSA id j9sm2920782ejt.49.2020.10.06.13.56.16
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 06 Oct 2020 13:56:16 -0700 (PDT)
Received: by mail-wr1-f45.google.com with SMTP id t10so15002527wrv.1
        for <linux-doc@vger.kernel.org>; Tue, 06 Oct 2020 13:56:16 -0700 (PDT)
X-Received: by 2002:adf:df8e:: with SMTP id z14mr6756108wrl.32.1602017775603;
 Tue, 06 Oct 2020 13:56:15 -0700 (PDT)
MIME-Version: 1.0
References: <20200930160917.1234225-1-hch@lst.de> <20200930160917.1234225-9-hch@lst.de>
 <20201002175040.GA1131147@chromium.org> <20201005082629.GA13850@lst.de>
In-Reply-To: <20201005082629.GA13850@lst.de>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 6 Oct 2020 22:56:04 +0200
X-Gmail-Original-Message-ID: <CAAFQd5DcFjTUpOYkaz4nGxozgOc9oGf9QngjbpXWdcwXTT=kmw@mail.gmail.com>
Message-ID: <CAAFQd5DcFjTUpOYkaz4nGxozgOc9oGf9QngjbpXWdcwXTT=kmw@mail.gmail.com>
Subject: Re: [PATCH 8/8] WIP: add a dma_alloc_contiguous API
To:     Christoph Hellwig <hch@lst.de>,
        Sergey Senozhatsky <senozhatsky@chromium.org>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
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

On Mon, Oct 5, 2020 at 10:26 AM Christoph Hellwig <hch@lst.de> wrote:
>
> On Fri, Oct 02, 2020 at 05:50:40PM +0000, Tomasz Figa wrote:
> > Hi Christoph,
> >
> > On Wed, Sep 30, 2020 at 06:09:17PM +0200, Christoph Hellwig wrote:
> > > Add a new API that returns a virtually non-contigous array of pages
> > > and dma address.  This API is only implemented for dma-iommu and will
> > > not be implemented for non-iommu DMA API instances that have to allocate
> > > contiguous memory.  It is up to the caller to check if the API is
> > > available.
> >
> > Would you mind scheding some more light on what made the previous attempt
> > not work well? I liked the previous API because it was more consistent with
> > the regular dma_alloc_coherent().
>
> The problem is that with a dma_alloc_noncoherent that can return pages
> not in the kernel mapping we can't just use virt_to_page to fill in
> scatterlists or mmap the buffer to userspace, but would need new helpers
> and another two methods.
>
> > >  - no kernel mapping or only temporary kernel mappings are required.
> > >    That is as a better replacement for DMA_ATTR_NO_KERNEL_MAPPING
> > >  - a kernel mapping is required for cached and DMA mapped pages, but
> > >    the driver also needs the pages to e.g. map them to userspace.
> > >    In that sense it is a replacement for some aspects of the recently
> > >    removed and never fully implemented DMA_ATTR_NON_CONSISTENT
> >
> > What's the expected allocation and mapping flow with the latter? Would that be
> >
> > pages = dma_alloc_noncoherent(...)
> > vaddr = vmap(pages, ...);
> >
> > ?
>
> Yes.  Witht the vmap step optional for replacements of
> DMA_ATTR_NO_KERNEL_MAPPING, which is another nightmare to deal with.
>
> > Would one just use the usual dma_sync_for_{cpu,device}() for cache
> > invallidate/clean, while keeping the mapping in place?
>
> Yes.  And make sure the API isn't implemented when VIVT caches are
> used, but that isn't really different from the current interface.

Okay, thanks. Let's see if we can make necessary changes to the videobuf2.

+Sergey Senozhatsky for awareness too.

Best regrards,
Tomasz
