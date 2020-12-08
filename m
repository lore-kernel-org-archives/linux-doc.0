Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A64BC4361B
	for <linux-doc@archiver.kernel.org>; Tue,  8 Dec 2020 04:55:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 108B523A5E
	for <linux-doc@archiver.kernel.org>; Tue,  8 Dec 2020 04:55:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727815AbgLHEy4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 7 Dec 2020 23:54:56 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33654 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725917AbgLHEy4 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 7 Dec 2020 23:54:56 -0500
Received: from mail-ed1-x542.google.com (mail-ed1-x542.google.com [IPv6:2a00:1450:4864:20::542])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 26384C0613D6
        for <linux-doc@vger.kernel.org>; Mon,  7 Dec 2020 20:54:16 -0800 (PST)
Received: by mail-ed1-x542.google.com with SMTP id k4so16269360edl.0
        for <linux-doc@vger.kernel.org>; Mon, 07 Dec 2020 20:54:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8/HsXaIACwTyoNaST+7tlYLda7+69QnFbCYHF3SGybM=;
        b=NHsKtZ9ZOwK+YAUpwafqbwPyEYnaQlamxFuqZ5sx2/0AONSSemfZtgg6vaRYU7xMnz
         77hLn6qr8fZNf18KjA10NS1l9fT9uZjhO5l20wU8SjXk6PeV+cqAxSBJQCDlYwdIqnKx
         YIKIJbr2H7A/xU0s4wwnhf/QpGitRIJ5AI3KM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8/HsXaIACwTyoNaST+7tlYLda7+69QnFbCYHF3SGybM=;
        b=GN4Ve+60k7dRbnleIwK1zIyXDNMKjcljr23oUbRZmHt3YnmtOYFHIYDyaHSEdFZGxo
         CPPixK9PHQ/qI1OP7YvuG/ShNpF1m4Dug9/qltr4zeG4s4DcuBT6HypwbtFplMbk9Nzh
         8O6ISsM077HKUwUTz4y1RWSc8EUKzdnUwfBgCXK3PjyCGhO2LEJfO4NN7yHhg9lSPFaP
         7JLJF/CHKYqqj59hFYn0WH9B0oIedeankg7xyThTK2zhW2ttwMLsxg/QuQF3pAeq4Ziu
         0WlmGveiE7jSJ24AkG7+rvU9cCuvSDddE1avBA5HfriHZY7H6WRdqNQoaP56nOZIewGQ
         vZRg==
X-Gm-Message-State: AOAM531YgEsQsWVO1AGEGTAGNyFoVAQ6YYb4U1ynJWIjBJOIDOKxeiNR
        +x5Gq2LL98UBjcuZa+8hcNlagwU1/HgACQ==
X-Google-Smtp-Source: ABdhPJwkqc6KaHAN26ymTGInRyqoNocr1Owi7SyNrzB7E10mERwWm9wqfDjFx4LDnP/LadUaCRXgHA==
X-Received: by 2002:a50:8004:: with SMTP id 4mr22900783eda.329.1607403254655;
        Mon, 07 Dec 2020 20:54:14 -0800 (PST)
Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com. [209.85.221.43])
        by smtp.gmail.com with ESMTPSA id rh2sm14420029ejb.68.2020.12.07.20.54.12
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 07 Dec 2020 20:54:13 -0800 (PST)
Received: by mail-wr1-f43.google.com with SMTP id a12so8104946wrv.8
        for <linux-doc@vger.kernel.org>; Mon, 07 Dec 2020 20:54:12 -0800 (PST)
X-Received: by 2002:adf:f881:: with SMTP id u1mr22668227wrp.103.1607403252411;
 Mon, 07 Dec 2020 20:54:12 -0800 (PST)
MIME-Version: 1.0
References: <20201125221917.150463-1-ribalda@chromium.org> <20201130083410.GD32234@lst.de>
 <20201201033658.GE3723071@google.com> <20201201144916.GA14682@lst.de>
In-Reply-To: <20201201144916.GA14682@lst.de>
From:   Tomasz Figa <tfiga@chromium.org>
Date:   Tue, 8 Dec 2020 13:54:00 +0900
X-Gmail-Original-Message-ID: <CAAFQd5BBEbmENrrZ-vMK9cKOap19XWmfcxwrxKfjWx-wEew8rg@mail.gmail.com>
Message-ID: <CAAFQd5BBEbmENrrZ-vMK9cKOap19XWmfcxwrxKfjWx-wEew8rg@mail.gmail.com>
Subject: Re: [PATCH v3 5/6] media: uvcvideo: Use dma_alloc_noncontiguos API
To:     Christoph Hellwig <hch@lst.de>
Cc:     Sergey Senozhatsky <sergey.senozhatsky.work@gmail.com>,
        Ricardo Ribalda <ribalda@chromium.org>,
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

Hi Christoph,

On Tue, Dec 1, 2020 at 11:49 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Tue, Dec 01, 2020 at 12:36:58PM +0900, Sergey Senozhatsky wrote:
> > Not that I have any sound experience in this area, but the helper
> > probably won't hurt. Do you also plan to add vmap() to that helper
> > or dma_alloc_noncontiguous()/sg_alloc_table_from_pages() only?
>
> Yes, I think adding the vmap is useful, and it probably makes sense
> to do that unconditionally.  I'd also include the fallback to
> dma_alloc_pages when the noncontig version isn't supported in the
> helper.

From the media perspective, it would be good to have the vmap
optional, similarly to the DMA_ATTR_NO_KERNEL_MAPPING attribute for
coherent allocations. Actually, in the media drivers, the need to have
a kernel mapping of the DMA buffers corresponds to a minority of the
drivers. Most of them only need to map them to the userspace.

Nevertheless, that minority actually happens to be quite widely used,
e.g. the uvcvideo driver, so we can't go to the other extreme and just
drop the vmap at all.

In any case, Sergey is going to share a preliminary patch on how the
current API would be used in the V4L2 videobuf2 framework. That should
give us more input on how such a helper could look.

Other than that, again, thanks a lot for helping with this.

Best regards,
Tomasz
