Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1F47DC433DB
	for <linux-doc@archiver.kernel.org>; Tue, 16 Mar 2021 12:30:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E77C265077
	for <linux-doc@archiver.kernel.org>; Tue, 16 Mar 2021 12:30:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231704AbhCPMaK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 16 Mar 2021 08:30:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53850 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231535AbhCPM3l (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 16 Mar 2021 08:29:41 -0400
Received: from mail-ed1-x529.google.com (mail-ed1-x529.google.com [IPv6:2a00:1450:4864:20::529])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DE9EBC061756
        for <linux-doc@vger.kernel.org>; Tue, 16 Mar 2021 05:29:39 -0700 (PDT)
Received: by mail-ed1-x529.google.com with SMTP id w18so21284415edc.0
        for <linux-doc@vger.kernel.org>; Tue, 16 Mar 2021 05:29:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=frS6cCLPOhoy6WT0w0VG2Zdhbvi3Fgut+iQRwiWciZM=;
        b=YbgzcrArNyGLlL04bYdE/q4fB1g3O2g7a5l713GEu5fNEryQecu/1Z3UxakkDw8ojo
         ZVzeZA05ZZ6ZEqaEnGW3Q1EEyENRD/4B8laSjyqDLfiTJMTh2ZsTljIJt4zbb535pV/l
         dXJ+j+FWboYJoDHWX2gJZu5BXn9qmnyzzViwQ2vSClrpOZ5Jzj0yDxhyXFyd+VWI9198
         gdZn+d4RVXwYT3MeiYteW3OfwFZMhU/U+Q6gpBVeON/EchAg97u7QfUkoe872zC2af3o
         4a4aK62qhCGgYfOTpKviLHonayFBEIellXQ/T8AWs+rD0qtxkRG9LQWax41QP0RQIUe5
         Sm1Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=frS6cCLPOhoy6WT0w0VG2Zdhbvi3Fgut+iQRwiWciZM=;
        b=jwK39brBZHS3x91gRDrzPdFeu+amxlMKhVIDVcCZNhfSd9JPl8cTsN+DXe56IpbOWl
         +2Avy+JOzjSqcZFbxk3f0NFLtQw5ym3lCndiB9TLbYcwdLCHqkaJI6zI4ZzpEi9VdGim
         vGblYIoyDeoQ3EP0jHjTzqHuVu9LPuvGM56i/fmjLQt08Sl5JQRCYmBr/kO5PlsUJnkY
         3mxICvtGPEFkcqmtqLiu14zPKjPZGi9tN+G/btOuwY5hPlJSRDKcOkb8wDwcdEo3/VW+
         QFH8JlkJMhx5egFiRtdak4TOH1sv7m0wIiCAxyyHLOKAy2iOrMpQ4+6oxmTS6EEHOgOr
         VGhg==
X-Gm-Message-State: AOAM532+7IMYcWK/Lvp6El23odstQe1akJUAxruHY6BSNmsLLFW1JEOf
        BonZShUHObJr+A0OQpWodFegCmFyd4t05MIi61YeNQ==
X-Google-Smtp-Source: ABdhPJx2Ejcwpp4xgO5liW2B5NUm/mY2puj2eqrCQhl327oaZ05ACdKJVa5h+tRxPhEvirjf9wez1kpAGiQdHt4b01Y=
X-Received: by 2002:a05:6402:b31:: with SMTP id bo17mr35716883edb.113.1615897778669;
 Tue, 16 Mar 2021 05:29:38 -0700 (PDT)
MIME-Version: 1.0
References: <20210315165940.90055-1-andriy.shevchenko@linux.intel.com>
In-Reply-To: <20210315165940.90055-1-andriy.shevchenko@linux.intel.com>
From:   Bartosz Golaszewski <bgolaszewski@baylibre.com>
Date:   Tue, 16 Mar 2021 13:29:28 +0100
Message-ID: <CAMpxmJVZVD9mRGSkpVKV2jJdWUVOKtQfquuHo7toi2TWqf+ddQ@mail.gmail.com>
Subject: Re: [PATCH v1 1/1] gpio: mockup: Adjust documentation to the code
To:     Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     linux-gpio <linux-gpio@vger.kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Jonathan Corbet <corbet@lwn.net>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Mar 15, 2021 at 5:59 PM Andy Shevchenko
<andriy.shevchenko@linux.intel.com> wrote:
>
> First of all one of the parameter missed 'mockup' in its name,
> Second, the semantics of the integer pairs depends on the sign
> of the base (the first value in the pair).
>
> Update documentation to reflect the real code behaviour.
>
> Fixes: 2fd1abe99e5f ("Documentation: gpio: add documentation for gpio-mockup")
> Signed-off-by: Andy Shevchenko <andriy.shevchenko@linux.intel.com>
> ---
>  Documentation/admin-guide/gpio/gpio-mockup.rst | 11 ++++++-----
>  1 file changed, 6 insertions(+), 5 deletions(-)
>
> diff --git a/Documentation/admin-guide/gpio/gpio-mockup.rst b/Documentation/admin-guide/gpio/gpio-mockup.rst
> index 9fa1618b3adc..493071da1738 100644
> --- a/Documentation/admin-guide/gpio/gpio-mockup.rst
> +++ b/Documentation/admin-guide/gpio/gpio-mockup.rst
> @@ -17,17 +17,18 @@ module.
>      gpio_mockup_ranges
>
>          This parameter takes an argument in the form of an array of integer
> -        pairs. Each pair defines the base GPIO number (if any) and the number
> -        of lines exposed by the chip. If the base GPIO is -1, the gpiolib
> -        will assign it automatically.
> +        pairs. Each pair defines the base GPIO number (non-negative integer)
> +        and the first number after the last of this chip. If the base GPIO
> +        is -1, the gpiolib will assign it automatically. while the following
> +        parameter is the number of lines exposed by the chip.
>
> -        Example: gpio_mockup_ranges=-1,8,-1,16,405,4
> +        Example: gpio_mockup_ranges=-1,8,-1,16,405,409
>
>          The line above creates three chips. The first one will expose 8 lines,
>          the second 16 and the third 4. The base GPIO for the third chip is set
>          to 405 while for two first chips it will be assigned automatically.
>
> -    gpio_named_lines
> +    gpio_mockup_named_lines
>
>          This parameter doesn't take any arguments. It lets the driver know that
>          GPIO lines exposed by it should be named.
> --
> 2.30.2
>

Applied, thanks!

Bartosz
