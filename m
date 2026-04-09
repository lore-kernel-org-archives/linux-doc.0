Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217843E0C46;
	Thu,  9 Apr 2026 15:47:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775749654; cv=pass; b=a6glUnOADccf1zOTELFq6eccmurP7ng7xymN12DSzRHqzD9hLEQW1nnJD4g47nQZQullwW1YvUeuqw3oTKuW1DDvxsPRfDJNTm5lQRX8f0rn28obfPq43hh4iY3vJZoitdUYPdSbmljhvde70keUSIBDdTG99vbKj+iSNpaAUeQ=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775749654; c=relaxed/simple;
	bh=BWfad6dsFc96/e9qRCiDBDaxsh/8pv59t6F3kfsY980=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=L4kscSb8qACHnQPoRzAHU7rCWRaRr8V0aZwQGKQWpcLNvWFGjrUITmF+kGjXQReitB2xtkQ4G2vuQVofy1Fi85gcW+Y94l5wu/KC2KQsxTyLJwtPkIAeYtV3HxING0P+JHy4EtZpW1hwWhW5cG/U6flUR94Xgzts9Y19Uu32c9Q=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=X1I0CorB; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="X1I0CorB"
ARC-Seal: i=1; a=rsa-sha256; t=1775749606; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=A/D0q9m4FEc+VBcD5CPAC+Ml7VmpdM6MccWf5hIDQ/smid+13F1gynXR89Z/YIUYa2CzIDwoS8xITCZYUS3Vz5uJXrN3TGyEXt3sdH718o2t/yp5advTwoOzv8XOG8e7/QcvB+TaZz/TgsozJYBgUe3en0UF33TKBv8a/Hl/DHc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1775749606; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=pfuJgNlLA/GmqV8a4mWT/AFOH7DIYdQGAVlfIcknDY4=; 
	b=QY1Ud7LXRkeGPedtC97+EsSDQeHhiVRThovtrg46/wUsS0GfSE4TgajjarKHdI3VTr0fgX9c+u/LIgPS1B0cgFIO/UeeOGI2gBrfy20y0l+6W6BcS5/VLn+P3/W51PbSg+rAWX0FgVlErmPRlxoGwKqypycwCCly5vbgptkBelQ=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1775749606;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=pfuJgNlLA/GmqV8a4mWT/AFOH7DIYdQGAVlfIcknDY4=;
	b=X1I0CorBiVEuAVNjm0DZFxz0TluvAc/IsB+AGtu4SUpGISY11k0xEhPb9BJ72zDF
	Sh8v0q7YNr/UBSKj/xPZA8Q3klMrnBDBSYumVtALA8+cpXkkvV9n/Z5g+zOX+iR9sgz
	7CFw/U++5kNhp0yJFEfrHkkvZvLaOGaWJ2hIsEXE=
Received: by mx.zohomail.com with SMTPS id 1775749603657169.86328714073875;
	Thu, 9 Apr 2026 08:46:43 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 09 Apr 2026 17:45:01 +0200
Subject: [PATCH v12 11/25] drm/i915: Implement the "color format" DRM
 property
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260409-color-format-v12-11-ce84e1817a27@collabora.com>
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

Implement the "color format" DRM property for both DP and HDMI.  The
values of the property include RGB, YCbCr420, YCbCr444 and Auto. Auto
will pick RGB, with a fallback to YCbCr420.

The mask of supported formats by the source exposed by the property is
an optimistic scenario, as specific DFP-related caveats can't be
established before an EDID is present.

Should the explicitly requested color format not be supported by the
sink (or by the source in combination with the sink), then an error is
returned to userspace, so that it can make a better choice.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/i915/display/intel_connector.c | 10 +++++++
 drivers/gpu/drm/i915/display/intel_connector.h |  1 +
 drivers/gpu/drm/i915/display/intel_dp.c        | 38 +++++++++++++++++++++++---
 drivers/gpu/drm/i915/display/intel_hdmi.c      | 38 +++++++++++++++++++++++---
 4 files changed, 79 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_connector.c b/drivers/gpu/drm/i915/display/intel_connector.c
index 7ef9338d67ab..b1a21dd77af6 100644
--- a/drivers/gpu/drm/i915/display/intel_connector.c
+++ b/drivers/gpu/drm/i915/display/intel_connector.c
@@ -338,3 +338,13 @@ intel_attach_scaling_mode_property(struct drm_connector *connector)
 
 	connector->state->scaling_mode = DRM_MODE_SCALE_ASPECT;
 }
+
+void
+intel_attach_color_format_property(struct drm_connector *connector)
+{
+	const unsigned long fmts = BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444) |
+				   BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444) |
+				   BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR420);
+
+	drm_connector_attach_color_format_property(connector, fmts);
+}
diff --git a/drivers/gpu/drm/i915/display/intel_connector.h b/drivers/gpu/drm/i915/display/intel_connector.h
index 0aa86626e646..c77b7aac02cb 100644
--- a/drivers/gpu/drm/i915/display/intel_connector.h
+++ b/drivers/gpu/drm/i915/display/intel_connector.h
@@ -34,5 +34,6 @@ void intel_attach_dp_colorspace_property(struct drm_connector *connector);
 void intel_attach_scaling_mode_property(struct drm_connector *connector);
 void intel_connector_queue_modeset_retry_work(struct intel_connector *connector);
 void intel_connector_cancel_modeset_retry_work(struct intel_connector *connector);
+void intel_attach_color_format_property(struct drm_connector *connector);
 
 #endif /* __INTEL_CONNECTOR_H__ */
diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 47bd3d59ea93..3b2293415b55 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -3398,10 +3398,10 @@ intel_dp_compute_output_format(struct intel_encoder *encoder,
 }
 
 static int
-intel_dp_compute_formats(struct intel_encoder *encoder,
-			 struct intel_crtc_state *crtc_state,
-			 struct drm_connector_state *conn_state,
-			 bool respect_downstream_limits)
+intel_dp_compute_formats_auto(struct intel_encoder *encoder,
+			      struct intel_crtc_state *crtc_state,
+			      struct drm_connector_state *conn_state,
+			      bool respect_downstream_limits)
 {
 	struct intel_display *display = to_intel_display(encoder);
 	struct intel_dp *intel_dp = enc_to_intel_dp(encoder);
@@ -3437,6 +3437,34 @@ intel_dp_compute_formats(struct intel_encoder *encoder,
 	return ret;
 }
 
+static int
+intel_dp_compute_formats(struct intel_encoder *encoder,
+			 struct intel_crtc_state *crtc_state,
+			 struct drm_connector_state *conn_state,
+			 bool respect_downstream_limits)
+{
+	switch (conn_state->color_format) {
+	case DRM_CONNECTOR_COLOR_FORMAT_RGB444:
+		return intel_dp_compute_output_format(encoder, crtc_state, conn_state,
+						      respect_downstream_limits,
+						      INTEL_OUTPUT_FORMAT_RGB);
+	case DRM_CONNECTOR_COLOR_FORMAT_YCBCR444:
+		return intel_dp_compute_output_format(encoder, crtc_state, conn_state,
+						      respect_downstream_limits,
+						      INTEL_OUTPUT_FORMAT_YCBCR444);
+	case DRM_CONNECTOR_COLOR_FORMAT_YCBCR420:
+		return intel_dp_compute_output_format(encoder, crtc_state, conn_state,
+						      respect_downstream_limits,
+						      INTEL_OUTPUT_FORMAT_YCBCR420);
+	case DRM_CONNECTOR_COLOR_FORMAT_AUTO:
+		return intel_dp_compute_formats_auto(encoder, crtc_state, conn_state,
+						     respect_downstream_limits);
+	default:
+		MISSING_CASE(conn_state->color_format);
+		return -EINVAL;
+	}
+}
+
 void
 intel_dp_audio_compute_config(struct intel_encoder *encoder,
 			      struct intel_crtc_state *pipe_config,
@@ -7025,6 +7053,8 @@ intel_dp_add_properties(struct intel_dp *intel_dp, struct drm_connector *_connec
 
 	if (HAS_VRR(display))
 		drm_connector_attach_vrr_capable_property(&connector->base);
+
+	intel_attach_color_format_property(&connector->base);
 }
 
 static void
diff --git a/drivers/gpu/drm/i915/display/intel_hdmi.c b/drivers/gpu/drm/i915/display/intel_hdmi.c
index 5ab5b5f85cde..632498e3702b 100644
--- a/drivers/gpu/drm/i915/display/intel_hdmi.c
+++ b/drivers/gpu/drm/i915/display/intel_hdmi.c
@@ -2307,10 +2307,10 @@ static int intel_hdmi_compute_output_format(struct intel_encoder *encoder,
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
@@ -2345,6 +2345,35 @@ static int intel_hdmi_compute_formats(struct intel_encoder *encoder,
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
@@ -2729,6 +2758,7 @@ intel_hdmi_add_properties(struct intel_hdmi *intel_hdmi, struct drm_connector *_
 
 	intel_attach_hdmi_colorspace_property(&connector->base);
 	drm_connector_attach_content_type_property(&connector->base);
+	intel_attach_color_format_property(&connector->base);
 
 	if (DISPLAY_VER(display) >= 10)
 		drm_connector_attach_hdr_output_metadata_property(&connector->base);

-- 
2.53.0

