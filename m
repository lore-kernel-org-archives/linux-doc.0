Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2943A7D09E
	for <lwn-linux-doc@archive.lwn.net>; Thu, 14 Jun 2018 16:13:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S936190AbeFNQMj (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 14 Jun 2018 12:12:39 -0400
Received: from osg.samsung.com ([64.30.133.232]:41517 "EHLO osg.samsung.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1755553AbeFNQJl (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 14 Jun 2018 12:09:41 -0400
Received: from localhost (localhost [127.0.0.1])
        by osg.samsung.com (Postfix) with ESMTP id 0C42B20F6E;
        Thu, 14 Jun 2018 09:09:40 -0700 (PDT)
X-Virus-Scanned: Debian amavisd-new at dev.s-opensource.com
X-Amavis-Alert: BAD HEADER SECTION, Duplicate header field: "References"
Received: from osg.samsung.com ([127.0.0.1])
        by localhost (localhost [127.0.0.1]) (amavisd-new, port 10024)
        with ESMTP id OJCcTawxtMdg; Thu, 14 Jun 2018 09:09:25 -0700 (PDT)
Received: from smtp.s-opensource.com (177.41.114.220.dynamic.adsl.gvt.net.br [177.41.114.220])
        by osg.samsung.com (Postfix) with ESMTPSA id 93BBF20EA7;
        Thu, 14 Jun 2018 09:09:16 -0700 (PDT)
Received: from mchehab by smtp.s-opensource.com with local (Exim 4.91)
        (envelope-from <mchehab@smtp.s-opensource.com>)
        id 1fTUoE-0005Ta-EC; Thu, 14 Jun 2018 13:09:14 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        David Airlie <airlied@linux.ie>,
        David Lechner <david@lechnology.com>,
        Peter Senna Tschudin <peter.senna@collabora.com>,
        Martin Donnelly <martin.donnelly@ge.com>,
        Martyn Welch <martyn.welch@collabora.co.uk>,
        Stefan Agner <stefan@agner.ch>,
        Alison Wang <alison.wang@nxp.com>,
        Eric Anholt <eric@anholt.net>
Subject: [PATCH v3 19/27] MAINTAINERS: fix location of some display DT bindings
Date:   Thu, 14 Jun 2018 13:09:04 -0300
Message-Id: <d7ccd55c208bc8b9733496314e37d2855f6e34f4.1528990947.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <cover.1528990947.git.mchehab+samsung@kernel.org>
References: <cover.1528990947.git.mchehab+samsung@kernel.org>
In-Reply-To: <cover.1528990947.git.mchehab+samsung@kernel.org>
References: <cover.1528990947.git.mchehab+samsung@kernel.org>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Those files got a manufacturer's name prepended and were moved around.
Adjust their references accordingly.

Also, due those movements, Documentation/devicetree/bindings/video
doesn't exist anymore.

Cc: David Airlie <airlied@linux.ie>
Cc: David Lechner <david@lechnology.com>
Cc: Peter Senna Tschudin <peter.senna@collabora.com>
Cc: Martin Donnelly <martin.donnelly@ge.com>
Cc: Martyn Welch <martyn.welch@collabora.co.uk>
Cc: Stefan Agner <stefan@agner.ch>
Cc: Alison Wang <alison.wang@nxp.com>
Cc: Eric Anholt <eric@anholt.net>
Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 MAINTAINERS | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 5871dd5060f6..43eee2fb8798 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -4638,7 +4638,6 @@ F:	drivers/gpu/drm/
 F:	drivers/gpu/vga/
 F:	Documentation/devicetree/bindings/display/
 F:	Documentation/devicetree/bindings/gpu/
-F:	Documentation/devicetree/bindings/video/
 F:	Documentation/gpu/
 F:	include/drm/
 F:	include/uapi/drm/
@@ -4683,7 +4682,7 @@ M:	Boris Brezillon <boris.brezillon@bootlin.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Supported
 F:	drivers/gpu/drm/atmel-hlcdc/
-F:	Documentation/devicetree/bindings/drm/atmel/
+F:	Documentation/devicetree/bindings/display/atmel/
 T:	git git://anongit.freedesktop.org/drm/drm-misc
 
 DRM DRIVERS FOR BRIDGE CHIPS
@@ -4714,7 +4713,7 @@ S:	Supported
 F:	drivers/gpu/drm/fsl-dcu/
 F:	Documentation/devicetree/bindings/display/fsl,dcu.txt
 F:	Documentation/devicetree/bindings/display/fsl,tcon.txt
-F:	Documentation/devicetree/bindings/display/panel/nec,nl4827hc19_05b.txt
+F:	Documentation/devicetree/bindings/display/panel/nec,nl4827hc19-05b.txt
 
 DRM DRIVERS FOR FREESCALE IMX
 M:	Philipp Zabel <p.zabel@pengutronix.de>
-- 
2.17.1

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
