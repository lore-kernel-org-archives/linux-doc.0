Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BFD4B7DD32
	for <lwn-linux-doc@archive.lwn.net>; Mon, 26 Mar 2018 10:22:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751090AbeCZKW2 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 26 Mar 2018 06:22:28 -0400
Received: from mail-qk0-f196.google.com ([209.85.220.196]:35801 "EHLO
        mail-qk0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750972AbeCZKW0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Mar 2018 06:22:26 -0400
Received: by mail-qk0-f196.google.com with SMTP id s188so19467342qkb.2;
        Mon, 26 Mar 2018 03:22:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=qLFfH7b/3FbE1+YzlreJpjA1VSKGglmNy7P6ehv26Po=;
        b=f1TVkZxFNqgKWHOwOWZxC+z8hZuA6UPHf1v/N863HHhTU7XJ/Ba5fvRjvGRV10uszq
         PXGSDgD/XNyqH05nAar2fpvEY6tV4KGB0Y7L6sARciY4Rg/Fcye2b98tS+BMxNcECpdP
         FoUErpsIo1KFZPkjLjkHX/QbdXAicZtfvxoZS2ftyXuHEhpyGv7/d4mMajqSYYGcxBFI
         eTVLPTMBX0GWktehSIOcKfUmJGVoDMO9xDiy/JQyz5j8ghZlgQix/xOlvMwLmTtNQOWh
         6hZDcoGaQ7VsNd79pNyNN6iHre2rAQ28rmnyb492bE/Wjc7y8MOEuyw67lpVRtRbeO0Q
         AJxw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
         :date:message-id:subject:to:cc;
        bh=qLFfH7b/3FbE1+YzlreJpjA1VSKGglmNy7P6ehv26Po=;
        b=W8WOiVTeqkKybQeOQiq6ykRaUGy4PAifRqSkAWBchZnVc/ekihNiX5lM9aIpjQcKX2
         U/FSk5NPjuEXSXCcXUmcRzcCxpunnlgX2iKvca4r5K7GMw/91mZiFPLO8s0rW8iPaDwd
         Qik1b+wH8oAU5/2YqPsdUKbLScTymNLpm7+UtWVPpiIRvwrEqLEnmwS1JMedyNtDA6gG
         AnpLGg0MJEfRTp854qj7ZV3EuylsR9t3+F+8cPgSd74LAKvH+14Rbq7XMLOeid9n/3Ks
         HxTXGKwxx/IwtHLyfMQToFi2crTqvc1Aem0lEMr70nAsnusf1eZVyTZT6ulVE9yr1Dv1
         znmQ==
X-Gm-Message-State: AElRT7GDDNJs953cd/5T7M0khq65QqtHFzj4zerkX8CZk7bGOi1AzbYq
        3/oAk9Fy+e8IHZDAwO5Lbg0V0Bi2pWCKV5gErsc=
X-Google-Smtp-Source: AIpwx48CMfytEgXendCNkmxaRNlO2pnpmNBOAyOcmou4Nnurt6FDxzR+BsSuKoOcHeUFgwrYSiMITwVxCIwaGq5u4OI=
X-Received: by 10.55.128.67 with SMTP id b64mr472316qkd.78.1522059745297; Mon,
 26 Mar 2018 03:22:25 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.54.147 with HTTP; Mon, 26 Mar 2018 03:22:24 -0700 (PDT)
In-Reply-To: <20180323110020.19080-6-boris.brezillon@bootlin.com>
References: <20180323110020.19080-1-boris.brezillon@bootlin.com> <20180323110020.19080-6-boris.brezillon@bootlin.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 26 Mar 2018 12:22:24 +0200
X-Google-Sender-Auth: WvZ9vqglGvDVAt6lprKQlbbkeCU
Message-ID: <CAMuHMdV9xW8o6zuOmOxB+=h1XTdi-VFq2mp897SUjZKtRMOWOw@mail.gmail.com>
Subject: Re: [PATCH v3 05/11] dt-bindings: i3c: Document core bindings
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
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Boris Brezillon <boris.brezillon@free-electrons.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Boris,

On Fri, Mar 23, 2018 at 12:00 PM, Boris Brezillon
<boris.brezillon@bootlin.com> wrote:
> From: Boris Brezillon <boris.brezillon@free-electrons.com>
>
> A new I3C subsystem has been added and a generic description has been
> created to represent the I3C bus and the devices connected on it.
>
> Document this generic representation.
>
> Signed-off-by: Boris Brezillon <boris.brezillon@free-electrons.com>

Thanks for your patch!

> --- /dev/null
> +++ b/Documentation/devicetree/bindings/i3c/i3c.txt
> @@ -0,0 +1,140 @@

> +I3C devices
> +===========
> +
> +All I3C devices are supposed to support DAA (Dynamic Address Assignment), and
> +are thus discoverable. So, by default, I3C devices do not have to be described
> +in the device tree.

But if they're described, they should have a compatible value, no?

> +This being said, one might want to attach extra resources to these devices,
> +and those resources may have to be described in the device tree, which in turn
> +means we have to describe I3C devices.
> +
> +Another use case for describing an I3C device in the device tree is when this
> +I3C device has a static address and we want to assign it a specific dynamic
> +address before the DAA takes place (so that other devices on the bus can't
> +take this dynamic address).
> +
> +The I3C device should be names <device-type>@<static-address>,<i3c-pid>,

named

So the i3c-pid in the unit address is represented as a 64-bit number, not as two
comma-separated 32-bit numbers?

> +Example:
> +
> +       i3c-master@d040000 {
> +               compatible = "cdns,i3c-master";
> +               clocks = <&coreclock>, <&i3csysclock>;
> +               clock-names = "pclk", "sysclk";
> +               interrupts = <3 0>;
> +               reg = <0x0d040000 0x1000>;
> +               #address-cells = <3>;
> +               #size-cells = <0>;
> +
> +               status = "okay";
> +               i2c-scl-frequency = <100000>;
> +
> +               /* I2C device. */
> +               nunchuk: nunchuk@52 {

@52,8000001000000000?

> +                       compatible = "nintendo,nunchuk";
> +                       reg = <0x52 0x80000010 0x0>;
> +               };
> +
> +               /* I3C device with a static address. */
> +               thermal_sensor: sensor@68,39200144004 {

No compatible value?

> +                       reg = <0x68 0x392 0x144004>;
> +                       assigned-address = <0xa>;
> +               };
> +
> +               /*
> +                * I3C device without a static address but requiring resources
> +                * described in the DT.
> +                */
> +               sensor@0,39200154004 {

No compatible value?

> +                       reg = <0x0 0x392 0x154004>;
> +                       clocks = <&clock_provider 0>;
> +               };
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
