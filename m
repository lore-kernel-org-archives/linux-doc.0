Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A11CD7D2EE
	for <lwn-linux-doc@archive.lwn.net>; Fri, 31 Aug 2018 09:14:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727795AbeHaNVQ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 31 Aug 2018 09:21:16 -0400
Received: from mail-it0-f67.google.com ([209.85.214.67]:34424 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727655AbeHaNVP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 31 Aug 2018 09:21:15 -0400
Received: by mail-it0-f67.google.com with SMTP id x79-v6so4452394ita.1
        for <linux-doc@vger.kernel.org>; Fri, 31 Aug 2018 02:14:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=oqc3wX8JBE3xxl60w0r8Z7EC6M3lE33h9kTqazogcZI=;
        b=E38PWl8lGr9I+qJHEzz7ASNkjoDKOoUMmE2LHPMSJrtH61+QCkfCiI6PJQfpJpz3i+
         QyRCvgVl9TzhRegOqRCaKhA5EPhVuBfbvDi4CKqf3ZODat2M+PmvbCL3mB/fnVWT7HxH
         XsQDzcxlsFg4/xM38iv08w2C6LUzWnw1LoFo4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=oqc3wX8JBE3xxl60w0r8Z7EC6M3lE33h9kTqazogcZI=;
        b=rgNi4hwKxr68+zYy2BU80MAHILh96hjNBimUDXHKkhDeHmirYRIXsERmh+ZTIUWOIR
         gxGTDxam33gFUJwDYAkuQEvDUPYvl8uPIzA3pfPM6kpq6GVXXEgDb+OMMPjByopQxmt8
         gjSg5uyTyaQ8X2QACZPijBPRUoq7BCZuhwoHSsCs87BDesBl9AfGLgs7CW/zadE6rBu9
         FALxiS79hbhN4LORTcrYs1IYixX0FtljLFp3Z1C4q5riBLfh79UgwYNo9URlYjM8VRmn
         1A4xcaBcdFxpX9BnaCPhdTye09Z84jEbPq9IN0Bd+C0jJ+W27xzRiGTCdE/nwbodyKpG
         vuIQ==
X-Gm-Message-State: APzg51CHpUquB7gc6ntvDf9wVs8byivy8bkIqFtf3MGgT6ch7snWNh6P
        ReaBDNeQ9LQ8o4A7AEr744VgumwgpwUhi1B/qmnWJQ==
X-Google-Smtp-Source: ANB0VdZdIoBJrJINrn4lloNMBwDfGpoDCLWysa07mlmrthaJTunEepVwcZUbM9QORD8bqxuelhSd+DXI30GjEFzhJus=
X-Received: by 2002:a02:2505:: with SMTP id g5-v6mr11825626jag.112.1535706883400;
 Fri, 31 Aug 2018 02:14:43 -0700 (PDT)
MIME-Version: 1.0
References: <20180820234341.5271-1-jmkrzyszt@gmail.com> <20180829204900.19390-1-jmkrzyszt@gmail.com>
 <20180829204900.19390-2-jmkrzyszt@gmail.com>
In-Reply-To: <20180829204900.19390-2-jmkrzyszt@gmail.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Fri, 31 Aug 2018 11:14:31 +0200
Message-ID: <CACRpkdYmd=Efh4-YsTzRAhtKLWHuhJ-9D6iVagkg=+zxU=KLHA@mail.gmail.com>
Subject: Re: [PATCH v5 1/4] gpiolib: Pass bitmaps, not integer arrays, to
 get/set array
To:     Janusz Krzysztofik <jmkrzyszt@gmail.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Miguel Ojeda Sandonis <miguel.ojeda.sandonis@gmail.com>,
        Peter Korsgaard <peter.korsgaard@barco.com>,
        Peter Rosin <peda@axentia.se>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Andrew Lunn <andrew@lunn.ch>,
        Florian Fainelli <f.fainelli@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Dominik Brodowski <linux@dominikbrodowski.net>,
        Greg KH <gregkh@linuxfoundation.org>, kishon@ti.com,
        Lars-Peter Clausen <lars@metafoo.de>,
        Michael Hennerich <Michael.Hennerich@analog.com>,
        Jonathan Cameron <jic23@kernel.org>,
        Hartmut Knaack <knaack.h@gmx.de>,
        Peter Meerwald <pmeerw@pmeerw.net>,
        Jiri Slaby <jslaby@suse.com>, Willy Tarreau <w@1wt.eu>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-doc@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-mmc <linux-mmc@vger.kernel.org>,
        netdev <netdev@vger.kernel.org>, linux-iio@vger.kernel.org,
        devel@driverdev.osuosl.org, linux-serial@vger.kernel.org,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Aug 29, 2018 at 10:48 PM Janusz Krzysztofik <jmkrzyszt@gmail.com> wrote:

So it's no secret that I strongly fancy this patch set.

What would be great at this point is to have some people test
that the drivers still work as expected, even better if they can do
some benchmarking.

> -               values[PIN_DATA0 + i] = !!(val & BIT(i));
> -       values[PIN_CTRL_RS] = rs;
> +       value_bitmap[0] = val;
> +       __assign_bit(PIN_CTRL_RS, value_bitmap, rs);
>         n = 9;
>         if (hd->pins[PIN_CTRL_RW]) {
> -               values[PIN_CTRL_RW] = 0;
> +               __clear_bit(PIN_CTRL_RW, value_bitmap);

This seems fine to me, but I understand the comment that the
code becomes harder to read.

I think part of it is those __assign_bit() and __clear_bit() with
the double-underscore of unclear meaning. The meaning is
"non atomic" IIRC, so maybe I should move forward
with my plan to send a sed script to Torvalds just renaming all
of those to something sane in the next merge window.

Like __assign_bit() -> assign_bit_nonatomic()

Yours,
Linus Walleij
