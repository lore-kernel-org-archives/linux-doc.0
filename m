Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AC8293DFC8F;
	Tue,  9 Jun 2026 12:46:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781009206; cv=pass; b=ESjZ7L2aNu74H8tfSNSJg9RbFAc29ZWrKq3HkPsz5englO2AieO0gDhpwJUbbGW1I8tNyPfMy+jMP0Q8GHncEOd3JwGQERTini/0cWbLVa4wT8XmZQNoc1oxFiceCVYLfpb71+ZeiOXGmctgu/PH5Z4jVrJuKZdtmK0T8vpP64I=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781009206; c=relaxed/simple;
	bh=RzCog9UnKBaWg5taOc01I4p5mFtQ+Jum8iYif9+LYGk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=mX7mPPDAl5qJGcGz0S3nd3uiiyIIC+cAgUQ8xh/bcU2BCJnCAp+0M1FDu12ZAhK+bBr2RvnJq7lOLY2ll/1b9v02BYhnAUdx6enxhRyZcPydaJLmK+4Q2i355kkwMCj8ZRVrDJnOv9hfMMFCs9wiIU6QC9DBsRIUEC/olJ2GFVQ=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=HWpuOkvI; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="HWpuOkvI"
ARC-Seal: i=1; a=rsa-sha256; t=1781009162; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=afJejeoG3OOw+CUq9ls1X226/iER59S3Ck+Bb7xuioTsCggxReXvntNtndXbVRER2z1chKEwuWcooLG6U+l3lgB6ivoQQmg7nbqySlVSoZWoe+hncogHWaHnz2aiPs1izw0Wc3ny/7lyPXB0TFtHx3tk46+261/+JwCLXd9Y1uE=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1781009162; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=9vPktzYkxEYQeJ67sQhefbSkE1bTIZj46s1NiCPokAk=; 
	b=YM3om/b42qHemAOuGG1/e7AftLzE6SjM6vL0wle4eLij5JsZOYvQWLIQwRuzfHDPTHFldT/M8HbrjHkmTKAiRxCvts86boigTmuRwrobcpa8W6idtyO5ixrAJLt9dPvBSy8UO1bWgl4QNc1D+PsfTyW1I/K9PKkCnI4Ilk4lfCY=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1781009161;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=9vPktzYkxEYQeJ67sQhefbSkE1bTIZj46s1NiCPokAk=;
	b=HWpuOkvIoSC4nIUnCMph9ClZmY9xhq76VMo4tPKehuvWtIQ+nRo7UlRbNd2Ty3EY
	CbeOYX80BbtePSUMbtuXBdsey1PTDu+t3qbOk8E/dQgHKj3MLdtgFFY1AB+FoutsMgx
	gMF6UbBwO07zw3+QDo5xYQ6KQs1k7TCpEaOWRJqw=
Received: by mx.zohomail.com with SMTPS id 1781009161082229.93501605093593;
	Tue, 9 Jun 2026 05:46:01 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Tue, 09 Jun 2026 14:43:58 +0200
Subject: [PATCH v17 11/28] drm/rockchip: Add YUV422 output mode constants
 for VOP2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-color-format-v17-11-35739b5782cc@collabora.com>
References: <20260609-color-format-v17-0-35739b5782cc@collabora.com>
In-Reply-To: <20260609-color-format-v17-0-35739b5782cc@collabora.com>
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

The Rockchip display controller has a general YUV422 output mode, and
some SoC-specific connector-specific output modes for RK3576.

Add them, based on the values in downstream and the TRM (dsp_out_mode in
RK3576 TRM Part 2, register POST*_CTRL_POST_DSP_CTRL).

Reviewed-by: Andy Yan <andyshrk@163.com>
Reviewed-by: Daniel Stone <daniel@fooishbar.org>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/rockchip/rockchip_drm_drv.h | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/rockchip_drm_drv.h b/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
index 2e86ad00979c..4705dc6b8bd7 100644
--- a/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
+++ b/drivers/gpu/drm/rockchip/rockchip_drm_drv.h
@@ -30,10 +30,14 @@
 #define ROCKCHIP_OUT_MODE_P565		2
 #define ROCKCHIP_OUT_MODE_BT656		5
 #define ROCKCHIP_OUT_MODE_S888		8
+#define ROCKCHIP_OUT_MODE_YUV422	9
 #define ROCKCHIP_OUT_MODE_S888_DUMMY	12
 #define ROCKCHIP_OUT_MODE_YUV420	14
 /* for use special outface */
 #define ROCKCHIP_OUT_MODE_AAAA		15
+/* SoC specific output modes */
+#define ROCKCHIP_OUT_MODE_YUV422_RK3576_DP	12
+#define ROCKCHIP_OUT_MODE_YUV422_RK3576_HDMI	13
 
 /* output flags */
 #define ROCKCHIP_OUTPUT_DSI_DUAL	BIT(0)

-- 
2.54.0

