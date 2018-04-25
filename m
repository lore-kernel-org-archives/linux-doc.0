Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 400E87E27E
	for <lwn-linux-doc@archive.lwn.net>; Wed, 25 Apr 2018 12:58:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753686AbeDYM6N (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 25 Apr 2018 08:58:13 -0400
Received: from lelnx194.ext.ti.com ([198.47.27.80]:65307 "EHLO
        lelnx194.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754112AbeDYM4A (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 25 Apr 2018 08:56:00 -0400
Received: from dflxv15.itg.ti.com ([128.247.5.124])
        by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w3PCtrB7026427;
        Wed, 25 Apr 2018 07:55:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
        s=ti-com-17Q1; t=1524660953;
        bh=HAgagsvGzfahI8+lnR7tNNB9kQQtXaZ0eWnKRiHKiik=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=sbpW505arIGflRTJY20IvWPs/WaK1UNCjdy5vjpioUBB2H9zprBVrPpfaQ8snlSMB
         Lj50/yO7XHalOevNez5oZwlgbpA+F5xshZRXGBWMSM1KvIiLEDavPKQ4x9LzUBIlYs
         8WEZ48tYHngF7DDztkd8oVvOfDjczw6qz8lse8vM=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
        by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3PCtrS2024500;
        Wed, 25 Apr 2018 07:55:53 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3; Wed, 25
 Apr 2018 07:55:53 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend Transport;
 Wed, 25 Apr 2018 07:55:53 -0500
Received: from a0393678ub.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3PCt1SQ021671;
        Wed, 25 Apr 2018 07:55:50 -0500
From:   Kishon Vijay Abraham I <kishon@ti.com>
To:     =?UTF-8?q?Beno=C3=AEt=20Cousson=20?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>
CC:     Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <linux-doc@vger.kernel.org>, <kishon@ti.com>,
        <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>
Subject: [PATCH v3 13/15] ARM: dts: dra7: Use sdhci-omap programming model
Date:   Wed, 25 Apr 2018 18:24:47 +0530
Message-ID: <20180425125449.19755-14-kishon@ti.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180425125449.19755-1-kishon@ti.com>
References: <20180425125449.19755-1-kishon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Use sdhci-omap programming model based on the generic sdhci
library for programming the eMMC/SD/SDIO controller.

Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
---
 .../boot/dts/am57xx-beagle-x15-common.dtsi    |  4 +--
 arch/arm/boot/dts/am57xx-beagle-x15.dts       |  1 +
 arch/arm/boot/dts/am57xx-idk-common.dtsi      |  3 ++-
 arch/arm/boot/dts/dra7-evm.dts                |  1 +
 arch/arm/boot/dts/dra7.dtsi                   | 27 +++++++------------
 arch/arm/boot/dts/dra72-evm-common.dtsi       |  2 +-
 arch/arm/boot/dts/dra76-evm.dts               |  3 ++-
 7 files changed, 19 insertions(+), 22 deletions(-)

diff --git a/arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi b/arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi
index 6204a266212a..ad953113cefb 100644
--- a/arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi
+++ b/arch/arm/boot/dts/am57xx-beagle-x15-common.dtsi
@@ -444,8 +444,8 @@
 	vmmc-supply = <&vdd_3v3>;
 	vqmmc-supply = <&vdd_3v3>;
 	bus-width = <8>;
-	ti,non-removable;
-	cap-mmc-dual-data-rate;
+	non-removable;
+	no-1-8-v;
 };
 
 &sata {
diff --git a/arch/arm/boot/dts/am57xx-beagle-x15.dts b/arch/arm/boot/dts/am57xx-beagle-x15.dts
index d6689106d2a8..c393de8a2391 100644
--- a/arch/arm/boot/dts/am57xx-beagle-x15.dts
+++ b/arch/arm/boot/dts/am57xx-beagle-x15.dts
@@ -25,6 +25,7 @@
 	pinctrl-1 = <&mmc1_pins_hs>;
 
 	vmmc-supply = <&ldo1_reg>;
+	no-1-8-v;
 };
 
 &mmc2 {
diff --git a/arch/arm/boot/dts/am57xx-idk-common.dtsi b/arch/arm/boot/dts/am57xx-idk-common.dtsi
index 43cdf523a8a0..605e7ec1b218 100644
--- a/arch/arm/boot/dts/am57xx-idk-common.dtsi
+++ b/arch/arm/boot/dts/am57xx-idk-common.dtsi
@@ -423,8 +423,9 @@
 	vmmc-supply = <&v3_3d>;
 	vqmmc-supply = <&v3_3d>;
 	bus-width = <8>;
-	ti,non-removable;
+	non-removable;
 	max-frequency = <96000000>;
+	no-1-8-v;
 };
 
 &dcan1 {
diff --git a/arch/arm/boot/dts/dra7-evm.dts b/arch/arm/boot/dts/dra7-evm.dts
index 704947cbef48..0894593860d6 100644
--- a/arch/arm/boot/dts/dra7-evm.dts
+++ b/arch/arm/boot/dts/dra7-evm.dts
@@ -377,6 +377,7 @@
 	vmmc-supply = <&evm_1v8_sw>;
 	vqmmc-supply = <&evm_1v8_sw>;
 	bus-width = <8>;
+	non-removable;
 	pinctrl-names = "default", "hs", "ddr_1_8v-rev11", "ddr_1_8v", "hs200_1_8v-rev11", "hs200_1_8v";
 	pinctrl-0 = <&mmc2_pins_default>;
 	pinctrl-1 = <&mmc2_pins_hs>;
diff --git a/arch/arm/boot/dts/dra7.dtsi b/arch/arm/boot/dts/dra7.dtsi
index f4ddd86f2c77..ae2f8dd46328 100644
--- a/arch/arm/boot/dts/dra7.dtsi
+++ b/arch/arm/boot/dts/dra7.dtsi
@@ -1079,14 +1079,10 @@
 		};
 
 		mmc1: mmc@4809c000 {
-			compatible = "ti,omap4-hsmmc";
+			compatible = "ti,dra7-sdhci";
 			reg = <0x4809c000 0x400>;
 			interrupts = <GIC_SPI 78 IRQ_TYPE_LEVEL_HIGH>;
 			ti,hwmods = "mmc1";
-			ti,dual-volt;
-			ti,needs-special-reset;
-			dmas = <&sdma_xbar 61>, <&sdma_xbar 62>;
-			dma-names = "tx", "rx";
 			status = "disabled";
 			pbias-supply = <&pbias_mmc_reg>;
 			max-frequency = <192000000>;
@@ -1100,40 +1096,37 @@
 		};
 
 		mmc2: mmc@480b4000 {
-			compatible = "ti,omap4-hsmmc";
+			compatible = "ti,dra7-sdhci";
 			reg = <0x480b4000 0x400>;
 			interrupts = <GIC_SPI 81 IRQ_TYPE_LEVEL_HIGH>;
 			ti,hwmods = "mmc2";
-			ti,needs-special-reset;
-			dmas = <&sdma_xbar 47>, <&sdma_xbar 48>;
-			dma-names = "tx", "rx";
 			status = "disabled";
 			max-frequency = <192000000>;
+			/* SDR104/DDR50/SDR50 bits in CAPA2 is not supported */
+			sdhci-caps-mask = <0x7 0x0>;
 		};
 
 		mmc3: mmc@480ad000 {
-			compatible = "ti,omap4-hsmmc";
+			compatible = "ti,dra7-sdhci";
 			reg = <0x480ad000 0x400>;
 			interrupts = <GIC_SPI 89 IRQ_TYPE_LEVEL_HIGH>;
 			ti,hwmods = "mmc3";
-			ti,needs-special-reset;
-			dmas = <&sdma_xbar 77>, <&sdma_xbar 78>;
-			dma-names = "tx", "rx";
 			status = "disabled";
 			/* Errata i887 limits max-frequency of MMC3 to 64 MHz */
 			max-frequency = <64000000>;
+			/* SDMA is not supported */
+			sdhci-caps-mask = <0x0 0x400000>;
 		};
 
 		mmc4: mmc@480d1000 {
-			compatible = "ti,omap4-hsmmc";
+			compatible = "ti,dra7-sdhci";
 			reg = <0x480d1000 0x400>;
 			interrupts = <GIC_SPI 91 IRQ_TYPE_LEVEL_HIGH>;
 			ti,hwmods = "mmc4";
-			ti,needs-special-reset;
-			dmas = <&sdma_xbar 57>, <&sdma_xbar 58>;
-			dma-names = "tx", "rx";
 			status = "disabled";
 			max-frequency = <192000000>;
+			/* SDMA is not supported */
+			sdhci-caps-mask = <0x0 0x400000>;
 		};
 
 		mmu0_dsp1: mmu@40d01000 {
diff --git a/arch/arm/boot/dts/dra72-evm-common.dtsi b/arch/arm/boot/dts/dra72-evm-common.dtsi
index 1e4d36e33a1b..5a763b1f5883 100644
--- a/arch/arm/boot/dts/dra72-evm-common.dtsi
+++ b/arch/arm/boot/dts/dra72-evm-common.dtsi
@@ -413,7 +413,7 @@
 	pinctrl-names = "default";
 	pinctrl-0 = <&mmc2_pins_default>;
 	bus-width = <8>;
-	ti,non-removable;
+	non-removable;
 	max-frequency = <192000000>;
 };
 
diff --git a/arch/arm/boot/dts/dra76-evm.dts b/arch/arm/boot/dts/dra76-evm.dts
index ad154c7b0632..c07f0051844d 100644
--- a/arch/arm/boot/dts/dra76-evm.dts
+++ b/arch/arm/boot/dts/dra76-evm.dts
@@ -327,7 +327,7 @@
 &mmc1 {
 	status = "okay";
 	vmmc-supply = <&vio_3v3_sd>;
-	vmmc_aux-supply = <&ldo4_reg>;
+	vqmmc-supply = <&ldo4_reg>;
 	bus-width = <4>;
 	/*
 	 * SDCD signal is not being used here - using the fact that GPIO mode
@@ -344,6 +344,7 @@
 	vmmc-supply = <&vio_1v8>;
 	vqmmc-supply = <&vio_1v8>;
 	bus-width = <8>;
+	non-removable;
 	pinctrl-names = "default", "hs", "ddr_1_8v", "hs200_1_8v";
 	pinctrl-0 = <&mmc2_pins_default>;
 	pinctrl-1 = <&mmc2_pins_default>;
-- 
2.17.0

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
