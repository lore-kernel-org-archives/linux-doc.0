Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C2C1C7E27E
	for <lwn-linux-doc@archive.lwn.net>; Wed, 25 Apr 2018 12:56:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753367AbeDYM4G (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 25 Apr 2018 08:56:06 -0400
Received: from lelnx193.ext.ti.com ([198.47.27.77]:11944 "EHLO
        lelnx193.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753875AbeDYMzy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 25 Apr 2018 08:55:54 -0400
Received: from dflxv15.itg.ti.com ([128.247.5.124])
        by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w3PCtkWU009660;
        Wed, 25 Apr 2018 07:55:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
        s=ti-com-17Q1; t=1524660946;
        bh=OBIfaV+eQNVKqOh2ZvqlXuND80haQPrckGg5+ju9f8c=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=MYwZT3oqNvcKzXDhnPLfW/lBe7I3EJjYk1zwbAknc0PyMaSp6+hsw0mo80i/wZJXT
         rcqRLE7KgdSZdPkkPaBjg+Gq7z74/C4+bUq/zsqvqOfJUahFCMYrZBtM66AxUSnhub
         Wb0IV+QcoS8BREmy+6Msj2ZWfVq9mtBeom938y0w=
Received: from DLEE102.ent.ti.com (dlee102.ent.ti.com [157.170.170.32])
        by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3PCtkq4024436;
        Wed, 25 Apr 2018 07:55:46 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3; Wed, 25
 Apr 2018 07:55:45 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend Transport;
 Wed, 25 Apr 2018 07:55:45 -0500
Received: from a0393678ub.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3PCt1SO021671;
        Wed, 25 Apr 2018 07:55:41 -0500
From:   Kishon Vijay Abraham I <kishon@ti.com>
To:     =?UTF-8?q?Beno=C3=AEt=20Cousson=20?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>
CC:     Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <linux-doc@vger.kernel.org>, <kishon@ti.com>,
        <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        Hari Nagalla <hnagalla@ti.com>, Ido Yariv <ido@wizery.com>,
        Eyal Reizer <eyalr@ti.com>, Sekhar Nori <nsekhar@ti.com>
Subject: [PATCH v3 11/15] ARM: dts: dra7-evm: Add wilink8 wlan support
Date:   Wed, 25 Apr 2018 18:24:45 +0530
Message-ID: <20180425125449.19755-12-kishon@ti.com>
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

From: Hari Nagalla <hnagalla@ti.com>

The wilink module is a combo wireless connectivity sdio
card based on Texas Instrument's wl18xx solution. It is a
4-wire, 1.8V, embedded sdio wlan device with an external
irq line and is power-controlled by a gpio-based fixed
regulator.

Add pinmux configuration and IODelay values for MMC4.
On dra7-evm, MMC4 is used for connecting to wilink module.

IODelay data credits to :  Vishal Mahaveer <vishalm@ti.com>
and Sekhar Nori <nsekhar@ti.com>

Signed-off-by: Ido Yariv <ido@wizery.com>
Signed-off-by: Eyal Reizer <eyalr@ti.com>
Signed-off-by: Hari Nagalla <hnagalla@ti.com>
Signed-off-by: Sekhar Nori <nsekhar@ti.com>
Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
---
 arch/arm/boot/dts/dra7-evm-common.dtsi | 15 +++++++++++++++
 arch/arm/boot/dts/dra7-evm.dts         | 25 +++++++++++++++++++++++++
 2 files changed, 40 insertions(+)

diff --git a/arch/arm/boot/dts/dra7-evm-common.dtsi b/arch/arm/boot/dts/dra7-evm-common.dtsi
index 05a7b1a01bc3..3590c40fc112 100644
--- a/arch/arm/boot/dts/dra7-evm-common.dtsi
+++ b/arch/arm/boot/dts/dra7-evm-common.dtsi
@@ -260,3 +260,18 @@
 &pcie1_rc {
 	status = "okay";
 };
+
+&mmc4 {
+	bus-width = <4>;
+	cap-power-off-card;
+	keep-power-in-suspend;
+	non-removable;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	wlcore: wlcore@2 {
+		compatible = "ti,wl1835";
+		reg = <2>;
+		interrupt-parent = <&gpio5>;
+		interrupts = <7 IRQ_TYPE_EDGE_RISING>;
+	};
+};
diff --git a/arch/arm/boot/dts/dra7-evm.dts b/arch/arm/boot/dts/dra7-evm.dts
index 181289a28ca1..704947cbef48 100644
--- a/arch/arm/boot/dts/dra7-evm.dts
+++ b/arch/arm/boot/dts/dra7-evm.dts
@@ -96,6 +96,16 @@
 		regulator-boot-on;
 	};
 
+	vmmcwl_fixed: fixedregulator-mmcwl {
+		compatible = "regulator-fixed";
+		regulator-name = "vmmcwl_fixed";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		gpio = <&gpio5 8 0>;
+		startup-delay-us = <70000>;
+		enable-active-high;
+	};
+
 	extcon_usb2: extcon_usb2 {
 		compatible = "linux,extcon-usb-gpio";
 		id-gpio = <&pcf_gpio_21 2 GPIO_ACTIVE_HIGH>;
@@ -376,6 +386,21 @@
 	pinctrl-5 = <&mmc2_pins_hs200 &mmc2_iodelay_hs200_rev20_conf>;
 };
 
+&mmc4 {
+	status = "okay";
+	vmmc-supply = <&evm_3v6>;
+	vqmmc-supply = <&vmmcwl_fixed>;
+	pinctrl-names = "default-rev11", "default", "hs-rev11", "hs", "sdr12-rev11", "sdr12", "sdr25-rev11", "sdr25";
+	pinctrl-0 = <&mmc4_pins_default &mmc4_iodelay_ds_rev11_conf>;
+	pinctrl-1 = <&mmc4_pins_default &mmc4_iodelay_ds_rev20_conf>;
+	pinctrl-2 = <&mmc4_pins_hs &mmc4_iodelay_sdr12_hs_sdr25_rev11_conf>;
+	pinctrl-3 = <&mmc4_pins_hs &mmc4_iodelay_sdr12_hs_sdr25_rev20_conf>;
+	pinctrl-4 = <&mmc4_pins_sdr12 &mmc4_iodelay_sdr12_hs_sdr25_rev11_conf>;
+	pinctrl-5 = <&mmc4_pins_sdr12 &mmc4_iodelay_sdr12_hs_sdr25_rev20_conf>;
+	pinctrl-6 = <&mmc4_pins_sdr25 &mmc4_iodelay_sdr12_hs_sdr25_rev11_conf>;
+	pinctrl-7 = <&mmc4_pins_sdr25 &mmc4_iodelay_sdr12_hs_sdr25_rev20_conf>;
+};
+
 &cpu0 {
 	vdd-supply = <&smps123_reg>;
 };
-- 
2.17.0

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
