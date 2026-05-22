Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5FCA53A1A41;
	Fri, 22 May 2026 12:34:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779453293; cv=pass; b=pXTJyi6gQb8bWxuS3EIyKmlT5Vv/FYCME3qixGfSE9sCNtv1k/xiQ15JE8K8mP9pxk04bcwYR+VQ4hYcSxBFGqsBYt8jEs1hlsr8cVQM/E4niTxSV7Tjj7EGj59RQkZavd7njXF7b231G0oVf9tfGPaBpX5eR3j/vr5QBRoACbA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779453293; c=relaxed/simple;
	bh=9r2fypuG80lw5nOtIJA4siqlM6nbNBk3tCAdl5n2PTQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QmMac7ZlOMA1SUVZy7Sma5aK0G/B9mzM4OpygeCQQxuuyCLe2FFyDR0dwLfOKryT3L0kJvYOdyzNnZHJC0SNKKGQ1fQ+AM78alHY7KFVy6+2STdRUVh03QIejseDhxm533vOMLdolE7PhK7NuiC9EWXiJiktzCcDa3WjLg9ELuo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=J2EgMZ/v; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="J2EgMZ/v"
ARC-Seal: i=1; a=rsa-sha256; t=1779453255; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=BcdsJ1K08oKXNS8C1UyaawvJkyWvgdGUI+QnL/O9XQ0tm7tpXD2iwqyjuJC5WtngiJaWDwb8zXaXDVmuvNm94AzYABIsSEIxYpuaVDzHGw7/gtuYE05BK/0GwWA77SBfKceWJ9P7Uvk2Gp/jJNsfS0CXtbAD7y2VcT+wAk8y00w=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779453255; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ywenQ69J/b7LlrDRwDze80PwdOeaNhyh73HTr8LVnNg=; 
	b=YQtZxlBsaDDhqXYyApzj4Yd7dQe5qXh2Z3DIC2xx0hUyKto9ICJhMFWdZ5T4YArVpXmdQB2LW5Kup9kSx4pIUC4zIo+1S1LWOAyscBb/e/SWA1AT1GDig21im0mgzPnLa3oZ08Hr+Fm6B7Irfg2euT3RhnBcEYndGsQH50yMRvI=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779453255;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=ywenQ69J/b7LlrDRwDze80PwdOeaNhyh73HTr8LVnNg=;
	b=J2EgMZ/vmCmU0sAmiieIoyV9DB+2wjimCW2ADfMDIf6zp0bq8qlU3pzShkvIfwQj
	Z9gGwO26LoYTgnE9YSjnoDORJ8X0KnfdgS3vz74onHCp5wvYHWOT/0OFShLgj6e3cNw
	KDYgD3kSzo2iCYy8qsA9V80Em8IvBi2CrNomqv0Y=
Received: by mx.zohomail.com with SMTPS id 1779453252764761.0499853718718;
	Fri, 22 May 2026 05:34:12 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 22 May 2026 14:32:02 +0200
Subject: [PATCH v15 11/28] drm/i915/hdmi: Add YCBCR444 handling for sink
 formats
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-color-format-v15-11-21fb136c9df2@collabora.com>
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
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
X-Mailer: b4 0.15.2

In anticipation of userspace being able to explicitly select supported
sink formats, add handling of the YCBCR444 sink format. The AUTO path
does not choose this format, but with explicit format selection added to
the driver, it becomes a possibility.

Check for YCBCR444 support on the sink in sink_bpc_possible, and on the
source and sink in sink_format_valid.

Acked-by: Daniel Stone <daniel@fooishbar.org>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/i915/display/intel_hdmi.c | 32 +++++++++++++++++++++++++++++++
 1 file changed, 32 insertions(+)

diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 9076c2b176ec..97cb321e6568 100644
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
@@ -2021,6 +2025,27 @@ intel_hdmi_mode_clock_valid(struct drm_connector *_connector, int clock,
 	return status;
 }
 
+/**
+ * intel_hdmi_can_ycbcr444 - Check whether connector can output YCbCr444
+ * @connector: pointer to &struct intel_connector to check
+ *
+ * Checks whether the hardware that backs @connector is capable of outputting
+ * YCbCr444 video over HDMI. Does not check whether currently connected sink is
+ * capable of receiving it.
+ *
+ * Returns: %true if source supports outputting YCbCr444, %false otherwise.
+ */
+static bool
+intel_hdmi_can_ycbcr444(struct intel_connector *connector)
+{
+	const struct intel_display *display = to_intel_display(connector);
+
+	if (HAS_GMCH(display))
+		return true;
+
+	return false;
+}
+
 static enum drm_mode_status
 intel_hdmi_sink_format_valid(struct intel_connector *connector,
 			     const struct drm_display_mode *mode,
@@ -2038,6 +2063,13 @@ intel_hdmi_sink_format_valid(struct intel_connector *connector,
 
 		return MODE_OK;
 	case INTEL_OUTPUT_FORMAT_RGB:
+		return MODE_OK;
+	case INTEL_OUTPUT_FORMAT_YCBCR444:
+		if (!intel_hdmi_can_ycbcr444(connector))
+			return MODE_BAD;
+		if (!(info->color_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444)))
+			return MODE_BAD;
+
 		return MODE_OK;
 	default:
 		MISSING_CASE(sink_format);

-- 
2.54.0

