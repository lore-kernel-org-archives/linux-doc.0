Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7604C004D4
	for <linux-doc@archiver.kernel.org>; Thu, 19 Jan 2023 22:20:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230168AbjASWTp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 19 Jan 2023 17:19:45 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51578 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230050AbjASWSt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 19 Jan 2023 17:18:49 -0500
Received: from mail-qt1-x829.google.com (mail-qt1-x829.google.com [IPv6:2607:f8b0:4864:20::829])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3E9AB4E34
        for <linux-doc@vger.kernel.org>; Thu, 19 Jan 2023 14:02:05 -0800 (PST)
Received: by mail-qt1-x829.google.com with SMTP id h21so2729627qta.12
        for <linux-doc@vger.kernel.org>; Thu, 19 Jan 2023 14:02:05 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xEYNMy8mjsOo0jkNZ8NNbyKuKU8gSq9yaWi6lDiI9YY=;
        b=hbHY08xQPqz24dwbTuQWwzz0xXt77IzfhiRIn9uPi72d/Q4GejuUIcGZrPuOw/Ti/z
         LyIu4xu+avcCkdlfqBIugmM97V51b2w3Jw41hqfHdwoi7AzUJESKgCV4TKb4t8HNjcwR
         jTEHJCBg+nvUv2dXc6wwEe8usXuZT6cFiI8gU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=xEYNMy8mjsOo0jkNZ8NNbyKuKU8gSq9yaWi6lDiI9YY=;
        b=hYGp7fioQMqMw6VTzce2NJHH8hU88v/HmJy6dK3tTzZ/bxvUM3WtDNKNFwmJ0Uxo9H
         1Z0zu2HUtb2vD5B/hV4/wgg3HQp7kPbfpprkAZapxUvg3Tct6lQ/XehXEXHDJLrztGBC
         hIMTsPEC+jC1tBReXoonkHV9D+u2wgBGjRTcByxL7/w7J9tgpMOSegtFusYnO3ssS9xc
         tF/O+hoV9fGPmi2bc+YO6wawo8NSFrNofPXfF2RBWoEgpBjDJpHq4wg7Undc53l8vSHe
         iFeIh/b6NMa+cZvwZ7hLqq3Ul6te9Xq2KqxrX7DBoxrddkivtPUfo1dcIoS2lVOHy47j
         +V0Q==
X-Gm-Message-State: AFqh2krgeV1P/gV9/GaN9U0jJ9yDOuAT77vHEuB/6ChdQnDghDVtCy5/
        BlOJgaW/Acxj7P8tp+OXH6+CcA==
X-Google-Smtp-Source: AMrXdXt85F+IEV+A9p8dr4TtuP0Vg3lodcysxbYHJspFByr0BsFTQ3lOKnKUJq1IWnFC86h4EcErOQ==
X-Received: by 2002:ac8:1090:0:b0:3b1:89e:ccc2 with SMTP id a16-20020ac81090000000b003b1089eccc2mr15713409qtj.48.1674165724909;
        Thu, 19 Jan 2023 14:02:04 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-7.dsl.bell.ca. [209.226.106.7])
        by smtp.gmail.com with ESMTPSA id e25-20020ac86719000000b003b2d890752dsm4164731qtp.88.2023.01.19.14.02.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 14:02:04 -0800 (PST)
Date:   Thu, 19 Jan 2023 17:02:03 -0500
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Akira Yokosawa <akiyks@gmail.com>,
        Sadiya Kazi <sadiyakazi@google.com>, brendanhiggins@google.com,
        davidgow@google.com, kunit-dev@googlegroups.com,
        linux-doc@vger.kernel.org
Subject: Re: New theme - Alabaster for Kernel Documentation
Message-ID: <20230119220203.2kepb2267tsxli3k@meerkat.local>
References: <CAO2JNKUA5DWxNk2cCZwj8DEFF-acf6ZpxwBqn2qTwn4fTW1+BQ@mail.gmail.com>
 <c00df839-9429-891b-5682-3dbc2d6edbbe@gmail.com>
 <87r0vq6wni.fsf@meer.lwn.net>
 <20230119214646.nquwprfswdckwexw@meerkat.local>
 <87edrq6vg9.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87edrq6vg9.fsf@meer.lwn.net>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jan 19, 2023 at 02:55:18PM -0700, Jonathan Corbet wrote:
> >> I'd prefer to avoid this if possible.  In the end, though, what
> >> kernel.org does isn't my decision, of course...
> >
> > Something I've considered is to have /latest/ show the latest mainline
> > *released* mainline, while /rc/ would show the latest rc. So, we'd have three
> > distinct movable targets:
> >
> > docs.kernel.org       - latest mainline release (same as kernel.org/doc/html/latest/)
> > docs.kernel.org/next/ - linux-next
> > docs.kernel.org/rc/   - latest rc
> >
> > Would that be acceptable as a solution?
> 
> I think we've miscommunicated somewhere.  What I don't like is the idea
> of building the mainline docs with a non-default HTML theme.

We haven't really miscommunicated -- I'm just giving an option that solves
things right now (and gives everyone time to roll back to a different theme if
it's deemed needed for the v6.2 release).

> A "latest -rc" build could be a nice thing, though :)

OK, I'll see if I can add that in.

-K
