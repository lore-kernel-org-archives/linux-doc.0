Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 074DB314A73
	for <linux-doc@vger.kernel.org>; Mon, 22 Dec 2025 10:11:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766398300; cv=none; b=RWusamgcsgAqjN8L49ERydZ1TRxBsup60d08qzk8sATBx/VNIggLcokFNhBuJuxhkbitNRFEBv/lfKs0NH2EXswn3AO6Th5vpLKaAPByX6v09fVQGRJl9rXNRg7MzVvLE3BB0bX3z4Vf7yvFK8tRVGO4ucO5sTGgbP0ciAB6DeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766398300; c=relaxed/simple;
	bh=99rsMtDLMeM5AsaULN4Q0GIOz3k7cELphzqUHT3Nj+I=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fr4NgZG5GfFS1NzFl2pNUysqvJ+ZTyEsG+HVOPXcZxnOjxeaQ9XnMcxnmFPchXSRqS/bleLevB0YqbEqONEqQl+4duQIhX21yu2x7qsVzQaplFgWrp+kYX644M7MbNtcMt66At3Ca5tjusyXAosI8Fzolgamgok2IDQB8W51wjQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=rVLZuJCo; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="rVLZuJCo"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 8374F4E41D33;
	Mon, 22 Dec 2025 10:11:36 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5A024606C1;
	Mon, 22 Dec 2025 10:11:36 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 65EAB10AB01A1;
	Mon, 22 Dec 2025 11:11:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766398292; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=guGdjBCKWPwgWY7mRq2vpD5KExhd5nJM2mcKSd+dU3A=;
	b=rVLZuJCoGatIHt4lTQsQftKxa/2as1dYNdQKQqI4NI3T2QblE+T/K6MLiRomjbTs+TKrNM
	35qerpjnSe2sJOgdgcPXx9P6A15WCuFDXbRJHyMCq32WH2uOmq+SNTWin+fzbbI/7hlW6n
	t1lI2HM+MWEdpsSGDFhSmaOE6yWVCwgOemo5sCOYl0omffwtzTpTjjGUSOKal476EKbnMd
	8qs8ID0Qj++IWx/0n5pjqJDUOdMxDvqrmTqHDX2OeO/62mumVi5HrGnZOHUKRd1Pg+Nnui
	eNDk7u17knMXOx5eoipK3DjzsJWFy/dBFU6sQrhbKscx1HNEgrVC0t9nwt1Ruw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 22 Dec 2025 11:11:11 +0100
Subject: [PATCH v3 09/33] drm/vkms: Introduce config for plane rotation
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-vkms-all-config-v3-9-ba42dc3fb9ff@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=11904;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=99rsMtDLMeM5AsaULN4Q0GIOz3k7cELphzqUHT3Nj+I=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpSRlAJaknsif0ML+akdyUo/PscyGm7ZClLlBq/
 OIEMKFEnvqJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaUkZQBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOKl6BAAxQ8ZsolNTG6elU6E46mW4p72Jb2rAP8
 E/MGbUa59rd+J+C6JVdOttMw7Yd0pX5DCL4ofv5YDSa8no7RVWaeTGPiJbJZMJyOlM7CRrBUbgz
 yquB+rXXFSDdkrujCd6qZkM8gLy1CQdFPUTPOCJjOorRYxTqfiMB/tvnjp+jvOATYGLZxy21Hrk
 9vXQUZbCjxm6RffRy1vxMLN0qbPY/66iX9nGWJ75ux4jPn2hrzDWixOYVCMH/Rknam8R2x/bQ/6
 ARxMTHrr3T4bBrxIfnr63ngUL1ZaI/hzAsZjIIEjAUmHTnJrzO8x01dHqXGeUCN6bG+sutjlgoN
 RS+EjavsgqWlCq/eAcko2VaCU1TkfwuGVIAZNWmvk940uYmICEVMebecgm5RDwCeCrYO4XNQ1SO
 GaMWV5YyC6dYVD05KKYH01rcgGEqF7XDpOQz3J4H0C85cw5vhYDnTTHz5lCWTJXtx12vMXYLa++
 nHkKPQu/zrnFnggPQ0Hf4PtOU46bzRsLTfuXIeO1SfufDwawMMcJ+e5h8Om+pa1Vj7VqEodpko7
 hSkTkDE8LAueBkpFRlFoSwhfSI/wcL+xiww42Pq0WbROXoovPT9/fE0LvvffXK6goZa0U7cZ6mp
 pEQMFwunNcadaQLLZIhCtWK8+UmY2O4zf0WfD4GpmMAq+b9oobXM=
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-Last-TLS-Session-Version: TLSv1.3

VKMS driver supports all the rotation on planes, but for testing it can be
useful to only advertise few of them. This new configuration interface
will allow configuring the rotation per planes.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/tests/vkms_config_test.c | 46 +++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_config.c            | 63 +++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_config.h            | 59 +++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_plane.c             |  5 ++-
 4 files changed, 171 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
index 1e4ea1863420..c33fe737678f 100644
--- a/drivers/gpu/drm/vkms/tests/vkms_config_test.c
+++ b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
@@ -1,5 +1,6 @@
 // SPDX-License-Identifier: GPL-2.0+
 
+#include <drm/drm_mode.h>
 #include <kunit/test.h>
 
 #include "../vkms_config.h"
@@ -185,6 +186,12 @@ static void vkms_config_test_default_config(struct kunit *test)
 			n_possible_crtcs++;
 		}
 		KUNIT_EXPECT_EQ(test, n_possible_crtcs, 1);
+		KUNIT_EXPECT_EQ(test,
+				vkms_config_plane_get_supported_rotations(plane_cfg),
+				DRM_MODE_ROTATE_MASK | DRM_MODE_REFLECT_MASK);
+		KUNIT_EXPECT_EQ(test,
+				vkms_config_plane_get_default_rotation(plane_cfg),
+				DRM_MODE_ROTATE_0);
 	}
 
 	/* Encoders */
@@ -481,6 +488,44 @@ static void vkms_config_test_valid_plane_type(struct kunit *test)
 	vkms_config_destroy(config);
 }
 
+static void vkms_config_test_valid_plane_rotations(struct kunit *test)
+{
+	struct vkms_config *config;
+	struct vkms_config_plane *plane_cfg;
+
+	config = vkms_config_default_create(false, false, false, false);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, config);
+
+	plane_cfg = get_first_plane(config);
+
+	/* Valid, no rotation, no reflection */
+	vkms_config_plane_set_supported_rotations(plane_cfg, DRM_MODE_ROTATE_0);
+	vkms_config_plane_set_default_rotation(plane_cfg, DRM_MODE_ROTATE_0);
+	KUNIT_EXPECT_TRUE(test, vkms_config_valid_plane_rotation(config, plane_cfg));
+	KUNIT_EXPECT_TRUE(test, vkms_config_is_valid(config));
+
+	/* Invalid, default rotation is not supported */
+	vkms_config_plane_set_supported_rotations(plane_cfg, DRM_MODE_ROTATE_0);
+	vkms_config_plane_set_default_rotation(plane_cfg, DRM_MODE_ROTATE_90);
+	KUNIT_EXPECT_FALSE(test, vkms_config_valid_plane_rotation(config, plane_cfg));
+	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
+
+	/* Invalid, supported rotations must contains at least one rotation */
+	vkms_config_plane_set_supported_rotations(plane_cfg, DRM_MODE_REFLECT_MASK);
+	vkms_config_plane_set_default_rotation(plane_cfg, DRM_MODE_REFLECT_X | DRM_MODE_ROTATE_0);
+	KUNIT_EXPECT_FALSE(test, vkms_config_valid_plane_rotation(config, plane_cfg));
+	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
+
+	/* Invalid, default rotation must contains at least one rotation */
+	vkms_config_plane_set_supported_rotations(plane_cfg,
+						  DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_0);
+	vkms_config_plane_set_default_rotation(plane_cfg, DRM_MODE_REFLECT_X);
+	KUNIT_EXPECT_FALSE(test, vkms_config_valid_plane_rotation(config, plane_cfg));
+	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
+
+	vkms_config_destroy(config);
+}
+
 static void vkms_config_test_valid_plane_possible_crtcs(struct kunit *test)
 {
 	struct vkms_config *config;
@@ -1003,6 +1048,7 @@ static struct kunit_case vkms_config_test_cases[] = {
 	KUNIT_CASE(vkms_config_test_get_connectors),
 	KUNIT_CASE(vkms_config_test_invalid_plane_number),
 	KUNIT_CASE(vkms_config_test_valid_plane_type),
+	KUNIT_CASE(vkms_config_test_valid_plane_rotations),
 	KUNIT_CASE(vkms_config_test_valid_plane_possible_crtcs),
 	KUNIT_CASE(vkms_config_test_invalid_crtc_number),
 	KUNIT_CASE(vkms_config_test_invalid_encoder_number),
diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index f31a1eb8f811..7aa087602807 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -3,7 +3,9 @@
 #include <linux/slab.h>
 #include <linux/string_choices.h>
 
+#include <drm/drm_blend.h>
 #include <drm/drm_connector.h>
+#include <drm/drm_mode.h>
 #include <drm/drm_print.h>
 #include <drm/drm_debugfs.h>
 #include <kunit/visibility.h>
@@ -150,6 +152,33 @@ static bool valid_plane_number(const struct vkms_config *config)
 	return true;
 }
 
+VISIBLE_IF_KUNIT
+bool vkms_config_valid_plane_rotation(const struct vkms_config *config,
+				      const struct vkms_config_plane *plane_cfg)
+{
+	struct drm_device *dev = config->dev ? &config->dev->drm : NULL;
+
+	if ((vkms_config_plane_get_default_rotation(plane_cfg) &
+	     vkms_config_plane_get_supported_rotations(plane_cfg)) !=
+	    vkms_config_plane_get_default_rotation(plane_cfg)) {
+		drm_info(dev, "Configured default rotation is not supported by the plane\n");
+		return false;
+	}
+
+	if ((vkms_config_plane_get_default_rotation(plane_cfg) & DRM_MODE_ROTATE_MASK) == 0) {
+		drm_info(dev, "Configured default rotation must contains at least one possible rotation\n");
+		return false;
+	}
+
+	if ((vkms_config_plane_get_supported_rotations(plane_cfg) & DRM_MODE_ROTATE_MASK) == 0) {
+		drm_info(dev, "Configured supported rotations must contains at least one possible rotation\n");
+		return false;
+	}
+
+	return true;
+}
+EXPORT_SYMBOL_IF_KUNIT(vkms_config_valid_plane_rotation);
+
 static bool valid_planes_for_crtc(const struct vkms_config *config,
 				  struct vkms_config_crtc *crtc_cfg)
 {
@@ -307,6 +336,12 @@ static bool valid_connector_possible_encoders(const struct vkms_config *config)
 bool vkms_config_is_valid(const struct vkms_config *config)
 {
 	struct vkms_config_crtc *crtc_cfg;
+	struct vkms_config_plane *plane_cfg;
+
+	vkms_config_for_each_plane(config, plane_cfg) {
+		if (!vkms_config_valid_plane_rotation(config, plane_cfg))
+			return false;
+	}
 
 	if (!valid_plane_number(config))
 		return false;
@@ -338,6 +373,22 @@ bool vkms_config_is_valid(const struct vkms_config *config)
 }
 EXPORT_SYMBOL_IF_KUNIT(vkms_config_is_valid);
 
+static void show_bitfield(struct seq_file *m, uint32_t value, const char *callback(unsigned int))
+{
+	u32 offset = 0;
+	bool first = true;
+
+	while (value >= BIT(offset) && offset < 32) {
+		if (value & BIT(offset)) {
+			if (!first)
+				seq_puts(m, ",");
+			seq_printf(m, callback(offset));
+			first = false;
+		}
+		offset += 1;
+	}
+}
+
 static int vkms_config_show(struct seq_file *m, void *data)
 {
 	struct drm_debugfs_entry *entry = m->private;
@@ -359,6 +410,14 @@ static int vkms_config_show(struct seq_file *m, void *data)
 		seq_printf(m, "\tname=%s\n",
 			   vkms_config_plane_get_name(plane_cfg) ?
 			   vkms_config_plane_get_name(plane_cfg) : "(null)");
+		seq_puts(m, "\tsupported rotations=");
+		show_bitfield(m, vkms_config_plane_get_supported_rotations(plane_cfg),
+			      drm_get_rotation_name);
+		seq_puts(m, "\n");
+		seq_puts(m, "\tdefault rotation=");
+		show_bitfield(m, vkms_config_plane_get_default_rotation(plane_cfg),
+			      drm_get_rotation_name);
+		seq_puts(m, "\n");
 	}
 
 	vkms_config_for_each_crtc(vkmsdev->config, crtc_cfg) {
@@ -401,6 +460,10 @@ struct vkms_config_plane *vkms_config_create_plane(struct vkms_config *config)
 	plane_cfg->default_pipeline = false;
 	vkms_config_plane_set_type(plane_cfg, DRM_PLANE_TYPE_OVERLAY);
 	vkms_config_plane_set_name(plane_cfg, NULL);
+	vkms_config_plane_set_supported_rotations(plane_cfg,
+						  DRM_MODE_ROTATE_MASK | DRM_MODE_REFLECT_MASK);
+	vkms_config_plane_set_default_rotation(plane_cfg, DRM_MODE_ROTATE_0);
+
 	xa_init_flags(&plane_cfg->possible_crtcs, XA_FLAGS_ALLOC);
 
 	list_add_tail(&plane_cfg->link, &config->planes);
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index b9a41a22c011..cf29976ec1a9 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -39,6 +39,8 @@ struct vkms_config {
  * @type: Type of the plane. The creator of configuration needs to ensures that
  *        at least one primary plane is present.
  * @possible_crtcs: Array of CRTCs that can be used with this plane
+ * @default_rotation: Default rotation that should be used by this plane
+ * @supported_rotation: Rotation that this plane will support
  * @plane: Internal usage. This pointer should never be considered as valid.
  *         It can be used to store a temporary reference to a VKMS plane during
  *         device creation. This pointer is not managed by the configuration and
@@ -50,6 +52,8 @@ struct vkms_config_plane {
 
 	const char *name;
 	enum drm_plane_type type;
+	unsigned int default_rotation;
+	unsigned int supported_rotations;
 	struct xarray possible_crtcs;
 	bool default_pipeline;
 
@@ -316,6 +320,61 @@ vkms_config_plane_set_default_pipeline(struct vkms_config_plane *plane_cfg,
 	plane_cfg->default_pipeline = default_pipeline;
 }
 
+/**
+ * vkms_config_plane_get_default_rotation() - Get the default rotation for a plane
+ * @plane_cfg: Plane to get the default rotation from
+ *
+ * Returns:
+ * The default rotation for the plane.
+ */
+static inline unsigned int
+vkms_config_plane_get_default_rotation(const struct vkms_config_plane *plane_cfg)
+{
+	return plane_cfg->default_rotation;
+}
+
+/**
+ * vkms_config_plane_set_default_rotation() - Set the default rotation for a plane
+ * @plane_cfg: Plane to set the default rotation to
+ * @default_rotation: New default rotation for the plane
+ */
+static inline void
+vkms_config_plane_set_default_rotation(struct vkms_config_plane *plane_cfg,
+				       unsigned int default_rotation)
+{
+	plane_cfg->default_rotation = default_rotation;
+}
+
+/**
+ * vkms_config_plane_get_supported_rotations() - Get the supported rotations for a plane
+ * @plane_cfg: Plane to get the supported rotations from
+ *
+ * Returns:
+ * The supported rotations for the plane.
+ */
+static inline unsigned int
+vkms_config_plane_get_supported_rotations(const struct vkms_config_plane *plane_cfg)
+{
+	return plane_cfg->supported_rotations;
+}
+
+/**
+ * vkms_config_plane_set_supported_rotations() - Set the supported rotations for a plane
+ * @plane_cfg: Plane to set the supported rotations to
+ * @supported_rotations: New supported rotations for the plane
+ */
+static inline void
+vkms_config_plane_set_supported_rotations(struct vkms_config_plane *plane_cfg,
+					  unsigned int supported_rotations)
+{
+	plane_cfg->supported_rotations = supported_rotations;
+}
+
+#if IS_ENABLED(CONFIG_KUNIT)
+bool vkms_config_valid_plane_rotation(const struct vkms_config *config,
+				      const struct vkms_config_plane *plane_cfg);
+#endif
+
 /**
  * vkms_config_plane_set_name() - Set the plane name
  * @plane_cfg: Plane to set the name to
diff --git a/drivers/gpu/drm/vkms/vkms_plane.c b/drivers/gpu/drm/vkms/vkms_plane.c
index d8612e28ac3f..7c604cfd6a09 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -235,8 +235,9 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
 
 	drm_plane_helper_add(&plane->base, &vkms_plane_helper_funcs);
 
-	drm_plane_create_rotation_property(&plane->base, DRM_MODE_ROTATE_0,
-					   DRM_MODE_ROTATE_MASK | DRM_MODE_REFLECT_MASK);
+	drm_plane_create_rotation_property(&plane->base,
+					   vkms_config_plane_get_default_rotation(plane_cfg),
+					   vkms_config_plane_get_supported_rotations(plane_cfg));
 
 	drm_plane_create_color_properties(&plane->base,
 					  BIT(DRM_COLOR_YCBCR_BT601) |

-- 
2.51.2

