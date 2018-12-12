Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id AD9917DD48
	for <lwn-linux-doc@archive.lwn.net>; Wed, 12 Dec 2018 22:18:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728392AbeLLWR5 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 12 Dec 2018 17:17:57 -0500
Received: from outils.crapouillou.net ([89.234.176.41]:40702 "EHLO
        crapouillou.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728620AbeLLWQ5 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 12 Dec 2018 17:16:57 -0500
From:   Paul Cercueil <paul@crapouillou.net>
To:     Thierry Reding <thierry.reding@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ralf Baechle <ralf@linux-mips.org>,
        Paul Burton <paul.burton@mips.com>,
        James Hogan <jhogan@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mathieu Malaterre <malat@debian.org>,
        Ezequiel Garcia <ezequiel@collabora.co.uk>,
        PrasannaKumar Muralidharan <prasannatsmkumar@gmail.com>,
        linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-watchdog@vger.kernel.org,
        linux-mips@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-clk@vger.kernel.org, od@zcrc.me,
        Paul Cercueil <paul@crapouillou.net>
Subject: [PATCH v8 06/26] MAINTAINERS: Add myself as maintainer for Ingenic TCU drivers
Date:   Wed, 12 Dec 2018 23:09:01 +0100
Message-Id: <20181212220922.18759-7-paul@crapouillou.net>
In-Reply-To: <20181212220922.18759-1-paul@crapouillou.net>
References: <20181212220922.18759-1-paul@crapouillou.net>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=crapouillou.net; s=mail; t=1544652583; bh=Hw2fC+FIkUpPFqQnbmSvpwotvgdrrhLUeeaQtI0MV9o=; h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References; b=E8J1dp3i1QAp1GSCx0joiucn93fQUPl2zpypajs50qG2jVzLiRcePYbDD8xxp6p77gUjhu4IYlQ+Nn3Ub1ogba1H0zFYOY6Zt2HJZHPfAOMmYNF1I3y2QrU6ByR8XZLqpC1CwCZ0vXahVLVWtVqlSn8auqNEwgN5cP7dSXvrcOI=
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

     v8: No change

 MAINTAINERS | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index 8119141a926f..7a035cd5787a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -7387,6 +7387,15 @@ L:	linux-mtd@lists.infradead.org
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

