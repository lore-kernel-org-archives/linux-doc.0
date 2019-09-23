Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 312A47D981
	for <lwn-linux-doc@archive.lwn.net>; Mon, 23 Sep 2019 17:28:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2439938AbfIWR2D (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 23 Sep 2019 13:28:03 -0400
Received: from mx2.suse.de ([195.135.220.15]:46338 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2437878AbfIWR2C (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 23 Sep 2019 13:28:02 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id A9535B601;
        Mon, 23 Sep 2019 17:27:59 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
        sam@ravnborg.org, yc_chen@aspeedtech.com, corbet@lwn.net
Cc:     dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 04/12] drm/ast: Move cursor offset swapping into ast_show_cursor()
Date:   Mon, 23 Sep 2019 19:27:45 +0200
Message-Id: <20190923172753.26593-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190923172753.26593-1-tzimmermann@suse.de>
References: <20190923172753.26593-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Selecting the correct offset for the new cursor image is not relevant
outside of ast_show_cursor(). Let the function do the work.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_mode.c | 57 ++++++++++++++++++----------------
 1 file changed, 31 insertions(+), 26 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_mode.c b/drivers/gpu/drm/ast/ast_mode.c
index 1294f0612fd5..6a517ffb1c5c 100644
--- a/drivers/gpu/drm/ast/ast_mode.c
+++ b/drivers/gpu/drm/ast/ast_mode.c
@@ -1150,23 +1150,34 @@ static void ast_cursor_set_base(struct ast_private *ast, u64 address)
 	ast_set_index_reg(ast, AST_IO_CRTC_PORT, 0xca, addr2);
 }
 
-static int ast_show_cursor(struct drm_crtc *crtc, void *dst, void *src,
-			   unsigned int width, unsigned int height,
-			   u64 dst_gpu)
+static int ast_show_cursor(struct drm_crtc *crtc, void *src,
+			   unsigned int width, unsigned int height)
 {
 	struct ast_private *ast = crtc->dev->dev_private;
 	struct ast_crtc *ast_crtc = to_ast_crtc(crtc);
+	struct drm_gem_vram_object *gbo;
+	u8 *dst, *dst_next;
+	s64 off;
 	int ret;
 	u8 jreg;
 
-	dst += (AST_HWC_SIZE + AST_HWC_SIGNATURE_SIZE)*ast->next_cursor;
+	gbo = drm_gem_vram_of_gem(ast->cursor_cache);
+	dst = drm_gem_vram_vmap(gbo);
+	if (IS_ERR(dst))
+		return PTR_ERR(dst);
+	off = drm_gem_vram_offset(gbo);
+	if (off < 0) {
+		ret = (int)off;
+		goto err_drm_gem_vram_vunmap;
+	}
 
-	ret = ast_cursor_update(dst, src, width, height);
-	if (ret)
-		return ret;
-	ast_cursor_set_base(ast, dst_gpu);
+	dst_next = dst + (AST_HWC_SIZE + AST_HWC_SIGNATURE_SIZE) *
+		   ast->next_cursor;
 
-	ast->next_cursor = (ast->next_cursor + 1) % AST_DEFAULT_HWC_NUM;
+	ret = ast_cursor_update(dst_next, src, width, height);
+	if (ret)
+		goto err_drm_gem_vram_vunmap;
+	ast_cursor_set_base(ast, off);
 
 	ast_crtc->offset_x = AST_MAX_HWC_WIDTH - width;
 	ast_crtc->offset_y = AST_MAX_HWC_WIDTH - height;
@@ -1176,7 +1187,15 @@ static int ast_show_cursor(struct drm_crtc *crtc, void *dst, void *src,
 	jreg |= 1;
 	ast_set_index_reg_mask(ast, AST_IO_CRTC_PORT, 0xcb, 0xfc, jreg);
 
+	ast->next_cursor = (ast->next_cursor + 1) % AST_DEFAULT_HWC_NUM;
+
+	drm_gem_vram_vunmap(gbo, dst);
+
 	return 0;
+
+err_drm_gem_vram_vunmap:
+	drm_gem_vram_vunmap(gbo, dst);
+	return ret;
 }
 
 static void ast_hide_cursor(struct drm_crtc *crtc)
@@ -1192,12 +1211,10 @@ static int ast_cursor_set(struct drm_crtc *crtc,
 			  uint32_t width,
 			  uint32_t height)
 {
-	struct ast_private *ast = crtc->dev->dev_private;
 	struct drm_gem_object *obj;
 	struct drm_gem_vram_object *gbo;
-	s64 dst_gpu;
+	u8 *src;
 	int ret;
-	u8 *src, *dst;
 
 	if (!handle) {
 		ast_hide_cursor(crtc);
@@ -1219,21 +1236,9 @@ static int ast_cursor_set(struct drm_crtc *crtc,
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
-- 
2.23.0

