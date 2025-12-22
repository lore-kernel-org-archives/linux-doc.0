Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81548313E25
	for <linux-doc@vger.kernel.org>; Mon, 22 Dec 2025 10:11:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766398295; cv=none; b=ZxQXTL7usUNtt2tJut7Ef+BhBId9j/zvwo54zT0FyNX2S8JpzsVOw+IZx3gfrNbnZmuTUzaGFNvMdRdmt4oliwqC2ZMT+MB1+5CFiY9UM/iYAb4ljHovMzAsysl6VlTalNuJ6fyc2MdHLJpVXuNOab4tHEin10D7U3ymljqFuz0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766398295; c=relaxed/simple;
	bh=b/WSaiyC5M1nv2FVQTXQnRbE5ZUHonT0PNSVbPOuKYw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rpeX2eHg+jy5tZXB350nvOdxbQRATsp88ycOsxEt2tzRFydqCJqET2kcf874dC7fzHQ9yP77Ev2hoW9Pv279enEGiqRIxt/yZCcSMaisOZHuDUP4hU72ZC/NMX7tfut4Xqz2tdPjJuMmFhNW4r4p46Zqz+zkYw6AlY/uib6hVVQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Qpmh/jZj; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Qpmh/jZj"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 2DC914E41D35;
	Mon, 22 Dec 2025 10:11:31 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0121B606C1;
	Mon, 22 Dec 2025 10:11:31 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id E48C010AB01A5;
	Mon, 22 Dec 2025 11:11:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766398288; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=tmD2ZK3TTOzrJAbHs3rVTloVkAyIeJqATZIFpjpNGC0=;
	b=Qpmh/jZjt9PRaaKuRXj7A+puvmhQe/2+bMubsUsbwoiW6A5XkB3lgk4AAqn5hbfgLweutb
	ljGGziC1JMpVjJcA2OEnvMOy7ZJkoJROv3owV/JzBCM6MRJt6zRc3lkMKMIX31tVu0FJ9U
	oeb5n6ZZOW5RZhKI3mXfrla62ILw4NNW0WV+XlrOqsgHuTTPbWffu12gBAKCObFwp+mhYv
	7LfXBmj7MYFofw6J3jnslyU2SzrugmnnFvTruCm1yEq+RBUY9OqHbI1CaadYMQY937mINh
	8nSlmuUXZzI2GHKCrjtoIZ3M6DP/OF7wUYbgo3ixRfJEJmSWTVyJUUq9D75KXQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 22 Dec 2025 11:11:10 +0100
Subject: [PATCH v3 08/33] drm/blend: Get a rotation name from it's bitfield
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251222-vkms-all-config-v3-8-ba42dc3fb9ff@bootlin.com>
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
 =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito@redhat.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3434;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=b/WSaiyC5M1nv2FVQTXQnRbE5ZUHonT0PNSVbPOuKYw=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpSRlACkUbpgJoinxdbKIY99jeiumPBLXh+4paK
 cCl2RFD4qqJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaUkZQBsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOIhPw//VytUCsaFC2Myty+Cospz2XZse7NOtM9
 qxWS3W/IKnjm+y6neqUuVBoZtbsnPjCCE0tUHlH3275WfXXr+cphY+LSdc/0RiMBueXSayS3Hbf
 ySAe2P+4KgJkTfjZCdCpIc8V4Dg8wNPQiM69Oi7Ky3UmTulCINW32gnn7berRvvnZwmnKOsZLpK
 Bh6rySKAgOd+7qKOS+4bVI99+W/ySHkrUSVE1AtfQOnaxITTSVh7D8EfQBX5CwuFfDRADn9No5l
 hilvJASjXVlpx3Ux2vHyesSokoQIbqB2QP829wfcPoiQygxXbqyWrSpsOrvLaxD6+h5nrEwRrTp
 ewUOE538MtVPIehNmP7iVMaFR7E/kxdoXzPXerF5ImvGYQV786ViMxFQIxUMcSaGWrn1vluzSMy
 aGDkozvM2LG/hFXanPOX2i5Pey3EGp76bRBnzBgvlukUgHuSkWiMPGEdIEQzaiHWDZGWf+8kgNA
 4znlGrF26LuLEWQ7jEOFTZtZDCJAFyG5qQ5bEwkHNusPZqBqJEu7o7R+smH+FYFnd0AyqceXevA
 HOyxK3LAod56KzixFAyoA61+pIxUkd8oTpJh4ZKETKgjefeRxImcfHPXlrP8hEb2q5WFfUvnqMO
 4PLRzifpIankMyfHJNDFU0wswllqofQh/6lmd88UQxsObz2vZFvI=
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-Last-TLS-Session-Version: TLSv1.3

Having the rotation/reflection name from its value can be useful for
debugging purpose. Extract the rotation property table and implement
drm_get_rotation_name.

Reviewed-by: José Expósito <jose.exposito@redhat.com>
Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/drm_blend.c | 35 ++++++++++++++++++++++++++---------
 include/drm/drm_blend.h     |  2 ++
 2 files changed, 28 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/drm_blend.c b/drivers/gpu/drm/drm_blend.c
index 6852d73c931c..bc7c05e20242 100644
--- a/drivers/gpu/drm/drm_blend.c
+++ b/drivers/gpu/drm/drm_blend.c
@@ -241,6 +241,31 @@ int drm_plane_create_alpha_property(struct drm_plane *plane)
 }
 EXPORT_SYMBOL(drm_plane_create_alpha_property);
 
+static const struct drm_prop_enum_list rotation_props[] = {
+	{ __builtin_ffs(DRM_MODE_ROTATE_0) - 1,   "rotate-0" },
+	{ __builtin_ffs(DRM_MODE_ROTATE_90) - 1,  "rotate-90" },
+	{ __builtin_ffs(DRM_MODE_ROTATE_180) - 1, "rotate-180" },
+	{ __builtin_ffs(DRM_MODE_ROTATE_270) - 1, "rotate-270" },
+	{ __builtin_ffs(DRM_MODE_REFLECT_X) - 1,  "reflect-x" },
+	{ __builtin_ffs(DRM_MODE_REFLECT_Y) - 1,  "reflect-y" },
+};
+
+/**
+ * drm_get_rotation_name - Return the name of a rotation
+ * @rotation: The rotation mask (DRM_MODE_ROTATE_* | DRM_MODE_REFLECT_*)
+ *
+ * Returns: the name of the rotation type (unknown) if rotation is not
+ * a known rotation/reflection
+ */
+const char *drm_get_rotation_name(unsigned int rotation)
+{
+	if (rotation < ARRAY_SIZE(rotation_props))
+		return rotation_props[rotation].name;
+
+	return "(unknown)";
+}
+EXPORT_SYMBOL(drm_get_rotation_name);
+
 /**
  * drm_plane_create_rotation_property - create a new rotation property
  * @plane: drm plane
@@ -279,14 +304,6 @@ int drm_plane_create_rotation_property(struct drm_plane *plane,
 				       unsigned int rotation,
 				       unsigned int supported_rotations)
 {
-	static const struct drm_prop_enum_list props[] = {
-		{ __builtin_ffs(DRM_MODE_ROTATE_0) - 1,   "rotate-0" },
-		{ __builtin_ffs(DRM_MODE_ROTATE_90) - 1,  "rotate-90" },
-		{ __builtin_ffs(DRM_MODE_ROTATE_180) - 1, "rotate-180" },
-		{ __builtin_ffs(DRM_MODE_ROTATE_270) - 1, "rotate-270" },
-		{ __builtin_ffs(DRM_MODE_REFLECT_X) - 1,  "reflect-x" },
-		{ __builtin_ffs(DRM_MODE_REFLECT_Y) - 1,  "reflect-y" },
-	};
 	struct drm_property *prop;
 
 	WARN_ON((supported_rotations & DRM_MODE_ROTATE_MASK) == 0);
@@ -294,7 +311,7 @@ int drm_plane_create_rotation_property(struct drm_plane *plane,
 	WARN_ON(rotation & ~supported_rotations);
 
 	prop = drm_property_create_bitmask(plane->dev, 0, "rotation",
-					   props, ARRAY_SIZE(props),
+					   rotation_props, ARRAY_SIZE(rotation_props),
 					   supported_rotations);
 	if (!prop)
 		return -ENOMEM;
diff --git a/include/drm/drm_blend.h b/include/drm/drm_blend.h
index 88bdfec3bd88..381d1f8d815b 100644
--- a/include/drm/drm_blend.h
+++ b/include/drm/drm_blend.h
@@ -42,6 +42,8 @@ static inline bool drm_rotation_90_or_270(unsigned int rotation)
 
 #define DRM_BLEND_ALPHA_OPAQUE		0xffff
 
+const char *drm_get_rotation_name(unsigned int rotation);
+
 int drm_plane_create_alpha_property(struct drm_plane *plane);
 int drm_plane_create_rotation_property(struct drm_plane *plane,
 				       unsigned int rotation,

-- 
2.51.2

