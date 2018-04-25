Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 618547E27E
	for <lwn-linux-doc@archive.lwn.net>; Wed, 25 Apr 2018 13:00:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753910AbeDYMzW (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 25 Apr 2018 08:55:22 -0400
Received: from lelnx193.ext.ti.com ([198.47.27.77]:11908 "EHLO
        lelnx193.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753040AbeDYMzT (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 25 Apr 2018 08:55:19 -0400
Received: from dflxv15.itg.ti.com ([128.247.5.124])
        by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id w3PCtAK8009589;
        Wed, 25 Apr 2018 07:55:10 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
        s=ti-com-17Q1; t=1524660910;
        bh=LKDI7DeKcIaKXL2K4YwBpse7DuwKsNFwXO69jsOg8v0=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=VH3c9PnxCKvPEJme/GqhwNcpSdjpTG3lMApeBVTL0KU4uZVJkw09Wj13OUPxzasIO
         jBPTMdSBv1P/bkqv5YYArB5D4K18CWykmfBfwsDwtQ0/QE4kOgUc2SQ7kyZSCgNcf3
         gbrjoM7jwZ2Ld91IXjUgdnTVJR2suhceRHTerrY4=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3PCtAU7023285;
        Wed, 25 Apr 2018 07:55:10 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3; Wed, 25
 Apr 2018 07:55:09 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend Transport;
 Wed, 25 Apr 2018 07:55:09 -0500
Received: from a0393678ub.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3PCt1SE021671;
        Wed, 25 Apr 2018 07:55:05 -0500
From:   Kishon Vijay Abraham I <kishon@ti.com>
To:     =?UTF-8?q?Beno=C3=AEt=20Cousson=20?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>
CC:     Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <linux-doc@vger.kernel.org>, <kishon@ti.com>,
        <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>
Subject: [PATCH v3 01/15] ARM: dts: dra72-evm-common: Remove mmc specific pinmux
Date:   Wed, 25 Apr 2018 18:24:35 +0530
Message-ID: <20180425125449.19755-2-kishon@ti.com>
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

mmc specific pinmux is selected from dra72x-mmc-iodelay.dtsi, so remove
it from dra72-evm-common.dtsi.

Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
---
 arch/arm/boot/dts/dra72-evm-common.dtsi | 27 -------------------------
 1 file changed, 27 deletions(-)

diff --git a/arch/arm/boot/dts/dra72-evm-common.dtsi b/arch/arm/boot/dts/dra72-evm-common.dtsi
index e85f560a2f78..8e3b185d864b 100644
--- a/arch/arm/boot/dts/dra72-evm-common.dtsi
+++ b/arch/arm/boot/dts/dra72-evm-common.dtsi
@@ -174,33 +174,6 @@
 };
 
 &dra7_pmx_core {
-	mmc1_pins_default: mmc1_pins_default {
-		pinctrl-single,pins = <
-			DRA7XX_CORE_IOPAD(0x376c, PIN_INPUT | MUX_MODE14)	/* mmc1sdcd.gpio219 */
-			DRA7XX_CORE_IOPAD(0x3754, PIN_INPUT_PULLUP | MUX_MODE0) /* mmc1_clk.clk */
-			DRA7XX_CORE_IOPAD(0x3758, PIN_INPUT_PULLUP | MUX_MODE0) /* mmc1_cmd.cmd */
-			DRA7XX_CORE_IOPAD(0x375c, PIN_INPUT_PULLUP | MUX_MODE0) /* mmc1_dat0.dat0 */
-			DRA7XX_CORE_IOPAD(0x3760, PIN_INPUT_PULLUP | MUX_MODE0) /* mmc1_dat1.dat1 */
-			DRA7XX_CORE_IOPAD(0x3764, PIN_INPUT_PULLUP | MUX_MODE0) /* mmc1_dat2.dat2 */
-			DRA7XX_CORE_IOPAD(0x3768, PIN_INPUT_PULLUP | MUX_MODE0) /* mmc1_dat3.dat3 */
-		>;
-	};
-
-	mmc2_pins_default: mmc2_pins_default {
-		pinctrl-single,pins = <
-			DRA7XX_CORE_IOPAD(0x349c, PIN_INPUT_PULLUP | MUX_MODE1) /* gpmc_a23.mmc2_clk */
-			DRA7XX_CORE_IOPAD(0x34b0, PIN_INPUT_PULLUP | MUX_MODE1) /* gpmc_cs1.mmc2_cmd */
-			DRA7XX_CORE_IOPAD(0x34a0, PIN_INPUT_PULLUP | MUX_MODE1) /* gpmc_a24.mmc2_dat0 */
-			DRA7XX_CORE_IOPAD(0x34a4, PIN_INPUT_PULLUP | MUX_MODE1) /* gpmc_a25.mmc2_dat1 */
-			DRA7XX_CORE_IOPAD(0x34a8, PIN_INPUT_PULLUP | MUX_MODE1) /* gpmc_a26.mmc2_dat2 */
-			DRA7XX_CORE_IOPAD(0x34ac, PIN_INPUT_PULLUP | MUX_MODE1) /* gpmc_a27.mmc2_dat3 */
-			DRA7XX_CORE_IOPAD(0x348c, PIN_INPUT_PULLUP | MUX_MODE1) /* gpmc_a19.mmc2_dat4 */
-			DRA7XX_CORE_IOPAD(0x3490, PIN_INPUT_PULLUP | MUX_MODE1) /* gpmc_a20.mmc2_dat5 */
-			DRA7XX_CORE_IOPAD(0x3494, PIN_INPUT_PULLUP | MUX_MODE1) /* gpmc_a21.mmc2_dat6 */
-			DRA7XX_CORE_IOPAD(0x3498, PIN_INPUT_PULLUP | MUX_MODE1) /* gpmc_a22.mmc2_dat7 */
-		>;
-	};
-
 	dcan1_pins_default: dcan1_pins_default {
 		pinctrl-single,pins = <
 			DRA7XX_CORE_IOPAD(0x37d0, PIN_OUTPUT_PULLUP | MUX_MODE0) /* dcan1_tx */
-- 
2.17.0

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
