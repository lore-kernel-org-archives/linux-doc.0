Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 269BCC3F6B0
	for <linux-doc@archiver.kernel.org>; Thu, 18 Aug 2022 12:25:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244664AbiHRMZz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 18 Aug 2022 08:25:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50308 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244568AbiHRMZx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 18 Aug 2022 08:25:53 -0400
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 711AF4F696
        for <linux-doc@vger.kernel.org>; Thu, 18 Aug 2022 05:25:52 -0700 (PDT)
Received: by mail-ej1-x62b.google.com with SMTP id w19so2922320ejc.7
        for <linux-doc@vger.kernel.org>; Thu, 18 Aug 2022 05:25:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc;
        bh=x0RShv55l/W/hrmKR8OYqxZUhnouhDYQRtTeXp8f/Qw=;
        b=lZ9fW+MCVefOON5qJ+e2DPSKF5jc/FVhapsMLSbW36/Aoxpf8P3q9JjAR4x9BkyWSW
         GIzQsuap3wNpnXkMbS0c61U4Q/4lvGcjQSRSvQSul/sbVOBgqxVgnLjsM2D0milhZDfK
         WKAfAduMVIfUfT7NaGekeIAmtsyC/bceHS5BtOwWxyVzXFOUyux0GBc/wDUrg2tU5ExF
         TLTP06xtOrnGtd5cWuoaC1nYPN1Z6vrIapM4EVLtlowPno7Y14WaBSv1PPgl7aydcjOq
         HfVY38U0TB+sCZLNzPBX3BFEMqj/p25Cx+p2PDpcEvaGWU2tgJGBExICeiPPRzWtT/P4
         SfAA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc;
        bh=x0RShv55l/W/hrmKR8OYqxZUhnouhDYQRtTeXp8f/Qw=;
        b=ml8+dTNd4fDqO3eYOX3dpqJrZXTnEIDyBbunsUS1v/4AZuJT4UWly0K8aMtk0n/fug
         40xQfFZHlRS92/b5bOynzE6xxvjIvUU9HnLnX8yCC86NgoeSIvOm4wj5ATCHAFyhmkO2
         DvT5NjY0V8SiWCqfSPPyllX0Xr+D7XHoZWI/4WPU5ENrjmLu0x/4hRyIsRCXTRjCT8MA
         hYsfGtCbjkmmk3eTSQxZEsxyTqAGzkh8TuMRUrNAfRl7xj3XtgY2QQPEx/yfao/NTknL
         XJ8gncHCqkuCY/dDh4Jf/EWG2b5zx0ERzKQeHR5gl7hUaLxRbzB7cjDD9VVVsSdeUBUJ
         yv+Q==
X-Gm-Message-State: ACgBeo0UVTqh5nrK1qAxwQv7o/lClzLVX5dr8CRor+SH/zE09JTNmPbF
        pnKMM2gE57MYdBMKAAOCLEFe8mMJnaO14leusIz+Rw==
X-Google-Smtp-Source: AA6agR5CE0C/0zXbtuj+66ciKdo9mpd1YPbVFePdX1QU77PTiyuZXegpfkZn+8D69HVLOBrXNL00Nz+vaZxgIKdqlxE=
X-Received: by 2002:a17:906:58c8:b0:6fe:91d5:18d2 with SMTP id
 e8-20020a17090658c800b006fe91d518d2mr1801717ejs.190.1660825551004; Thu, 18
 Aug 2022 05:25:51 -0700 (PDT)
MIME-Version: 1.0
References: <f31b818cf8d682de61c74b133beffcc8a8202478.1660041358.git.christophe.leroy@csgroup.eu>
 <CACRpkdY53c0qXx24Am1TMivXr-MV+fQ8B0CDjtGi6=+2tn4-7A@mail.gmail.com>
 <CAK8P3a1Vh1Uehuin-u5QrTO5qh+t0aK_hA-QZwqc00Db_+MKcw@mail.gmail.com>
 <CACRpkdbhbwBe=jU5prifXCYUXPqULhst0se3ZRH+sWOh9XeoLQ@mail.gmail.com> <CAK8P3a0j-54_OkXC7x3NSNaHhwJ+9umNgbpsrPxUB4dwewK63A@mail.gmail.com>
In-Reply-To: <CAK8P3a0j-54_OkXC7x3NSNaHhwJ+9umNgbpsrPxUB4dwewK63A@mail.gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 18 Aug 2022 14:25:39 +0200
Message-ID: <CACRpkda0+iy8H0YmyowSDn8RbYgnVbC1k+o5F67inXg4Qb934Q@mail.gmail.com>
Subject: Re: [PATCH] gpio: Allow user to customise maximum number of GPIOs
To:     Arnd Bergmann <arnd@arndb.de>,
        Alexandre Courbot <gnurou@gmail.com>,
        Alexandre Courbot <acourbot@nvidia.com>,
        Bartosz Golaszewski <brgl@bgdev.pl>
Cc:     Christophe Leroy <christophe.leroy@csgroup.eu>,
        Jonathan Corbet <corbet@lwn.net>,
        Russell King <linux@armlinux.org.uk>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        "maintainer:X86 ARCHITECTURE (32-BIT AND 64-BIT)" <x86@kernel.org>,
        "H. Peter Anvin" <hpa@zytor.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "moderated list:ARM PORT" <linux-arm-kernel@lists.infradead.org>,
        "open list:GENERIC INCLUDE/ASM HEADER FILES" 
        <linux-arch@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Aug 18, 2022 at 1:33 PM Arnd Bergmann <arnd@arndb.de> wrote:
> On Thu, Aug 18, 2022 at 1:13 PM Linus Walleij <linus.walleij@linaro.org> wrote:

> > static inline bool gpio_is_valid(int number)
> > {
> >         return number >= 0 && number < ARCH_NR_GPIOS;
> > }
> >
> > ?
> >
> > If using GPIO descriptors, any descriptor != NULL is valid,
> > this one is just used with legacy GPIOs. Maybe we should just
> > delete gpio_is_valid() everywhere and then drop the cap?
>
> I think it makes sense to keep gpio_is_valid() for as long as we
> support the numbers.

Hmmm....

> > I think there may be systems and users that still depend on GPIO base
> > numbers being assigned from ARCH_NR_GPIOS and
> > downwards (userspace GPIO numbers in sysfs will also change...)
> > otherwise we could assign from 0 and up.
>
> Is it possible to find in-kernel users that depend on well-known
> numbers for dynamically assigned gpios? I would argue
> that those are always broken.

Most in-kernel users hard-code the base to something like
0 etc it's only the ones that code -1 into .base that are in
trouble because that will activate dynamic assignment for the
base.

git grep 'base = -1' yields these suspects:

arch/arm/common/sa1111.c:       sachip->gc.base = -1;
arch/arm/common/scoop.c:        devptr->gpio.base = -1;
arch/powerpc/platforms/52xx/mpc52xx_gpt.c:      gpt->gc.base = -1;
arch/powerpc/platforms/83xx/mcu_mpc8349emitx.c: gc->base = -1;

That's all! We could just calculate these to 512-ngpios and
hardcode that instead.

> Even for the sysfs interface, it is questionable to rely on
> specific numbers because at least in an arm multiplatform
> kernel the top number changes based on kernel configuration.

Yeah :/ still these users tend to angrily report any breakage
due to expected (fragile) behaviour.

> > Right now the safest would be:
> > Assign from 512 and downwards until we hit 0 then assign
> > from something high, like U32_MAX and downward.
> >
> > That requires dropping gpio_is_valid() everywhere.
> >
> > If we wanna be bold, just delete gpio_is_valid() and assign
> > bases from 0 and see what happens. But I think that will
> > lead to regressions.
>
> I'm still unsure how removing gpio_is_valid() would help.

If we allow GPIO base all the way to U32_MAX
this function becomes:

static inline bool gpio_is_valid(int number)
{
        return number >= 0 && number < U32_MAX;
}

and we can then just

#define gpio_is_valid true

and in that case it is better to delete the use of this function
altogether since it can not fail.

> What I could imagine as a next step would be to mark all
> consumer drivers and the sysfs interface that use gpio
> numbers as 'depends on GPIO_LEGACY' and then only
> provide the corresponding drivers if that option is set.

Hm I wonder what Bartosz and Alexandre Courbot and thinks
about a GPIO_LEGACY symbol to phase out the global
GPIO numberspace. I kind of like the idea.

I made the sysfs depend on CONFIG_EXPERT to at least make it less
accessible and not provide users with guns to shoot themselves
in the foot.

Yours,
Linus Walleij
