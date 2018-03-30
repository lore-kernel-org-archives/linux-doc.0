Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 42D737D0F4
	for <lwn-linux-doc@archive.lwn.net>; Fri, 30 Mar 2018 17:08:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752259AbeC3RIu (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 30 Mar 2018 13:08:50 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:56356 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752072AbeC3RIs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 30 Mar 2018 13:08:48 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id DA74560FA8; Fri, 30 Mar 2018 17:08:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1522429727;
        bh=zeLDe3SgBgj4pBEcnhdLR3O2tOrD2Eow5Jb4ewD1pJo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=Qh4+0SA1sKwV1hX7RHqNjw8QfsqwrW8DjKOT7v+mIjWvrRGFjPFe1Dyo7JfXOMPc7
         Fi0LnnrIEID1KJIqwRF9cr7dJ72gww9fFxcoDOC0xOb3vVlubo4kgjbi9XzM/t1OHb
         9fbY+CmeB6p21s6Jxh9PMi2IGerMWrY68S0qcOSI=
Received: from codeaurora.org (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kramasub@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 76CD660F8F;
        Fri, 30 Mar 2018 17:08:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1522429721;
        bh=zeLDe3SgBgj4pBEcnhdLR3O2tOrD2Eow5Jb4ewD1pJo=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=O6+7/loSUqkQh+EXqcXqR7R1oFmC4dG3QJsn+LffLpw1dshf+gUt3u0veJoNTxB/V
         Yj+ln6I2anLbLjSQz5Yd3rMqLTfp4LYbTryOVMWjqAW5LDt6RGIAaDSL1CTJXzxZiY
         /X85uo1FMVmU8eWIOT5XAM4ow615i7z4hCPxpUGc=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 76CD660F8F
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=kramasub@codeaurora.org
From:   Karthikeyan Ramasubramanian <kramasub@codeaurora.org>
To:     corbet@lwn.net, andy.gross@linaro.org, david.brown@linaro.org,
        robh+dt@kernel.org, mark.rutland@arm.com, wsa@the-dreams.de
Cc:     Karthikeyan Ramasubramanian <kramasub@codeaurora.org>,
        linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        evgreen@chromium.org, acourbot@chromium.org, swboyd@chromium.org,
        dianders@chromium.org, bjorn.andersson@linaro.org
Subject: [PATCH v6 5/5] arm64: dts: sdm845: Add support for an instance of I2C controller
Date:   Fri, 30 Mar 2018 11:08:20 -0600
Message-Id: <1522429700-13083-6-git-send-email-kramasub@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1522429700-13083-1-git-send-email-kramasub@codeaurora.org>
References: <1522429700-13083-1-git-send-email-kramasub@codeaurora.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add one instance of GENI based I2C master controller to enable testing
I2C driver using EEPROM slave.

Signed-off-by: Karthikeyan Ramasubramanian <kramasub@codeaurora.org>
Reviewed-by: Douglas Anderson <dianders@chromium.org>
---
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts | 19 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi    | 28 ++++++++++++++++++++++++++++
 2 files changed, 47 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
index 17b2fb0..dbe3a36 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
@@ -29,9 +29,28 @@
 		serial@a84000 {
 			status = "okay";
 		};
+
+		i2c@a88000 {
+			clock-frequency = <400000>;
+			status = "okay";
+		};
 	};
 
 	pinctrl@3400000 {
+		qup-i2c10-default {
+			pinconf {
+				pins = "gpio55", "gpio56";
+				drive-strength = <2>;
+				bias-disable;
+			};
+		};
+
+		qup-i2c10-sleep {
+			pinconf {
+				pins = "gpio55", "gpio56";
+			};
+		};
+
 		qup-uart2-default {
 			pinconf_tx {
 				pins = "gpio4";
diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 71801b9..d367020 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -196,6 +196,20 @@
 			interrupt-controller;
 			#interrupt-cells = <2>;
 
+			qup_i2c10_default: qup-i2c10-default {
+				pinmux {
+					function = "qup10";
+					pins = "gpio55", "gpio56";
+				};
+			};
+
+			qup_i2c10_sleep: qup-i2c10-sleep {
+				pinmux {
+					function = "gpio";
+					pins = "gpio55", "gpio56";
+				};
+			};
+
 			qup_uart2_default: qup-uart2-default {
 				pinmux {
 					function = "qup9";
@@ -310,6 +324,20 @@
 				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
 				status = "disabled";
 			};
+
+			i2c10: i2c@a88000 {
+				compatible = "qcom,geni-i2c";
+				reg = <0xa88000 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S2_CLK>;
+				pinctrl-names = "default", "sleep";
+				pinctrl-0 = <&qup_i2c10_default>;
+				pinctrl-1 = <&qup_i2c10_sleep>;
+				interrupts = <GIC_SPI 355 IRQ_TYPE_LEVEL_HIGH>;
+				#address-cells = <1>;
+				#size-cells = <0>;
+				status = "disabled";
+			};
 		};
 	};
 };
-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
