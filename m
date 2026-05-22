Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D2FF93B0AEF;
	Fri, 22 May 2026 12:33:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779453235; cv=pass; b=sNo0VD+wObow/G0elIlZKSSwtdbT6OP4w8e2kRhZHIvYOkdgKqd+pALZcHlww/odNACKwI0+JVGu3mqTTZMzdhFLBTZg5NZgeBM+21dI34wCat44NoMPWekQxkkm8R4CNJv+rF30HT9HPayebudzIU0vC+ZDb7YAhbpjdGyD4As=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779453235; c=relaxed/simple;
	bh=7C0S8luKg8WsGBq+n95dh9ef0EUoZDoANkgU/Vjd6iI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FegTyS3/8rjWFVNBGJiYdC1l2CiOcx3jqxPIhs+ZaE8v4lwHHJxUkrLzOELtdmAdbNpgSA+SvC2D6q7EyX+THaF+eiFzI8Zypm+GDwPL3aaq+v79s3v2Iw0ZqrhsIKh2GggiTa8LUSvgk05MTwrsZ+5mDolBrXinQtz1/1IVLAQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=E+0vEgQF; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="E+0vEgQF"
ARC-Seal: i=1; a=rsa-sha256; t=1779453196; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=TQ7sZ5ZDXsh6bkc+pWPvqVuGmaAip993AkWQokl1Lv1UveisHZLobOq8X+0kTsb1G7lczXEJSQZETrwDn0GkuN0wHH+we6G+Vjvi9dn9nntoZTJdVHioZqxuX3T91R1rKtBZ/XmThhqU6bYy0Bs81s1nNtbqDpKEW3O/UlJ0cKs=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779453196; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=ydwMnyAzyOCfy2Y9vA8jDchcJAW3pPAmLiksvoQsJDo=; 
	b=fQjaRQWBUkpr+p1X2dieB9K35KgzmlRJsqk86zUpQGsaXeKbRfIKB6KMLOJqgtoh9l3s5PHijNhwmuEo1QTwTp+IHINgWywpxfuoPd6q7mt+Y2lCttbdgsZZACJwV7s23PP11UalcH+FOrO95iJBlYQbiHEvoDfktS9L3tMBbuE=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779453196;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=ydwMnyAzyOCfy2Y9vA8jDchcJAW3pPAmLiksvoQsJDo=;
	b=E+0vEgQFvN43E6DAvkQ41c1GBM0hA40szc24h4I8qK1Ijux9/yn72SJAhAuPHkjZ
	wOxkKZxFZZqtiDlegaKf+qkvMUz59GP9CcHuOEw6fLs3oWKvcR3gRvyGLQB3pQN+BBV
	Iy+7Dqfut6j2y1SHXHCRsnny4En/d99i+kNEgUDk=
Received: by mx.zohomail.com with SMTPS id 1779453195920933.0602592632248;
	Fri, 22 May 2026 05:33:15 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Fri, 22 May 2026 14:31:56 +0200
Subject: [PATCH v15 05/28] drm/display: bridge_connector: Use HDMI color
 format for HDMI conns
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260522-color-format-v15-5-21fb136c9df2@collabora.com>
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
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
X-Mailer: b4 0.15.2

For bridge connectors which contain an HDMI bridge at some stage, the
HDMI state helpers' format selection logic should be involved.

Add an implementation for the drm_bridge_funcs color_format function,
which translates from the HDMI state's output format to a connector
format for bridge connectors involving an HDMI bridge, but return the
connector state's color_format member unchanged otherwise.

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Reviewed-by: Daniel Stone <daniel@fooishbar.org>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 24 ++++++++++++++++++++++++
 1 file changed, 24 insertions(+)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 649969fca141..19da5f668942 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -276,6 +276,29 @@ static void drm_bridge_connector_reset(struct drm_connector *connector)
 							 connector->state);
 }
 
+static enum drm_connector_color_format
+drm_bridge_connector_color_format(const struct drm_connector_state *conn_state)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(conn_state->connector);
+
+	if (bridge_connector->bridge_hdmi) {
+		switch (conn_state->hdmi.output_format) {
+		default:
+		case DRM_OUTPUT_COLOR_FORMAT_RGB444:
+			return DRM_CONNECTOR_COLOR_FORMAT_RGB444;
+		case DRM_OUTPUT_COLOR_FORMAT_YCBCR444:
+			return DRM_CONNECTOR_COLOR_FORMAT_YCBCR444;
+		case DRM_OUTPUT_COLOR_FORMAT_YCBCR422:
+			return DRM_CONNECTOR_COLOR_FORMAT_YCBCR422;
+		case DRM_OUTPUT_COLOR_FORMAT_YCBCR420:
+			return DRM_CONNECTOR_COLOR_FORMAT_YCBCR420;
+		}
+	}
+
+	return conn_state->color_format;
+}
+
 static const struct drm_connector_funcs drm_bridge_connector_funcs = {
 	.reset = drm_bridge_connector_reset,
 	.detect = drm_bridge_connector_detect,
@@ -285,6 +308,7 @@ static const struct drm_connector_funcs drm_bridge_connector_funcs = {
 	.atomic_destroy_state = drm_atomic_helper_connector_destroy_state,
 	.debugfs_init = drm_bridge_connector_debugfs_init,
 	.oob_hotplug_event = drm_bridge_connector_oob_hotplug_event,
+	.color_format = drm_bridge_connector_color_format,
 };
 
 /* -----------------------------------------------------------------------------

-- 
2.54.0

