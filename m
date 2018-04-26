Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8F78A7E279
	for <lwn-linux-doc@archive.lwn.net>; Thu, 26 Apr 2018 08:44:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754081AbeDZIod (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 26 Apr 2018 04:44:33 -0400
Received: from mail-qt0-f194.google.com ([209.85.216.194]:39826 "EHLO
        mail-qt0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753708AbeDZIo2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 26 Apr 2018 04:44:28 -0400
Received: by mail-qt0-f194.google.com with SMTP id f1-v6so13283444qtj.6
        for <linux-doc@vger.kernel.org>; Thu, 26 Apr 2018 01:44:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:in-reply-to:references:from:date:message-id:subject:to
         :cc;
        bh=K9aClyGZjPs/V2O1Mn4D/qIgC/WMPxw7UB+vj4khDV8=;
        b=SjrS/isOXsmb5nxUwWcufAk4OFWGuiQEzGIiZGMlknrX/0bBR1g6Au5GM+pO03Z9yO
         kbDLwvEMZ+7pbrKKruX8f7/Nk7qpqRPkf4JKulbNHUZUYMtnG8eUERpMF+vzeO4klT7H
         uPBQX12xK0gM8h46lEVvIKMDpUyWrXHWeP/+M=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:in-reply-to:references:from:date
         :message-id:subject:to:cc;
        bh=K9aClyGZjPs/V2O1Mn4D/qIgC/WMPxw7UB+vj4khDV8=;
        b=mQsfYJuNBeEJvPLKImWJROX5xqRf+hHFsTFfEALQ+h/97WUbNUzrDryXO0wRnfUGFO
         35XRpstt4WAoLfHGtSjyf7IFlbw4O6Z6nb9uVRniz9DeJtH4KUBdj41Ufhk2Xm6sPIYo
         FMJ9BjPsIv0C5NcS+rfkATsC7VJ1d8hrzP1xZqp5urQ5h+gIWY7fasTaYkn4PANdSAe0
         QOiXaTAKlYv/Ct1sjgBo2V5qmW7CtUEr2kqGxW8tRIZrDRJGhCdRZtnWNl3IGbRTbmBX
         T7j/JEGV6a4sLHfWWFruYqB30nql5o7DjOZOujqsTVG3JKdQQ9l9iY6y9NtWwEZqAvde
         l23g==
X-Gm-Message-State: ALQs6tC9vx8h2OPmzBKRZ7R4rfFPGHCrLLqJwEoMg3HK7WKUkM411qxV
        Jrb16HRDkj/uupLYXHh701z4ER4whqQi8YF/2rjgHA==
X-Google-Smtp-Source: AB8JxZqLR4MilXCsUuuJE/H0gnUsmMe1R0XrZ2dJiDxq3O6qcdh9Qbr70P9eGtu0i3dvLX3BkfobVyXhx/rhCV1g+eQ=
X-Received: by 2002:ac8:2724:: with SMTP id g33-v6mr34088240qtg.37.1524732268064;
 Thu, 26 Apr 2018 01:44:28 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.16.7 with HTTP; Thu, 26 Apr 2018 01:44:26 -0700 (PDT)
In-Reply-To: <20180330074751.25987-10-boris.brezillon@bootlin.com>
References: <20180330074751.25987-1-boris.brezillon@bootlin.com> <20180330074751.25987-10-boris.brezillon@bootlin.com>
From:   Linus Walleij <linus.walleij@linaro.org>
Date:   Thu, 26 Apr 2018 10:44:26 +0200
Message-ID: <CACRpkdY_7mi8GPiopZ9Yg4Y0-AV_SriZe=1yN5is6eH6FUm6Qg@mail.gmail.com>
Subject: Re: [PATCH v4 09/10] gpio: Add a driver for Cadence I3C GPIO expander
To:     Boris Brezillon <boris.brezillon@bootlin.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>, linux-i2c@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
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
        Ian Campbell <ijc+devicetree@hellion.org.uk>,
        Kumar Gala <galak@codeaurora.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Vitor Soares <Vitor.Soares@synopsys.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Xiang Lin <Xiang.Lin@synaptics.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Mar 30, 2018 at 9:47 AM, Boris Brezillon
<boris.brezillon@bootlin.com> wrote:

> Add a driver for Cadence I3C GPIO expander.
>
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>

This is pretty much OK, and I don't want to raise the bar
even higher for you to get this code into the kernel, so:
Acked-by: Linus Walleij <linus.walleij@linaro.org>

The following is an observation for future improvement:

> +static int cdns_i3c_gpio_read_reg(struct cdns_i3c_gpio *gpioc, u8 reg,
> +                                 u8 *val)
> +{
> +       struct i3c_priv_xfer xfers[] = {
> +               {
> +                       .len = sizeof(reg),
> +                       .data.out = &reg,
> +               },
> +               {
> +                       .rnw = true,
> +                       .len = sizeof(*val),
> +                       .data.in = val,
> +               },
> +       };
> +
> +       return i3c_device_do_priv_xfers(gpioc->i3cdev, xfers,
> +                                       ARRAY_SIZE(xfers));
> +}
> +
> +static int cdns_i3c_gpio_write_reg(struct cdns_i3c_gpio *gpioc, u8 reg,
> +                                  u8 val)
> +{
> +       struct i3c_priv_xfer xfers[] = {
> +               {
> +                       .len = sizeof(reg),
> +                       .data.out = &reg,
> +               },
> +               {
> +                       .len = sizeof(val),
> +                       .data.out = &val,
> +               },
> +       };
> +
> +       return i3c_device_do_priv_xfers(gpioc->i3cdev, xfers,
> +                                       ARRAY_SIZE(xfers));
> +}

This is starting to resemble
drivers/base/regmap/regmap-i2c.c

Maybe we should very quickly add regmap-i3c.c as this
infrastructre has had a great positive effect on may kernel
subsystems.

> +static int cdns_i3c_gpio_get_direction(struct gpio_chip *g, unsigned offset)
> +{
> +       struct cdns_i3c_gpio *gpioc = gpioc_to_cdns_gpioc(g);
> +
> +       return gpioc->dir & BIT(offset);

I would:

return !!(gpioc->dir & BIT(offset));

So you clamp it to bit 0.

Yours,
Linus Walleij
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
