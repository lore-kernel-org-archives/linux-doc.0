Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A40177E27E
	for <lwn-linux-doc@archive.lwn.net>; Mon, 16 Apr 2018 18:10:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752854AbeDPSKi (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 16 Apr 2018 14:10:38 -0400
Received: from mail-ot0-f194.google.com ([74.125.82.194]:37249 "EHLO
        mail-ot0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752308AbeDPSKh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 16 Apr 2018 14:10:37 -0400
Received: by mail-ot0-f194.google.com with SMTP id y46-v6so18449186otd.4;
        Mon, 16 Apr 2018 11:10:36 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=GSC54G1Evvb1gkv/uacAKledYzpWwpthqr7YuI8KJx8=;
        b=uGNN2pBawWmzL3tyrQnIMLfNvsKG1r1m0m+uC7i3IB3atSa9YdDgKp6RDzQXA0HyAA
         4JVhTF1WyDmP3PBfMVuG4rn/mMR3PqxJj4EF3nQ2l4VNcAlQoFJYyU3k/fY4ivRjzI1s
         EG4EYnJr3roUkvLZKmAWPQ7ERHB7Agy67vW3C4VWhVPU5BBKAgCF38yrE/66ldavswMH
         Xiw/hR8KhQs+/pfpCJ6g5QlhDnTUhXEe3Y5GQbcw12vV9ZLTEaRI48ypNdCsNGhrl82n
         Zaw/F0dXw6OAL0GEPbkpoRxV6vOyu4o9sJEGl2NW+zVRL4iV6EwOi78gxminPiWd3P7G
         +yvw==
X-Gm-Message-State: ALQs6tDwW8Ut9HKMlm4P2vKggyYomBebYSINZ6z4oeJi9fD9d1Tszv1o
        nc7+Xr4cNBuGF7xf8hR9zg==
X-Google-Smtp-Source: AIpwx48LTJ7hgMli85SR7mQQRR2FbQJgv2UpxVCQralKb6UTIcfbIyypc379LTrwb3ZYawjMP3Jamg==
X-Received: by 2002:a9d:2222:: with SMTP id o31-v6mr2893040ota.340.1523902236516;
        Mon, 16 Apr 2018 11:10:36 -0700 (PDT)
Received: from localhost (216-188-254-6.dyn.grandenetworks.net. [216.188.254.6])
        by smtp.gmail.com with ESMTPSA id m84-v6sm7380164oia.1.2018.04.16.11.10.35
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 16 Apr 2018 11:10:35 -0700 (PDT)
Date:   Mon, 16 Apr 2018 13:10:35 -0500
From:   Rob Herring <robh@kernel.org>
To:     Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
Cc:     Alan Cox <alan@linux.intel.com>, Andrew Jeffery <andrew@aj.id.au>,
        Andrew Lunn <andrew@lunn.ch>,
        Andy Shevchenko <andriy.shevchenko@intel.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        Fengguang Wu <fengguang.wu@intel.com>,
        Greg KH <gregkh@linuxfoundation.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Haiyue Wang <haiyue.wang@linux.intel.com>,
        James Feist <james.feist@linux.intel.com>,
        Jason M Biils <jason.m.bills@linux.intel.com>,
        Jean Delvare <jdelvare@suse.com>,
        Joel Stanley <joel@jms.id.au>,
        Julia Cartwright <juliac@eso.teric.us>,
        Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>,
        Milton Miller II <miltonm@us.ibm.com>,
        Pavel Machek <pavel@ucw.cz>,
        Randy Dunlap <rdunlap@infradead.org>,
        Stef van Os <stef.van.os@prodrive-technologies.com>,
        Sumeet R Pawnikar <sumeet.r.pawnikar@intel.com>,
        Vernon Mauery <vernon.mauery@linux.intel.com>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-hwmon@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v3 04/10] Documentations: dt-bindings: Add a document of
 PECI adapter driver for Aspeed AST24xx/25xx SoCs
Message-ID: <20180416181035.rcjvt4rlrwaj5yxf@rob-hp-laptop>
References: <20180410183212.16787-1-jae.hyun.yoo@linux.intel.com>
 <20180410183212.16787-5-jae.hyun.yoo@linux.intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180410183212.16787-5-jae.hyun.yoo@linux.intel.com>
User-Agent: NeoMutt/20170609 (1.8.3)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Apr 10, 2018 at 11:32:06AM -0700, Jae Hyun Yoo wrote:
> This commit adds a dt-bindings document of PECI adapter driver for Aspeed
> AST24xx/25xx SoCs.
> 
> Signed-off-by: Jae Hyun Yoo <jae.hyun.yoo@linux.intel.com>
> Reviewed-by: Haiyue Wang <haiyue.wang@linux.intel.com>
> Reviewed-by: James Feist <james.feist@linux.intel.com>
> Reviewed-by: Vernon Mauery <vernon.mauery@linux.intel.com>
> Cc: Alan Cox <alan@linux.intel.com>
> Cc: Andrew Jeffery <andrew@aj.id.au>
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Andy Shevchenko <andriy.shevchenko@intel.com>
> Cc: Arnd Bergmann <arnd@arndb.de>
> Cc: Benjamin Herrenschmidt <benh@kernel.crashing.org>
> Cc: Fengguang Wu <fengguang.wu@intel.com>
> Cc: Greg KH <gregkh@linuxfoundation.org>
> Cc: Guenter Roeck <linux@roeck-us.net>
> Cc: Jason M Biils <jason.m.bills@linux.intel.com>
> Cc: Jean Delvare <jdelvare@suse.com>
> Cc: Joel Stanley <joel@jms.id.au>
> Cc: Julia Cartwright <juliac@eso.teric.us>
> Cc: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
> Cc: Milton Miller II <miltonm@us.ibm.com>
> Cc: Pavel Machek <pavel@ucw.cz>
> Cc: Randy Dunlap <rdunlap@infradead.org>
> Cc: Stef van Os <stef.van.os@prodrive-technologies.com>
> Cc: Sumeet R Pawnikar <sumeet.r.pawnikar@intel.com>
> ---
>  .../devicetree/bindings/peci/peci-aspeed.txt       | 60 ++++++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/peci/peci-aspeed.txt
> 
> diff --git a/Documentation/devicetree/bindings/peci/peci-aspeed.txt b/Documentation/devicetree/bindings/peci/peci-aspeed.txt
> new file mode 100644
> index 000000000000..4598bb8c20fa
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/peci/peci-aspeed.txt
> @@ -0,0 +1,60 @@
> +Device tree configuration for PECI buses on the AST24XX and AST25XX SoCs.
> +
> +Required properties:
> +- compatible        : Should be "aspeed,ast2400-peci" or "aspeed,ast2500-peci"
> +		      - aspeed,ast2400-peci: Aspeed AST2400 family PECI
> +					     controller
> +		      - aspeed,ast2500-peci: Aspeed AST2500 family PECI
> +					     controller
> +- reg               : Should contain PECI controller registers location and
> +		      length.
> +- #address-cells    : Should be <1>.
> +- #size-cells       : Should be <0>.
> +- interrupts        : Should contain PECI controller interrupt.
> +- clocks            : Should contain clock source for PECI controller.
> +		      Should reference clkin.
> +- clock_frequency   : Should contain the operation frequency of PECI controller
> +		      in units of Hz.
> +		      187500 ~ 24000000

This is the frequency of the bus or used to derive it? It would be 
better to specify the bus frequency instead and have the driver 
calculate its internal freq. And then use "bus-frequency" instead.

> +
> +Optional properties:
> +- msg-timing-nego   : Message timing negotiation period. This value will
> +		      determine the period of message timing negotiation to be
> +		      issued by PECI controller. The unit of the programmed
> +		      value is four times of PECI clock period.
> +		      0 ~ 255 (default: 1)
> +- addr-timing-nego  : Address timing negotiation period. This value will
> +		      determine the period of address timing negotiation to be
> +		      issued by PECI controller. The unit of the programmed
> +		      value is four times of PECI clock period.
> +		      0 ~ 255 (default: 1)
> +- rd-sampling-point : Read sampling point selection. The whole period of a bit
> +		      time will be divided into 16 time frames. This value will
> +		      determine the time frame in which the controller will
> +		      sample PECI signal for data read back. Usually in the
> +		      middle of a bit time is the best.
> +		      0 ~ 15 (default: 8)
> +- cmd_timeout_ms    : Command timeout in units of ms.
> +		      1 ~ 60000 (default: 1000)

s/_/-/


All these either need vendor prefixes or should be standard properties 
for PECI adapters. I think probably the latter case. If so, the first 
2 should probably be in units of clocks (not 4 clocks). And they should 
then be documented in the common PECI binding doc.

> +
> +Example:
> +	peci: peci@1e78b000 {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0x0 0x1e78b000 0x60>;

No need to show this part in examples.

> +
> +		peci0: peci-bus@0 {
> +			compatible = "aspeed,ast2500-peci";
> +			reg = <0x0 0x60>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			interrupts = <15>;
> +			clocks = <&clk_clkin>;
> +			clock-frequency = <24000000>;
> +			msg-timing-nego = <1>;
> +			addr-timing-nego = <1>;
> +			rd-sampling-point = <8>;
> +			cmd-timeout-ms = <1000>;
> +		};
> +	};
> -- 
> 2.16.2
> 
> --
> To unsubscribe from this list: send the line "unsubscribe devicetree" in
> the body of a message to majordomo@vger.kernel.org
> More majordomo info at  http://vger.kernel.org/majordomo-info.html
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
