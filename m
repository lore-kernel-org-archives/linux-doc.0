Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB2DF318ED5;
	Wed, 21 Jan 2026 14:46:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769006811; cv=pass; b=aRtYh0BCymOllVCG58iqL/QrPl7x9uuRrHvhXpA3M5DR2M2oDzFt0FIkQ5O8ONs5w74bFTlYks807gX61E8AaTJr52N3oTKSlbbpTdhfGErTQURvgtGLxIiaTJnZmKBDLuvHQ5PuQiKzS922TLooKZ6fYRhNAI2hKakrdbYKeQU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769006811; c=relaxed/simple;
	bh=o3N5tcYGKoIArMIpmw2JDc3JL0RxRGbrrhWm1f7+3Fc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=X1gnEDFer0liEfX4JTG2ibpMjT+6V3kZ/JjGX1rh7FGa4dhrYAoAu7TwDX3QLArYgrDDw9KiXXLlvkxbysQUb4rS0u98DzS2obRd2ej2tl/c8RBAmyQgumE64+Yapf+hJL4hN4a7e127L84EnhNcUz7VWXB3AHTErANYHITbLaw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=Sf6GbYJo; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="Sf6GbYJo"
ARC-Seal: i=1; a=rsa-sha256; t=1769006771; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Y95cA4B0qN8ORjKzxrSdQcBrl1u3QTODqukbl9qLHddqIdZlNIbXsngKgkY04n/sMGm9mgXU3H5ZQSM4aLDMLv74d0IlrP9uZNWsjMUCbLzK4sVw6jqpcWqhEg0swBGF/8+DoBHrH6Dr/eU7BVoCfVZ2969fSRn1GMqJrUH0zxg=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769006771; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=rvJgPMT+HU5WR06OrKvq+eql2T6omfgWB+OE+x/UWsw=; 
	b=LMefyqtiNuwsB3K6tR6E1lh+zsCUyCeLddNFPcHcutpIZs7KR70MAYH8T/EnB4UZXj/D2jO5FL3MojGF0c81MZfJYrVW61dEhD/4X77/76nnOjZzxN+9Od3urcC/yD38Jdo2NzlPRjRshAI18+vJPo1WJjR7nC08S0f0HeqhY1U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769006771;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=rvJgPMT+HU5WR06OrKvq+eql2T6omfgWB+OE+x/UWsw=;
	b=Sf6GbYJoOLEinskfIKGTf7gszUm3BZH8xFlzdVvn3QUOE7FVRVoH9TI8Qp4C1kpJ
	s4DarNldIcS9GphWI4Qp+M5WlgKMdBytZ3RkpXvwu2SfIXcDkuboIcQGy31Z6JbdayW
	sK9ItB4bThz43cnuLbVQkqV+r+Sg8NIMpKJqW8dk=
Received: by mx.zohomail.com with SMTPS id 1769006770485357.33139956056084;
	Wed, 21 Jan 2026 06:46:10 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Wed, 21 Jan 2026 15:45:12 +0100
Subject: [PATCH v7 05/22] drm/display: hdmi-state-helper: Act on color
 format DRM property
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-color-format-v7-5-ef790dae780c@collabora.com>
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

With the introduction of the "color format" DRM property, which allows
userspace to request a specific color format, the HDMI state helper
should implement this.

Implement it by checking whether the property is set and set to
something other than auto. If so, pass the requested color format, and
otherwise set RGB.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index a1d16762ac7a..1ea3b9c93aa5 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -649,11 +649,21 @@ hdmi_compute_config(const struct drm_connector *connector,
 	unsigned int max_bpc = clamp_t(unsigned int,
 				       conn_state->max_bpc,
 				       8, connector->max_bpc);
+	enum hdmi_colorspace hdmi_colorspace =
+		drm_color_format_to_hdmi_colorspace(conn_state->color_format);
 	int ret;
 
 	ret = hdmi_compute_format_bpc(connector, conn_state, mode, max_bpc,
-				      HDMI_COLORSPACE_RGB);
+				      hdmi_colorspace);
 	if (ret) {
+		/* If a color format was explicitly requested, don't fall back */
+		if (conn_state->color_format) {
+			drm_dbg_kms(connector->dev,
+				    "Explicitly set color format '%s' doesn't work.\n",
+				    drm_get_color_format_name(conn_state->color_format));
+			return ret;
+		}
+
 		if (connector->ycbcr_420_allowed) {
 			ret = hdmi_compute_format_bpc(connector, conn_state,
 						      mode, max_bpc,

-- 
2.52.0

