Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A4E23E0C55;
	Thu,  9 Apr 2026 15:47:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775749625; cv=pass; b=GikPhzszzVueQ9BlgbQxYP0ppLsBF6mrb49nw4HHz1T7gqjJkHOWR8sFdl3TmlCfNS8OWyjY9sSXcO00JaRMX4DFG96Fp2Uqn0YTWPZcN80/dallczTyNCcWsIztdMxY+/ex/MU6mCCijYb1+ihMe9f+LgRcsxj4rxoDME7HQI0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775749625; c=relaxed/simple;
	bh=mJBUCMK5Y2SpBvU+a7vlREeo/7xI/oEsYcDUta2SYgk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=J3MLxtBAejgRXwREPgugvBC0Ycy6KPJTKtlcBqUXPs5QYAXTPEBFcDM6pZUJA4RvbgY+cypLHkQs0fWDUv2n6TLU3Ypyy4jot0GSepLJuXiVtdiicC3pfv9iKuqQRIsY+52us5CLbwkAcKz0oKGXxB28tcrdtXZChFaBBvMIZgk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=LPvr8R+9; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="LPvr8R+9"
ARC-Seal: i=1; a=rsa-sha256; t=1775749568; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=fkz2gzLau26A/D5RyFq86S9AqQs1OKisWrwj0HnvS6lzDc5+9WXMkvPm6LZDyfC3p8WPImZCbw4SpUI3sVNNMRXNGoaDVzsemmpBcBJ7umKwithmAIsAGU7ZO8nRFaOorXvDChbVSpPz8C4j/B+7kE21TEAsOBegKVgArDJSSPM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1775749568; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=5k1vlW62iXZjcOaFsSXyeVWlBMQFrsYlNjKb9M5MyLE=; 
	b=CUS9fALyJ6Ak04Fnkh3uHzA4F+yYpuwr9LbRTUVZpIyHGOBEb2MBkB36pyEGtmv13S4Xqz1v+niAILIH3rNYrnXVfPfBof3d/OoW0P7/ExEyIuTREUVV1yZTjHd1ktUg6pQLPRaIjQIoRJmG5NEO3G6AACj9i8LFpOcyfNPB70U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1775749568;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=5k1vlW62iXZjcOaFsSXyeVWlBMQFrsYlNjKb9M5MyLE=;
	b=LPvr8R+9Nr1XXl6hhqZC8/TgPK41i+UoXkl1zRICsUbtr5v+6JuUiNA9YITF384f
	XqBw5weXZ0baFDyMjQWDUXDBSvkFqO65/w69s42wdZaA65yrHpCh1n+mHCIICS1hOoV
	0mn32NLrWcH94yo+sjsIyC9jyMN1592PNt5JIzuY=
Received: by mx.zohomail.com with SMTPS id 17757495659461009.4108193899488;
	Thu, 9 Apr 2026 08:46:05 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 09 Apr 2026 17:44:56 +0200
Subject: [PATCH v12 06/25] drm/display: hdmi-state-helper: Act on color
 format DRM property
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-color-format-v12-6-ce84e1817a27@collabora.com>
References: <20260409-color-format-v12-0-ce84e1817a27@collabora.com>
In-Reply-To: <20260409-color-format-v12-0-ce84e1817a27@collabora.com>
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
 linux-doc@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.1

With the introduction of the "color format" DRM property, which allows
userspace to request a specific color format, the HDMI state helper
should implement this.

Implement it by translating the requested drm_connector_color_format to
a drm_output_color_format enum value as per the logic HDMI should use
for this: Auto is translated to RGB, and a fallback to YUV420 is only
performed if the original color format was auto.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 31 +++++++++++++++++++++++++
 1 file changed, 31 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index a0d88701d236..954f8b2973fc 100644
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
2.53.0

