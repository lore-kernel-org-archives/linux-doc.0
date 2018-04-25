Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E18EB7E27E
	for <lwn-linux-doc@archive.lwn.net>; Wed, 25 Apr 2018 13:32:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753914AbeDYNcu (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 25 Apr 2018 09:32:50 -0400
Received: from fllnx209.ext.ti.com ([198.47.19.16]:16836 "EHLO
        fllnx209.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753910AbeDYNcs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 25 Apr 2018 09:32:48 -0400
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
        by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w3PDWgmO031850;
        Wed, 25 Apr 2018 08:32:42 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
        s=ti-com-17Q1; t=1524663162;
        bh=VUCGek7IzcKgAnQmfl3kyIVnJ+2LmeA9RX6+DoKwtAs=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=dLxxa22KC0jJSPRTkEXktsTUoBOrGRHLeq2bKORODH4b4gXWiJK1QRJAg3faz4IX+
         vXRWu72jvxnbL7rS8ziiNaC7LgAVT6xZjx7kQ46LyALPkziJMr1e6eVd47UJJ/o/3k
         Ok9uFbgGRt93Dan/3dJ6GGZ/abkgK2P4MmoNJ0d8=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3PDWghY025406;
        Wed, 25 Apr 2018 08:32:42 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3; Wed, 25
 Apr 2018 08:32:42 -0500
Received: from dflp33.itg.ti.com (10.64.6.16) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend Transport;
 Wed, 25 Apr 2018 08:32:42 -0500
Received: from a0393678ub.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3PDWbWE014257;
        Wed, 25 Apr 2018 08:32:38 -0500
From:   Kishon Vijay Abraham I <kishon@ti.com>
To:     =?UTF-8?q?Beno=C3=AEt=20Cousson=20?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>
CC:     Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <linux-doc@vger.kernel.org>, <kishon@ti.com>,
        <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>
Subject: [PATCH v4 15/15] Documentation: ARM: Add new MMC requirements for DRA7/K2G
Date:   Wed, 25 Apr 2018 19:02:03 +0530
Message-ID: <20180425133203.14133-1-kishon@ti.com>
X-Mailer: git-send-email 2.17.0
In-Reply-To: <20180425125449.19755-16-kishon@ti.com>
References: <20180425125449.19755-16-kishon@ti.com>
MIME-Version: 1.0
Content-Type: text/plain
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From 4.18 kernel, all the MMC controller instances in DRA7
are programmed using sdhci based driver (sdhci-omap.c). Document
this new requirement here. Both omap2plus_defconfig and
multi_v7_defconfig has CONFIG_MMC_SDHCI_OMAP enabled.

Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
---
Changes from v3:
Add K2G also in the dependencies description

 Documentation/arm/OMAP/README | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/Documentation/arm/OMAP/README b/Documentation/arm/OMAP/README
index 75645c45d14a..5bf5ac3b3ed4 100644
--- a/Documentation/arm/OMAP/README
+++ b/Documentation/arm/OMAP/README
@@ -5,3 +5,7 @@ KERNEL		NEW DEPENDENCIES
 v4.3+		Update is needed for custom .config files to make sure
 		CONFIG_REGULATOR_PBIAS is enabled for MMC1 to work
 		properly.
+
+v4.18+		Update is needed for custom .config files to make sure
+		CONFIG_MMC_SDHCI_OMAP is enabled for all MMC instances
+		to work in DRA7 and K2G based boards.
-- 
2.17.0

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
