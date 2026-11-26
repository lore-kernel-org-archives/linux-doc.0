Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.85.4
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795692677;
	b=FmJNL5wkDPL038WZxklhJxHdMcjHdZII9MY0MMTPqQmuYtvIA5QrJYlShdQVUHWhcBEq
	 0ssARnT2SZR0OQQkrVreYOvDoUK3XJEAvDILZ2oQUB10deikAM/Z5cZFrTHnjxeBJxC+n
	 wE2d08odijKacBZzGMRq0U4pp+Fc6bk+d5OAnjUP7fa5oJSHSDekGZtNEbGdwspVfqoMe
	 h27nqHX0gOUp3GJME/jVwQJRqS+jndLNUNUwQ4R84heuthi5bCEfWYTvb55LK611cHxBl
	 FqcHCyAbJj8NbiuJdv0j3q0Z9XaDsp8BBqUR6Qdlwaloo7MscI562jHsM+Xq71NSVHg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692677;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=bYyZxQCX7pHtBtXlj5XAiIAnjZLIwtVvJOz7rWy/Nbs=;
	b=DKP3pf5X6w+GGAMxzn2feGzAUYJ7PgkxT2z7e+5zUQekznoXoFr9Xtso7YxIy+zxzAS+
	 QZUb5nlqKTPnGuuzjVxzF0AyJ7NI+iQ74V3ZeK2a3tR380cIP4VMBBLPf5vLLiP4QeEsO
	 vL2OlmajIS9TO7Wdow38Z4px0YYsVIWBQ+v+DVgwaEbUEBIwUDZVsBdHjWu73x3bFTHRj
	 Dn3rZhAF5jfgz2ymAry4tMiC/yM+TYMAioOROr/qp6hAYWJt1RPjnUmHqG1Pu8XH3tq1u
	 1OoVRuUYRhVLqlR6NSZ638tR9CNgILDlmyS+z+y1Q7VMr/a2MONDrg/g6qDPtLvhkwA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=pat6uZOs;
	arc=none smtp.remote-ip=185.246.85.4
Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ED2F0606A321
	for <linux-doc@vger.kernel.org>; Thu, 26 Nov 2026 11:31:15 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org ED2F0606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=pat6uZOs
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id A56D74E41798;
	Thu, 26 Nov 2026 11:31:14 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 6FCDA60237;
	Thu, 26 Nov 2026 11:31:14 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 12BEB11E6B306;
	Thu, 26 Nov 2026 12:31:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795692671; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=bYyZxQCX7pHtBtXlj5XAiIAnjZLIwtVvJOz7rWy/Nbs=;
	b=pat6uZOs1y5OCAA1mgFale5U0gTuNLxnz0XMvpVyH8s10n9lPNGjOEM2PLHHwAwOxEWliy
	hMNOrTUYDlVv5kPV0TMSGjnrf4Y12blpx9u2CW2cRLNIm0JkUcInKhw56XmEmxD32h6nV+
	ZBauFnIKlnDVSz9THSvHcxrRnBFnutzyQF9rAdYU9TVtAEquVOdBblDpO6VC0eCiG3XD1P
	CVhIFVJU4vqIHf/L/kzDO5biU5H0x0MWHVF2TTT4BsoQ52Wg8QYSuPwvdCSh9+YI8eHUiv
	FHk2bemt0ffKpE9omZmH7Rr9FtCeckYrz9wlp9pB509QUg7KMWGIwg9PXUzlSA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 26 Nov 2026 12:29:02 +0100
Subject: [PATCH v7 19/43] drm/vkms: Introduce config for plane rotation
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-vkms-all-config-v7-19-21194cda2468@bootlin.com>
References: <20261126-vkms-all-config-v7-0-21194cda2468@bootlin.com>
In-Reply-To: <20261126-vkms-all-config-v7-0-21194cda2468@bootlin.com>
To: Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, jose.exposito89@gmail.com, 
 Jonathan Corbet <corbet@lwn.net>, Oarora Etimis <oaroraetimis@gmail.com>, 
 Harry Wentland <harry.wentland@amd.com>, 
 Lucas De Marchi <demarchi@kernel.org>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Shuah Khan <skhan@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Kory Maincent <kory.maincent@bootlin.com>, sebastian.wick@redhat.com, 
 victoria@system76.com, thomas.petazzoni@bootlin.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, llvm@lists.linux.dev
X-Mailer: b4 0.17-dev
X-Last-TLS-Session-Version: TLSv1.3

VKMS driver supports all the rotation on planes, but for testing it can be
useful to only advertise few of them. This new configuration interface
will allow configuring the rotation per planes.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/tests/vkms_config_test.c | 53 ++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_config.c            | 46 +++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_config.h            | 59 +++++++++++++++++++++++++++
 drivers/gpu/drm/vkms/vkms_plane.c             |  5 ++-
 4 files changed, 161 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vkms/tests/vkms_config_test.c b/drivers/gpu/drm/vkms/tests/vkms_config_test.c
index 1e4ea1863420..dcb29ed8ac4a 100644
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
@@ -481,6 +488,51 @@ static void vkms_config_test_valid_plane_type(struct kunit *test)
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
+	/* Invalid, supported rotations must contain at least one base rotation angle */
+	vkms_config_plane_set_supported_rotations(plane_cfg, DRM_MODE_REFLECT_MASK);
+	vkms_config_plane_set_default_rotation(plane_cfg, DRM_MODE_REFLECT_X | DRM_MODE_ROTATE_0);
+	KUNIT_EXPECT_FALSE(test, vkms_config_valid_plane_rotation(config, plane_cfg));
+	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
+
+	/* Invalid, default rotation must contain exactly one base rotation angle */
+	vkms_config_plane_set_supported_rotations(plane_cfg,
+						  DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_0);
+	vkms_config_plane_set_default_rotation(plane_cfg, DRM_MODE_REFLECT_X);
+	KUNIT_EXPECT_FALSE(test, vkms_config_valid_plane_rotation(config, plane_cfg));
+	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
+
+	/* Invalid, multiple rotation bits in default_rotation */
+	vkms_config_plane_set_supported_rotations(plane_cfg,
+						  DRM_MODE_REFLECT_MASK | DRM_MODE_ROTATE_MASK);
+	vkms_config_plane_set_default_rotation(plane_cfg, DRM_MODE_ROTATE_0 | DRM_MODE_ROTATE_90);
+	KUNIT_EXPECT_FALSE(test, vkms_config_valid_plane_rotation(config, plane_cfg));
+	KUNIT_EXPECT_FALSE(test, vkms_config_is_valid(config));
+
+	vkms_config_destroy(config);
+}
+
 static void vkms_config_test_valid_plane_possible_crtcs(struct kunit *test)
 {
 	struct vkms_config *config;
@@ -1003,6 +1055,7 @@ static struct kunit_case vkms_config_test_cases[] = {
 	KUNIT_CASE(vkms_config_test_get_connectors),
 	KUNIT_CASE(vkms_config_test_invalid_plane_number),
 	KUNIT_CASE(vkms_config_test_valid_plane_type),
+	KUNIT_CASE(vkms_config_test_valid_plane_rotations),
 	KUNIT_CASE(vkms_config_test_valid_plane_possible_crtcs),
 	KUNIT_CASE(vkms_config_test_invalid_crtc_number),
 	KUNIT_CASE(vkms_config_test_invalid_encoder_number),
diff --git a/drivers/gpu/drm/vkms/vkms_config.c b/drivers/gpu/drm/vkms/vkms_config.c
index 56ab9ea6e141..d4f15f1c53b0 100644
--- a/drivers/gpu/drm/vkms/vkms_config.c
+++ b/drivers/gpu/drm/vkms/vkms_config.c
@@ -2,8 +2,11 @@
 
 #include <linux/slab.h>
 #include <linux/string_choices.h>
+#include <linux/log2.h>
 
+#include <drm/drm_blend.h>
 #include <drm/drm_connector.h>
+#include <drm/drm_mode.h>
 #include <drm/drm_print.h>
 #include <drm/drm_debugfs.h>
 #include <kunit/visibility.h>
@@ -176,6 +179,35 @@ static bool valid_plane_number(const struct vkms_config *config)
 	return true;
 }
 
+VISIBLE_IF_KUNIT
+bool vkms_config_valid_plane_rotation(const struct vkms_config *config,
+				      const struct vkms_config_plane *plane_cfg)
+{
+	struct drm_device *dev = config->dev ? &config->dev->drm : NULL;
+
+	if ((vkms_config_plane_get_supported_rotations(plane_cfg) &
+	     DRM_MODE_ROTATE_MASK) == 0) {
+		drm_info(dev, "Configured supported rotations must contain at least one base rotation angle\n");
+		return false;
+	}
+
+	if (!is_power_of_2(vkms_config_plane_get_default_rotation(plane_cfg) &
+			   DRM_MODE_ROTATE_MASK)) {
+		drm_info(dev, "Configured default rotation must contain exactly one base rotation angle\n");
+		return false;
+	}
+
+	if ((vkms_config_plane_get_default_rotation(plane_cfg) &
+	     vkms_config_plane_get_supported_rotations(plane_cfg)) !=
+	    vkms_config_plane_get_default_rotation(plane_cfg)) {
+		drm_info(dev, "Configured default rotation is not supported by the plane\n");
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
@@ -333,6 +365,12 @@ static bool valid_connector_possible_encoders(const struct vkms_config *config)
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
@@ -394,6 +432,10 @@ static int vkms_config_show(struct seq_file *m, void *data)
 			seq_printf(m, "\tname=%s\n",
 				   vkms_config_plane_get_name(plane_cfg) ?
 				   vkms_config_plane_get_name(plane_cfg) : "(null)");
+			seq_printf(m, "\tsupported rotations=" DRM_ROTATION_FMT "\n",
+				   DRM_ROTATION_FMT_ARGS(vkms_config_plane_get_supported_rotations(plane_cfg)));
+			seq_printf(m, "\tdefault rotation=" DRM_ROTATION_FMT "\n",
+				   DRM_ROTATION_FMT_ARGS(vkms_config_plane_get_default_rotation(plane_cfg)));
 		}
 
 		vkms_config_for_each_crtc(vkmsdev->config, crtc_cfg) {
@@ -444,6 +486,10 @@ struct vkms_config_plane __must_check *vkms_config_create_plane(struct vkms_conf
 	if (ret)
 		goto cleanup_plane_cfg;
 
+	vkms_config_plane_set_supported_rotations(plane_cfg,
+						  DRM_MODE_ROTATE_MASK | DRM_MODE_REFLECT_MASK);
+	vkms_config_plane_set_default_rotation(plane_cfg, DRM_MODE_ROTATE_0);
+
 	xa_init_flags(&plane_cfg->possible_crtcs, XA_FLAGS_ALLOC);
 
 	list_add_tail_rcu(&plane_cfg->link, &config->planes);
diff --git a/drivers/gpu/drm/vkms/vkms_config.h b/drivers/gpu/drm/vkms/vkms_config.h
index e428946cb70e..8587a4a28b19 100644
--- a/drivers/gpu/drm/vkms/vkms_config.h
+++ b/drivers/gpu/drm/vkms/vkms_config.h
@@ -54,6 +54,8 @@ struct vkms_config {
  * @type: Type of the plane. The creator of configuration needs to ensures that
  *        at least one primary plane is present.
  * @possible_crtcs: Array of CRTCs that can be used with this plane
+ * @default_rotation: Default rotation that should be used by this plane
+ * @supported_rotation: Rotation that this plane will support
  * @plane: Internal usage. This pointer should never be considered as valid.
  *         It can be used to store a temporary reference to a VKMS plane during
  *         device creation. This pointer is not managed by the configuration and
@@ -66,6 +68,8 @@ struct vkms_config_plane {
 
 	const char *name;
 	enum drm_plane_type type;
+	unsigned int default_rotation;
+	unsigned int supported_rotations;
 	struct xarray possible_crtcs;
 	bool default_pipeline;
 
@@ -370,6 +374,61 @@ vkms_config_plane_set_default_pipeline(struct vkms_config_plane *plane_cfg,
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
index 35aabec85b33..9545bbd1744f 100644
--- a/drivers/gpu/drm/vkms/vkms_plane.c
+++ b/drivers/gpu/drm/vkms/vkms_plane.c
@@ -277,8 +277,9 @@ struct vkms_plane *vkms_plane_init(struct vkms_device *vkmsdev,
 
 	drm_plane_helper_add(&plane->base, &vkms_plane_helper_funcs);
 
-	drm_plane_create_rotation_property(&plane->base, DRM_MODE_ROTATE_0,
-					   DRM_MODE_ROTATE_MASK | DRM_MODE_REFLECT_MASK);
+	drm_plane_create_rotation_property(&plane->base,
+					   vkms_config_plane_get_default_rotation(plane_cfg),
+					   vkms_config_plane_get_supported_rotations(plane_cfg));
 
 	drm_plane_create_color_properties(&plane->base,
 					  BIT(DRM_COLOR_YCBCR_BT601) |

-- 
2.56.0

