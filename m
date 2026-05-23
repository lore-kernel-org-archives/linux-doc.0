Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A755033CEA8;
	Sat, 23 May 2026 19:48:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779565702; cv=pass; b=nf+vaPripy/j1aOZxrr+BGbF/ddi2IOeiEFSFiA1QCHmyXcBE1zcGlcpOZT3J2K86W8Bu1K1Dban26AF6sxljlFQic06ebdl6G86yB4gfPj6YDG+VW42RuwDucSefpHolpolvrQ5E6Kk8QFR0Pj6HFnrUjXU8FBMuBqa+R1pkWM=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779565702; c=relaxed/simple;
	bh=8OnRZDni6HH9HvO4zCenHyvoAS8DKLFX82SqKM+9pMI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FinGRrvchTvaPx2buKthBf7ywKw8o6d52uCIYvYg7zw13W9DvuoJEdQErOCNMWcsikp2XPQebbjpYJq8mKwHY1Yftz+cpzdqxIL1OstvNhFYCPZWPLXVI16+XN33nSU4otRoC84lK6CyclDTyyHwDjC/eOGDL2OxhGh3hb2Yy7o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=Ljb4h6WQ; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="Ljb4h6WQ"
ARC-Seal: i=1; a=rsa-sha256; t=1779565664; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=C5+ss83jlTWiNNN8SnL85UjX5I0culn6swToROnHeDDIr2oFCgak1aAMENv4ALK4Q5FkyTjdwJ1h5/sQO4ThtxgRr4zhjMht2ixR2wvQ1ZQBGCBrSj+lvFIdm01x9Nr0MUjOP2LKXjHwdwU+J4QxWQso6xazws0syTxDEoM+ggs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779565664; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=8uhvifl0KjV7h78DpGOaJw8xIKxgprEXatY1NDwlp1s=; 
	b=ZZ6FgfHnAt+wFMZxs5x0zLmWHdKbIuPztCq68A9pa8JElcmeWc6YUSXLGrYdbh0VH4fuePZflrlb3APZ2Yk8WIYLh7H11H02+LoftmRIxeREInGdVSVeTbKW38vADgpp+lN9EPIPAH5SjTS800IgmtyjeQ+b+hXe4zo6abKZ2x8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779565664;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=8uhvifl0KjV7h78DpGOaJw8xIKxgprEXatY1NDwlp1s=;
	b=Ljb4h6WQFoe5ixZNfzJ7P1Wyw4reyAuieM717GU5bWV3/PcIybphms4Y9a+pxjkl
	Vyhuryw7ewXDJxJpmf6aTIKC6iPb26NP/TBqQazlTKhNLede/yS/hs9dPSi+4heTuj/
	32NgHGnNoEdvdb95MQORnTyQOfOP9kLeKY+iarRc=
Received: by mx.zohomail.com with SMTPS id 177956566336735.659644389422056;
	Sat, 23 May 2026 12:47:43 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Sat, 23 May 2026 21:43:56 +0200
Subject: [PATCH v16 21/28] drm/rockchip: dw_hdmi_qp: Set supported_formats
 platdata
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260523-color-format-v16-21-24340c5e4732@collabora.com>
References: <20260523-color-format-v16-0-24340c5e4732@collabora.com>
In-Reply-To: <20260523-color-format-v16-0-24340c5e4732@collabora.com>
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
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
X-Mailer: b4 0.15.2

With the introduction of the supported_formats member in the
dw-hdmi-qp platform data struct, drivers that have access to this
information should now set it.

Set it in the rockchip dw_hdmi_qp glue driver.

This allows this information to be passed down to the dw-hdmi-qp core,
which sets it in the bridge it creates, and consequently will allow the
common HDMI bridge code to act on it.

Reviewed-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Reviewed-by: Daniel Stone <daniel@fooishbar.org>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index b77ef92ae954..815f9ea7bcbe 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -602,6 +602,10 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 	plat_data.phy_data = hdmi;
 	plat_data.max_bpc = 10;
 
+	plat_data.supported_formats = BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444) |
+				      BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444) |
+				      BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422);
+
 	encoder = &hdmi->encoder.encoder;
 	encoder->possible_crtcs = drm_of_find_possible_crtcs(drm, dev->of_node);
 

-- 
2.54.0

