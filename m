Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id ABB4E7D90C
	for <lwn-linux-doc@archive.lwn.net>; Wed,  3 Jul 2019 00:45:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727116AbfGCApx (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 2 Jul 2019 20:45:53 -0400
Received: from mail-lj1-f195.google.com ([209.85.208.195]:46275 "EHLO
        mail-lj1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726736AbfGCApx (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 2 Jul 2019 20:45:53 -0400
Received: by mail-lj1-f195.google.com with SMTP id v24so434638ljg.13
        for <linux-doc@vger.kernel.org>; Tue, 02 Jul 2019 17:45:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=uy9P4Bv7MoU15f1hxa9HUk41ddeWB4vxhHhX7nu5AF8=;
        b=chfL2Y+vcu0HLio56W5yCpYcO12fzccTTuvBbkGhkNe/aF5ZgcfKOE24xS40HsFMlc
         Ut8Bz0uCuff4zpfBt474goph+OPSk+NhNQVgLSimuL3/Ah0v11JGh/8rGaKti0yddSiM
         q/0fOfoab+9/DUCSuDVGXRkPBEodmSnVOEGRZxSGePAp5QYIi/4446bzXKyWwa+Z9QVU
         JorSbzfYLEjhFTeRYS7/jv30gSLerU7/hW/VDodF7UL5D3eT6ZP0fWQXg/OaUFUv2/fn
         GcIo0P7LqaWgUcqGlOiipgnrK233+5QeGPJ94GG6q7nHRhDMqNxm2bzPhj2Qys7AxdxL
         UO4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=uy9P4Bv7MoU15f1hxa9HUk41ddeWB4vxhHhX7nu5AF8=;
        b=Q6KT8CKag5HIWwgWdU/H9YOyoNf+pgCAlFGrfTgSp0vYIcaT8uuki/2g7nhyrDJuYQ
         Ecq5xS0x16Jry02UpZUSooCOkmdzwGKuaJSJVWD+JCyUAqxJ4KGgfGq7uRsxF+gXj8Tq
         V2WAsQUOUXKjgzSFtEMVuEpIY4YqRmHZNfIVLpN9ujpw6vyqGQA1axIrQ1lq3zGHYRHd
         ntEyULZpmj0K5QYM4NRig61qeERuxW1pj6z329auGkK58aoOaTN2h507I03QZzrZjL2g
         NfxbwigvZDy2CULzdAI8Cci6ynSXdNGC0W+nEWxrOFkN9u9PRBO3WLuq1eAhcRvgkcKd
         GdtA==
X-Gm-Message-State: APjAAAVXDtGzzlD/xs2zdb8ElgZJEqe5mHccYmZQbaZOeb+G6zCedXYf
        1jfo0/TFZvIXOnMyPUCT+j7z7uDTw46AYBFYeT41SQ==
X-Google-Smtp-Source: APXvYqybYGFXeKm3HudJJDld+RvqFOCnrMTby4Ii2vx9EH9qEyc7WekPspTFOFMLIfLcDmLdtXWyHbCAfNQSt4Z3QxE=
X-Received: by 2002:a2e:8195:: with SMTP id e21mr167967ljg.62.1562104610089;
 Tue, 02 Jul 2019 14:56:50 -0700 (PDT)
MIME-Version: 1.0
References: <20190617221134.9930-1-f.fainelli@gmail.com> <20190617221134.9930-3-f.fainelli@gmail.com>
In-Reply-To: <20190617221134.9930-3-f.fainelli@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Tue, 2 Jul 2019 23:56:38 +0200
Message-ID: <CACRpkdb3P6oQTK9FGUkMj4kax8us3rKH6c36pX=HD1_wMqcoJQ@mail.gmail.com>
Subject: Re: [PATCH v6 2/6] ARM: Disable instrumentation for some code
To:     Florian Fainelli <f.fainelli@gmail.com>
Cc:     Linux ARM <linux-arm-kernel@lists.infradead.org>,
        bcm-kernel-feedback-list <bcm-kernel-feedback-list@broadcom.com>,
        Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Abbott Liu <liuwenliang@huawei.com>,
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

On Tue, Jun 18, 2019 at 12:11 AM Florian Fainelli <f.fainelli@gmail.com> wrote:

> @@ -236,7 +236,8 @@ static int unwind_pop_register(struct unwind_ctrl_block *ctrl,
>                 if (*vsp >= (unsigned long *)ctrl->sp_high)
>                         return -URC_FAILURE;
>
> -       ctrl->vrs[reg] = *(*vsp)++;
> +       ctrl->vrs[reg] = READ_ONCE_NOCHECK(*(*vsp));
> +       (*vsp)++;

I would probably even put in a comment here so it is clear why we
do this. Passers-by may not know that READ_ONCE_NOCHECK() is
even related to KASan.

Other than that,
Reviewed-by: Linus Walleij <linus.walleij@linaro.org>

Yours,
Linus Walleij
