Received: from sender4-pp-g122.zoho.com (sender4-pp-g122.zoho.com [136.143.188.122])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 810D44C8FE6;
	Wed, 21 Jan 2026 14:48:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=136.143.188.122
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1769006907; cv=pass; b=OWwWjiVT4pe/atun6PnUVT0G0QaQ1o3/OQBG8XFtjzeqiIUXRcxgES1gjMXsN2xIycdr5jSX5FJNa3SLH+V466+B3/KYA3ekf9v18vO0/oWLmDy7alLUv6F9oLgodehAa/C3Rqx0iWrGovfASWx8gshk/cOV8FytYdNtQQujv24=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1769006907; c=relaxed/simple;
	bh=0P8JxFpGISzGpBhGu55B+X3tNFBiWp7eQcApV03W/tQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Yi5fdVvxdAG+aicmp3sODfTUuu+17/NuT9tlnZNtWoYFhBU/gpjG6MroXKRuCPx/eAwB09L/cQrYNQL4LBVQor22QHJ2ONpMK5f+WtqDXC/eAmpE8SMfsWTk1DCH7D6afctWP6sSW//X5FY37PIDGs+vH5UGEZ8kgDFJI+/0tH4=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com; spf=pass smtp.mailfrom=collabora.com; dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b=RTySTPwo; arc=pass smtp.client-ip=136.143.188.122
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=collabora.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=collabora.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=collabora.com header.i=nicolas.frattaroli@collabora.com header.b="RTySTPwo"
ARC-Seal: i=1; a=rsa-sha256; t=1769006860; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=DMcppBYTEal6z6p74y9azsmjarPoZ/wMomcwYBtOiywdUYFadSkKWL8ePsJWQEVZHkF+j3Jcm+OZLgrPBlE8nPJGm9TKTlEcQfXabj7QA+6hOjOCuk4fCHf6NcNouwVd7DbUqYOd2+7mNbvO0xzryryW6kcN98YdOktok2sl5Yc=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1769006860; h=Content-Type:Content-Transfer-Encoding:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:References:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=cdUqUpe97esMbmQWL5CUCIlnIe/t/D++UVbFpi5dJZc=; 
	b=CT7n11V6zIsES9FsX4W2JVH1/7nU7XpSWc7SVfekV/j5wzLWgHrvsnFYHU3ZLE1qnK+G73e43NwE98kQaOkgxYO8lr5KA9sJOlTIRr4kpnk0TZn9tPhKjOESO4JVvw5TXLA519RPysGESCzQTMH674qJCbgyvKXp5aCjBrhSUB8=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=nicolas.frattaroli@collabora.com;
	dmarc=pass header.from=<nicolas.frattaroli@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1769006860;
	s=zohomail; d=collabora.com; i=nicolas.frattaroli@collabora.com;
	h=From:From:Date:Date:Subject:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:Message-Id:Message-Id:References:In-Reply-To:To:To:Cc:Cc:Reply-To;
	bh=cdUqUpe97esMbmQWL5CUCIlnIe/t/D++UVbFpi5dJZc=;
	b=RTySTPwoY/YvgT7BivHztjhX6NHCtxBhM4kC59FzbbckQL3/5XFjDDDlUpuuVmbr
	pXdDPj30Oh6OgldYPcWuKR9cpMdXn6vEwels2qewApeo/c653aHw7YNVl9Yytv+Oord
	aA8z3VS0Pg2BltEYcZb8++B7m1S7qYvtcUu+tEqw=
Received: by mx.zohomail.com with SMTPS id 17690068591681000.5781346933774;
	Wed, 21 Jan 2026 06:47:39 -0800 (PST)
From: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Date: Wed, 21 Jan 2026 15:45:23 +0100
Subject: [PATCH v7 16/22] drm/rockchip: dw_hdmi_qp: Set supported_formats
 platdata
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260121-color-format-v7-16-ef790dae780c@collabora.com>
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

With the introduction of the supported_formats member in the
dw-hdmi-qp platform data struct, drivers that have access to this
information should now set it.

Set it in the rockchip dw_hdmi_qp glue driver.

This allows this information to be passed down to the dw-hdmi-qp core,
which sets it in the bridge it creates, and consequently will allow the
common HDMI bridge code to act on it.

Signed-off-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
---
 drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c | 4 ++++
 1 file changed, 4 insertions(+)

diff --git a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
index d39a4284b92c..1608b494b757 100644
--- a/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw_hdmi_qp-rockchip.c
@@ -601,6 +601,10 @@ static int dw_hdmi_qp_rockchip_bind(struct device *dev, struct device *master,
 	plat_data.phy_data = hdmi;
 	plat_data.max_bpc = 10;
 
+	plat_data.supported_formats = BIT(HDMI_COLORSPACE_RGB) |
+				      BIT(HDMI_COLORSPACE_YUV444) |
+				      BIT(HDMI_COLORSPACE_YUV422);
+
 	encoder = &hdmi->encoder.encoder;
 	encoder->possible_crtcs = drm_of_find_possible_crtcs(drm, dev->of_node);
 

-- 
2.52.0

