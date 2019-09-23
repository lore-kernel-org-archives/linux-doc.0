Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8526B7DBD4
	for <lwn-linux-doc@archive.lwn.net>; Mon, 23 Sep 2019 17:28:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440169AbfIWR2E (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 23 Sep 2019 13:28:04 -0400
Received: from mx2.suse.de ([195.135.220.15]:46464 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2440167AbfIWR2E (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 23 Sep 2019 13:28:04 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 98A49B647;
        Mon, 23 Sep 2019 17:28:00 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
        sam@ravnborg.org, yc_chen@aspeedtech.com, corbet@lwn.net
Cc:     dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 10/12] drm/mgag200: Move cursor BO swapping into mgag200_show_cursor()
Date:   Mon, 23 Sep 2019 19:27:51 +0200
Message-Id: <20190923172753.26593-11-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190923172753.26593-1-tzimmermann@suse.de>
References: <20190923172753.26593-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Selecting the correct BO for the new cursor image is not relevant
outside of mgag200_show_cursor(). Let the function do the work.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_cursor.c | 120 +++++++++++------------
 1 file changed, 56 insertions(+), 64 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_cursor.c b/drivers/gpu/drm/mgag200/mgag200_cursor.c
index 13daa0ce1c9e..4a5b1aa921e0 100644
--- a/drivers/gpu/drm/mgag200/mgag200_cursor.c
+++ b/drivers/gpu/drm/mgag200/mgag200_cursor.c
@@ -117,21 +117,69 @@ static void mgag200_cursor_set_base(struct mga_device *mdev, u64 address)
 	WREG_DAC(MGA1064_CURSOR_BASE_ADR_HI, addrh);
 }
 
-static int mgag200_show_cursor(struct mga_device *mdev, void *dst, void *src,
-			       unsigned int width, unsigned int height,
-			       u64 dst_gpu)
+static int mgag200_show_cursor(struct mga_device *mdev, void *src,
+			       unsigned int width, unsigned int height)
 {
+	struct drm_device *dev = mdev->dev;
+	struct drm_gem_vram_object *pixels_1 = mdev->cursor.pixels_1;
+	struct drm_gem_vram_object *pixels_2 = mdev->cursor.pixels_2;
+	struct drm_gem_vram_object *pixels_current = mdev->cursor.pixels_current;
+	struct drm_gem_vram_object *pixels_next;
+	void *dst;
+	s64 off;
 	int ret;
 
+	if (!pixels_1 || !pixels_2) {
+		WREG8(MGA_CURPOSXL, 0);
+		WREG8(MGA_CURPOSXH, 0);
+		return -ENOTSUPP; /* Didn't allocate space for cursors */
+	}
+
+	if (WARN_ON(pixels_current &&
+		    pixels_1 != pixels_current &&
+		    pixels_2 != pixels_current)) {
+		return -ENOTSUPP; /* inconsistent state */
+	}
+
+	if (pixels_current == pixels_1)
+		pixels_next = pixels_2;
+	else
+		pixels_next = pixels_1;
+
+	dst = drm_gem_vram_vmap(pixels_next);
+	if (IS_ERR(dst)) {
+		ret = PTR_ERR(dst);
+		dev_err(&dev->pdev->dev,
+			"failed to map cursor updates: %d\n", ret);
+		return ret;
+	}
+	off = drm_gem_vram_offset(pixels_next);
+	if (off < 0) {
+		ret = (int)off;
+		dev_err(&dev->pdev->dev,
+			"failed to get cursor scanout address: %d\n", ret);
+		goto err_drm_gem_vram_vunmap;
+	}
+
 	ret = mgag200_cursor_update(mdev, dst, src, width, height);
 	if (ret)
-		return ret;
-	mgag200_cursor_set_base(mdev, dst_gpu);
+		goto err_drm_gem_vram_vunmap;
+	mgag200_cursor_set_base(mdev, off);
 
 	/* Adjust cursor control register to turn on the cursor */
 	WREG_DAC(MGA1064_CURSOR_CTL, 4); /* 16-colour palletized cursor mode */
 
+	if (pixels_current)
+		drm_gem_vram_unpin(pixels_current);
+	mdev->cursor.pixels_current = pixels_next;
+
+	drm_gem_vram_vunmap(pixels_next, dst);
+
 	return 0;
+
+err_drm_gem_vram_vunmap:
+	drm_gem_vram_vunmap(pixels_next, dst);
+	return ret;
 }
 
 /*
@@ -198,28 +246,10 @@ int mgag200_crtc_cursor_set(struct drm_crtc *crtc, struct drm_file *file_priv,
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
-
-	if (!pixels_1 || !pixels_2) {
-		WREG8(MGA_CURPOSXL, 0);
-		WREG8(MGA_CURPOSXH, 0);
-		return -ENOTSUPP; /* Didn't allocate space for cursors */
-	}
-
-	if (WARN_ON(pixels_current &&
-		    pixels_1 != pixels_current &&
-		    pixels_2 != pixels_current)) {
-		return -ENOTSUPP; /* inconsistent state */
-	}
+	u8 *src;
 
 	if (!handle || !file_priv) {
 		mgag200_hide_cursor(mdev);
@@ -232,11 +262,6 @@ int mgag200_crtc_cursor_set(struct drm_crtc *crtc, struct drm_file *file_priv,
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
@@ -249,48 +274,15 @@ int mgag200_crtc_cursor_set(struct drm_crtc *crtc, struct drm_file *file_priv,
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
+		goto err_drm_gem_vram_vunmap;
 
 	/* Now update internal buffer pointers */
-	if (pixels_current)
-		drm_gem_vram_unpin(pixels_current);
-	mdev->cursor.pixels_current = pixels_next;
-
-	drm_gem_vram_kunmap(pixels_next);
 	drm_gem_vram_vunmap(gbo, src);
 	drm_gem_object_put_unlocked(obj);
 
 	return 0;
-
-err_drm_gem_vram_kunmap_dst:
-	drm_gem_vram_kunmap(pixels_next);
-err_drm_gem_vram_unpin_dst:
-	drm_gem_vram_unpin(pixels_next);
 err_drm_gem_vram_vunmap:
 	drm_gem_vram_vunmap(gbo, src);
 err_drm_gem_object_put_unlocked:
-- 
2.23.0

