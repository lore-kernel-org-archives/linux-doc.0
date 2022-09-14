Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31D7DC6FA82
	for <linux-doc@archiver.kernel.org>; Wed, 14 Sep 2022 12:39:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229791AbiINMjK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 14 Sep 2022 08:39:10 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59396 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229691AbiINMjI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 14 Sep 2022 08:39:08 -0400
Received: from mail-ej1-x630.google.com (mail-ej1-x630.google.com [IPv6:2a00:1450:4864:20::630])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CC67C726A3
        for <linux-doc@vger.kernel.org>; Wed, 14 Sep 2022 05:39:06 -0700 (PDT)
Received: by mail-ej1-x630.google.com with SMTP id bj12so34309664ejb.13
        for <linux-doc@vger.kernel.org>; Wed, 14 Sep 2022 05:39:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date;
        bh=CcAyCR0VCRUp+6tOSNQsE8bUd+48rUINm1qNrq+p+NU=;
        b=u8C2eu5Kff39B7/BQbi85Yn97D2Js8+Uj2L8lMqj3gLm2IPKL0CO6U4oXPAta2hYKa
         h8exa5zaYvkKglut9RZFerh2tlNk5CNBi9IcOCntqYyhaSzD5TfLqwBHemvK50pC1f8/
         42vxRsArd6LDU1jJrzAsRquTiRw56VQvTyTsSF/C4loiqoUd5PmdqhE7AvwSFZMJmdj0
         Zzk3xyX1opiErRSaC+vyShXHbhPGB2eQ7S6/97am0teFtO/IF8tsRBQhetdTCDKmvROI
         WpuoS0ZGlus8tUfmK3LsHAnzSW3SpiQsAOVOY7lx5yku2xsoU5jg3IyEvEHxvwFJGEQq
         kIfw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date;
        bh=CcAyCR0VCRUp+6tOSNQsE8bUd+48rUINm1qNrq+p+NU=;
        b=XBLfDsjHg//E7Z/pnA59V3ynHAXVaOPUf4xq3JgMG1he0Rl4fBnQCxz+Yt91HTXNmh
         OVS5mzx5BmmN+uWnBZSjupXFznsoMlbacBbVsaG98AkzkXb/kjoO5wYsCBP99YvsXwyH
         Kzhke4aLZ8zpF8uBvV3E5Mn5eDWk9kMSJwKdGoalDwGi6ImiLp5JuVBSil8wsKVmll6n
         zWvQE9PjJsbqX7isuZrmMsXaXLSLyJqj5CNx/cKctojKgCl1Nnre7bteCTdp6eg1HQcu
         D0ZmUyiMS0zaG0bE7+XSSqYrJsxPqZ0snsHCggbkU3JZ1RoWmZ5POgquvs6PY7mIpCu1
         /JmA==
X-Gm-Message-State: ACgBeo1zxr3NmKLePbuoEGE1vcpROr8ZAFG74CuPJNMT82boAtEIQ4TZ
        FkGA2S56PxoJFl/QtDXR7nD/vE2pSeKpgzN72QIujg==
X-Google-Smtp-Source: AA6agR6mTKBam3AwOTBLWTj4M1R1q9x4Rl1XcKuvzX4cVwomH7XNQs57wnfL1TVaGPa3BWPYSZ9VpNvi01WkhQJk464=
X-Received: by 2002:a17:906:5d04:b0:77f:ca9f:33d1 with SMTP id
 g4-20020a1709065d0400b0077fca9f33d1mr6785503ejt.526.1663159145227; Wed, 14
 Sep 2022 05:39:05 -0700 (PDT)
MIME-Version: 1.0
References: <cover.1662116601.git.christophe.leroy@csgroup.eu>
 <CAMRc=MehcpT84-ucLbYmdVTAjT86bNb9NEfV6npCmPZHqbsArw@mail.gmail.com> <b348a306-3043-4ccc-9067-81759ab29143@www.fastmail.com>
In-Reply-To: <b348a306-3043-4ccc-9067-81759ab29143@www.fastmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Wed, 14 Sep 2022 14:38:53 +0200
Message-ID: <CACRpkdbazHcUassRMqZ2oHmama3nWEZ3U3bB-y-3dmo3jgFPWg@mail.gmail.com>
Subject: Re: [PATCH v2 0/9] gpio: Get rid of ARCH_NR_GPIOS (v2)
To:     Arnd Bergmann <arnd@arndb.de>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
Cc:     Bartosz Golaszewski <brgl@bgdev.pl>,
        Christophe Leroy <christophe.leroy@csgroup.eu>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Keerthy <j-keerthy@ti.com>, Russell King <linux@armlinux.org.uk>,
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
        Linux-Arch <linux-arch@vger.kernel.org>,
        linux-doc <linux-doc@vger.kernel.org>, x86@kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Sep 7, 2022 at 12:15 PM Arnd Bergmann <arnd@arndb.de> wrote:

> >>  drivers/gpio/gpio-sta2x11.c              | 411 -----------------------
(...)
> sta2x11 is an x86 driver, so not my area, but I think it would be
> best to kill off the entire platform rather than just its gpio
> driver, since everything needs to work together and it's clearly
> not functional at the moment.
>
> $ git grep -l STA2X11
> Documentation/admin-guide/media/pci-cardlist.rst
> arch/x86/Kconfig
> arch/x86/include/asm/sta2x11.h
> arch/x86/pci/Makefile
> arch/x86/pci/sta2x11-fixup.c
> drivers/ata/ahci.c
> drivers/gpio/Kconfig
> drivers/gpio/Makefile
> drivers/gpio/gpio-sta2x11.c
> drivers/i2c/busses/Kconfig
> drivers/media/pci/Makefile
> drivers/media/pci/sta2x11/Kconfig
> drivers/media/pci/sta2x11/Makefile
> drivers/media/pci/sta2x11/sta2x11_vip.c
> drivers/media/pci/sta2x11/sta2x11_vip.h
> drivers/mfd/Kconfig
> drivers/mfd/Makefile
> drivers/mfd/sta2x11-mfd.c
> include/linux/mfd/sta2x11-mfd.h
>
> Removing the other sta2x11 bits (mfd, media, x86) should
> probably be done through the respective tree, but it would
> be good not to forget those.

Andy is pretty much default x86 platform device maintainer, maybe
he can ACK or brief us on what he knows about the status of
STA2x11?

Yours,
Linus Walleij
