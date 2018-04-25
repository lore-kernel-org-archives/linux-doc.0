Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id AD3A77E27E
	for <lwn-linux-doc@archive.lwn.net>; Wed, 25 Apr 2018 12:58:58 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754339AbeDYM6s (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 25 Apr 2018 08:58:48 -0400
Received: from fllnx210.ext.ti.com ([198.47.19.17]:61795 "EHLO
        fllnx210.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754023AbeDYMzl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 25 Apr 2018 08:55:41 -0400
Received: from dflxv15.itg.ti.com ([128.247.5.124])
        by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w3PCtYwK019443;
        Wed, 25 Apr 2018 07:55:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
        s=ti-com-17Q1; t=1524660934;
        bh=zNRgsgi/JdI3CXI5j5RUrnozTqkI83vKP7ELu+1XFlI=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=oQW6PPOJvUhG9gQT1c09v2ZxNfFLliGxynMDEc9GhT3xEYwBVeHnRqxM64hwZAx3f
         tOjPCQB9YwW6FN1o8DePoLay9Q5taQ2VxuWAgpGLYrcNjITHe0OIZhYsq4WQlU5HIg
         CZskzExJiJqvKLRRBkeeu8QnW3WkNIgkaQt7P9Sk=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
        by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3PCtYrB024211;
        Wed, 25 Apr 2018 07:55:34 -0500
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3; Wed, 25
 Apr 2018 07:55:33 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend Transport;
 Wed, 25 Apr 2018 07:55:33 -0500
Received: from a0393678ub.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3PCt1SL021671;
        Wed, 25 Apr 2018 07:55:30 -0500
From:   Kishon Vijay Abraham I <kishon@ti.com>
To:     =?UTF-8?q?Beno=C3=AEt=20Cousson=20?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>
CC:     Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <linux-doc@vger.kernel.org>, <kishon@ti.com>,
        <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        Sekhar Nori <nsekhar@ti.com>
Subject: [PATCH v3 08/15] ARM: dts: am574x-idk: Add pinmux configuration for MMC
Date:   Wed, 25 Apr 2018 18:24:42 +0530
Message-ID: <20180425125449.19755-9-kishon@ti.com>
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

From: Sekhar Nori <nsekhar@ti.com>

Include dra76x-mmc-iodelay.dtsi which has pinmux and IODelay
configuration values for the various MMC modes for am574x SoC
and use it in the pinctrl properties of MMC devicetree
nodes present in am574x-idk.dts.

Signed-off-by: Sekhar Nori <nsekhar@ti.com>
Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
---
 arch/arm/boot/dts/am574x-idk.dts | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/arch/arm/boot/dts/am574x-idk.dts b/arch/arm/boot/dts/am574x-idk.dts
index 41e12a382d2f..500235e6d1c6 100644
--- a/arch/arm/boot/dts/am574x-idk.dts
+++ b/arch/arm/boot/dts/am574x-idk.dts
@@ -7,6 +7,7 @@
 /dts-v1/;
 
 #include "dra76x.dtsi"
+#include "dra76x-mmc-iodelay.dtsi"
 #include "am572x-idk-common.dtsi"
 
 / {
@@ -20,3 +21,21 @@
 		spi-max-frequency = <96000000>;
 	};
 };
+
+&mmc1 {
+	pinctrl-names = "default", "hs", "sdr12", "sdr25", "sdr50", "ddr50", "sdr104";
+	pinctrl-0 = <&mmc1_pins_default_no_clk_pu>;
+	pinctrl-1 = <&mmc1_pins_hs>;
+	pinctrl-2 = <&mmc1_pins_default>;
+	pinctrl-3 = <&mmc1_pins_hs>;
+	pinctrl-4 = <&mmc1_pins_sdr50>;
+	pinctrl-5 = <&mmc1_pins_ddr50 &mmc1_iodelay_ddr_conf>;
+	pinctrl-6 = <&mmc1_pins_ddr50 &mmc1_iodelay_sdr104_conf>;
+};
+
+&mmc2 {
+	pinctrl-names = "default", "hs", "ddr_1_8v";
+	pinctrl-0 = <&mmc2_pins_default>;
+	pinctrl-1 = <&mmc2_pins_default>;
+	pinctrl-2 = <&mmc2_pins_default>;
+};
-- 
2.17.0

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
