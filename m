Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9BD373921D6;
	Thu, 23 Apr 2026 19:07:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776971223; cv=pass; b=DOFwFVlSkof2p1v6X1xq+8DXYLoNWF32/P2lB9Z2G+I+rc+U2oP6K+oMipvAfbaUjFLfi1P2ySFCqM6IBR1chQgJHCuXRCe7G+aYSfVghR79sqgnmBAQ1UUg18IOJgTTqdBqjrJ3lKITLzlpK4pEsGgSrbhIgL64394S6ACbg2I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776971223; c=relaxed/simple;
	bh=iNiwSsSnPVBMyoSB5+mKiricdPGZxQewYcBlCN1ey+U=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=T4Lcup320SAATOEIJ22tCC9SbjUeFwCkN43lJgJ9y3qAW2HhzfUONi3AuEMZfcIFnseowdSfIqfwJpMMx1kXOVlNx4K0WJ0ovwBfA6P4D5MpuaASXqAViiRwkXwFX0Y0J4P0DzieUr5xKVHpTOIlciLAhoJyIs2AioRwKBDwCws=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=FU1U6SOB; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="FU1U6SOB"
ARC-Seal: i=1; a=rsa-sha256; t=1776971178; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=n5rHeV69vy/IH1I2tlYzPjMGjCLJDp7LRdp1XEYNmJzXTDCKJNjypBf2/FE7GHRov7ARRoPmTzkQg+8RX9PqBlLOkCgoAuG2LgkNg4+JDsMpEas3c5vH56eIDsX0f5a9wqm8mOXeJiG2QHVIULfwNQMP+i4N7VqwCKZNDU1ZRzQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1776971178; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=+F2WuEiqCUVykRB3XRC/Bxq6Gy1eCIr0ZWhVWJ26imU=; 
	b=ndEa/Y1KzBqpmeBtuTyne87hk5rcrJjKhJsADftVqM7zsGE+OwO8B4dAQAoeQEn7pLirB2vHAKwUlsLCpunlrtIkZeUQKKEgQiAtsXzazTw4OEq/3pByTQlniHIYbqwxPkCeEOgl455btL8Upm/Ukp6NtN/82UuhBU8XbV6ct4M=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1776971178;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=+F2WuEiqCUVykRB3XRC/Bxq6Gy1eCIr0ZWhVWJ26imU=;
	b=FU1U6SOBCPyVGMby6msTd70G91EeGnG49QQyz3r4mlWmFgCosMcj4NrSfYtKmUVO
	Y7DOslV170KZXTxcl8Mig9CED4srliKlu4IWXNud9TCd4VV9f1wPvKve0ga+y02Nwaj
	Du89bLcuAqp4X2v7GdWfL+eSBtZM552VKWrTE2pM=
Received: by mx.zohomail.com with SMTPS id 1776971177321905.6100501162525;
	Thu, 23 Apr 2026 12:06:17 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 23 Apr 2026 21:03:42 +0200
Subject: [PATCH v14 19/28] drm/bridge: dw-hdmi-qp: Use common HDMI output
 bus fmts helper
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-color-format-v14-19-449a419ccbd4@collabora.com>
References: <20260423-color-format-v14-0-449a419ccbd4@collabora.com>
In-Reply-To: <20260423-color-format-v14-0-449a419ccbd4@collabora.com>
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
 linux-doc@vger.kernel.org, wayland-devel@lists.freedesktop.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
X-Mailer: b4 0.15.2

Make use of the common drm_bridge_funcs.atomic_get_output_bus_fmts
helper for HDMI bridge connectors.

This allows dw-hdmi-qp HDMI bridges to participate in recursive bus
format selection in a meaningful way.

Reviewed-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index d649a1cf07f5..5380aa7d82a8 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -1192,6 +1192,7 @@ static int dw_hdmi_qp_cec_transmit(struct drm_bridge *bridge, u8 attempts,
 #endif /* CONFIG_DRM_DW_HDMI_QP_CEC */
 
 static const struct drm_bridge_funcs dw_hdmi_qp_bridge_funcs = {
+	.atomic_get_output_bus_fmts = drm_atomic_helper_bridge_get_hdmi_output_bus_fmts,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
 	.atomic_reset = drm_atomic_helper_bridge_reset,

-- 
2.53.0

