Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46D6E3F4859;
	Tue,  9 Jun 2026 12:46:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781009186; cv=pass; b=NvR1ss14zgrnOrLAn99p497Divk2Fg23CCKIx3NHZaFuuOQItnSd7tallMmh7kBMjmNgI/nEURF8KwVjhVaoZYX+MxWjurCLbvOwIbk7Lb+gMa8K9CBb/TFHVEdHS65LhP4WEUlC4RuzIJOSuGWgUaR/S1BE2/U4VaKhhecMc98=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781009186; c=relaxed/simple;
	bh=KpTOOdceGdKiVW3xCanu5SSmJb7q0EfkgzDBQy0mics=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hZ1KEgno6mt23Ent21/CvgvPXPKEPHpOs06o662918Jt4f/Fs5Ad14rLeeR6jg/Il4TyxICYig26uYP8/dMzzZXaPkdRbvh56M5axAIWKexndVYVXtnVTOyW/I8oc8fK2RSYmaZmL/+YY2IVpCXkCdU1HcDs8bvHgliv7K4fMAM=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=KPnvzj6M; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="KPnvzj6M"
ARC-Seal: i=1; a=rsa-sha256; t=1781009133; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=XL1K4KxS9eN21Ue0AVBU/YeexAMl9JTcAAxsENHtoWM7whHP/CGW7BltNUyQaUc/D3l3nBmK5KuEWYlFF3oTHk+VEwxfokMdUO5i7clEJbYpSgc465zllVYJX2ghiA9CtpntuQDvuL4cQa36YBu231cm53ummLj0GJ2sqkFmeeI=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1781009133; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=+D8gt1qbnvjZ4i1IAqhU6SPU/ANh62BLMa/rZeVLS3c=; 
	b=UtVV+7V6tqDO2eZAoByZaIMAHKk8ZZpAjOFh1CvviuIlrKFvRns7tlPEDkuSIhoXOc1E0urjjYSoYjq6b3k1e6FRGEwqKRH/f4oPxql5aZgr7bAfK7Rj6uJuL2V/inYfpHm7hw0tBUzJY63wvB9H8z87gC9wLrH4ImkE6OFXfG0=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1781009133;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=+D8gt1qbnvjZ4i1IAqhU6SPU/ANh62BLMa/rZeVLS3c=;
	b=KPnvzj6MT5nXuo7WneEC8v8HfutTg0pxp45TVXeMxvjTfJxKE1ReY568RjKhlNoS
	rYSkycDWYLnmiX5+TaN1BM8lmzIjNTzwabCca7uF51S3VEy8PCzvb6kmGq0Be3auNcM
	w2HBan5EMWSi/ceLZXJWj/qHviyzhglt1/TrBLyQ=
Received: by mx.zohomail.com with SMTPS id 1781009132302255.50490816820752;
	Tue, 9 Jun 2026 05:45:32 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Tue, 09 Jun 2026 14:43:55 +0200
Subject: [PATCH v17 08/28] drm/display: hdmi-state-helper: Act on color
 format DRM property
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-color-format-v17-8-35739b5782cc@collabora.com>
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
index c68b159f0a7f..069f9bf2489e 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -671,8 +671,39 @@ hdmi_compute_config(const struct drm_connector *connector,
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

