Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58AD63033DE;
	Thu, 23 Apr 2026 19:07:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776971266; cv=pass; b=RIupbjKXDW1fjm7g3cPzlHAzyNrj5BS9AfxMeR2QGw7C+fxWMYfVPQo0YO4kA+2wCLPWXqinCKurOKpV2a5VBYh6UlaQ6oPGVW4wqUAEiEO2xpIBsh4/ZuaSEEX5aZrSv92JOFzgN+aMHe6k/elphP3Vg24dGFc1ckAn5SPab7k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776971266; c=relaxed/simple;
	bh=sFwn5ED1nGb2x7YyOKVbkg5A1ouxDS6JzDAW5s1Piyo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Clu8sF6wyNIBtGYuSrJunPuFVBnZI1OVkw5wml1j2DkF3j8SpLIF2Jn171TeUP822UuOv/Z05TX+ETDhoTa9oBUM501A8cWlDSmIy/TTnTS5mZyvStzx4GyeVcDQaqpgW1a43TKixQa5ZgSEM1IYUEVEe3NQgme504UW/YPfSyI=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=d5FD4BpC; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="d5FD4BpC"
ARC-Seal: i=1; a=rsa-sha256; t=1776971216; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=dP6J4YavDS5RlCTv+X2zf4EIONKnq+ddLkI7RMMM2YC88YayzhP1Orb9QCHHAX3Dvfb5PKQAVhMecSf47qs2FvfEmyPzXKHn8gYJ6AlZtF06d+1HPsKn6l9B3HVaNd4UFMZVGQLHdamm8+fENe6nymk/kiWPGwC4DFA3nxhMeyo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1776971216; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Nt62OO2AP7f+cfOhlF2MV/RbDyVdkbuWQbRENaudCYk=; 
	b=Z51ZQYkJKShSenUg1yXl1pDj5LvRtXTCVhkgK4zHnlDmQ5GZUTJiRVMQxZZP2x7O5R8DKbEyrM4QrjO2hGT+GVvWPPBNmspSzqZQoXU8HXPQy4V7Rq/kRoXiynX9E1u2EmbmW+7eOSVRV41cBZgYcpLTn3ou+kkU0Fez8Co63eo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1776971216;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=Nt62OO2AP7f+cfOhlF2MV/RbDyVdkbuWQbRENaudCYk=;
	b=d5FD4BpChioMaCvOZZVtbFBIbbETlY8pS5zcFkr+XFxx1owey8oM8WOe2QsirueI
	mSx+UvzkNI0R2XP/Bx0MJgF3+Uoa5t5R6734oaKmTY6/ahm5lbZaX1tSZY+KG1NgseS
	GkeFzEr0hwJG6axFOtupQbpVQZywP/12FLmGwpV4=
Received: by mx.zohomail.com with SMTPS id 1776971214548514.2263210644421;
	Thu, 23 Apr 2026 12:06:54 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 23 Apr 2026 21:03:47 +0200
Subject: [PATCH v14 24/28] drm/tests: hdmi: Add tests for HDMI helper's
 mode_valid
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-color-format-v14-24-449a419ccbd4@collabora.com>
References: <20260423-color-format-v14-0-449a419ccbd4@collabora.com>
In-Reply-To: <20260423-color-format-v14-0-449a419ccbd4@collabora.com>
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
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>
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
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c | 109 +++++++++++++++++++++
 1 file changed, 109 insertions(+)

diff --git a/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c b/drivers/gpu/drm/tests/drm_hdmi_state_helper_test.c
index 3444c93c615f..74c9933eabfc 100644
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
2.53.0

