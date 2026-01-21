Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7B32E4BCACC;
	Wed, 21 Jan 2026 14:47:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769006878; cv=pass; b=notR+0uLT8NI7cN7EzbCQmaWOsfie597pHip1stdRZQYK9AP0TI7ThRt1HaCqcPvto29eIePbtUdnP8o+MTx05SvNQlx7wDXMTXZTp2BF2DPVawYVjtm3B9sJg+j/uSsmD/924ttbGUHyL3b0y8A80sIvdXxdv1sM5Qd+GlWuCw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769006878; c=relaxed/simple;
	bh=dwiB4KxN1atZahOj6DgSdoTJqSArDtozDq87JdA04RU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AB3nBGUKPoCh7woGEvrtjf79KioL/YGWHa4MqjgXGGptknFK4C9gJpGLSoc6GjO8S7n+VkQo3Qv04itxJU2ffmOzIDWouQ/x9VprdZxOSPMYpIM7dFHS7XeByYXbjKZ/wt1JbOOsNZn1+W6b3qmwVspuEGtS5h/qWwtfTPNw+us=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=GEWfMdEV; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="GEWfMdEV"
ARC-Seal: i=1; a=rsa-sha256; t=1769006830; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=AiTcUWXhEbLLpTdJAQ7EZXhonNSadnFVS6iCb4CQhb54nCKiIKg/4HYBLFPa0N+MCNbMvLmeCmgAeq/MGBavcSn9/DbHXl6rCBfzHeh6AorIJXTcYgJFBYRIhXZwrRPc9xq/2TcwK6YW6sbWe7I6IQIVOxWhwoiuKgXpy4TgrmU=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769006830; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=fvHVPCg2cs6DtR2tisxMC9k+ePCvaV4nGam51l3RVf4=; 
	b=E7I+jHjwud5BFOUY1rManCAO1gb9RqkIbr5ou8JV9yoTCtcIZPQNnhW581EUbyOAM7zOUlNLT2oOSP7XnXJ4dQn9A+BBSrWYensx0Vvny1vlwXl+leBRRsrTErun4KGn4928Rgtzo+WoHe9ksL30H9eUseL6oxV3u4tRge3s6LA=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769006830;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=fvHVPCg2cs6DtR2tisxMC9k+ePCvaV4nGam51l3RVf4=;
	b=GEWfMdEVa5GOcAVLhAOqBmORdISe8v+G524zkiM55tPPHjAYi4sreadvGEMf7CmM
	WIkbIwq7lQmbuIGxKc6anuiQn24LMFfvGlykXYavtkshzZKP+3VgicyZ+RjxOjtV6EZ
	A57+H6iAElpVKsNctjEc+HpHE6sEwgWSexI+lT9U=
Received: by mx.zohomail.com with SMTPS id 176900682770059.27763468853357;
	Wed, 21 Jan 2026 06:47:07 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Wed, 21 Jan 2026 15:45:19 +0100
Subject: [PATCH v7 12/22] drm/rockchip: vop2: Recognise 10/12-bit YUV422 as
 YUV formats
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-color-format-v7-12-ef790dae780c@collabora.com>
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

The Rockchip VOP2 video output driver has a "is_yuv_output" function,
which returns true when a given bus format is a YUV format, and false
otherwise.

This switch statement is lacking the bus format used for YUV422 10-bit,
as well as the bus format used for YUV422 12-bit.

Add MEDIA_BUS_FMT_YUYV10_1X20 and MEDIA_BUS_FMT_YUYV12_1X24 to
is_yuv_output's switch cases to resolve this.

Fixes: 604be85547ce ("drm/rockchip: Add VOP2 driver")
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 3 +++
 1 file changed, 3 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index f21efbca42e6..3dd7b7571487 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -369,6 +369,9 @@ static bool is_yuv_output(u32 bus_format)
 	switch (bus_format) {
 	case MEDIA_BUS_FMT_YUV8_1X24:
 	case MEDIA_BUS_FMT_YUV10_1X30:
+	case MEDIA_BUS_FMT_YUYV10_1X20:
+	case MEDIA_BUS_FMT_UYVY10_1X20:
+	case MEDIA_BUS_FMT_YUYV12_1X24:
 	case MEDIA_BUS_FMT_UYYVYY8_0_5X24:
 	case MEDIA_BUS_FMT_UYYVYY10_0_5X30:
 	case MEDIA_BUS_FMT_YUYV8_2X8:

-- 
2.52.0

