Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.8 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6124C43331
	for <linux-doc@archiver.kernel.org>; Thu, 18 Mar 2021 10:30:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8673264F6B
	for <linux-doc@archiver.kernel.org>; Thu, 18 Mar 2021 10:30:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229890AbhCRK34 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 18 Mar 2021 06:29:56 -0400
Received: from mx2.suse.de ([195.135.220.15]:46038 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230001AbhCRK31 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 18 Mar 2021 06:29:27 -0400
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id 3E05AAC1E;
        Thu, 18 Mar 2021 10:29:26 +0000 (UTC)
From:   Thomas Zimmermann <tzimmermann@suse.de>
To:     daniel@ffwll.ch, airlied@linux.ie,
        maarten.lankhorst@linux.intel.com, mripard@kernel.org,
        kraxel@redhat.com, corbet@lwn.net, lgirdwood@gmail.com,
        broonie@kernel.org, sam@ravnborg.org, robh@kernel.org,
        emil.l.velikov@gmail.com, geert+renesas@glider.be,
        hdegoede@redhat.com, bluescreen_avenger@verizon.net
Cc:     dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
        virtualization@lists.linux-foundation.org,
        Thomas Zimmermann <tzimmermann@suse.de>
Subject: [PATCH v2 03/10] drm/aperture: Move fbdev conflict helpers into drm_aperture.h
Date:   Thu, 18 Mar 2021 11:29:14 +0100
Message-Id: <20210318102921.21536-4-tzimmermann@suse.de>
X-Mailer: git-send-email 2.30.1
In-Reply-To: <20210318102921.21536-1-tzimmermann@suse.de>
References: <20210318102921.21536-1-tzimmermann@suse.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Fbdev's helpers for handling conflicting framebuffers are related to
framebuffer apertures, not console emulation. Therefore move them into a
drm_aperture.h, which will contain the interfaces for the new aperture
helpers.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Tested-by: nerdopolis <bluescreen_avenger@verizon.net>
---
 Documentation/gpu/drm-internals.rst |  6 +++
 include/drm/drm_aperture.h          | 60 +++++++++++++++++++++++++++++
 include/drm/drm_fb_helper.h         | 56 ++-------------------------
 3 files changed, 69 insertions(+), 53 deletions(-)
 create mode 100644 include/drm/drm_aperture.h

diff --git a/Documentation/gpu/drm-internals.rst b/Documentation/gpu/drm-internals.rst
index 12272b168580..4c7642d2ca34 100644
--- a/Documentation/gpu/drm-internals.rst
+++ b/Documentation/gpu/drm-internals.rst
@@ -75,6 +75,12 @@ update it, its value is mostly useless. The DRM core prints it to the
 kernel log at initialization time and passes it to userspace through the
 DRM_IOCTL_VERSION ioctl.
 
+Managing Ownership of the Framebuffer Aperture
+----------------------------------------------
+
+.. kernel-doc:: include/drm/drm_aperture.h
+   :internal:
+
 Device Instance and Driver Handling
 -----------------------------------
 
diff --git a/include/drm/drm_aperture.h b/include/drm/drm_aperture.h
new file mode 100644
index 000000000000..13766efe9517
--- /dev/null
+++ b/include/drm/drm_aperture.h
@@ -0,0 +1,60 @@
+/* SPDX-License-Identifier: MIT */
+
+#ifndef _DRM_APERTURE_H_
+#define _DRM_APERTURE_H_
+
+#include <linux/fb.h>
+#include <linux/vgaarb.h>
+
+/**
+ * drm_fb_helper_remove_conflicting_framebuffers - remove firmware-configured framebuffers
+ * @a: memory range, users of which are to be removed
+ * @name: requesting driver name
+ * @primary: also kick vga16fb if present
+ *
+ * This function removes framebuffer devices (initialized by firmware/bootloader)
+ * which use memory range described by @a. If @a is NULL all such devices are
+ * removed.
+ */
+static inline int
+drm_fb_helper_remove_conflicting_framebuffers(struct apertures_struct *a,
+					      const char *name, bool primary)
+{
+#if IS_REACHABLE(CONFIG_FB)
+	return remove_conflicting_framebuffers(a, name, primary);
+#else
+	return 0;
+#endif
+}
+
+/**
+ * drm_fb_helper_remove_conflicting_pci_framebuffers - remove firmware-configured
+ *                                                     framebuffers for PCI devices
+ * @pdev: PCI device
+ * @name: requesting driver name
+ *
+ * This function removes framebuffer devices (eg. initialized by firmware)
+ * using memory range configured for any of @pdev's memory bars.
+ *
+ * The function assumes that PCI device with shadowed ROM drives a primary
+ * display and so kicks out vga16fb.
+ */
+static inline int
+drm_fb_helper_remove_conflicting_pci_framebuffers(struct pci_dev *pdev,
+						  const char *name)
+{
+	int ret = 0;
+
+	/*
+	 * WARNING: Apparently we must kick fbdev drivers before vgacon,
+	 * otherwise the vga fbdev driver falls over.
+	 */
+#if IS_REACHABLE(CONFIG_FB)
+	ret = remove_conflicting_pci_framebuffers(pdev, name);
+#endif
+	if (ret == 0)
+		ret = vga_remove_vgacon(pdev);
+	return ret;
+}
+
+#endif
diff --git a/include/drm/drm_fb_helper.h b/include/drm/drm_fb_helper.h
index 3b273f9ca39a..d06a3942fddb 100644
--- a/include/drm/drm_fb_helper.h
+++ b/include/drm/drm_fb_helper.h
@@ -30,13 +30,13 @@
 #ifndef DRM_FB_HELPER_H
 #define DRM_FB_HELPER_H
 
-struct drm_fb_helper;
-
+#include <drm/drm_aperture.h>
 #include <drm/drm_client.h>
 #include <drm/drm_crtc.h>
 #include <drm/drm_device.h>
 #include <linux/kgdb.h>
-#include <linux/vgaarb.h>
+
+struct drm_fb_helper;
 
 enum mode_set_atomic {
 	LEAVE_ATOMIC_MODE_SET,
@@ -451,54 +451,4 @@ drm_fbdev_generic_setup(struct drm_device *dev, unsigned int preferred_bpp)
 
 #endif
 
-/**
- * drm_fb_helper_remove_conflicting_framebuffers - remove firmware-configured framebuffers
- * @a: memory range, users of which are to be removed
- * @name: requesting driver name
- * @primary: also kick vga16fb if present
- *
- * This function removes framebuffer devices (initialized by firmware/bootloader)
- * which use memory range described by @a. If @a is NULL all such devices are
- * removed.
- */
-static inline int
-drm_fb_helper_remove_conflicting_framebuffers(struct apertures_struct *a,
-					      const char *name, bool primary)
-{
-#if IS_REACHABLE(CONFIG_FB)
-	return remove_conflicting_framebuffers(a, name, primary);
-#else
-	return 0;
-#endif
-}
-
-/**
- * drm_fb_helper_remove_conflicting_pci_framebuffers - remove firmware-configured framebuffers for PCI devices
- * @pdev: PCI device
- * @name: requesting driver name
- *
- * This function removes framebuffer devices (eg. initialized by firmware)
- * using memory range configured for any of @pdev's memory bars.
- *
- * The function assumes that PCI device with shadowed ROM drives a primary
- * display and so kicks out vga16fb.
- */
-static inline int
-drm_fb_helper_remove_conflicting_pci_framebuffers(struct pci_dev *pdev,
-						  const char *name)
-{
-	int ret = 0;
-
-	/*
-	 * WARNING: Apparently we must kick fbdev drivers before vgacon,
-	 * otherwise the vga fbdev driver falls over.
-	 */
-#if IS_REACHABLE(CONFIG_FB)
-	ret = remove_conflicting_pci_framebuffers(pdev, name);
-#endif
-	if (ret == 0)
-		ret = vga_remove_vgacon(pdev);
-	return ret;
-}
-
 #endif
-- 
2.30.1

