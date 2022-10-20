Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D77DC4332F
	for <linux-doc@archiver.kernel.org>; Thu, 20 Oct 2022 13:39:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229542AbiJTNjU (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 20 Oct 2022 09:39:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36478 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230283AbiJTNjS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Oct 2022 09:39:18 -0400
Received: from mga09.intel.com (mga09.intel.com [134.134.136.24])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6C3D61A6525
        for <linux-doc@vger.kernel.org>; Thu, 20 Oct 2022 06:39:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1666273152; x=1697809152;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=SNnNP1izKvZgrO4FDmvsFAkpUDz7B0siSmmbBeswssU=;
  b=nsnnsYlSTmOUI0G4opEZc5+6vhfIeyk01NNlNYZhWMKYVx0OXL0DImxR
   97Ishzln8lEs5KV4O8nJIUQojofSczRGKOUmrLYPSRn+TNshUtjxA6FP5
   NXpys/i5GZNN+mLYbOuQFhmAcdhUOaDWZZoYel8s2v55nin9T0RH0YEn1
   xtLlgQQSCehTNa7cwtBKyIWzFtGHbJRAVU0D2CXfbVj/YJeMCAdAvPQYC
   tdVbAd4HXtIpTmBp4KFCBMovARG4kfwKO7bu3Ys0LV2ew3licm51WBvuY
   cBN8ztf5MjST21T/kaXitZj/EVKdU32wr3bPQNdVANqCiQo+79fGJ79yE
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="307806031"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; 
   d="scan'208";a="307806031"
Received: from fmsmga003.fm.intel.com ([10.253.24.29])
  by orsmga102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2022 06:38:55 -0700
X-IronPort-AV: E=McAfee;i="6500,9779,10506"; a="719064655"
X-IronPort-AV: E=Sophos;i="5.95,198,1661842800"; 
   d="scan'208";a="719064655"
Received: from gna-nuc-dev34.igk.intel.com ([10.102.80.34])
  by fmsmga003-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2022 06:38:52 -0700
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
        Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>,
        Tomasz Jankowski <tomasz1.jankowski@intel.com>,
        Jianxun Zhang <jianxun.zhang@linux.intel.com>
Subject: [PATCH v4 09/10] gna: add power management
Date:   Thu, 20 Oct 2022 15:35:24 +0200
Message-Id: <20221020133525.1810728-10-maciej.kwapulinski@intel.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20221020133525.1810728-1-maciej.kwapulinski@intel.com>
References: <20221020133525.1810728-1-maciej.kwapulinski@intel.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>

Implement power management in GNA driver

Signed-off-by: Maciej Kwapulinski <maciej.kwapulinski@linux.intel.com>
Tested-by: Mikolaj Grzybowski <mikolajx.grzybowski@intel.com>
Co-developed-by: Tomasz Jankowski <tomasz1.jankowski@intel.com>
Signed-off-by: Tomasz Jankowski <tomasz1.jankowski@intel.com>
Co-developed-by: Jianxun Zhang <jianxun.zhang@linux.intel.com>
Signed-off-by: Jianxun Zhang <jianxun.zhang@linux.intel.com>
---
 drivers/gpu/drm/gna/gna_device.c  | 47 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/gna/gna_device.h  |  3 ++
 drivers/gpu/drm/gna/gna_pci.c     |  3 ++
 drivers/gpu/drm/gna/gna_request.c | 15 ++++++++++
 4 files changed, 68 insertions(+)

diff --git a/drivers/gpu/drm/gna/gna_device.c b/drivers/gpu/drm/gna/gna_device.c
index 2ef5be16dc9a..aee409e3b4ea 100644
--- a/drivers/gpu/drm/gna/gna_device.c
+++ b/drivers/gpu/drm/gna/gna_device.c
@@ -32,6 +32,32 @@ static const struct drm_ioctl_desc gna_drm_ioctls[] = {
 	DRM_IOCTL_DEF_DRV(GNA_WAIT, gna_wait_ioctl, DRM_RENDER_ALLOW),
 };
 
+static int __maybe_unused gna_runtime_suspend(struct device *dev)
+{
+	struct drm_device *drm_dev = dev_get_drvdata(dev);
+	struct gna_device *gna_priv = to_gna_device(drm_dev);
+	u32 val = gna_reg_read(gna_priv, GNA_MMIO_D0I3C);
+
+	dev_dbg(dev, "%s D0I3, reg %.8x\n", __func__, val);
+
+	return 0;
+}
+
+static int __maybe_unused gna_runtime_resume(struct device *dev)
+{
+	struct drm_device *drm_dev = dev_get_drvdata(dev);
+	struct gna_device *gna_priv = to_gna_device(drm_dev);
+	u32 val = gna_reg_read(gna_priv, GNA_MMIO_D0I3C);
+
+	dev_dbg(dev, "%s D0I3, reg %.8x\n", __func__, val);
+
+	return 0;
+}
+
+const struct dev_pm_ops __maybe_unused gna_pm = {
+	SET_RUNTIME_PM_OPS(gna_runtime_suspend, gna_runtime_resume, NULL)
+};
+
 
 static void gna_drm_dev_fini(struct drm_device *dev, void *ptr)
 {
@@ -49,6 +75,22 @@ static int gna_drm_dev_init(struct drm_device *dev)
 	return drmm_add_action_or_reset(dev, gna_drm_dev_fini, NULL);
 }
 
+static void gna_pm_init(struct device *dev)
+{
+	pm_runtime_set_autosuspend_delay(dev, 2000);
+	pm_runtime_use_autosuspend(dev);
+	pm_runtime_mark_last_busy(dev);
+	pm_runtime_allow(dev);
+	pm_runtime_put_noidle(dev);
+}
+
+static void gna_pm_fini(struct drm_device *drm, void *data)
+{
+	struct device *dev = data;
+
+	pm_runtime_get_noresume(dev);
+}
+
 static irqreturn_t gna_interrupt(int irq, void *priv)
 {
 	struct gna_device *gna_priv;
@@ -170,6 +212,11 @@ int gna_probe(struct device *parent, struct gna_dev_info *dev_info, void __iomem
 	if (err)
 		return err;
 
+	gna_pm_init(parent);
+	err = drmm_add_action(drm_dev, gna_pm_fini, parent);
+	if (err)
+		return err;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/gna/gna_device.h b/drivers/gpu/drm/gna/gna_device.h
index ffdc3d1d1f87..6eae0f2f44df 100644
--- a/drivers/gpu/drm/gna/gna_device.h
+++ b/drivers/gpu/drm/gna/gna_device.h
@@ -11,6 +11,7 @@
 #include <linux/io.h>
 #include <linux/list.h>
 #include <linux/mutex.h>
+#include <linux/pm_runtime.h>
 #include <linux/types.h>
 
 #include "gna_gem.h"
@@ -78,6 +79,8 @@ int gna_score_ioctl(struct drm_device *dev, void *data,
 int gna_wait_ioctl(struct drm_device *dev, void *data,
 		struct drm_file *file);
 
+extern const struct dev_pm_ops __maybe_unused gna_pm;
+
 static inline u32 gna_reg_read(struct gna_device *gna_priv, u32 reg)
 {
 	return readl(gna_priv->iobase + reg);
diff --git a/drivers/gpu/drm/gna/gna_pci.c b/drivers/gpu/drm/gna/gna_pci.c
index 034554b417a8..eaae42142bfb 100644
--- a/drivers/gpu/drm/gna/gna_pci.c
+++ b/drivers/gpu/drm/gna/gna_pci.c
@@ -138,6 +138,9 @@ static struct pci_driver gna_pci_driver = {
 	.name = DRIVER_NAME,
 	.id_table = gna_pci_ids,
 	.probe = gna_pci_probe,
+	.driver = {
+		.pm = &gna_pm,
+	},
 };
 
 module_pci_driver(gna_pci_driver);
diff --git a/drivers/gpu/drm/gna/gna_request.c b/drivers/gpu/drm/gna/gna_request.c
index 9efaea61ac68..1d9572bedcc2 100644
--- a/drivers/gpu/drm/gna/gna_request.c
+++ b/drivers/gpu/drm/gna/gna_request.c
@@ -11,6 +11,7 @@
 #include <linux/list.h>
 #include <linux/math.h>
 #include <linux/mutex.h>
+#include <linux/pm_runtime.h>
 #include <linux/slab.h>
 #include <linux/timekeeping.h>
 #include <linux/uaccess.h>
@@ -110,6 +111,14 @@ static void gna_request_process(struct work_struct *work)
 
 	score_request->drv_perf.pre_processing = ktime_get_ns();
 
+	ret = pm_runtime_get_sync(gna_dev(gna_priv));
+	if (ret < 0 && ret != -EACCES) {
+		dev_warn(gna_dev(gna_priv), "pm_runtime_get_sync() failed: %d\n", ret);
+		score_request->status = -ENODEV;
+		pm_runtime_put_noidle(gna_dev(gna_priv));
+		goto tail;
+	}
+
 	/* Set busy flag before kicking off HW. The isr will clear it and wake up us. There is
 	 * no difference if isr is missed in a timeout situation of the last request. We just
 	 * always set it busy and let the wait_event_timeout check the reset.
@@ -120,6 +129,8 @@ static void gna_request_process(struct work_struct *work)
 
 	ret = gna_score(score_request);
 	if (ret) {
+		if (pm_runtime_put(gna_dev(gna_priv)) < 0)
+			dev_warn(gna_dev(gna_priv), "pm_runtime_put() failed: %d\n", ret);
 		score_request->status = ret;
 		goto tail;
 	}
@@ -142,6 +153,10 @@ static void gna_request_process(struct work_struct *work)
 	if (ret < 0 && score_request->status == 0)
 		score_request->status = ret; // -ETIMEDOUT
 
+	ret = pm_runtime_put(gna_dev(gna_priv));
+	if (ret < 0)
+		dev_warn(gna_dev(gna_priv), "pm_runtime_put() failed: %d\n", ret);
+
 	gna_mmu_clear(gna_priv);
 
 	for (i = 0, buffer = score_request->buffer_list; i < score_request->buffer_count; i++, buffer++)
-- 
2.25.1

---------------------------------------------------------------------
Intel Technology Poland sp. z o.o.
ul. Slowackiego 173 | 80-298 Gdansk | Sad Rejonowy Gdansk Polnoc | VII Wydzial Gospodarczy Krajowego Rejestru Sadowego - KRS 101882 | NIP 957-07-52-316 | Kapital zakladowy 200.000 PLN.
Spolka oswiadcza, ze posiada status duzego przedsiebiorcy w rozumieniu ustawy z dnia 8 marca 2013 r. o przeciwdzialaniu nadmiernym opoznieniom w transakcjach handlowych.

Ta wiadomosc wraz z zalacznikami jest przeznaczona dla okreslonego adresata i moze zawierac informacje poufne. W razie przypadkowego otrzymania tej wiadomosci, prosimy o powiadomienie nadawcy oraz trwale jej usuniecie; jakiekolwiek przegladanie lub rozpowszechnianie jest zabronione.
This e-mail and any attachments may contain confidential material for the sole use of the intended recipient(s). If you are not the intended recipient, please contact the sender and delete all copies; any review or distribution by others is strictly prohibited.

