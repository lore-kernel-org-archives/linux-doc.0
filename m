Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3E2647E27E
	for <lwn-linux-doc@archive.lwn.net>; Wed, 25 Apr 2018 13:35:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753399AbeDYNfe (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 25 Apr 2018 09:35:34 -0400
Received: from muru.com ([72.249.23.125]:38712 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1752868AbeDYNfd (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 25 Apr 2018 09:35:33 -0400
Received: from atomide.com (localhost [127.0.0.1])
        by muru.com (Postfix) with ESMTPS id CFE9580B8;
        Wed, 25 Apr 2018 13:37:18 +0000 (UTC)
Date:   Wed, 25 Apr 2018 06:35:29 -0700
From:   Tony Lindgren <tony@atomide.com>
To:     Kishon Vijay Abraham I <kishon@ti.com>
Cc:     =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-doc@vger.kernel.org,
        linux-mmc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-omap@vger.kernel.org
Subject: Re: [PATCH v3 04/15] ARM: dts: dra74x-mmc-iodelay: Add a new pinctrl
 group for clk line without pullup
Message-ID: <20180425133529.GU5671@atomide.com>
References: <20180425125449.19755-1-kishon@ti.com>
 <20180425125449.19755-5-kishon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180425125449.19755-5-kishon@ti.com>
User-Agent: Mutt/1.9.4 (2018-02-28)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

* Kishon Vijay Abraham I <kishon@ti.com> [180425 12:57]:
> --- a/arch/arm/boot/dts/dra74x-mmc-iodelay.dtsi
> +++ b/arch/arm/boot/dts/dra74x-mmc-iodelay.dtsi
> @@ -49,6 +49,17 @@
>  		>;
>  	};
>  
> +	mmc1_pins_default_no_clk_pu: mmc1_pins_default_no_clk_pu {
> +		pinctrl-single,pins = <
> +			DRA7XX_CORE_IOPAD(0x3754, PIN_INPUT_PULLDOWN | MUX_MODE0) /* mmc1_clk.clk */
> +			DRA7XX_CORE_IOPAD(0x3758, PIN_INPUT_PULLUP | MUX_MODE0) /* mmc1_cmd.cmd */
> +			DRA7XX_CORE_IOPAD(0x375c, PIN_INPUT_PULLUP | MUX_MODE0) /* mmc1_dat0.dat0 */
> +			DRA7XX_CORE_IOPAD(0x3760, PIN_INPUT_PULLUP | MUX_MODE0) /* mmc1_dat1.dat1 */
> +			DRA7XX_CORE_IOPAD(0x3764, PIN_INPUT_PULLUP | MUX_MODE0) /* mmc1_dat2.dat2 */
> +			DRA7XX_CORE_IOPAD(0x3768, PIN_INPUT_PULLUP | MUX_MODE0) /* mmc1_dat3.dat3 */
> +		>;
> +	};
> +
>  	mmc1_pins_sdr12: mmc1_pins_sdr12 {
>  		pinctrl-single,pins = <
>  			DRA7XX_CORE_IOPAD(0x3754, PIN_INPUT_PULLUP | MUX_MODE0)	/* mmc1_clk.clk */
> -- 

If this data is the same for all of them, why don't you add something
like dra7-iodelay.dtsi that can be included as needed?

Regards,

Tony
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
