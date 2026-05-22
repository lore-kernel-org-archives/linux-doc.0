Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DF3603A5E63;
	Fri, 22 May 2026 12:35:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779453312; cv=pass; b=iTxxmZ2p/stzTZpTAOWQ9pOd6gkIHaflRQCbvsYnMjGzHkHzvXkyNhRAvGEDSVRINX9j6sCTWu+FAxYcjlCOwlbMuDCQCkhdum5HeXiJtkFCkbSEMCpXmiknOE1T4KYLMYSJazSiF2nJhlYVU+WiTi05YhcGju2nLPiiGdeiJjo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779453312; c=relaxed/simple;
	bh=+HopfV6Mb3MVLY1T5o4QtyK7KZoYXnkhLa00+MRNtgA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IIMd+N8o//Eb4syjhG0BtbHRTZtasGVbwcgF4vgHExHbPx7vwdafWljJW02tNcpabXc277wzGegxIUN6aOseGl2utCF1TLp6nJT0oYfF3T+Ux9GnvJcWEjX943dqLzjfOVlsnd09iRFSHigVDVJYra0tKatEIRq+eweoU9NIqEw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=OVOmed0P; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="OVOmed0P"
ARC-Seal: i=1; a=rsa-sha256; t=1779453273; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=YPMMq7NusvK6Bj3HrT+FLrN3FYqh8zBZ9QVUncGgUJz2oYPMP93LGKLszA3AtMTNtMzdmAAzl7AtiIUakPORQl0jEN9mHNoAxaXYNaDlMP+M8aFUx231ll4+CSE+hB40ATlQ/F7bTDTlA9TV3HVkYli9Bsy0ELs6WmBlGrNaOnM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779453273; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=DV6mfkAbQV6voPpx9Am1gZxjiRVX5PkvnWH8fbLe4Ek=; 
	b=ZiLuhXuf7L7xkQlSjal0wUlEpGofHRWt5JmUw5gf4rWE/AdidIGNzEZ9VsCZ9dJF/HJFuEIX0iVyPdoD02bJN1PzEvxamJ8OB5wHgac4vsXm/KwzULjxBl5TBAT2OW5oegLLLzSpj7VnLxoyGkBZXREQyWkaZluqZv1vNUpDYfU=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779453272;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=DV6mfkAbQV6voPpx9Am1gZxjiRVX5PkvnWH8fbLe4Ek=;
	b=OVOmed0Pa4Y5q/6UbgDGc5WbPHNSqfvZVDOKmxOokIjVdA6MvofNrV1lC3wEV84w
	xAvWJTQx18AHZYKvltc8yyS8G/fEvA36HAvsFKYMqP9tWqry3MFrIPuhvQphLUCbdof
	QJFeuaIHg06s7/kgsnYoajRvK5mK4H+NucGfmE84=
Received: by mx.zohomail.com with SMTPS id 1779453271361527.8539943305431;
	Fri, 22 May 2026 05:34:31 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 22 May 2026 14:32:04 +0200
Subject: [PATCH v15 13/28] drm/i915/hdmi: Implement "color format" DRM
 property
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-color-format-v15-13-21fb136c9df2@collabora.com>
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

Implement the "color format" DRM property for HDMI. The values of the
property include RGB, YCbCr420, YCbCr444 and Auto. Auto will pick RGB,
with a fallback to YCbCr420.

The mask of supported formats by the source exposed by the property is
an optimistic scenario, as specific DFP-related caveats can't be
established before an EDID is present.

Should the explicitly requested color format not be supported by the
sink (or by the source in combination with the sink), then an error is
returned to userspace, so that it can make a better choice.

Reviewed-by: Daniel Stone <daniel@fooishbar.org>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/i915/display/intel_hdmi.c | 52 ++++++++++++++++++++++++++++---
 1 file changed, 48 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 97cb321e6568..9a2b17bba92e 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -2330,10 +2330,10 @@ static int intel_hdmi_compute_output_format(struct intel_encoder *encoder,
 	return intel_hdmi_compute_clock(encoder, crtc_state, respect_downstream_limits);
 }
 
-static int intel_hdmi_compute_formats(struct intel_encoder *encoder,
-				      struct intel_crtc_state *crtc_state,
-				      const struct drm_connector_state *conn_state,
-				      bool respect_downstream_limits)
+static int intel_hdmi_compute_formats_auto(struct intel_encoder *encoder,
+					   struct intel_crtc_state *crtc_state,
+					   const struct drm_connector_state *conn_state,
+					   bool respect_downstream_limits)
 {
 	struct intel_display *display = to_intel_display(encoder);
 	struct intel_connector *connector = to_intel_connector(conn_state->connector);
@@ -2368,6 +2368,35 @@ static int intel_hdmi_compute_formats(struct intel_encoder *encoder,
 	return ret;
 }
 
+static int intel_hdmi_compute_formats(struct intel_encoder *encoder,
+				      struct intel_crtc_state *crtc_state,
+				      const struct drm_connector_state *conn_state,
+				      bool respect_downstream_limits)
+{
+	struct intel_connector *connector = to_intel_connector(conn_state->connector);
+
+	switch (conn_state->color_format) {
+	case DRM_CONNECTOR_COLOR_FORMAT_RGB444:
+		return intel_hdmi_compute_output_format(encoder, crtc_state, connector,
+							respect_downstream_limits,
+							INTEL_OUTPUT_FORMAT_RGB);
+	case DRM_CONNECTOR_COLOR_FORMAT_YCBCR444:
+		return intel_hdmi_compute_output_format(encoder, crtc_state, connector,
+							respect_downstream_limits,
+							INTEL_OUTPUT_FORMAT_YCBCR444);
+	case DRM_CONNECTOR_COLOR_FORMAT_YCBCR420:
+		return intel_hdmi_compute_output_format(encoder, crtc_state, connector,
+							respect_downstream_limits,
+							INTEL_OUTPUT_FORMAT_YCBCR420);
+	case DRM_CONNECTOR_COLOR_FORMAT_AUTO:
+		return intel_hdmi_compute_formats_auto(encoder, crtc_state, conn_state,
+						       respect_downstream_limits);
+	default:
+		MISSING_CASE(conn_state->color_format);
+		return -EINVAL;
+	}
+}
+
 static bool intel_hdmi_is_cloned(const struct intel_crtc_state *crtc_state)
 {
 	return crtc_state->uapi.encoder_mask &&
@@ -2740,6 +2769,20 @@ static const struct drm_connector_helper_funcs intel_hdmi_connector_helper_funcs
 	.atomic_check = intel_hdmi_connector_atomic_check,
 };
 
+static void
+intel_hdmi_attach_color_format_property(struct intel_connector *connector)
+{
+	unsigned long fmts = BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444);
+
+	if (connector->base.ycbcr_420_allowed)
+		fmts |= BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR420);
+
+	if (intel_hdmi_can_ycbcr444(connector))
+		fmts |= BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444);
+
+	drm_connector_attach_color_format_property(&connector->base, fmts);
+}
+
 static void
 intel_hdmi_add_properties(struct intel_hdmi *intel_hdmi, struct drm_connector *_connector)
 {
@@ -2752,6 +2795,7 @@ intel_hdmi_add_properties(struct intel_hdmi *intel_hdmi, struct drm_connector *_
 
 	intel_attach_hdmi_colorspace_property(&connector->base);
 	drm_connector_attach_content_type_property(&connector->base);
+	intel_hdmi_attach_color_format_property(connector);
 
 	if (DISPLAY_VER(display) >= 10)
 		drm_connector_attach_hdr_output_metadata_property(&connector->base);

-- 
2.54.0

