Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05993BB116;
	Fri, 22 May 2026 12:34:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779453269; cv=pass; b=nkM/8ZstktcDEGQiIP/WtciuIX24N89PrHMqqc3d3ydUyNwnXZ3XmIyR5eZHTVwrU7UD51/Z8OigLL6NNGiZIOXcX4+P2JwBVoYKAQgirOWJ4niRfMEb13DnILgcRDOOV5hfcJZTDUevvsRDIJ/fTqJ3VbJTZgN5zcxaynwdHso=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779453269; c=relaxed/simple;
	bh=EmKuqnO90Xwr7Cg55wBBzgxTj4MAwShsOSXmsU66cmE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IBYHX8SbXxe/TavVpMfUDt89JJuLLNZg7dylxUzB3afxg0M5L5b0beQnGe2hECos81m8EYJKfMejNZ9gdpWOF7hUzOINGa3wTUG7LdIGBahJ05KQgxC5DzwVlE8sMCbccVeLMsk6Op+0P9/icSuHo2zbQhThra+sLUbFbKc593Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=CjaghitS; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="CjaghitS"
ARC-Seal: i=1; a=rsa-sha256; t=1779453226; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gBWe46Twih5r38Nc/zUACCZtp6YA7cRjtJU3XKIQHq95uMbbSvF7qA/STxnQHuJ6S6VTgxJYKjMGmfo4cUynEhujvkqQ2hArJ/aspeJUbDYz4aCSrxvgQ+ea9Ao2Zi+SJiDpsrDHTJcXGntLrTHhubHrSvEGRVpFU6Qi35TtM1s=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779453226; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=GG7N+YpF5OPbnblpOFH2Ooa+APF+6Jj/DXhtPAgCpt8=; 
	b=RL3ITZBPPubSTmgPLhirlXBWecziNzpcfKpvZ+7Vb9CqGlF5PesZVMfhfqV2uIlR6HuRHlUZig42xjsTxZQGwz5WaqkC3jtNzliZprzS7+48cmERwhhZuD8VMp9kugwqT6kZVtRkkpXk00AbwqtcOMgrHvTl1P6E2K4D4OhGMK8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779453226;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=GG7N+YpF5OPbnblpOFH2Ooa+APF+6Jj/DXhtPAgCpt8=;
	b=CjaghitSQDA6CvEzQOY1G61RVMUSOkTJckMCaMzEuXyikUWolULXGrWxc6NtH+WM
	BYx2eXI0M/VzvEY5QRdqVXVW51LwsiJQV6oQFBLjlInj2fgrTtnppXMK9IOyOt1x9bC
	uNKgkWDTHRN5zCHzU/SCcw8hm4T2Hz2Jfl/VkaiA=
Received: by mx.zohomail.com with SMTPS id 17794532239781004.438452754942;
	Fri, 22 May 2026 05:33:43 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 22 May 2026 14:31:59 +0200
Subject: [PATCH v15 08/28] drm/display: hdmi-state-helper: Act on color
 format DRM property
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-color-format-v15-8-21fb136c9df2@collabora.com>
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
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2

With the introduction of the "color format" DRM property, which allows
userspace to request a specific color format, the HDMI state helper
should implement this.

Implement it by translating the requested drm_connector_color_format to
a drm_output_color_format enum value as per the logic HDMI should use
for this: Auto is translated to RGB, and a fallback to YUV420 is only
performed if the original color format was auto.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Reviewed-by: Daniel Stone <daniel@fooishbar.org>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 31 +++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index 3ba47564caad..1c54e6feac61 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -670,8 +670,39 @@ hdmi_compute_config(const struct drm_connector *connector,
 	unsigned int max_bpc = clamp_t(unsigned int,
 				       conn_state->max_bpc,
 				       8, connector->max_bpc);
+	enum drm_output_color_format fmt;
 	int ret;
 
+	if (conn_state->color_format != DRM_CONNECTOR_COLOR_FORMAT_AUTO) {
+		switch (conn_state->color_format) {
+		case DRM_CONNECTOR_COLOR_FORMAT_AUTO:
+			drm_warn(connector->dev, "AUTO format in non-AUTO path.\n");
+			fallthrough;
+		case DRM_CONNECTOR_COLOR_FORMAT_RGB444:
+			fmt = DRM_OUTPUT_COLOR_FORMAT_RGB444;
+			break;
+		case DRM_CONNECTOR_COLOR_FORMAT_YCBCR444:
+			fmt = DRM_OUTPUT_COLOR_FORMAT_YCBCR444;
+			break;
+		case DRM_CONNECTOR_COLOR_FORMAT_YCBCR422:
+			fmt = DRM_OUTPUT_COLOR_FORMAT_YCBCR422;
+			break;
+		case DRM_CONNECTOR_COLOR_FORMAT_YCBCR420:
+			fmt = DRM_OUTPUT_COLOR_FORMAT_YCBCR420;
+			break;
+		default:
+			drm_dbg_kms(connector->dev, "HDMI does not support color format '%d'.\n",
+				conn_state->color_format);
+			return -EINVAL;
+		}
+
+		return hdmi_compute_format_bpc(connector, conn_state, mode, max_bpc, fmt);
+	}
+
+	/*
+	 * For %DRM_CONNECTOR_COLOR_FORMAT_AUTO, try RGB first, and fall back
+	 * to the less bandwidth-intensive YCBCR420 if RGB fails.
+	 */
 	ret = hdmi_compute_format_bpc(connector, conn_state, mode, max_bpc,
 				      DRM_OUTPUT_COLOR_FORMAT_RGB444);
 	if (ret) {

-- 
2.54.0

