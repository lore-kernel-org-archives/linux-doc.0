Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id D08647E653
	for <lwn-linux-doc@archive.lwn.net>; Mon,  5 Mar 2018 23:58:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932671AbeCEX6e (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 5 Mar 2018 18:58:34 -0500
Received: from mail-ot0-f194.google.com ([74.125.82.194]:33662 "EHLO
        mail-ot0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932395AbeCEX6d (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 5 Mar 2018 18:58:33 -0500
Received: by mail-ot0-f194.google.com with SMTP id y11so16739477otg.0;
        Mon, 05 Mar 2018 15:58:33 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=F1bw7EUepMjQ34w9jZJv/aRr13m4jZPK97sWtVt6jcw=;
        b=j+td0KCbyqSEMCrnod0DhJ0FXaCCBvGsA2U45jwn6Mgoc9V2if7O6hLOSOaO4ml6ab
         pqYTdGHvslohOMZvuX6tF5/KQBwDtEDxLp1Ltwrogcw7qPEh5OkDlMbVx8f0oypk+vGO
         NahQYRN4mO0q0xLDaVcLGa3TYADkoOkv8E5xl9if3HJf19Wg36nColfu62eKoBShALK7
         21a4zO8tyyQT4TTnnj6+AvlVkvQMFDHkouB9ihAOeEdL64MD1M8ZuNNNN0lhHVB3bHbY
         iAdFZqymZs1iSZEtTp4KKGpHCMfkatHq7Xomaj/y5ftSTij2VnTy7xGa5JHLA9ekX7Jv
         WGTg==
X-Gm-Message-State: AElRT7HhVWYycrHQ7nwVA0Z9CnKBXETmG4sozyFAS4fO0jnSvFIIHdxk
        NoW61x1ClpeC3JMHAQsT2yQbiyk=
X-Google-Smtp-Source: AG47ELsSrXcU/5b4E4jSwnF0KH0YACuWFhKMmd2XgXnuxsh0bg0hdxhs2e1uD7UFcyaPb1b+Y+lOTw==
X-Received: by 10.157.63.228 with SMTP id i33mr11399052ote.51.1520294312861;
        Mon, 05 Mar 2018 15:58:32 -0800 (PST)
Received: from localhost (216-188-254-6.dyn.grandenetworks.net. [216.188.254.6])
        by smtp.gmail.com with ESMTPSA id t1sm2033164oth.75.2018.03.05.15.58.32
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 05 Mar 2018 15:58:32 -0800 (PST)
Date:   Mon, 5 Mar 2018 17:58:31 -0600
From:   Rob Herring <robh@kernel.org>
To:     Karthikeyan Ramasubramanian <kramasub@codeaurora.org>
Cc:     corbet@lwn.net, andy.gross@linaro.org, david.brown@linaro.org,
        mark.rutland@arm.com, wsa@the-dreams.de,
        gregkh@linuxfoundation.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org,
        jslaby@suse.com, evgreen@chromium.org, acourbot@chromium.org,
        Sagar Dharia <sdharia@codeaurora.org>,
        Girish Mahadevan <girishm@codeaurora.org>
Subject: Re: [PATCH v3 1/4] dt-bindings: soc: qcom: Add device tree binding
 for GENI SE
Message-ID: <20180305235831.i7kxups7khus2g5c@rob-hp-laptop>
References: <1519781889-16117-1-git-send-email-kramasub@codeaurora.org>
 <1519781889-16117-2-git-send-email-kramasub@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1519781889-16117-2-git-send-email-kramasub@codeaurora.org>
User-Agent: NeoMutt/20170609 (1.8.3)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Feb 27, 2018 at 06:38:06PM -0700, Karthikeyan Ramasubramanian wrote:
> Add device tree binding support for the QCOM GENI SE driver.
> 
> Signed-off-by: Karthikeyan Ramasubramanian <kramasub@codeaurora.org>
> Signed-off-by: Sagar Dharia <sdharia@codeaurora.org>
> Signed-off-by: Girish Mahadevan <girishm@codeaurora.org>
> ---
>  .../devicetree/bindings/soc/qcom/qcom,geni-se.txt  | 89 ++++++++++++++++++++++
>  1 file changed, 89 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.txt
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.txt
> new file mode 100644
> index 0000000..fe6a0c0
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.txt
> @@ -0,0 +1,89 @@
> +Qualcomm Technologies, Inc. GENI Serial Engine QUP Wrapper Controller
> +
> +Generic Interface (GENI) based Qualcomm Universal Peripheral (QUP) wrapper
> +is a programmable module for supporting a wide range of serial interfaces
> +like UART, SPI, I2C, I3C, etc. A single QUP module can provide upto 8 Serial
> +Interfaces, using its internal Serial Engines. The GENI Serial Engine QUP
> +Wrapper controller is modeled as a node with zero or more child nodes each
> +representing a serial engine.
> +
> +Required properties:
> +- compatible:		Must be "qcom,geni-se-qup".
> +- reg:			Must contain QUP register address and length.
> +- clock-names:		Must contain "m-ahb" and "s-ahb".
> +- clocks:		AHB clocks needed by the device.
> +
> +Required properties if child node exists:
> +- #address-cells: 	Must be <1> for Serial Engine Address
> +- #size-cells: 		Must be <1> for Serial Engine Address Size
> +- ranges: 		Must be present
> +
> +Properties for children:
> +
> +A GENI based QUP wrapper controller node can contain 0 or more child nodes
> +representing serial devices.  These serial devices can be a QCOM UART, I2C
> +controller, spi controller, or some combination of aforementioned devices.

s/spi/SPI/

Where's the SPI binding?

> +Please refer below the child node definitions for the supported serial
> +interface protocols.
> +
> +Qualcomm Technologies Inc. GENI Serial Engine based I2C Controller
> +
> +Required properties:
> +- compatible:		Must be "qcom,geni-i2c".
> +- reg: 			Must contain QUP register address and length.
> +- interrupts: 		Must contain I2C interrupt.
> +- clock-names: 		Must contain "se".
> +- clocks: 		Serial engine core clock needed by the device.
> +- #address-cells:	Must be <1> for i2c device address.
> +- #size-cells:		Must be <0> as i2c addresses have no size component.
> +
> +Optional property:
> +- clock-frequency:	Desired I2C bus clock frequency in Hz.
> +			When missing default to 400000Hz.
> +
> +Child nodes should conform to i2c bus binding as described in i2c.txt.
> +
> +Qualcomm Technologies Inc. GENI Serial Engine based UART Controller
> +
> +Required properties:
> +- compatible:		Must be "qcom,geni-debug-uart".
> +- reg: 			Must contain UART register location and length.
> +- interrupts: 		Must contain UART core interrupts.
> +- clock-names:		Must contain "se".
> +- clocks:		Serial engine core clock needed by the device.
> +
> +Example:
> +	geniqup@8c0000 {
> +		compatible = "qcom,geni-se-qup";
> +		reg = <0x8c0000 0x6000>;
> +		clock-names = "m-ahb", "s-ahb";
> +		clocks = <&clock_gcc GCC_QUPV3_WRAP_0_M_AHB_CLK>,
> +			<&clock_gcc GCC_QUPV3_WRAP_0_S_AHB_CLK>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		i2c0: i2c@a94000 {
> +			compatible = "qcom,geni-i2c";
> +			reg = <0xa94000 0x4000>;
> +			interrupts = <GIC_SPI 358 IRQ_TYPE_LEVEL_HIGH>;
> +			clock-names = "se";
> +			clocks = <&clock_gcc GCC_QUPV3_WRAP0_S5_CLK>;
> +			pinctrl-names = "default", "sleep";
> +			pinctrl-0 = <&qup_1_i2c_5_active>;
> +			pinctrl-1 = <&qup_1_i2c_5_sleep>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +		};
> +
> +		uart0: serial@a88000 {
> +			compatible = "qcom,geni-debug-uart";
> +			reg = <0xa88000 0x7000>;
> +			interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
> +			clock-names = "se";
> +			clocks = <&clock_gcc GCC_QUPV3_WRAP0_S0_CLK>;
> +			pinctrl-names = "default", "sleep";
> +			pinctrl-0 = <&qup_1_uart_3_active>;
> +			pinctrl-1 = <&qup_1_uart_3_sleep>;
> +		};
> +	}
> -- 
> Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
