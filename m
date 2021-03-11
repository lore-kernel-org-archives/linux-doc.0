Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B1F4C433E0
	for <linux-doc@archiver.kernel.org>; Thu, 11 Mar 2021 16:58:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 24A3D64FE2
	for <linux-doc@archiver.kernel.org>; Thu, 11 Mar 2021 16:58:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229767AbhCKQ6Z (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 11 Mar 2021 11:58:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35108 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229809AbhCKQ6K (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 11 Mar 2021 11:58:10 -0500
Received: from mail-il1-x131.google.com (mail-il1-x131.google.com [IPv6:2607:f8b0:4864:20::131])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6599C061760
        for <linux-doc@vger.kernel.org>; Thu, 11 Mar 2021 08:58:09 -0800 (PST)
Received: by mail-il1-x131.google.com with SMTP id g9so19538545ilc.3
        for <linux-doc@vger.kernel.org>; Thu, 11 Mar 2021 08:58:09 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mIw9mpEdtb6xII0/h1pkc9zwar1BCKRrPfEkXgVTjbI=;
        b=AIAwsmpNhzzKXCSsCR+48hrHBgLwiA3le2y40XyItCCiAznTDaLmhQioZKLeYJvj5l
         sYEbViFUJgais0HaTWgDIKrsLRgDvtzoSnhADRD5JFma2Nxe/M4xvkYsCOdCEa2pYKHu
         jWNVeYX37GDpBx1ePo+F+81oLh3OgZLt4anZc=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mIw9mpEdtb6xII0/h1pkc9zwar1BCKRrPfEkXgVTjbI=;
        b=P8ws/eUlNEOaaDQz/4bV2HkIwDCkHE++Rot6jDOIFs/ix67t0JbXxEgPCJdUz9dCdU
         pDhANZ1IkIyhWLNbvdoVbakqhgYs9ifecPhWSRpy8H+FpiQ6P+wlFjogwg5Mofgaqzoi
         VIMdmoGX3H4BBxcfT1vCMLmImSBjK4Gp+P/zUYKmjYCvYRLFO3Gm+NmMq/fP7GnOH/Is
         2ZqsV2cXcPdliOBmmQp8oPC7e7CReawBCosUtT+e9X0mO7qgDdie3t9VVZ8s/TA9HLPr
         vhn1h+WfS+6pbSCkzccE1fFdLFUaNovXr42Fqoq51jx9dgSQ2WLud3Ow6+vdGqnT/VUA
         KPbg==
X-Gm-Message-State: AOAM530CmPE0QlvAAc8yyuIvkm00kc8UZaeLkQDaf+XrTxwSkADAxHQw
        v7PPtRsiXB2wLUDLJxDOVEvETHQU9drRyOra
X-Google-Smtp-Source: ABdhPJzuypBpPe9FI6egZZ+71aRp/BULx7XpkfRqAqjUsK1c2UFMokkDRSB2gX4C8kwjG0vIh0V43g==
X-Received: by 2002:a92:50c:: with SMTP id q12mr7485260ile.59.1615481889128;
        Thu, 11 Mar 2021 08:58:09 -0800 (PST)
Received: from mail-io1-f46.google.com (mail-io1-f46.google.com. [209.85.166.46])
        by smtp.gmail.com with ESMTPSA id r15sm1657439iot.5.2021.03.11.08.58.08
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Mar 2021 08:58:08 -0800 (PST)
Received: by mail-io1-f46.google.com with SMTP id a7so22625838iok.12
        for <linux-doc@vger.kernel.org>; Thu, 11 Mar 2021 08:58:08 -0800 (PST)
X-Received: by 2002:a05:6638:2711:: with SMTP id m17mr4497331jav.115.1615481887730;
 Thu, 11 Mar 2021 08:58:07 -0800 (PST)
MIME-Version: 1.0
References: <20210301085236.947011-1-hch@lst.de> <20210311165250.GB25023@lst.de>
In-Reply-To: <20210311165250.GB25023@lst.de>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Thu, 11 Mar 2021 17:57:56 +0100
X-Gmail-Original-Message-ID: <CANiDSCuFkTYMGeL8WK_3VkYy4a1h3hY4NKWTtz=bho844Fa2zw@mail.gmail.com>
Message-ID: <CANiDSCuFkTYMGeL8WK_3VkYy4a1h3hY4NKWTtz=bho844Fa2zw@mail.gmail.com>
Subject: Re: add a new dma_alloc_noncontiguous API v3
To:     Christoph Hellwig <hch@lst.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Tomasz Figa <tfiga@chromium.org>,
        Sergey Senozhatsky <senozhatsky@google.com>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
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

Hi Christoph

I tried to run it in an arm device and it worked fine.


On Thu, Mar 11, 2021 at 5:52 PM Christoph Hellwig <hch@lst.de> wrote:
>
> Any comments?  Especially on the uvcvideo conversion?
>
> On Mon, Mar 01, 2021 at 09:52:30AM +0100, Christoph Hellwig wrote:
> > Hi all,
> >
> > this series adds the new noncontiguous DMA allocation API requested by
> > various media driver maintainers.
> >
> > Changes since v2:
> >  - rebased to Linux 5.12-rc1
> >  - dropped one already merged patch
> >  - pass an attrs argument to dma_alloc_noncontigous
> >  - clarify the dma_vmap_noncontiguous documentation a bit
> >  - fix double assignments in uvcvideo
> >
> > Changes since v1:
> >  - document that flush_kernel_vmap_range and invalidate_kernel_vmap_range
> >    must be called once an allocation is mapped into KVA
> >  - add dma-debug support
> >  - remove the separate dma_handle argument, and instead create fully formed
> >    DMA mapped scatterlists
> >  - use a directional allocation in uvcvideo
> >  - call invalidate_kernel_vmap_range from uvcvideo
> > _______________________________________________
> > iommu mailing list
> > iommu@lists.linux-foundation.org
> > https://lists.linuxfoundation.org/mailman/listinfo/iommu
> ---end quoted text---



-- 
Ricardo Ribalda
