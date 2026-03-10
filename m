Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE9143BFE34;
	Tue, 10 Mar 2026 16:07:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773158852; cv=none; b=KenUHBaGVAc3vmCuPBQKNYsW4yNfRKQ+X6QuG2riAU+FyGYeqQ4TeArb5medxmnLmecwkE6W28TCXhWeyo1bmJUGHm/mO5lZ7kblT6RSBQnyNA672cD7nZhiDH9Ruw/PAfk0Adcj3Tk5OAsiXWKLT7bT2uaWNdBRE7dwLDtqkqA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773158852; c=relaxed/simple;
	bh=CsVIwHX+p0j2dU0X8ERUlyY3x8L8Ul+2z/qAN1xRluo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QSgkq6oSPACfPsZ/FrlXEsYuZ0Zxdr2zqVOfysg6fLx4mYx+VOUfYf8vQcJ1LEvo9WRUXkbYqUgwFZt2uGu1oGhq8A3asvOZotz8zsbLTtxi/xMTCbbOtVuxHFPIx+DUInclk1IZljBBQ5RJYXi+QsB3P6WDH9AAC2SzIXa3MZI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=skU8WFdu; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="skU8WFdu"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B150C19425;
	Tue, 10 Mar 2026 16:07:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773158852;
	bh=CsVIwHX+p0j2dU0X8ERUlyY3x8L8Ul+2z/qAN1xRluo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=skU8WFduYo/6yp0LBTgpx8wNU1y1Ck2VasfE6wz0shvwAGT3jxNGq1s2H4zI1k8PY
	 YHNn5MV9k1fd/Z73kiWuKyYK+5fhN3C9AeCVY9QaAXOjRRZ0PflPjFhAfheP0xYIw7
	 yxwzjURt3C0MxFOvYYevWByGpNYw07Y1UdAIKyMRxI+koKbiuvz+TCvdvLVM/LB+GO
	 DXQwTe7A3XNpHfhK4Z9xCW3QLB2Q6ngdIy+4aIkaZXKy9gGU6ztYTwNH69sAaL3Zit
	 kvS1c0wSVjwwvNNfEmyD0gzLUSH1CrHTIb6BwoCggO3DjUg6ETz424mVaPyz7ZuitZ
	 YKT74ih5F8aow==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 10 Mar 2026 17:07:00 +0100
Subject: [PATCH 08/14] drm/mode-config: Create
 drm_mode_config_create_state()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-drm-mode-config-init-v1-8-de7397c8e1cf@kernel.org>
References: <20260310-drm-mode-config-init-v1-0-de7397c8e1cf@kernel.org>
In-Reply-To: <20260310-drm-mode-config-init-v1-0-de7397c8e1cf@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6059; i=mripard@kernel.org;
 h=from:subject:message-id; bh=CsVIwHX+p0j2dU0X8ERUlyY3x8L8Ul+2z/qAN1xRluo=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJkbHJe/3qXRarXwUuIly8PH8pd633FTeJWX0vwlYY+2+
 OqX8y4t6ZjKwiDMySArpsjyRCbs9PL2xVUO9it/wMxhZQIZwsDFKQATeWzC2LBO1rjLZUIgU/+N
 bfrbs56tnfhm8uSvXz6s9q9tK+JqUNpvc3dDWszLpFfbdNWvPgx6NJ2x3tdKecOPsNqHbOIWr3R
 nJ0ues/g/75iXa06+bmmuomiKd+mJ7AuzrN47HHk0R+LhXP1jAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

drm_mode_config_reset() can be used to create the initial state, but
also to return to the initial state, when doing a suspend/resume cycle
for example.

It also affects both the software and the hardware, and drivers can
either choose to reset the hardware as well. Most will just create an
empty state and the synchronisation between hardware and software states
will effectively be done when the first commit is done.

That dual role can be harmful, since some objects do need to be
initialized but also need to be preserved across a suspend/resume cycle.
drm_private_obj are such objects for example.

Thus, let's create another helper for drivers to call to initialize
their state when the driver is loaded, so we can make
drm_mode_config_reset() only about handling suspend/resume and similar.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic.c      | 12 +++++-
 drivers/gpu/drm/drm_mode_config.c | 83 +++++++++++++++++++++++++++++++++++++++
 include/drm/drm_mode_config.h     |  1 +
 3 files changed, 94 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 92c6afc8f22c8307a59dc266aacdb8e03351409d..d1885f895cce78725419b6291f4dbe5563e3b240 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -58,12 +58,20 @@
  * checking or doing the update, while object states are allocated while
  * the state will be, or is active in the hardware.
  *
  * Their respective lifetimes are:
  *
- * - at reset time, the object reset implementation will allocate a new,
- *   default, state and will store it in the object state pointer.
+ * - at driver initialization time, the driver will allocate an initial,
+ *   pristine, state and will store it using
+ *   drm_mode_config_create_state(). Historically, this was one of
+ *   drm_mode_config_reset() job, so one might still encounter it in a
+ *   driver.
+ *
+ * - at reset time, for example during suspend/resume,
+ *   drm_mode_config_reset() will reset the software and hardware state
+ *   to a known default and will store it in the object state pointer.
+ *   Not all objects are affected by drm_mode_config_reset() though.
  *
  * - whenever a new update is needed:
  *
  *   + we allocate a new &struct drm_atomic_state using drm_atomic_state_alloc().
  *
diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
index 95759a4b5176ff17032a9a267ec9de6980be0abc..1a84ac063d381014eb8afd7116e1e8b7a8fc92ca 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -21,10 +21,11 @@
  */
 
 #include <linux/export.h>
 #include <linux/uaccess.h>
 
+#include <drm/drm_atomic.h>
 #include <drm/drm_drv.h>
 #include <drm/drm_encoder.h>
 #include <drm/drm_file.h>
 #include <drm/drm_framebuffer.h>
 #include <drm/drm_managed.h>
@@ -278,10 +279,92 @@ void drm_mode_config_reset(struct drm_device *dev)
 			drm_mode_config_connector_create_state(connector);
 	drm_connector_list_iter_end(&conn_iter);
 }
 EXPORT_SYMBOL(drm_mode_config_reset);
 
+/**
+ * drm_mode_config_create_state - Allocates the initial state
+ * @dev: drm device
+ *
+ * This functions creates the initial state for all the objects. Drivers
+ * can use this in e.g. their driver load to initialize its software
+ * state.
+ *
+ * It has two main differences with drm_mode_config_reset(): the reset()
+ * hooks aren't called and thus the hardware will be left untouched, but
+ * also the @drm_private_obj structures will be initialized as opposed
+ * to drm_mode_config_reset() that skips them.
+ *
+ * Returns: 0 on success, negative error value on failure.
+ */
+int drm_mode_config_create_state(struct drm_device *dev)
+{
+	struct drm_crtc *crtc;
+	struct drm_colorop *colorop;
+	struct drm_plane *plane;
+	struct drm_connector *connector;
+	struct drm_connector_list_iter conn_iter;
+	struct drm_private_obj *privobj;
+	int ret;
+
+	drm_for_each_privobj(privobj, dev) {
+		struct drm_private_state *privobj_state;
+
+		if (privobj->state)
+			continue;
+
+		if (!privobj->funcs->atomic_create_state)
+			continue;
+
+		privobj_state = privobj->funcs->atomic_create_state(privobj);
+		if (IS_ERR(privobj_state))
+			return PTR_ERR(privobj_state);
+
+		privobj->state = privobj_state;
+	}
+
+	drm_for_each_colorop(colorop, dev) {
+		if (colorop->state)
+			continue;
+
+		// TODO: Implement atomic_create_state for colorop.
+		drm_colorop_reset(colorop);
+	}
+
+	drm_for_each_plane(plane, dev) {
+		if (plane->state)
+			continue;
+
+		ret = drm_mode_config_plane_create_state(plane);
+		if (ret)
+			return ret;
+	}
+
+	drm_for_each_crtc(crtc, dev) {
+		if (crtc->state)
+			continue;
+
+		ret = drm_mode_config_crtc_create_state(crtc);
+		if (ret)
+			return ret;
+	}
+
+	drm_connector_list_iter_begin(dev, &conn_iter);
+	drm_for_each_connector_iter(connector, &conn_iter) {
+		if (connector->state)
+			continue;
+
+		ret = drm_mode_config_connector_create_state(connector);
+		if (ret)
+			return ret;
+	}
+	drm_connector_list_iter_end(&conn_iter);
+
+	return 0;
+}
+EXPORT_SYMBOL(drm_mode_config_create_state);
+
 /*
  * Global properties
  */
 static const struct drm_prop_enum_list drm_plane_type_enum_list[] = {
 	{ DRM_PLANE_TYPE_OVERLAY, "Overlay" },
diff --git a/include/drm/drm_mode_config.h b/include/drm/drm_mode_config.h
index 5e1dd0cfccde2d2bc00a09e98e4adc65833dad08..428ae75b7c4f193dfbd49c15a2f2ef32209a6cef 100644
--- a/include/drm/drm_mode_config.h
+++ b/include/drm/drm_mode_config.h
@@ -1000,9 +1000,10 @@ int __must_check drmm_mode_config_init(struct drm_device *dev);
 static inline int drm_mode_config_init(struct drm_device *dev)
 {
 	return drmm_mode_config_init(dev);
 }
 
+int drm_mode_config_create_state(struct drm_device *dev);
 void drm_mode_config_reset(struct drm_device *dev);
 void drm_mode_config_cleanup(struct drm_device *dev);
 
 #endif

-- 
2.53.0

