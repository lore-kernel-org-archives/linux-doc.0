Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 058917DE57
	for <lwn-linux-doc@archive.lwn.net>; Mon, 23 Sep 2019 17:28:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437873AbfIWR2F (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 23 Sep 2019 13:28:05 -0400
Received: from mx2.suse.de ([195.135.220.15]:46480 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2440166AbfIWR2E (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 23 Sep 2019 13:28:04 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id D5233B652;
        Mon, 23 Sep 2019 17:28:00 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
        sam@ravnborg.org, yc_chen@aspeedtech.com, corbet@lwn.net
Cc:     dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 11/12] drm/mgag200: Reserve video memory for cursor plane
Date:   Mon, 23 Sep 2019 19:27:52 +0200
Message-Id: <20190923172753.26593-12-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190923172753.26593-1-tzimmermann@suse.de>
References: <20190923172753.26593-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The double-buffered cursor image is currently stored in video memory
by creating two BOs and pinning them to VRAM. The exact location is
chosen by VRAM helpers. The pinned cursor BOs can conflict with
framebuffer BOs and prevent the primary plane from displaying its
framebuffer.

As a first step to solving this problem, we reserve dedicated space at
the high end of the video memory for the cursor images. As the amount
of video memory now differs from the amount of available framebuffer
memory, size tests are adapted accordingly.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_cursor.c | 19 +++++++++++++++----
 drivers/gpu/drm/mgag200/mgag200_drv.h    |  2 ++
 drivers/gpu/drm/mgag200/mgag200_main.c   |  2 +-
 drivers/gpu/drm/mgag200/mgag200_mode.c   |  2 +-
 drivers/gpu/drm/mgag200/mgag200_ttm.c    |  4 ++++
 5 files changed, 23 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_cursor.c b/drivers/gpu/drm/mgag200/mgag200_cursor.c
index 4a5b1aa921e0..7f48abf80a6a 100644
--- a/drivers/gpu/drm/mgag200/mgag200_cursor.c
+++ b/drivers/gpu/drm/mgag200/mgag200_cursor.c
@@ -216,17 +216,20 @@ static void mgag200_move_cursor(struct mga_device *mdev, int x, int y)
 int mgag200_cursor_init(struct mga_device *mdev)
 {
 	struct drm_device *dev = mdev->dev;
+	size_t size;
+
+	size = roundup(64 * 48, PAGE_SIZE);
+	if (size * 2 > mdev->vram_fb_available)
+		return -ENOMEM;
 
 	/*
 	 * Make small buffers to store a hardware cursor (double
 	 * buffered icon updates)
 	 */
 	mdev->cursor.pixels_1 = drm_gem_vram_create(dev, &dev->vram_mm->bdev,
-						    roundup(48*64, PAGE_SIZE),
-						    0, 0);
+						    size, 0, 0);
 	mdev->cursor.pixels_2 = drm_gem_vram_create(dev, &dev->vram_mm->bdev,
-						    roundup(48*64, PAGE_SIZE),
-						    0, 0);
+						    size, 0, 0);
 	if (IS_ERR(mdev->cursor.pixels_2) || IS_ERR(mdev->cursor.pixels_1)) {
 		mdev->cursor.pixels_1 = NULL;
 		mdev->cursor.pixels_2 = NULL;
@@ -235,6 +238,14 @@ int mgag200_cursor_init(struct mga_device *mdev)
 	}
 	mdev->cursor.pixels_current = NULL;
 
+	/*
+	 * At the high end of video memory, we reserve space for
+	 * buffer objects. The cursor plane uses this memory to store
+	 * a double-buffered image of the current cursor. Hence, it's
+	 * not available for framebuffers.
+	 */
+	mdev->vram_fb_available -= 2 * size;
+
 	return 0;
 }
 
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index 01243fa6397c..5d6cfc88697a 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -173,6 +173,8 @@ struct mga_device {
 
 	struct mga_cursor cursor;
 
+	size_t vram_fb_available;
+
 	bool				suspended;
 	int				num_crtc;
 	enum mga_type			type;
diff --git a/drivers/gpu/drm/mgag200/mgag200_main.c b/drivers/gpu/drm/mgag200/mgag200_main.c
index 2b59280777a5..5f74aabcd3df 100644
--- a/drivers/gpu/drm/mgag200/mgag200_main.c
+++ b/drivers/gpu/drm/mgag200/mgag200_main.c
@@ -159,7 +159,7 @@ int mgag200_driver_load(struct drm_device *dev, unsigned long flags)
 
 	drm_mode_config_init(dev);
 	dev->mode_config.funcs = (void *)&mga_mode_funcs;
-	if (IS_G200_SE(mdev) && mdev->mc.vram_size < (2048*1024))
+	if (IS_G200_SE(mdev) && mdev->vram_fb_available < (2048*1024))
 		dev->mode_config.preferred_depth = 16;
 	else
 		dev->mode_config.preferred_depth = 32;
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 0cf5608c3644..5ec697148fc1 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -1629,7 +1629,7 @@ static enum drm_mode_status mga_vga_mode_valid(struct drm_connector *connector,
 			bpp = connector->cmdline_mode.bpp;
 	}
 
-	if ((mode->hdisplay * mode->vdisplay * (bpp/8)) > mdev->mc.vram_size) {
+	if ((mode->hdisplay * mode->vdisplay * (bpp/8)) > mdev->vram_fb_available) {
 		if (connector->cmdline_mode.specified)
 			connector->cmdline_mode.specified = false;
 		return MODE_BAD;
diff --git a/drivers/gpu/drm/mgag200/mgag200_ttm.c b/drivers/gpu/drm/mgag200/mgag200_ttm.c
index 69c81ebf3745..99997d737362 100644
--- a/drivers/gpu/drm/mgag200/mgag200_ttm.c
+++ b/drivers/gpu/drm/mgag200/mgag200_ttm.c
@@ -50,6 +50,8 @@ int mgag200_mm_init(struct mga_device *mdev)
 	mdev->fb_mtrr = arch_phys_wc_add(pci_resource_start(dev->pdev, 0),
 					 pci_resource_len(dev->pdev, 0));
 
+	mdev->vram_fb_available = mdev->mc.vram_size;
+
 	return 0;
 }
 
@@ -57,6 +59,8 @@ void mgag200_mm_fini(struct mga_device *mdev)
 {
 	struct drm_device *dev = mdev->dev;
 
+	mdev->vram_fb_available = 0;
+
 	drm_vram_helper_release_mm(dev);
 
 	arch_io_free_memtype_wc(pci_resource_start(dev->pdev, 0),
-- 
2.23.0

