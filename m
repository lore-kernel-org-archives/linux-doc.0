Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E42297DD29
	for <lwn-linux-doc@archive.lwn.net>; Mon, 23 Sep 2019 17:28:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440164AbfIWR2F (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 23 Sep 2019 13:28:05 -0400
Received: from mx2.suse.de ([195.135.220.15]:46482 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2437873AbfIWR2E (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 23 Sep 2019 13:28:04 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 2D916B655;
        Mon, 23 Sep 2019 17:28:01 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
        sam@ravnborg.org, yc_chen@aspeedtech.com, corbet@lwn.net
Cc:     dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 12/12] drm/mgag200: Allocate cursor BOs at high end of video memory
Date:   Mon, 23 Sep 2019 19:27:53 +0200
Message-Id: <20190923172753.26593-13-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190923172753.26593-1-tzimmermann@suse.de>
References: <20190923172753.26593-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

By putting cursor BOs at the high end of the video memory, we can avoid
memory fragmentation. Starting at the low end, contiguous video memory is
available for framebuffers.

The patch also simplifies the buffer swapping and aligns it with the
ast driver. If there are more drivers with similar requirements, the
code could be moved into a shared place.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_cursor.c | 94 +++++++++++++-----------
 drivers/gpu/drm/mgag200/mgag200_drv.h    | 12 +--
 2 files changed, 52 insertions(+), 54 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_cursor.c b/drivers/gpu/drm/mgag200/mgag200_cursor.c
index 7f48abf80a6a..d65ee94d540c 100644
--- a/drivers/gpu/drm/mgag200/mgag200_cursor.c
+++ b/drivers/gpu/drm/mgag200/mgag200_cursor.c
@@ -121,39 +121,25 @@ static int mgag200_show_cursor(struct mga_device *mdev, void *src,
 			       unsigned int width, unsigned int height)
 {
 	struct drm_device *dev = mdev->dev;
-	struct drm_gem_vram_object *pixels_1 = mdev->cursor.pixels_1;
-	struct drm_gem_vram_object *pixels_2 = mdev->cursor.pixels_2;
-	struct drm_gem_vram_object *pixels_current = mdev->cursor.pixels_current;
-	struct drm_gem_vram_object *pixels_next;
+	struct drm_gem_vram_object *gbo;
 	void *dst;
 	s64 off;
 	int ret;
 
-	if (!pixels_1 || !pixels_2) {
+	gbo = mdev->cursor.gbo[mdev->cursor.next_index];
+	if (!gbo) {
 		WREG8(MGA_CURPOSXL, 0);
 		WREG8(MGA_CURPOSXH, 0);
 		return -ENOTSUPP; /* Didn't allocate space for cursors */
 	}
-
-	if (WARN_ON(pixels_current &&
-		    pixels_1 != pixels_current &&
-		    pixels_2 != pixels_current)) {
-		return -ENOTSUPP; /* inconsistent state */
-	}
-
-	if (pixels_current == pixels_1)
-		pixels_next = pixels_2;
-	else
-		pixels_next = pixels_1;
-
-	dst = drm_gem_vram_vmap(pixels_next);
+	dst = drm_gem_vram_vmap(gbo);
 	if (IS_ERR(dst)) {
 		ret = PTR_ERR(dst);
 		dev_err(&dev->pdev->dev,
 			"failed to map cursor updates: %d\n", ret);
 		return ret;
 	}
-	off = drm_gem_vram_offset(pixels_next);
+	off = drm_gem_vram_offset(gbo);
 	if (off < 0) {
 		ret = (int)off;
 		dev_err(&dev->pdev->dev,
@@ -169,16 +155,15 @@ static int mgag200_show_cursor(struct mga_device *mdev, void *src,
 	/* Adjust cursor control register to turn on the cursor */
 	WREG_DAC(MGA1064_CURSOR_CTL, 4); /* 16-colour palletized cursor mode */
 
-	if (pixels_current)
-		drm_gem_vram_unpin(pixels_current);
-	mdev->cursor.pixels_current = pixels_next;
+	drm_gem_vram_vunmap(gbo, dst);
 
-	drm_gem_vram_vunmap(pixels_next, dst);
+	++mdev->cursor.next_index;
+	mdev->cursor.next_index %= ARRAY_SIZE(mdev->cursor.gbo);
 
 	return 0;
 
 err_drm_gem_vram_vunmap:
-	drm_gem_vram_vunmap(pixels_next, dst);
+	drm_gem_vram_vunmap(gbo, dst);
 	return ret;
 }
 
@@ -190,9 +175,6 @@ static void mgag200_hide_cursor(struct mga_device *mdev)
 {
 	WREG8(MGA_CURPOSXL, 0);
 	WREG8(MGA_CURPOSXH, 0);
-	if (mdev->cursor.pixels_current)
-		drm_gem_vram_unpin(mdev->cursor.pixels_current);
-	mdev->cursor.pixels_current = NULL;
 }
 
 static void mgag200_move_cursor(struct mga_device *mdev, int x, int y)
@@ -216,27 +198,32 @@ static void mgag200_move_cursor(struct mga_device *mdev, int x, int y)
 int mgag200_cursor_init(struct mga_device *mdev)
 {
 	struct drm_device *dev = mdev->dev;
+	size_t ncursors = ARRAY_SIZE(mdev->cursor.gbo);
 	size_t size;
+	int ret;
+	size_t i;
+	struct drm_gem_vram_object *gbo;
 
 	size = roundup(64 * 48, PAGE_SIZE);
-	if (size * 2 > mdev->vram_fb_available)
+	if (size * ncursors > mdev->vram_fb_available)
 		return -ENOMEM;
 
-	/*
-	 * Make small buffers to store a hardware cursor (double
-	 * buffered icon updates)
-	 */
-	mdev->cursor.pixels_1 = drm_gem_vram_create(dev, &dev->vram_mm->bdev,
-						    size, 0, 0);
-	mdev->cursor.pixels_2 = drm_gem_vram_create(dev, &dev->vram_mm->bdev,
-						    size, 0, 0);
-	if (IS_ERR(mdev->cursor.pixels_2) || IS_ERR(mdev->cursor.pixels_1)) {
-		mdev->cursor.pixels_1 = NULL;
-		mdev->cursor.pixels_2 = NULL;
-		dev_warn(&dev->pdev->dev,
-			"Could not allocate space for cursors. Not doing hardware cursors.\n");
+	for (i = 0; i < ncursors; ++i) {
+		gbo = drm_gem_vram_create(dev, &dev->vram_mm->bdev,
+					  size, 0, false);
+		if (IS_ERR(gbo)) {
+			ret = PTR_ERR(gbo);
+			goto err_drm_gem_vram_put;
+		}
+		ret = drm_gem_vram_pin(gbo, DRM_GEM_VRAM_PL_FLAG_VRAM |
+					    DRM_GEM_VRAM_PL_FLAG_TOPDOWN);
+		if (ret) {
+			drm_gem_vram_put(gbo);
+			goto err_drm_gem_vram_put;
+		}
+
+		mdev->cursor.gbo[i] = gbo;
 	}
-	mdev->cursor.pixels_current = NULL;
 
 	/*
 	 * At the high end of video memory, we reserve space for
@@ -244,13 +231,32 @@ int mgag200_cursor_init(struct mga_device *mdev)
 	 * a double-buffered image of the current cursor. Hence, it's
 	 * not available for framebuffers.
 	 */
-	mdev->vram_fb_available -= 2 * size;
+	mdev->vram_fb_available -= ncursors * size;
 
 	return 0;
+
+err_drm_gem_vram_put:
+	while (i) {
+		--i;
+		gbo = mdev->cursor.gbo[i];
+		drm_gem_vram_unpin(gbo);
+		drm_gem_vram_put(gbo);
+		mdev->cursor.gbo[i] = NULL;
+	}
+	return ret;
 }
 
 void mgag200_cursor_fini(struct mga_device *mdev)
-{ }
+{
+	size_t i;
+	struct drm_gem_vram_object *gbo;
+
+	for (i = 0; i < ARRAY_SIZE(mdev->cursor.gbo); ++i) {
+		gbo = mdev->cursor.gbo[i];
+		drm_gem_vram_unpin(gbo);
+		drm_gem_vram_put(gbo);
+	}
+}
 
 int mgag200_crtc_cursor_set(struct drm_crtc *crtc, struct drm_file *file_priv,
 			    uint32_t handle, uint32_t width, uint32_t height)
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index 5d6cfc88697a..0ea9a525e57d 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -129,16 +129,8 @@ struct mga_connector {
 };
 
 struct mga_cursor {
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
+	struct drm_gem_vram_object *gbo[2];
+	unsigned int next_index;
 };
 
 struct mga_mc {
-- 
2.23.0

