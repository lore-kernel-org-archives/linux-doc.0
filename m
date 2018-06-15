Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0A7B97D048
	for <lwn-linux-doc@archive.lwn.net>; Fri, 15 Jun 2018 16:36:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S966174AbeFOQfj (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 15 Jun 2018 12:35:39 -0400
Received: from osg.samsung.com ([64.30.133.232]:45534 "EHLO osg.samsung.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S966117AbeFOQbJ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 15 Jun 2018 12:31:09 -0400
Received: from localhost (localhost [127.0.0.1])
        by osg.samsung.com (Postfix) with ESMTP id 3D00522BE2;
        Fri, 15 Jun 2018 09:31:09 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at dev.s-opensource.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from osg.samsung.com ([127.0.0.1])
        by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id tRirektH345y; Fri, 15 Jun 2018 09:31:08 -0700 (PDT)
Received: from smtp.s-opensource.com (177.41.114.220.dynamic.adsl.gvt.net.br [177.41.114.220])
        by osg.samsung.com (Postfix) with ESMTPSA id AFBF622B57;
        Fri, 15 Jun 2018 09:30:58 -0700 (PDT)
Received: from mchehab by smtp.s-opensource.com with local (Exim 4.91)
        (envelope-from <mchehab@smtp.s-opensource.com>)
        id 1fTrcm-00084e-JL; Fri, 15 Jun 2018 13:30:56 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Sebastian Reichel <sre@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, linux-pm@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH v4 21/26] devicetree: fix some bindings file names
Date:   Fri, 15 Jun 2018 13:30:49 -0300
Message-Id: <bad15e2f685803321c11d0568620e375f2e22dfc.1529079120.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1529079119.git.mchehab+samsung@kernel.org>
References: <cover.1529079119.git.mchehab+samsung@kernel.org>
In-Reply-To: <cover.1529079119.git.mchehab+samsung@kernel.org>
References: <cover.1529079119.git.mchehab+samsung@kernel.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

There were some file movements that changed the location for
some DT bindings. Fix them with:
	scripts/documentation-file-ref-check --fix

After manually checking if the new file makes sense.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/devicetree/bindings/power/supply/ab8500/btemp.txt | 2 +-
 .../devicetree/bindings/power/supply/ab8500/chargalg.txt        | 2 +-
 .../devicetree/bindings/power/supply/ab8500/charger.txt         | 2 +-
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/power/supply/ab8500/btemp.txt b/Documentation/devicetree/bindings/power/supply/ab8500/btemp.txt
index 0ba1bcc7f33a..f181e46d8e07 100644
--- a/Documentation/devicetree/bindings/power/supply/ab8500/btemp.txt
+++ b/Documentation/devicetree/bindings/power/supply/ab8500/btemp.txt
@@ -13,4 +13,4 @@ Required Properties:
 	};
 
 For information on battery specific node, Ref:
-Documentation/devicetree/bindings/power_supply/ab8500/fg.txt
+Documentation/devicetree/bindings/power/supply/ab8500/fg.txt
diff --git a/Documentation/devicetree/bindings/power/supply/ab8500/chargalg.txt b/Documentation/devicetree/bindings/power/supply/ab8500/chargalg.txt
index ef5328371122..56636f927203 100644
--- a/Documentation/devicetree/bindings/power/supply/ab8500/chargalg.txt
+++ b/Documentation/devicetree/bindings/power/supply/ab8500/chargalg.txt
@@ -13,4 +13,4 @@ ab8500_chargalg {
 };
 
 For information on battery specific node, Ref:
-Documentation/devicetree/bindings/power_supply/ab8500/fg.txt
+Documentation/devicetree/bindings/power/supply/ab8500/fg.txt
diff --git a/Documentation/devicetree/bindings/power/supply/ab8500/charger.txt b/Documentation/devicetree/bindings/power/supply/ab8500/charger.txt
index 6bdbb08ea9e0..24ada03e07b4 100644
--- a/Documentation/devicetree/bindings/power/supply/ab8500/charger.txt
+++ b/Documentation/devicetree/bindings/power/supply/ab8500/charger.txt
@@ -22,4 +22,4 @@ Required Properties:
 	};
 
 For information on battery specific node, Ref:
-Documentation/devicetree/bindings/power_supply/ab8500/fg.txt
+Documentation/devicetree/bindings/power/supply/ab8500/fg.txt
-- 
2.17.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
