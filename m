Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	T_RP_MATCHES_RCVD autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D87787DE76
	for <lwn-linux-doc@archive.lwn.net>; Mon, 26 Mar 2018 22:27:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751932AbeCZW1S (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 26 Mar 2018 18:27:18 -0400
Received: from mail-ot0-f194.google.com ([74.125.82.194]:43236 "EHLO
        mail-ot0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752776AbeCZWZD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Mar 2018 18:25:03 -0400
Received: by mail-ot0-f194.google.com with SMTP id m22-v6so22408571otf.10;
        Mon, 26 Mar 2018 15:25:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Xhb1X2YQBeXvwc0QSuxVH7Rv+N5LrS7mdjT64Fsksvs=;
        b=SFwTwD2B+fjLm08wJ+YuttMuLetGm6wTd8t5VDifLAdZf5WtAICVHAfcnLqSnaFDHq
         kjNOlwEPV92YP9EGnVTh50yNF9MdYxft/aWJQ4xCdzHhIlKUK6eiyOvZ3Q1pkfzHb96j
         R+5ZIciMzym/tzDPVVV9EE1a/QZeod+o4edFKfCq18nXZbNpDWWk5Jy044CyOIWNsZH3
         RplQgcr62O3TDlb9HE80j7aA1OhIrvnIh7Ad2zVcyNvShfUosHKSoGGnh1kJ7KrCBJ0G
         Sp4ENeAznb2wjqbKUiRIcmIszChQfVjPnupvVXeeG4r9jxCVSwn58Btx269aC9UczgQx
         ICXQ==
X-Gm-Message-State: AElRT7G8rF4DU+O0TP6yypaISESPSUvW7DRnt6ft6Vz7qP3gRL9Oed6Q
        JJTD1p+zLkjHCCnBUUqJHQ==
X-Google-Smtp-Source: AIpwx4/JivyWN54jov0NU32Bmt7X2lfIs7AKfsS/C1iOK/MDlF3FxWJWswtx5M7xozBacVROEK3Lig==
X-Received: by 2002:a9d:5a14:: with SMTP id v20-v6mr4321660oth.349.1522103102524;
        Mon, 26 Mar 2018 15:25:02 -0700 (PDT)
Received: from localhost (216-188-254-6.dyn.grandenetworks.net. [216.188.254.6])
        by smtp.gmail.com with ESMTPSA id y8-v6sm10202246otd.67.2018.03.26.15.25.01
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Mar 2018 15:25:01 -0700 (PDT)
Date:   Mon, 26 Mar 2018 17:25:01 -0500
From:   Rob Herring <robh@kernel.org>
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
        Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        Nishanth Menon <nm@ti.com>, Pawel Moll <pawel.moll@arm.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Ian Campbell <ijc+devicetree@hellion.org.uk>,
        Kumar Gala <galak@codeaurora.org>, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Vitor Soares <Vitor.Soares@synopsys.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        Xiang Lin <Xiang.Lin@synaptics.com>, linux-gpio@vger.kernel.org
Subject: Re: [PATCH v3 11/11] dt-bindings: gpio: Add bindings for Cadence I3C
 gpio expander
Message-ID: <20180326222501.exvvdjb6fbrtsvkv@rob-hp-laptop>
References: <20180323110020.19080-1-boris.brezillon@bootlin.com>
 <20180323110020.19080-12-boris.brezillon@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180323110020.19080-12-boris.brezillon@bootlin.com>
User-Agent: NeoMutt/20170609 (1.8.3)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Mar 23, 2018 at 12:00:20PM +0100, Boris Brezillon wrote:
> Document the Cadence I3C gpio expander bindings.
> 
> Signed-off-by: Boris Brezillon <boris.brezillon@bootlin.com>
> ---
>  .../devicetree/bindings/gpio/gpio-cdns-i3c.txt     | 38 ++++++++++++++++++++++
>  1 file changed, 38 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/gpio/gpio-cdns-i3c.txt
> 
> diff --git a/Documentation/devicetree/bindings/gpio/gpio-cdns-i3c.txt b/Documentation/devicetree/bindings/gpio/gpio-cdns-i3c.txt
> new file mode 100644
> index 000000000000..634b1f268215
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
> +	Provisional ID. See Documentation/devicetree/bindings/i3c/i3c.txt for
> +	more details.
> +	Should be <0x0 0x392 0x0>.
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
> +	i3c-master@xxx {
> +		...
> +		i3c_gpio_expander: gpio@0,1c9,0 {

The unit address is wrong here.

> +			reg = <0 0x392 0x0>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +		...
> +	};
> -- 
> 2.14.1
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
