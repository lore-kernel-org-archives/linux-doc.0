Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F2755C433DB
	for <linux-doc@archiver.kernel.org>; Wed, 27 Jan 2021 07:37:44 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B31D020663
	for <linux-doc@archiver.kernel.org>; Wed, 27 Jan 2021 07:37:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234038AbhA0HhY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 27 Jan 2021 02:37:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56398 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S317425AbhA0AAJ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 26 Jan 2021 19:00:09 -0500
Received: from mail-io1-xd29.google.com (mail-io1-xd29.google.com [IPv6:2607:f8b0:4864:20::d29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7EF49C061226
        for <linux-doc@vger.kernel.org>; Tue, 26 Jan 2021 15:29:22 -0800 (PST)
Received: by mail-io1-xd29.google.com with SMTP id 16so6785640ioz.5
        for <linux-doc@vger.kernel.org>; Tue, 26 Jan 2021 15:29:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CBy1erHkLMBcGk0Q3oow7s6KaRas0EaJCp36zieGK9E=;
        b=WkNRoEB8P5ECNzKdEHU1MaY1ENG6KFbiRYwxbKJgSn8K+bUaEv2F6ui/00GOkBbZw1
         DpHQFu74uw5I0+o/wfDdMfhbHoEjtEnlpK5FUIHFg83cKzDTFbXIl50qxrcJjlMeI8oV
         JPuFdPCN5FPGu20ODhMYQkx2qhQ0Hb0aqdWQI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CBy1erHkLMBcGk0Q3oow7s6KaRas0EaJCp36zieGK9E=;
        b=TBVGQQv98NyvK825wz/08JYepFrX2awAda0EIDrPh4ITtc6KYm6Yqn40L1Mc4mdzSz
         FenRKFCu2be6+TGdjk72cwG9Poq8fe5DsVWsyAgvx8ZsXY/LZ3E/WWTzi04iZ6Oe3Ea/
         hp/eHvGmDrhaxuXfTB+3Kf/oNUzifOyqsUiBo/GHQJssEe7Ee9+HR/sAGYri3TrPsDbt
         Zk+zjzNtXmw6kMgJZm4bHkKcH+4qaMBljhOHMctRgjx4aOsuHs5iZp75zlbsYgb0/SO4
         udfwh41qKIro8DotzKt/whY30OuHikrBB48/Bu7UstpXw2jboZzTlZ+p77Emd8hHZJjt
         7/Xw==
X-Gm-Message-State: AOAM5329ud6mz0swfSLVp65qbOABbIIkdqj3UFVBL7Eim1wuqiZcTjdv
        9G51rIcmvf2VMDdHH1WPvmyltn3Q79IhIg==
X-Google-Smtp-Source: ABdhPJz6OqyfbB363T3JoQutt1o7RVgIBrpyUdgit1JeGNIZbn0VPfJ3YezLst4AECmNsKXs0GujnQ==
X-Received: by 2002:a5d:934d:: with SMTP id i13mr5845006ioo.187.1611703761461;
        Tue, 26 Jan 2021 15:29:21 -0800 (PST)
Received: from mail-io1-f43.google.com (mail-io1-f43.google.com. [209.85.166.43])
        by smtp.gmail.com with ESMTPSA id c9sm94875ili.34.2021.01.26.15.29.20
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 26 Jan 2021 15:29:20 -0800 (PST)
Received: by mail-io1-f43.google.com with SMTP id d81so8715iof.3
        for <linux-doc@vger.kernel.org>; Tue, 26 Jan 2021 15:29:20 -0800 (PST)
X-Received: by 2002:a05:6638:3012:: with SMTP id r18mr6700227jak.13.1611703759669;
 Tue, 26 Jan 2021 15:29:19 -0800 (PST)
MIME-Version: 1.0
References: <20201125221917.150463-1-ribalda@chromium.org> <20201130083410.GD32234@lst.de>
 <20201201033658.GE3723071@google.com> <20201201144916.GA14682@lst.de>
 <CAAFQd5BBEbmENrrZ-vMK9cKOap19XWmfcxwrxKfjWx-wEew8rg@mail.gmail.com>
 <20201208071320.GA1667627@google.com> <20201209111639.GB22806@lst.de>
 <CANiDSCtsOdJUK3r_t8UNKhh7Px0ANNFJkuwM1fBgZ7wnVh0JFA@mail.gmail.com>
 <20210111083614.GA27589@lst.de> <CANiDSCvuvj47=nhoWhvzc5raMxM60w+JYRWjd0YepcbcbkrUjA@mail.gmail.com>
 <20210126170659.GA9104@lst.de>
In-Reply-To: <20210126170659.GA9104@lst.de>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Wed, 27 Jan 2021 00:29:08 +0100
X-Gmail-Original-Message-ID: <CANiDSCsz+9DJesOTJ5C5HGEH-wwuTmEd3c8yLoHjnDz=2+ndJw@mail.gmail.com>
Message-ID: <CANiDSCsz+9DJesOTJ5C5HGEH-wwuTmEd3c8yLoHjnDz=2+ndJw@mail.gmail.com>
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

Thanks for the series!

I have a couple of questions:

- Is there any platform where dma_alloc_noncontiguos can fail?
This is, !ops->alloc_noncontiguous and !dev->coherent_dma_mask
If yes then we need to add a function to let the driver know in
advance that it has to use the coherent allocator (usb_alloc_coherent
for uvc)

- In dma_alloc_noncontiguos, on the dma_alloc_pages fallback. If we
have a device where the dma happens in only one direction, could not
get more performance with DMA_FROM/TO_DEVICE instead of
DMA_BIDIRECTIONAL ?


Then I have tried to use the API, and I have encountered a problem: on
uvcvideo the device passed to the memory allocator is different for
DMA_PAGES and NON_CONTIGUOUS:
https://github.com/ribalda/linux/blob/042cd497739f71c8d4a83a67ee970369e2baca4a/drivers/media/usb/uvc/uvc_video.c#L1236

I need to dig a bit tomorrow to figure out why this is, I have
hardware to test both paths, so it should not be too difficult.


Thanks again






On Tue, Jan 26, 2021 at 6:07 PM . Christoph Hellwig <hch@lst.de> wrote:
>
> Please take a quick look at this branch:
>
> http://git.infradead.org/users/hch/misc.git/shortlog/refs/heads/dma_alloc_noncontiguous
>
> Warning: hot off the press, and only with the v4l conversion as that
> seemed at little easier than uvcvideo.



--
Ricardo Ribalda
