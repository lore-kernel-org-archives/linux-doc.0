Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C7236320CCE;
	Mon, 22 Dec 2025 10:12:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766398367; cv=none; b=MkjpiD49NFCtY4V3IuBJLFBswPtOE54T2ha4vcx5Qgx4nRLnbXK0gXq/PP1hV7out8piskFAUQJ+V1K1OJW4I0HUm3ILyzajM280hYiksOXD1+jSLZWXWRlaqjNarYKg0r51Gw6nJ2j74CA5I/f1p2LN7bFlh5Q6YiB61Qufo/Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766398367; c=relaxed/simple;
	bh=1hrPKI43Pz64zwGLv9pkMTEkwrfJC8vNHY1BYpuVT7Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=V1bX1BxtLZZ8RRdqoxJp4mxBWCyp32mvxJdJJFjfm9GkcWh5KOYAcJIw3n2OfTuTUNqM1PSPndznzzYO0CpKhIZh9RAOxR9s8inw68VwHGFqiScTXGro7IXStHx46zmtMB6+/YAkzfPNgifhJMXx9DLd6tYfksCfqjR2uD6W72E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=tMfSr/Ot; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="tMfSr/Ot"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 4992A1A2373;
	Mon, 22 Dec 2025 10:12:44 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1E8EF606C1;
	Mon, 22 Dec 2025 10:12:44 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 36F0B10AB019E;
	Mon, 22 Dec 2025 11:12:39 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766398362; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=3NUf0Nhrlt0ddoQz1HjmdPJ6+hVyvDbUTv3nR22W1zY=;
	b=tMfSr/Ot0LXnedVqyU5JNM+n5Ep2VIdYokPa/O6T3wwCCg+Rrjav1qHdugrW2V/Zk0ZevC
	yZTgRqHrQDwzZYry5ngAnx0Z/fQ5THxgsBpUd4eQrQ02/gt2bbJbTOyB48uX1R5z/SnO9m
	eE8U434UTeS0d+R0QONSXl+JrNXtDLbEfgiRTROe1cM0/S/qtfgU9Bdz94vySuCrbWKnsY
	/Hu2Fyo8XTlhHFCS3gfSP0GDQ3OWOR7+3ypqQ53rG+BwptW+Tw04VFdsMPJ5PRW3gWE69q
	HkH3Tzmr6TLMd1bUKnwzJvy24SUCLTS6Vy8VUBQ7RS1oWVHvgZPWC1sr826szA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 22 Dec 2025 11:11:31 +0100
Subject: [PATCH v3 29/33] drm/vkms: Store the enabled/disabled status for
 connector
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251222-vkms-all-config-v3-29-ba42dc3fb9ff@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6556;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=1hrPKI43Pz64zwGLv9pkMTEkwrfJC8vNHY1BYpuVT7Q=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpSRlDXSe5RIDSOy715xc6x1+AA9qlhduZUnRfr
 hWeSQkulTCJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaUkZQxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOJfThAAoscpiaJSLMKE7tYT6o2VK5yzjGzyfwU
 L+2NpDU134pf7WKD5pdPHzbt+MCPTyiD0mGj+neydVPSzRI1TsLbmmJDkk680BrTKdrvzkOH6Uv
 cksLzcpDkK0sR5UXlJgngxYvxexMrroBHcg53RCdMBxHkXRxbs3QX2avDazz2uYdKK918EOBWNQ
 hFgh9cHc8GnXL7OO/OV8lBDjCCU9t/fpqbRFYf7yv7no54Q6XOHvVCnQPV2DWjDU/ZJiFOQt9iG
 KIijyTaVt52pAPrXKIYyxecs3+4L7ZdtMVV+wLLpN6ftQNXKIKCHR6Wuuxke4F8Xk8w4h7KIpF8
 Vuad7jBJAVFMmrlDBg51wRqwXBAv/dgnSrm5xQTj6BU1hbq7JfMTEo0MMN0sbvaH8MTSpv4jfU9
 MDzhz8WV1lkmaPM2182IXwLDZJxeHDAu2Fzi+ppUL4J4mRB5FeC+/pPa3wIN5glAZKSkliKVz0O
 M5NKlhlXWlghz25b0q69idL52ghazGgTXeN22hPyhi45thP5VR2WIDcMqho97HxPtcwusitG9HU
 8lqV/gjCQ5qWIJ/LOTlVM4OskOOyOl+ZM59Rlczmw0Qbh8DKIwjlJZCDWVYbLaKt8nERCo7RwJO
 Oz7MwtffALu5JgoYhdeaJVHgrzdB9BgQO6COm6xfrdtnjjURJtlE=
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-Last-TLS-Session-Version: TLSv1.3

In order to prepare for dynamic connector configuration, we need to store
if a connector is dynamic and if it is enabled.

The two new vkms_config_connector fields will helps for that.

Co-developed-by: José Expósito <jose.exposito89@gmail.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/tests/vkms_config_test.c |  4 ++
 drivers/gpu/drm/vkms/vkms_config.c            |  6 +++
 drivers/gpu/drm/vkms/vkms_config.h            | 66 +++++++++++++++++++++++++++
 3 files changed, 76 insertions(+)

diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
index 2b49745ee026..fda23f05a0a5 100644
--- a/drivers/gpu/drm/vkms/tests/vkms_config_test.c
+++ b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
@@ -220,6 +220,10 @@ static void vkms_config_test_default_config(struct kunit *test)
 				0);
 		KUNIT_EXPECT_EQ(test, vkms_config_connector_get_edid_enabled(connector_cfg),
 				false);
+		KUNIT_EXPECT_EQ(test, vkms_config_connector_is_enabled(connector_cfg),
+				true);
+		KUNIT_EXPECT_EQ(test, vkms_config_connector_is_dynamic(connector_cfg),
+				false);
 	}
 
 	KUNIT_EXPECT_TRUE(test, vkms_config_is_valid(config));
diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index adb1a384c122..8abf9efc12e6 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -588,6 +588,8 @@ static int vkms_config_show(struct seq_file *m, void *data)
 
 	vkms_config_for_each_connector(vkmsdev->config, connector_cfg) {
 		seq_puts(m, "connector:\n");
+		seq_printf(m, "\t%s\n",
+			   str_enabled_disabled(vkms_config_connector_is_enabled(connector_cfg)));
 		seq_printf(m, "\tstatus=%s\n",
 			   drm_get_connector_status_name(vkms_config_connector_get_status(connector_cfg)));
 		seq_printf(m, "\ttype=%s\n",
@@ -601,6 +603,8 @@ static int vkms_config_show(struct seq_file *m, void *data)
 			   str_enabled_disabled(vkms_config_connector_get_edid_enabled(connector_cfg)),
 			   edid_len
 		);
+		seq_printf(m, "\tdynamic=%s\n",
+			   str_true_false(vkms_config_connector_is_dynamic(connector_cfg)));
 	}
 
 	return 0;
@@ -919,6 +923,8 @@ struct vkms_config_connector *vkms_config_create_connector(struct vkms_config *c
 	connector_cfg->status = connector_status_connected;
 	vkms_config_connector_set_type(connector_cfg, DRM_MODE_CONNECTOR_VIRTUAL);
 	vkms_config_connector_set_supported_colorspaces(connector_cfg, 0);
+	vkms_config_connector_set_dynamic(connector_cfg, false);
+	vkms_config_connector_set_enabled(connector_cfg, true);
 	xa_init_flags(&connector_cfg->possible_encoders, XA_FLAGS_ALLOC);
 
 	list_add_tail(&connector_cfg->link, &config->connectors);
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index 7cca1cc130b0..281434628e0e 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -131,6 +131,8 @@ struct vkms_config_encoder {
  * @link: Link to the others connector in vkms_config
  * @type: Store the type of connector using DRM_MODE_CONNECTOR_* values
  * @config: The vkms_config this connector belongs to
+ * @dynamic: Store if a connector should be created with drm_connector_dynamic_init
+ * @enabled: If @dynamic, this means that the connector is currently registered in drm
  * @status: Status (connected, disconnected...) of the connector
  * @supported_colorspaces: Bitmask of all the supported colorspaces. Values
  *                         are the sames as ones accepted by
@@ -150,6 +152,8 @@ struct vkms_config_connector {
 	struct vkms_config *config;
 
 	int type;
+	bool enabled;
+	bool dynamic;
 	enum drm_connector_status status;
 	u32 supported_colorspaces;
 	bool edid_enabled;
@@ -193,6 +197,24 @@ struct vkms_config_connector {
 #define vkms_config_for_each_connector(config, connector_cfg) \
 	list_for_each_entry((connector_cfg), &(config)->connectors, link)
 
+/**
+ * vkms_config_for_each_connector_static - Iterate over the static vkms_config connectors
+ * @config: &struct vkms_config pointer
+ * @connector_cfg: &struct vkms_config_connector pointer used as cursor
+ */
+#define vkms_config_for_each_connector_static(config, connector_cfg) \
+	vkms_config_for_each_connector((config), (connector_cfg)) \
+		if (!(connector_cfg)->dynamic)
+
+/**
+ * vkms_config_for_each_connector_dynamic - Iterate over the dynamic vkms_config connectors
+ * @config: &struct vkms_config pointer
+ * @connector_cfg: &struct vkms_config_connector pointer used as cursor
+ */
+#define vkms_config_for_each_connector_dynamic(config, connector_cfg) \
+	vkms_config_for_each_connector((config), (connector_cfg)) \
+		if ((connector_cfg)->dynamic)
+
 /**
  * vkms_config_plane_for_each_possible_crtc - Iterate over the vkms_config_plane
  * possible CRTCs
@@ -471,6 +493,50 @@ vkms_config_connector_set_type(struct vkms_config_connector *connector_cfg,
 	connector_cfg->type = type;
 }
 
+/**
+ * vkms_config_connector_set_enabled() - If the connector is part of the device
+ * @crtc_cfg: Target connector
+ * @enabled: Add or remove the connector
+ */
+static inline void
+vkms_config_connector_set_enabled(struct vkms_config_connector *connector_cfg,
+				  bool enabled)
+{
+	connector_cfg->enabled = enabled;
+}
+
+/**
+ * vkms_config_connector_is_enabled() - If the connector is part of the device
+ * @connector_cfg: The connector
+ */
+static inline bool
+vkms_config_connector_is_enabled(const struct vkms_config_connector *connector_cfg)
+{
+	return connector_cfg->enabled;
+}
+
+/**
+ * vkms_config_connector_set_dynamic() - If the connector is dynamic
+ * @crtc_cfg: Target connector
+ * @enabled: Enable or disable the dynamic status
+ */
+static inline void
+vkms_config_connector_set_dynamic(struct vkms_config_connector *connector_cfg,
+				  bool dynamic)
+{
+	connector_cfg->dynamic = dynamic;
+}
+
+/**
+ * vkms_config_connector_is_enabled() - If the connector is dynamic
+ * @connector_cfg: The connector
+ */
+static inline bool
+vkms_config_connector_is_dynamic(struct vkms_config_connector *connector_cfg)
+{
+	return connector_cfg->dynamic;
+}
+
 /*
  * vkms_config_plane_get_default_rotation() - Get the default rotation for a plane
  * @plane_cfg: Plane to get the default rotation from

-- 
2.51.2

