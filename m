Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C641748A2A2;
	Wed, 21 Jan 2026 13:47:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769003225; cv=pass; b=coMB28VSwJmOP+Xk7aEOL5gFDX6EccLtdgbeICJKF1mfxmCh1IjpmTMWqtwILDMM8baAtKgl1UGLadRQUBu99nsU7S7O6nc4oHr5C20ZMHK1YPXAm5xSBlyw4AzGYw0sk49+pLsWQwWnsMdhCaeMUbaIqQJQBFGhHVrrZqiU9Ng=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769003225; c=relaxed/simple;
	bh=H8IDfa33E/3Rwf/ddRKT1iyl+/q8KS5T5WwMUdUjalY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fUHRIg1KPj8VtjPNycvS7bCTFciRlJrJueWEFeEE6Tuz6+rRCeUx6Ul4a2PMDzEFqVmRP23DRvYR98BSrxDKlX+GIexu/tYwz6l0mWJObI7ZmeNVtMmwVnQMXUjhKu+PIAFh2zCB6ozCNRMhchCeIMmU/NfmfdZk9w08I9fFKmQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=ITAr1cTn; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="ITAr1cTn"
ARC-Seal: i=1; a=rsa-sha256; t=1769003186; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=G5uCFp0YQOV+6HqdtLpBQSuVszSxi1HdPRfmU1lYOjm+9q2qabyJO2R45T4/MD3Nt6tRn5TpuCVGmhmjGVmHG4e6Wvxb/wS26d3p0Zms9ZJx5a7rc8Vt6Tk9J683b0b1/gqrsTghlfxW31sAvTrg4atE/blvQsAd2X4TTRq0+FQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769003186; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=0ckm22GV4N5RkT5M/XROps5bGf+cWWlT/dPSb77qDWQ=; 
	b=k8kWF5oD+ZkzGHqb+jPcOaE2e5TErQFdapbqLqBH2OtyTE6u2L0tcfrvMguo5hkTkv26g9XsdOKJFpiLeKSUhT0EcqFwxHUY7h5SFr/0z3ng2vqUWW6txuhFhAcs3Wl/AUsAGUy8riJ7q3nlKNWUxW6fQCjdjHlNv7YtTA9+ERs=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769003186;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=0ckm22GV4N5RkT5M/XROps5bGf+cWWlT/dPSb77qDWQ=;
	b=ITAr1cTn0HbUhRe4BdHCYFDovQDXlDLF/3K8OItEr2NwPFPM+5JmIAIGGAtBfrA/
	4f085LQV2Q5NkSXgqzeVCrIbtXyUU0ejhdCjR5Vfrx69yKNiU0lTNZK8iaS/2aflXa/
	+OEba+Nz2cy3KDM1/QlbbTwgTjJ4FG0XVJFLgF7s=
Received: by mx.zohomail.com with SMTPS id 1769003184702668.8609552382727;
	Wed, 21 Jan 2026 05:46:24 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Wed, 21 Jan 2026 14:45:30 +0100
Subject: [PATCH v6 04/21] drm/bridge: Act on the DRM color format property
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-color-format-v6-4-7b81a771cd0b@collabora.com>
References: <20260121-color-format-v6-0-7b81a771cd0b@collabora.com>
In-Reply-To: <20260121-color-format-v6-0-7b81a771cd0b@collabora.com>
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

The new DRM color format property allows userspace to request a specific
color format on a connector. In turn, this fills the connector state's
color_format member to switch color formats.

Make drm_bridges consider the color_format set in the connector state
during the atomic bridge check. For bridges that represent HDMI bridges,
rely on whatever format the HDMI logic set. Reject any output bus
formats that do not correspond to the requested color format.

Non-HDMI last bridges with DRM_COLOR_FORMAT_AUTO set will end up
choosing the first output format that functions to make a whole
recursive bridge chain format selection succeed.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/drm_bridge.c | 79 +++++++++++++++++++++++++++++++++++++++++++-
 1 file changed, 78 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 6dcf8f6d3ecf..b0dfa03dbb81 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1116,6 +1116,47 @@ static int select_bus_fmt_recursive(struct drm_bridge *first_bridge,
 	return ret;
 }
 
+static bool __pure bus_format_is_color_fmt(u32 bus_fmt, enum drm_color_format fmt)
+{
+	if (fmt == DRM_COLOR_FORMAT_AUTO)
+		return true;
+
+	switch (bus_fmt) {
+	case MEDIA_BUS_FMT_FIXED:
+		return true;
+	case MEDIA_BUS_FMT_RGB888_1X24:
+	case MEDIA_BUS_FMT_RGB101010_1X30:
+	case MEDIA_BUS_FMT_RGB121212_1X36:
+	case MEDIA_BUS_FMT_RGB161616_1X48:
+		return fmt == DRM_COLOR_FORMAT_RGB444;
+	case MEDIA_BUS_FMT_YUV8_1X24:
+	case MEDIA_BUS_FMT_YUV10_1X30:
+	case MEDIA_BUS_FMT_YUV12_1X36:
+	case MEDIA_BUS_FMT_YUV16_1X48:
+		return fmt == DRM_COLOR_FORMAT_YCBCR444;
+	case MEDIA_BUS_FMT_UYVY8_1X16:
+	case MEDIA_BUS_FMT_VYUY8_1X16:
+	case MEDIA_BUS_FMT_YUYV8_1X16:
+	case MEDIA_BUS_FMT_YVYU8_1X16:
+	case MEDIA_BUS_FMT_UYVY10_1X20:
+	case MEDIA_BUS_FMT_YUYV10_1X20:
+	case MEDIA_BUS_FMT_VYUY10_1X20:
+	case MEDIA_BUS_FMT_YVYU10_1X20:
+	case MEDIA_BUS_FMT_UYVY12_1X24:
+	case MEDIA_BUS_FMT_VYUY12_1X24:
+	case MEDIA_BUS_FMT_YUYV12_1X24:
+	case MEDIA_BUS_FMT_YVYU12_1X24:
+		return fmt == DRM_COLOR_FORMAT_YCBCR422;
+	case MEDIA_BUS_FMT_UYYVYY8_0_5X24:
+	case MEDIA_BUS_FMT_UYYVYY10_0_5X30:
+	case MEDIA_BUS_FMT_UYYVYY12_0_5X36:
+	case MEDIA_BUS_FMT_UYYVYY16_0_5X48:
+		return fmt == DRM_COLOR_FORMAT_YCBCR420;
+	default:
+		return false;
+	}
+}
+
 /*
  * This function is called by &drm_atomic_bridge_chain_check() just before
  * calling &drm_bridge_funcs.atomic_check() on all elements of the chain.
@@ -1159,6 +1200,7 @@ drm_atomic_bridge_chain_select_bus_fmts(struct drm_bridge *bridge,
 	struct drm_encoder *encoder = bridge->encoder;
 	struct drm_bridge_state *last_bridge_state;
 	unsigned int i, num_out_bus_fmts = 0;
+	enum drm_color_format fmt;
 	u32 *out_bus_fmts;
 	int ret = 0;
 
@@ -1200,13 +1242,48 @@ drm_atomic_bridge_chain_select_bus_fmts(struct drm_bridge *bridge,
 			out_bus_fmts[0] = MEDIA_BUS_FMT_FIXED;
 	}
 
+	/*
+	 * On HDMI connectors, use the output format chosen by whatever does the
+	 * HDMI logic. For everyone else, just trust that the bridge out_bus_fmts
+	 * are sorted by preference for %DRM_COLOR_FORMAT_AUTO, as
+	 * bus_format_is_color_fmt() always returns true for AUTO.
+	 */
+	if (last_bridge->ops & DRM_BRIDGE_OP_HDMI) {
+		fmt = drm_color_format_from_hdmi_colorspace(conn_state->hdmi.output_format);
+		if (fmt < 0) {
+			ret = fmt;
+			drm_dbg_kms(last_bridge->dev,
+				    "Couldn't convert HDMI format to DRM format: %pe\n",
+				    ERR_PTR(ret));
+			goto out_free;
+		}
+		drm_dbg_kms(last_bridge->dev, "HDMI bridge requests format %s\n",
+			    drm_get_color_format_name(fmt));
+	} else {
+		fmt = conn_state->color_format;
+		drm_dbg_kms(last_bridge->dev, "Non-HDMI bridge requests format %s\n",
+			    drm_get_color_format_name(fmt));
+	}
+
 	for (i = 0; i < num_out_bus_fmts; i++) {
+		if (!bus_format_is_color_fmt(out_bus_fmts[i], fmt)) {
+			drm_dbg_kms(last_bridge->dev,
+				    "Skipping bus format 0x%04x as it doesn't match %s\n",
+				    out_bus_fmts[i], drm_get_color_format_name(fmt));
+			ret = -ENOTSUPP;
+			continue;
+		}
 		ret = select_bus_fmt_recursive(bridge, last_bridge, crtc_state,
 					       conn_state, out_bus_fmts[i]);
-		if (ret != -ENOTSUPP)
+		if (ret != -ENOTSUPP) {
+			drm_dbg_kms(last_bridge->dev,
+				    "Found bridge chain ending with bus format 0x%04x\n",
+				    out_bus_fmts[i]);
 			break;
+		}
 	}
 
+out_free:
 	kfree(out_bus_fmts);
 
 	return ret;

-- 
2.52.0

