Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DDAC370D74;
	Tue, 24 Mar 2026 16:02:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774368170; cv=pass; b=EE8vNQsXLwyqpx4/E54wwPXD/xwm0SaFF5/ZaGuopIDpv0mnNmXoLeHJsemZSEUJsqTk+NZ1GhvHVHQsYt91wmRU2YwxNEAyV+WNk6afBH0O9nZN3JeR2F7Hh/x9Icb+dZAO2X+TF3pm4kdIdvQyr0Z8JEvgLUc4c8TJrc4wbg0=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774368170; c=relaxed/simple;
	bh=V48IT+aQhiArOnuOtmpjQ732fYUJQEiUvA0CwepEi0M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=VZgkdcHiw1xgKGy/OveWj4Ka5/eVoZmsvtyL9VLGQ7Yf4sh7lgO9l53WsnL2gGvAUfDo2uHFXOFHdHV0lOLvAH0kwg75wMmHr91FDY36foI6qR8C+WaQnDY/NpH7kkp+80/jPI/Xp6vGA/VDszBSspezfVLGgiqQIL4eeXJ1EWs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=P/FNneop; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="P/FNneop"
ARC-Seal: i=1; a=rsa-sha256; t=1774368107; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=GSHLWSvL1ey7UKnEBHr54QllXY25zi/iQYdBm7ghNiOOdAHUi8fcb6NpCFMfO+Qbc+cO/STQto2RMa2ohRzCJ0juDO8itcchMeh1NSB+QrkN/oMF/d1UktGUEqBCT5MF7NuxnvGNm+Yx0aOu/pKNxd8qWyz4ct7lkkkTHcd1fVo=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774368107; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=mu1XGj5EiVT5drNcReQYQM3PhOjoRRxgQTVeHo55NM8=; 
	b=cPx4mz3NM6wUCjjDUa7wMoSJOctK4qnKBGZjE91hXLlUlTEVqj7BDTBhRx7Pwkh7iYQGjAssKdK3tHrWmXOt/OXqiaKqzSPZZ2YVbtwtE7rDa9PMIbBX4P059F8C2Rg5BYjMt3tU63jR4CRxR9w4xApr4gRhoIKQ5B3owG1vApc=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774368107;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=mu1XGj5EiVT5drNcReQYQM3PhOjoRRxgQTVeHo55NM8=;
	b=P/FNneoplZ4So8iGyT1GqXJyB034CB0kLTbF3pDKjudgCA8V/XUqkaYs8yD35acY
	mLMDxTVIwJeMxR9AcQ0U/04UZ73EpIoCPca8bVGMiyPld1Qb1CHpWPbqpWxAEXMbMJ1
	cJFUvVdrz3WQeeO74tqIHbxWj5a95wDiK1PQnAz8=
Received: by mx.zohomail.com with SMTPS id 1774368105495460.86037447788044;
	Tue, 24 Mar 2026 09:01:45 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Tue, 24 Mar 2026 17:01:05 +0100
Subject: [PATCH v11 01/22] drm/amd/display: Remove unnecessary
 SIGNAL_TYPE_HDMI_TYPE_A check
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-color-format-v11-1-605559af4fb4@collabora.com>
References: <20260324-color-format-v11-0-605559af4fb4@collabora.com>
In-Reply-To: <20260324-color-format-v11-0-605559af4fb4@collabora.com>
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
 linux-doc@vger.kernel.org, 
 Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 Werner Sembach <wse@tuxedocomputers.com>, 
 Andri Yngvason <andri@yngvason.is>
X-Mailer: b4 0.15.0

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
index 646fbdd5688b..86a64e98e8a1 100644
--- a/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
+++ b/drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm.c
@@ -6713,12 +6713,9 @@ static void fill_stream_properties_from_drm_display_mode(
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

