Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9C5E97D09D
	for <lwn-linux-doc@archive.lwn.net>; Wed, 23 May 2018 06:30:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754011AbeEWGag (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 23 May 2018 02:30:36 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:54686 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753872AbeEWGaf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 May 2018 02:30:35 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id C6EF160213; Wed, 23 May 2018 06:30:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1527057034;
        bh=w4OK+n0T27+H+uhEbZqHs3os4jv6hQL3fgT60YVKi+s=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=dHJvSNNx3LoXd5TjJgjaCAXVi+9OSiiO3WUMd1pG65m9+sUHHp1WRXmVYg141k3qy
         gYecXUWaTFsYHe8D+3JidEXJcB6bArOl9I/99I+Lz7xSrGlFGfYAN3dSl6UwLZglvR
         CFbc3M+JJBJPctglc1u/Mg4U6Do+NLWdQTi5PzAw=
Received: from [10.79.40.88] (blr-bdr-fw-01_globalnat_allzones-outside.qualcomm.com [103.229.18.19])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: rnayak@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id DAA0A60213;
        Wed, 23 May 2018 06:30:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1527057033;
        bh=w4OK+n0T27+H+uhEbZqHs3os4jv6hQL3fgT60YVKi+s=;
        h=Subject:To:Cc:References:From:Date:In-Reply-To:From;
        b=IEqr02/KVAD0ZqxGzwfejFKemXk3Pnoo+y2ZC9L0HW4f9X9YAAU6xLi7pNeWcP1My
         de9V5CqGfWwffIAWkX+FcgKJHe91aynR85d0WlBr1rIzeKhMByONqje9r/DefbAQTl
         cD+mInED53zu2kTTJ2paCxkeutS8k76OmXsLgm7c=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org DAA0A60213
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=rnayak@codeaurora.org
Subject: Re: [PATCH v6 4/5] arm64: dts: sdm845: Add serial console support
To:     Karthikeyan Ramasubramanian <kramasub@codeaurora.org>,
        corbet@lwn.net, andy.gross@linaro.org, david.brown@linaro.org,
        robh+dt@kernel.org, mark.rutland@arm.com, wsa@the-dreams.de
Cc:     linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        evgreen@chromium.org, acourbot@chromium.org, swboyd@chromium.org,
        dianders@chromium.org, bjorn.andersson@linaro.org
References: <1522429700-13083-1-git-send-email-kramasub@codeaurora.org>
 <1522429700-13083-5-git-send-email-kramasub@codeaurora.org>
From:   Rajendra Nayak <rnayak@codeaurora.org>
Message-ID: <ebe4515d-a26f-a825-0353-666b0b5ad9f5@codeaurora.org>
Date:   Wed, 23 May 2018 12:00:26 +0530
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.7.0
MIME-Version: 1.0
In-Reply-To: <1522429700-13083-5-git-send-email-kramasub@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org



On 03/30/2018 10:38 PM, Karthikeyan Ramasubramanian wrote:
> From: Rajendra Nayak <rnayak@codeaurora.org>
> 
> Add the qup uart node and geni se instance needed to
> support the serial console on the MTP.
> 
> Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
> Signed-off-by: Karthikeyan Ramasubramanian <kramasub@codeaurora.org>
> ---

Andy, is it possible to pull this one in for 4.18?
Sorry, I only realized we somehow missed this after looking at your pull request.

This is the only patch that prevents linux-next from booting up my sdm845 MTP
to a minimal console shell.

Thanks,
Rajendra

>  arch/arm64/boot/dts/qcom/sdm845-mtp.dts | 41 +++++++++++++++++++++++++++++++++
>  arch/arm64/boot/dts/qcom/sdm845.dtsi    | 39 +++++++++++++++++++++++++++++++
>  2 files changed, 80 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> index 979ab49..17b2fb0 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> +++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
> @@ -12,4 +12,45 @@
>  / {
>  	model = "Qualcomm Technologies, Inc. SDM845 MTP";
>  	compatible = "qcom,sdm845-mtp";
> +
> +	aliases {
> +		serial0 = &uart2;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +};
> +
> +&soc {
> +	geniqup@ac0000 {
> +		status = "okay";
> +
> +		serial@a84000 {
> +			status = "okay";
> +		};
> +	};
> +
> +	pinctrl@3400000 {
> +		qup-uart2-default {
> +			pinconf_tx {
> +				pins = "gpio4";
> +				drive-strength = <2>;
> +				bias-disable;
> +			};
> +
> +			pinconf_rx {
> +				pins = "gpio5";
> +				drive-strength = <2>;
> +				bias-pull-up;
> +			};
> +		};
> +
> +		qup-uart2-sleep {
> +			pinconf {
> +				pins = "gpio4", "gpio5";
> +				bias-pull-down;
> +			};
> +		};
> +	};
>  };
> diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> index 32f8561..71801b9 100644
> --- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
> +++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
> @@ -6,6 +6,7 @@
>   */
>  
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/clock/qcom,gcc-sdm845.h>
>  
>  / {
>  	interrupt-parent = <&intc>;
> @@ -194,6 +195,20 @@
>  			#gpio-cells = <2>;
>  			interrupt-controller;
>  			#interrupt-cells = <2>;
> +
> +			qup_uart2_default: qup-uart2-default {
> +				pinmux {
> +					function = "qup9";
> +					pins = "gpio4", "gpio5";
> +				};
> +			};
> +
> +			qup_uart2_sleep: qup-uart2-sleep {
> +				pinmux {
> +					function = "gpio";
> +					pins = "gpio4", "gpio5";
> +				};
> +			};
>  		};
>  
>  		timer@17c90000 {
> @@ -272,5 +287,29 @@
>  			#interrupt-cells = <4>;
>  			cell-index = <0>;
>  		};
> +
> +		geniqup@ac0000 {
> +			compatible = "qcom,geni-se-qup";
> +			reg = <0xac0000 0x6000>;
> +			clock-names = "m-ahb", "s-ahb";
> +			clocks = <&gcc GCC_QUPV3_WRAP_1_M_AHB_CLK>,
> +				 <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges;
> +			status = "disabled";
> +
> +			uart2: serial@a84000 {
> +				compatible = "qcom,geni-debug-uart";
> +				reg = <0xa84000 0x4000>;
> +				clock-names = "se";
> +				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
> +				pinctrl-names = "default", "sleep";
> +				pinctrl-0 = <&qup_uart2_default>;
> +				pinctrl-1 = <&qup_uart2_sleep>;
> +				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
> +				status = "disabled";
> +			};
> +		};
>  	};
>  };
> 

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
hosted by The Linux Foundation
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
