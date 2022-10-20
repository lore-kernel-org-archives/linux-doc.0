Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73107C433FE
	for <linux-doc@archiver.kernel.org>; Thu, 20 Oct 2022 13:38:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229930AbiJTNid (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 20 Oct 2022 09:38:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229687AbiJTNid (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Oct 2022 09:38:33 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 55B351A2E23
        for <linux-doc@vger.kernel.org>; Thu, 20 Oct 2022 06:38:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666273112; x=1697809112;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=XA5tGiBrGg2wTaWOV69qGvljBglykwc8v0sqWr4zxfc=;
  b=iPW5+Qh1EWtIKQ2ryIQEbPpGFZbTOafgPMwXQ4TfJcBkKvYYyJGjcx8x
   kr5mwZyu8MB3NH8f8xeftAr6xyOTqHMRn4RpS2W0EhDJEp+aIyVTyu3YR
   Mr7tSUbP8imid7qll899wBGY9Dg/8dBaY4tmSDmPslEhqfmykodm4V4Sh
   j9jjghg4hVdJA+t9euOEbU92/80YOd2vsaXm+7lN5p0irI2OkRwytgWjE
   B0x2PPfw4AHnjt3zaweje3dflpceDpNZZALOwUoQUA9J7nY75XnwliDPy
   OT5JVPTpfEx5tTo1Zq91IBdE4R3JTktckj5Aco5X+/2cpNrlE423Yl8Xg
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="307805962"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; 
   d="scan'208";a="307805962"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2022 06:38:32 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="719064495"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; 
   d="scan'208";a="719064495"
Received: from gna-nuc-dev34.igk.intel.com ([10.102.80.34])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2022 06:38:28 -0700
From:   "Kwapulinski, Maciej" <maciej.kwapulinski@intel.com>
To:     Daniel Vetter <daniel@ffwll.ch>, David Airlie <airlied@linux.ie>,
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
Subject: [PATCH v4 03/10] gna: read hardware info
Date:   Thu, 20 Oct 2022 15:35:18 +0200
Message-Id: <20221020133525.1810728-4-maciej.kwapulinski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221020133525.1810728-1-maciej.kwapulinski@intel.com>
References: <20221020133525.1810728-1-maciej.kwapulinski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
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

---------------------------------------------------------------------
Intel Technology Poland sp. z o.o.
ul. Slowackiego 173 | 80-298 Gdansk | Sad Rejonowy Gdansk Polnoc | VII Wydzial Gospodarczy Krajowego Rejestru Sadowego - KRS 101882 | NIP 957-07-52-316 | Kapital zakladowy 200.000 PLN.
Spolka oswiadcza, ze posiada status duzego przedsiebiorcy w rozumieniu ustawy z dnia 8 marca 2013 r. o przeciwdzialaniu nadmiernym opoznieniom w transakcjach handlowych.

Ta wiadomosc wraz z zalacznikami jest przeznaczona dla okreslonego adresata i moze zawierac informacje poufne. W razie przypadkowego otrzymania tej wiadomosci, prosimy o powiadomienie nadawcy oraz trwale jej usuniecie; jakiekolwiek przegladanie lub rozpowszechnianie jest zabronione.
This e-mail and any attachments may contain confidential material for the sole use of the intended recipient(s). If you are not the intended recipient, please contact the sender and delete all copies; any review or distribution by others is strictly prohibited.

