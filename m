Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0671F7D91A
	for <lwn-linux-doc@archive.lwn.net>; Wed, 18 Sep 2019 14:23:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729153AbfIROXO (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 18 Sep 2019 10:23:14 -0400
Received: from mx2.suse.de ([195.135.220.15]:33190 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1728548AbfIROXO (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 18 Sep 2019 10:23:14 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 052FEB676;
        Wed, 18 Sep 2019 14:23:11 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
        sam@ravnborg.org, yc_chen@aspeedtech.com, corbet@lwn.net
Cc:     dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 04/11] drm/ast: Reserve space for double-buffered cursor image
Date:   Wed, 18 Sep 2019 16:23:00 +0200
Message-Id: <20190918142307.27127-5-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190918142307.27127-1-tzimmermann@suse.de>
References: <20190918142307.27127-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

With the patch, we reserve 2x 16 KiB at the high end of video memory,
with each frame aligned to an 8-byte boundary. The remaining memory is
available for GEM VRAM buffer objects.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/ast/ast_ttm.c | 13 ++++++++++---
 1 file changed, 10 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/ast/ast_ttm.c b/drivers/gpu/drm/ast/ast_ttm.c
index fad34106083a..8e6a1d8917d0 100644
--- a/drivers/gpu/drm/ast/ast_ttm.c
+++ b/drivers/gpu/drm/ast/ast_ttm.c
@@ -35,13 +35,20 @@
 
 int ast_mm_init(struct ast_private *ast)
 {
+	unsigned long cursor_size;
 	struct drm_vram_mm *vmm;
 	int ret;
 	struct drm_device *dev = ast->dev;
 
-	vmm = drm_vram_helper_alloc_mm(
-		dev, pci_resource_start(dev->pdev, 0),
-		ast->vram_size);
+	/* At the high end of video memory, we reserve space for
+	 * two cursor images. The cursor plane uses this memory to
+	 * store a double-buffered image of the current cursor.
+	 */
+	cursor_size = roundup((AST_HWC_SIZE + AST_HWC_SIGNATURE_SIZE),
+			      PAGE_SIZE) * AST_DEFAULT_HWC_NUM;
+
+	vmm = drm_vram_helper_alloc_mm(dev, pci_resource_start(dev->pdev, 0),
+				       ast->vram_size - cursor_size);
 	if (IS_ERR(vmm)) {
 		ret = PTR_ERR(vmm);
 		DRM_ERROR("Error initializing VRAM MM; %d\n", ret);
-- 
2.23.0

