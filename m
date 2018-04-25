Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0408C7E27E
	for <lwn-linux-doc@archive.lwn.net>; Wed, 25 Apr 2018 12:57:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754242AbeDYM4N (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 25 Apr 2018 08:56:13 -0400
Received: from fllnx210.ext.ti.com ([198.47.19.17]:61821 "EHLO
        fllnx210.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753354AbeDYM4G (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 25 Apr 2018 08:56:06 -0400
Received: from dflxv15.itg.ti.com ([128.247.5.124])
        by fllnx210.ext.ti.com (8.15.1/8.15.1) with ESMTP id w3PCu0XD019484;
        Wed, 25 Apr 2018 07:56:00 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
        s=ti-com-17Q1; t=1524660960;
        bh=ZBkV4136b+uKH/UBbkKnhkdQUl6fdBaD4DsesqAz2jA=;
        h=From:To:CC:Subject:Date:In-Reply-To:References;
        b=OvkPJkN7O8ILUv3u3bBA2wk5xxoGq5oVCqiHXQwFiST/R+AT2ZFm4FVhr1TffrBnl
         OaIbrrPf3EREyVuglT26Ik/o48kRSzkmObI6X+zWmi4/nCmvQXoAnJEnx3WQLU4aHH
         /JOBKoGxTJKULk8Icxr6+Z569osuNXTcl7mbzqUI=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3PCu0cx024605;
        Wed, 25 Apr 2018 07:56:00 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1466.3; Wed, 25
 Apr 2018 07:56:00 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_0,
 cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1466.3 via Frontend Transport;
 Wed, 25 Apr 2018 07:56:00 -0500
Received: from a0393678ub.india.ti.com (ileax41-snat.itg.ti.com [10.172.224.153])
        by dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w3PCt1SS021671;
        Wed, 25 Apr 2018 07:55:57 -0500
From:   Kishon Vijay Abraham I <kishon@ti.com>
To:     =?UTF-8?q?Beno=C3=AEt=20Cousson=20?= <bcousson@baylibre.com>,
        Tony Lindgren <tony@atomide.com>
CC:     Jonathan Corbet <corbet@lwn.net>, Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <linux-doc@vger.kernel.org>, <kishon@ti.com>,
        <linux-mmc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>
Subject: [PATCH v3 15/15] Documentation: ARM: Add new MMC requirements for DRA7/K2G
Date:   Wed, 25 Apr 2018 18:24:49 +0530
Message-ID: <20180425125449.19755-16-kishon@ti.com>
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

From 4.18 kernel, all the MMC controller instances in DRA7
are programmed using sdhci based driver (sdhci-omap.c). Document
this new requirement here. Both omap2plus_defconfig and
multi_v7_defconfig has CONFIG_MMC_SDHCI_OMAP enabled.

Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
---
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
+		to work in DRA7 based boards.
-- 
2.17.0

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
