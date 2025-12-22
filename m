Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9FDB9318155
	for <linux-doc@vger.kernel.org>; Mon, 22 Dec 2025 10:12:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766398326; cv=none; b=g9ULMXczytqsS77hjkmolIDIDC8wru7wYSLR++mhO2z7w2ufFtvCeeGp5I8DB4bEBNDvO9dxqOA4y9VTxQg3cZ38ipRIR4QTuJHfX7IFUiXO+aH5vilGw2EgFAmOtCDdZ5TdUwYQhKCDYkjE3KM5alhRIzk0Z22/JRIwDLfaqkU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766398326; c=relaxed/simple;
	bh=mzUB8fKisYn73ttObORXp2w0FKABe2mtx8ZlGqSAmIc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Kk1JIPWMJbow4E7KrqlCGA6f9szUUVwaPYw2SDNuN2AntQ58no06qplHXpoJtIH27MzWGWfJOKFToD8k3v1xYyY/p8GqOaIzZcG9ONF9oT3raci7WP7SD3KrzC83u6jQI/eFJ2qg/GBjuICboFa72bpEc8PUKOOfKq54VD8/nTY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=zTU6NdGd; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="zTU6NdGd"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 65C8E1A2373;
	Mon, 22 Dec 2025 10:12:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3BCC1606C1;
	Mon, 22 Dec 2025 10:12:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B75F010AB019E;
	Mon, 22 Dec 2025 11:11:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766398321; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=I7zawk6++0Z/TjkX63W4pHhrEWl4IUqVLHzb2AqGjD0=;
	b=zTU6NdGdptHNDoya2VDmHlkOB3optAuB9fT1UUCQm6Dh8L9/dLB7BjszGery/mDpZ1yVFU
	V1vuk9m1TQqaMIVhgL1Lf54Uxd6WkJ/wzWOaCCZA1UDNdbnG9JqOcmVgvzXGjDJaOPU2rC
	oT68P/3+TELexOZ60ihAM2Q8uW8y7OnkzqxUpLeTwgvAWTroEdCfo66/rOkQPhIuC1YVaE
	jSPtAc5n3nlxhqq0CTRbg7lJBKQ+x/LAjH58FDDkAfeWbN0HKv4q0NI5Rce+ajpdIIIZWN
	o8+UPqFX4k9yVtnVNULtdhweodU6PnscygJqoz5bApTCc8jRlj/71jX23CSUtg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 22 Dec 2025 11:11:19 +0100
Subject: [PATCH v3 17/33] drm/vkms: Introduce config for plane format
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-vkms-all-config-v3-17-ba42dc3fb9ff@bootlin.com>
References: <20251222-vkms-all-config-v3-0-ba42dc3fb9ff@bootlin.com>
In-Reply-To: <20251222-vkms-all-config-v3-0-ba42dc3fb9ff@bootlin.com>
To: Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, jose.exposito89@gmail.com, 
 Jonathan Corbet <corbet@lwn.net>
Cc: victoria@system76.com, sebastian.wick@redhat.com, victoria@system76.com, 
 airlied@gmail.com, thomas.petazzoni@bootlin.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=10172;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=mzUB8fKisYn73ttObORXp2w0FKABe2mtx8ZlGqSAmIc=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpSRlBipYlLv4Qb8tN3YPNPOVvntcZJD0YX7Ug9
 00Fx57mSXuJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaUkZQRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOLCkQ/+OSIpRaEK8I7Kz4yBNha02xImzu1HjIP
 AWbaUzhtvc+74lqwXI24OVMX3zK1G2L5uN9KTJ49Tvw4Hb4Ltjb1Cce+Msf4t3THSLTcX1+Qioh
 vMxlhv8bzPH1gGQHZiJQBLvsGNgPrBa/RlrAW5jDxtcwTTxOHLHotkdl65aHLv4dawPS8Xk8zb0
 68VRYlrIM+hjVG/s3llMezOYpCxjM9XUIfvJyr6IUsSNREE+XqR4vH1W4zHRxrKXl4y87Im7uiF
 ss/dhISUttiRynMffA2Q4tZ1OqCd7foce2/QcIGiRt5tE6JcUQfFMrk0SxQXN3jEicipGn8xVeZ
 +miGkhtjHO6sd1xFA3rXlh0dvxaJ6juDgIu+HqpHx+lz//e/yxTLs7YGieUsIMXffJYvANJ5cGs
 DrvuB80pp0lnxUqpRV6YAQJ5QO/dgQZNAsW39TCW8Odl9WIdH918E2mVtAJ+Bccq3VqvN6HlEX8
 NFFCmrn7b27Dl6xmTBxJSEGAWOdpjEeSZE94mF8acfeJplSeCIjHvCWGLNqyaP1RjMqqT5+tWKf
 ADfNOm9zNFmFGkelFp8vMZtg+WnnFpDvH97UBN3VmMW1oeOadSX1SLdXUgD93gn5mmxvnhPFEo8
 zPoN98dYz24luWO2H++ARB5YNpaP5Fw4ibg4tXwsvJI6Od+mz6ow=
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-Last-TLS-Session-Version: TLSv1.3

VKMS driver supports all the pixel formats for planes, but for testing it
can be useful to only advertise few of them. This new configuration
interface will allow configuring the pixel format per planes.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_config.c | 124 +++++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_config.h |  51 +++++++++++++++
 drivers/gpu/drm/vkms/vkms_plane.c  |  39 +-----------
 3 files changed, 177 insertions(+), 37 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index 5591e0baf1a1..1c97f952bf9e 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -12,6 +12,42 @@
 
 #include "vkms_config.h"
 
+static const u32 vkms_supported_plane_formats[] = {
+	DRM_FORMAT_ARGB8888,
+	DRM_FORMAT_ABGR8888,
+	DRM_FORMAT_BGRA8888,
+	DRM_FORMAT_RGBA8888,
+	DRM_FORMAT_XRGB8888,
+	DRM_FORMAT_XBGR8888,
+	DRM_FORMAT_RGB888,
+	DRM_FORMAT_BGR888,
+	DRM_FORMAT_XRGB16161616,
+	DRM_FORMAT_XBGR16161616,
+	DRM_FORMAT_ARGB16161616,
+	DRM_FORMAT_ABGR16161616,
+	DRM_FORMAT_RGB565,
+	DRM_FORMAT_BGR565,
+	DRM_FORMAT_NV12,
+	DRM_FORMAT_NV16,
+	DRM_FORMAT_NV24,
+	DRM_FORMAT_NV21,
+	DRM_FORMAT_NV61,
+	DRM_FORMAT_NV42,
+	DRM_FORMAT_YUV420,
+	DRM_FORMAT_YUV422,
+	DRM_FORMAT_YUV444,
+	DRM_FORMAT_YVU420,
+	DRM_FORMAT_YVU422,
+	DRM_FORMAT_YVU444,
+	DRM_FORMAT_P010,
+	DRM_FORMAT_P012,
+	DRM_FORMAT_P016,
+	DRM_FORMAT_R1,
+	DRM_FORMAT_R2,
+	DRM_FORMAT_R4,
+	DRM_FORMAT_R8,
+};
+
 struct vkms_config *vkms_config_create(const char *dev_name)
 {
 	struct vkms_config *config;
@@ -441,6 +477,15 @@ static void show_bitfield(struct seq_file *m, uint32_t value, const char *callba
 	}
 }
 
+static void show_formats(struct seq_file *m, u32 *formats, size_t formats_count)
+{
+	for (int i = 0; i < formats_count; i++) {
+		seq_printf(m, "%p4cc", &formats[i]);
+		if (i != formats_count - 1)
+			seq_puts(m, ", ");
+	}
+}
+
 static int vkms_config_show(struct seq_file *m, void *data)
 {
 	struct drm_debugfs_entry *entry = m->private;
@@ -482,6 +527,10 @@ static int vkms_config_show(struct seq_file *m, void *data)
 		seq_puts(m, "\n");
 		seq_printf(m, "\tdefault color range=%s\n",
 			   drm_get_color_range_name(vkms_config_plane_get_default_color_range(plane_cfg)));
+		seq_puts(m, "\tsupported formats=");
+		show_formats(m, vkms_config_plane_get_supported_formats(plane_cfg),
+			     vkms_config_plane_get_supported_formats_count(plane_cfg));
+		seq_puts(m, "\n");
 	}
 
 	vkms_config_for_each_crtc(vkmsdev->config, crtc_cfg) {
@@ -520,6 +569,11 @@ struct vkms_config_plane *vkms_config_create_plane(struct vkms_config *config)
 	if (!plane_cfg)
 		return ERR_PTR(-ENOMEM);
 
+	if (vkms_config_plane_add_all_formats(plane_cfg)) {
+		kfree(plane_cfg);
+		return ERR_PTR(-ENOMEM);
+	}
+
 	plane_cfg->config = config;
 	plane_cfg->default_pipeline = false;
 	vkms_config_plane_set_type(plane_cfg, DRM_PLANE_TYPE_OVERLAY);
@@ -650,6 +704,76 @@ static struct vkms_config_plane *vkms_config_crtc_get_plane(const struct vkms_co
 	return NULL;
 }
 
+int __must_check vkms_config_plane_add_all_formats(struct vkms_config_plane *plane_cfg)
+{
+	u32 *ret = krealloc_array(plane_cfg->supported_formats,
+				  ARRAY_SIZE(vkms_supported_plane_formats),
+				  sizeof(uint32_t), GFP_KERNEL);
+	if (!ret)
+		return -ENOMEM;
+	plane_cfg->supported_formats = ret;
+
+	memcpy(plane_cfg->supported_formats, vkms_supported_plane_formats,
+	       sizeof(vkms_supported_plane_formats));
+	plane_cfg->supported_formats_count = ARRAY_SIZE(vkms_supported_plane_formats);
+	return 0;
+}
+
+static bool is_supported_format(u32 drm_format)
+{
+	for (int i = 0; i < ARRAY_SIZE(vkms_supported_plane_formats); i++) {
+		if (vkms_supported_plane_formats[i] == drm_format)
+			return true;
+	}
+
+	return false;
+}
+
+static bool vkms_config_plane_has_format(struct vkms_config_plane *plane_cfg, u32 drm_format)
+{
+	for (unsigned int i = 0; i < plane_cfg->supported_formats_count; i++) {
+		if (plane_cfg->supported_formats[i] == drm_format)
+			return true;
+	}
+	return false;
+}
+
+int __must_check vkms_config_plane_add_format(struct vkms_config_plane *plane_cfg, u32 drm_format)
+{
+	if (!is_supported_format(drm_format))
+		return -EINVAL;
+
+	if (vkms_config_plane_has_format(plane_cfg, drm_format))
+		return 0;
+
+	u32 *new_ptr = krealloc_array(plane_cfg->supported_formats,
+				      plane_cfg->supported_formats_count + 1,
+				      sizeof(*plane_cfg->supported_formats), GFP_KERNEL);
+	if (!new_ptr)
+		return -ENOMEM;
+
+	plane_cfg->supported_formats = new_ptr;
+	plane_cfg->supported_formats[plane_cfg->supported_formats_count] = drm_format;
+	plane_cfg->supported_formats_count++;
+
+	return 0;
+}
+
+void vkms_config_plane_remove_all_formats(struct vkms_config_plane *plane_cfg)
+{
+	plane_cfg->supported_formats_count = 0;
+}
+
+void vkms_config_plane_remove_format(struct vkms_config_plane *plane_cfg, u32 drm_format)
+{
+	for (unsigned int i = 0; i < plane_cfg->supported_formats_count; i++) {
+		if (plane_cfg->supported_formats[i] == drm_format) {
+			plane_cfg->supported_formats[i] = plane_cfg->supported_formats[plane_cfg->supported_formats_count - 1];
+			plane_cfg->supported_formats_count--;
+		}
+	}
+}
+
 struct vkms_config_plane *vkms_config_crtc_primary_plane(const struct vkms_config *config,
 							 struct vkms_config_crtc *crtc_cfg)
 {
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index bb2721a18d61..f268c3172217 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -49,6 +49,8 @@ struct vkms_config {
  * @supported_color_encodings: Color encodings that this plane will support
  * @default_color_range: Default color range that should be used by this plane
  * @supported_color_ranges: Color ranges that this plane will support
+ * @supported_formats: List of supported formats
+ * @supported_formats_count: Length of @supported_formats
  */
 struct vkms_config_plane {
 	struct list_head link;
@@ -62,6 +64,8 @@ struct vkms_config_plane {
 	unsigned int supported_color_encodings;
 	enum drm_color_range default_color_range;
 	unsigned int supported_color_ranges;
+	u32 *supported_formats;
+	unsigned int supported_formats_count;
 	struct xarray possible_crtcs;
 	bool default_pipeline;
 
@@ -474,6 +478,53 @@ bool vkms_config_valid_plane_color_range(const struct vkms_config *config,
 					 const struct vkms_config_plane *plane_cfg);
 #endif
 
+static inline u32 *
+vkms_config_plane_get_supported_formats(const struct vkms_config_plane *plane_cfg)
+{
+	return plane_cfg->supported_formats;
+}
+
+static inline unsigned int
+vkms_config_plane_get_supported_formats_count(struct vkms_config_plane *plane_cfg)
+{
+	return plane_cfg->supported_formats_count;
+}
+
+/** vkms_config_plane_add_format - Add a format to the list of supported format of a plane
+ *
+ * The passed drm_format can already be present in the list. This may fail if the allocation of a
+ * bigger array fails.
+ *
+ * @plane_cfg: Plane to add the format to
+ * @drm_format: Format to add to this plane
+ *
+ * Returns: 0 on success, -ENOMEM if array allocation fails, -EINVAL if the format is not supported
+ * by VKMS
+ */
+int __must_check vkms_config_plane_add_format(struct vkms_config_plane *plane_cfg, u32 drm_format);
+
+/**
+ * vkms_config_plane_add_all_formats - Helper to quickly add all the supported formats
+ * @plane_cfg: Plane to add the formats to
+ *
+ * Returns: 0 on success, -ENOMEM if array allocation fails, -EINVAL if the format is not supported
+ * by VKMS
+ */
+int __must_check vkms_config_plane_add_all_formats(struct vkms_config_plane *plane_cfg);
+
+/**
+ * vkms_config_plane_remove_format - Remove a specific format from a plane
+ * @plane_cfg: Plane to remove the format to
+ * @drm_format: Format to remove
+ */
+void vkms_config_plane_remove_format(struct vkms_config_plane *plane_cfg, u32 drm_format);
+
+/**
+ * vkms_config_plane_remove_all_formats - Remove all formats from a plane
+ * @plane_cfg: Plane to remove the formats from
+ */
+void vkms_config_plane_remove_all_formats(struct vkms_config_plane *plane_cfg);
+
 /**
  * vkms_config_plane_set_name() - Set the plane name
  * @plane_cfg: Plane to set the name to
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index 6461cf025a27..c2854b2117d1 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -15,42 +15,6 @@
 #include "vkms_drv.h"
 #include "vkms_formats.h"
 
-static const u32 vkms_formats[] = {
-	DRM_FORMAT_ARGB8888,
-	DRM_FORMAT_ABGR8888,
-	DRM_FORMAT_BGRA8888,
-	DRM_FORMAT_RGBA8888,
-	DRM_FORMAT_XRGB8888,
-	DRM_FORMAT_XBGR8888,
-	DRM_FORMAT_RGB888,
-	DRM_FORMAT_BGR888,
-	DRM_FORMAT_XRGB16161616,
-	DRM_FORMAT_XBGR16161616,
-	DRM_FORMAT_ARGB16161616,
-	DRM_FORMAT_ABGR16161616,
-	DRM_FORMAT_RGB565,
-	DRM_FORMAT_BGR565,
-	DRM_FORMAT_NV12,
-	DRM_FORMAT_NV16,
-	DRM_FORMAT_NV24,
-	DRM_FORMAT_NV21,
-	DRM_FORMAT_NV61,
-	DRM_FORMAT_NV42,
-	DRM_FORMAT_YUV420,
-	DRM_FORMAT_YUV422,
-	DRM_FORMAT_YUV444,
-	DRM_FORMAT_YVU420,
-	DRM_FORMAT_YVU422,
-	DRM_FORMAT_YVU444,
-	DRM_FORMAT_P010,
-	DRM_FORMAT_P012,
-	DRM_FORMAT_P016,
-	DRM_FORMAT_R1,
-	DRM_FORMAT_R2,
-	DRM_FORMAT_R4,
-	DRM_FORMAT_R8,
-};
-
 static struct drm_plane_state *
 vkms_plane_duplicate_state(struct drm_plane *plane)
 {
@@ -227,7 +191,8 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
 
 	plane = drmm_universal_plane_alloc(dev, struct vkms_plane, base, 0,
 					   &vkms_plane_funcs,
-					   vkms_formats, ARRAY_SIZE(vkms_formats),
+					   vkms_config_plane_get_supported_formats(plane_cfg),
+					   vkms_config_plane_get_supported_formats_count(plane_cfg),
 					   NULL, vkms_config_plane_get_type(plane_cfg),
 					   vkms_config_plane_get_name(plane_cfg));
 	if (IS_ERR(plane))

-- 
2.51.2

