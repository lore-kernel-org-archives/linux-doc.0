Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=DATE_IN_PAST_03_06,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=unavailable autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3488D7D2F0
	for <lwn-linux-doc@archive.lwn.net>; Wed,  3 Jul 2019 01:30:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727182AbfGCBaH (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 2 Jul 2019 21:30:07 -0400
Received: from mail-lf1-f65.google.com ([209.85.167.65]:41373 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727117AbfGCBaG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Jul 2019 21:30:06 -0400
Received: by mail-lf1-f65.google.com with SMTP id 62so475390lfa.8
        for <linux-doc@vger.kernel.org>; Tue, 02 Jul 2019 18:30:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=BWuzzOxwUVGbMCvFD/kQRaZgbqg2U0ttqAGoU0tIxDc=;
        b=WU9xE1VaEDXdGOfDOaQ8eCNlTBcxHe1uPjWOXfL0akhUDkfR9pYxvy2vkEDfni+c8h
         WMVK/5ptG9BAQJtthbU9xhXp41aX/dRI7O6DGRbzSic+KQYV4r79fr3F33IPwBk4A9/w
         GB0kyYoceOYaI2Zwrbm6QbIM8AP0naUmdNCuQ2tAPmooOIqjVKYIIcMIkgONM7r947bm
         Rcb/3dBlykiu3KSgumMs5axcfx87QLCZKcPVy2M8OzJauDqJh5Z1Bo7FTS75GRY0iu0+
         IdLBkAJI8wJkTgpnoj96Ri0vBe8IfwgD2+EBl9ikgM/r7w39QRdydkoW0ChmAqm5YMzc
         LsVA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=BWuzzOxwUVGbMCvFD/kQRaZgbqg2U0ttqAGoU0tIxDc=;
        b=PH5V0oFdx9nQZ7CBX+SyY58nlU4uKPckB6huS9QyWYXjrYRnlcwbd5X+2A/n/OGaQe
         s0BoPBEMD0/yKEbgDsHC/xjqeb7XYxTutJskj3ygs2NwT8QDRP1UCpKabmt3EXYNqUkM
         Ntfx05CBf9gPs98Ues1GKjb9G5dkO2vozT5WjGVvYNTE8hgxMXJNN4/8Yu/TgmUd9bMx
         YCmqMijOGxd6CJucSbxe016USLawoNSs58RtFv6oyHSUkrCNzDsNZbxgp2RfJs5B6WVI
         BYy7wnqoygeJ0ilScnTrcA8R6BrxFE3trxJkEpJ7/EEx7xyXTNrOz2/xyQuOuTRNBz5l
         zm4w==
X-Gm-Message-State: APjAAAW2p9sCwS3RqJ6/Va9+9H5j+OgkR/cIqfR4iVAW8gLTKH/5da/9
        bU89gfxbptY8DUt0qGwBSvyt1RBzpdQuUsWO6YVvnf9twfc=
X-Google-Smtp-Source: APXvYqxPy3MzRImB1p5uGBTXdcSHdB32SVAS4jpsrlLbMd+boV/5IuiNLeQxCDIw30/585vq93owljYh5YviaC4jL+c=
X-Received: by 2002:a19:dc0d:: with SMTP id t13mr1324771lfg.152.1562101441838;
 Tue, 02 Jul 2019 14:04:01 -0700 (PDT)
MIME-Version: 1.0
References: <20190617221134.9930-1-f.fainelli@gmail.com> <20190617221134.9930-2-f.fainelli@gmail.com>
In-Reply-To: <20190617221134.9930-2-f.fainelli@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 2 Jul 2019 23:03:50 +0200
Message-ID: <CACRpkdZGqiiax2m5L1y3=Enw0Q5cLc-idAQNae34uenf-drHDw@mail.gmail.com>
Subject: Re: [PATCH v6 1/6] ARM: Add TTBR operator for kasan_init
To:     Florian Fainelli <f.fainelli@gmail.com>,
        Russell King <rmk+kernel@armlinux.org.uk>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Abbott Liu <liuwenliang@huawei.com>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Alexander Potapenko <glider@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Russell King <linux@armlinux.org.uk>, christoffer.dall@arm.com,
        Marc Zyngier <marc.zyngier@arm.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Nicolas Pitre <nico@fluxnic.net>,
        Vladimir Murzin <vladimir.murzin@arm.com>,
        Kees Cook <keescook@chromium.org>, jinb.park7@gmail.com,
        Alexandre Belloni <alexandre.belloni@bootlin.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Philippe Ombredanne <pombredanne@nexb.com>,
        Rob Landley <rob@landley.net>,
        Greg KH <gregkh@linuxfoundation.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Thomas Gleixner <tglx@linutronix.de>, thgarnie@google.com,
        David Howells <dhowells@redhat.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Andre Przywara <andre.przywara@arm.com>,
        julien.thierry@arm.com, drjones@redhat.com, philip@cog.systems,
        mhocko@suse.com, kirill.shutemov@linux.intel.com,
        kasan-dev@googlegroups.com,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        kvmarm@lists.cs.columbia.edu,
        Andrey Ryabinin <ryabinin.a.a@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Florian!

thanks for your patch!

On Tue, Jun 18, 2019 at 12:11 AM Florian Fainelli <f.fainelli@gmail.com> wrote:

> From: Abbott Liu <liuwenliang@huawei.com>
>
> The purpose of this patch is to provide set_ttbr0/get_ttbr0 to
> kasan_init function. The definitions of cp15 registers should be in
> arch/arm/include/asm/cp15.h rather than arch/arm/include/asm/kvm_hyp.h,
> so move them.
>
> Cc: Andrey Ryabinin <aryabinin@virtuozzo.com>
> Reported-by: Marc Zyngier <marc.zyngier@arm.com>
> Signed-off-by: Abbott Liu <liuwenliang@huawei.com>
> Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>

> +#include <linux/stringify.h>

What is this for? I think it can be dropped.

This stuff adding a whole bunch of accessors:

> +static inline void set_par(u64 val)
> +{
> +       if (IS_ENABLED(CONFIG_ARM_LPAE))
> +               write_sysreg(val, PAR_64);
> +       else
> +               write_sysreg(val, PAR_32);
> +}

Can we put that in a separate patch since it is not
adding any users, so this is a pure refactoring patch for
the current code?

Yours,
Linus Walleij
