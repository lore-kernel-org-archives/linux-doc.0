Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 71D1CC433E0
	for <linux-doc@archiver.kernel.org>; Thu, 11 Feb 2021 09:16:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 45EEB60230
	for <linux-doc@archiver.kernel.org>; Thu, 11 Feb 2021 09:16:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229961AbhBKJQN (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 11 Feb 2021 04:16:13 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56144 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230002AbhBKJJM (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 11 Feb 2021 04:09:12 -0500
Received: from mail-io1-xd2c.google.com (mail-io1-xd2c.google.com [IPv6:2607:f8b0:4864:20::d2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 93412C061756
        for <linux-doc@vger.kernel.org>; Thu, 11 Feb 2021 01:08:31 -0800 (PST)
Received: by mail-io1-xd2c.google.com with SMTP id e24so4940465ioc.1
        for <linux-doc@vger.kernel.org>; Thu, 11 Feb 2021 01:08:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kdA1Kwoq/S/LKCIqEWml1fSvv8WMuf1jYn8nBhMfcnI=;
        b=VUe+0kbaY+lBr2aOAuw3nZWDJynOj1vx+bapgsEHj20UriFRNFl8g9448c3tGnRubi
         +EvwR0jgW8sfzeMtztTntSjlCZcTr67yBraggSLDUOTlaKo5GBN06hoxX9GWra1YGQiL
         NLztfh16+p4gv4RNidsFwTb/kVDRP5dc/m0TY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kdA1Kwoq/S/LKCIqEWml1fSvv8WMuf1jYn8nBhMfcnI=;
        b=AKVZWtsWsHyzlBbfdcxu1qcB0sZ9KeEj3SsVW1z5jXcKA55AOfqL6qX6uX5Ls0SFpf
         b4gFVRfTgueAL4TDXVVvBMWtNYLMylGr1lEM+NuFBeHaHBR7KI9ALBlE1TbVfVkzTeaZ
         lO4qPWfft/SbFG9THfud6FnCkst+meeU5XeYoaHYdh+K+9tX6DUIVTZ22BChsiK7Y5bO
         AooQqNM7pSJbucOj8V6UPs5dJN222T8/WtKrsfqkttJBk9KWbzCXO6bGQtLh3RI5a9tg
         2G5xcHqKb4mwqO1Av2eJFlF78rYC0wI7AXkHXWVXBN9ES5mS/Tif65PBJrjv7IgmabaK
         xCrg==
X-Gm-Message-State: AOAM533PRJ3ke2kbcxLUy00TUxB6+mzSdqBrBSooFyFxSoPEr5cptPfC
        91OM1mFf/csMwDRFYbZ6zCOdYgka6EfuIw==
X-Google-Smtp-Source: ABdhPJxtqUfRZ1l24D9GcwPwopxh8hoTu57KhMC0DbYAkExxUsKMqr6l9wPSe8yOYLxj6jSUoMuFaw==
X-Received: by 2002:a5d:9f15:: with SMTP id q21mr4681827iot.132.1613034510714;
        Thu, 11 Feb 2021 01:08:30 -0800 (PST)
Received: from mail-il1-f179.google.com (mail-il1-f179.google.com. [209.85.166.179])
        by smtp.gmail.com with ESMTPSA id l14sm2246771ilh.58.2021.02.11.01.08.29
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Feb 2021 01:08:29 -0800 (PST)
Received: by mail-il1-f179.google.com with SMTP id q5so4423758ilc.10
        for <linux-doc@vger.kernel.org>; Thu, 11 Feb 2021 01:08:29 -0800 (PST)
X-Received: by 2002:a92:730a:: with SMTP id o10mr4922650ilc.160.1613034508965;
 Thu, 11 Feb 2021 01:08:28 -0800 (PST)
MIME-Version: 1.0
References: <20210202095110.1215346-1-hch@lst.de> <20210207184855.GA27553@lst.de>
 <CAAFQd5BzAvgiTLGFse+ZWUrFtZ1Ysf+p+e-4rW8gq_iP0xhWEA@mail.gmail.com>
 <20210209082213.GA31902@lst.de> <CANiDSCuzKczCnAdC9b0r-6WVBFYXYnvQHKbxSeYq2QW1uVsDLQ@mail.gmail.com>
 <CANiDSCvPodsmcOi1fMwvZsyMxWsRQWNT7VkbZs4=XePYXfiXow@mail.gmail.com> <20210209170217.GA10199@lst.de>
In-Reply-To: <20210209170217.GA10199@lst.de>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Thu, 11 Feb 2021 10:08:18 +0100
X-Gmail-Original-Message-ID: <CANiDSCs8dXVoWuwkVs=v+=s770MpzH1xiDuj-080-98ynuz97g@mail.gmail.com>
Message-ID: <CANiDSCs8dXVoWuwkVs=v+=s770MpzH1xiDuj-080-98ynuz97g@mail.gmail.com>
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
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Christoph

What are your merge plans for the uvc change?
http://git.infradead.org/users/hch/dma-mapping.git/commit/3dc47131f8aacc2093f68a9971d24c754e435520

Are you going to remove the patch on your Merge request and then send
it for review to Laurent? or merge it through your tree with a S-o-B
him?

Thanks

On Tue, Feb 9, 2021 at 6:02 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Tue, Feb 09, 2021 at 03:46:13PM +0100, Ricardo Ribalda wrote:
> > Hi Christoph
> >
> > I have tested it in both arm and x86, since there are not significant
> > changes with the previous version I did not do a performance test.
>
> I'll take this as a Tested-by.



-- 
Ricardo Ribalda
