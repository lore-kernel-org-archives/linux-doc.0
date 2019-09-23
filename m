Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9A39A7DBEB
	for <lwn-linux-doc@archive.lwn.net>; Mon, 23 Sep 2019 17:28:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440167AbfIWR2E (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 23 Sep 2019 13:28:04 -0400
Received: from mx2.suse.de ([195.135.220.15]:46428 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2440160AbfIWR2E (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 23 Sep 2019 13:28:04 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 88E5BB623;
        Mon, 23 Sep 2019 17:28:00 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
        sam@ravnborg.org, yc_chen@aspeedtech.com, corbet@lwn.net
Cc:     dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 06/12] drm/mgag200: Rename cursor functions to use mgag200_ prefix
Date:   Mon, 23 Sep 2019 19:27:47 +0200
Message-Id: <20190923172753.26593-7-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190923172753.26593-1-tzimmermann@suse.de>
References: <20190923172753.26593-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Although the driver source code is fairly inconsistent wrt naming, the
prefix should be mgag200. Rename cursor functions accordingly.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_cursor.c | 19 ++++++++-----------
 drivers/gpu/drm/mgag200/mgag200_drv.h    |  6 +++---
 drivers/gpu/drm/mgag200/mgag200_mode.c   |  4 ++--
 3 files changed, 13 insertions(+), 16 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_cursor.c b/drivers/gpu/drm/mgag200/mgag200_cursor.c
index 89f61573a497..3df70d86af21 100644
--- a/drivers/gpu/drm/mgag200/mgag200_cursor.c
+++ b/drivers/gpu/drm/mgag200/mgag200_cursor.c
@@ -13,10 +13,10 @@ static bool warn_transparent = true;
 static bool warn_palette = true;
 
 /*
-  Hide the cursor off screen. We can't disable the cursor hardware because it
-  takes too long to re-activate and causes momentary corruption
-*/
-static void mga_hide_cursor(struct mga_device *mdev)
+ * Hide the cursor off screen. We can't disable the cursor hardware because
+ * it takes too long to re-activate and causes momentary corruption.
+ */
+static void mgag200_hide_cursor(struct mga_device *mdev)
 {
 	WREG8(MGA_CURPOSXL, 0);
 	WREG8(MGA_CURPOSXH, 0);
@@ -25,11 +25,8 @@ static void mga_hide_cursor(struct mga_device *mdev)
 	mdev->cursor.pixels_current = NULL;
 }
 
-int mga_crtc_cursor_set(struct drm_crtc *crtc,
-			struct drm_file *file_priv,
-			uint32_t handle,
-			uint32_t width,
-			uint32_t height)
+int mgag200_crtc_cursor_set(struct drm_crtc *crtc, struct drm_file *file_priv,
+			    uint32_t handle, uint32_t width, uint32_t height)
 {
 	struct drm_device *dev = crtc->dev;
 	struct mga_device *mdev = (struct mga_device *)dev->dev_private;
@@ -66,7 +63,7 @@ int mga_crtc_cursor_set(struct drm_crtc *crtc,
 	}
 
 	if (!handle || !file_priv) {
-		mga_hide_cursor(mdev);
+		mgag200_hide_cursor(mdev);
 		return 0;
 	}
 
@@ -224,7 +221,7 @@ int mga_crtc_cursor_set(struct drm_crtc *crtc,
 	return ret;
 }
 
-int mga_crtc_cursor_move(struct drm_crtc *crtc, int x, int y)
+int mgag200_crtc_cursor_move(struct drm_crtc *crtc, int x, int y)
 {
 	struct mga_device *mdev = (struct mga_device *)crtc->dev->dev_private;
 	/* Our origin is at (64,64) */
diff --git a/drivers/gpu/drm/mgag200/mgag200_drv.h b/drivers/gpu/drm/mgag200/mgag200_drv.h
index 37c003ed57c0..5244e3fa4203 100644
--- a/drivers/gpu/drm/mgag200/mgag200_drv.h
+++ b/drivers/gpu/drm/mgag200/mgag200_drv.h
@@ -203,8 +203,8 @@ int mgag200_mm_init(struct mga_device *mdev);
 void mgag200_mm_fini(struct mga_device *mdev);
 int mgag200_mmap(struct file *filp, struct vm_area_struct *vma);
 
-int mga_crtc_cursor_set(struct drm_crtc *crtc, struct drm_file *file_priv,
-						uint32_t handle, uint32_t width, uint32_t height);
-int mga_crtc_cursor_move(struct drm_crtc *crtc, int x, int y);
+int mgag200_crtc_cursor_set(struct drm_crtc *crtc, struct drm_file *file_priv,
+			    uint32_t handle, uint32_t width, uint32_t height);
+int mgag200_crtc_cursor_move(struct drm_crtc *crtc, int x, int y);
 
 #endif				/* __MGAG200_DRV_H__ */
diff --git a/drivers/gpu/drm/mgag200/mgag200_mode.c b/drivers/gpu/drm/mgag200/mgag200_mode.c
index 68226556044b..0cf5608c3644 100644
--- a/drivers/gpu/drm/mgag200/mgag200_mode.c
+++ b/drivers/gpu/drm/mgag200/mgag200_mode.c
@@ -1413,8 +1413,8 @@ static void mga_crtc_disable(struct drm_crtc *crtc)
 
 /* These provide the minimum set of functions required to handle a CRTC */
 static const struct drm_crtc_funcs mga_crtc_funcs = {
-	.cursor_set = mga_crtc_cursor_set,
-	.cursor_move = mga_crtc_cursor_move,
+	.cursor_set = mgag200_crtc_cursor_set,
+	.cursor_move = mgag200_crtc_cursor_move,
 	.gamma_set = mga_crtc_gamma_set,
 	.set_config = drm_crtc_helper_set_config,
 	.destroy = mga_crtc_destroy,
-- 
2.23.0

