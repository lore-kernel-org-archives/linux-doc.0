Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2C7AB39182A;
	Thu, 23 Apr 2026 19:06:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776971218; cv=pass; b=SruUM/ktN949abC0OeHTvNrn79TClk3fF4bRg1sjJE3M3i1heDEEPcGpICq10SjQawgHBIzNAkdpGiuuGMQ1WgAJvKgZ8qrA4LYickovubcQu0IU39taJaYq+glWCfVKGAwm5MZ8Gn0XUkaXXFeXctiK9JGpiZpJrxsIe3gdVs0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776971218; c=relaxed/simple;
	bh=UuBVEcKLuE+CJeRwp/JVd2kHVDq0W75NIdWonSS2SBs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=pPwUlPSqNWuXIR88NfQXIZz7QSJYAqiXt0+SS1qBay+UNZ9tEPv947yktUc+HYmz/hI9avcUQUBdTg1g2Bwa3GPyZLjjjBgyf9NpYCx6fFQHK9WqJKT2/4nGC4Xvqgz/KvgWCBr1ZgY9aRxh2eh/yzfSKkGb4SSl5PV+iubhlxA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=M4+h/Vm1; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="M4+h/Vm1"
ARC-Seal: i=1; a=rsa-sha256; t=1776971164; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GgNZRuhgYZLUU3UNLbdE5UL4+tcWiMr+MazuhdUOXI5lN1z4VMiL6PWEnjD0Aac4Y4S0FXBHZbm58XyX/a96iOnmZ49G8Ifj7U8GMLfkAdbZ7JE/BTI2vM6ykON3Y5Sa5Gh9g6MJ3UUCcou/6GAt3mqDYPPSdNdmQWI9zdRjvU0=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1776971164; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=FenlZU+Q9fcqz4rTVQF15NxhkdYoxpJFDd83oJEXDMg=; 
	b=AEigW8Mu9zbV9SKtoPOMut91Shz3ylD+XWG3RRKZrEoISDc5uHvvg5c28abjo5hoqq4VPwtxnvwPl1Ns7GEDni4hfHitOfQ8WtJ8qqBzoxix48HrDsLlIOllECBSdaLCqbmNQIfTt3GxWnS3lBHXsLiFzGL20KV3pqDuS+ENL3U=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1776971164;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=FenlZU+Q9fcqz4rTVQF15NxhkdYoxpJFDd83oJEXDMg=;
	b=M4+h/Vm1GwmI92iCZ4y39c/s2JTah9EK9YZwPGo6Bd+09UheJmE2Wg/tFvHCx6QA
	PG0RwYJ0EKukcR/Az9WG8HMFRLakdSyjT+mwY6Xpowytc3X3pNcHLgPBl696FwXIBnv
	kP9EiVB1HIPa7E0myKzI+ui+4X7D3F/CnDlidARI=
Received: by mx.zohomail.com with SMTPS id 1776971162363614.8510882440501;
	Thu, 23 Apr 2026 12:06:02 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 23 Apr 2026 21:03:40 +0200
Subject: [PATCH v14 17/28] drm/rockchip: vop2: Recognise 10-bit YUV422 as
 YUV format
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-color-format-v14-17-449a419ccbd4@collabora.com>
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

The Rockchip VOP2 video output driver has a "is_yuv_output" function,
which returns true when a given bus format is a YUV format, and false
otherwise.

This switch statement is lacking the bus format used for YUV422 10-bit.

Add the two component orderings of the YUV422 10-bit bus formats to the
switch statement.

Fixes: 604be85547ce ("drm/rockchip: Add VOP2 driver")
Reviewed-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_vop2.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
index d3b76e7e785e..59d15bacf023 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_vop2.c
@@ -352,6 +352,8 @@ static bool is_yuv_output(u32 bus_format)
 	switch (bus_format) {
 	case MEDIA_BUS_FMT_YUV8_1X24:
 	case MEDIA_BUS_FMT_YUV10_1X30:
+	case MEDIA_BUS_FMT_YUYV10_1X20:
+	case MEDIA_BUS_FMT_UYVY10_1X20:
 	case MEDIA_BUS_FMT_UYYVYY8_0_5X24:
 	case MEDIA_BUS_FMT_UYYVYY10_0_5X30:
 	case MEDIA_BUS_FMT_YUYV8_2X8:

-- 
2.53.0

