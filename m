Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 013017DC63
	for <lwn-linux-doc@archive.lwn.net>; Wed, 18 Sep 2019 14:23:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730235AbfIROXT (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 18 Sep 2019 10:23:19 -0400
Received: from mx2.suse.de ([195.135.220.15]:33358 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730723AbfIROXS (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 18 Sep 2019 10:23:18 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 1670CB689;
        Wed, 18 Sep 2019 14:23:15 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
        sam@ravnborg.org, yc_chen@aspeedtech.com, corbet@lwn.net
Cc:     dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 11/11] drm/mgag200: Implement cursor buffer with struct drm_vram_buffer
Date:   Wed, 18 Sep 2019 16:23:07 +0200
Message-Id: <20190918142307.27127-12-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190918142307.27127-1-tzimmermann@suse.de>
References: <20190918142307.27127-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The new VRAM buffer replaces all GEM buffer objects that contained cursor
images. The buffer maintains the previously reserved memory at the high
end of video RAM. The update() and set_base() now serve as callbacks for
the VRAM buffer.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_cursor.c | 124 +++++++----------------
 drivers/gpu/drm/mgag200/mgag200_drv.h    |  16 +--
 2 files changed, 38 insertions(+), 102 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_cursor.c b/drivers/gpu/drm/mgag200/mgag200_cursor.c
index ab3dfe6bdd92..650013e488c2 100644
--- a/drivers/gpu/drm/mgag200/mgag200_cursor.c
+++ b/drivers/gpu/drm/mgag200/mgag200_cursor.c
@@ -12,9 +12,12 @@
 static bool warn_transparent = true;
 static bool warn_palette = true;
 
-static int mgag200_cursor_update(struct mga_device *mdev, void *dst, void *src,
-				 unsigned int width, unsigned int height)
+static int mgag200_cursor_vram_buffer_update(struct drm_vram_buffer *vbuf,
+					     void *dst, void *src,
+					     unsigned int width,
+					     unsigned int height)
 {
+	struct mga_device *mdev = container_of(vbuf, struct mga_device, cursor);
 	struct drm_device *dev = mdev->dev;
 	unsigned int i, row, col;
 	uint32_t colour_set[16];
@@ -107,8 +110,10 @@ static int mgag200_cursor_update(struct mga_device *mdev, void *dst, void *src,
 	return 0;
 }
 
-static void mgag200_cursor_set_base(struct mga_device *mdev, u64 address)
+static void mgag200_cursor_vram_buffer_set_base(struct drm_vram_buffer *vbuf,
+						u64 address)
 {
+	struct mga_device *mdev = container_of(vbuf, struct mga_device, cursor);
 	u8 addrl = (address >> 10) & 0xff;
 	u8 addrh = (address >> 18) & 0x3f;
 
@@ -117,16 +122,20 @@ static void mgag200_cursor_set_base(struct mga_device *mdev, u64 address)
 	WREG_DAC(MGA1064_CURSOR_BASE_ADR_HI, addrh);
 }
 
-static int mgag200_show_cursor(struct mga_device *mdev, void *dst, void *src,
-			       unsigned int width, unsigned int height,
-			       u64 dst_gpu)
+static const struct drm_vram_buffer_funcs mgag200_cursor_vram_buffer_funcs = {
+	.update = mgag200_cursor_vram_buffer_update,
+	.set_base = mgag200_cursor_vram_buffer_set_base
+};
+
+static int mgag200_show_cursor(struct mga_device *mdev, void *src,
+			       unsigned int width, unsigned int height)
 {
 	int ret;
 
-	ret = mgag200_cursor_update(mdev, dst, src, width, height);
+	ret = drm_vram_buffer_update(&mdev->cursor, src, width, height);
 	if (ret)
 		return ret;
-	mgag200_cursor_set_base(mdev, dst_gpu);
+	drm_vram_buffer_swap(&mdev->cursor);
 
 	/* Adjust cursor control register to turn on the cursor */
 	WREG_DAC(MGA1064_CURSOR_CTL, 4); /* 16-colour palletized cursor mode */
@@ -141,9 +150,6 @@ static void mgag200_hide_cursor(struct mga_device *mdev)
 {
 	WREG8(MGA_CURPOSXL, 0);
 	WREG8(MGA_CURPOSXH, 0);
-	if (mdev->cursor.pixels_current)
-		drm_gem_vram_unpin(mdev->cursor.pixels_current);
-	mdev->cursor.pixels_current = NULL;
 }
 
 static void mgag200_move_cursor(struct mga_device *mdev, int x, int y)
@@ -167,58 +173,39 @@ static void mgag200_move_cursor(struct mga_device *mdev, int x, int y)
 int mgag200_cursor_init(struct mga_device *mdev)
 {
 	struct drm_device *dev = mdev->dev;
+	unsigned long base, frame_size, nframes, size;
+	int ret;
 
-	/*
-	 * Make small buffers to store a hardware cursor (double
-	 * buffered icon updates)
-	 */
-	mdev->cursor.pixels_1 = drm_gem_vram_create(dev, &dev->vram_mm->bdev,
-						    roundup(48*64, PAGE_SIZE),
-						    0, 0);
-	mdev->cursor.pixels_2 = drm_gem_vram_create(dev, &dev->vram_mm->bdev,
-						    roundup(48*64, PAGE_SIZE),
-						    0, 0);
-	if (IS_ERR(mdev->cursor.pixels_2) || IS_ERR(mdev->cursor.pixels_1)) {
-		mdev->cursor.pixels_1 = NULL;
-		mdev->cursor.pixels_2 = NULL;
-		dev_warn(&dev->pdev->dev,
-			"Could not allocate space for cursors. Not doing hardware cursors.\n");
-	}
-	mdev->cursor.pixels_current = NULL;
+	base = mdev->mc.vram_base + dev->vram_mm->vram_size;
+	frame_size = roundup(64 * 48, 1024);
+	nframes = 2;
+	size = roundup(frame_size * nframes, PAGE_SIZE);
+
+	ret = drm_vram_buffer_init(&mdev->cursor, base, size, frame_size,
+				   nframes, &mgag200_cursor_vram_buffer_funcs);
+	if (ret)
+		return ret;
 
 	return 0;
 }
 
 void mgag200_cursor_fini(struct mga_device *mdev)
-{ }
+{
+	drm_vram_buffer_cleanup(&mdev->cursor);
+}
 
 int mgag200_crtc_cursor_set(struct drm_crtc *crtc, struct drm_file *file_priv,
 			    uint32_t handle, uint32_t width, uint32_t height)
 {
 	struct drm_device *dev = crtc->dev;
 	struct mga_device *mdev = (struct mga_device *)dev->dev_private;
-	struct drm_gem_vram_object *pixels_1 = mdev->cursor.pixels_1;
-	struct drm_gem_vram_object *pixels_2 = mdev->cursor.pixels_2;
-	struct drm_gem_vram_object *pixels_current = mdev->cursor.pixels_current;
-	struct drm_gem_vram_object *pixels_next;
 	struct drm_gem_object *obj;
 	struct drm_gem_vram_object *gbo = NULL;
 	int ret;
-	u8 *src, *dst;
-	s64 gpu_addr;
-	u64 dst_gpu;
+	u8 *src;
 
-	if (!pixels_1 || !pixels_2) {
-		WREG8(MGA_CURPOSXL, 0);
-		WREG8(MGA_CURPOSXH, 0);
+	if (!mdev->cursor.mem)
 		return -ENOTSUPP; /* Didn't allocate space for cursors */
-	}
-
-	if (WARN_ON(pixels_current &&
-		    pixels_1 != pixels_current &&
-		    pixels_2 != pixels_current)) {
-		return -ENOTSUPP; /* inconsistent state */
-	}
 
 	if (!handle || !file_priv) {
 		mgag200_hide_cursor(mdev);
@@ -226,16 +213,10 @@ int mgag200_crtc_cursor_set(struct drm_crtc *crtc, struct drm_file *file_priv,
 	}
 
 	if (width != 64 || height != 64) {
-		WREG8(MGA_CURPOSXL, 0);
-		WREG8(MGA_CURPOSXH, 0);
+		mgag200_hide_cursor(mdev);
 		return -EINVAL;
 	}
 
-	if (pixels_current == pixels_1)
-		pixels_next = pixels_2;
-	else
-		pixels_next = pixels_1;
-
 	obj = drm_gem_object_lookup(file_priv, handle);
 	if (!obj)
 		return -ENOENT;
@@ -248,48 +229,15 @@ int mgag200_crtc_cursor_set(struct drm_crtc *crtc, struct drm_file *file_priv,
 		goto err_drm_gem_object_put_unlocked;
 	}
 
-	/* Pin and map up-coming buffer to write colour indices */
-	ret = drm_gem_vram_pin(pixels_next, DRM_GEM_VRAM_PL_FLAG_VRAM);
-	if (ret) {
-		dev_err(&dev->pdev->dev,
-			"failed to pin cursor buffer: %d\n", ret);
-		goto err_drm_gem_vram_vunmap;
-	}
-	dst = drm_gem_vram_kmap(pixels_next, true, NULL);
-	if (IS_ERR(dst)) {
-		ret = PTR_ERR(dst);
-		dev_err(&dev->pdev->dev,
-			"failed to kmap cursor updates: %d\n", ret);
-		goto err_drm_gem_vram_unpin_dst;
-	}
-	gpu_addr = drm_gem_vram_offset(pixels_next);
-	if (gpu_addr < 0) {
-		ret = (int)gpu_addr;
-		dev_err(&dev->pdev->dev,
-			"failed to get cursor scanout address: %d\n", ret);
-		goto err_drm_gem_vram_kunmap_dst;
-	}
-	dst_gpu = (u64)gpu_addr;
-
-	ret = mgag200_show_cursor(mdev, dst, src, width, height, dst_gpu);
+	ret = mgag200_show_cursor(mdev, src, width, height);
 	if (ret)
-		goto err_drm_gem_vram_kunmap_dst;
-
-	/* Now update internal buffer pointers */
-	if (pixels_current)
-		drm_gem_vram_unpin(pixels_current);
-	mdev->cursor.pixels_current = pixels_next;
+		goto err_drm_gem_vram_vunmap;
 
-	drm_gem_vram_kunmap(pixels_next);
 	drm_gem_vram_vunmap(gbo, src);
 	drm_gem_object_put_unlocked(obj);
 
 	return 0;
 
-err_drm_gem_vram_kunmap_dst:
-	drm_gem_vram_kunmap(pixels_next);
-err_drm_gem_vram_unpin_dst:
-	drm_gem_vram_unpin(pixels_next);
 err_drm_gem_vram_vunmap:
 	drm_gem_vram_vunmap(gbo, src);
 err_drm_gem_object_put_unlocked:
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index 01243fa6397c..7ced98d61c22 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -19,6 +19,7 @@
 #include <drm/drm_fb_helper.h>
 #include <drm/drm_gem.h>
 #include <drm/drm_gem_vram_helper.h>
+#include <drm/drm_vram_helper.h>
 
 #include "mgag200_reg.h"
 
@@ -128,19 +129,6 @@ struct mga_connector {
 	struct mga_i2c_chan *i2c;
 };
 
-struct mga_cursor {
-	/*
-	   We have to have 2 buffers for the cursor to avoid occasional
-	   corruption while switching cursor icons.
-	   If either of these is NULL, then don't do hardware cursors, and
-	   fall back to software.
-	*/
-	struct drm_gem_vram_object *pixels_1;
-	struct drm_gem_vram_object *pixels_2;
-	/* The currently displayed icon, this points to one of pixels_1, or pixels_2 */
-	struct drm_gem_vram_object *pixels_current;
-};
-
 struct mga_mc {
 	resource_size_t			vram_size;
 	resource_size_t			vram_base;
@@ -171,7 +159,7 @@ struct mga_device {
 	struct mga_mc			mc;
 	struct mga_mode_info		mode_info;
 
-	struct mga_cursor cursor;
+	struct drm_vram_buffer cursor;
 
 	bool				suspended;
 	int				num_crtc;
-- 
2.23.0

