Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.0 required=5.0 tests=RCVD_IN_DNSWL_HI,
	T_RP_MATCHES_RCVD autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 571C87E6C4
	for <lwn-linux-doc@archive.lwn.net>; Sun, 18 Mar 2018 12:57:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753979AbeCRM51 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sun, 18 Mar 2018 08:57:27 -0400
Received: from mail-pf0-f196.google.com ([209.85.192.196]:43458 "EHLO
        mail-pf0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754123AbeCRMwH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 18 Mar 2018 08:52:07 -0400
Received: by mail-pf0-f196.google.com with SMTP id j2so5951211pff.10;
        Sun, 18 Mar 2018 05:52:07 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rrOgcbmol9Kot/0eF+dUTL7ff83ayOINjHkuKT0k9WQ=;
        b=N9xYWP9KVommau+I+xG0ARzEbsMZ8P6lxIEWBCIyt71drtkU1WSPYF5+5lxEWVEGmY
         +QQeP5pR0D+6OFXPfgidOMXcUJ9GiwcGAcpvZ6h9dZM3MeVo8TlFquPkyhNMNUpuBk+c
         1hZGXSZRx80wp4q+K6/8Q8s59ZOg4T7pBE3vZxPEP9hAHVRNxRB+YzWUN7XcyYTs8dRy
         XxOcHcMEFL5Lu3dgh0KyoC1xgJu+Oq9ml1iJvU5FRYDSNLkeG5hcnOMPNv4pJdYKtZWC
         1HadLbR0qIHsEqhTRb+CoBd52SVhpZKCJZMvJaqBKIA6Woc3HyD1JSAvS0ffG7S2zKuw
         YEyg==
X-Gm-Message-State: AElRT7F/7fSz5kBMhnfp6hqXcDHSaW18c5e9pne73bTMYyylQJwwGZxJ
        iAVV+2xPTZ52reV1EEQ+tg==
X-Google-Smtp-Source: AG47ELu9m9SaD/Ad46+JveAIGW/f4HhwxI6sPVGawFpacw7Hi58Y9VzpDMrx1MkvVT/mF4ia4OllqA==
X-Received: by 10.99.6.198 with SMTP id 189mr6592510pgg.131.1521377526811;
        Sun, 18 Mar 2018 05:52:06 -0700 (PDT)
Received: from localhost (165084180235.ctinets.com. [165.84.180.235])
        by smtp.gmail.com with ESMTPSA id b21sm23730321pfn.145.2018.03.18.05.52.05
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Sun, 18 Mar 2018 05:52:06 -0700 (PDT)
Date:   Sun, 18 Mar 2018 07:52:04 -0500
From:   Rob Herring <robh@kernel.org>
To:     Karthikeyan Ramasubramanian <kramasub@codeaurora.org>
Cc:     corbet@lwn.net, andy.gross@linaro.org, david.brown@linaro.org,
        mark.rutland@arm.com, wsa@the-dreams.de,
        gregkh@linuxfoundation.org, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org,
        jslaby@suse.com, evgreen@chromium.org, acourbot@chromium.org,
        swboyd@chromium.org, Sagar Dharia <sdharia@codeaurora.org>,
        Girish Mahadevan <girishm@codeaurora.org>
Subject: Re: [PATCH v4 1/6] dt-bindings: soc: qcom: Add device tree binding
 for GENI SE
Message-ID: <20180318125204.vlf7y7zyfol5lyom@rob-hp-laptop>
References: <1521071931-9294-1-git-send-email-kramasub@codeaurora.org>
 <1521071931-9294-2-git-send-email-kramasub@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1521071931-9294-2-git-send-email-kramasub@codeaurora.org>
User-Agent: NeoMutt/20170609 (1.8.3)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Mar 14, 2018 at 05:58:46PM -0600, Karthikeyan Ramasubramanian wrote:
> Add device tree binding support for the QCOM GENI SE driver.
> 
> Signed-off-by: Karthikeyan Ramasubramanian <kramasub@codeaurora.org>
> Signed-off-by: Sagar Dharia <sdharia@codeaurora.org>
> Signed-off-by: Girish Mahadevan <girishm@codeaurora.org>
> ---
>  .../devicetree/bindings/soc/qcom/qcom,geni-se.txt  | 123 +++++++++++++++++++++
>  1 file changed, 123 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.txt
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.txt b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.txt
> new file mode 100644
> index 0000000..b71b5df
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,geni-se.txt
> @@ -0,0 +1,123 @@
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
> +controller, SPI controller, or some combination of aforementioned devices.
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
> +- #address-cells:	Must be <1> for I2C device address.
> +- #size-cells:		Must be <0> as I2C addresses have no size component.
> +
> +Optional property:
> +- clock-frequency:	Desired I2C bus clock frequency in Hz.
> +			When missing default to 400000Hz.
> +
> +Child nodes should conform to I2C bus binding as described in i2c.txt.
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
> +Qualcomm Technologies Inc. GENI Serial Engine based SPI Controller
> +
> +Required properties:
> +- compatible:		Must contain "qcom,geni-spi".
> +- reg:			Must contain SPI register location and length.
> +- interrupts:		Must contain SPI controller interrupts.
> +- clock-names:		Must contain "se".
> +- clocks:		Serial engine core clock needed by the device.
> +- spi-max-frequency:	Specifies maximum SPI clock frequency, units - Hz.
> +- #address-cells:	Must be <1> to define a chip select address on
> +			the SPI bus.
> +- #size-cells:		Must be <0>.
> +
> +Optional property:
> +- qcom,rt:		Indicates if the framework worker thread for this
> +			controller device should have real-time priority.

Sounds like a Linux issue, not a DT property. Given you have no driver 
yet, I'd drop this for now at least. With that,

Reviewed-by: Rob Herring <robh@kernel.org>

Rob
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
