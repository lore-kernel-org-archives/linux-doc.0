Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C8BAC3A759B;
	Fri, 22 May 2026 12:35:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779453325; cv=pass; b=Xt6apq811lv4VSKOTKsA4ByAEHxSuuvBYVJ5kCSPHpIh1uTePIi3sBlC/98JE1STIw3Z+jA7m5VQ8t1F70beAap4HHORuK3kWsbbYBq8GRNM5YP+6wWbMtLKxng9+idQymKt6/MGBnSaa+/Vxb2dHMoom7Y7mgiU0zvDrOFYtLw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779453325; c=relaxed/simple;
	bh=68QRHjcP3052/1NjyvS9MpSCX5IokZ1B0lJOzgMQ+EE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=eG4vn8HGzP5u6kOEXljENm35zzCy51/wXJx+mVGuTsFO/wWo3mv5z6ozmRmHPBWZ9KLX42uiHHOl7IYr4/4aAVADZBh5+B9szs//+VHSJKkvvyoXaX1/ABaruAEo2DiBRw3/77kjjLjlQtDILll0Ola0RRhfbZ4nombeOBDmVUY=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=UkycH1wI; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="UkycH1wI"
ARC-Seal: i=1; a=rsa-sha256; t=1779453283; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PA9w8C18cuFh0hgAHArTv3Y+1+3dL0jRQLxmiEGCu8K1Nvu+Ca0d5TxL9BeVAW7bouxH8SyXPgqRJD+8nk9DaueVdW9Fzg8mClZi1XmrIZcyTPgrOl/RBDD3F6Mc/lWJVgq5pbtXDTmS8+wbq+VpaodtdaO9LAibIzP922DcVfY=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779453283; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=5omWCMcSq9SbEyxk6K5YZ717nLlxbBSQdsTOUDmRNDE=; 
	b=Fw0c4N8U4TMp9kQrXXjjHM5VLqukXQ9kQFrDt6I3GYvj0Fuou89kFOY2JKf1ro14oRCpMgOF362QiKffxgjbHA0BGZtclb53qvUkpGN6hKF16f9IHfuYhFnAAB3BQzj+YKIV6xhHs/Gdba/xUDQEBBVAXjGKesOy/giNDl1NK84=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779453283;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=5omWCMcSq9SbEyxk6K5YZ717nLlxbBSQdsTOUDmRNDE=;
	b=UkycH1wIQ8vOvbc7MHefzo4Eoa+UFQeFgjdemnCxHeKVJkz1F2DA7CZaEjZbUGwM
	tc96rtCDpZMrSzHppIBydPCVtD5A63cSZmGz9swsqCod7QSK/869rMCdoTS5lllHPWh
	niHeXtDZ9T8jX3P8NNKj4LTSsePdGcPoZKP/1XZ8=
Received: by mx.zohomail.com with SMTPS id 1779453280591371.7485348952348;
	Fri, 22 May 2026 05:34:40 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 22 May 2026 14:32:05 +0200
Subject: [PATCH v15 14/28] drm/i915/dp: Implement "color format" DRM
 property
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-color-format-v15-14-21fb136c9df2@collabora.com>
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

Implement the "color format" DRM property for DP. The values of the
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
 drivers/gpu/drm/i915/display/intel_dp.c | 61 ++++++++++++++++++++++++++++++---
 1 file changed, 57 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/i915/display/intel_dp.c b/drivers/gpu/drm/i915/display/intel_dp.c
index 143ed85224be..c18c5e034738 100644
--- a/drivers/gpu/drm/i915/display/intel_dp.c
+++ b/drivers/gpu/drm/i915/display/intel_dp.c
@@ -3436,10 +3436,10 @@ intel_dp_compute_output_format(struct intel_encoder *encoder,
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
@@ -3475,6 +3475,34 @@ intel_dp_compute_formats(struct intel_encoder *encoder,
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
@@ -7028,6 +7056,29 @@ intel_dp_has_gamut_metadata_dip(struct intel_encoder *encoder)
 	return false;
 }
 
+static void
+intel_dp_attach_color_format_property(struct intel_dp *intel_dp)
+{
+	struct intel_connector *connector = intel_dp->attached_connector;
+	struct intel_digital_port *dig_port = dp_to_dig_port(intel_dp);
+	unsigned long fmts = BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444);
+	bool has_pcon = false;
+
+	if (!connector)
+		return;
+
+	if (dig_port && intel_bios_encoder_is_lspcon(dig_port->base.devdata))
+		has_pcon = true;
+
+	if (has_pcon || source_can_output(intel_dp, INTEL_OUTPUT_FORMAT_YCBCR420))
+		fmts |= BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR420);
+
+	if (has_pcon || source_can_output(intel_dp, INTEL_OUTPUT_FORMAT_YCBCR444))
+		fmts |= BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444);
+
+	drm_connector_attach_color_format_property(&connector->base, fmts);
+}
+
 static void
 intel_dp_add_properties(struct intel_dp *intel_dp, struct drm_connector *_connector)
 {
@@ -7060,6 +7111,8 @@ intel_dp_add_properties(struct intel_dp *intel_dp, struct drm_connector *_connec
 
 	if (HAS_VRR(display))
 		drm_connector_attach_vrr_capable_property(&connector->base);
+
+	intel_dp_attach_color_format_property(intel_dp);
 }
 
 static void

-- 
2.54.0

