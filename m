Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 46D547D982
	for <lwn-linux-doc@archive.lwn.net>; Mon, 23 Sep 2019 17:28:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2437878AbfIWR2D (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 23 Sep 2019 13:28:03 -0400
Received: from mx2.suse.de ([195.135.220.15]:46384 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2440150AbfIWR2D (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 23 Sep 2019 13:28:03 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id A8FC1B0DA;
        Mon, 23 Sep 2019 17:27:59 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
        sam@ravnborg.org, yc_chen@aspeedtech.com, corbet@lwn.net
Cc:     dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 03/12] drm/ast: Move cursor update code to ast_show_cursor()
Date:   Mon, 23 Sep 2019 19:27:44 +0200
Message-Id: <20190923172753.26593-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190923172753.26593-1-tzimmermann@suse.de>
References: <20190923172753.26593-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

A call to ast's show-cursor function now receives the cursor image
and updates the buffer. The change splits off image update and
base-address update into separate functions.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_mode.c | 120 +++++++++++++++++++--------------
 1 file changed, 69 insertions(+), 51 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index a4cbf2d5ee0a..1294f0612fd5 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1064,23 +1064,6 @@ static void ast_i2c_destroy(struct ast_i2c_chan *i2c)
 	kfree(i2c);
 }
 
-static void ast_show_cursor(struct drm_crtc *crtc)
-{
-	struct ast_private *ast = crtc->dev->dev_private;
-	u8 jreg;
-
-	jreg = 0x2;
-	/* enable ARGB cursor */
-	jreg |= 1;
-	ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xcb, 0xfc, jreg);
-}
-
-static void ast_hide_cursor(struct drm_crtc *crtc)
-{
-	struct ast_private *ast = crtc->dev->dev_private;
-	ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xcb, 0xfc, 0x00);
-}
-
 static u32 copy_cursor_image(u8 *src, u8 *dst, int width, int height)
 {
 	union {
@@ -1137,6 +1120,72 @@ static u32 copy_cursor_image(u8 *src, u8 *dst, int width, int height)
 	return csum;
 }
 
+static int ast_cursor_update(void *dst, void *src, unsigned int width,
+			     unsigned int height)
+{
+	u32 csum;
+
+	/* do data transfer to cursor cache */
+	csum = copy_cursor_image(src, dst, width, height);
+
+	/* write checksum + signature */
+	dst += AST_HWC_SIZE;
+	writel(csum, dst);
+	writel(width, dst + AST_HWC_SIGNATURE_SizeX);
+	writel(height, dst + AST_HWC_SIGNATURE_SizeY);
+	writel(0, dst + AST_HWC_SIGNATURE_HOTSPOTX);
+	writel(0, dst + AST_HWC_SIGNATURE_HOTSPOTY);
+
+	return 0;
+}
+
+static void ast_cursor_set_base(struct ast_private *ast, u64 address)
+{
+	u8 addr0 = (address >> 3) & 0xff;
+	u8 addr1 = (address >> 11) & 0xff;
+	u8 addr2 = (address >> 19) & 0xff;
+
+	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xc8, addr0);
+	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xc9, addr1);
+	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xca, addr2);
+}
+
+static int ast_show_cursor(struct drm_crtc *crtc, void *dst, void *src,
+			   unsigned int width, unsigned int height,
+			   u64 dst_gpu)
+{
+	struct ast_private *ast = crtc->dev->dev_private;
+	struct ast_crtc *ast_crtc = to_ast_crtc(crtc);
+	int ret;
+	u8 jreg;
+
+	dst += (AST_HWC_SIZE + AST_HWC_SIGNATURE_SIZE)*ast->next_cursor;
+
+	ret = ast_cursor_update(dst, src, width, height);
+	if (ret)
+		return ret;
+	ast_cursor_set_base(ast, dst_gpu);
+
+	ast->next_cursor = (ast->next_cursor + 1) % AST_DEFAULT_HWC_NUM;
+
+	ast_crtc->offset_x = AST_MAX_HWC_WIDTH - width;
+	ast_crtc->offset_y = AST_MAX_HWC_WIDTH - height;
+
+	jreg = 0x2;
+	/* enable ARGB cursor */
+	jreg |= 1;
+	ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xcb, 0xfc, jreg);
+
+	return 0;
+}
+
+static void ast_hide_cursor(struct drm_crtc *crtc)
+{
+	struct ast_private *ast = crtc->dev->dev_private;
+
+	ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xcb, 0xfc, 0x00);
+}
+
 static int ast_cursor_set(struct drm_crtc *crtc,
 			  struct drm_file *file_priv,
 			  uint32_t handle,
@@ -1144,12 +1193,9 @@ static int ast_cursor_set(struct drm_crtc *crtc,
 			  uint32_t height)
 {
 	struct ast_private *ast = crtc->dev->dev_private;
-	struct ast_crtc *ast_crtc = to_ast_crtc(crtc);
 	struct drm_gem_object *obj;
 	struct drm_gem_vram_object *gbo;
 	s64 dst_gpu;
-	u64 gpu_addr;
-	u32 csum;
 	int ret;
 	u8 *src, *dst;
 
@@ -1185,37 +1231,9 @@ static int ast_cursor_set(struct drm_crtc *crtc,
 		goto err_drm_gem_vram_vunmap;
 	}
 
-	dst += (AST_HWC_SIZE + AST_HWC_SIGNATURE_SIZE)*ast->next_cursor;
-
-	/* do data transfer to cursor cache */
-	csum = copy_cursor_image(src, dst, width, height);
-
-	/* write checksum + signature */
-	{
-		struct drm_gem_vram_object *dst_gbo =
-			drm_gem_vram_of_gem(ast->cursor_cache);
-		u8 *dst = drm_gem_vram_kmap(dst_gbo, false, NULL);
-		dst += (AST_HWC_SIZE + AST_HWC_SIGNATURE_SIZE)*ast->next_cursor + AST_HWC_SIZE;
-		writel(csum, dst);
-		writel(width, dst + AST_HWC_SIGNATURE_SizeX);
-		writel(height, dst + AST_HWC_SIGNATURE_SizeY);
-		writel(0, dst + AST_HWC_SIGNATURE_HOTSPOTX);
-		writel(0, dst + AST_HWC_SIGNATURE_HOTSPOTY);
-
-		/* set pattern offset */
-		gpu_addr = (u64)dst_gpu;
-		gpu_addr += (AST_HWC_SIZE + AST_HWC_SIGNATURE_SIZE)*ast->next_cursor;
-		gpu_addr >>= 3;
-		ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xc8, gpu_addr & 0xff);
-		ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xc9, (gpu_addr >> 8) & 0xff);
-		ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xca, (gpu_addr >> 16) & 0xff);
-	}
-	ast_crtc->offset_x = AST_MAX_HWC_WIDTH - width;
-	ast_crtc->offset_y = AST_MAX_HWC_WIDTH - height;
-
-	ast->next_cursor = (ast->next_cursor + 1) % AST_DEFAULT_HWC_NUM;
-
-	ast_show_cursor(crtc);
+	ret = ast_show_cursor(crtc, dst, src, width, height, dst_gpu);
+	if (ret)
+		goto err_drm_gem_vram_kunmap;
 
 	drm_gem_vram_vunmap(gbo, src);
 	drm_gem_object_put_unlocked(obj);
-- 
2.23.0

