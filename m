Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id DEC0E7D071
	for <lwn-linux-doc@archive.lwn.net>; Wed, 25 Jul 2018 16:56:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729174AbeGYSJJ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 25 Jul 2018 14:09:09 -0400
Received: from mail-ua0-f193.google.com ([209.85.217.193]:35902 "EHLO
        mail-ua0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728644AbeGYSJI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 25 Jul 2018 14:09:08 -0400
Received: by mail-ua0-f193.google.com with SMTP id c12-v6so5121766uan.3;
        Wed, 25 Jul 2018 09:56:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=qrbahrooGYdwtkT7VaZyxsvS5yUXMzjuLcAEmUC8hz0=;
        b=V9kqLEcNexlsJgRjORLQMxugJRIjMBxnCRnHu3WX2XwxC7wF6yHs+NqPFw7Dgn4BI1
         Ok7itKY1sBM5YFJMFCWNHP74JPKIyYibNL5LNwQ4Z4X/aHFITIJa1aM84LvQfLWvBgmT
         aGlFZ82eDzAAyMnO6tlLsX3TkQuF2cMeESJz0JibKHL6g29OKltMX9ag1y/ddkSdhH3l
         miPkvg36ga1QgpuIfou2quJv4DCt6qpD4sBciFJgM7eVHNrSFjGvQgvSXBvQ0wJFjI5v
         8RINpcrylJuMajCMMv6n6t829k8Cxbi+k2AzBPrHrEBlLgAKUF0DV/02nVT7vdVEs72c
         4hmg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=qrbahrooGYdwtkT7VaZyxsvS5yUXMzjuLcAEmUC8hz0=;
        b=LgauvyERB+onv6AtpO+HCQcS6MbvuzcrffH4D1pICzjOMrKg531kM7GMlZSP1cOeny
         poDztUmR3FdMXb+TNJZ+gAWzIGiW/QkVuQgzTpt0EBOuPuM4hXG7Z/QUOhRavJLNhp0k
         N2HmqQUlFYiTTOtFPDUSemUJ5o3JFTc3XLv00o1uOaXvnI+ARR+PI6gZOn25DOO0j8GC
         aojDNcgOfhk8skjmC8jMldPUD3mR4djvCPVE1ouN+kCoDT8ITYTonfEkiU36BrufTPeB
         0eu2eN8n0pdM3rLte1REYsMtPdI8BA3Q9REvz04qd6LXTK1Izvfut1edMJBrvWTIBRtB
         D6Ig==
X-Gm-Message-State: AOUpUlEP9LQqnXbcQPSArngVbrLmQ6HwDstLFXB/vOAhuA9zgOqKp+7s
        8d1GN9EpLNNmxYuA2NhKsYNwFSyn69hePF/lY7k=
X-Google-Smtp-Source: AAOMgpeOkhm/0MNM8rP7kBUwhYsRaP9nf4+/Gy/+It2qnToCY2GZGmE0Sd2+7bF15ElNpNzDMJ9iFD/YTlNmhNqYLnc=
X-Received: by 2002:a9f:2187:: with SMTP id 7-v6mr16295363uac.49.1532537796550;
 Wed, 25 Jul 2018 09:56:36 -0700 (PDT)
MIME-Version: 1.0
Received: by 2002:a67:2149:0:0:0:0:0 with HTTP; Wed, 25 Jul 2018 09:56:35
 -0700 (PDT)
In-Reply-To: <9fdfaf4e-5a20-af81-82ef-0d9e327f9133@synopsys.com>
References: <1532120272-17157-1-git-send-email-soares@synopsys.com>
 <1532120272-17157-2-git-send-email-soares@synopsys.com> <CAHp75VfYYmr7o6xkDbjaad3HxyzZgODzKfSNWdPXjM+YjTMANA@mail.gmail.com>
 <9fdfaf4e-5a20-af81-82ef-0d9e327f9133@synopsys.com>
From:   Andy Shevchenko <andy.shevchenko@gmail.com>
Date:   Wed, 25 Jul 2018 19:56:35 +0300
Message-ID: <CAHp75Vd6Ok6i3wQjT=jd3mtFAC2na1vwUs2cr-xhStQ_OjKjAg@mail.gmail.com>
Subject: Re: [PATCH 1/3] i3c: master: Add driver for Synopsys DesignWare IP
To:     Vitor Soares <Vitor.Soares@synopsys.com>
Cc:     Boris Brezillon <boris.brezillon@bootlin.com>,
        Wolfram Sang <wsa@the-dreams.de>,
        linux-i2c <linux-i2c@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linux Documentation List <linux-doc@vger.kernel.org>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Przemyslaw Sroka <psroka@cadence.com>,
        Arkadiusz Golec <agolec@cadence.com>,
        Alan Douglas <adouglas@cadence.com>,
        Bartosz Folta <bfolta@cadence.com>,
        Damian Kos <dkos@cadence.com>,
        Alicja Jurasik-Urbaniak <alicja@cadence.com>,
        Cyprian Wronka <cwronka@cadence.com>,
        Suresh Punnoose <sureshp@cadence.com>,
        Rafal Ciepiela <rafalc@cadence.com>,
        Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
        Nishanth Menon <nm@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Pawel Moll <pawel.moll@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        "ijc+devicetree" <ijc+devicetree@hellion.org.uk>,
        Kumar Gala <galak@codeaurora.org>,
        devicetree <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Xiang Lin <Xiang.Lin@synaptics.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Sekhar Nori <nsekhar@ti.com>,
        Przemyslaw Gaj <pgaj@cadence.com>,
        Peter Rosin <peda@axentia.se>,
        Joao Pinto <Joao.Pinto@synopsys.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jul 25, 2018 at 11:43 AM, Vitor Soares
<Vitor.Soares@synopsys.com> wrote:
> On Fri, Jul 20, 2018 at 11:57 PM, Vitor soares
> <Vitor.Soares@synopsys.com> wrote:
>

Thanks for answers, my comments below.

> This patch add driver for Synopsys DesignWare IP on top of
> I3C subsystem patchset proposal V6

...

> +#include <linux/reset.h>
> Reset API.
>
> All of them required? Why?

Thanks, got it.

> There is some header files that are already included by others header fil=
es.
> Should I add them too? it there any rule for that?

No need.
Usually we drop some "wired" headers (when we sure that one will
always include the other one, like module.h vs. init.h)

> +               writel(cmd->cmd_hi, master->regs + COMMAND_QUEUE_PORT);
> +               writel(cmd->cmd_lo, master->regs + COMMAND_QUEUE_PORT);
>
> hmm... writesl()?

> Is there any advantage here?

Here maybe not. Just a material to think about. If you can refactor
code to utilize them, good.

> +       info->pid =3D (u64)readl(master->regs + SLV_PID_VALUE);
>
> Why explicit casting?

> info->pid is u64 size.

In C standard there is an integer promotion which allows you not to
use explicit casting in such cases.

> +       u32 r;
> +
> +
> +       core_rate =3D clk_get_rate(master->core_clk);
>
> Too many blank lines in between.
>
>
> For me in that way it's better to filter code parts. Do you think that is
> not readable?

The point is it's useless.
On the other hand, you have a lot of inconsistency with that style.

> +               p =3D (ret >> 6) ^ (ret >> 5) ^ (ret >> 4) ^ (ret >> 3) ^
> +                   (ret >> 2) ^ (ret >> 1) ^ ret ^ 1;
> +               p =3D p & 1;
>
> Is it parity calculus? Do we have something implemented in kernel already=
?
>
> Btw,
> https://urldefense.proofpoint.com/v2/url?u=3Dhttps-3A__graphics.stanford.=
edu_-7Eseander_bithacks.html-23ParityNaive&d=3DDwIBaQ&c=3DDPL6_X_6JkXFx7AXW=
qB0tg&r=3DqVuU64u9x77Y0Kd0PhDK_lpxFgg6PK9PateHwjb_DY0&m=3D5FpGHBbT8tYA6PB4R=
T_9O6PJk3v-wYcy1MV59xoqK4I&s=3DFSJ3EcuoxPtRJWmsk9Yt4s_UH9kxFBam01Xvas2ZFdo&=
e=3D
> offered this
>
> v ^=3D v >> 4;
> v &=3D 0xf;
> v =3D (0x6996 >> v) & 1;
>
>
> I search into the kernel and I didn't find any function for that. In your
> opinion what shoud I use?

If license of the piece above is okay to use in kernel, then
definitely it would be better (even we might create a helper out of
it).

--=20
With Best Regards,
Andy Shevchenko
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
