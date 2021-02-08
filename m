Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB88EC433E0
	for <linux-doc@archiver.kernel.org>; Mon,  8 Feb 2021 11:39:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4F5C164E40
	for <linux-doc@archiver.kernel.org>; Mon,  8 Feb 2021 11:39:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233184AbhBHLhZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 8 Feb 2021 06:37:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33390 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232240AbhBHLfN (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 8 Feb 2021 06:35:13 -0500
Received: from mail-ed1-x536.google.com (mail-ed1-x536.google.com [IPv6:2a00:1450:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1621C061756
        for <linux-doc@vger.kernel.org>; Mon,  8 Feb 2021 03:34:05 -0800 (PST)
Received: by mail-ed1-x536.google.com with SMTP id q2so14504880eds.11
        for <linux-doc@vger.kernel.org>; Mon, 08 Feb 2021 03:34:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=SIdoO/BXrCF5ZGx1sncTZthErRH1ESME+fQ4iZ40G4Y=;
        b=R4FfWcgnRp7kfMDn8OHGmLFT1VfRqhYLNtKbqtkWdlb75NiARoNYeuQ8plgw69PUvK
         SrMHBkIe3taDYqbOgv3c7/zQ+MxGUpsl5Jfwyzx4OaASuL8ztU0r+HTymMJR6J0YvC16
         zIfDdvWJe+eVik/zwfB7GuuftSM9ixQbVyhf0=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=SIdoO/BXrCF5ZGx1sncTZthErRH1ESME+fQ4iZ40G4Y=;
        b=nvGO95v3/aT6/4BuzibGBkImpjSikXovIWz+9/sOM8eLaDjh8aSU/yzU/gZh4UcU/g
         6JUiOD16ToA41ZRbN5OJjs0LS3saHmaYMNZsznRzqCVN2b4KY4DyAcQJ7uxSkl5Xt9e8
         qcZRoV1xuq31dKke40qxnKFlii2+dgaSgrJOZS1tuR+WA/zKFVZToYQcOWw1bDxSwzfM
         u6Tyj2JvfXql5aeQuXnoWrpX2rzkqg83r9exrNBo3YtjUJyogL2CyglcYGdu0HyifCmQ
         M7SA5iP9fDoymyJX1GVbis7xZZ08pqUNs/UmJbNbPIvvrn8mxKRDTlGomPL8n8251NYP
         jXVA==
X-Gm-Message-State: AOAM531FtGvS5B672YATvnhwTWUEPEKVYyVGDnyKAp6RR25qyKXD074m
        Pawk2K0E4cJ7eoGcZ1t4Os5lkCQ9ePWE3g==
X-Google-Smtp-Source: ABdhPJyc04QLS24EBHvNAQ4lbjYZ3Isr5aiKaFXHTX64Laq4KdmJRnTIKIBR+JsTw1lajHNczU+7ZA==
X-Received: by 2002:a05:6402:2216:: with SMTP id cq22mr16690994edb.125.1612784044081;
        Mon, 08 Feb 2021 03:34:04 -0800 (PST)
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com. [209.85.221.41])
        by smtp.gmail.com with ESMTPSA id n5sm9339475edw.7.2021.02.08.03.34.03
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 08 Feb 2021 03:34:03 -0800 (PST)
Received: by mail-wr1-f41.google.com with SMTP id u14so16681581wri.3
        for <linux-doc@vger.kernel.org>; Mon, 08 Feb 2021 03:34:03 -0800 (PST)
X-Received: by 2002:a5d:6404:: with SMTP id z4mr6111438wru.103.1612784042646;
 Mon, 08 Feb 2021 03:34:02 -0800 (PST)
MIME-Version: 1.0
References: <20210202095110.1215346-1-hch@lst.de> <20210207184855.GA27553@lst.de>
In-Reply-To: <20210207184855.GA27553@lst.de>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Mon, 8 Feb 2021 20:33:50 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BzAvgiTLGFse+ZWUrFtZ1Ysf+p+e-4rW8gq_iP0xhWEA@mail.gmail.com>
Message-ID: <CAAFQd5BzAvgiTLGFse+ZWUrFtZ1Ysf+p+e-4rW8gq_iP0xhWEA@mail.gmail.com>
Subject: Re: add a new dma_alloc_noncontiguous API v2
To:     Christoph Hellwig <hch@lst.de>
Cc:     Mauro Carvalho Chehab <mchehab@kernel.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
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

Hi Christoph,

On Mon, Feb 8, 2021 at 3:49 AM Christoph Hellwig <hch@lst.de> wrote:
>
> Any comments?
>

Sorry for the delay. The whole series looks very good to me. Thanks a lot.

Reviewed-by: Tomasz Figa <tfiga@chromium.org>

Best regards,
Tomasz

> On Tue, Feb 02, 2021 at 10:51:03AM +0100, Christoph Hellwig wrote:
> > Hi all,
> >
> > this series adds the new noncontiguous DMA allocation API requested by
> > various media driver maintainers.
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
