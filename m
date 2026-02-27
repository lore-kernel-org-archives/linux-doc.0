Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D5A50421EEB;
	Fri, 27 Feb 2026 19:21:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772220115; cv=pass; b=fP3xQh+Sw/Q6UxmkkCO/lB/wFY0nl5zmqatIZ8yHxUrwrZ7nwxC5jnD0tvPDWNKMJFCtZSfuNs8MkcaNDkUZjdaLJtSggmh3RQzlom4DMggqsNdP6b4mn9t84/GsXZxYqK/jVDx6Zlo1jE6LsL5Jk0PpWmQ8yhq90hPFqb4QweA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772220115; c=relaxed/simple;
	bh=8/6dZLGyHaumszjvnOlf9NZOsCJG7tfdI+VYSP9mNTA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GBps0rBM/tjrAX1DgmjAvszxIETWR29tduaXW5aDNIUOCNupFwCdYlBP95iwO3GPjSPn7NPR0wB2rd3Kraql6A3gUq9AuSD+ePryviqRTnbUr/XhFI2rcKXgOmTchH7hdWO3wE+eu7XLElGrQq2PHP+/zt1f+BFctyFaK5w+Rm4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=QMCG0Fg2; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="QMCG0Fg2"
ARC-Seal: i=1; a=rsa-sha256; t=1772220065; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=CuDtymhFYBZKAp4fGdd2gpif9YWaDf+JeJJ+ImGvix0qeFNETuBWQYtYhBYgpq2I0cQZWyl8wedtjuDSVmeAtCaPhLCGrr7h+4ymI9tVVoVBKC+Akczk8diUbBb1f9CSCxPDjbWny+3athkkW70ihT6H/b6uF4HzAPhN3vJqVxg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1772220065; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=7CRAmTFQCtq+1fmVyGcK9BYvQbCYnvTEoio6+jtAKiI=; 
	b=mTa+TVkdHMYMHNKMjOktCKWVMRJx9eYj+RS0KdfuRzaCtRC5+/aUNpVr2QCDookul3xyGjfdpg+s/R165cjnw1HCou14Y1KeDawNtHXFahh7Ypwv3swcMpjqz9e+rbh7StYlu0c+CZyPZ8BMqO01MRC2AhceMQ11gjZqjhIuDfA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1772220065;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=7CRAmTFQCtq+1fmVyGcK9BYvQbCYnvTEoio6+jtAKiI=;
	b=QMCG0Fg20PpjZuW8trMWkofAxH7FKBIRjKUH4CvoPnIVYAUQK/cOUnYa0YaMcIYM
	fW+uEEikuPV4avBJ+GMz1OsAE64w6citd4HdGmbZpeLn45Jyc+AqTD9jyYVOASm4iUf
	b1bSBQKn6YiHj44iq7zUkCfA7P+z194if/V6TaV8=
Received: by mx.zohomail.com with SMTPS id 1772220064429633.5205645122492;
	Fri, 27 Feb 2026 11:21:04 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 27 Feb 2026 20:20:09 +0100
Subject: [PATCH v9 04/19] drm/display: hdmi-state-helper: Act on color
 format DRM property
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260227-color-format-v9-4-658c3b9db7ef@collabora.com>
References: <20260227-color-format-v9-0-658c3b9db7ef@collabora.com>
In-Reply-To: <20260227-color-format-v9-0-658c3b9db7ef@collabora.com>
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
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.14.3

With the introduction of the "color format" DRM property, which allows
userspace to request a specific color format, the HDMI state helper
should implement this.

Implement it by translating the requested drm_connector_color_format to
a drm_output_color_format enum value as per the logic HDMI should use
for this: Auto is translated to RGB, and a fallback to YUV420 is only
performed if the original color format was auto.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 28 +++++++++++++++++++++++--
 1 file changed, 26 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index 9f3b696aceeb..31c6d55fa995 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -669,10 +669,34 @@ hdmi_compute_config(const struct drm_connector *connector,
 	unsigned int max_bpc = clamp_t(unsigned int,
 				       conn_state->max_bpc,
 				       8, connector->max_bpc);
+	enum drm_output_color_format fmt;
 	int ret;
 
-	ret = hdmi_compute_format_bpc(connector, conn_state, mode, max_bpc,
-				      DRM_OUTPUT_COLOR_FORMAT_RGB444);
+	switch (conn_state->color_format) {
+	case DRM_CONNECTOR_COLOR_FORMAT_AUTO:
+	case DRM_CONNECTOR_COLOR_FORMAT_RGB444:
+		fmt = DRM_OUTPUT_COLOR_FORMAT_RGB444;
+		break;
+	case DRM_CONNECTOR_COLOR_FORMAT_YCBCR444:
+		fmt = DRM_OUTPUT_COLOR_FORMAT_YCBCR444;
+		break;
+	case DRM_CONNECTOR_COLOR_FORMAT_YCBCR422:
+		fmt = DRM_OUTPUT_COLOR_FORMAT_YCBCR422;
+		break;
+	case DRM_CONNECTOR_COLOR_FORMAT_YCBCR420:
+		fmt = DRM_OUTPUT_COLOR_FORMAT_YCBCR420;
+		break;
+	default:
+		drm_dbg_kms(connector->dev, "HDMI does not support color format '%d'.\n",
+			    conn_state->color_format);
+		return -EINVAL;
+	}
+
+	ret = hdmi_compute_format_bpc(connector, conn_state, mode, max_bpc, fmt);
+
+	if (conn_state->color_format != DRM_CONNECTOR_COLOR_FORMAT_AUTO)
+		return ret;
+
 	if (ret) {
 		if (connector->ycbcr_420_allowed) {
 			ret = hdmi_compute_format_bpc(connector, conn_state,

-- 
2.53.0

