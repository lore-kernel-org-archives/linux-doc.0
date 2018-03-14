Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 024327E66E
	for <lwn-linux-doc@archive.lwn.net>; Wed, 14 Mar 2018 23:59:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751751AbeCNX7Z (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 14 Mar 2018 19:59:25 -0400
Received: from smtp.codeaurora.org ([198.145.29.96]:55376 "EHLO
        smtp.codeaurora.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751459AbeCNX7X (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 14 Mar 2018 19:59:23 -0400
Received: by smtp.codeaurora.org (Postfix, from userid 1000)
        id A083360F6D; Wed, 14 Mar 2018 23:59:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1521071962;
        bh=IFstV+cGjwu0/c14JZJztgy9xeGFvKxfvtyi4Jn3Zk8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=RkgQFdoJSTESpVZmoGYNDnGeSZwNXpYY5mx69Btanm9cqMg877MaJSwuXfBonaIJL
         Z/yj6QjC47XoGN0EzAEVSc8G/kKKrM62W4uaIdqFibfI8IH1nQTeaV7RH9EIGE474P
         0ZLC6tufQdlXAmkrNqQUZx0/KgGeZevcYT75vlkw=
Received: from codeaurora.org (i-global254.qualcomm.com [199.106.103.254])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: kramasub@smtp.codeaurora.org)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id CFA6660C5F;
        Wed, 14 Mar 2018 23:59:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=codeaurora.org;
        s=default; t=1521071957;
        bh=IFstV+cGjwu0/c14JZJztgy9xeGFvKxfvtyi4Jn3Zk8=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=YAKagdXf3Ft9xTrWo38VdWeKBTICCEia1a1Nv6SehrIimaarm66eyiE7q4YH0M2N2
         Z0yx55gzi8viZwd+4QVme0tAGQlWy0WyYvhyspsczSAXOsGERyzvStppdHnLYZmKaX
         Io8ewRb86XFKzEuOwmb8f8rUkxWpjA8oZYRvi+qc=
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org CFA6660C5F
Authentication-Results: pdx-caf-mail.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: pdx-caf-mail.web.codeaurora.org; spf=none smtp.mailfrom=kramasub@codeaurora.org
From:   Karthikeyan Ramasubramanian <kramasub@codeaurora.org>
To:     corbet@lwn.net, andy.gross@linaro.org, david.brown@linaro.org,
        robh+dt@kernel.org, mark.rutland@arm.com, wsa@the-dreams.de,
        gregkh@linuxfoundation.org
Cc:     Rajendra Nayak <rnayak@codeaurora.org>, linux-doc@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-i2c@vger.kernel.org, linux-serial@vger.kernel.org,
        jslaby@suse.com, evgreen@chromium.org, acourbot@chromium.org,
        swboyd@chromium.org
Subject: [PATCH v4 5/6] arm64: dts: sdm845: Add serial console support
Date:   Wed, 14 Mar 2018 17:58:50 -0600
Message-Id: <1521071931-9294-6-git-send-email-kramasub@codeaurora.org>
X-Mailer: git-send-email 1.9.1
In-Reply-To: <1521071931-9294-1-git-send-email-kramasub@codeaurora.org>
References: <1521071931-9294-1-git-send-email-kramasub@codeaurora.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Rajendra Nayak <rnayak@codeaurora.org>

Add the qup uart node and geni se instance needed to
support the serial console on the MTP.

Signed-off-by: Rajendra Nayak <rnayak@codeaurora.org>
---
 arch/arm64/boot/dts/qcom/sdm845-mtp.dts | 39 +++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/qcom/sdm845.dtsi    | 38 ++++++++++++++++++++++++++++++++
 2 files changed, 77 insertions(+)

diff --git a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
index 979ab49..ea3efc5 100644
--- a/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
+++ b/arch/arm64/boot/dts/qcom/sdm845-mtp.dts
@@ -12,4 +12,43 @@
 / {
 	model = "Qualcomm Technologies, Inc. SDM845 MTP";
 	compatible = "qcom,sdm845-mtp";
+
+	aliases {
+		serial0 = &uart2;
+	};
+
+	chosen {
+		stdout-path = "serial0";
+	};
+};
+
+&soc {
+	geniqup@ac0000 {
+		serial@a84000 {
+			status = "okay";
+		};
+	};
+
+	pinctrl@3400000 {
+		qup-uart2-default {
+			pinconf_tx {
+				pins = "gpio4";
+				drive-strength = <2>;
+				bias-disable;
+			};
+
+			pinconf_rx {
+				pins = "gpio5";
+				drive-strength = <2>;
+				bias-pull-up;
+			};
+		};
+
+		qup-uart2-sleep {
+			pinconf {
+				pins = "gpio4", "gpio5";
+				bias-pull-down;
+			};
+		};
+	};
 };
diff --git a/arch/arm64/boot/dts/qcom/sdm845.dtsi b/arch/arm64/boot/dts/qcom/sdm845.dtsi
index 32f8561..59334d9 100644
--- a/arch/arm64/boot/dts/qcom/sdm845.dtsi
+++ b/arch/arm64/boot/dts/qcom/sdm845.dtsi
@@ -6,6 +6,7 @@
  */
 
 #include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/clock/qcom,gcc-sdm845.h>
 
 / {
 	interrupt-parent = <&intc>;
@@ -194,6 +195,20 @@
 			#gpio-cells = <2>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
+
+			qup_uart2_default: qup-uart2-default {
+				pinmux {
+					function = "qup9";
+					pins = "gpio4", "gpio5";
+				};
+			};
+
+			qup_uart2_sleep: qup-uart2-sleep {
+				pinmux {
+					function = "gpio";
+					pins = "gpio4", "gpio5";
+				};
+			};
 		};
 
 		timer@17c90000 {
@@ -272,5 +287,28 @@
 			#interrupt-cells = <4>;
 			cell-index = <0>;
 		};
+
+		geniqup@ac0000 {
+			compatible = "qcom,geni-se-qup";
+			reg = <0xac0000 0x6000>;
+			clock-names = "m-ahb", "s-ahb";
+			clocks = <&gcc GCC_QUPV3_WRAP_1_M_AHB_CLK>,
+				 <&gcc GCC_QUPV3_WRAP_1_S_AHB_CLK>;
+			#address-cells = <1>;
+			#size-cells = <1>;
+			ranges;
+
+			uart2: serial@a84000 {
+				compatible = "qcom,geni-debug-uart";
+				reg = <0xa84000 0x4000>;
+				clock-names = "se";
+				clocks = <&gcc GCC_QUPV3_WRAP1_S1_CLK>;
+				pinctrl-names = "default", "sleep";
+				pinctrl-0 = <&qup_uart2_default>;
+				pinctrl-1 = <&qup_uart2_sleep>;
+				interrupts = <GIC_SPI 354 IRQ_TYPE_LEVEL_HIGH>;
+				status = "disabled";
+			};
+		};
 	};
 };
-- 
Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
a Linux Foundation Collaborative Project

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
