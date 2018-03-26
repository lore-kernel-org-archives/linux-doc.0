Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 09A747DD32
	for <lwn-linux-doc@archive.lwn.net>; Mon, 26 Mar 2018 10:13:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751355AbeCZKM6 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 26 Mar 2018 06:12:58 -0400
Received: from mail-qk0-f195.google.com ([209.85.220.195]:32854 "EHLO
        mail-qk0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751010AbeCZKMz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Mar 2018 06:12:55 -0400
Received: by mail-qk0-f195.google.com with SMTP id d206so7090334qkb.0;
        Mon, 26 Mar 2018 03:12:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=mime-version:sender:in-reply-to:references:from:date:message-id
         :subject:to:cc;
        bh=mIt2nkooN/lrRvE+dHA+bJcbbHNJlx2F5V98nrRH2nU=;
        b=XE2ErK6WudxBSZChrNIGs/OCbhJr7xwPpiDnO4v6LhthH3t3nAxZxwTwTbyo5udNvh
         4B6nn4Rckcvfm3dBHch/XWkTKydV34Qtyt49wVLhpYS+IUr2QmHWtPIA9qEasOMkcxYe
         AG9rIfpxLWwtdHVJEyhqiNEPFw3zz0DW/zFHA1zfiEe1rkRl470A2lqWyMkL+tvuKjft
         fS8qZRwrQX8flAufdo927qNbnhG+KLCRsPqG/W+DJ9FPeMo6ANZQ6vghT/Npw+tzQ3SP
         BHLDE6djCUBIkZlNCQcEp9iVlU3QTxySZCtpVxkjOwN9IobgtRnJvJO5drXGAo6Iy0xw
         g9Jw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:sender:in-reply-to:references:from
         :date:message-id:subject:to:cc;
        bh=mIt2nkooN/lrRvE+dHA+bJcbbHNJlx2F5V98nrRH2nU=;
        b=ZpwFcJqzt58cEzEvmFJfK15iKAtNvTrr2gfY6iRQ1H9341Euglyv/RQuM55H/IMufQ
         cBbByLXXErgzuTluR8IGO45Q2FTW5lCFuScL+bHaXJbULz6Z+IPO75lw7yMbXI1lvZjw
         HwkQ6aAhectAJ07H9USFC6ESZuvJ9/zolZPLNWDn9YE7Z4UxRtYUIu9fU6rm2Sm+cLKT
         nbtNRwGUlfkErW04rDgrE7LAGTOlpKOIvUqdbxZSPmfY08wU/VWUCfAWHLhWt6DCfmnY
         ifF+mqPb0GOE/Q0S3zPJwQpO2IlCn+0PBQ37EELEXgrfrsg6Gtk8mwHuAYHP4b/Ria6G
         9/zw==
X-Gm-Message-State: AElRT7F3RMWItcK95CUfyc3ol+Z6egFZKaJT+5IjYCT7usGRfJudCQCw
        Pffeh4HQJoORcDU+exCVJZoRCo+0OApw3M85e68=
X-Google-Smtp-Source: AG47ELuvxWc2Gl2X48OnodU0ZuGXLRMNyeZIenLQszHG4r8Au9wHkCJJ5GYX8w7U3BKWUI7EeREe8+H1qJMXW8t7hw4=
X-Received: by 10.55.209.79 with SMTP id s76mr55581605qki.89.1522059174873;
 Mon, 26 Mar 2018 03:12:54 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.200.54.147 with HTTP; Mon, 26 Mar 2018 03:12:54 -0700 (PDT)
In-Reply-To: <20180323110020.19080-12-boris.brezillon@bootlin.com>
References: <20180323110020.19080-1-boris.brezillon@bootlin.com> <20180323110020.19080-12-boris.brezillon@bootlin.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 26 Mar 2018 12:12:54 +0200
X-Google-Sender-Auth: efwvJAPYgE6xiSWdibSHmeZaZ0Q
Message-ID: <CAMuHMdX3TLmaN14gM4fTgzXwy1dgsMxCFBs_3wCFWM8rX=+8vA@mail.gmail.com>
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

> +- #interrupt-cells : Should be 2.  The first cell is the GPIO number.
> +  The second cell bits[3:0] is used to specify trigger type and level flags:
> +      1 = low-to-high edge triggered.
> +      2 = high-to-low edge triggered.
> +      3 = triggered on both edges.
> +      4 = active high level-sensitive.
> +      8 = active low level-sensitive.

These are identical to the values in <dt-bindings/interrupt-controller/irq.h>.
Perhaps you can refer to those definitions?
I don't think we want to see the hardcoded numbers in DTS files.

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
