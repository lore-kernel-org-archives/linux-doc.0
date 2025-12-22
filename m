Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 59B213128D9;
	Mon, 22 Dec 2025 10:11:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766398280; cv=none; b=DK+pcbjj01isej23pFGxHWtQxi7/qoH0MfM89F1Slhp9DozQlzR8rl3RlIJXixikA1Y6fNslXfpXgRuJ2ayjK0O45ODoEjYaQqFMeq1WVpeXni1gURq+ZK/yuznBiY5Zg483rnPiku2t+yncoGHsix7XgNxR5jrgCO++PyrNysQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766398280; c=relaxed/simple;
	bh=67GX81QjAKaNiRN7eRAMsUYloq514Vv/5gM6Eubw9LY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=tZtjh12X7VWAYp2l6sApm3M6qXNnq87SFzTdG8WisVKN3zgbE/5jOC0VGt7qdotNxzRFTGwMQCXPnC2uLc2kwCmfLozfXEgXuU8RifHoO2Qz3ZoDQG0hQ+SPLH8w7QAFeGLX2Y3kjBgB4o4qq0nMMDj/Exy5xPB0txO+qzzB6D0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=yrQ13n9f; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="yrQ13n9f"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id D245FC1AE06;
	Mon, 22 Dec 2025 10:10:51 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CE325606C1;
	Mon, 22 Dec 2025 10:11:16 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DB34910AB019F;
	Mon, 22 Dec 2025 11:11:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766398275; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gJ1Zow46kC2t8niE60P0MnSu70oxI/H0jOwJmcAOuLU=;
	b=yrQ13n9fGAL0bsXnhjsJr113U3eeQOg7JmH3uaT6mCfBDk/A1UkY6O1GyQ7ys1IgWpIo5e
	TTPf0NiSn0njeiYEby6ZqpppVsMEtCtbVKcW2QnsXfD4/s/uImGVPeXNj6aAwWKls8xkmP
	EL8EnWM8LMJm+7weWBhNJl/8MxsSDV+qGLfrGDxJ4Jk412KloCJ+gBLDxg3pm6FOXzKOtx
	RqMrNfa+1Zum9Qip8D1BJ+CnQdjY5UBJKwMWVH+4ocUwhx7S+WzAhmEgfxuNicE6Nz7h7D
	vocgBeJMgk6Dsff82hCs8qLK0M1IzGxB7LW6Ek5xtZzoTwlpZD/6jbHKe0UAyA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 22 Dec 2025 11:11:04 +0100
Subject: [PATCH v3 02/33] drm/drm_mode_config: Add helper to get plane type
 name
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20251222-vkms-all-config-v3-2-ba42dc3fb9ff@bootlin.com>
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
 =?utf-8?q?Jos=C3=A9_Exp=C3=B3sito?= <jose.exposito@redhat.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1969;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=67GX81QjAKaNiRN7eRAMsUYloq514Vv/5gM6Eubw9LY=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpSRk/lkUL9Esjf7fYdWIIYfgsyKwbbiEcPzHQV
 emrMFA9AZWJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaUkZPxsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOK+eQ//V4FWeLzgRsoB4/0mhVGkZMMs8Ox2kDm
 OL/W/1jDKntANvDaHcD4TKu395pAA8RZomn2CugiEXX4FtrLF2LE6dyk7e1AK4+I6oeUU8C3E2T
 g29ML1D2PjObucd3XoZQvxPyo1RRXpc1nK6fPTgBYg0yfdYaTsKlXAEjatM7vUjF5HkMHk5Urk9
 pME34tvApNhr4YVrrPEDgvtsQsaSz9pNMHC+DJTP1SuGuPUY6hNfFYofBlVOvfB1G4wb6J/Ij5Y
 NVXMhR6nq7N6HzySUCCZpY14aqGDOAALDZVovn1boEysn6uA8KMpBqzBVf06RHacJ1mvwVsDtzS
 ixBTVMvK0HUWpxSfAPWKM8LIgBSrGdeVcSQKXLIBozx3aluCj/iItW6SVdeKQgUhDHGoa/VtpCx
 AJEOF0U6mrhfsLHG4xI1qKS4AE5KOLB0KDnaRU6HU8eMu9K7XH7fEWF5Kx2DGRVuknSBT+C16uK
 yAybnMsUDh2BHcJToC+2t4gN/XbCqbBOTU8C+rBraxn5SyFszDxFho5ylkfbBrAAqWbFX1riow7
 QTl+snbIoYwCNfvFhfnhuwI4R+yRUphVhDyxuVntae4+UM13KFlcYxN7apRXKG5fIPDcgKx+oOQ
 5e946kLrLcvp8HKFep7gTvMrdOLZx/LYspLdpRzyT8O8z9xyzLcY=
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-Last-TLS-Session-Version: TLSv1.3

Create and export an helper to display plane type using the
property string. This could be used to display debug
information in VKMS.

Reviewed-by: José Expósito <jose.exposito@redhat.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/drm_mode_config.c | 16 ++++++++++++++++
 include/drm/drm_mode_config.h     |  3 +++
 2 files changed, 19 insertions(+)

diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
index d12db9b0bab8..c940a67e255b 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -231,6 +231,22 @@ static const struct drm_prop_enum_list drm_plane_type_enum_list[] = {
 	{ DRM_PLANE_TYPE_CURSOR, "Cursor" },
 };
 
+/**
+ * drm_get_plane_type_name - return a string for plane name
+ * @type: plane type to compute name of
+ *
+ * Returns: The name of the plane type. "(unknown)" if type is not a known
+ * plane type.
+ */
+const char *drm_get_plane_type_name(enum drm_plane_type type)
+{
+	if (type > 0 && type < ARRAY_SIZE(drm_plane_type_enum_list))
+		return drm_plane_type_enum_list[type].name;
+	else
+		return "(unknown)";
+}
+EXPORT_SYMBOL(drm_get_plane_type_name);
+
 static int drm_mode_create_standard_properties(struct drm_device *dev)
 {
 	struct drm_property *prop;
diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index 895fb820dba0..f4c580fa2a52 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -30,6 +30,7 @@
 #include <linux/llist.h>
 
 #include <drm/drm_modeset_lock.h>
+#include <drm/drm_plane.h>
 
 struct drm_file;
 struct drm_device;
@@ -1001,4 +1002,6 @@ static inline int drm_mode_config_init(struct drm_device *dev)
 void drm_mode_config_reset(struct drm_device *dev);
 void drm_mode_config_cleanup(struct drm_device *dev);
 
+const char *drm_get_plane_type_name(enum drm_plane_type type);
+
 #endif

-- 
2.51.2

