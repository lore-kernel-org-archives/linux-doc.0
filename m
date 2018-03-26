Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 334397DD32
	for <lwn-linux-doc@archive.lwn.net>; Mon, 26 Mar 2018 10:17:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751035AbeCZKRa (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 26 Mar 2018 06:17:30 -0400
Received: from mail-qt0-f195.google.com ([209.85.216.195]:43575 "EHLO
        mail-qt0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750973AbeCZKR2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Mar 2018 06:17:28 -0400
Received: by mail-qt0-f195.google.com with SMTP id s48so18953702qtb.10;
        Mon, 26 Mar 2018 03:17:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=ZKqOul/kec4iDidMaORhkR9f2Fbr1JLdFyV1peJH0Rk=;
        b=Zpmzi/7EBoHd+7COogm95hijSbafEDSANOmv8fcHyO1uZIaKkEqrVJt+7TJobqzagD
         iiKV93PjezsXlu76GxRHQBLbLDLxtazI/GfrPIBvHL0ZvFcX2oWA+956++kPvBv1zXev
         mywZI0avaSJ1Xq8WyZHXdPXz0OiyqXImWDFSxMJf7akM0LsQ/k+dPR+VhAMFbWK/+YIh
         1oiqgfmEnJ79VwkZhwrxj6IU9H5QtnQD/NT7iA6Tf45Hs4gUaCMMLr2TTaw5FOpzzar8
         CWou4vL65OaQJvIUTHJAnbuGmpE9NG/SXznqUxC7CxlNBu+BfvtrSulOkWwiKgtzuVWm
         /AoQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
         :date:message-id:subject:to:cc;
        bh=ZKqOul/kec4iDidMaORhkR9f2Fbr1JLdFyV1peJH0Rk=;
        b=sdOZTCwgi4KXd0RzgarsmOeX9zPpp71h621xi/DumG+wHNeB/PSWYLyf2wMzZb2SNr
         N43k9wgYoNQGe6wON1Yp/qtXs1d5hOJ1kAqY5fJCwTDVweWZtfY70YBg24HKqS/GZpTP
         Ngrw8UaCElC3cyko57bxHbehJuEaazALFQyRrKEuUpVMx34CBkU+bScZ+WrUH8gU/vKC
         A0R/FS65Il+v9cM88xf3hUoYaWkc50XDo5FenuLwYGPXbKVosNW40atrxEnw5i/VixKi
         k2Pb8pOnLXwBq4oOC1xIxpdwnD/C+QjZZnZl+QBu76NshB3J2oT4zUJcoISw6EyQ86d9
         nrZQ==
X-Gm-Message-State: AElRT7HUwzYzN7OiZaI0+z8TxcAKnxHvM0IdWGylEhh6EPTN4Z4yFj09
        AC6NyA/Z3lMzd1wW5O7s6Ehtk3mMoBZiKPXmJlM=
X-Google-Smtp-Source: AG47ELv90GETGiEYYbz4QQf7sHWr+l9S37k9WB/BaAQy2Alu1NxNgd3TDtryaDvpQ5MQgWDQSgWlLMxT+IDOOegCAi8=
X-Received: by 10.200.27.3 with SMTP id y3mr56865415qtj.161.1522059447613;
 Mon, 26 Mar 2018 03:17:27 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.54.147 with HTTP; Mon, 26 Mar 2018 03:17:26 -0700 (PDT)
In-Reply-To: <20180323110020.19080-12-boris.brezillon@bootlin.com>
References: <20180323110020.19080-1-boris.brezillon@bootlin.com> <20180323110020.19080-12-boris.brezillon@bootlin.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 26 Mar 2018 12:17:26 +0200
X-Google-Sender-Auth: ju2M0xymCiqy35mqHjEvEgkJzKc
Message-ID: <CAMuHMdUH3iB6ngF-0Zkij-oNN-Oms=EwXgoceLp06xbdcq1S=w@mail.gmail.com>
Subject: Re: [PATCH v3 11/11] dt-bindings: gpio: Add bindings for Cadence I3C
 gpio expander
To:     Boris Brezillon <boris.brezillon@bootlin.com>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Linux I2C <linux-i2c@vger.kernel.org>,
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
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        Nishanth Menon <nm@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Pawel Moll <pawel.moll@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Ian Campbell <ijc+devicetree@hellion.org.uk>,
        Kumar Gala <galak@codeaurora.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Vitor Soares <Vitor.Soares@synopsys.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Xiang Lin <Xiang.Lin@synaptics.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Boris,

On Fri, Mar 23, 2018 at 12:00 PM, Boris Brezillon
<boris.brezillon@bootlin.com> wrote:
> Document the Cadence I3C gpio expander bindings.
>
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/gpio/gpio-cdns-i3c.txt
> @@ -0,0 +1,38 @@
> +* Cadence I3C GPIO expander
> +
> +The Cadence I3C GPIO expander provides 8 GPIOs controllable over I3C.
> +This GPIOs can be configured in output or input mode and if they are in input
> +mode they can generate IBIs (In Band Interrupts).
> +
> +Required properties for GPIO node:
> +- reg : 3 cells encoding the I3C static address (none in our case) and the I3C
> +       Provisional ID. See Documentation/devicetree/bindings/i3c/i3c.txt for
> +       more details.
> +       Should be <0x0 0x392 0x0>.

No compatible value?

> +- gpio-controller : Marks the device node as a gpio controller.
> +- #gpio-cells : Should be two. The first cell is the pin number and
> +  the second cell is used to specify the gpio polarity:
> +      0 = active high
> +      1 = active low
> +- interrupt-controller: Marks the device node as an interrupt controller.
> +- #interrupt-cells : Should be 2.  The first cell is the GPIO number.
> +  The second cell bits[3:0] is used to specify trigger type and level flags:
> +      1 = low-to-high edge triggered.
> +      2 = high-to-low edge triggered.
> +      3 = triggered on both edges.
> +      4 = active high level-sensitive.
> +      8 = active low level-sensitive.
> +
> +Example:
> +
> +       i3c-master@xxx {
> +               ...
> +               i3c_gpio_expander: gpio@0,1c9,0 {

gpio@0,392,0?

> +                       reg = <0 0x392 0x0>;
> +                       gpio-controller;
> +                       #gpio-cells = <2>;
> +                       interrupt-controller;
> +                       #interrupt-cells = <2>;
> +               };
> +               ...
> +       };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
