Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3ADE97E6A4
	for <lwn-linux-doc@archive.lwn.net>; Wed, 14 Mar 2018 23:59:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751988AbeCNX7f (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 14 Mar 2018 19:59:35 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:55634 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751971AbeCNX7b (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 14 Mar 2018 19:59:31 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id 4251A60F72; Wed, 14 Mar 2018 23:59:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1521071970;
        bh=jU295T8+TBgPlIlB4MiF3GsMz/2AAtUbMxb2+MxvRgA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RTZZnq3wxH84MTIaQIf/D9K5u/hn/7x7efPbdSjrww3Wxs7bGYCw09Q9umDSL8zPN
         tY4E21rECxWFSc8eJZrh3UQtMc6uLFdSi8mEQy9WO0aaz6TA6WAsadTB14sDI4P5L5
         uVQUr0CcCaeFrfajkwQtdNvBArkHPDwoW11Hp8No=
Received: from codeaurora.org (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kramasub@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 94B7C60314;
        Wed, 14 Mar 2018 23:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1521071959;
        bh=jU295T8+TBgPlIlB4MiF3GsMz/2AAtUbMxb2+MxvRgA=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=R8yLcFdpH1082tsk03697R0ArJHRNP4SbAPSY6A5yzTEQNDJvbpH+qM3kBdbYoDAo
         +a+PwPCP08n0OB68O6JikGtMPcSjfNrqKLRCY6vyz7stWxjt26nPLPw+oUtatUJnXe
         BEWV2/iiZI2JnEvYq5E0bKMZ0SbCLA9AknW6Gsyc=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 94B7C60314
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=kramasub@codeaurora.org
From:   Karthikeyan Ramasubramanian <kramasub@codeaurora.org>
To:     corbet@lwn.net, andy.gross@linaro.org, david.brown@linaro.org,
        robh+dt@kernel.org, mark.rutland@arm.com, wsa@the-dreams.de,
        gregkh@linuxfoundation.org
Cc:     Karthikeyan Ramasubramanian <kramasub@codeaurora.org>,
        linux-doc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-i2c@vger.kernel.org,
        linux-serial@vger.kernel.org, jslaby@suse.com,
        evgreen@chromium.org, acourbot@chromium.org, swboyd@chromium.org
Subject: [PATCH v4 6/6] arm64: dts: sdm845: Add I2C controller support
Date:   Wed, 14 Mar 2018 17:58:51 -0600
Message-Id: <1521071931-9294-7-git-send-email-kramasub@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1521071931-9294-1-git-send-email-kramasub@codeaurora.org>
References: <1521071931-9294-1-git-send-email-kramasub@codeaurora.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add I2C master controller support for a built-in test I2C slave.

Signed-off-by: Karthikeyan Ramasubramanian <kramasub@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts | 19 +++++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi    | 29 +++++++++++++++++++++++++++++
 2 files changed, 48 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
index ea3efc5..69445f1 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
@@ -27,6 +27,10 @@
 		serial@a84000 {
 			status = "okay";
 		};
+
+		i2c@a88000 {
+			status = "okay";
+		};
 	};
 
 	pinctrl@3400000 {
@@ -50,5 +54,20 @@
 				bias-pull-down;
 			};
 		};
+
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
+				bias-pull-up;
+			};
+		};
 	};
 };
diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 59334d9..9ef056f 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -209,6 +209,21 @@
 					pins = "gpio4", "gpio5";
 				};
 			};
+
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
 		};
 
 		timer@17c90000 {
@@ -309,6 +324,20 @@
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
