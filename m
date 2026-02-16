Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 74C292F12C6;
	Mon, 16 Feb 2026 13:04:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771247069; cv=pass; b=A8c2soL53L9Eom7wm6uFJig83b5kKMPxGOsuzxx9ckFOWbIVKhPzLbMyqavywJcM4YHkvwZOCg4Jsp6jJwq97WxcdiAGDf0VHNaAAeHe3qquCNM4swirDnZPQGjB4B8LA4rqlf5Yb5CGVjtAW6xrN3nlTURQztK4TNWr4tROQB4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771247069; c=relaxed/simple;
	bh=LVVhvkoKq+6cgnmVF2R9/6ld4B/SNMB8QtyxfEmb+WY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n1acegCHVgsiqtsRUFNPIwNMLZyE3Z919PfGHA4+g8Qjte5+/QFeSdKvaw46DpySRNdpUoctU5BqFN9tYMSKT817fAYLgPtTgJ++8gWZhJXnDxgRYd/cmWxknYUQofU2lEmPLdIhlukafY9Wvq8shsl+++6451/lIEG1lYJrEUo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=XGb4hAvN; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="XGb4hAvN"
ARC-Seal: i=1; a=rsa-sha256; t=1771247013; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=X3zsDLV5a8962IGdHDtyBhrtORXm8oZj9/dLlcuV7j1sKXVndBYVVmS2ZD/zyJzkeVTl71rH2PF6IwfqDZ54mZ/2QthoM7Q5CQJ3eMI3/wQzEtedAgm/7G1FGLwjbI/7KNaQcoysZa/x3k1fCZbF/P/Mkwaqdp4cs4oCvSwxzH8=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1771247013; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=HmIhAgr+tm1a7is75gZxhYFtYwpF5h9t9yTJ+rDVzqI=; 
	b=E+aRuHoQRYgOByYdK8JwU+i36fRUHTdiwBKr/UJligAFF6n3zyDdN0uKw1ZGBFpkBbkynP/KcqcEWVMZUmUf06vCT1X1Z8/UIp2pEkosjVPzLlHfjIKoJRtVebgoaiFJsga8cSkA3RlhKdxrxjmMhs2mbwzTTxWMQ39yV5C3+m8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771247013;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=HmIhAgr+tm1a7is75gZxhYFtYwpF5h9t9yTJ+rDVzqI=;
	b=XGb4hAvNRRF0ZDfN1WAN2Eanp5Ib7Hd/GLjvkH0SxR6/PB8A67SaMmC+0cEYjlec
	wi19JSo8+lcbQpEPg/4FahnQirwxtHbUPvAApr2UdLhP6pjmZnw0IUtFLJbmLod9JP0
	sBgrpGPyOGXI9rP6aYLJv/FzJWxFMkfxNVaQfm1k=
Received: by mx.zohomail.com with SMTPS id 1771247012992913.1286817983655;
	Mon, 16 Feb 2026 05:03:32 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 16 Feb 2026 14:01:30 +0100
Subject: [PATCH v8 16/20] drm/connector: Register color format property on
 HDMI connectors
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-color-format-v8-16-5722ce175dd5@collabora.com>
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

The drmm_connector_hdmi_init function can figure out what DRM color
formats are supported by a particular connector based on the supported
HDMI format bitmask that's passed in.

Use it to register the drm color format property.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/drm_connector.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 4d85add60d92..894811cd69d6 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -578,6 +578,7 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 			     unsigned long supported_formats,
 			     unsigned int max_bpc)
 {
+	u32 supported_drm_formats = 0;
 	int ret;
 
 	if (!vendor || !product)
@@ -627,6 +628,18 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 	if (max_bpc > 8)
 		drm_connector_attach_hdr_output_metadata_property(connector);
 
+	if (supported_formats & BIT(HDMI_COLORSPACE_RGB))
+		supported_drm_formats |= DRM_COLOR_FORMAT_RGB444;
+	if (supported_formats & BIT(HDMI_COLORSPACE_YUV444))
+		supported_drm_formats |= DRM_COLOR_FORMAT_YCBCR444;
+	if (supported_formats & BIT(HDMI_COLORSPACE_YUV422))
+		supported_drm_formats |= DRM_COLOR_FORMAT_YCBCR422;
+	if (supported_formats & BIT(HDMI_COLORSPACE_YUV420))
+		supported_drm_formats |= DRM_COLOR_FORMAT_YCBCR420;
+
+	if (!drm_mode_create_color_format_property(connector, supported_drm_formats))
+		drm_connector_attach_color_format_property(connector);
+
 	connector->hdmi.funcs = hdmi_funcs;
 
 	return 0;

-- 
2.53.0

