Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ACA89C433C1
	for <linux-doc@archiver.kernel.org>; Fri, 26 Mar 2021 14:01:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6912761A24
	for <linux-doc@archiver.kernel.org>; Fri, 26 Mar 2021 14:01:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229744AbhCZOAx (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 26 Mar 2021 10:00:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45220 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230188AbhCZOAh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 26 Mar 2021 10:00:37 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21C6AC0613AA
        for <linux-doc@vger.kernel.org>; Fri, 26 Mar 2021 07:00:37 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id e14so8515711ejz.11
        for <linux-doc@vger.kernel.org>; Fri, 26 Mar 2021 07:00:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4E2S5nAzj1ksZmJVDyih97Im5qf9hgz2vlqV5+knSG8=;
        b=LdngGkFFOArwKJ8UJ104P+y+oqKrHDtcVxy/eFtCTkGjXnpY5/2uD3orjojnZK/Vf7
         0/AI7LiO7lUTJCK1SJPyBYybdo0fUsvwNmcYpD2S+zTjfA76kEx5FVJ+FafcqiKuAfEj
         wfsFI/wItAOUL6sRiVTNKQThgZx3E6/MRhJmCg7EgZIoR/nKXamUrCiWTt0wnWq7Ubyc
         81v0fx9JbcRoK8SiL34nhLM+7QfM771UwcCbbEUgqQ5f0Wr5JfGtWbpJYF6bNQLfeJdb
         ydCNNh/ZyKmiAs647P/wn10/7FITOsmEx62R5s5/xDCoXh8QA6xtPIDCqIMjT9s60VMg
         J0Bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4E2S5nAzj1ksZmJVDyih97Im5qf9hgz2vlqV5+knSG8=;
        b=WBqSuFtXnqPTiCdWWG8pNjcJAXltQRY2z3f4q0HlheXFHiaV2gvWjMIO8A1+dXUd0w
         Ymsm82I8U7skQYeDhbmMnRLY1+uHzlH0MglpEtGnAmFu9iG6b1Ig0kIaxNhwJfyWysMM
         dudyEjpWJ39Kh2Q3oLlo55SvYExBNljixaKo9vs+lS/fpHY3egrmcEm76RtZBaJybtsn
         gQXKdgMjmmkhgpd/+SZbcxDB3dIIcSqGiJoweVcHfao550zIgJD1mIerM6sVfqPeBLkb
         fvunzMpeZkh1Tdxp2PCj963g4wG+ma5AF09aAoCwKz1e4NX6kAgQy+x29Vd0qh52KWqO
         cS6w==
X-Gm-Message-State: AOAM531Vu82bmrfj4Nqb6GbbVwieWoPJ/GeUdGFHRFDqOVHELZehhfWK
        aTqpTYgtX+mHPUQhnlo0YhTIKQgHSsn670ntfVMN1A==
X-Google-Smtp-Source: ABdhPJwCIK6bEQ+wusvSDhVviUDIcN+68kuVwxqzCeJsIZn9JiWkLZiMbDYndaUSskLApbRkVzmHH20b/0WPNk42s0o=
X-Received: by 2002:a17:906:398a:: with SMTP id h10mr15832832eje.155.1616767231611;
 Fri, 26 Mar 2021 07:00:31 -0700 (PDT)
MIME-Version: 1.0
References: <20210315091400.13772-1-brgl@bgdev.pl> <CAMRc=MfQnofWQKz9tbnTA_1M8BkN37FcxbJpK4hs0RoRebWWkw@mail.gmail.com>
 <CACRpkdZbGDjAJarJJN91gGfHqXEG3puj=OwsQu=OZ5L+tpWt6A@mail.gmail.com>
In-Reply-To: <CACRpkdZbGDjAJarJJN91gGfHqXEG3puj=OwsQu=OZ5L+tpWt6A@mail.gmail.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Fri, 26 Mar 2021 15:00:20 +0100
Message-ID: <CAMpxmJWdwpPBBcg_QrZzDmvvm6ZUPD1QtPCjhj+yz_=Pk2q3=A@mail.gmail.com>
Subject: Re: [PATCH v5 00/11] gpio: implement the configfs testing module
To:     Linus Walleij <linus.walleij@linaro.org>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Joel Becker <jlbec@evilplan.org>,
        Christoph Hellwig <hch@lst.de>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Shuah Khan <shuah@kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        =?UTF-8?Q?Uwe_Kleine=2DK=C3=B6nig?= 
        <u.kleine-koenig@pengutronix.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Kent Gibson <warthog618@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Mar 25, 2021 at 10:29 AM Linus Walleij <linus.walleij@linaro.org> wrote:
>
> On Mon, Mar 22, 2021 at 3:32 PM Bartosz Golaszewski <brgl@bgdev.pl> wrote:
>
> > FYI The configfs patches from this series have been on the mailing
> > list for months (long before the GPIO part) and have been re-sent
> > several times. You have neither acked or opposed these changes. I
> > don't want to delay the new testing driver anymore so I intend to
> > apply the entire series and take it upstream through the GPIO tree by
> > the end of this week.
>
> I say go ahead.
> Acked-by: Linus Walleij <linus.walleij@linaro.org>
>
> Yours,
> Linus Walleij

Series applied, thanks for the reviews!

Bartosz
