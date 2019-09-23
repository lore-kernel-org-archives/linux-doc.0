Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1AAC17DE5B
	for <lwn-linux-doc@archive.lwn.net>; Mon, 23 Sep 2019 17:28:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2440166AbfIWR2F (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 23 Sep 2019 13:28:05 -0400
Received: from mx2.suse.de ([195.135.220.15]:46466 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2440168AbfIWR2F (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 23 Sep 2019 13:28:05 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id A10FBB64F;
        Mon, 23 Sep 2019 17:28:00 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
        sam@ravnborg.org, yc_chen@aspeedtech.com, corbet@lwn.net
Cc:     dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 09/12] drm/mgag200: Move cursor-image update to mgag200_show_cursor()
Date:   Mon, 23 Sep 2019 19:27:50 +0200
Message-Id: <20190923172753.26593-10-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190923172753.26593-1-tzimmermann@suse.de>
References: <20190923172753.26593-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Separating the management of buffer objects from updating the hardware
cursor buffer gives the code more structure. While doing this, we can
further split the image-update code into code for writing the buffer,
setting the base scan-out address, and enabling the cursor. The first
two operations are in dedicated functions update() and set_base().

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/mgag200/mgag200_cursor.c | 221 +++++++++++++----------
 1 file changed, 126 insertions(+), 95 deletions(-)

diff --git a/drivers/gpu/drm/mgag200/mgag200_cursor.c b/drivers/gpu/drm/mgag200/mgag200_cursor.c
index 621960723a3a..13daa0ce1c9e 100644
--- a/drivers/gpu/drm/mgag200/mgag200_cursor.c
+++ b/drivers/gpu/drm/mgag200/mgag200_cursor.c
@@ -12,6 +12,128 @@
 static bool warn_transparent = true;
 static bool warn_palette = true;
 
+static int mgag200_cursor_update(struct mga_device *mdev, void *dst, void *src,
+				 unsigned int width, unsigned int height)
+{
+	struct drm_device *dev = mdev->dev;
+	unsigned int i, row, col;
+	uint32_t colour_set[16];
+	uint32_t *next_space = &colour_set[0];
+	uint32_t *palette_iter;
+	uint32_t this_colour;
+	bool found = false;
+	int colour_count = 0;
+	u8 reg_index;
+	u8 this_row[48];
+
+	memset(&colour_set[0], 0, sizeof(uint32_t)*16);
+	/* width*height*4 = 16384 */
+	for (i = 0; i < 16384; i += 4) {
+		this_colour = ioread32(src + i);
+		/* No transparency */
+		if (this_colour>>24 != 0xff &&
+			this_colour>>24 != 0x0) {
+			if (warn_transparent) {
+				dev_info(&dev->pdev->dev, "Video card doesn't support cursors with partial transparency.\n");
+				dev_info(&dev->pdev->dev, "Not enabling hardware cursor.\n");
+				warn_transparent = false; /* Only tell the user once. */
+			}
+			return -EINVAL;
+		}
+		/* Don't need to store transparent pixels as colours */
+		if (this_colour>>24 == 0x0)
+			continue;
+		found = false;
+		for (palette_iter = &colour_set[0]; palette_iter != next_space; palette_iter++) {
+			if (*palette_iter == this_colour) {
+				found = true;
+				break;
+			}
+		}
+		if (found)
+			continue;
+		/* We only support 4bit paletted cursors */
+		if (colour_count >= 16) {
+			if (warn_palette) {
+				dev_info(&dev->pdev->dev, "Video card only supports cursors with up to 16 colours.\n");
+				dev_info(&dev->pdev->dev, "Not enabling hardware cursor.\n");
+				warn_palette = false; /* Only tell the user once. */
+			}
+			return -EINVAL;
+		}
+		*next_space = this_colour;
+		next_space++;
+		colour_count++;
+	}
+
+	/* Program colours from cursor icon into palette */
+	for (i = 0; i < colour_count; i++) {
+		if (i <= 2)
+			reg_index = 0x8 + i*0x4;
+		else
+			reg_index = 0x60 + i*0x3;
+		WREG_DAC(reg_index, colour_set[i] & 0xff);
+		WREG_DAC(reg_index+1, colour_set[i]>>8 & 0xff);
+		WREG_DAC(reg_index+2, colour_set[i]>>16 & 0xff);
+		if (WARN_ON((colour_set[i]>>24 & 0xff) != 0xff))
+			return -EINVAL;
+	}
+
+	/* now write colour indices into hardware cursor buffer */
+	for (row = 0; row < 64; row++) {
+		memset(&this_row[0], 0, 48);
+		for (col = 0; col < 64; col++) {
+			this_colour = ioread32(src + 4*(col + 64*row));
+			/* write transparent pixels */
+			if (this_colour>>24 == 0x0) {
+				this_row[47 - col/8] |= 0x80>>(col%8);
+				continue;
+			}
+
+			/* write colour index here */
+			for (i = 0; i < colour_count; i++) {
+				if (colour_set[i] == this_colour) {
+					if (col % 2)
+						this_row[col/2] |= i<<4;
+					else
+						this_row[col/2] |= i;
+					break;
+				}
+			}
+		}
+		memcpy_toio(dst + row*48, &this_row[0], 48);
+	}
+
+	return 0;
+}
+
+static void mgag200_cursor_set_base(struct mga_device *mdev, u64 address)
+{
+	u8 addrl = (address >> 10) & 0xff;
+	u8 addrh = (address >> 18) & 0x3f;
+
+	/* Program gpu address of cursor buffer */
+	WREG_DAC(MGA1064_CURSOR_BASE_ADR_LOW, addrl);
+	WREG_DAC(MGA1064_CURSOR_BASE_ADR_HI, addrh);
+}
+
+static int mgag200_show_cursor(struct mga_device *mdev, void *dst, void *src,
+			       unsigned int width, unsigned int height,
+			       u64 dst_gpu)
+{
+	int ret;
+
+	ret = mgag200_cursor_update(mdev, dst, src, width, height);
+	if (ret)
+		return ret;
+	mgag200_cursor_set_base(mdev, dst_gpu);
+
+	/* Adjust cursor control register to turn on the cursor */
+	WREG_DAC(MGA1064_CURSOR_CTL, 4); /* 16-colour palletized cursor mode */
+
+	return 0;
+}
+
 /*
  * Hide the cursor off screen. We can't disable the cursor hardware because
  * it takes too long to re-activate and causes momentary corruption.
@@ -82,19 +204,10 @@ int mgag200_crtc_cursor_set(struct drm_crtc *crtc, struct drm_file *file_priv,
 	struct drm_gem_vram_object *pixels_next;
 	struct drm_gem_object *obj;
 	struct drm_gem_vram_object *gbo = NULL;
-	int ret = 0;
+	int ret;
 	u8 *src, *dst;
-	unsigned int i, row, col;
-	uint32_t colour_set[16];
-	uint32_t *next_space = &colour_set[0];
-	uint32_t *palette_iter;
-	uint32_t this_colour;
-	bool found = false;
-	int colour_count = 0;
 	s64 gpu_addr;
 	u64 dst_gpu;
-	u8 reg_index;
-	u8 this_row[48];
 
 	if (!pixels_1 || !pixels_2) {
 		WREG8(MGA_CURPOSXL, 0);
@@ -159,91 +272,9 @@ int mgag200_crtc_cursor_set(struct drm_crtc *crtc, struct drm_file *file_priv,
 	}
 	dst_gpu = (u64)gpu_addr;
 
-	memset(&colour_set[0], 0, sizeof(uint32_t)*16);
-	/* width*height*4 = 16384 */
-	for (i = 0; i < 16384; i += 4) {
-		this_colour = ioread32(src + i);
-		/* No transparency */
-		if (this_colour>>24 != 0xff &&
-			this_colour>>24 != 0x0) {
-			if (warn_transparent) {
-				dev_info(&dev->pdev->dev, "Video card doesn't support cursors with partial transparency.\n");
-				dev_info(&dev->pdev->dev, "Not enabling hardware cursor.\n");
-				warn_transparent = false; /* Only tell the user once. */
-			}
-			ret = -EINVAL;
-			goto err_drm_gem_vram_kunmap_dst;
-		}
-		/* Don't need to store transparent pixels as colours */
-		if (this_colour>>24 == 0x0)
-			continue;
-		found = false;
-		for (palette_iter = &colour_set[0]; palette_iter != next_space; palette_iter++) {
-			if (*palette_iter == this_colour) {
-				found = true;
-				break;
-			}
-		}
-		if (found)
-			continue;
-		/* We only support 4bit paletted cursors */
-		if (colour_count >= 16) {
-			if (warn_palette) {
-				dev_info(&dev->pdev->dev, "Video card only supports cursors with up to 16 colours.\n");
-				dev_info(&dev->pdev->dev, "Not enabling hardware cursor.\n");
-				warn_palette = false; /* Only tell the user once. */
-			}
-			ret = -EINVAL;
-			goto err_drm_gem_vram_kunmap_dst;
-		}
-		*next_space = this_colour;
-		next_space++;
-		colour_count++;
-	}
-
-	/* Program colours from cursor icon into palette */
-	for (i = 0; i < colour_count; i++) {
-		if (i <= 2)
-			reg_index = 0x8 + i*0x4;
-		else
-			reg_index = 0x60 + i*0x3;
-		WREG_DAC(reg_index, colour_set[i] & 0xff);
-		WREG_DAC(reg_index+1, colour_set[i]>>8 & 0xff);
-		WREG_DAC(reg_index+2, colour_set[i]>>16 & 0xff);
-		BUG_ON((colour_set[i]>>24 & 0xff) != 0xff);
-	}
-
-	/* now write colour indices into hardware cursor buffer */
-	for (row = 0; row < 64; row++) {
-		memset(&this_row[0], 0, 48);
-		for (col = 0; col < 64; col++) {
-			this_colour = ioread32(src + 4*(col + 64*row));
-			/* write transparent pixels */
-			if (this_colour>>24 == 0x0) {
-				this_row[47 - col/8] |= 0x80>>(col%8);
-				continue;
-			}
-
-			/* write colour index here */
-			for (i = 0; i < colour_count; i++) {
-				if (colour_set[i] == this_colour) {
-					if (col % 2)
-						this_row[col/2] |= i<<4;
-					else
-						this_row[col/2] |= i;
-					break;
-				}
-			}
-		}
-		memcpy_toio(dst + row*48, &this_row[0], 48);
-	}
-
-	/* Program gpu address of cursor buffer */
-	WREG_DAC(MGA1064_CURSOR_BASE_ADR_LOW, (u8)((dst_gpu>>10) & 0xff));
-	WREG_DAC(MGA1064_CURSOR_BASE_ADR_HI, (u8)((dst_gpu>>18) & 0x3f));
-
-	/* Adjust cursor control register to turn on the cursor */
-	WREG_DAC(MGA1064_CURSOR_CTL, 4); /* 16-colour palletized cursor mode */
+	ret = mgag200_show_cursor(mdev, dst, src, width, height, dst_gpu);
+	if (ret)
+		goto err_drm_gem_vram_kunmap_dst;
 
 	/* Now update internal buffer pointers */
 	if (pixels_current)
-- 
2.23.0

