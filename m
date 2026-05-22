Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C5FA409110;
	Fri, 22 May 2026 12:37:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779453434; cv=pass; b=t4WdPU8ZamAuL/oGUUtp77TuUoG/eNQzsuidoojxBOopCuFJNbO2wbMge88nqm2BUd03rqIr1m85S4zKcWZL6I560Djo1mJ4pA3pC6Ab3srTSF8xoL/7dhg/R+K+mAIgXf2rbjgcnjARBgho9ndOwV7/Ei/5GhRvW5J7fW/yh3Y=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779453434; c=relaxed/simple;
	bh=pgEmAZKoeAY0FQZ1cp8RBirencq2JPJdvIo9ghWwmoU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Fo9K15LKhpxpf+2iYqugtaY+qfci4Q4dFYpMZbv7kTgiKHpwn6O3HdHZOoLQCa3dEaaQ/cKf+V0B5Sfje7zR8H1nuLtWTE69CLwLrhKd4OIbVACCkqrHHno+KmzbNWOBGoc2LTZWdvBDROzfar/q1Augllt0GRyJVmSfqClL8Fs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=e8n7WKa3; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="e8n7WKa3"
ARC-Seal: i=1; a=rsa-sha256; t=1779453393; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YHaSyYV1LGIYZkvNbo+Od6v1yBmqxlHFN42VzxK3fQC1oaUJHUnOPWFXoN/HDEtpXH3Z4ohxzRtMqOgTURb/KZMPf6LC+UYbkpkmKbEYrNp+ixhVQ6F6ery11090s090DUCkwzOYrE0LhA4flt5dUD8mm1jIl7/sO7a35mzQ7v0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779453393; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=t/W67fG4fYzN90BLM7vyOYKhLTKJIXI3lpgrib8Uv48=; 
	b=mU6iypl8PgNgvjgMt1+vPQIybHaO5jVCbwu0EMt/haEUTM1d59cSnc6UgGdnjtm/Q2nXDhaTxzD3J1SuAke0/9ES4QoizWMHGGRwVPi5auS7T+ERjInWYlCjL4d2XTQZexvcKX69x75pBqLKIFJDsme/m3DzjxcSWd3XFU5Sg5o=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779453393;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=t/W67fG4fYzN90BLM7vyOYKhLTKJIXI3lpgrib8Uv48=;
	b=e8n7WKa3JncT7WF+ZFNYqQjW4f1lxmzmYcKGnnVsw7ygGyPk0vPvlz2RfGp4MTAW
	1NJ1ptJbFtznuVnoHz/Sf2VpbvzW+LVAlifWZmtsexMpDMhdXjQlLSeaHL/FgfzvCSc
	MqwcMaCXMeBEhxVFDmcAGPpDfU29DNSB2WvM6X0M=
Received: by mx.zohomail.com with SMTPS id 1779453392096168.52377067593306;
	Fri, 22 May 2026 05:36:32 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 22 May 2026 14:32:17 +0200
Subject: [PATCH v15 26/28] drm/tests: bridge: Add test for HDMI output bus
 formats helper
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-color-format-v15-26-21fb136c9df2@collabora.com>
References: <20260522-color-format-v15-0-21fb136c9df2@collabora.com>
In-Reply-To: <20260522-color-format-v15-0-21fb136c9df2@collabora.com>
To: Harry Wentland <harry.wentland@amd.com>, Leo Li <sunpeng.li@amd.com>, 
 Rodrigo Siqueira <siqueira@igalia.com>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, Dmitry Baryshkov <lumag@kernel.org>, 
 Sascha Hauer <s.hauer@pengutronix.de>, Rob Herring <robh@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Daniel Stone <daniel@fooishbar.org>
Cc: kernel@collabora.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, wayland-devel@lists.freedesktop.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.15.2

The common atomic_get_output_bus_fmts helper for HDMI bridge connectors,
called drm_atomic_helper_bridge_get_hdmi_output_bus_fmts, should return
an array of output bus formats depending on the supported formats of the
connector, and the current output BPC.

Add a test to exercise some of this helper.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Daniel Stone <daniel@fooishbar.org>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/tests/drm_bridge_test.c | 184 ++++++++++++++++++++++++++++++++
 1 file changed, 184 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_bridge_test.c b/drivers/gpu/drm/tests/drm_bridge_test.c
index 92f142ca6695..9d4fbe709df4 100644
--- a/drivers/gpu/drm/tests/drm_bridge_test.c
+++ b/drivers/gpu/drm/tests/drm_bridge_test.c
@@ -5,6 +5,7 @@
 #include <linux/cleanup.h>
 #include <linux/media-bus-format.h>
 
+#include <drm/drm_atomic_helper.h>
 #include <drm/drm_atomic_state_helper.h>
 #include <drm/drm_atomic_uapi.h>
 #include <drm/drm_bridge.h>
@@ -118,6 +119,28 @@ static const struct drm_bridge_funcs drm_test_bridge_atomic_funcs = {
 	.atomic_reset		= drm_atomic_helper_bridge_reset,
 };
 
+static int dummy_clear_infoframe(struct drm_bridge *bridge)
+{
+	return 0;
+}
+
+static int dummy_write_infoframe(struct drm_bridge *bridge, const u8 *buffer,
+				 size_t len)
+{
+	return 0;
+}
+
+static const struct drm_bridge_funcs drm_test_bridge_bus_fmts_funcs = {
+	.atomic_get_output_bus_fmts	= drm_atomic_helper_bridge_get_hdmi_output_bus_fmts,
+	.atomic_destroy_state		= drm_atomic_helper_bridge_destroy_state,
+	.atomic_duplicate_state		= drm_atomic_helper_bridge_duplicate_state,
+	.atomic_reset			= drm_atomic_helper_bridge_reset,
+	.hdmi_write_avi_infoframe	= dummy_write_infoframe,
+	.hdmi_write_hdmi_infoframe	= dummy_write_infoframe,
+	.hdmi_clear_avi_infoframe	= dummy_clear_infoframe,
+	.hdmi_clear_hdmi_infoframe	= dummy_clear_infoframe,
+};
+
 /**
  * struct fmt_tuple - a tuple of input/output MEDIA_BUS_FMT_*
  */
@@ -537,6 +560,83 @@ drm_test_bridge_chain_init(struct kunit *test, unsigned int num_bridges,
 	return priv;
 }
 
+static struct drm_bridge_init_priv *
+drm_test_bridge_hdmi_init(struct kunit *test, const struct drm_bridge_funcs *funcs,
+			  unsigned int supported_formats, int max_bpc)
+{
+	struct drm_bridge_init_priv *priv;
+	struct drm_encoder *enc;
+	struct drm_bridge *bridge;
+	struct drm_device *drm;
+	struct device *dev;
+	int ret;
+
+	dev = drm_kunit_helper_alloc_device(test);
+	if (IS_ERR(dev))
+		return ERR_CAST(dev);
+
+	priv = drm_kunit_helper_alloc_drm_device(test, dev,
+						 struct drm_bridge_init_priv, drm,
+						 DRIVER_MODESET | DRIVER_ATOMIC);
+	if (IS_ERR(priv))
+		return ERR_CAST(priv);
+
+	priv->test_bridge = devm_drm_bridge_alloc(dev, struct drm_bridge_priv, bridge, funcs);
+	if (IS_ERR(priv->test_bridge))
+		return ERR_CAST(priv->test_bridge);
+
+	priv->test_bridge->data = priv;
+
+	drm = &priv->drm;
+	priv->plane = drm_kunit_helper_create_primary_plane(test, drm,
+							    NULL,
+							    NULL,
+							    NULL, 0,
+							    NULL);
+	if (IS_ERR(priv->plane))
+		return ERR_CAST(priv->plane);
+
+	priv->crtc = drm_kunit_helper_create_crtc(test, drm,
+						  priv->plane, NULL,
+						  NULL,
+						  NULL);
+	if (IS_ERR(priv->crtc))
+		return ERR_CAST(priv->crtc);
+
+	enc = &priv->encoder;
+	ret = drmm_encoder_init(drm, enc, NULL, DRM_MODE_ENCODER_TMDS, NULL);
+	if (ret)
+		return ERR_PTR(ret);
+
+	enc->possible_crtcs = drm_crtc_mask(priv->crtc);
+
+	bridge = &priv->test_bridge->bridge;
+	bridge->type = DRM_MODE_CONNECTOR_HDMIA;
+	bridge->supported_formats = supported_formats;
+	bridge->max_bpc = max_bpc;
+	bridge->ops |= DRM_BRIDGE_OP_HDMI;
+	bridge->vendor = "LNX";
+	bridge->product = "KUnit";
+
+	ret = drm_kunit_bridge_add(test, bridge);
+	if (ret)
+		return ERR_PTR(ret);
+
+	ret = drm_bridge_attach(enc, bridge, NULL, 0);
+	if (ret)
+		return ERR_PTR(ret);
+
+	priv->connector = drm_bridge_connector_init(drm, enc);
+	if (IS_ERR(priv->connector))
+		return ERR_CAST(priv->connector);
+
+	drm_connector_attach_encoder(priv->connector, enc);
+
+	drm_mode_config_reset(drm);
+
+	return priv;
+}
+
 /*
  * Test that drm_bridge_get_current_state() returns the last committed
  * state for an atomic bridge.
@@ -784,10 +884,94 @@ static void drm_test_drm_bridge_helper_reset_crtc_legacy(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, bridge_priv->disable_count, 1);
 }
 
+/*
+ * Test that a bridge using the drm_atomic_helper_bridge_get_hdmi_output_bus_fmts()
+ * function for &drm_bridge_funcs.atomic_get_output_bus_fmts behaves as expected
+ * for an HDMI connector bridge. Does so by creating an HDMI bridge connector
+ * with RGB444, YCBCR444, and YCBCR420 (but not YCBCR422) as supported formats,
+ * sets the output depth to 8 bits per component, and then validates the returned
+ * list of bus formats.
+ */
+static void drm_test_drm_bridge_helper_hdmi_output_bus_fmts(struct kunit *test)
+{
+	struct drm_connector_state *conn_state;
+	struct drm_bridge_state *bridge_state;
+	struct drm_modeset_acquire_ctx ctx;
+	struct drm_bridge_init_priv *priv;
+	struct drm_crtc_state *crtc_state;
+	struct drm_atomic_commit *state;
+	struct drm_display_mode *mode;
+	unsigned int num_output_fmts;
+	struct drm_bridge *bridge;
+	u32 *out_bus_fmts;
+	int ret;
+
+	priv = drm_test_bridge_hdmi_init(test, &drm_test_bridge_bus_fmts_funcs,
+					 BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444) |
+					 BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444) |
+					 BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR420),
+					 12);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, priv);
+
+	bridge = &priv->test_bridge->bridge;
+
+	drm_modeset_acquire_init(&ctx, 0);
+
+	state = drm_kunit_helper_atomic_state_alloc(test, &priv->drm, &ctx);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, state);
+
+retry_commit:
+	conn_state = drm_atomic_get_connector_state(state, priv->connector);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, conn_state);
+
+	conn_state->hdmi.output_bpc = 8;
+
+	mode = drm_kunit_display_mode_from_cea_vic(test, &priv->drm, 16);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, mode);
+
+	ret = drm_atomic_set_crtc_for_connector(conn_state, priv->crtc);
+	if (ret == -EDEADLK) {
+		drm_modeset_backoff(&ctx);
+		goto retry_commit;
+	}
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	crtc_state = drm_atomic_get_crtc_state(state, priv->crtc);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, crtc_state);
+
+	ret = drm_atomic_set_mode_for_crtc(crtc_state, mode);
+	if (ret == -EDEADLK) {
+		drm_modeset_backoff(&ctx);
+		goto retry_commit;
+	}
+	KUNIT_ASSERT_EQ(test, ret, 0);
+
+	crtc_state->enable = true;
+	crtc_state->active = true;
+
+	bridge_state = drm_atomic_get_bridge_state(state, bridge);
+	KUNIT_ASSERT_NOT_ERR_OR_NULL(test, bridge_state);
+
+	out_bus_fmts = bridge->funcs->atomic_get_output_bus_fmts(
+		bridge, bridge_state, crtc_state, conn_state, &num_output_fmts);
+	KUNIT_EXPECT_NOT_NULL(test, out_bus_fmts);
+	KUNIT_EXPECT_EQ(test, num_output_fmts, 3);
+
+	KUNIT_EXPECT_EQ(test, out_bus_fmts[0], MEDIA_BUS_FMT_RGB888_1X24);
+	KUNIT_EXPECT_EQ(test, out_bus_fmts[1], MEDIA_BUS_FMT_YUV8_1X24);
+	KUNIT_EXPECT_EQ(test, out_bus_fmts[2], MEDIA_BUS_FMT_UYYVYY8_0_5X24);
+
+	drm_modeset_drop_locks(&ctx);
+	drm_modeset_acquire_fini(&ctx);
+
+	kfree(out_bus_fmts);
+}
+
 static struct kunit_case drm_bridge_helper_reset_crtc_tests[] = {
 	KUNIT_CASE(drm_test_drm_bridge_helper_reset_crtc_atomic),
 	KUNIT_CASE(drm_test_drm_bridge_helper_reset_crtc_atomic_disabled),
 	KUNIT_CASE(drm_test_drm_bridge_helper_reset_crtc_legacy),
+	KUNIT_CASE(drm_test_drm_bridge_helper_hdmi_output_bus_fmts),
 	{ }
 };
 

-- 
2.54.0

