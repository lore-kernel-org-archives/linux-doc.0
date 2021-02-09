Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7007BC433DB
	for <linux-doc@archiver.kernel.org>; Tue,  9 Feb 2021 08:30:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3F8B764EC3
	for <linux-doc@archiver.kernel.org>; Tue,  9 Feb 2021 08:30:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229691AbhBIIaw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 9 Feb 2021 03:30:52 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48862 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229637AbhBIIav (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 9 Feb 2021 03:30:51 -0500
Received: from mail-io1-xd2a.google.com (mail-io1-xd2a.google.com [IPv6:2607:f8b0:4864:20::d2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A4559C06178A
        for <linux-doc@vger.kernel.org>; Tue,  9 Feb 2021 00:30:11 -0800 (PST)
Received: by mail-io1-xd2a.google.com with SMTP id u20so17892685iot.9
        for <linux-doc@vger.kernel.org>; Tue, 09 Feb 2021 00:30:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CD7Xj/h3myZPE11iClGnY0ITJjZw2WaNmh4Gs5ySEmU=;
        b=Z8/glXM4r2nvS+LxLw4u5mH2ajnyiNqMAp89KxvOsQ79QYUf+J9Uxi5WqPcaOfU9de
         0V8+b6akhQ45QuTYOPMxUyD9qmM8oScMqOS8Oj1e9r9VWtH5UVoa43jhATVtS5gBZMuR
         jtwW+wPVpUEXAjtRmVt/91CORyu68Fm8Gyuew=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CD7Xj/h3myZPE11iClGnY0ITJjZw2WaNmh4Gs5ySEmU=;
        b=S8BzBKOxPNpf5vBITzb5EH3uUMaQ0+2uvy4WqY7Ifn/sqof/whQNoxt2KRrvAOWFe8
         p3iOkuqJkHuwLbdkMAoWVDfa6px73mCNE5OXjb0QoJ6/QF1VDtXYSanMp4MbPwOzJqCt
         jyiqb7S4AWjW5Qclk56cOxyR6Ux54LhzEhYJfsrLwWoHRqSsl9ZpS7zYDSdxchIJ+SHe
         yP0AGBRXBe0I0ZUeT9zVz0GyOan0kgduA+7v4/AVjWAh5EAw25bkfdlZThAl8vrSZgok
         QZXVGu6G1UuDqen4UTPiHYl/+eqzmWGsD+ZSzi8Af1l5M7zKXmOnm3jBtPdKRFz7f0Dm
         +gYA==
X-Gm-Message-State: AOAM5338n0WXV9Lq/n2RRM6dv042c4BK0pZihqZKzPY3LywKlZfEl4hA
        FtdbhZD2vXCswrvQUwtnwp6TQYnRWcT9PA==
X-Google-Smtp-Source: ABdhPJxfCzuqUPcKDA5fzpW5v0qn/3FsfJkiXBpI6UgvGeFD3gXivva1WgyCgzSe0hbFJsT+sjIORg==
X-Received: by 2002:a05:6602:2dcd:: with SMTP id l13mr18469238iow.40.1612859410947;
        Tue, 09 Feb 2021 00:30:10 -0800 (PST)
Received: from mail-io1-f41.google.com (mail-io1-f41.google.com. [209.85.166.41])
        by smtp.gmail.com with ESMTPSA id f15sm10087804ilj.23.2021.02.09.00.30.09
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 09 Feb 2021 00:30:09 -0800 (PST)
Received: by mail-io1-f41.google.com with SMTP id p132so671181iod.11
        for <linux-doc@vger.kernel.org>; Tue, 09 Feb 2021 00:30:09 -0800 (PST)
X-Received: by 2002:a5d:894d:: with SMTP id b13mr18083060iot.150.1612859408996;
 Tue, 09 Feb 2021 00:30:08 -0800 (PST)
MIME-Version: 1.0
References: <20210202095110.1215346-1-hch@lst.de> <20210207184855.GA27553@lst.de>
 <CAAFQd5BzAvgiTLGFse+ZWUrFtZ1Ysf+p+e-4rW8gq_iP0xhWEA@mail.gmail.com> <20210209082213.GA31902@lst.de>
In-Reply-To: <20210209082213.GA31902@lst.de>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Tue, 9 Feb 2021 09:29:58 +0100
X-Gmail-Original-Message-ID: <CANiDSCuzKczCnAdC9b0r-6WVBFYXYnvQHKbxSeYq2QW1uVsDLQ@mail.gmail.com>
Message-ID: <CANiDSCuzKczCnAdC9b0r-6WVBFYXYnvQHKbxSeYq2QW1uVsDLQ@mail.gmail.com>
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

On Tue, Feb 9, 2021 at 9:22 AM Christoph Hellwig <hch@lst.de> wrote:
>
> On Mon, Feb 08, 2021 at 08:33:50PM +0900, Tomasz Figa wrote:
> > Sorry for the delay. The whole series looks very good to me. Thanks a lot.
> >
> > Reviewed-by: Tomasz Figa <tfiga@chromium.org>
>
> Thanks.
>
> Ricardo, do the uvcvideo changes look good to you?  I'd like to queue
> the series up for this merge window.

Let me test them in real hardware today.

Thanks!


-- 
Ricardo Ribalda
