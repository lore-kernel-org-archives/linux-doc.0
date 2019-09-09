Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 48AC57D917
	for <lwn-linux-doc@archive.lwn.net>; Mon,  9 Sep 2019 13:05:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729256AbfIINE7 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 9 Sep 2019 09:04:59 -0400
Received: from mx2.suse.de ([195.135.220.15]:38568 "EHLO mx1.suse.de"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1729240AbfIINE7 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 9 Sep 2019 09:04:59 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.220.254])
        by mx1.suse.de (Postfix) with ESMTP id 66C44AF24;
        Mon,  9 Sep 2019 13:04:57 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     daniel@ffwll.ch, kraxel@redhat.com, airlied@linux.ie,
        corbet@lwn.net, z.liuxinliang@hisilicon.com, zourongrong@gmail.com,
        kong.kongxinwei@hisilicon.com, puck.chen@hisilicon.com,
        hdegoede@redhat.com, sam@ravnborg.org, yc_chen@aspeedtech.com
Cc:     dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH 3/4] drm/vram: Unexport internal functions of VRAM MM
Date:   Mon,  9 Sep 2019 15:04:52 +0200
Message-Id: <20190909130453.6718-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.23.0
In-Reply-To: <20190909130453.6718-1-tzimmermann@suse.de>
References: <20190909130453.6718-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

The init, cleanup and mmap functions of VRAM MM are only used internally.
Remove them from the public interface.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
---
 drivers/gpu/drm/drm_gem_vram_helper.c | 38 ++++-----------------------
 include/drm/drm_gem_vram_helper.h     |  7 -----
 2 files changed, 5 insertions(+), 40 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index ed1ffbec5d02..73e81e3a8724 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -844,19 +844,8 @@ static struct ttm_bo_driver bo_driver = {
  * struct drm_vram_mm
  */
 
-/**
- * drm_vram_mm_init() - Initialize an instance of VRAM MM.
- * @vmm:	the VRAM MM instance to initialize
- * @dev:	the DRM device
- * @vram_base:	the base address of the video memory
- * @vram_size:	the size of the video memory in bytes
- *
- * Returns:
- * 0 on success, or
- * a negative error code otherwise.
- */
-int drm_vram_mm_init(struct drm_vram_mm *vmm, struct drm_device *dev,
-		     uint64_t vram_base, size_t vram_size)
+static int drm_vram_mm_init(struct drm_vram_mm *vmm, struct drm_device *dev,
+			    uint64_t vram_base, size_t vram_size)
 {
 	int ret;
 
@@ -875,34 +864,17 @@ int drm_vram_mm_init(struct drm_vram_mm *vmm, struct drm_device *dev,
 
 	return 0;
 }
-EXPORT_SYMBOL(drm_vram_mm_init);
 
-/**
- * drm_vram_mm_cleanup() - Cleans up an initialized instance of VRAM MM.
- * @vmm:	the VRAM MM instance to clean up
- */
-void drm_vram_mm_cleanup(struct drm_vram_mm *vmm)
+static void drm_vram_mm_cleanup(struct drm_vram_mm *vmm)
 {
 	ttm_bo_device_release(&vmm->bdev);
 }
-EXPORT_SYMBOL(drm_vram_mm_cleanup);
 
-/**
- * drm_vram_mm_mmap() - Helper for implementing &struct file_operations.mmap()
- * @filp:	the mapping's file structure
- * @vma:	the mapping's memory area
- * @vmm:	the VRAM MM instance
- *
- * Returns:
- * 0 on success, or
- * a negative error code otherwise.
- */
-int drm_vram_mm_mmap(struct file *filp, struct vm_area_struct *vma,
-		     struct drm_vram_mm *vmm)
+static int drm_vram_mm_mmap(struct file *filp, struct vm_area_struct *vma,
+			    struct drm_vram_mm *vmm)
 {
 	return ttm_bo_mmap(filp, vma, &vmm->bdev);
 }
-EXPORT_SYMBOL(drm_vram_mm_mmap);
 
 /*
  * Helpers for integration with struct drm_device
diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
index 52e3f2aff490..3c204f17a0b8 100644
--- a/include/drm/drm_gem_vram_helper.h
+++ b/include/drm/drm_gem_vram_helper.h
@@ -169,13 +169,6 @@ static inline struct drm_vram_mm *drm_vram_mm_of_bdev(
 	return container_of(bdev, struct drm_vram_mm, bdev);
 }
 
-int drm_vram_mm_init(struct drm_vram_mm *vmm, struct drm_device *dev,
-		     uint64_t vram_base, size_t vram_size);
-void drm_vram_mm_cleanup(struct drm_vram_mm *vmm);
-
-int drm_vram_mm_mmap(struct file *filp, struct vm_area_struct *vma,
-		     struct drm_vram_mm *vmm);
-
 /*
  * Helpers for integration with struct drm_device
  */
-- 
2.23.0

