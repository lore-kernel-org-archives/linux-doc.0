Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.1 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 31D3A7DE7C
	for <lwn-linux-doc@archive.lwn.net>; Tue, 21 Aug 2018 17:19:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728091AbeHUUiE (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 21 Aug 2018 16:38:04 -0400
Received: from outils.crapouillou.net ([89.234.176.41]:59332 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728050AbeHUUiD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 21 Aug 2018 16:38:03 -0400
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thomas Gleixner <tglx@linutronix.de>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     od@zcrc.me, Mathieu Malaterre <malat@debian.org>,
        linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-mips@linux-mips.org, linux-doc@vger.kernel.org,
        linux-clk@vger.kernel.org, Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v7 07/24] MAINTAINERS: Add myself as maintainer for Ingenic TCU drivers
Date:   Tue, 21 Aug 2018 19:16:18 +0200
Message-Id: <20180821171635.22740-8-paul@crapouillou.net>
In-Reply-To: <20180821171635.22740-1-paul@crapouillou.net>
References: <20180821171635.22740-1-paul@crapouillou.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net; s=mail; t=1534871821; bh=64oC23yz9JSTJWhvBMtFPn1OxBAaboaLH7Bf56sPzLs=; h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=ioyAphWjWo51fEIYPN23p3nxRpVGuz30v1/+qk6iyWx2mDWDDQUucMitgw/pBGBtquYkjAt9VnzqQXbUBuT04v3+PsX8n1tX6EmQdGXnwZWMsF0YQL3gzmR0kAVc1uD9M3FjpvmP4BBdHO7AXCd6EPS2n1QkILSdbsuzz+D1sAg=
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Add myself as maintainer for the ingenic-timer and ingenic-ost drivers.

Signed-off-by: Paul Cercueil <paul@crapouillou.net>
---

Notes:
     v2: No change
    
     v3: No change
    
     v4: No change
    
     v5: Update with new files
    
     v6: No change
    
     v7: No change

 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 544cac829cf4..159246c3209a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7074,6 +7074,15 @@ L:	linux-mtd@lists.infradead.org
 S:	Maintained
 F:	drivers/mtd/nand/raw/jz4780_*
 
+INGENIC TCU driver
+M:	Paul Cercueil <paul@crapouillou.net>
+S:	Maintained
+F:	drivers/clocksource/ingenic-ost.c
+F:	drivers/clocksource/ingenic-timer.c
+F:	drivers/clocksource/ingenic-timer.h
+F:	include/linux/mfd/ingenic-tcu.h
+F:	include/dt-bindings/clock/ingenic,tcu.h
+
 INOTIFY
 M:	Jan Kara <jack@suse.cz>
 R:	Amir Goldstein <amir73il@gmail.com>
-- 
2.11.0

