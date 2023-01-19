Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E3323C004D4
	for <linux-doc@archiver.kernel.org>; Thu, 19 Jan 2023 22:09:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229813AbjASWJz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 19 Jan 2023 17:09:55 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46512 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229760AbjASWJW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 19 Jan 2023 17:09:22 -0500
Received: from mail-qt1-x82f.google.com (mail-qt1-x82f.google.com [IPv6:2607:f8b0:4864:20::82f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8295D88D1
        for <linux-doc@vger.kernel.org>; Thu, 19 Jan 2023 13:46:53 -0800 (PST)
Received: by mail-qt1-x82f.google.com with SMTP id e8so2741358qts.1
        for <linux-doc@vger.kernel.org>; Thu, 19 Jan 2023 13:46:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linuxfoundation.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=qlIuAzy0CKmfob+VwS63QoBpBffTthRBwy4ssNc++Zc=;
        b=SO2m+CGCpI4nrJTFY3HiyfU7+iXojTJ+sfeWN38q9AzxnsA1BqzSAwk39IM+zLpR8/
         R999v38oPtTuDm3lpEEZE8dfLlo8hks7ZDqW5M++e0Ydo6c2k/keTXZ+p2P/9RkVZSAX
         JvnwaqJO/FT/ieeHy8b3IkzV5SprqB3dGzks8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=qlIuAzy0CKmfob+VwS63QoBpBffTthRBwy4ssNc++Zc=;
        b=VFKsbI4jUI+jFLbhjd/XNqmTDfJe9G5fGcHPSl5stAy3n0fPXgBg1/tej+Vhoeet+H
         Hzqz0yTKNaQUFL/XbS5UaXimcljk4E7rxotiO2/b1KzMvoCQHQlIi56btfg0s9d05hsm
         aQmEW6f5p1QQc23SFWE7ypC0BmbkvJONCOIwc7SDF1BCG2+Z2QtQ/TwHuI8VpEZw5V6g
         pda8dm93CfOXDWOZrtiYqNZ/ncFGEXdV2fUan99YbEsMuGv6+76sSqMuFs9YJAoV9G8+
         ibUbt8B+q/iLcZaMK2NO5AZ48kwtEmY/PPU0pWmGOfBItuzn0z1rcyLQaleFa6sKl/ON
         OXZw==
X-Gm-Message-State: AFqh2kpy2Pe6ILWNLSf+b2mfBNh0OlbivJFeOG/S4bxsNQnU0ipXBUOB
        z0lwlyuuPXIVz6Ys9+3pT5e6cw==
X-Google-Smtp-Source: AMrXdXufJEeE4u+hvKEdx9M9a5l6L+SiCJEwrWUHlJVfwgyw3aFdzPaoINdbwYNbfyhRvdrFxN1VWg==
X-Received: by 2002:ac8:748e:0:b0:3b6:2e37:3394 with SMTP id v14-20020ac8748e000000b003b62e373394mr14485171qtq.27.1674164808164;
        Thu, 19 Jan 2023 13:46:48 -0800 (PST)
Received: from meerkat.local (bras-base-mtrlpq5031w-grc-30-209-226-106-7.dsl.bell.ca. [209.226.106.7])
        by smtp.gmail.com with ESMTPSA id y6-20020a37f606000000b006fef61300fesm7939701qkj.16.2023.01.19.13.46.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 19 Jan 2023 13:46:47 -0800 (PST)
Date:   Thu, 19 Jan 2023 16:46:46 -0500
From:   Konstantin Ryabitsev <konstantin@linuxfoundation.org>
To:     Jonathan Corbet <corbet@lwn.net>
Cc:     Akira Yokosawa <akiyks@gmail.com>,
        Sadiya Kazi <sadiyakazi@google.com>, brendanhiggins@google.com,
        davidgow@google.com, kunit-dev@googlegroups.com,
        linux-doc@vger.kernel.org
Subject: Re: New theme - Alabaster for Kernel Documentation
Message-ID: <20230119214646.nquwprfswdckwexw@meerkat.local>
References: <CAO2JNKUA5DWxNk2cCZwj8DEFF-acf6ZpxwBqn2qTwn4fTW1+BQ@mail.gmail.com>
 <c00df839-9429-891b-5682-3dbc2d6edbbe@gmail.com>
 <87r0vq6wni.fsf@meer.lwn.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <87r0vq6wni.fsf@meer.lwn.net>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jan 19, 2023 at 02:29:21PM -0700, Jonathan Corbet wrote:
> Akira Yokosawa <akiyks@gmail.com> writes:
> 
> > Konstantin, would it be possible for you to add "DOCS_THEME=sphinx_rtd_theme"
> > for the "latest" kernel documentation builds until the new default theme
> > becomes good enough for most people?  That is if Jon agrees.
> > For the "next" builds, alabaster theme should be OK, and easier for us to
> > compare the two themes.
> 
> I'd prefer to avoid this if possible.  In the end, though, what
> kernel.org does isn't my decision, of course...

Something I've considered is to have /latest/ show the latest mainline
*released* mainline, while /rc/ would show the latest rc. So, we'd have three
distinct movable targets:

docs.kernel.org       - latest mainline release (same as kernel.org/doc/html/latest/)
docs.kernel.org/next/ - linux-next
docs.kernel.org/rc/   - latest rc

Would that be acceptable as a solution?

-K
