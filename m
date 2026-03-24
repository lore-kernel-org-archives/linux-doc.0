Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA3D339DBE1;
	Tue, 24 Mar 2026 16:03:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774368221; cv=pass; b=NwBV1D+SyPjIPFri9IGd0aLUCId2sJci1auWtJxLUVsG6BWYFOXjLaC0O10nnEQaB1OD9vJsY8JEK67DtgaqAMoatkWEwRaMpu+POzakbNAd4FTzq5A5WZ5NEdVLfJQxDaYWibVrC1ErM2BH8QestBHizvZoR6z146P9+0OdNQw=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774368221; c=relaxed/simple;
	bh=33Ww8J2K75Ej72XAJU8c8NggzCA+pSde82fd+km3Om4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=nzcRbA4agKixu2DvgYeOehf9E+jKHsIkNdStzz2lpCxmEplWY32otjeNKXn2wItjMm6Hftjrlj0Ty7ESUOCtlbCUu5Mr7voGgZ0xXgFmSsbpd2VmjpJdJSAq5JhzZWAm0SOsDJChDkYiOZnR+jRRkBOpDQVMbpAAVhs8r1XyNr4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=SmZGtqws; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="SmZGtqws"
ARC-Seal: i=1; a=rsa-sha256; t=1774368176; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=B7brx1kcvi3jD7vtfSLcVSOVvQxwydLZVcPn7f64iJJ7xU6y3bUP0XSC2d+xAindH/wSTim2+C+qGHCvnrGrV6ryfeLZnmb2QNhuYyAywAIOUIDRxuM3TlOuWWBF5+UQI0EpLWdO5f4HznTGYZ0uZ2pGDBNx5GtIqwQwrJbmplQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774368176; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=I6mnIoMwQGSuHjHjLVfRnXnzAB6xS7ZmlkuOJOt+Ckg=; 
	b=ZqijLuSRNwuAuwnAkvfh3dv/qHDdzHqBPFVMAIsNQLhZkAyqPmZV7HGS/6qB25rGcu4Zw85eMIb6qLvXVGj2bvsT++pBankTJAz6+ZprMTMBIK6UO13H1jBzMFoYhf25IiIKhstJXPTxk/aTII49xRImgdPyGcF3yby0oJKDFoo=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774368176;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=I6mnIoMwQGSuHjHjLVfRnXnzAB6xS7ZmlkuOJOt+Ckg=;
	b=SmZGtqwsUnVKnDteaAxdGdaInv42hAr0kp1JcPoH0hFpzTqjlRdc3bDlpKa13rBu
	jt2XowLeOKCcaAnzhq/N2k+USsLD0SGoD/xjXBvdI/8rJWRRGhhUuQV2eLuskDqijQI
	2OfZ8fGcKiPR6hY15SbRngCJs+BxvnFxBwghDcwc=
Received: by mx.zohomail.com with SMTPS id 1774368173593810.8682106833373;
	Tue, 24 Mar 2026 09:02:53 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Tue, 24 Mar 2026 17:01:14 +0100
Subject: [PATCH v11 10/22] drm/rockchip: Add YUV422 output mode constants
 for VOP2
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-color-format-v11-10-605559af4fb4@collabora.com>
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
 Andy Yan <andyshrk@163.com>
X-Mailer: b4 0.15.0

The Rockchip display controller has a general YUV422 output mode, and
some SoC-specific connector-specific output modes for RK3576.

Add them, based on the values in downstream and the TRM (dsp_out_mode in
RK3576 TRM Part 2, register POST*_CTRL_POST_DSP_CTRL).

Reviewed-by: Andy Yan <andyshrk@163.com>
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
2.53.0

