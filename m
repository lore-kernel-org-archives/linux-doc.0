Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_INVALID,DKIM_SIGNED,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A47437D099
	for <lwn-linux-doc@archive.lwn.net>; Mon, 22 Apr 2019 13:31:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727398AbfDVN2X (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 22 Apr 2019 09:28:23 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:37898 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727574AbfDVN2W (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 22 Apr 2019 09:28:22 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=Sender:Content-Transfer-Encoding:
        MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
        Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
        Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
        List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
        bh=2sTY6y/pj7j8ZKDgFJ/saI9zL6+USwEQ077cqF8cOAo=; b=QS5q/bF3s/JlcF8bfXrqihbTV5
        44WuocUYMi4+pS7a8atN/Trkour/6mCtF9jjp/8nK7QM/2bZrIgmozXVWPeeitRLjhCEJPLcNGab8
        BigWhQEGieadyeA/eLGhqU6CB/PyT2dqcBl3UM0CiutSsfUGObUFxI/VjqYR7jGQ6DmFuhRefP2fy
        xAvi08nu0MXj2vng3TqK9iGu8+yFNyw3yzeR8pZ4PBXKbOlo6OFtc4F3vLx7At8OXBs4h/RfQEKP8
        om3gk2f4KQCP7hJWOn+INF7Srz04qkwhH5IQsbvpOJhGD9ZYIa6PC27g+rl/fB2T+kbbBCmlQn6MV
        62YXUPNQ==;
Received: from 179.176.125.229.dynamic.adsl.gvt.net.br ([179.176.125.229] helo=bombadil.infradead.org)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1hIYzd-0005HT-2T; Mon, 22 Apr 2019 13:28:21 +0000
Received: from mchehab by bombadil.infradead.org with local (Exim 4.92)
        (envelope-from <mchehab@bombadil.infradead.org>)
        id 1hIYzT-0005mc-EF; Mon, 22 Apr 2019 10:28:11 -0300
From:   Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
To:     Linux Doc Mailing List <linux-doc@vger.kernel.org>
Cc:     Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        Mauro Carvalho Chehab <mchehab@infradead.org>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>, David Airlie <airlied@linux.ie>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org
Subject: [PATCH v2 39/79] docs: EDID/HOWTO.txt: convert it and rename to howto.rst
Date:   Mon, 22 Apr 2019 10:27:28 -0300
Message-Id: <7f90aab265747729f25ae644a5017a6d73f10f16.1555938376.git.mchehab+samsung@kernel.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <cover.1555938375.git.mchehab+samsung@kernel.org>
References: <cover.1555938375.git.mchehab+samsung@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Sphinx need to know when a paragraph ends. So, do some adjustments
at the file for it to be properly parsed.

At its new index.rst, let's add a :orphan: while this is not linked to
the main index.rst file, in order to avoid build warnings.

that's said, I believe that this file should be moved to the
GPU/DRM documentation.

Signed-off-by: Mauro Carvalho Chehab <mchehab+samsung@kernel.org>
---
 Documentation/EDID/{HOWTO.txt => howto.rst}   | 31 ++++++++++++-------
 .../admin-guide/kernel-parameters.txt         |  2 +-
 drivers/gpu/drm/Kconfig                       |  2 +-
 3 files changed, 22 insertions(+), 13 deletions(-)
 rename Documentation/EDID/{HOWTO.txt => howto.rst} (83%)

diff --git a/Documentation/EDID/HOWTO.txt b/Documentation/EDID/howto.rst
similarity index 83%
rename from Documentation/EDID/HOWTO.txt
rename to Documentation/EDID/howto.rst
index 539871c3b785..725fd49a88ca 100644
--- a/Documentation/EDID/HOWTO.txt
+++ b/Documentation/EDID/howto.rst
@@ -1,3 +1,9 @@
+:orphan:
+
+====
+EDID
+====
+
 In the good old days when graphics parameters were configured explicitly
 in a file called xorg.conf, even broken hardware could be managed.
 
@@ -34,16 +40,19 @@ Makefile. Please note that the EDID data structure expects the timing
 values in a different way as compared to the standard X11 format.
 
 X11:
-HTimings:  hdisp hsyncstart hsyncend htotal
-VTimings:  vdisp vsyncstart vsyncend vtotal
+  HTimings:
+    hdisp hsyncstart hsyncend htotal
+  VTimings:
+    vdisp vsyncstart vsyncend vtotal
 
-EDID:
-#define XPIX hdisp
-#define XBLANK htotal-hdisp
-#define XOFFSET hsyncstart-hdisp
-#define XPULSE hsyncend-hsyncstart
+EDID::
 
-#define YPIX vdisp
-#define YBLANK vtotal-vdisp
-#define YOFFSET vsyncstart-vdisp
-#define YPULSE vsyncend-vsyncstart
+  #define XPIX hdisp
+  #define XBLANK htotal-hdisp
+  #define XOFFSET hsyncstart-hdisp
+  #define XPULSE hsyncend-hsyncstart
+
+  #define YPIX vdisp
+  #define YBLANK vtotal-vdisp
+  #define YOFFSET vsyncstart-vdisp
+  #define YPULSE vsyncend-vsyncstart
diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 5006f876cf0e..4a2260eac131 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -929,7 +929,7 @@
 			edid/1680x1050.bin, or edid/1920x1080.bin is given
 			and no file with the same name exists. Details and
 			instructions how to build your own EDID data are
-			available in Documentation/EDID/HOWTO.txt. An EDID
+			available in Documentation/EDID/howto.rst. An EDID
 			data set will only be used for a particular connector,
 			if its name and a colon are prepended to the EDID
 			name. Each connector may use a unique EDID data
diff --git a/drivers/gpu/drm/Kconfig b/drivers/gpu/drm/Kconfig
index 39d5f7562f1c..bc5658d7a84b 100644
--- a/drivers/gpu/drm/Kconfig
+++ b/drivers/gpu/drm/Kconfig
@@ -140,7 +140,7 @@ config DRM_LOAD_EDID_FIRMWARE
 	  monitor are unable to provide appropriate EDID data. Since this
 	  feature is provided as a workaround for broken hardware, the
 	  default case is N. Details and instructions how to build your own
-	  EDID data are given in Documentation/EDID/HOWTO.txt.
+	  EDID data are given in Documentation/EDID/howto.rst.
 
 config DRM_DP_CEC
 	bool "Enable DisplayPort CEC-Tunneling-over-AUX HDMI support"
-- 
2.20.1

