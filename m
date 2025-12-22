Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ABB5326D6B
	for <linux-doc@vger.kernel.org>; Mon, 22 Dec 2025 10:12:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766398376; cv=none; b=P9uBpZgeVGfUpAyLDdaM9VDujmcC6clA2F1BcMTUFfKBblgCyCmp5eHxvVWQBhDfHqV3qcFnquSRP8Kh6uf1OLZ61VCtr3mPmoAvZmfLGa8LT0M0uBPkEm1tgKw4fQ9F7sPRB701Ow3IBVg1vGc9TJogKIsLi3XqbP4Im5mG3t8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766398376; c=relaxed/simple;
	bh=2WE6lrzqgr2rCNqCgI40uchmGUNbk9xLaNdA11sdE7M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IyDBTdBob1JpA//bsm9Nwh50L0RCmaiWTF81+VAkXcow4f4l2T+C9EqhsfOuR9fIv+ibsusNch1cAESvTNEzR7SSc/xMxWrGuHzCxP1KE8KzEY6Qaf42fxY9HaQwwsI6LcNMfvGC0fMn4NQGgIeNJtmMDqUpCeu+p09WGTK7X7s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=aAqRDjWq; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="aAqRDjWq"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id CAC0B4E41D35;
	Mon, 22 Dec 2025 10:12:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9F686606C1;
	Mon, 22 Dec 2025 10:12:51 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DAF5610AB0199;
	Mon, 22 Dec 2025 11:12:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766398370; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=zTVxelzVCNuhZPYTj04Vug2YyxvhIBL9J1QfsUumizQ=;
	b=aAqRDjWqYeALPuzRJcK/RLliPmBxKcaziOCzerWMCgTrLZG8+iWn4j5zRQ9NJ+hJId287T
	uMXC/rooO+zZxF6DUNWBDd7T8cnMOrT+rxY7zfclsGv5X0I9a0ETwUBwnuWcEytRxvIvnq
	1uZhcEywuE5pDFIvVKBg5v1UMO3Tc+R2O3QOZTwnvdxT1j2vkVcoITDRewvuEB3+BcmgaC
	4i71cvqBu2Lb8/VHzalIS3qDVjV6fUyDZcEnINaESFb/2oDKr1wjEdyqatSMsNAGMiq1YJ
	LSHA1hrzFDhlvjjl2+mRTyBLhfB5s968g/aLfHXYUmqTn7RhvLWG8HCEgSGcYg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 22 Dec 2025 11:11:34 +0100
Subject: [PATCH v3 32/33] drm/vkms: Allow to hot-add connectors
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251222-vkms-all-config-v3-32-ba42dc3fb9ff@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5958;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=2WE6lrzqgr2rCNqCgI40uchmGUNbk9xLaNdA11sdE7M=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpSRlEnESIUlIlcMfuzqof2lJt/w0YhAI10Mhn9
 rU0dEGCAGCJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaUkZRBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOJkMxAA1HfTAuanWpUbRLyXmZF9ZUIjJOnPFR7
 xaIablR9LKhCGRjsza3pPIen4VIF4K+dqpsKFWvqDG9zcpojf6dp7oHaqSyG1I1o6NXe+LVVcLP
 yvQXUnpSxE5nX8Opm9FmbHKG9VS4KjHvXJJIIgt4/+rIzzheNoTpRRfayS4X1oPV5wEcQbZn0ks
 iwKqvdXuvIZZrZgZIDT8xkgNdcF1DB4Libl1E5SRgCzJIdYJnU5wmK7rg/m6kAgb3xRXdqJVhXf
 uBFcSlBhyYqJuzqQGKkJS3Vng9iCqF65RK55h/VeikTTBScGMbMdx1zqrn8zfMxAJ0O7zq+bcY6
 9azsOsGmlaHSu/baWDNVCsbu1y2lqeoU1X5ugyaeRhqecMLqVfrtuAFvaoPW4Uu0pO7I3pC/wFb
 N9qgzrFarLbLVwh23pZ3axDMxqZ3QYjdjVzw2GU5nvBYAtW3SHclORSpib8x5AcoKybketNu2Pt
 ZPgyyPEEOGxuuspIpnx4MkkrZN0vWJR6mPQ9b9bgKm6bXR83ym5jM50OFIN/FV0mLm0Cse52G4K
 tsHbZQ/zT9KLr1RTR+OX7N5RDjSpyYPfxgFB3KIbHyC72/X2/qAInmx6/gq8aKS6FONxDBsUpig
 FPiuphFDrEObTYPkRBnNxz1AVddYnjuvJulxaqe4GtoqgoWEzPak=
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-Last-TLS-Session-Version: TLSv1.3

In order to allow creating dynamic connector, add the required
infrastructure in vkms_connector.

[Louis Chauvet: use drm_atomic_helper_connector_reset instead of
drm_mode_config_reset because connector is not yet registered]

Co-developed-by: José Expósito <jose.exposito89@gmail.com>
Signed-off-by: José Expósito <jose.exposito89@gmail.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_connector.c | 81 +++++++++++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_connector.h | 33 ++++++++++++++
 drivers/gpu/drm/vkms/vkms_output.c    |  9 ++++
 3 files changed, 123 insertions(+)

diff --git a/drivers/gpu/drm/vkms/vkms_connector.c b/drivers/gpu/drm/vkms/vkms_connector.c
index 3ad614642355..616036494937 100644
--- a/drivers/gpu/drm/vkms/vkms_connector.c
+++ b/drivers/gpu/drm/vkms/vkms_connector.c
@@ -163,9 +163,90 @@ struct vkms_connector *vkms_connector_init_static(struct vkms_device *vkmsdev,
 	return connector;
 }
 
+static void vkms_connector_dynamic_destroy(struct drm_connector *connector)
+{
+	struct drm_device *dev = connector->dev;
+	struct vkms_connector *vkms_connector;
+
+	drm_connector_cleanup(connector);
+
+	vkms_connector = drm_connector_to_vkms_connector(connector);
+	drmm_kfree(dev, vkms_connector);
+}
+
+static const struct drm_connector_funcs vkms_dynamic_connector_funcs = {
+	.fill_modes = drm_helper_probe_single_connector_modes,
+	.reset = drm_atomic_helper_connector_reset,
+	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
+	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
+	.destroy = vkms_connector_dynamic_destroy,
+	.detect = vkms_connector_detect,
+};
+
 void vkms_trigger_connector_hotplug(struct vkms_device *vkmsdev)
 {
 	struct drm_device *dev = &vkmsdev->drm;
 
 	drm_kms_helper_hotplug_event(dev);
 }
+
+struct vkms_connector *vkms_connector_hot_add(struct vkms_device *vkmsdev,
+					      struct vkms_config_connector *connector_cfg)
+{
+	struct vkms_config_encoder *encoder_cfg;
+	struct vkms_connector *connector;
+	int ret;
+	unsigned long idx = 0;
+
+	connector = drmm_kzalloc(&vkmsdev->drm, sizeof(*connector), GFP_KERNEL);
+	if (IS_ERR(connector))
+		return connector;
+	ret = drm_connector_dynamic_init(&vkmsdev->drm,
+					 &connector->base,
+					 &vkms_dynamic_connector_funcs,
+					 connector_cfg->type,
+					 NULL);
+	if (ret)
+		return ERR_PTR(ret);
+	drm_connector_helper_add(&connector->base, &vkms_conn_helper_funcs);
+
+	vkms_config_connector_for_each_possible_encoder(connector_cfg, idx, encoder_cfg) {
+		ret = drm_connector_attach_encoder(&connector->base,
+						   encoder_cfg->encoder);
+		if (ret)
+			return ERR_PTR(ret);
+	}
+
+	drm_atomic_helper_connector_reset(&connector->base);
+
+	vkms_connector_init(vkmsdev, connector, connector_cfg);
+
+	ret = drm_connector_dynamic_register(&connector->base);
+	if (ret)
+		return ERR_PTR(ret);
+
+	return connector;
+}
+
+void vkms_connector_hot_remove(struct vkms_device *vkmsdev,
+			       struct vkms_connector *connector)
+{
+	drm_connector_unregister(&connector->base);
+	drm_mode_config_reset(&vkmsdev->drm);
+	drm_connector_put(&connector->base);
+}
+
+int vkms_connector_hot_attach_encoder(struct vkms_device *vkmsdev,
+				      struct vkms_connector *connector,
+				      struct drm_encoder *encoder)
+{
+	int ret;
+
+	ret = drm_connector_attach_encoder(&connector->base, encoder);
+	if (ret)
+		return ret;
+
+	drm_mode_config_reset(&vkmsdev->drm);
+
+	return ret;
+}
diff --git a/drivers/gpu/drm/vkms/vkms_connector.h b/drivers/gpu/drm/vkms/vkms_connector.h
index 85f9082c710e..a235a518d5a0 100644
--- a/drivers/gpu/drm/vkms/vkms_connector.h
+++ b/drivers/gpu/drm/vkms/vkms_connector.h
@@ -34,4 +34,37 @@ struct vkms_connector *vkms_connector_init_static(struct vkms_device *vkmsdev,
  */
 void vkms_trigger_connector_hotplug(struct vkms_device *vkmsdev);
 
+/**
+ * vkms_connector_hot_add() - Create a connector after the device is created
+ * @vkmsdev: Device to hot-add the connector to
+ * @connector_cfg: Connector's configuration
+ *
+ * Returns:
+ * A pointer to the newly created connector or a PTR_ERR on failure.
+ */
+struct vkms_connector *vkms_connector_hot_add(struct vkms_device *vkmsdev,
+					      struct vkms_config_connector *connector_cfg);
+
+/**
+ * vkms_connector_hot_remove() - Remove a connector after a device is created
+ * @vkmsdev: Device to containing the connector to be removed
+ * @connector: The connector to hot-remove
+ */
+void vkms_connector_hot_remove(struct vkms_device *vkmsdev,
+			       struct vkms_connector *connector);
+
+/**
+ * vkms_connector_hot_attach_encoder() - Attach a connector to a encoder after
+ * the device is created.
+ * @vkmsdev: Device containing the connector and the encoder
+ * @connector: Connector to attach to @encoder
+ * @encoder: Target encoder
+ *
+ * Returns:
+ * 0 on success or an error on failure.
+ */
+int vkms_connector_hot_attach_encoder(struct vkms_device *vkmsdev,
+				      struct vkms_connector *connector,
+				      struct drm_encoder *encoder);
+
 #endif /* _VKMS_CONNECTOR_H_ */
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 13c4ca5fd39d..50f7d88dee8b 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -117,5 +117,14 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 
 	drm_mode_config_reset(dev);
 
+	vkms_config_for_each_connector_dynamic(vkmsdev->config, connector_cfg) {
+		if (connector_cfg->enabled) {
+			connector_cfg->connector = vkms_connector_hot_add(vkmsdev, connector_cfg);
+
+			if (IS_ERR(connector_cfg->connector))
+				return PTR_ERR(connector_cfg->connector);
+		}
+	}
+
 	return 0;
 }

-- 
2.51.2

