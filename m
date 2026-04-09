Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3363C3E1CFC;
	Thu,  9 Apr 2026 15:47:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775749638; cv=pass; b=RK/n60qr1gpNAURwZ8vyBCEYAwQKUA2y40wT4LUOE1zdcctfT4YOG2qHDb0jUBhkTwGBHM8if8KlmXuVyg1LsGCBDD8jpYNsjSe662KbRTsMBBWQ4OVe31JrSG3CBAAru0fMMv0iPr7g68sgrQ3Od1mKN2AE+qXOJkuKUzlKM28=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775749638; c=relaxed/simple;
	bh=CQvhIL8bp45gUrZ2sL53DPuooXKu+NG/516Muv0XxV4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GfHSX1afp+DWH2X/ggdYzZkV7tCdgRxLl8R88rzewX/TNcUcIPjlrkkBSb8EW2NCV5fpNm5IIQFk5JZglITlFZXJAmL/rIwpq0/3NYeKYL7Wq1npw+dlSoLPS8ueQ/72GSNhu6C6v2YMY63X0UUe7M+aF0dPzCc6vxDpcgACznA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=d/lDfGRX; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="d/lDfGRX"
ARC-Seal: i=1; a=rsa-sha256; t=1775749590; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=d9hVQQgBZxtk2jSjGoxQszpmgE283ubTfD1ay/q8ClUOfIEC7gCy0emKSC82uNT0BK38wQUe9M+XTxK9iNPu3qpNL0BPqZ3BwveRwmdlL1AEd4PS6gQ/PQqG3VMq1Gysn5lxgh+JQFqRa8HJVTjW3uwdwIj3YdNyoqWTwuIBrPQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1775749590; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=HabY2i2E1+ddRtoi01o8V7PD9YzY5+x/Zz9iixg8p/8=; 
	b=CD5U+pjJRjlMFs7GYAkciFY+sszE+LIfxDZAsXDSGpxXmUsxR1LFeY1lPxbi1sJBtNu2BaRtlpEH4cvj9/Ev5tSOeuJU1fU/0Q980bia7JGbMAWHfk8tZIe9RHUW+/+ifjSRFvSsZq0P5+YT2K+puRHZWSuZBxj/RW1O910zEFU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1775749590;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=HabY2i2E1+ddRtoi01o8V7PD9YzY5+x/Zz9iixg8p/8=;
	b=d/lDfGRXVTeICgRO9fMpDUqg+wHe062GKyr1g1H9DYy/GH65ZTfamjU3y2gdp75A
	ZLwUK/hvIvNx5p/OUCoZM7UHAgOUiXjtBqAPEzZ1v60YxOVkV4CHQju5ujmr/MoywgN
	lK8KtRJvK8zSuVM23ba1ZxixislDRFY36bWu/AVI=
Received: by mx.zohomail.com with SMTPS id 1775749588943862.3819059768608;
	Thu, 9 Apr 2026 08:46:28 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 09 Apr 2026 17:44:59 +0200
Subject: [PATCH v12 09/25] drm/i915/hdmi: Add YCBCR444 handling for sink
 formats
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-color-format-v12-9-ce84e1817a27@collabora.com>
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
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.15.1

In anticipation of userspace being able to explicitly select supported
sink formats, add handling of the YCBCR444 sink format. The AUTO path
does not choose this format, but with explicit format selection added to
the driver, it becomes a possibility.

Check for YCBCR444 support on the sink in both sink_bpc_possible, and
sink_format_valid.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/i915/display/intel_hdmi.c | 9 +++++++++
 1 file changed, 9 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 874076a29da4..5ab5b5f85cde 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -1966,6 +1966,8 @@ static bool intel_hdmi_sink_bpc_possible(struct drm_connector *_connector,
 
 		if (sink_format == INTEL_OUTPUT_FORMAT_YCBCR420)
 			return hdmi->y420_dc_modes & DRM_EDID_YCBCR420_DC_36;
+		else if (sink_format == INTEL_OUTPUT_FORMAT_YCBCR444)
+			return info->edid_hdmi_ycbcr444_dc_modes & DRM_EDID_HDMI_DC_36;
 		else
 			return info->edid_hdmi_rgb444_dc_modes & DRM_EDID_HDMI_DC_36;
 	case 10:
@@ -1974,6 +1976,8 @@ static bool intel_hdmi_sink_bpc_possible(struct drm_connector *_connector,
 
 		if (sink_format == INTEL_OUTPUT_FORMAT_YCBCR420)
 			return hdmi->y420_dc_modes & DRM_EDID_YCBCR420_DC_30;
+		else if (sink_format == INTEL_OUTPUT_FORMAT_YCBCR444)
+			return info->edid_hdmi_ycbcr444_dc_modes & DRM_EDID_HDMI_DC_30;
 		else
 			return info->edid_hdmi_rgb444_dc_modes & DRM_EDID_HDMI_DC_30;
 	case 8:
@@ -2038,6 +2042,11 @@ intel_hdmi_sink_format_valid(struct intel_connector *connector,
 
 		return MODE_OK;
 	case INTEL_OUTPUT_FORMAT_RGB:
+		return MODE_OK;
+	case INTEL_OUTPUT_FORMAT_YCBCR444:
+		if (!(info->color_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444)))
+			return MODE_BAD;
+
 		return MODE_OK;
 	default:
 		MISSING_CASE(sink_format);

-- 
2.53.0

