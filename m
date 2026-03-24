Received: from sender4-pp-f112.zoho.com (sender4-pp-f112.zoho.com [136.143.188.112])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BEE823CF048;
	Tue, 24 Mar 2026 16:04:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.112
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774368273; cv=pass; b=AbiBbKb7zw5qNb9gTrXfJusweUDD3Ds5y1UBnQMHhdrNhFZIxGyNfAde6jXcXnSYksGeIohUdraQ27zxgaOv0H9rt1INLZv/7uGi86T+1Lo7ghE80o056dVA6BAu8hIk5vCesND9dOOjZZban18gn+2Pqlo7/OFezHLqI18jp6w=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774368273; c=relaxed/simple;
	bh=P8e3aQeIlPRvVj0zAIJ3xM6IWqBw/UlDTgPnDZmM8X0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=DfhEmbetL0BliVzaFH97yH4a9dFFG4FeKyJSGW7y3F4O00sJ2sWiE+TiGRfTvrW5GgapwwLXq5zzAXZCHeQtNu1dyPw/sDR6KGxs3J2q/iIuzTpWAU4ofiRnsMKuKu39Kyv8i376H4QWMSvG2URRMDS6gtBuRb4iMNJUcXf41zg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=Ip/ReNo8; arc=pass smtp.client-ip=136.143.188.112
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="Ip/ReNo8"
ARC-Seal: i=1; a=rsa-sha256; t=1774368220; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=lyRIb74b+5JewRV+amJa5Cw4ceMru9ILeBJPl460i1oj1x63EH4x5TtJ3mlGt4a/54ldjq7iynqoAMWq+N9hNtmz+IvapCz2wafCbMJsj+mBi40NRUIWGYM+TZCU9F3j4EMyw0OtUeQi/scjvUtangxpsimmgPze0eRsZAju8GQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1774368220; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=lB0j2lq2LWsiJngjiTH6IKajspe0V1BafT22AHF3h7Q=; 
	b=VGooJGWabgHas4msgI+vxel/HRU7BaXTZej5nNClXii72V7d75YYwH0y4HXl5E4l0rSTa4MdA7At2ckdepIfL/g7d+uNRlOH/MLrsqHREMrbfbgY/ZtbGxOBwm03/tLQ32X4/vj8HXBywAg3udDKi+PZRQ3ALn5S3J8PDd74S2c=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1774368220;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=lB0j2lq2LWsiJngjiTH6IKajspe0V1BafT22AHF3h7Q=;
	b=Ip/ReNo80mujw4qLUYVl1GBerxPUCg/ZnDKgyimSY+FSHZ0GmPW0Uczw3sel++gX
	yr8dHUQT26ZSaYX5lUElmMRahrBEl3UeRhn8JZUDO9Bai76kK7vShnEehUEO+Qff55O
	HAksHxJGHuvbKql71fchu+40CQ1PP0ny0sXJtwCM=
Received: by mx.zohomail.com with SMTPS id 1774368217997429.93644086552706;
	Tue, 24 Mar 2026 09:03:37 -0700 (PDT)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Tue, 24 Mar 2026 17:01:20 +0100
Subject: [PATCH v11 16/22] drm/rockchip: dw_hdmi_qp: Set supported_formats
 platdata
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260324-color-format-v11-16-605559af4fb4@collabora.com>
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
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
X-Mailer: b4 0.15.0

With the introduction of the supported_formats member in the
dw-hdmi-qp platform data struct, drivers that have access to this
information should now set it.

Set it in the rockchip dw_hdmi_qp glue driver.

This allows this information to be passed down to the dw-hdmi-qp core,
which sets it in the bridge it creates, and consequently will allow the
common HDMI bridge code to act on it.

Reviewed-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index e2fa1aa53394..ec78c6895334 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -601,6 +601,10 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 	plat_data.phy_data = hdmi;
 	plat_data.max_bpc = 10;
 
+	plat_data.supported_formats = BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444) |
+				      BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR444) |
+				      BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR422);
+
 	encoder = &hdmi->encoder.encoder;
 	encoder->possible_crtcs = drm_of_find_possible_crtcs(drm, dev->of_node);
 

-- 
2.53.0

