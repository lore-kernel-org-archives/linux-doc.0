Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 603A42D63F6;
	Mon, 16 Feb 2026 13:02:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771246965; cv=pass; b=VAhDHfy2cBmJFabYrwek8UwR0yhVkqalYkCQHn4Ve9jRjtmMC+sT/FueqOf7YWEyaSKoPg/9tt4fCF3YnliZrwamey6+fFrZ1LvT58VjLuCia3xjbUweRJGzMI8r7Tx5w9PR4H4tEFDmh/jV0lxb2klOe9ClwogAF9fPdZQEBIE=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771246965; c=relaxed/simple;
	bh=NFondsDQ0hWFa8TjIDEK+znsqzFDtuf71ClJf1bwM0E=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hzosetEZOxp1wvW9mYO8BWiZTZWbjW2KuZJndQzBm2vthuZ66xKNPxePG+YaB52d96Mds9998Nu6WsiPb2QjEiXLV0E4S4V5WJ7mLlm+X6Ynqe/Y/ZvLmHWWGj888K2eIMIqXU9rElkySub4sZMuqF9ZAnpfly/9UK9Cd9T/ofQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=XV++WV77; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="XV++WV77"
ARC-Seal: i=1; a=rsa-sha256; t=1771246908; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=PUg9XPHq9tlDtYY08V8VS65c7SMplaU94ZnHHgp4VEpLUfuERE9d4blVkDCoUfBu7gmaQzB8aSZIacdmrmGPpz8+wr1FoOA9VR0NAbFL1iEi51+d9Q4HzFj6wZO65n6epMdMK/w1IS4ao/H1Vkt6fK/8OoQodkryr3q1Tc/jGeM=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1771246908; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=Ocgvj144ox473HVw3OzpKSQwBrz1+ydErGS9mpLqcwI=; 
	b=VoGXtpPGfMscs1D9+dnUM1SMEp5FVyE8e8z2Dwc33kfYV3cTHWGpUp9vSW6IilxeEQfTpcH1uwaBP+a6JqGmpiKbYSUcfzH0XogR0qACVH7x53qL/86DjljDtlW6VM9ZOC/O/11qX5DnKeCKX7yyXvVQAHgFZ/uZRBGru08Omp4=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1771246908;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=Ocgvj144ox473HVw3OzpKSQwBrz1+ydErGS9mpLqcwI=;
	b=XV++WV770yx+WNog9Vn6oDiAuencbbWHXjEgEG7N9zuHXB1h6ZilPByCMsMU5fjU
	uemr7429IHMxiO7K5Y0HkxxSCWkGXT/ECGSGsguPlCiyNzXMl2TjPoWg/RDY8Lv6A52
	yxY4IZjpEu6JDj8V7pzUUtqnupxs0xXFesvs6Z8I=
Received: by mx.zohomail.com with SMTPS id 1771246906640653.8907133675959;
	Mon, 16 Feb 2026 05:01:46 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Mon, 16 Feb 2026 14:01:15 +0100
Subject: [PATCH v8 01/20] drm/amd/display: Remove unnecessary
 SIGNAL_TYPE_HDMI_TYPE_A check
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-color-format-v8-1-5722ce175dd5@collabora.com>
References: <20260216-color-format-v8-0-5722ce175dd5@collabora.com>
In-Reply-To: <20260216-color-format-v8-0-5722ce175dd5@collabora.com>
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
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Werner Sembach <wse@tuxedocomputers.com>, 
 Andri Yngvason <andri@yngvason.is>
X-Mailer: b4 0.14.3

From: Werner Sembach <wse@tuxedocomputers.com>

Remove unnecessary SIGNAL_TYPE_HDMI_TYPE_A check that was performed in the
drm_mode_is_420_only() case, but not in the drm_mode_is_420_also() &&
force_yuv420_output case.

Without further knowledge if YCbCr 4:2:0 is supported outside of HDMI,
there is no reason to use RGB when the display
reports drm_mode_is_420_only() even on a non HDMI connection.

This patch also moves both checks in the same if-case. This  eliminates an
extra else-if-case.

Signed-off-by: Werner Sembach <wse@tuxedocomputers.com>
Signed-off-by: Andri Yngvason <andri@yngvason.is>
Tested-by: Andri Yngvason <andri@yngvason.is>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
index 47749ccc9c43..0db787ff24f3 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6704,12 +6704,9 @@ static void fill_stream_properties_from_drm_display_mode(
 	timing_out->v_border_top = 0;
 	timing_out->v_border_bottom = 0;
 	/* TODO: un-hardcode */
-	if (drm_mode_is_420_only(info, mode_in)
-			&& stream->signal == SIGNAL_TYPE_HDMI_TYPE_A)
-		timing_out->pixel_encoding = PIXEL_ENCODING_YCBCR420;
-	else if (drm_mode_is_420_also(info, mode_in)
-			&& aconnector
-			&& aconnector->force_yuv420_output)
+	if (drm_mode_is_420_only(info, mode_in) ||
+	    (aconnector && aconnector->force_yuv420_output &&
+	     drm_mode_is_420_also(info, mode_in)))
 		timing_out->pixel_encoding = PIXEL_ENCODING_YCBCR420;
 	else if ((connector->display_info.color_formats & DRM_COLOR_FORMAT_YCBCR422)
 			&& aconnector

-- 
2.53.0

