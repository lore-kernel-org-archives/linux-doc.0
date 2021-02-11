Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AB4A2C433E6
	for <linux-doc@archiver.kernel.org>; Thu, 11 Feb 2021 13:24:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7D60C64E7E
	for <linux-doc@archiver.kernel.org>; Thu, 11 Feb 2021 13:24:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229674AbhBKNXn (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 11 Feb 2021 08:23:43 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53644 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231909AbhBKNVZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 11 Feb 2021 08:21:25 -0500
Received: from mail-il1-x134.google.com (mail-il1-x134.google.com [IPv6:2607:f8b0:4864:20::134])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C7EFC06178A
        for <linux-doc@vger.kernel.org>; Thu, 11 Feb 2021 05:20:43 -0800 (PST)
Received: by mail-il1-x134.google.com with SMTP id z18so5005569ile.9
        for <linux-doc@vger.kernel.org>; Thu, 11 Feb 2021 05:20:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=JCKRoPINZ+vg1pxHvLz7YyDZ6J4aOJvyJXVgjObIKG4=;
        b=mGtVpa0p8+nSp/876Rbyd65LQvkTFLdveKIyns6pGgv6mx2iRe0YWPRl3iis9qOqvg
         SWS5kLaKLirExWjuhlC2pM8F8OODaHEmGJjxA5or2xmJkXM8I9eOSsM2oHc7TLfOl25g
         PlNP7gQIMu8xOmSaw+laMsyYggSZn0rR09/To=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=JCKRoPINZ+vg1pxHvLz7YyDZ6J4aOJvyJXVgjObIKG4=;
        b=uNMUTxRjH81A2+UH27QpkO07V80rgkbWwfvGWpHgWGV0E++TICBAn0YlhK5ZCEy4wD
         44+GkJsGHuciakwLxQaI0NWOOd31t9amTjBn52usVLfJxoto3I++oXyIbOX9j22fNRpM
         W0Z1MYeTs5BnXFdTWMbrm7pDkB7F1TChxRpNkPI8wzwTkIK0wdwXuGaP1S2mJrPmJsef
         WD909sQ4W5RM9jZgHrbNbDN+dyYmLWOAIBohMdM7Mwf/fjtTc58OR7U2DUAVY+B6d4f/
         qdQDU4rNDK7FKi8z9TunfDn3HxnvKnD/4gHEx/tOOYiVwqcMPwADlYnDohzImggigM+1
         LNLg==
X-Gm-Message-State: AOAM531RRGh6g2vAqDRZnk79jEoDvYiQ9RXfVL9iAUuNOb9RTiNtK59T
        x9Is0O+SM79YOfFo6vxyj0XdYP6avVSQ3A==
X-Google-Smtp-Source: ABdhPJxb+394YuPCaEQvBfHH1qg0ebTYE+n1tfzAmu1LcJK5nsCqSFiH+rFcksCpz48QaZeslU7c8A==
X-Received: by 2002:a05:6e02:1c0f:: with SMTP id l15mr5555722ilh.21.1613049642267;
        Thu, 11 Feb 2021 05:20:42 -0800 (PST)
Received: from mail-io1-f44.google.com (mail-io1-f44.google.com. [209.85.166.44])
        by smtp.gmail.com with ESMTPSA id l14sm2533487ilh.58.2021.02.11.05.20.41
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 11 Feb 2021 05:20:41 -0800 (PST)
Received: by mail-io1-f44.google.com with SMTP id f2so5644403ioq.2
        for <linux-doc@vger.kernel.org>; Thu, 11 Feb 2021 05:20:41 -0800 (PST)
X-Received: by 2002:a02:8642:: with SMTP id e60mr8507360jai.13.1613049640964;
 Thu, 11 Feb 2021 05:20:40 -0800 (PST)
MIME-Version: 1.0
References: <20210202095110.1215346-1-hch@lst.de> <20210207184855.GA27553@lst.de>
 <CAAFQd5BzAvgiTLGFse+ZWUrFtZ1Ysf+p+e-4rW8gq_iP0xhWEA@mail.gmail.com>
 <20210209082213.GA31902@lst.de> <CANiDSCuzKczCnAdC9b0r-6WVBFYXYnvQHKbxSeYq2QW1uVsDLQ@mail.gmail.com>
 <CANiDSCvPodsmcOi1fMwvZsyMxWsRQWNT7VkbZs4=XePYXfiXow@mail.gmail.com>
 <20210209170217.GA10199@lst.de> <CANiDSCs8dXVoWuwkVs=v+=s770MpzH1xiDuj-080-98ynuz97g@mail.gmail.com>
 <20210211130625.GA20155@lst.de>
In-Reply-To: <20210211130625.GA20155@lst.de>
From:   Ricardo Ribalda <ribalda@chromium.org>
Date:   Thu, 11 Feb 2021 14:20:30 +0100
X-Gmail-Original-Message-ID: <CANiDSCupVLQMbJVKrrKBJvJxHgteeVFik7LAJy5zbUi2ESwsGA@mail.gmail.com>
Message-ID: <CANiDSCupVLQMbJVKrrKBJvJxHgteeVFik7LAJy5zbUi2ESwsGA@mail.gmail.com>
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

HI Christoph

On Thu, Feb 11, 2021 at 2:06 PM Christoph Hellwig <hch@lst.de> wrote:
>
> On Thu, Feb 11, 2021 at 10:08:18AM +0100, Ricardo Ribalda wrote:
> > Hi Christoph
> >
> > What are your merge plans for the uvc change?
> > http://git.infradead.org/users/hch/dma-mapping.git/commit/3dc47131f8aacc2093f68a9971d24c754e435520
> >
> > Are you going to remove the patch on your Merge request and then send
> > it for review to Laurent? or merge it through your tree with a S-o-B
> > him?
>
> I though I had all the ACKs to queue it up.  Is that not what was
> intended?  Queueing up the API without a user is generally a bad idea.
>

I am pretty sure we need the ack from Laurent. He maintains uvc

@Laurent Pinchart what are your thoughts?

Thanks!


-- 
Ricardo Ribalda
