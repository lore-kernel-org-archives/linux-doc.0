Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F8DCECAAD3
	for <linux-doc@archiver.kernel.org>; Wed,  7 Sep 2022 09:59:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230301AbiIGJ7f (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 7 Sep 2022 05:59:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56936 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230336AbiIGJ6z (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 7 Sep 2022 05:58:55 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7C10B7766
        for <linux-doc@vger.kernel.org>; Wed,  7 Sep 2022 02:58:40 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id fy31so29155579ejc.6
        for <linux-doc@vger.kernel.org>; Wed, 07 Sep 2022 02:58:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bgdev-pl.20210112.gappssmtp.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=heSFzetbXWgbtnsASv1LZ6qPan1dJOs+6DCCGWIHMBc=;
        b=vHf0XP6Ze2kKCdhKxtVAgOHIr2JsfMKXNXZBFepV2YBWzCPoSXlPG+D1rz3Zg9Rch0
         ypMUtQMR9yyK7gQjXW2ZyJ2cnlHlg71InbxQR7ofH3deJAocrr+yORgDxvorjARevA1l
         tJHxHMkBbBa+CnVkksjAvgq0kmgk+59QTtXcjKW9zZhxRIFlhHlqchKmGRNkvoXe2Y85
         F23ax+ngd/IlSAB6HD0FpqhIOJKU7jZkyGDdKtaAWVwaraHMfa6YxvtZnPZFhff7znmT
         4e4T7YcqtsBKyZOiDnLNOkbTrFzdJQLHpf4Mu3ZhQsTPjK/8w9zsT/qHgDHipv7pBptk
         v+yw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=heSFzetbXWgbtnsASv1LZ6qPan1dJOs+6DCCGWIHMBc=;
        b=edCna3x4rZT5PErqyWNknHL8SmqzuWQql9c/yftzn4Y/saKn0Q3J2lp7LEOUwkm7SB
         dmHRPrpxQYyBOnX2jxE9E7Sv+LAk/teDagSfdBRoR1JWkcZkbr3n61AlVPQyCLQNJqYu
         ZlnuMLJF7D42kxo3kzdZHXOJA5wYG06qk0wKTJVDiGRlMfmxfrO0INUK3cltWcKpxnIz
         +x0lamDhNYFzDZpdtLHzM6nOJcLDb13PSopz9BpRnvq3xXY2QDEgMrrrBV4DsYtNQ3R7
         BqxJAZQy94ZsQ9x+nWJTIMIyvCGQdg79MWmOx4q4SI+eceHy/T6CKMJXJDKPLfuntybE
         2ieQ==
X-Gm-Message-State: ACgBeo1X3i3hJXtNlikW4yCjt+K7807cMiyFDONkZsm2lovUWkzWs9y/
        FaXQ9HL8rRLod4ju+BpnCg+YQokpR/MAhez4uHx74Q==
X-Google-Smtp-Source: AA6agR47HMjnxQAohy22Di9zQNJim5dtH8VkOKRmZAWyo3gky2iLulW9tTE1/ctNbKsixVbNqreBKmb966LjP7FAmDg=
X-Received: by 2002:a17:906:4fd5:b0:74f:2bad:f9d with SMTP id
 i21-20020a1709064fd500b0074f2bad0f9dmr1687207ejw.697.1662544719244; Wed, 07
 Sep 2022 02:58:39 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1662116601.git.christophe.leroy@csgroup.eu>
In-Reply-To: <cover.1662116601.git.christophe.leroy@csgroup.eu>
From:   Bartosz Golaszewski <brgl@bgdev.pl>
Date:   Wed, 7 Sep 2022 11:58:28 +0200
Message-ID: <CAMRc=MehcpT84-ucLbYmdVTAjT86bNb9NEfV6npCmPZHqbsArw@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] gpio: Get rid of ARCH_NR_GPIOS (v2)
To:     Christophe Leroy <christophe.leroy@csgroup.eu>
Cc:     Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Keerthy <j-keerthy@ti.com>, Russell King <linux@armlinux.org.uk>,
        Arnd Bergmann <arnd@arndb.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "H. Peter Anvin" <hpa@zytor.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>,
        Davide Ciminaghi <ciminaghi@gnudd.com>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:GENERIC INCLUDE/ASM HEADER FILES" 
        <linux-arch@vger.kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Sep 2, 2022 at 2:42 PM Christophe Leroy
<christophe.leroy@csgroup.eu> wrote:
>
> Since commit 14e85c0e69d5 ("gpio: remove gpio_descs global array")
> there is no limitation on the number of GPIOs that can be allocated
> in the system since the allocation is fully dynamic.
>
> ARCH_NR_GPIOS is today only used in order to provide downwards
> gpiobase allocation from that value, while static allocation is
> performed upwards from 0. However that has the disadvantage of
> limiting the number of GPIOs that can be registered in the system.
>
> To overcome this limitation without requiring each and every
> platform to provide its 'best-guess' maximum number, rework the
> allocation to allocate from 512 upwards, allowing approx 2 millions
> of GPIOs.
>
> In the meantime, add a warning for drivers how are still doing
> static allocation, so that in the future the static allocation gets
> removed completely and dynamic allocation can start at base 0.
>
> Main changes in v2:
> - Adding a patch to remove sta2x11 GPIO driver instead of modifying it
> - Moving the base of dynamic allocation from 256 to 512 because there
> are drivers allocating gpios as high as 400.
>
> Christophe Leroy (8):
>   gpio: aggregator: Stop using ARCH_NR_GPIOS
>   gpio: davinci: Stop using ARCH_NR_GPIOS
>   gpiolib: Warn on drivers still using static gpiobase allocation
>   gpiolib: Get rid of ARCH_NR_GPIOS
>   Documentation: gpio: Remove text about ARCH_NR_GPIOS
>   x86: Remove CONFIG_ARCH_NR_GPIO
>   arm: Remove CONFIG_ARCH_NR_GPIO
>   arm64: Remove CONFIG_ARCH_NR_GPIO
>
> Davide Ciminaghi (1):
>   gpio: Remove sta2x11 GPIO driver
>
>  Documentation/driver-api/gpio/legacy.rst |   5 -
>  arch/arm/Kconfig                         |  21 --
>  arch/arm/include/asm/gpio.h              |   1 -
>  arch/arm64/Kconfig                       |  12 -
>  arch/x86/Kconfig                         |   5 -
>  drivers/gpio/Kconfig                     |   8 -
>  drivers/gpio/Makefile                    |   1 -
>  drivers/gpio/gpio-aggregator.c           |   7 +-
>  drivers/gpio/gpio-davinci.c              |   3 -
>  drivers/gpio/gpio-sta2x11.c              | 411 -----------------------
>  drivers/gpio/gpiolib.c                   |  13 +-
>  include/asm-generic/gpio.h               |  55 ++-
>  12 files changed, 33 insertions(+), 509 deletions(-)
>  delete mode 100644 drivers/gpio/gpio-sta2x11.c
>
> --
> 2.37.1
>

I'd like to take it through the GPIO tree if we can get acks for ARM and x86?

Bart
