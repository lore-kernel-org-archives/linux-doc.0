Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 216437E6A5
	for <lwn-linux-doc@archive.lwn.net>; Wed, 25 Apr 2018 13:01:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753672AbeDYNBF (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 25 Apr 2018 09:01:05 -0400
Received: from lelnx194.ext.ti.com ([198.47.27.80]:65271 "EHLO
        lelnx194.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753524AbeDYMzU (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 25 Apr 2018 08:55:20 -0400
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
        by lelnx194.ext.ti.com (8.15.1/8.15.1) with ESMTP id w3PCtEmA026358;
        Wed, 25 Apr 2018 07:55:14 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
        s=ti-com-17Q1; t=1524660914;
        bh=QA7pz8LuTAQPZx3B1jpxsl7P0LEWL8YmpUFJoD5hx6Q=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=admh9q1GRZzi9x5k25MDxq2Mv8Fphpo/batp11qEW6qSopH0G9olDUEkVXSS98ajg
         GsLXGQP8+AlORGJSE3OLWAZwSgAt7gc2LI6U7z0DHyEUiG4ArXtMbZQGBCUM0f7jg5
         4AJdNTo19/47n6FSJV+c5FJRpicL+/0xVoMwoUhQ=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3PCtDXK023872;
        Wed, 25 Apr 2018 07:55:13 -0500
Received: from DFLE111.ent.ti.com (10.64.6.32) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3; Wed, 25
 Apr 2018 07:55:12 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE111.ent.ti.com
 (10.64.6.32) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend Transport;
 Wed, 25 Apr 2018 07:55:12 -0500
Received: from a0393678ub.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3PCt1SF021671;
        Wed, 25 Apr 2018 07:55:09 -0500
From:   Kishon Vijay Abraham I <kishon@ti.com>
To:     =?UTF-8?q?Beno=C3=AEt=20Cousson=20?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>
CC:     Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <linux-doc@vger.kernel.org>, <kishon@ti.com>,
        <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>
Subject: [PATCH v3 02/15] ARM: dts: dra71-evm: Add "vqmmc-supply" property for mmc2
Date:   Wed, 25 Apr 2018 18:24:36 +0530
Message-ID: <20180425125449.19755-3-kishon@ti.com>
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

Add "vqmmc-supply" property for mmc2 to indicate the supply connected
to the IO lines.

Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
---
 arch/arm/boot/dts/dra71-evm.dts | 1 +
 1 file changed, 1 insertion(+)

diff --git a/arch/arm/boot/dts/dra71-evm.dts b/arch/arm/boot/dts/dra71-evm.dts
index ebc4bbae981e..64c57d87ca2f 100644
--- a/arch/arm/boot/dts/dra71-evm.dts
+++ b/arch/arm/boot/dts/dra71-evm.dts
@@ -204,6 +204,7 @@
 	pinctrl-2 = <&mmc2_pins_ddr_rev20 &mmc2_iodelay_ddr_conf>;
 	pinctrl-3 = <&mmc2_pins_hs200 &mmc2_iodelay_hs200_rev20_conf>;
 	vmmc-supply = <&evm_1v8_sw>;
+	vqmmc-supply = <&evm_1v8_sw>;
 };
 
 &mac {
-- 
2.17.0

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
