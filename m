Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A05852ED16D;
	Thu, 23 Apr 2026 19:05:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776971106; cv=pass; b=pUYJQ9dn8XuBscoVzYOUOWzXn4YkXdZwjPOCdwBy2VZ5smuLoqw19Wu+tsxohjG+Gnk/xlAUjZtgZQFcUMxzU+oPjOSDqBPytgiungYPZTj32EUFO5fE1c1eE2/ZCRHQxl43uIiM4qCSScORH+Y4CKZUTi5j4/fcPl3w3zjx76k=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776971106; c=relaxed/simple;
	bh=Wp4NfV6zQbz3ZHs0HXvhRGVTxQ4M2HPDwfqpKLgl3ls=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=XZMpXFLpYrAhtjjrbuAE0SKVgXY1/IU5Gdd/qYiIBfDl0UYBCpWyY0DqEvfpZRr2BcvsiNZBDQwJtWDFDXHSc8zxrnm/szuZ7X81zdgg0tEr7iUZc6XjbAzu8nMxj00uzeVyget9uarX2OuvvXziT2MkVjgGz1dsOOHAVEenaYw=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=gTZ2Rbsd; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="gTZ2Rbsd"
ARC-Seal: i=1; a=rsa-sha256; t=1776971041; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=Ju6YYhr0+laHV6wEVKiHy7VGATV9hTtLts/TM3g9M8DHBBB77TNqnHgirB8pVYQRqm6rL6vW8RUDiFF2yk1G1D5qEbd2nc1EREdDqlmpaAZxhdXUiFlowpqFnm5y97gOvMnMZtxPhoAnuSIDU1DKC7L88y9QloQkmyhpcgt2JF4=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1776971041; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=u5Rc4MlgAeapp6Hu/AOUGak4lAh2UA9S1HxUWuw1EyA=; 
	b=mSK32aQgxs8RwN+iA63KEgdZShbzkzE9tbsxPj+oheheoYc8AQPV1TpPXQ6zFRR5H4qaD2FFkHj9iqCT6AW+B+k2dJKqm/It79jKTQosbFH6wWwc4L3bU5W0oNW/C8b739N4eZjQnDmQQB7fI260LBoN5QWzCvkmFAnqBXSA9is=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1776971041;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=u5Rc4MlgAeapp6Hu/AOUGak4lAh2UA9S1HxUWuw1EyA=;
	b=gTZ2RbsdSii2RLUDM6EXTvaRvgG/JHw9E/CwjHSG7c8wLWAOV0ZMLRLvYwOUSpbp
	mvRTHJPu8CAL4deuowbs1YdEqfWeKRpAa7EqplMypTaVv0aWjpZZaIhDDy4h2nvyhCj
	LBO468sB67y4nLNLQDItynuriN8MMW9+e1W/g5m8=
Received: by mx.zohomail.com with SMTPS id 1776971040810802.2313714730848;
	Thu, 23 Apr 2026 12:04:00 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Thu, 23 Apr 2026 21:03:24 +0200
Subject: [PATCH v14 01/28] drm/amd/display: Remove unnecessary
 SIGNAL_TYPE_HDMI_TYPE_A check
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260423-color-format-v14-1-449a419ccbd4@collabora.com>
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
 Werner Sembach <wse@tuxedocomputers.com>, 
 Andri Yngvason <andri@yngvason.is>
X-Mailer: b4 0.15.2

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
index e96a12ff2d31..5b9fcfb45fd2 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6785,12 +6785,9 @@ static void fill_stream_properties_from_drm_display_mode(
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
 	else if ((connector->display_info.color_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422))
 			&& aconnector

-- 
2.53.0

