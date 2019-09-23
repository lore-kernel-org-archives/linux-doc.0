Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.7 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id F11A07D912
	for <lwn-linux-doc@archive.lwn.net>; Mon, 23 Sep 2019 17:28:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389338AbfIWR2C (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 23 Sep 2019 13:28:02 -0400
Received: from mx2.suse.de ([195.135.220.15]:46290 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S2437873AbfIWR2C (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 23 Sep 2019 13:28:02 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id A89ADAF97;
        Mon, 23 Sep 2019 17:27:59 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     airlied@linux.ie, daniel@ffwll.ch, kraxel@redhat.com,
        sam@ravnborg.org, yc_chen@aspeedtech.com, corbet@lwn.net
Cc:     dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 01/12] drm/vram: Support top-down placement flag
Date:   Mon, 23 Sep 2019 19:27:42 +0200
Message-Id: <20190923172753.26593-2-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190923172753.26593-1-tzimmermann@suse.de>
References: <20190923172753.26593-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Pinning lots of small buffer objects, such as cursors or sprites, to video
memory can lead to fragmentation, which is a problem for devices with only
a small amount of memory. As a result, framebuffer images might not get
pinned, even though there's enough space available overall.

The flag DRM_GEM_VRAM_PL_FLAG_TOPDOWN marks buffer objects to be pinned at
the high end of video memory. This leaves contiguous space available at
the memory's low end.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_vram_helper.c | 14 ++++++++++----
 include/drm/drm_gem_vram_helper.h     |  1 +
 2 files changed, 11 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index 49588de88959..91baf3f279f1 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -58,6 +58,7 @@ static void drm_gem_vram_placement(struct drm_gem_vram_object *gbo,
 {
 	unsigned int i;
 	unsigned int c = 0;
+	u32 invariant_flags = pl_flag & TTM_PL_FLAG_TOPDOWN;
 
 	gbo->placement.placement = gbo->placements;
 	gbo->placement.busy_placement = gbo->placements;
@@ -65,15 +66,18 @@ static void drm_gem_vram_placement(struct drm_gem_vram_object *gbo,
 	if (pl_flag & TTM_PL_FLAG_VRAM)
 		gbo->placements[c++].flags = TTM_PL_FLAG_WC |
 					     TTM_PL_FLAG_UNCACHED |
-					     TTM_PL_FLAG_VRAM;
+					     TTM_PL_FLAG_VRAM |
+					     invariant_flags;
 
 	if (pl_flag & TTM_PL_FLAG_SYSTEM)
 		gbo->placements[c++].flags = TTM_PL_MASK_CACHING |
-					     TTM_PL_FLAG_SYSTEM;
+					     TTM_PL_FLAG_SYSTEM |
+					     invariant_flags;
 
 	if (!c)
 		gbo->placements[c++].flags = TTM_PL_MASK_CACHING |
-					     TTM_PL_FLAG_SYSTEM;
+					     TTM_PL_FLAG_SYSTEM |
+					     invariant_flags;
 
 	gbo->placement.num_placement = c;
 	gbo->placement.num_busy_placement = c;
@@ -236,7 +240,9 @@ static int drm_gem_vram_pin_locked(struct drm_gem_vram_object *gbo,
  * a memory region. A pinned buffer object has to be unpinned before
  * it can be pinned to another region. If the pl_flag argument is 0,
  * the buffer is pinned at its current location (video RAM or system
- * memory).
+ * memory). The modifier DRM_GEM_VRAM_PL_FLAG_TOPDOWN marks the buffer
+ * object to be pinned at the high end of the memory region. Set this
+ * flag to avoid memory fragmentation.
  *
  * Returns:
  * 0 on success, or
diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
index 418eb1122861..354a9cd358a3 100644
--- a/include/drm/drm_gem_vram_helper.h
+++ b/include/drm/drm_gem_vram_helper.h
@@ -19,6 +19,7 @@ struct vm_area_struct;
 
 #define DRM_GEM_VRAM_PL_FLAG_VRAM	TTM_PL_FLAG_VRAM
 #define DRM_GEM_VRAM_PL_FLAG_SYSTEM	TTM_PL_FLAG_SYSTEM
+#define DRM_GEM_VRAM_PL_FLAG_TOPDOWN	TTM_PL_FLAG_TOPDOWN
 
 /*
  * Buffer-object helpers
-- 
2.23.0

