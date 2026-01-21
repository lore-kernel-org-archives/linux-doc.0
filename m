Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 091E348C8B2;
	Wed, 21 Jan 2026 13:48:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769003290; cv=pass; b=uYusQo9e6C+Pv/QzLBcLuiIJ9auj1+gaSBeQVvELjqEZhUj5EbMT7I3USiO1hm8+w2gxSsRrH3FIgNsYH/ZnQJU7ueIPzrhfk1GzAbba5ySNJupW92JjMnjLfoWKg+rnXW2rfYc5bpe6ejhtdMc1WFjp9QUHsBYv2SFJSID+4tU=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769003290; c=relaxed/simple;
	bh=JPVfYjUX3OD5GgTz7y9plNcl6a+kbU1TnF3jJ0NUBVI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=JbKwnfpKaQK9H0zbLwhVv2J6bsgmA5y/4SPyXSuSp4pvJo8ueJmVfnyT8BpNnvTcUS76/N6fpGzoVgClsoNLOTPJNtQvsstYhWgQwQUkrzCMFO/54d/1wDVCkGlrZrkCRREtasTBCkouw/ned8u4vQnm0PgIo/1O2IIOKNUg3Y8=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=TtLJrf6r; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="TtLJrf6r"
ARC-Seal: i=1; a=rsa-sha256; t=1769003243; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=gQFeVGXPu322I8LHIi1pOCe3ad1SJcCenJZUSL46hUjsW5oKuMbw4F20vkxzgEuIh4C98oS8DXv+NDDF4Q1slcF10O5DyN8K3ufh5nQqk9DhBFkJnk9Nh/7/iyL5kvukJd8laomCUhKsjx8vodc9PMlKsxeJzzw0GGFJksfMYF0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769003243; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=BVlWFy+uln/7HZGtNZyE3zWD720ugtjkEgr5dYIdu1M=; 
	b=lINRhoScCHE3KHGvIt1Cd6JIplaBHJYwUnarjGPIuvC5NtTBWC/bssU1m9KtbINH21aovqRAVZapPos5OGzz3+/4F9DbXjPtAhUfC/SeG1OWcEQyJ47BJtuYH0mAWxXM6Pl5+3klFVZ4hsugIk84SPh2bvNFMXndcXiDpEbwte4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769003243;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=BVlWFy+uln/7HZGtNZyE3zWD720ugtjkEgr5dYIdu1M=;
	b=TtLJrf6r7bTGFZ2vhXnSGWhHOkZW+o0licFle6PY0o4uPFUyHqN6A/vcFoKSdedA
	Rr/Hl0qX7PSzFAP+OnaSy0p00GIh7854Uir94eW2zt9z+E6xoyRElWn1X0tdpc8Bn3o
	W73372c03tQ/QPkl1X9WIJLDZ6WI34fhnBnaFSlc=
Received: by mx.zohomail.com with SMTPS id 1769003242285684.1445788059525;
	Wed, 21 Jan 2026 05:47:22 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Wed, 21 Jan 2026 14:45:37 +0100
Subject: [PATCH v6 11/21] drm/rockchip: vop2: Add RK3576 to the RG swap
 special case
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-color-format-v6-11-7b81a771cd0b@collabora.com>
References: <20260121-color-format-v6-0-7b81a771cd0b@collabora.com>
In-Reply-To: <20260121-color-format-v6-0-7b81a771cd0b@collabora.com>
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

Much like RK3588, RK3576 requires an RG swap to be performed for YUV444
8-bit and YUV444 10-bit bus formats.

Add its version to the already existing check for RK3588, so that YUV444
output is correct on this platform.

Fixes: 944757a4cba6 ("drm/rockchip: vop2: Add support for rk3576")
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 3 ++-
 1 file changed, 2 insertions(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index 469c63dd97d5..f21efbca42e6 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -354,7 +354,8 @@ static bool vop2_output_uv_swap(u32 bus_format, u32 output_mode)
 
 static bool vop2_output_rg_swap(struct vop2 *vop2, u32 bus_format)
 {
-	if (vop2->version == VOP_VERSION_RK3588) {
+	if (vop2->version == VOP_VERSION_RK3588 ||
+	    vop2->version == VOP_VERSION_RK3576) {
 		if (bus_format == MEDIA_BUS_FMT_YUV8_1X24 ||
 		    bus_format == MEDIA_BUS_FMT_YUV10_1X30)
 			return true;

-- 
2.52.0

