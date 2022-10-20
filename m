Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E5C5C433FE
	for <linux-doc@archiver.kernel.org>; Thu, 20 Oct 2022 17:57:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229659AbiJTR5S (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 20 Oct 2022 13:57:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52262 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230047AbiJTR5R (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Oct 2022 13:57:17 -0400
Received: from mga12.intel.com (mga12.intel.com [192.55.52.136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 039E8199F49
        for <linux-doc@vger.kernel.org>; Thu, 20 Oct 2022 10:57:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666288636; x=1697824636;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=v1QWsl+gHrnYkxj6qgW+hV3xKOILPo82/g6zaj1On/I=;
  b=XhXejZlcRoV+onX6Ti6d4fqG6Q9WKyc2n8j4pg+nKNzZga0Pp0C3A4MD
   lUJ4OGO6UOkfxaKpNAMVbHUoaxirh56DCMYwtTJ8tZ05bw4cdN4eZMO2l
   O78ut1dt9ekCB8gYieuQdL8jBqxL4ChYIiZi9bVw2lM1ezKnafHYEp3Vt
   wfJVhkaT4L2FCeA+Itkm33OaHOQ6DG3NziESWPdEayJVRntalPYkPig7t
   fYg9a+LA9+Nxlf39+rcyyFtI05CpW20FjkaEhsakRkq9a8esautlDSTcW
   Q/5vhfHi6M1/lKFt37AtA9dwSbovc6SyxAqE8qYAwmvD4SU+V13id1vIr
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="286510839"
X-IronPort-AV: E=Sophos;i="5.95,199,1661842800"; 
   d="scan'208";a="286510839"
Received: from fmsmga001.fm.intel.com ([10.253.24.23])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2022 10:57:15 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="772516861"
X-IronPort-AV: E=Sophos;i="5.95,199,1661842800"; 
   d="scan'208";a="772516861"
Received: from gna-nuc-dev34.igk.intel.com ([10.102.80.34])
  by fmsmga001-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2022 10:57:11 -0700
From:   Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
To:     Daniel Vetter <daniel@ffwll.ch>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>,
        Thomas Zimmermann <tzimmermann@suse.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Jonathan Corbet <corbet@lwn.net>,
        Derek Kiernan <derek.kiernan@xilinx.com>,
        Dragan Cvetic <dragan.cvetic@xilinx.com>,
        Andy Shevchenko <andy.shevchenko@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Olof Johansson <olof@lixom.net>
Cc:     dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>,
        Tomasz Jankowski <tomasz1.jankowski@intel.com>,
        Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>,
        Jianxun Zhang <jianxun.zhang@linux.intel.com>
Subject: [PATCH v5 03/10] gna: read hardware info
Date:   Thu, 20 Oct 2022 19:53:27 +0200
Message-Id: <20221020175334.1820519-4-maciej.kwapulinski@linux.intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221020175334.1820519-1-maciej.kwapulinski@linux.intel.com>
References: <20221020175334.1820519-1-maciej.kwapulinski@linux.intel.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Tomasz Jankowski <tomasz1.jankowski@intel.com>

Get the hardware information from register MMIO_IBUFFS

Signed-off-by: Tomasz Jankowski <tomasz1.jankowski@intel.com>
Tested-by: Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>
Co-developed-by: Jianxun Zhang <jianxun.zhang@linux.intel.com>
Signed-off-by: Jianxun Zhang <jianxun.zhang@linux.intel.com>
Co-developed-by: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
Signed-off-by: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
---
 drivers/gpu/drm/gna/gna_device.c | 4 ++++
 drivers/gpu/drm/gna/gna_device.h | 9 +++++++++
 drivers/gpu/drm/gna/gna_hw.h     | 7 +++++++
 3 files changed, 20 insertions(+)

diff --git a/drivers/gpu/drm/gna/gna_device.c b/drivers/gpu/drm/gna/gna_device.c
index b8620b7da205..1f357221a603 100644
--- a/drivers/gpu/drm/gna/gna_device.c
+++ b/drivers/gpu/drm/gna/gna_device.c
@@ -42,6 +42,7 @@ int gna_probe(struct device *parent, struct gna_dev_info *dev_info, void __iomem
 {
 	struct gna_device *gna_priv;
 	struct drm_device *drm_dev;
+	u32 bld_reg;
 	int err;
 
 	gna_priv = devm_drm_dev_alloc(parent, &gna_drm_driver, struct gna_device, drm);
@@ -59,6 +60,9 @@ int gna_probe(struct device *parent, struct gna_dev_info *dev_info, void __iomem
 			return err;
 	}
 
+	bld_reg = gna_reg_read(gna_priv, GNA_MMIO_IBUFFS);
+	gna_priv->hw_info.in_buf_s = bld_reg & GENMASK(7, 0);
+
 	dev_set_drvdata(parent, drm_dev);
 
 	err = gna_drm_dev_init(drm_dev);
diff --git a/drivers/gpu/drm/gna/gna_device.h b/drivers/gpu/drm/gna/gna_device.h
index d269f7da5c5e..e42f167b62a0 100644
--- a/drivers/gpu/drm/gna/gna_device.h
+++ b/drivers/gpu/drm/gna/gna_device.h
@@ -6,6 +6,9 @@
 
 #include <drm/drm_device.h>
 
+#include <linux/io.h>
+#include <linux/types.h>
+
 #include "gna_hw.h"
 
 #define DRIVER_NAME		"gna"
@@ -24,7 +27,13 @@ struct gna_device {
 	/* device related resources */
 	void __iomem *iobase;
 	struct gna_dev_info info;
+	struct gna_hw_info hw_info;
 };
 
 int gna_probe(struct device *parent, struct gna_dev_info *dev_info, void __iomem *iobase);
+static inline u32 gna_reg_read(struct gna_device *gna_priv, u32 reg)
+{
+	return readl(gna_priv->iobase + reg);
+}
+
 #endif /* __GNA_DEVICE_H__ */
diff --git a/drivers/gpu/drm/gna/gna_hw.h b/drivers/gpu/drm/gna/gna_hw.h
index 3ca801096fd1..e858b76606fc 100644
--- a/drivers/gpu/drm/gna/gna_hw.h
+++ b/drivers/gpu/drm/gna/gna_hw.h
@@ -6,6 +6,13 @@
 
 #include <linux/mm_types.h>
 
+/* GNA MMIO registers */
+#define GNA_MMIO_IBUFFS		0xB4
+
+struct gna_hw_info {
+	u8 in_buf_s;
+};
+
 struct gna_dev_info {
 	u32 hwid;
 	u32 num_pagetables;
-- 
2.25.1

