Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A204CC636CC
	for <linux-doc@archiver.kernel.org>; Fri,  3 Feb 2023 04:29:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231426AbjBCE3t (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 2 Feb 2023 23:29:49 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51048 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230372AbjBCE3s (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 2 Feb 2023 23:29:48 -0500
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9C70410FA
        for <linux-doc@vger.kernel.org>; Thu,  2 Feb 2023 20:29:46 -0800 (PST)
Received: by mail-pg1-x52c.google.com with SMTP id a23so2842570pga.13
        for <linux-doc@vger.kernel.org>; Thu, 02 Feb 2023 20:29:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=9VZUD5Y+UYw+BivbwlFE9Qxeo/ryuws1421TWcWdDj4=;
        b=tMLvVZ2wXJFrBRvacFOwlpa+4cRu9uGLj7R9fKNwQu0eujffwqCHw6H0pMM8sCmdMX
         kYCwXW1yylJjF6wA6FrmDiszwmGcKkAbVCNQ8f/v+qp+ewqEdtDTmgmdVe2AK3ZGwSIP
         tbEV2Kh2CFj55Ls8bhI7G0NvR7pqA8x6nSVM0iAxCd92uedz9oK8FUPjNVOVnNj4z+Ev
         wrUUclW5XeDGLhfC0b5kfnK8HPuyfMSQL20w84p2o/SppXhguifwza/xl1xixMFjo8Qb
         GX8savX6Wd664xYv5/bALUpJQYNRZ8F2WeQfErnW+yFMBN08mVIpTKGh4leN8oSX3cTl
         xhcw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=9VZUD5Y+UYw+BivbwlFE9Qxeo/ryuws1421TWcWdDj4=;
        b=YrWPls8cj3xh1d7jxeFWDTNQKTJh9ffl/8p/kjzfVsUDj2AQcdW56zTUHx/c5QrDcH
         zUagc44SjePPpJUjz7IuSrurH9YlB2w5BL1ywJXTHoMv65fShP/CD1gzCX18yvRjimY5
         53OzHJSbjrme/V2nGwFmAJh+kcNIW4egG/jjxcdZtHzDZydRjajj6k1GTEYsMiDOobJv
         uMdIt0zr+dOZb4nqGymj/JzIR/QkE8qrWqnxOkF0e3PT/Nztkwmq1xyOLZed5f4Hy/My
         an6z9TD/RPjmJW9fYRC/WNTxt77g3rqvBB3IJpYGrrSWeK+eFWA9Cs04hF8VL7a26P6q
         4vzQ==
X-Gm-Message-State: AO0yUKWAKopfNuFBVtBliC9ZQWL1/3U6XNKTUN//q4ZYUP1FKsCrHgMJ
        v6tdinrsSN40InI1Ka+kPKqybrNoUsOzk/0qJJZ5WB8vPPfRsK7W8ns=
X-Google-Smtp-Source: AK7set9Zq3iyUjiTnuoKmw8LRoyEVz/YCQjg17RifWaQsgD62XPfUR4YeRamPg7ZxzxGR+cRqWcNG4CY625jzzM8tOw=
X-Received: by 2002:a05:6a00:2bc:b0:58d:9be8:7209 with SMTP id
 q28-20020a056a0002bc00b0058d9be87209mr2149409pfs.47.1675398585857; Thu, 02
 Feb 2023 20:29:45 -0800 (PST)
MIME-Version: 1.0
References: <87o7qu5al3.fsf@meer.lwn.net> <CAO2JNKW9pL5097qdte1N4F=RSnRJtcnpaDf__ROJAFfHitooYQ@mail.gmail.com>
 <fa426691-c76a-8ab0-4975-6edacc9cb247@gmail.com> <8735855j4p.fsf@meer.lwn.net>
 <1c9bb0dc-7efd-c664-043a-5c0453739166@gmail.com>
In-Reply-To: <1c9bb0dc-7efd-c664-043a-5c0453739166@gmail.com>
From:   Sadiya Kazi <sadiyakazi@google.com>
Date:   Fri, 3 Feb 2023 09:59:34 +0530
Message-ID: <CAO2JNKVMe2YzWiqosR+fVcuPPVWmqgbK0HLFD5OUp=v_u8APRg@mail.gmail.com>
Subject: Re: [PATCH RFC] docs: Add more information to the HTML sidebar
To:     Akira Yokosawa <akiyks@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        David Gow <davidgow@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Feb 3, 2023 at 8:07 AM Akira Yokosawa <akiyks@gmail.com> wrote:
>
> On Fri, 20 Jan 2023 08:19:02 -0700, Jonathan Corbet wrote:
> > Akira Yokosawa <akiyks@gmail.com> writes:
> >
> >>>> Thoughts?  Is this headed in the right direction?  This view of the TOC
> >>>> is readily available from Sphinx; if we want something else it's going
> >>>> to be rather more work.
> >>
> >> I think this looks like the right direction. But how far do you want to
> >> mimic RTD's sidebar???
> >
> > Well ... that is kind of my question for all of the folks who are
> > unhappy with the current sidebar.  What would you like to see there?
> >
> > Things like sidebar width, whether bullets are used (I'd deliberately
> > taken them out as excess noise), which text is which color, etc. are all
> > just CSS; we can paint that shed any color we like.  The harder part is
> > deciding which information we want to have there in the first place.  So
> > ... is the set of links shown in the new sidebar close to what we
> > want...  too much stuff?  Something missing?
>
> Seeing no response from anyone so far, I feel like I need to express
> my personal view. As you might already be well aware of, I love the
> site navigation of RTD both on large screens and small (narrow) screens.
>
(+1) to this. I too prefer the site navigation of RTD over Alabaster.

> On *what* should be in the sidebar, I don't see anything missing
> give or take the toctree depth.
>
> To my eyes, there is two deficiencies with the alabaster theme in site
> navigation.
>
>   - Even with this RFC patch amended with the diff I suggested in
>     https://lore.kernel.org/linux-doc/6b2e496f-d7f6-abea-6bbd-4b12fea76a68@gmail.com/,
>     there remain "Where am I???" moments when jumping to a different page.
>     In such jumps, alabaster's sidebar always reset to top with the
>     main pane. RTD's sidebar keeps its position so there is no such
>     moment.
>
>   - On small/narrow screens, alabaster's sidebar is pushed downward
>     to the bottom of the page. This means you typically need three
>     steps to see where you are when jumping to another page:
>
>       1) Jump to another page.
>       2) Scroll to the bottom.
>       3) See where you are.
>
>     With RTD, you don't need to scroll to the bottom. Sidebar is there
>     behind an icon at the top-left which is often used as "menu" icon.
>
>       1) Jump to another page.
>       2) Open sidebar and it tells you where you are.
>
Adding to what Akira says, what I really would like to see is a TOC in the
sidebar that shows all parts, with the current part expanded at all times.
For instance, the sidebar should expand and appear as follows when
I click the KUnit documentation's main index page:

KUnit - Linux Kernel Unit Testing
      Getting Started
      KUnit Architecture
      Run tests with KUnit
      Introduction
      Unit Testing

When the 'Introduction' item is  selected, the toc in the sidebar should get
updated as follows:

KUnit - Linux Kernel Unit Testing
Getting Started
KUnit Architecture
Run tests with KUnit
Introduction
    Features
    Prerequisites
Unit Testing

Currently, only the second-level headings exhibit the above behaviour,
as seen here:
https://static.lwn.net/kerneldoc/dev-tools/index.html

Applying this to third-level headings, which are significant in KUnit
docs, would be helpful.
It will make it easier for us to always know where we are
on this website because it displays the parent, sibling, and child
nodes of the current
page.

> I don't know if alabaster can be managed to behave similar to RTD
> with a reasonable effort.
>
>         Thanks, Akira
>
>
> >
> > Thanks,
> >
> > jon

Thanks,
Sadiya
