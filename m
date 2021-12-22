Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3FADC4332F
	for <linux-doc@archiver.kernel.org>; Wed, 22 Dec 2021 08:28:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231948AbhLVI2p (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 22 Dec 2021 03:28:45 -0500
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:36848 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S233849AbhLVI2o (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 22 Dec 2021 03:28:44 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1640161724;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=OQ6XtD20XG1EILVnbhVJNr5Jw2nThRr8sIpMKb8E/Wg=;
        b=WKem7XRBLj8sqkz+QHBaE4kNixniVCYrtZa4a/7Di62Ej/xM9xdlSROdbSv1iQrlMg7Q/n
        VB9HUcJZg73Vh/m8SZwi2w487XG/7KyYHowVYBP9sT1oyBxLAG4fgxQw2BarL8vcuRVhkW
        9U7qpKNwOwHevoqj91uKz8WpcEyoyvI=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 us-mta-592-FMCL-M5mO4eRK_F6AeybVg-1; Wed, 22 Dec 2021 03:28:43 -0500
X-MC-Unique: FMCL-M5mO4eRK_F6AeybVg-1
Received: by mail-wr1-f72.google.com with SMTP id v6-20020adfa1c6000000b001a26d0c3e32so518178wrv.14
        for <linux-doc@vger.kernel.org>; Wed, 22 Dec 2021 00:28:42 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=OQ6XtD20XG1EILVnbhVJNr5Jw2nThRr8sIpMKb8E/Wg=;
        b=O/v3BNAHNvUE8pOyfDXtbIX4l8S27WlIWaDeQZcJ10IBzre+GoQ5GNSNws3lpC/iNW
         Lk3r4FhIMjahgSLBpuF8w54M3ZgpcxCzmo50iylVsPb4crkcffhis3pEXyqfRAHJg4Jj
         iaVYdQN3z9fNwbUss98myUSeeu5OewAYlDtEagmWmA4+C9RGgGPfqlJguPmzJdTHPydB
         Pjp+x2o7Ht0tmZQ1n/c6jiX6vSPv1sE7o/fwPK6PryVf0OD3K4z+7cYN6DcZu6OoqtR+
         ewiFW0krDISWwf7dk/vYEZf7KURjyXv28g0uRnY1SucpjakPZT/JjpOsWCYp1vJd+Ixt
         pn4g==
X-Gm-Message-State: AOAM531eWhEqiPj9t9J0ZWP2Evb7epqbp4KTYanp2uQMKtcDSs6oP0ly
        fYQwP3Xwx3Z+cmpV/AORG/Ag+AT7ERhdHcrBLNp8Y+wv036HPkS/0GY+F3DwSIkem9/awctkFEE
        ULv4cIizSsIlu+C8y/Fa6
X-Received: by 2002:a05:600c:287:: with SMTP id 7mr101529wmk.33.1640161721850;
        Wed, 22 Dec 2021 00:28:41 -0800 (PST)
X-Google-Smtp-Source: ABdhPJxBH22gXld28rnt/TMJZsw2cU9PK2Y6h1QwrH7n0X9igVQwkJGQTXog3ZD10Wn09ZlKplL59Q==
X-Received: by 2002:a05:600c:287:: with SMTP id 7mr101513wmk.33.1640161721658;
        Wed, 22 Dec 2021 00:28:41 -0800 (PST)
Received: from minerva.home ([92.176.231.205])
        by smtp.gmail.com with ESMTPSA id m17sm1247080wrz.91.2021.12.22.00.28.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Dec 2021 00:28:41 -0800 (PST)
From:   Javier Martinez Canillas <javierm@redhat.com>
To:     linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org
Cc:     Thomas Zimmermann <tzimmermann@suse.de>,
        Javier Martinez Canillas <javierm@redhat.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        David Airlie <airlied@linux.ie>,
        Jonathan Corbet <corbet@lwn.net>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <mripard@kernel.org>, linux-doc@vger.kernel.org
Subject: [PATCH v3 01/10] drm: Provide PCI module-init macros
Date:   Wed, 22 Dec 2021 09:28:22 +0100
Message-Id: <20211222082831.196562-2-javierm@redhat.com>
X-Mailer: git-send-email 2.33.1
In-Reply-To: <20211222082831.196562-1-javierm@redhat.com>
References: <20211222082831.196562-1-javierm@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Thomas Zimmermann <tzimmermann@suse.de>

Provide helper macros to register PCI-based DRM drivers. The new
macros behave like module_pci_driver() with an additional test if
DRM modesetting has been enabled.

Signed-off-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Javier Martinez Canillas <javierm@redhat.com>
---

(no changes since v1)

 Documentation/gpu/drm-internals.rst |  6 ++
 include/drm/drm_module.h            | 95 +++++++++++++++++++++++++++++
 2 files changed, 101 insertions(+)
 create mode 100644 include/drm/drm_module.h

diff --git a/Documentation/gpu/drm-internals.rst b/Documentation/gpu/drm-internals.rst
index 607f78f0f189..38afed24a75c 100644
--- a/Documentation/gpu/drm-internals.rst
+++ b/Documentation/gpu/drm-internals.rst
@@ -75,6 +75,12 @@ update it, its value is mostly useless. The DRM core prints it to the
 kernel log at initialization time and passes it to userspace through the
 DRM_IOCTL_VERSION ioctl.
 
+Module Initialization
+---------------------
+
+.. kernel-doc:: include/drm/drm_module.h
+   :doc: overview
+
 Managing Ownership of the Framebuffer Aperture
 ----------------------------------------------
 
diff --git a/include/drm/drm_module.h b/include/drm/drm_module.h
new file mode 100644
index 000000000000..eb3fd7bcbec9
--- /dev/null
+++ b/include/drm/drm_module.h
@@ -0,0 +1,95 @@
+/* SPDX-License-Identifier: MIT */
+
+#ifndef DRM_MODULE_H
+#define DRM_MODULE_H
+
+#include <linux/pci.h>
+
+#include <drm/drm_drv.h>
+
+/**
+ * DOC: overview
+ *
+ * This library provides helpers registering DRM drivers during module
+ * initialization and shutdown. The provided helpers act like bus-specific
+ * module helpers, such as module_pci_driver(), but respect additional
+ * parameters that control DRM driver registration.
+ *
+ * Below is an example of initializing a DRM driver for a device on the
+ * PCI bus.
+ *
+ * .. code-block:: c
+ *
+ *	struct pci_driver my_pci_drv = {
+ *	};
+ *
+ *	drm_module_pci_driver(my_pci_drv);
+ *
+ * The generated code will test if DRM drivers are enabled and register
+ * the PCI driver my_pci_drv. For more complex module initialization, you
+ * can still use module_init() and module_exit() in your driver.
+ */
+
+/*
+ * PCI drivers
+ */
+
+static inline int __init drm_pci_register_driver(struct pci_driver *pci_drv)
+{
+	if (drm_firmware_drivers_only())
+		return -ENODEV;
+
+	return pci_register_driver(pci_drv);
+}
+
+/**
+ * drm_module_pci_driver - Register a DRM driver for PCI-based devices
+ * @__pci_drv: the PCI driver structure
+ *
+ * Registers a DRM driver for devices on the PCI bus. The helper
+ * macro behaves like module_pci_driver() but tests the state of
+ * drm_firmware_drivers_only(). For more complex module initialization,
+ * use module_init() and module_exit() directly.
+ *
+ * Each module may only use this macro once. Calling it replaces
+ * module_init() and module_exit().
+ */
+#define drm_module_pci_driver(__pci_drv) \
+	module_driver(__pci_drv, drm_pci_register_driver, pci_unregister_driver)
+
+static inline int __init
+drm_pci_register_driver_if_modeset(struct pci_driver *pci_drv, int modeset)
+{
+	if (drm_firmware_drivers_only() && modeset == -1)
+		return -ENODEV;
+	if (modeset == 0)
+		return -ENODEV;
+
+	return pci_register_driver(pci_drv);
+}
+
+static inline void __exit
+drm_pci_unregister_driver_if_modeset(struct pci_driver *pci_drv, int modeset)
+{
+	pci_unregister_driver(pci_drv);
+}
+
+/**
+ * drm_module_pci_driver_if_modeset - Register a DRM driver for PCI-based devices
+ * @__pci_drv: the PCI driver structure
+ * @__modeset: an additional parameter that disables the driver
+ *
+ * This macro is deprecated and only provided for existing drivers. For
+ * new drivers, use drm_module_pci_driver().
+ *
+ * Registers a DRM driver for devices on the PCI bus. The helper macro
+ * behaves like drm_module_pci_driver() with an additional driver-specific
+ * flag. If __modeset is 0, the driver has been disabled, if __modeset is
+ * -1 the driver state depends on the global DRM state. For all other
+ * values, the PCI driver has been enabled. The default should be -1.
+ */
+#define drm_module_pci_driver_if_modeset(__pci_drv, __modeset) \
+	module_driver(__pci_drv, drm_pci_register_driver_if_modeset, \
+		      drm_pci_unregister_driver_if_modeset, __modeset)
+
+#endif
-- 
2.33.1

