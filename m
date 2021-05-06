Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4841DC43461
	for <linux-doc@archiver.kernel.org>; Thu,  6 May 2021 12:48:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 11B68613CD
	for <linux-doc@archiver.kernel.org>; Thu,  6 May 2021 12:48:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229769AbhEFMs4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 6 May 2021 08:48:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231580AbhEFMsz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 6 May 2021 08:48:55 -0400
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9CE66C061763
        for <linux-doc@vger.kernel.org>; Thu,  6 May 2021 05:47:56 -0700 (PDT)
Received: by mail-lf1-x132.google.com with SMTP id z13so7636239lft.1
        for <linux-doc@vger.kernel.org>; Thu, 06 May 2021 05:47:56 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=QzEhbEsMPT0RAPd1e91T+mtb6uxkgCOagogsHHD+eZ8=;
        b=Ks4nME/nPDpiuCR59p2B2xWzX2AYOmCJzm4REQpSn4ozFkIMOPSUaWXVEwcPIc4xyQ
         /h/8FA83Pe63a9B4OsKLVtiF+oz11lDf0JTY0Nrd9qrebslmObz5Ypz0Gz1hTRDzKP2j
         VqxNzfQVUd8RPj/vo9zPpRYyZSk4aFNGAgziomJb2ZrXcFnaEFbVdi4BRH2/5cHXHWkt
         lp9+3khZACAlWA5W6hz3CYTVxwHDfHI9CGl1MoHyCeKD8UrE3WcIrz9uSDezslqePeqc
         wV081/jHVKrG2qYS+BZVI099G5yt3aR4TATmjDcF4wJ3EMrnwEPL5Emo1GkHIqM9iFxK
         zw+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=QzEhbEsMPT0RAPd1e91T+mtb6uxkgCOagogsHHD+eZ8=;
        b=tsWrkq93vwdvBvpZINZEP70iyd9vyejNQJ5XyUxR171gk/NWHdGKZgReI/OiFmVp61
         HYgUvvDQ5muXrsw6T0bgEycNqqpX7pGE1OBM2CphRgQph9f2duYH0O90BNzutzbEHt8v
         TR4RXXwq9+PRLu2qb7V1ODVQ9iLaBrTmedb4iXolw4wJyLQ/zsfEawZ+Xe4xecwKd6oZ
         +Zr2s6Zgp3KZPnVfE1l5RfctTG71gKDYw4KSHZTsLbsbp4DekteuEh1UJgBB5uph/Nju
         QP6839KEctdF0ZwWfBE8Mw3PMfMp6pPgsJXLmJOhU48ZGI3YBhNjAs+o+cAcz3RM2PA2
         u78g==
X-Gm-Message-State: AOAM530eq9xeFjqEhUx0jX4kpW8OEhpUKd126Z6EdUOyaJbbw3nDSq4o
        Q7F19KK9yNmbOtlBO+jkWgYfLu52bHUnqVZbjYiosQ==
X-Google-Smtp-Source: ABdhPJwJSNb8W1vk/3K2xi7xKhIaQoHWBzIq30udueCYblsY75ozgEgTP9kUERq+loNLHdEeI4qZI/JWoOzp/xuldN4=
X-Received: by 2002:ac2:544f:: with SMTP id d15mr2712552lfn.465.1620305275123;
 Thu, 06 May 2021 05:47:55 -0700 (PDT)
MIME-Version: 1.0
References: <20210414184604.23473-1-ojeda@kernel.org> <YHiMyE4E1ViDcVPi@hirez.programming.kicks-ass.net>
 <YHj02M3jMSweoP4l@google.com> <CACRpkdat8bny=D2mAsUXcDQvFJ=9jSZSccMMZzH=10dHQ_bXrQ@mail.gmail.com>
 <CANiq72niCj9SfPhfQBMtxF+jth--cXdPQtUo5jhDDJgL6DTXZQ@mail.gmail.com>
 <CACRpkdarfkA1P0ERCXHSA=6VTBn6FXgOxB8haneQtN_4-tyQ0w@mail.gmail.com>
 <CANiq72=VA_cH9yw_LZr3P+n1AsQEEhtY4xdk76jHgimTufHRsQ@mail.gmail.com>
 <CACRpkdYodGnURuaYMBwVAY=8bU0PQoPAvTp34uYksPFmxBsT2A@mail.gmail.com>
 <CANiq72m9V3dVG59jAoR-OM+7QtJauQgrix3DZkw=oCuaaf3H5w@mail.gmail.com>
 <CACRpkdYzqy69G1Fpj4rFQFS+mYmpbQAzTszwCUBuEhe4YW4cuQ@mail.gmail.com>
 <CANiq72k+x13L+sFkjtDLahcvnpEySqk_NGow6FVMZfrV+MmHPw@mail.gmail.com>
 <CACRpkdbNv4O7zs0OpZhWa2fkXkF5arQgDOF9++zKvr+yB5yk_w@mail.gmail.com> <CANiq72njjiovAecf5pJGAuyJB8sEZ_fO92FNDZ7rH6YQSffqrw@mail.gmail.com>
In-Reply-To: <CANiq72njjiovAecf5pJGAuyJB8sEZ_fO92FNDZ7rH6YQSffqrw@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 6 May 2021 14:47:43 +0200
Message-ID: <CACRpkdYpM=38K2WLS-+R2OhWweO8Q9SFndgGC2Py7uBjjxNdAA@mail.gmail.com>
Subject: Re: [PATCH 00/13] [RFC] Rust support
To:     Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Cc:     Wedson Almeida Filho <wedsonaf@google.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Miguel Ojeda <ojeda@kernel.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        rust-for-linux <rust-for-linux@vger.kernel.org>,
        linux-kbuild <linux-kbuild@vger.kernel.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, May 5, 2021 at 4:17 PM Miguel Ojeda
<miguel.ojeda.sandonis@gmail.com> wrote:
> On Wed, May 5, 2021 at 1:34 PM Linus Walleij <linus.walleij@linaro.org> wrote:
> >
> > Right now it seems like those organizations and companies
> > would be some academic institutions who like rust (because they
> > study languages and compilers) and Google. But that is a
>
> Note that there are quite a few major private players already
> involved, not just Google! e.g.

I was referring to entities interested in using Rust for the
Linux kernel. Not just "using rust". And that interest is coming
from Google and a few academic institutions AFAICT.

Yours,
Linus Walleij
