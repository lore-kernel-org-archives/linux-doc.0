Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A4434D4F4
	for <linux-doc@vger.kernel.org>; Wed, 29 Oct 2025 13:31:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761744664; cv=none; b=Nj97wPyNgYNI9nCLBP0VXtFZJsBFEHzhTg5z/AAl6+zYic6KyXNB2RKLOHg29iUHHb7Vkp+oja66FQrbNlG6rPfvop25hAxYb4d0OC8wn+LlN4Qyx7gkGp0jbaoImlYNyO8r8BYE9oDPjRNCjZ1q3StMsonjCFmmjJov4J5FnKQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761744664; c=relaxed/simple;
	bh=MW+TBo4PtU3ICsaNvIu8XELjIkOf8Ka1JhDlVk3E2vU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=iW+Cef8nPFN6et6k1Lc9jwXNd78/BPidUGMdSyKMvfh011fyCNrW4rQPObMtsAAHPPMSV43gAGcI51vdZR8MrfSS+rb+ygp1co2NL7AedFzH39M3y5WDsJUs+HSZP3P+CdJhNngzekcyluB25L5Gp1ZiU+N4DQSGcEtAWl5GttI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=UHs1/BtP; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="UHs1/BtP"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id E8777C0DB02;
	Wed, 29 Oct 2025 13:30:40 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 4B624606E8;
	Wed, 29 Oct 2025 13:31:01 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4052C117F80A0;
	Wed, 29 Oct 2025 14:30:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761744660; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=k+CPr3GRQ9NHOG87KjHsgaVZ994Pa6rjX1YtzoCQq6c=;
	b=UHs1/BtPUHzF4pJ4eoWtqGhUgg3Hfs2tM/tTunyiWDnKHwzyeBxdg8USZbibZ/zd40qdxB
	mMgchdjY3MpE+Xagx7XEa1zQr1KCCrkuWqd/Ug5cgJkpFAm818D1CSLmPmxcFYWbrlHdIr
	MbBIh39Ay+PFg6m6ANZEBUHId870iduGHVrg9XJHXq8SpGxAMeeP903Q6hBHhLvA8zF6ky
	ddkI7Jseibr2d0PAVhDBpoVd8Oz2BEHukeBUE9WbB4WOtzLk8c22KbP//hlYvK/tEs8edO
	yq9ap/2AtL1oTZV6RI6tBMWZhHjNgu6CibVWMDTelmVIUlSiT4xq3h4jn0ailQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 29 Oct 2025 14:30:31 +0100
Subject: [PATCH v2 21/32] drm/vkms: Introduce config for connector type
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-vkms-all-config-v2-21-be20b9bf146e@bootlin.com>
References: <20251029-vkms-all-config-v2-0-be20b9bf146e@bootlin.com>
In-Reply-To: <20251029-vkms-all-config-v2-0-be20b9bf146e@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=6484;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=MW+TBo4PtU3ICsaNvIu8XELjIkOf8Ka1JhDlVk3E2vU=;
 b=kA0DAAoBIK0uxlsQLOIByyZiAGkCFuugmwm6bvmukTl/GIPlVEjV4r14Fq1nXIXQ5xH+wjCam
 IkCMwQAAQoAHRYhBE+PuD++eDwxDFBZBCCtLsZbECziBQJpAhbrAAoJECCtLsZbECziRgkP/0nB
 qygCL+yL/ZMLt0AUxB0jwZ5Ks/De4AH3GQ3T38pTVh86KYn9V6Y0I6QYBAouW68uPuKkOQDxKfO
 re4jl7jGEZEha2JxgGxLJJQUCuCnpY4MlNsuZDQhwuGeCSulQrpvgTCdbPlaK1IYKAnThXLU45j
 ULxEIrsmIKqvaJJsBopP4b36hebAfJVWkRMqUuRSITVc6hEnOuknQabqJOqrPQHWOXv+bZsmAGl
 yaSIjJkHbJubxgV6/30KoLsqB0cg1IXhvAJ7w1j58t94eEjtq2gWgDmrwJNtPuyHxkjg3YuvEzi
 +3cIek1Oo3JIAq3vxkQvON/3j2E9Wql9sFjjLkVDM5Kf2y5tamGfXts6RI9cW0Lq4E6JIYCo1Hd
 ZsuhTZHTsNBRnWnMljeDZV+WX1KxL4nmrfiGDSIUGS6kxSTPd9wDYvf9/J8Mn/QYTlGBFSfeKQC
 TfDLZcjkh6nc2chco6l3irMtZH5DQsjkwkOx6HPRFVNYmhwA+BpDOV1htyTAr1FNj2qiJwwm36k
 5cR75hfGMV0YDHOz0I3pTeRbnT0pXzy5I7fmVVWxAyQeB220bH3axljg1KcD2MKL456UydDM6cp
 KxQ8uzQ8638dXDTlWQVf0Rw1s/QLx5XU5Pd8mQF2NrdFZQZGOm0Vq37EynAWQWOSOJIf1zEI2bT
 Pl6tg
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-Last-TLS-Session-Version: TLSv1.3

In order to emulate connector-specific behavior, add connector type
configuration.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/tests/vkms_config_test.c |  5 +++++
 drivers/gpu/drm/vkms/vkms_config.c            |  3 +++
 drivers/gpu/drm/vkms/vkms_config.h            | 24 ++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_connector.c         |  5 +++--
 drivers/gpu/drm/vkms/vkms_connector.h         |  3 ++-
 drivers/gpu/drm/vkms/vkms_output.c            |  2 +-
 6 files changed, 38 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
index 518e68c17122..c8b885306eed 100644
--- a/drivers/gpu/drm/vkms/tests/vkms_config_test.c
+++ b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
@@ -128,6 +128,7 @@ static void vkms_config_test_default_config(struct kunit *test)
 	struct vkms_config *config;
 	struct vkms_config_plane *plane_cfg;
 	struct vkms_config_crtc *crtc_cfg;
+	struct vkms_config_connector *connector_cfg;
 	int n_primaries = 0;
 	int n_cursors = 0;
 	int n_overlays = 0;
@@ -198,6 +199,10 @@ static void vkms_config_test_default_config(struct kunit *test)
 
 	/* Connectors */
 	KUNIT_EXPECT_EQ(test, vkms_config_get_num_connectors(config), 1);
+	vkms_config_for_each_connector(config, connector_cfg) {
+		KUNIT_EXPECT_EQ(test, vkms_config_connector_get_type(connector_cfg),
+				DRM_MODE_CONNECTOR_VIRTUAL);
+	}
 
 	KUNIT_EXPECT_TRUE(test, vkms_config_is_valid(config));
 
diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index 801019cf04c1..02e2f0249fb0 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -588,6 +588,8 @@ static int vkms_config_show(struct seq_file *m, void *data)
 		seq_puts(m, "connector:\n");
 		seq_printf(m, "\tstatus=%s\n",
 			   drm_get_connector_status_name(vkms_config_connector_get_status(connector_cfg)));
+		seq_printf(m, "\ttype=%s\n",
+			   drm_get_connector_type_name(vkms_config_connector_get_type(connector_cfg)));
 	}
 
 	return 0;
@@ -893,6 +895,7 @@ struct vkms_config_connector *vkms_config_create_connector(struct vkms_config *c
 
 	connector_cfg->config = config;
 	connector_cfg->status = connector_status_connected;
+	vkms_config_connector_set_type(connector_cfg, DRM_MODE_CONNECTOR_VIRTUAL);
 	xa_init_flags(&connector_cfg->possible_encoders, XA_FLAGS_ALLOC);
 
 	list_add_tail(&connector_cfg->link, &config->connectors);
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index baed036a07cd..6a50ec7535af 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -128,6 +128,7 @@ struct vkms_config_encoder {
  * struct vkms_config_connector
  *
  * @link: Link to the others connector in vkms_config
+ * @type: Store the type of connector using DRM_MODE_CONNECTOR_* values
  * @config: The vkms_config this connector belongs to
  * @status: Status (connected, disconnected...) of the connector
  * @possible_encoders: Array of encoders that can be used with this connector
@@ -140,6 +141,7 @@ struct vkms_config_connector {
 	struct list_head link;
 	struct vkms_config *config;
 
+	int type;
 	enum drm_connector_status status;
 	struct xarray possible_encoders;
 
@@ -317,6 +319,28 @@ vkms_config_plane_set_type(struct vkms_config_plane *plane_cfg,
 }
 
 /**
+ * vkms_config_connector_get_type() - Return the connector type
+ * @connector_cfg: Connector to get the type from
+ */
+static inline int
+vkms_config_connector_get_type(const struct vkms_config_connector *connector_cfg)
+{
+	return connector_cfg->type;
+}
+
+/**
+ * vkms_config_connector_set_type() - Set the connector type
+ * @connector_cfg: Connector to set the type to
+ * @type: New connector type
+ */
+static inline void
+vkms_config_connector_set_type(struct vkms_config_connector *connector_cfg,
+			       int type)
+{
+	connector_cfg->type = type;
+}
+
+/*
  * vkms_config_plane_get_default_rotation() - Get the default rotation for a plane
  * @plane_cfg: Plane to get the default rotation from
  *
diff --git a/drivers/gpu/drm/vkms/vkms_connector.c b/drivers/gpu/drm/vkms/vkms_connector.c
index b0a6b212d3f4..5a87dc2d4c63 100644
--- a/drivers/gpu/drm/vkms/vkms_connector.c
+++ b/drivers/gpu/drm/vkms/vkms_connector.c
@@ -68,7 +68,8 @@ static const struct drm_connector_helper_funcs vkms_conn_helper_funcs = {
 	.best_encoder = vkms_conn_best_encoder,
 };
 
-struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev)
+struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev,
+					   struct vkms_config_connector *connector_cfg)
 {
 	struct drm_device *dev = &vkmsdev->drm;
 	struct vkms_connector *connector;
@@ -79,7 +80,7 @@ struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev)
 		return ERR_PTR(-ENOMEM);
 
 	ret = drmm_connector_init(dev, &connector->base, &vkms_connector_funcs,
-				  DRM_MODE_CONNECTOR_VIRTUAL, NULL);
+				  vkms_config_connector_get_type(connector_cfg), NULL);
 	if (ret)
 		return ERR_PTR(ret);
 
diff --git a/drivers/gpu/drm/vkms/vkms_connector.h b/drivers/gpu/drm/vkms/vkms_connector.h
index ed312f4eff3a..a124c5403697 100644
--- a/drivers/gpu/drm/vkms/vkms_connector.h
+++ b/drivers/gpu/drm/vkms/vkms_connector.h
@@ -24,7 +24,8 @@ struct vkms_connector {
  * Returns:
  * The connector or an error on failure.
  */
-struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev);
+struct vkms_connector *vkms_connector_init(struct vkms_device *vkmsdev,
+					   struct vkms_config_connector *connector_cfg);
 
 /**
  * vkms_trigger_connector_hotplug() - Update the device's connectors status
diff --git a/drivers/gpu/drm/vkms/vkms_output.c b/drivers/gpu/drm/vkms/vkms_output.c
index 22208d02afa4..217f054d9598 100644
--- a/drivers/gpu/drm/vkms/vkms_output.c
+++ b/drivers/gpu/drm/vkms/vkms_output.c
@@ -96,7 +96,7 @@ int vkms_output_init(struct vkms_device *vkmsdev)
 		struct vkms_config_encoder *possible_encoder;
 		unsigned long idx = 0;
 
-		connector_cfg->connector = vkms_connector_init(vkmsdev);
+		connector_cfg->connector = vkms_connector_init(vkmsdev, connector_cfg);
 		if (IS_ERR(connector_cfg->connector)) {
 			DRM_ERROR("Failed to init connector\n");
 			return PTR_ERR(connector_cfg->connector);

-- 
2.51.0

