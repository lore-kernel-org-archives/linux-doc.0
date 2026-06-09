Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2208A41C2FE;
	Tue,  9 Jun 2026 12:48:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781009290; cv=pass; b=Wtj9yg48VKmKCwokxUGVAmh1mpD5lyTDCmaSoGbbMDD0Iv1pXY9fVzySCXDBGfDhMnqQgUZ9n2aXmGhpqGpjczFE9y+rND2diWKpCblD2SrzjPc1AM4p4Kgu8XmPecD4/SuIPuX9WzC2TW7W1h1LCFbxKWj4Gu9KoENldTv6YD8=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781009290; c=relaxed/simple;
	bh=iRheOrWlMoQbFU2qwh3dx9D2lcm0rWaYx9PKcCVwKd0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pbp9TM4+6Wrkt0ZOlzXv0SeEA5tl5rgdQdx4fcx++s3WRK87Zj4L3ORbtznmmqcZN8DGR6WFrVaSm3wgcthAX+Nh+6yKkrk5nuV2viPaoqFI7+GVGiIWF0pm9mmGzcDvxUAW/FVsz952F2vR2Y7OJbtlApa8psFZbvQn2oHintI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=KmYUark3; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="KmYUark3"
ARC-Seal: i=1; a=rsa-sha256; t=1781009248; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=FTsl62LoKZwEuSzB2aJR4oLwySw4Vi6xyz4givSbizFve7CXBa+Gpe29zmh+PdrLDQPbxCXDb42wt2uwpAbJ+YLnB/8eiipP8H98sS8BM+p+GXX88bUqw3qCJloZpXR75bc/VVWQprlnVb4wW7he0I57vDGmp6kxHReClrtMzeU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1781009248; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=VjTLCJ4yrFpx91pOX4QxBiEfIYd1n6wewiyNVeWJ+PE=; 
	b=VH7CSu+SQujHf7g9jKZZqr2E6Qn+QpAN7e/qIxzqrMCblcKttyDTQj/bhJMO/DTLIO25Auwbvqk5rx0IEU4iCPr8QBE8U1L4Wp3esHVz0zSxqXDHTmKarb9wFAuE+A3FyvwBmyqs9bzSVBQtd/IphJfugkyEzBYyernent1M7yc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1781009248;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=VjTLCJ4yrFpx91pOX4QxBiEfIYd1n6wewiyNVeWJ+PE=;
	b=KmYUark3uXJIpVHvry5F78Apg3ATZJMfmZr5tIxHFnaAf/xzDhjl0BLGKJ2tKC3g
	kTPK4VBUYFRGcFUkevvLOTK97xectof1Hrar0rKii3ytEyniAhwGTsnaGEEGSqywPN7
	L5vkPLe2+6UoP+I0uxq4ybkkHKG7x/i+8NiphyEE=
Received: by mx.zohomail.com with SMTPS id 178100924570730.244177959776266;
	Tue, 9 Jun 2026 05:47:25 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Tue, 09 Jun 2026 14:44:07 +0200
Subject: [PATCH v17 20/28] drm/tests: hdmi: Add tests for HDMI helper's
 mode_valid
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-color-format-v17-20-35739b5782cc@collabora.com>
References: <20260609-color-format-v17-0-35739b5782cc@collabora.com>
In-Reply-To: <20260609-color-format-v17-0-35739b5782cc@collabora.com>
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

Add some KUnit tests to verify that the HDMI state helper's mode_valid
implementation does not improperly reject chroma subsampled modes on the
basis of their clock rate not being satisfiable in RGB.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Daniel Stone <daniel@fooishbar.org>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 109 +++++++++++++++++++++
 1 file changed, 109 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index 8eaca9b5b0fe..353a261d42da 100644
--- a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
+++ b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
@@ -77,6 +77,23 @@ static struct drm_display_mode *find_420_only_mode(struct drm_connector *connect
 	return NULL;
 }
 
+static struct drm_display_mode *find_420_also_mode(struct drm_connector *connector)
+{
+	struct drm_device *drm = connector->dev;
+	struct drm_display_mode *mode;
+
+	mutex_lock(&drm->mode_config.mutex);
+	list_for_each_entry(mode, &connector->modes, head) {
+		if (drm_mode_is_420_also(&connector->display_info, mode)) {
+			mutex_unlock(&drm->mode_config.mutex);
+			return mode;
+		}
+	}
+	mutex_unlock(&drm->mode_config.mutex);
+
+	return NULL;
+}
+
 static int set_connector_edid(struct kunit *test, struct drm_connector *connector,
 			      const void *edid, size_t edid_len)
 {
@@ -2745,11 +2762,103 @@ static void drm_test_check_mode_valid_reject_max_clock(struct kunit *test)
 	KUNIT_EXPECT_EQ(test, preferred->clock, 25200);
 }
 
+/*
+ * Test that drm_hdmi_connector_mode_valid() will accept modes that require a
+ * 4:2:0 chroma subsampling, even if said mode would violate maximum clock
+ * constraints if it used RGB 4:4:4.
+ */
+static void drm_test_check_mode_valid_yuv420_only_max_clock(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_display_mode *dank;
+	struct drm_connector *conn;
+
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
+				BIT(HDMI_COLORSPACE_RGB) |
+				BIT(HDMI_COLORSPACE_YUV420),
+				8,
+				&dummy_connector_hdmi_funcs,
+				test_edid_hdmi_1080p_rgb_yuv_4k_yuv420_dc_max_200mhz);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	conn = &priv->connector;
+	KUNIT_ASSERT_EQ(test, conn->display_info.max_tmds_clock, 200 * 1000);
+
+	dank = find_420_only_mode(conn);
+	KUNIT_ASSERT_NOT_NULL(test, dank);
+	KUNIT_EXPECT_EQ(test, dank->hdisplay, 3840);
+	KUNIT_EXPECT_EQ(test, dank->vdisplay, 2160);
+
+	/*
+	 * Note: The mode's "clock" here is not accurate to the actual TMDS
+	 * clock that HDMI will use for a subsampled mode. Hence, why the mode's
+	 * clock is above the .max_tmds_clock of 200MHz.
+	 */
+	KUNIT_EXPECT_EQ(test, dank->clock, 297000);
+}
+
+/*
+ * Test that drm_hdmi_connector_mode_valid() will reject modes that require
+ * 4:2:0 chroma subsampling, if the connector does not support 4:2:0.
+ */
+static void
+drm_test_check_mode_valid_reject_yuv420_only_connector(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_display_mode *dank;
+	struct drm_connector *conn;
+
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
+				BIT(HDMI_COLORSPACE_RGB),
+				8,
+				&dummy_connector_hdmi_funcs,
+				test_edid_hdmi_1080p_rgb_yuv_4k_yuv420_dc_max_200mhz);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	conn = &priv->connector;
+	KUNIT_ASSERT_EQ(test, conn->display_info.max_tmds_clock, 200 * 1000);
+
+	dank = find_420_only_mode(conn);
+	KUNIT_EXPECT_NULL(test, dank);
+}
+
+/*
+ * Test that drm_hdmi_connector_mode_valid() will accept modes that allow (among
+ * other color formats) 4:2:0 chroma subsampling, even if the connector does not
+ * support 4:2:0, but the mode's clock works for RGB 4:4:4.
+ */
+static void
+drm_test_check_mode_valid_accept_yuv420_also_connector_rgb(struct kunit *test)
+{
+	struct drm_atomic_helper_connector_hdmi_priv *priv;
+	struct drm_display_mode *mode;
+	struct drm_connector *conn;
+
+	priv = drm_kunit_helper_connector_hdmi_init_with_edid_funcs(test,
+				BIT(HDMI_COLORSPACE_RGB),
+				8,
+				&dummy_connector_hdmi_funcs,
+				test_edid_hdmi_4k_rgb_yuv420_dc_max_340mhz);
+	KUNIT_ASSERT_NOT_NULL(test, priv);
+
+	conn = &priv->connector;
+	KUNIT_ASSERT_EQ(test, conn->display_info.max_tmds_clock, 340 * 1000);
+
+	mode = find_420_also_mode(conn);
+	KUNIT_ASSERT_NOT_NULL(test, mode);
+	KUNIT_EXPECT_EQ(test, mode->hdisplay, 3840);
+	KUNIT_EXPECT_EQ(test, mode->vdisplay, 2160);
+	KUNIT_EXPECT_EQ(test, mode->clock, 297000);
+}
+
 static struct kunit_case drm_atomic_helper_connector_hdmi_mode_valid_tests[] = {
 	KUNIT_CASE(drm_test_check_mode_valid),
 	KUNIT_CASE(drm_test_check_mode_valid_reject),
 	KUNIT_CASE(drm_test_check_mode_valid_reject_rate),
 	KUNIT_CASE(drm_test_check_mode_valid_reject_max_clock),
+	KUNIT_CASE(drm_test_check_mode_valid_yuv420_only_max_clock),
+	KUNIT_CASE(drm_test_check_mode_valid_reject_yuv420_only_connector),
+	KUNIT_CASE(drm_test_check_mode_valid_accept_yuv420_also_connector_rgb),
 	{ }
 };
 

-- 
2.54.0

