Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9CDC67E27E
	for <lwn-linux-doc@archive.lwn.net>; Wed, 25 Apr 2018 13:00:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754041AbeDYNA2 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 25 Apr 2018 09:00:28 -0400
Received: from lelnx194.ext.ti.com ([198.47.27.80]:65277 "EHLO
        lelnx194.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753145AbeDYMzX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 25 Apr 2018 08:55:23 -0400
Received: from dflxv15.itg.ti.com ([128.247.5.124])
        by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w3PCtGGT026371;
        Wed, 25 Apr 2018 07:55:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
        s=ti-com-17Q1; t=1524660916;
        bh=IXbdjtuNgH/SSxPVwzZueFx6Fa0kyMotH7MljW/r65Q=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=kV6u7zooVYJFBMov6a4WW35LMdY76ri0P9GbMPzk9xxBgWVi4/4LiOyAn6zCs08KP
         4/VnlCKfyA2Gg4mGB2sZev4AtFa9UESBolGetxD8/7RwCUsChPigvp/uUfOpuMXSp0
         pZgVOPcuxyIkr3oV9buGqMEVrRh5ZI4eVhwJL7Og=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3PCtGJj023604;
        Wed, 25 Apr 2018 07:55:16 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3; Wed, 25
 Apr 2018 07:55:16 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend Transport;
 Wed, 25 Apr 2018 07:55:15 -0500
Received: from a0393678ub.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3PCt1SG021671;
        Wed, 25 Apr 2018 07:55:13 -0500
From:   Kishon Vijay Abraham I <kishon@ti.com>
To:     =?UTF-8?q?Beno=C3=AEt=20Cousson=20?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>
CC:     Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <linux-doc@vger.kernel.org>, <kishon@ti.com>,
        <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>
Subject: [PATCH v3 03/15] ARM: dts: dra72x-mmc-iodelay: Add a new pinctrl group for clk line without pullup
Date:   Wed, 25 Apr 2018 18:24:37 +0530
Message-ID: <20180425125449.19755-4-kishon@ti.com>
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

During a short period when the bus voltage is switched from 3.3v to 1.8v,
(to enumerate UHS mode), the mmc module is disabled and the mmc IO lines
are kept in a state according to the programmed pad mux pull type.

According to 4.2.4.2 Timing to Switch Signal Voltage in "SD Specifications
Part 1 Physical Layer Specification Version 5.00 February 22, 2016", the
host should hold CLK low for at least 5ms.

In order to keep the card line low during voltage switch, the pad mux of
mmc1_clk line should be configured to pull down.

Add a new pinctrl group for clock line without pullup to be used in boards
where mmc1_clk line is not connected to an external pullup.

Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
---
 arch/arm/boot/dts/dra72x-mmc-iodelay.dtsi | 11 +++++++++++
 1 file changed, 11 insertions(+)

diff --git a/arch/arm/boot/dts/dra72x-mmc-iodelay.dtsi b/arch/arm/boot/dts/dra72x-mmc-iodelay.dtsi
index 088013c6dc6e..c9351eaf97f0 100644
--- a/arch/arm/boot/dts/dra72x-mmc-iodelay.dtsi
+++ b/arch/arm/boot/dts/dra72x-mmc-iodelay.dtsi
@@ -51,6 +51,17 @@
 		>;
 	};
 
+	mmc1_pins_default_no_clk_pu: mmc1_pins_default_no_clk_pu {
+		pinctrl-single,pins = <
+			DRA7XX_CORE_IOPAD(0x3754, PIN_INPUT_PULLDOWN | MUX_MODE0) /* mmc1_clk.clk */
+			DRA7XX_CORE_IOPAD(0x3758, PIN_INPUT_PULLUP | MUX_MODE0) /* mmc1_cmd.cmd */
+			DRA7XX_CORE_IOPAD(0x375c, PIN_INPUT_PULLUP | MUX_MODE0) /* mmc1_dat0.dat0 */
+			DRA7XX_CORE_IOPAD(0x3760, PIN_INPUT_PULLUP | MUX_MODE0) /* mmc1_dat1.dat1 */
+			DRA7XX_CORE_IOPAD(0x3764, PIN_INPUT_PULLUP | MUX_MODE0) /* mmc1_dat2.dat2 */
+			DRA7XX_CORE_IOPAD(0x3768, PIN_INPUT_PULLUP | MUX_MODE0) /* mmc1_dat3.dat3 */
+		>;
+	};
+
 	mmc1_pins_sdr12: mmc1_pins_sdr12 {
 		pinctrl-single,pins = <
 			DRA7XX_CORE_IOPAD(0x3754, PIN_INPUT_PULLUP | MUX_MODE0)	/* mmc1_clk.clk */
-- 
2.17.0

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
