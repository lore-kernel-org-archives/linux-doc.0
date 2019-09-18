Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 40DC97D91B
	for <lwn-linux-doc@archive.lwn.net>; Wed, 18 Sep 2019 14:23:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729911AbfIROXQ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 18 Sep 2019 10:23:16 -0400
Received: from mx2.suse.de ([195.135.220.15]:33300 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1730374AbfIROXQ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 18 Sep 2019 10:23:16 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id D5C65B67D;
        Wed, 18 Sep 2019 14:23:12 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
        sam@ravnborg.org, yc_chen@aspeedtech.com, corbet@lwn.net
Cc:     dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 05/11] drm/ast: Store cursor in reserved memory area
Date:   Wed, 18 Sep 2019 16:23:01 +0200
Message-Id: <20190918142307.27127-6-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190918142307.27127-1-tzimmermann@suse.de>
References: <20190918142307.27127-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

An instance of struct drm_vram_buffer maintains the memory area at the
high end of video memory. The VRAM buffer replaces the GEM-based buffers
and ast's buffer swapping. Two frames provide double buffering; with each
frame aligned to 8 bytes, as required by the hardware.

The full cursor update is currently performed in ast_show_cursor(). After
conversing the ast driver to atomic mode setting, The update of the
cursor's back buffer can be performed in the cursor plane's implementation
of prepare_fb(). The swap operation can be performed in the cursor plane's
implementation of atomic_update().

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_drv.h  |   5 +-
 drivers/gpu/drm/ast/ast_mode.c | 103 ++++++++++++---------------------
 2 files changed, 41 insertions(+), 67 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_drv.h b/drivers/gpu/drm/ast/ast_drv.h
index 244cc7c382af..d459ede43384 100644
--- a/drivers/gpu/drm/ast/ast_drv.h
+++ b/drivers/gpu/drm/ast/ast_drv.h
@@ -39,6 +39,7 @@
 #include <drm/drm_mode.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_fb_helper.h>
+#include <drm/drm_vram_helper.h>
 
 #define DRIVER_AUTHOR		"Dave Airlie"
 
@@ -97,8 +98,8 @@ struct ast_private {
 
 	int fb_mtrr;
 
-	struct drm_gem_object *cursor_cache;
-	int next_cursor;
+	struct drm_vram_buffer cursor;
+
 	bool support_wide_screen;
 	enum {
 		ast_use_p2a,
diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 1294f0612fd5..5a55ee587df0 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -51,6 +51,8 @@ static int ast_cursor_set(struct drm_crtc *crtc,
 static int ast_cursor_move(struct drm_crtc *crtc,
 			   int x, int y);
 
+static const struct drm_vram_buffer_funcs ast_cursor_vram_buffer_funcs;
+
 static inline void ast_load_palette_index(struct ast_private *ast,
 				     u8 index, u8 red, u8 green,
 				     u8 blue)
@@ -883,50 +885,26 @@ static int ast_connector_init(struct drm_device *dev)
 static int ast_cursor_init(struct drm_device *dev)
 {
 	struct ast_private *ast = dev->dev_private;
-	int size;
+	unsigned long base = pci_resource_start(dev->pdev, 0) +
+			     dev->vram_mm->vram_size;
+	unsigned long size = ast->vram_size - dev->vram_mm->vram_size;
+	unsigned long frame_size = size / AST_DEFAULT_HWC_NUM;
 	int ret;
-	struct drm_gem_object *obj;
-	struct drm_gem_vram_object *gbo;
-	s64 gpu_addr;
-	void *base;
 
-	size = (AST_HWC_SIZE + AST_HWC_SIGNATURE_SIZE) * AST_DEFAULT_HWC_NUM;
-
-	ret = ast_gem_create(dev, size, true, &obj);
+	ret = drm_vram_buffer_init(&ast->cursor, base, size, frame_size,
+				   AST_DEFAULT_HWC_NUM,
+				   &ast_cursor_vram_buffer_funcs);
 	if (ret)
 		return ret;
-	gbo = drm_gem_vram_of_gem(obj);
-	ret = drm_gem_vram_pin(gbo, DRM_GEM_VRAM_PL_FLAG_VRAM);
-	if (ret)
-		goto fail;
-	gpu_addr = drm_gem_vram_offset(gbo);
-	if (gpu_addr < 0) {
-		drm_gem_vram_unpin(gbo);
-		ret = (int)gpu_addr;
-		goto fail;
-	}
-
-	/* kmap the object */
-	base = drm_gem_vram_kmap(gbo, true, NULL);
-	if (IS_ERR(base)) {
-		ret = PTR_ERR(base);
-		goto fail;
-	}
 
-	ast->cursor_cache = obj;
 	return 0;
-fail:
-	return ret;
 }
 
 static void ast_cursor_fini(struct drm_device *dev)
 {
 	struct ast_private *ast = dev->dev_private;
-	struct drm_gem_vram_object *gbo =
-		drm_gem_vram_of_gem(ast->cursor_cache);
-	drm_gem_vram_kunmap(gbo);
-	drm_gem_vram_unpin(gbo);
-	drm_gem_object_put_unlocked(ast->cursor_cache);
+
+	drm_vram_buffer_cleanup(&ast->cursor);
 }
 
 int ast_mode_init(struct drm_device *dev)
@@ -1120,8 +1098,10 @@ static u32 copy_cursor_image(u8 *src, u8 *dst, int width, int height)
 	return csum;
 }
 
-static int ast_cursor_update(void *dst, void *src, unsigned int width,
-			     unsigned int height)
+static int ast_cursor_vram_buffer_update(struct drm_vram_buffer *vbuf,
+					 void *dst, void *src,
+					 unsigned int width,
+					 unsigned int height)
 {
 	u32 csum;
 
@@ -1139,8 +1119,12 @@ static int ast_cursor_update(void *dst, void *src, unsigned int width,
 	return 0;
 }
 
-static void ast_cursor_set_base(struct ast_private *ast, u64 address)
+static void ast_cursor_vram_buffer_set_base(struct drm_vram_buffer *vbuf,
+					    u64 address)
 {
+	struct ast_private *ast = container_of(vbuf, struct ast_private,
+					       cursor);
+
 	u8 addr0 = (address >> 3) & 0xff;
 	u8 addr1 = (address >> 11) & 0xff;
 	u8 addr2 = (address >> 19) & 0xff;
@@ -1150,23 +1134,23 @@ static void ast_cursor_set_base(struct ast_private *ast, u64 address)
 	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xca, addr2);
 }
 
-static int ast_show_cursor(struct drm_crtc *crtc, void *dst, void *src,
-			   unsigned int width, unsigned int height,
-			   u64 dst_gpu)
+static const struct drm_vram_buffer_funcs ast_cursor_vram_buffer_funcs = {
+	.update = ast_cursor_vram_buffer_update,
+	.set_base = ast_cursor_vram_buffer_set_base
+};
+
+static int ast_show_cursor(struct drm_crtc *crtc, void *src,
+			   unsigned int width, unsigned int height)
 {
 	struct ast_private *ast = crtc->dev->dev_private;
 	struct ast_crtc *ast_crtc = to_ast_crtc(crtc);
 	int ret;
 	u8 jreg;
 
-	dst += (AST_HWC_SIZE + AST_HWC_SIGNATURE_SIZE)*ast->next_cursor;
-
-	ret = ast_cursor_update(dst, src, width, height);
+	ret = drm_vram_buffer_update(&ast->cursor, src, width, height);
 	if (ret)
 		return ret;
-	ast_cursor_set_base(ast, dst_gpu);
-
-	ast->next_cursor = (ast->next_cursor + 1) % AST_DEFAULT_HWC_NUM;
+	drm_vram_buffer_swap(&ast->cursor);
 
 	ast_crtc->offset_x = AST_MAX_HWC_WIDTH - width;
 	ast_crtc->offset_y = AST_MAX_HWC_WIDTH - height;
@@ -1192,12 +1176,10 @@ static int ast_cursor_set(struct drm_crtc *crtc,
 			  uint32_t width,
 			  uint32_t height)
 {
-	struct ast_private *ast = crtc->dev->dev_private;
 	struct drm_gem_object *obj;
 	struct drm_gem_vram_object *gbo;
-	s64 dst_gpu;
 	int ret;
-	u8 *src, *dst;
+	u8 *src;
 
 	if (!handle) {
 		ast_hide_cursor(crtc);
@@ -1219,21 +1201,9 @@ static int ast_cursor_set(struct drm_crtc *crtc,
 		goto err_drm_gem_object_put_unlocked;
 	}
 
-	dst = drm_gem_vram_kmap(drm_gem_vram_of_gem(ast->cursor_cache),
-				false, NULL);
-	if (IS_ERR(dst)) {
-		ret = PTR_ERR(dst);
-		goto err_drm_gem_vram_vunmap;
-	}
-	dst_gpu = drm_gem_vram_offset(drm_gem_vram_of_gem(ast->cursor_cache));
-	if (dst_gpu < 0) {
-		ret = (int)dst_gpu;
-		goto err_drm_gem_vram_vunmap;
-	}
-
-	ret = ast_show_cursor(crtc, dst, src, width, height, dst_gpu);
+	ret = ast_show_cursor(crtc, src, width, height);
 	if (ret)
-		goto err_drm_gem_vram_kunmap;
+		goto err_drm_gem_vram_vunmap;
 
 	drm_gem_vram_vunmap(gbo, src);
 	drm_gem_object_put_unlocked(obj);
@@ -1256,9 +1226,12 @@ static int ast_cursor_move(struct drm_crtc *crtc,
 	u8 *sig;
 	u8 jreg;
 
-	sig = drm_gem_vram_kmap(drm_gem_vram_of_gem(ast->cursor_cache),
-				false, NULL);
-	sig += (AST_HWC_SIZE + AST_HWC_SIGNATURE_SIZE)*ast->next_cursor + AST_HWC_SIZE;
+	/* FIXME: If the cursor position is a required part of the
+	 *        signature, this code updates the wrong frame. If
+	 *        not, what is the purpose of this code?
+	 */
+	sig  = drm_vram_buffer_get(&ast->cursor);
+	sig += AST_HWC_SIZE;
 	writel(x, sig + AST_HWC_SIGNATURE_X);
 	writel(y, sig + AST_HWC_SIGNATURE_Y);
 
-- 
2.23.0

