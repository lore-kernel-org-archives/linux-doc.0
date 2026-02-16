Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8C4B630E0C0;
	Mon, 16 Feb 2026 13:02:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771246978; cv=pass; b=E9eEV3DgjOwpF1Bb8ZnSdJHReOmMwPlQhhuv3CUPdN3C+jZgNyoez0Iy48e5hG7yOzcfN6dhs9V2ofL25FVhr09AEdQEaaQMlY8frPUYneztLBl6NSnzdaqB8IMMEOB2hr6zW3/hUs+bMi/6CRlQJbT8cqBDo+qZ+0OpkPe/BX0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771246978; c=relaxed/simple;
	bh=HVo/gqYIjhPprngYgHjDXS6TY/6XHs3wncu5CKB3chk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DZPtr4JNe5YGdfxJ2+0iw9W4YX+KDAet314NIneRL+fdA9gnlKjQBi0r5/8Jxj4xgnvts5bLOOQm49Ts+H5oIbWwU8aGOw3uZScOxwy2tnSmHPKwNuB89lv2MAZq8nU9MrXsX80fTVQRRc+VogTwCufsQA8XTqoTH0MfQ06J1pQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=SLYyzIpp; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="SLYyzIpp"
ARC-Seal: i=1; a=rsa-sha256; t=1771246937; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=SjwFdSxGKe/Yd9BHGQsS2tFZh8sCy5jdJJfJk+Ceppp7nHriZgrhek6XQ4sm3y2GywsLm3xI9LrxjmT84T+EG6S6Dhd7Bvt1yyHF+LUNcuJLSxoOffoVLOVQ41TuWfdAgZ5XdI+guGlf0NQjaGyHV+sdFhTew01rYxgLBj4zTFY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1771246937; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=XJQUiMBk6drlEqyVcvn5t6omt1siA1VhQ5FW6igxkp4=; 
	b=eVKZtrJF96IBY16fn+j3BvwdMnISN+2fju8tz43AAaPku9jYvp5E2z7c9me9YbwdEvdCzkTIaHi/ahzx6u6isF43V10hyRu3dFiAsvmoubfvHFj9WQkbAa562qd7Y4bjmuSw+UVzPPPjQvNaX5iTIlCK/AnPF+XLY4TeqZFrl0k=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771246937;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=XJQUiMBk6drlEqyVcvn5t6omt1siA1VhQ5FW6igxkp4=;
	b=SLYyzIpp/sDAePPdKa/wbGGQOZM9CfSx/pvjyQIgBSoN8Pxl3DqRdNaqJGUV/DNK
	Oihkj9X3YL8u24M5muBRHoLG6BheY3XHc86QPiVrI1DSNt6F0SwvOfLALVXVqmeX+Zq
	zZhN/9nItYLeiK66SX9pkaNyNMjk9eC6Qa2EgHFw=
Received: by mx.zohomail.com with SMTPS id 1771246935363351.37459512313205;
	Mon, 16 Feb 2026 05:02:15 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 16 Feb 2026 14:01:19 +0100
Subject: [PATCH v8 05/20] drm/display: hdmi-state-helper: Act on color
 format DRM property
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-color-format-v8-5-5722ce175dd5@collabora.com>
References: <20260216-color-format-v8-0-5722ce175dd5@collabora.com>
In-Reply-To: <20260216-color-format-v8-0-5722ce175dd5@collabora.com>
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
 Jonathan Corbet <corbet@lwn.net>
Cc: kernel@collabora.com, amd-gfx@lists.freedesktop.org, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, 
 intel-gfx@lists.freedesktop.org, intel-xe@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3

With the introduction of the "color format" DRM property, which allows
userspace to request a specific color format, the HDMI state helper
should implement this.

Implement it by translating the requested drm_color_format_enum to an
hdmi_colorspace enum value. Auto is translated to RGB, and a fallback to
YUV420 is only performed if the original color format was auto.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 28 +++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index a1d16762ac7a..3ba752200984 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -649,10 +649,34 @@ hdmi_compute_config(const struct drm_connector *connector,
 	unsigned int max_bpc = clamp_t(unsigned int,
 				       conn_state->max_bpc,
 				       8, connector->max_bpc);
+	enum hdmi_colorspace fmt;
 	int ret;
 
-	ret = hdmi_compute_format_bpc(connector, conn_state, mode, max_bpc,
-				      HDMI_COLORSPACE_RGB);
+	switch (conn_state->color_format) {
+	case DRM_COLOR_FORMAT_ENUM_AUTO:
+	case DRM_COLOR_FORMAT_ENUM_RGB444:
+		fmt = HDMI_COLORSPACE_RGB;
+		break;
+	case DRM_COLOR_FORMAT_ENUM_YCBCR444:
+		fmt = HDMI_COLORSPACE_YUV444;
+		break;
+	case DRM_COLOR_FORMAT_ENUM_YCBCR422:
+		fmt = HDMI_COLORSPACE_YUV422;
+		break;
+	case DRM_COLOR_FORMAT_ENUM_YCBCR420:
+		fmt = HDMI_COLORSPACE_YUV420;
+		break;
+	default:
+		drm_dbg_kms(connector->dev, "HDMI does not support color format '%s'.\n",
+			    drm_get_color_format_name(conn_state->color_format));
+		return -EINVAL;
+	}
+
+	ret = hdmi_compute_format_bpc(connector, conn_state, mode, max_bpc, fmt);
+
+	if (conn_state->color_format != DRM_COLOR_FORMAT_ENUM_AUTO)
+		return ret;
+
 	if (ret) {
 		if (connector->ycbcr_420_allowed) {
 			ret = hdmi_compute_format_bpc(connector, conn_state,

-- 
2.53.0

