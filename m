Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EAD533C1B7;
	Sat, 23 May 2026 19:47:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779565679; cv=pass; b=Y4U0dlcQi3t+xPuJkK/sKWAnAubZaao1CKBZtp6g6JWj9qHlfSx7/ZCPZdZReiA+wr6woccAiXVAJldLkTU6OoiacJJIV2sOLnDSuwU4+s4VUDJ6IR56yYZwlyYc40GokeVUKjsj023YG9jBeoFpDxtmAWiRq4rkyYZRzNSvZps=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779565679; c=relaxed/simple;
	bh=YVFhdhu0ifCjzY8TeXFbVoxS/RgqhGi69wcr3Fgm1mc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Al4GGGTLKlfnBIqKVq2nYSTbhpV7ijH3yBXrCP8MpdZnF2Srz3y8rvcHdO6Ji7J3d2B8kpB/4/ADaq/S8T90XJUz0slv4HQksURWzOI7YxgoCFf98JXs5TPm5SKIiN2zIuitBLqjIZv6YrZ8j0aqbQXuLEVZQ7Jfv9W+0Hj+Bgo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=IVR20ofd; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="IVR20ofd"
ARC-Seal: i=1; a=rsa-sha256; t=1779565638; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=JrbjonNzI+mQaaLJ0SPhbyOXSKdrulhLNiYXND5ng9UfbccbLd504tgWg3G6Ap4gee/FDyRWfnWquZ2dPy8QtQ0t07Wz8SqTE6My0cR2/dEw4qvHZdFjK5QvR5pPM7Z04QMe9t/qVHEjgpK/8M+Ztv4n9OsJAVQ1DaLTXJsKmy0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1779565638; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=w+rvRwTHErnoW/oiRO6gZwI89/oq5YmE+EG+z0lw2W4=; 
	b=bd5MKnms93RjIZjEVhEkOVh9fIMjOivnC0VvHq9/8wO2joRVYlkw7CaFQKDz9INzmGrAxe17bRkShSizX1Hko0RCBvZn7BWcmER5mtcdPl+49JPzK7EO+DMOU8TtuiC3KEJ2ze7qgv9VLg00Cs6uGF6Tp7roEyr5vxvnV8GbGfw=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1779565638;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=w+rvRwTHErnoW/oiRO6gZwI89/oq5YmE+EG+z0lw2W4=;
	b=IVR20ofdo+7hZ8ArtRNr8bANMvzExuvXbvOW4aFWWTrQQN2Mzir+mF4GT27YGwCi
	l8B8Qtws3R/hy3ScncksDX9HSLnVZY0+/c4Kiv+vFELvJz//un46id5Kz3V9Anbe5lN
	yRhivT0AHE4IQYQCee5rOtsOgvLg82uDqmHmJNHc=
Received: by mx.zohomail.com with SMTPS id 1779565636760497.1391900149209;
	Sat, 23 May 2026 12:47:16 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Sat, 23 May 2026 21:43:53 +0200
Subject: [PATCH v16 18/28] drm/rockchip: vop2: Set correct output format
 for RK3576 YUV422
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260523-color-format-v16-18-24340c5e4732@collabora.com>
References: <20260523-color-format-v16-0-24340c5e4732@collabora.com>
In-Reply-To: <20260523-color-format-v16-0-24340c5e4732@collabora.com>
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
 Andy Yan <andyshrk@163.com>
X-Mailer: b4 0.15.2

For RK3576 to be able to output YUV422 signals, it first needs to be
able to pick the right output mode in the display controller to do so.

The RK3576 hardware specifies different output formats depending on the
used display protocol.

Adjust the written register value based on the SoC and connector, so
other users of vcstate->output_mode don't have to care about this.

Reviewed-by: Andy Yan <andyshrk@163.com>
Reviewed-by: Daniel Stone <daniel@fooishbar.org>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index a268bd2fbaaa..174e964d0411 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -1702,6 +1702,22 @@ static void vop2_crtc_atomic_enable(struct drm_crtc *crtc,
 	if (vcstate->output_mode == ROCKCHIP_OUT_MODE_AAAA &&
 	    !(vp_data->feature & VOP2_VP_FEATURE_OUTPUT_10BIT))
 		out_mode = ROCKCHIP_OUT_MODE_P888;
+	else if (vcstate->output_mode == ROCKCHIP_OUT_MODE_YUV422 &&
+		 vop2->version == VOP_VERSION_RK3576)
+		switch (vcstate->output_type) {
+		case DRM_MODE_CONNECTOR_DisplayPort:
+		case DRM_MODE_CONNECTOR_eDP:
+			out_mode = ROCKCHIP_OUT_MODE_YUV422_RK3576_DP;
+			break;
+		case DRM_MODE_CONNECTOR_HDMIA:
+			out_mode = ROCKCHIP_OUT_MODE_YUV422_RK3576_HDMI;
+			break;
+		default:
+			drm_err(vop2->drm, "Unknown DRM_MODE_CONNECTOR %d\n",
+				vcstate->output_type);
+			vop2_unlock(vop2);
+			return;
+		}
 	else
 		out_mode = vcstate->output_mode;
 

-- 
2.54.0

