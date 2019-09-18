Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C15EC7DBD4
	for <lwn-linux-doc@archive.lwn.net>; Wed, 18 Sep 2019 14:23:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730452AbfIROXR (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 18 Sep 2019 10:23:17 -0400
Received: from mx2.suse.de ([195.135.220.15]:33304 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730407AbfIROXQ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 18 Sep 2019 10:23:16 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 18B1DB682;
        Wed, 18 Sep 2019 14:23:13 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
        sam@ravnborg.org, yc_chen@aspeedtech.com, corbet@lwn.net
Cc:     dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 07/11] drm/mgag200: Add init and fini functions for cursor handling
Date:   Wed, 18 Sep 2019 16:23:03 +0200
Message-Id: <20190918142307.27127-8-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190918142307.27127-1-tzimmermann@suse.de>
References: <20190918142307.27127-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Moving the cursor initialization and cleanup into separate functions
makes the overall code slightly more readable.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_cursor.c | 28 ++++++++++++++++++++++++
 drivers/gpu/drm/mgag200/mgag200_drv.h    |  2 ++
 drivers/gpu/drm/mgag200/mgag200_main.c   | 18 +++++----------
 3 files changed, 35 insertions(+), 13 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_cursor.c b/drivers/gpu/drm/mgag200/mgag200_cursor.c
index 648357ad9a4b..c6a7ad11ca72 100644
--- a/drivers/gpu/drm/mgag200/mgag200_cursor.c
+++ b/drivers/gpu/drm/mgag200/mgag200_cursor.c
@@ -24,6 +24,34 @@ static void mgag200_hide_cursor(struct mga_device *mdev)
 	mdev->cursor.pixels_current = NULL;
 }
 
+int mgag200_cursor_init(struct mga_device *mdev)
+{
+	struct drm_device *dev = mdev->dev;
+
+	/*
+	 * Make small buffers to store a hardware cursor (double
+	 * buffered icon updates)
+	 */
+	mdev->cursor.pixels_1 = drm_gem_vram_create(dev, &dev->vram_mm->bdev,
+						    roundup(48*64, PAGE_SIZE),
+						    0, 0);
+	mdev->cursor.pixels_2 = drm_gem_vram_create(dev, &dev->vram_mm->bdev,
+						    roundup(48*64, PAGE_SIZE),
+						    0, 0);
+	if (IS_ERR(mdev->cursor.pixels_2) || IS_ERR(mdev->cursor.pixels_1)) {
+		mdev->cursor.pixels_1 = NULL;
+		mdev->cursor.pixels_2 = NULL;
+		dev_warn(&dev->pdev->dev,
+			"Could not allocate space for cursors. Not doing hardware cursors.\n");
+	}
+	mdev->cursor.pixels_current = NULL;
+
+	return 0;
+}
+
+void mgag200_cursor_fini(struct mga_device *mdev)
+{ }
+
 int mgag200_crtc_cursor_set(struct drm_crtc *crtc, struct drm_file *file_priv,
 			    uint32_t handle, uint32_t width, uint32_t height)
 {
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index 5244e3fa4203..01243fa6397c 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -203,6 +203,8 @@ int mgag200_mm_init(struct mga_device *mdev);
 void mgag200_mm_fini(struct mga_device *mdev);
 int mgag200_mmap(struct file *filp, struct vm_area_struct *vma);
 
+int mgag200_cursor_init(struct mga_device *mdev);
+void mgag200_cursor_fini(struct mga_device *mdev);
 int mgag200_crtc_cursor_set(struct drm_crtc *crtc, struct drm_file *file_priv,
 			    uint32_t handle, uint32_t width, uint32_t height);
 int mgag200_crtc_cursor_move(struct drm_crtc *crtc, int x, int y);
diff --git a/drivers/gpu/drm/mgag200/mgag200_main.c b/drivers/gpu/drm/mgag200/mgag200_main.c
index a9773334dedf..2b59280777a5 100644
--- a/drivers/gpu/drm/mgag200/mgag200_main.c
+++ b/drivers/gpu/drm/mgag200/mgag200_main.c
@@ -171,20 +171,10 @@ int mgag200_driver_load(struct drm_device *dev, unsigned long flags)
 		goto err_modeset;
 	}
 
-	/* Make small buffers to store a hardware cursor (double buffered icon updates) */
-	mdev->cursor.pixels_1 = drm_gem_vram_create(dev, &dev->vram_mm->bdev,
-						    roundup(48*64, PAGE_SIZE),
-						    0, 0);
-	mdev->cursor.pixels_2 = drm_gem_vram_create(dev, &dev->vram_mm->bdev,
-						    roundup(48*64, PAGE_SIZE),
-						    0, 0);
-	if (IS_ERR(mdev->cursor.pixels_2) || IS_ERR(mdev->cursor.pixels_1)) {
-		mdev->cursor.pixels_1 = NULL;
-		mdev->cursor.pixels_2 = NULL;
+	r = mgag200_cursor_init(mdev);
+	if (r)
 		dev_warn(&dev->pdev->dev,
-			"Could not allocate space for cursors. Not doing hardware cursors.\n");
-	}
-	mdev->cursor.pixels_current = NULL;
+			"Could not initialize cursors. Not doing hardware cursors.\n");
 
 	r = drm_fbdev_generic_setup(mdev->dev, 0);
 	if (r)
@@ -194,6 +184,7 @@ int mgag200_driver_load(struct drm_device *dev, unsigned long flags)
 
 err_modeset:
 	drm_mode_config_cleanup(dev);
+	mgag200_cursor_fini(mdev);
 	mgag200_mm_fini(mdev);
 err_mm:
 	dev->dev_private = NULL;
@@ -209,6 +200,7 @@ void mgag200_driver_unload(struct drm_device *dev)
 		return;
 	mgag200_modeset_fini(mdev);
 	drm_mode_config_cleanup(dev);
+	mgag200_cursor_fini(mdev);
 	mgag200_mm_fini(mdev);
 	dev->dev_private = NULL;
 }
-- 
2.23.0

