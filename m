Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8C92C7D982
	for <lwn-linux-doc@archive.lwn.net>; Wed, 18 Sep 2019 14:23:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730317AbfIROXR (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 18 Sep 2019 10:23:17 -0400
Received: from mx2.suse.de ([195.135.220.15]:33312 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730452AbfIROXQ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 18 Sep 2019 10:23:16 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 6B8CBB687;
        Wed, 18 Sep 2019 14:23:14 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
        sam@ravnborg.org, yc_chen@aspeedtech.com, corbet@lwn.net
Cc:     dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 10/11] drm/mgag200: Reserve video memory for cursor plane
Date:   Wed, 18 Sep 2019 16:23:06 +0200
Message-Id: <20190918142307.27127-11-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190918142307.27127-1-tzimmermann@suse.de>
References: <20190918142307.27127-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The double-buffered cursor image is currently stored in video memory
by creating two BOs and pinning them to VRAM. The exact location is
chosen by VRAM helpers.

Since the driver has no control over BO placement, pinned cursor BOs
can conflict with framebuffer BOs and prevent the primary plane from
displaying its framebuffer.

As a first step to solving this problem, we reserve dedicated space at
the high end of the video memory for the cursor images. As the amount
of video memory now differs from the amount of available framebuffer
memory, size tests are performed against the VRAM helper's framebuffer
limits.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_main.c |  2 +-
 drivers/gpu/drm/mgag200/mgag200_mode.c |  2 +-
 drivers/gpu/drm/mgag200/mgag200_ttm.c  | 15 ++++++++++++++-
 3 files changed, 16 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_main.c b/drivers/gpu/drm/mgag200/mgag200_main.c
index 2b59280777a5..4b8686e9a276 100644
--- a/drivers/gpu/drm/mgag200/mgag200_main.c
+++ b/drivers/gpu/drm/mgag200/mgag200_main.c
@@ -159,7 +159,7 @@ int mgag200_driver_load(struct drm_device *dev, unsigned long flags)
 
 	drm_mode_config_init(dev);
 	dev->mode_config.funcs = (void *)&mga_mode_funcs;
-	if (IS_G200_SE(mdev) && mdev->mc.vram_size < (2048*1024))
+	if (IS_G200_SE(mdev) && dev->vram_mm->vram_size < (2048*1024))
 		dev->mode_config.preferred_depth = 16;
 	else
 		dev->mode_config.preferred_depth = 32;
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 0cf5608c3644..2ac66a2270bb 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -1629,7 +1629,7 @@ static enum drm_mode_status mga_vga_mode_valid(struct drm_connector *connector,
 			bpp = connector->cmdline_mode.bpp;
 	}
 
-	if ((mode->hdisplay * mode->vdisplay * (bpp/8)) > mdev->mc.vram_size) {
+	if ((mode->hdisplay * mode->vdisplay * (bpp/8)) > dev->vram_mm->vram_size) {
 		if (connector->cmdline_mode.specified)
 			connector->cmdline_mode.specified = false;
 		return MODE_BAD;
diff --git a/drivers/gpu/drm/mgag200/mgag200_ttm.c b/drivers/gpu/drm/mgag200/mgag200_ttm.c
index 69c81ebf3745..1df8504c6cab 100644
--- a/drivers/gpu/drm/mgag200/mgag200_ttm.c
+++ b/drivers/gpu/drm/mgag200/mgag200_ttm.c
@@ -32,12 +32,25 @@
 
 int mgag200_mm_init(struct mga_device *mdev)
 {
+	unsigned long cursor_framesize, cursor_nframes, cursor_size;
+	unsigned long framebuffer_size;
 	struct drm_vram_mm *vmm;
 	int ret;
 	struct drm_device *dev = mdev->dev;
 
+	/* At the high end of video memory, we reserve space for
+	 * two cursor images. The cursor plane uses this memory to
+	 * store a double-buffered image of the current cursor.
+	 */
+
+	cursor_framesize = roundup(64 * 48, 1024);
+	cursor_nframes = 2;
+	cursor_size = roundup(cursor_framesize * cursor_nframes, PAGE_SIZE);
+
+	framebuffer_size = (mdev->mc.vram_size - cursor_size) & PAGE_MASK;
+
 	vmm = drm_vram_helper_alloc_mm(dev, pci_resource_start(dev->pdev, 0),
-				       mdev->mc.vram_size);
+				       framebuffer_size);
 	if (IS_ERR(vmm)) {
 		ret = PTR_ERR(vmm);
 		DRM_ERROR("Error initializing VRAM MM; %d\n", ret);
-- 
2.23.0

