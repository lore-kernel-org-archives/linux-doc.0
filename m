Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 11DB931BCA3
	for <linux-doc@vger.kernel.org>; Mon, 22 Dec 2025 10:12:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766398360; cv=none; b=Bx3ccjxRGJWBPsRQTyzaJ1AcgSD7UTiVD4iSz4h7dvm4ibwCfsc716JmoLfVnT1UXSwP4a167BG8htArMS21w5I6r/werRWW28I0Tbe7YkEp9+z+rV1zBzEq2b549Yk7J1Co17Fx/roijkcC40gqeeJfYy4yIurVbQPcvTA6WdI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766398360; c=relaxed/simple;
	bh=BfLteTu4ChSbOOTr2xOxDhpRJ3PHmliineAJdLfTk7c=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=lbYzWGpAHTlcO3OVJ+lS/qLk5qLnGq+w9MzG0RXbkuTLuLpf/IjmKNnwugra7taYLFDvIV//4u74v0cDqDulrLd5Moek5RR/+Arkf7r+rRGFAxkPOo+sBJ168BErrS263kquwoyf7FBIlVfbsGWcBBFDkFz87W7vEvoWPnFhMbA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=OfvnbxXR; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="OfvnbxXR"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A92654E41D35;
	Mon, 22 Dec 2025 10:12:37 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7F2C8606C1;
	Mon, 22 Dec 2025 10:12:37 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2794D10AB0194;
	Mon, 22 Dec 2025 11:12:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766398356; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3cDzwNfFz6fNJ5eho/y4cU3G2RQLRw/Hz5ZRCsyS2xQ=;
	b=OfvnbxXRR730sMIwok7EE7AWBMXLjvnLuDkBHcUC7ftPQx8SOUuBwzz1rSMUYvW51SnabE
	qJrLGfpC/7bfhcufo7z1ZF5JeY+i/PCHnGQmexXK2+1DL5sS/VOMxnZ5+AWhu+KadfhxUy
	SuEBN/N0RZmbEE66IXtgs+rBvH98LWnUq3Qs3FJdVW+GlduvS3PErlPtklaSJmQZ+/zXJJ
	ggw+AFQ9i0TynnKYSjpQPQukE8JasW7yaGzk3xpBxZRxfiQcdD6laX4YsDw0I4TcARGPpK
	amrvUvAeuRtx5V6+RfdarEJ0EYSKfTzPeP4OvB/gXZ7GDndZz1vHa3HzlSMV+Q==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 22 Dec 2025 11:11:29 +0100
Subject: [PATCH v3 27/33] drm/vkms: Introduce config for connector EDID
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-vkms-all-config-v3-27-ba42dc3fb9ff@bootlin.com>
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
 linux-doc@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=8106;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=BfLteTu4ChSbOOTr2xOxDhpRJ3PHmliineAJdLfTk7c=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpSRlDsp37MH1mpiFTxeXalTsopL7xWJ6YsRytI
 71LSJt/VeyJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaUkZQxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOJgbhAAtAK1o49wTVgmw1hX80Hkcn+hNJBxIDU
 7t1neuyObIeJaXHWrCoEddLbdyk04MHIfZIVuDEigqvfWu1nQSFgmD7stljezF2Hs4iT862a0db
 TkOhhMgyb9f2ihFmZwBWh5feTVMYj5jcWzu8faXG1t3ECRCWvXK2apqjVLQ152OmSzYmSq8kAhx
 Qmj/ikPA4nyFt6Kcztf1zpBcOIgInFab+A2AJgCtKYUuSsfLGWtYTsZEIbXEzhWeAu4azSfmufm
 cxbrlFqevhL8pyB/Eg4hLVvwQeu744auL/7RB53UZfqoFikswn7kI9gfzA19pzkvUuAGQUaZ+Dh
 xwc/emX1feaaxIUBdrT+RBHmnrGctupPpNBt1e5OcJLOsevpFh195SIHANBou3uGBsCcHefqjzS
 8q4ab3suW0kRe56bH58ml/OUr4xJ0XupzrUCy+NYm3GA8Z0hG9WOOzE/j6J+i3kKXiXddV7bKcp
 NDTyDP8aEX1TEXc8NUgEbc58sV026JCvvWWzh+U4e8T5PqW6u5G87LBf7BTTvxwIh2EPzgIEO0E
 GN0iXmZqeonLQ9AfUYVi6YoDYPeIbU+h881BdAIVszIYTKUz8jg0poxRRhop2S97eMejjDUTCmX
 DbvEtdtx1OvefVoSGasGQvvW5KOId+ZGY9k9K1UHzm4GGWM9C7sg=
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-Last-TLS-Session-Version: TLSv1.3

Allows configuration of EDID for each connector.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/tests/vkms_config_test.c |  2 +
 drivers/gpu/drm/vkms/vkms_config.c            |  6 +++
 drivers/gpu/drm/vkms/vkms_config.h            | 75 +++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_connector.c         | 50 ++++++++++++++++--
 4 files changed, 129 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
index a31fd230c1d4..2b49745ee026 100644
--- a/drivers/gpu/drm/vkms/tests/vkms_config_test.c
+++ b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
@@ -218,6 +218,8 @@ static void vkms_config_test_default_config(struct kunit *test)
 		KUNIT_EXPECT_EQ(test,
 				vkms_config_connector_get_supported_colorspaces(connector_cfg),
 				0);
+		KUNIT_EXPECT_EQ(test, vkms_config_connector_get_edid_enabled(connector_cfg),
+				false);
 	}
 
 	KUNIT_EXPECT_TRUE(test, vkms_config_is_valid(config));
diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index de661c85c11f..adb1a384c122 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -525,6 +525,7 @@ static int vkms_config_show(struct seq_file *m, void *data)
 	struct drm_device *dev = entry->dev;
 	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
 	const char *dev_name;
+	int edid_len;
 	struct vkms_config_plane *plane_cfg;
 	struct vkms_config_crtc *crtc_cfg;
 	struct vkms_config_encoder *encoder_cfg;
@@ -595,6 +596,11 @@ static int vkms_config_show(struct seq_file *m, void *data)
 		show_bitfield(m, vkms_config_connector_get_supported_colorspaces(connector_cfg),
 			      drm_get_colorspace_name);
 		seq_puts(m, "\n");
+		vkms_config_connector_get_edid(connector_cfg, &edid_len);
+		seq_printf(m, "\tEDID=%s (len=%d)\n",
+			   str_enabled_disabled(vkms_config_connector_get_edid_enabled(connector_cfg)),
+			   edid_len
+		);
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index c9d777589cb6..7cca1cc130b0 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -136,6 +136,9 @@ struct vkms_config_encoder {
  *                         are the sames as ones accepted by
  *                         drm_mode_create_hdmi_colorspace_property() and
  *                         drm_mode_create_dp_colorspace_property()
+ * @edid_enabled: If true, create the EDID property
+ * @edid: Stores the current EDID. The value will be ignored if @edid_enabled is false
+ * @edid_len: Current EDID length. The value will be ignored if @edid_enabled is false
  * @possible_encoders: Array of encoders that can be used with this connector
  * @connector: Internal usage. This pointer should never be considered as valid.
  *             It can be used to store a temporary reference to a VKMS connector
@@ -149,6 +152,9 @@ struct vkms_config_connector {
 	int type;
 	enum drm_connector_status status;
 	u32 supported_colorspaces;
+	bool edid_enabled;
+	u8 *edid;
+	unsigned int edid_len;
 	struct xarray possible_encoders;
 
 	/* Internal usage */
@@ -273,6 +279,75 @@ vkms_config_connector_get_supported_colorspaces(const struct vkms_config_connect
 	return connector_cfg->supported_colorspaces;
 }
 
+/**
+ * vkms_config_connector_get_edid_enabled() - Check if EDID is enabled for a connector
+ * @connector_cfg: Connector configuration to check
+ *
+ * Returns:
+ * True if EDID is enabled for this connector, false otherwise.
+ */
+static inline bool
+vkms_config_connector_get_edid_enabled(const struct vkms_config_connector *connector_cfg)
+{
+	return connector_cfg->edid_enabled;
+}
+
+/**
+ * vkms_config_connector_set_edid_enabled() - Enable or disable EDID for a connector
+ * @connector_cfg: Connector configuration to modify
+ * @enabled: Whether to enable EDID for this connector
+ */
+static inline void
+vkms_config_connector_set_edid_enabled(struct vkms_config_connector *connector_cfg,
+				       bool enabled)
+{
+	connector_cfg->edid_enabled = enabled;
+}
+
+/**
+ * vkms_config_connector_get_edid() - Get the EDID data for a connector
+ * @connector_cfg: Connector configuration to get the EDID from
+ * @len: Pointer to store the length of the EDID data
+ *
+ * Returns:
+ * Pointer to the EDID data buffer, or NULL if no EDID is set.
+ * The length of the EDID data is stored in @len.
+ */
+static inline const u8 *
+vkms_config_connector_get_edid(const struct vkms_config_connector *connector_cfg, int *len)
+{
+	*len = connector_cfg->edid_len;
+	return connector_cfg->edid;
+}
+
+/**
+ * vkms_config_connector_set_edid() - Set the EDID data for a connector
+ * @connector_cfg: Connector configuration to modify
+ * @edid: Pointer to the EDID data buffer
+ * @len: Length of the EDID data
+ *
+ * If @len is 0, the EDID data will be cleared and @edid ignored. If
+ * memory allocation fails, the existing EDID data will be preserved.
+ */
+static inline void
+vkms_config_connector_set_edid(struct vkms_config_connector *connector_cfg,
+			       const u8 *edid, unsigned int len)
+{
+	if (len) {
+		void *edid_tmp = krealloc(connector_cfg->edid, len, GFP_KERNEL);
+
+		if (edid_tmp) {
+			connector_cfg->edid = edid_tmp;
+			memcpy(connector_cfg->edid, edid, len);
+			connector_cfg->edid_len = len;
+		}
+	} else {
+		kfree(connector_cfg->edid);
+		connector_cfg->edid = NULL;
+		connector_cfg->edid_len = len;
+	}
+}
+
 /**
  * vkms_config_get_device_name() - Return the name of the device
  * @config: Configuration to get the device name from
diff --git a/drivers/gpu/drm/vkms/vkms_connector.c b/drivers/gpu/drm/vkms/vkms_connector.c
index cc59d13c2d22..c85d19013720 100644
--- a/drivers/gpu/drm/vkms/vkms_connector.c
+++ b/drivers/gpu/drm/vkms/vkms_connector.c
@@ -42,13 +42,55 @@ static const struct drm_connector_funcs vkms_connector_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 };
 
+static int vkms_connector_read_block(void *context, u8 *buf, unsigned int block, size_t len)
+{
+	struct vkms_config_connector *config = context;
+	unsigned int edid_len;
+	const u8 *edid = vkms_config_connector_get_edid(config, &edid_len);
+
+	if (block * len + len > edid_len)
+		return 1;
+	memcpy(buf, &edid[block * len], len);
+	return 0;
+}
+
 static int vkms_conn_get_modes(struct drm_connector *connector)
 {
-	int count;
+	struct vkms_connector *vkms_connector = drm_connector_to_vkms_connector(connector);
+	const struct drm_edid *drm_edid = NULL;
+	int count = 0;
+	struct vkms_config_connector *context = NULL;
+	struct drm_device *dev = connector->dev;
+	struct vkms_device *vkmsdev = drm_device_to_vkms_device(dev);
+	struct vkms_config_connector *connector_cfg;
 
-	/* Use the default modes list from DRM */
-	count = drm_add_modes_noedid(connector, XRES_MAX, YRES_MAX);
-	drm_set_preferred_mode(connector, XRES_DEF, YRES_DEF);
+	vkms_config_for_each_connector(vkmsdev->config, connector_cfg) {
+		if (connector_cfg->connector == vkms_connector) {
+			context = connector_cfg;
+			break;
+		}
+	}
+	if (context) {
+		if (vkms_config_connector_get_edid_enabled(context)) {
+			drm_edid = drm_edid_read_custom(connector,
+							vkms_connector_read_block, context);
+
+			/*
+			 * Unconditionally update the connector. If the EDID was read
+			 * successfully, fill in the connector information derived from the
+			 * EDID. Otherwise, if the EDID is NULL, clear the connector
+			 * information.
+			 */
+			drm_edid_connector_update(connector, drm_edid);
+
+			count = drm_edid_connector_add_modes(connector);
+
+			drm_edid_free(drm_edid);
+		} else {
+			count = drm_add_modes_noedid(connector, XRES_MAX, YRES_MAX);
+			drm_set_preferred_mode(connector, XRES_DEF, YRES_DEF);
+		}
+	}
 
 	return count;
 }

-- 
2.51.2

