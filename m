Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1749F7E27E
	for <lwn-linux-doc@archive.lwn.net>; Wed, 25 Apr 2018 13:01:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753872AbeDYMzU (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 25 Apr 2018 08:55:20 -0400
Received: from fllnx209.ext.ti.com ([198.47.19.16]:15250 "EHLO
        fllnx209.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751525AbeDYMzO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 25 Apr 2018 08:55:14 -0400
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
        by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w3PCt5na024347;
        Wed, 25 Apr 2018 07:55:05 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
        s=ti-com-17Q1; t=1524660905;
        bh=JTiqxyH23tdT14xxqyqxC8Nbq5P5Lb8WTH0wzy8jrHQ=;
        h=From:To:CC:Subject:Date;
        b=Mc4L3AyCfZ9kD3TPBEumi9yrKuIe6EhPML+CuoGP3oWFP1ZJA6hRABLueERad2DLr
         0y+GJsoLVD4utwfujksvvSbvnjglUEkMBxDmSdhElZD7pSWeHXKDDCPoPO9FL3Ps+/
         G/ozxq/3obIdCsk2m4Kh0LyuctPm6+TwW99JKnjA=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
        by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3PCt5Tl023267;
        Wed, 25 Apr 2018 07:55:05 -0500
Received: from DFLE109.ent.ti.com (10.64.6.30) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3; Wed, 25
 Apr 2018 07:55:05 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend Transport;
 Wed, 25 Apr 2018 07:55:04 -0500
Received: from a0393678ub.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3PCt1SD021671;
        Wed, 25 Apr 2018 07:55:02 -0500
From:   Kishon Vijay Abraham I <kishon@ti.com>
To:     =?UTF-8?q?Beno=C3=AEt=20Cousson=20?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>
CC:     Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <linux-doc@vger.kernel.org>, <kishon@ti.com>,
        <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>
Subject: [PATCH v3 00/15] dra7: mmc: Update mmc dt node to use sdhci-omap
Date:   Wed, 25 Apr 2018 18:24:34 +0530
Message-ID: <20180425125449.19755-1-kishon@ti.com>
X-Mailer: git-send-email 2.17.0
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Previous version of the patch series was sent here
https://lkml.org/lkml/2018/2/6/250

Most of the patches sent for v2 was merged. Remaining unmerged patches
from v2 and a few additional patches are sent here.

This series should be merged only after [1].
[1] -> https://marc.info/?l=linux-kernel&m=152465820531802&w=2

This series:
 *) Adds wilink wlan support (Now all MMC instances in DRA7 will use
    sdhci-omap)
 *) Add a new pinctrl group for clk line without pullup required for
    UHS cards to work reliably.
 *) Update README to make sure users update .config file from 4.18
    kernel.
 *) Use sdhci-omap programming model.

In the "Use sdhci-omap programming model" patch, "ti,omap4-hsmmc"
compatible is removed. This is because if both "ti,dra7-sdhci" and
"ti,omap4-hsmmc" is added and if there is probe deferral in sdhci_omap
driver, the device is binding to omap_hsmmc driver.

Once omap_hsmmc and sdhci_omap driver are feature identical,
sdhci_omap driver will be made to support omap_hsmmc binding
(including "ti,omap4-hsmmc" compatible) and omap_hsmmc driver will
be removed. Till then dt nodes with "ti,omap4-hsmmc" compatible
will use omap_hsmmc driver and "ti,dra7-sdhci" compatible will
use sdhci_omap driver.

Hari Nagalla (2):
  ARM: dts: dra72-evm-common: Add wilink8 wlan support
  ARM: dts: dra7-evm: Add wilink8 wlan support

Kishon Vijay Abraham I (11):
  ARM: dts: dra72-evm-common: Remove mmc specific pinmux
  ARM: dts: dra71-evm: Add "vqmmc-supply" property for mmc2
  ARM: dts: dra72x-mmc-iodelay: Add a new pinctrl group for clk line
    without pullup
  ARM: dts: dra74x-mmc-iodelay: Add a new pinctrl group for clk line
    without pullup
  ARM: dts: dra76x-mmc-iodelay: Add a new pinctrl group for clk line
    without pullup
  ARM: dts: am57xx-idk: Use pinctrl group from dra7xx-mmc-iodelay.dtsi
    to select pulldown
  ARM: dts: dra71-evm: Use pinctrl group from dra72x-mmc-iodelay.dtsi to
    select pulldown
  ARM: dts: dra7-evm: Model EVM_3V6 regulator
  ARM: dts: dra7: Use sdhci-omap programming model
  ARM: dts: dra7: Add high speed modes capability to MMC1/MMC2 dt node
  Documentation: ARM: Add new MMC requirements for DRA7/K2G

Sekhar Nori (1):
  ARM: dts: am574x-idk: Add pinmux configuration for MMC

Vishal Mahaveer (1):
  ARM: dts: dra76-evm: Add wilink8 wlan support

 Documentation/arm/OMAP/README                 |  4 ++
 arch/arm/boot/dts/am571x-idk.dts              |  2 +-
 arch/arm/boot/dts/am572x-idk.dts              |  2 +-
 arch/arm/boot/dts/am574x-idk.dts              | 19 +++++
 .../boot/dts/am57xx-beagle-x15-common.dtsi    |  4 +-
 arch/arm/boot/dts/am57xx-beagle-x15.dts       |  1 +
 arch/arm/boot/dts/am57xx-idk-common.dtsi      |  3 +-
 arch/arm/boot/dts/dra7-evm-common.dtsi        | 15 ++++
 arch/arm/boot/dts/dra7-evm.dts                | 68 ++++++++++++++++++
 arch/arm/boot/dts/dra7.dtsi                   | 30 ++++----
 arch/arm/boot/dts/dra71-evm.dts               | 16 +----
 arch/arm/boot/dts/dra72-evm-common.dtsi       | 71 +++++++++++--------
 arch/arm/boot/dts/dra72x-mmc-iodelay.dtsi     | 22 ++++++
 arch/arm/boot/dts/dra74x-mmc-iodelay.dtsi     | 11 +++
 arch/arm/boot/dts/dra76-evm.dts               | 34 ++++++++-
 arch/arm/boot/dts/dra76x-mmc-iodelay.dtsi     | 11 +++
 16 files changed, 248 insertions(+), 65 deletions(-)

-- 
2.17.0

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
