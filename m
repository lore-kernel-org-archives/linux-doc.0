Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3995E4C0420;
	Wed, 21 Jan 2026 14:48:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769006918; cv=pass; b=s1vZzyvuHF6SskmDmBHCUfK80B2yup5poqfE0NA7shpHz/hR6nMZ5AVkFdJld2jx7NIPNuftcrVlPUnJG+zDCRaggdokbtvaOKYQ18HMeW9HNGWXBbScC8LrlDPCarV5iF82k8tnnALPQeozKEujdciYCQobDXVPBUI4m5JIgEI=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769006918; c=relaxed/simple;
	bh=kYUvX4VWIqQY42N4+2f/xJqkpni/kz2cDS5JUSARJDM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nkAlEiOsTVcxuU67xPEgvILWstUpsfsFeayynlDYoRg6Bn6QkfUwogTLBy0NSMfwd2lS6HSB5AkjtKKoEOvFV5m7gfHtO0KSQN8X40/legvBdFaZMilo6I1++6UdT6QYkX6HoZyW+8YOCOFyQQ33vS69P+qIV/odWextuaLBAKk=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=RvHUrq0J; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="RvHUrq0J"
ARC-Seal: i=1; a=rsa-sha256; t=1769006868; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=cLEc7lNUMGffaxUuGsh83JjETFSUEc1nAJuICcGPNKLjfqhwLphkBa5T5QCvUSkMr1arK44a4Z2/BOiGFtVWpDNwOcGKpzHEms2st3ZCKn1qRWVysA8jgXgYifEVrEXEF63SqXgyl05rs5emTXnPB7Nn73Sbb9RmHCxx3WB5Ayw=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769006868; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=UmmyhH2kEcgrSrjVTktapZnGINLmFhU3USp0HY1A94I=; 
	b=gUz6cbqBjUWJQJaRG63wTDwLZjE5WAUCwsaqYYteie7nnWsj/Lv5bOeHk9Fucq59ZmxSKgjqZP5iLFKsCZLpB4SIitmSIv9+3jRzpRv+Ds5N1UUjoaCbDOVXaWvpM06k+xllotEV3nNHU3lX/JG204w0XbmVtJcCJe3r9/1Mo8E=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769006868;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=UmmyhH2kEcgrSrjVTktapZnGINLmFhU3USp0HY1A94I=;
	b=RvHUrq0JTgkNnr6AN2yWvVKljrpZZnkPpMrucwRbzzQ4P+/0XOW++XVwxV2J5uAP
	NwEqPz5o2Inld1SnhNdcFrGyJsORl/QXWWZyDHLEjvXDU8eTuDN3kGE2XXN/Jmm8w2d
	nMH3FakbPR9prF69gqoymOn2NAe73NQfzHtr4nSE=
Received: by mx.zohomail.com with SMTPS id 1769006866935682.0418790851954;
	Wed, 21 Jan 2026 06:47:46 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Wed, 21 Jan 2026 15:45:24 +0100
Subject: [PATCH v7 17/22] drm/connector: Register color format property on
 HDMI connectors
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-color-format-v7-17-ef790dae780c@collabora.com>
References: <20260121-color-format-v7-0-ef790dae780c@collabora.com>
In-Reply-To: <20260121-color-format-v7-0-ef790dae780c@collabora.com>
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

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/drm_connector.c | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 507787619b80..1bec7e5c2215 100644
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
2.52.0

