Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 01255C43333
	for <linux-doc@archiver.kernel.org>; Thu, 18 Mar 2021 10:30:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CF17D64F4D
	for <linux-doc@archiver.kernel.org>; Thu, 18 Mar 2021 10:30:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230101AbhCRK35 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 18 Mar 2021 06:29:57 -0400
Received: from mx2.suse.de ([195.135.220.15]:46084 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230142AbhCRK3c (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 18 Mar 2021 06:29:32 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 7F6D6AC75;
        Thu, 18 Mar 2021 10:29:31 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     daniel@ffwll.ch, airlied@linux.ie,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        kraxel@redhat.com, corbet@lwn.net, lgirdwood@gmail.com,
        broonie@kernel.org, sam@ravnborg.org, robh@kernel.org,
        emil.l.velikov@gmail.com, geert+renesas@glider.be,
        hdegoede@redhat.com, bluescreen_avenger@verizon.net
Cc:     dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 10/10] drm/simpledrm: Acquire memory aperture for framebuffer
Date:   Thu, 18 Mar 2021 11:29:21 +0100
Message-Id: <20210318102921.21536-11-tzimmermann@suse.de>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210318102921.21536-1-tzimmermann@suse.de>
References: <20210318102921.21536-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

We register the simplekms device with the DRM platform helpers. A
native driver for the graphics hardware will kick-out the simpledrm
driver before taking over the device.

v2:
	* adapt to aperture changes
	* use drm_dev_unplug() and drm_dev_enter/exit()
	* don't split error string

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Tested-by: nerdopolis <bluescreen_avenger@verizon.net>
---
 drivers/gpu/drm/tiny/Kconfig     |  1 +
 drivers/gpu/drm/tiny/simpledrm.c | 83 ++++++++++++++++++++++++++++++--
 2 files changed, 81 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/tiny/Kconfig b/drivers/gpu/drm/tiny/Kconfig
index d46f95d9196d..5b72dd8e93f9 100644
--- a/drivers/gpu/drm/tiny/Kconfig
+++ b/drivers/gpu/drm/tiny/Kconfig
@@ -41,6 +41,7 @@ config DRM_GM12U320
 config DRM_SIMPLEDRM
 	tristate "Simple framebuffer driver"
 	depends on DRM
+	select DRM_APERTURE
 	select DRM_GEM_SHMEM_HELPER
 	select DRM_KMS_HELPER
 	help
diff --git a/drivers/gpu/drm/tiny/simpledrm.c b/drivers/gpu/drm/tiny/simpledrm.c
index 2e27eeb791a1..67d33af19086 100644
--- a/drivers/gpu/drm/tiny/simpledrm.c
+++ b/drivers/gpu/drm/tiny/simpledrm.c
@@ -5,7 +5,9 @@
 #include <linux/platform_data/simplefb.h>
 #include <linux/platform_device.h>
 #include <linux/regulator/consumer.h>
+#include <linux/spinlock.h>
 
+#include <drm/drm_aperture.h>
 #include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_connector.h>
 #include <drm/drm_damage_helper.h>
@@ -37,6 +39,12 @@
 #define SIMPLEDRM_MODE(hd, vd)	\
 	DRM_SIMPLE_MODE(hd, vd, RES_MM(hd), RES_MM(vd))
 
+/*
+ * Protects the platform device's drvdata against
+ * concurrent manipulation.
+ */
+static DEFINE_SPINLOCK(simpledrm_drvdata_lock);
+
 /*
  * Helpers for simplefb
  */
@@ -515,16 +523,53 @@ static int simpledrm_device_init_fb(struct simpledrm_device *sdev)
  * Memory management
  */
 
+static void simpledrm_aperture_detach(struct drm_device *dev, resource_size_t base,
+				      resource_size_t size)
+{
+	struct simpledrm_device *sdev = simpledrm_device_of_dev(dev);
+	struct platform_device *pdev = sdev->pdev;
+
+	if (WARN_ON(drm_dev_is_unplugged(dev)))
+		return; /* BUG: driver already got detached */
+
+	/*
+	 * If simpledrm gets detached from the aperture, it's like unplugging
+	 * the device. So call drm_dev_unplug().
+	 */
+	drm_dev_unplug(dev);
+
+	spin_lock(&simpledrm_drvdata_lock);
+	sdev = platform_get_drvdata(pdev);
+	platform_set_drvdata(pdev, NULL); /* required; see simpledrm_remove() */
+	spin_unlock(&simpledrm_drvdata_lock);
+}
+
+static const struct drm_aperture_funcs simpledrm_aperture_funcs = {
+	.detach = simpledrm_aperture_detach,
+};
+
 static int simpledrm_device_init_mm(struct simpledrm_device *sdev)
 {
+	struct drm_device *dev = &sdev->dev;
 	struct platform_device *pdev = sdev->pdev;
 	struct resource *mem;
+	struct drm_aperture *ap;
 	void __iomem *screen_base;
+	int ret;
 
 	mem = platform_get_resource(pdev, IORESOURCE_MEM, 0);
 	if (!mem)
 		return -EINVAL;
 
+	ap = devm_aperture_acquire(dev, mem->start, resource_size(mem),
+				   &simpledrm_aperture_funcs);
+	if (IS_ERR(ap)) {
+		ret = PTR_ERR(ap);
+		drm_err(dev, "could not acquire memory range [0x%llx:0x%llx]: error %d\n",
+			mem->start, mem->end, ret);
+		return ret;
+	}
+
 	screen_base = devm_ioremap_wc(&pdev->dev, mem->start,
 				      resource_size(mem));
 	if (!screen_base)
@@ -625,12 +670,18 @@ simpledrm_simple_display_pipe_enable(struct drm_simple_display_pipe *pipe,
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
 	struct drm_framebuffer *fb = plane_state->fb;
 	void *vmap = shadow_plane_state->map[0].vaddr; /* TODO: Use mapping abstraction properly */
+	struct drm_device *dev = &sdev->dev;
+	int idx;
 
 	if (!fb)
 		return;
 
+	if (!drm_dev_enter(dev, &idx))
+		return;
+
 	drm_fb_blit_dstclip(sdev->screen_base, sdev->pitch,
 			    sdev->format->format, vmap, fb);
+	drm_dev_exit(idx);
 }
 
 static void
@@ -642,7 +693,9 @@ simpledrm_simple_display_pipe_update(struct drm_simple_display_pipe *pipe,
 	struct drm_shadow_plane_state *shadow_plane_state = to_drm_shadow_plane_state(plane_state);
 	void *vmap = shadow_plane_state->map[0].vaddr; /* TODO: Use mapping abstraction properly */
 	struct drm_framebuffer *fb = plane_state->fb;
+	struct drm_device *dev = &sdev->dev;
 	struct drm_rect clip;
+	int idx;
 
 	if (!fb)
 		return;
@@ -650,8 +703,13 @@ simpledrm_simple_display_pipe_update(struct drm_simple_display_pipe *pipe,
 	if (!drm_atomic_helper_damage_merged(old_plane_state, plane_state, &clip))
 		return;
 
+	if (!drm_dev_enter(dev, &idx))
+		return;
+
 	drm_fb_blit_rect_dstclip(sdev->screen_base, sdev->pitch,
 				 sdev->format->format, vmap, fb, &clip);
+
+	drm_dev_exit(idx);
 }
 
 static const struct drm_simple_display_pipe_funcs
@@ -826,10 +884,29 @@ static int simpledrm_probe(struct platform_device *pdev)
 
 static int simpledrm_remove(struct platform_device *pdev)
 {
-	struct simpledrm_device *sdev = platform_get_drvdata(pdev);
-	struct drm_device *dev = &sdev->dev;
+	struct simpledrm_device *sdev;
+
+	spin_lock(&simpledrm_drvdata_lock);
+	sdev = platform_get_drvdata(pdev);
+	platform_set_drvdata(pdev, NULL);
+	spin_unlock(&simpledrm_drvdata_lock);
+
+	/*
+	 * The platform driver shares its reference to dev with the
+	 * platform helpers for apertures. That reference is either
+	 * released here when unloading the driver; or it's released
+	 * when the driver gets kicked out by another driver. In the
+	 * latter case, the aperture release routine clears the data
+	 * field of the platform device.
+	 *
+	 * Therefore, sdev being NULL is a valid state if the driver
+	 * has been kicked out by another DRM driver. In this case,
+	 * it's all been cleaned up and we can return immediately.
+	 */
+	if (!sdev)
+		return 0;
 
-	drm_dev_unregister(dev);
+	drm_dev_unplug(&sdev->dev);
 
 	return 0;
 }
-- 
2.30.1

