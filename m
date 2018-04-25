Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C70BE7E27E
	for <lwn-linux-doc@archive.lwn.net>; Wed, 25 Apr 2018 12:58:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754039AbeDYMzm (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 25 Apr 2018 08:55:42 -0400
Received: from fllnx209.ext.ti.com ([198.47.19.16]:15275 "EHLO
        fllnx209.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751525AbeDYMzg (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 25 Apr 2018 08:55:36 -0400
Received: from dflxv15.itg.ti.com ([128.247.5.124])
        by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w3PCtUSl024574;
        Wed, 25 Apr 2018 07:55:30 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
        s=ti-com-17Q1; t=1524660930;
        bh=HEZH9WVimIGT961IwwGwIWEO/jtAhjlDupw51Y+c1ls=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=Xap7XcxQPo/qJmvI7bjMn9W+fD3hNEaOQFTsubi5tu7aq1nyJ932gtks26DrWdHeL
         ddVseaacQs4lDqCPMbTZZQSZjKtgltOa0skSq1XI40tiKtfX8BMoyQA76SS96eegBB
         xyXBj4ykCE/gr8GbbQybbegUrxjHe3QOSyE9nDzU=
Received: from DFLE103.ent.ti.com (dfle103.ent.ti.com [10.64.6.24])
        by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3PCtUlp024125;
        Wed, 25 Apr 2018 07:55:30 -0500
Received: from DFLE104.ent.ti.com (10.64.6.25) by DFLE103.ent.ti.com
 (10.64.6.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3; Wed, 25
 Apr 2018 07:55:29 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend Transport;
 Wed, 25 Apr 2018 07:55:29 -0500
Received: from a0393678ub.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3PCt1SK021671;
        Wed, 25 Apr 2018 07:55:26 -0500
From:   Kishon Vijay Abraham I <kishon@ti.com>
To:     =?UTF-8?q?Beno=C3=AEt=20Cousson=20?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>
CC:     Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <linux-doc@vger.kernel.org>, <kishon@ti.com>,
        <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>
Subject: [PATCH v3 07/15] ARM: dts: dra71-evm: Use pinctrl group from dra72x-mmc-iodelay.dtsi to select pulldown
Date:   Wed, 25 Apr 2018 18:24:41 +0530
Message-ID: <20180425125449.19755-8-kishon@ti.com>
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

commit 0e43884cca77218d2eccc331396e8 ("ARM: dts: dra71-evm: Select pull
down for mmc1_clk line in default mode") modified mmc1_pins_default
pinctrl group in dra71-evm.dts to change the CLK line to
PIN_INPUT_PULLDOWN. However instead of changing the pinctrl group,
use the new pinctrl group "mmc1_pins_default_no_clk_pu" in
dra72x-mmc-iodelay added specifically to be used for CLK line
without external pull up.

Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
---
 arch/arm/boot/dts/dra71-evm.dts | 15 +--------------
 1 file changed, 1 insertion(+), 14 deletions(-)

diff --git a/arch/arm/boot/dts/dra71-evm.dts b/arch/arm/boot/dts/dra71-evm.dts
index 64c57d87ca2f..8065678b8016 100644
--- a/arch/arm/boot/dts/dra71-evm.dts
+++ b/arch/arm/boot/dts/dra71-evm.dts
@@ -50,19 +50,6 @@
 	};
 };
 
-&dra7_pmx_core {
-	mmc1_pins_default: mmc1_pins_default {
-		pinctrl-single,pins = <
-			DRA7XX_CORE_IOPAD(0x3754, PIN_INPUT_PULLDOWN | MUX_MODE0) /* mmc1_clk.clk */
-			DRA7XX_CORE_IOPAD(0x3758, PIN_INPUT_PULLUP | MUX_MODE0) /* mmc1_cmd.cmd */
-			DRA7XX_CORE_IOPAD(0x375c, PIN_INPUT_PULLUP | MUX_MODE0) /* mmc1_dat0.dat0 */
-			DRA7XX_CORE_IOPAD(0x3760, PIN_INPUT_PULLUP | MUX_MODE0) /* mmc1_dat1.dat1 */
-			DRA7XX_CORE_IOPAD(0x3764, PIN_INPUT_PULLUP | MUX_MODE0) /* mmc1_dat2.dat2 */
-			DRA7XX_CORE_IOPAD(0x3768, PIN_INPUT_PULLUP | MUX_MODE0) /* mmc1_dat3.dat3 */
-		>;
-	};
-};
-
 &i2c1 {
 	status = "okay";
 	clock-frequency = <400000>;
@@ -187,7 +174,7 @@
 
 &mmc1 {
 	pinctrl-names = "default", "hs", "sdr12", "sdr25", "sdr50", "ddr50", "sdr104";
-	pinctrl-0 = <&mmc1_pins_default>;
+	pinctrl-0 = <&mmc1_pins_default_no_clk_pu>;
 	pinctrl-1 = <&mmc1_pins_hs>;
 	pinctrl-2 = <&mmc1_pins_sdr12>;
 	pinctrl-3 = <&mmc1_pins_sdr25>;
-- 
2.17.0

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
