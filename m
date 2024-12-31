Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D7A319E966;
	Tue, 31 Dec 2024 10:40:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735641635; cv=none; b=Ql6HJlJ0vGOhIeHOfQ5F1CGv+qkdnKqlppgpXIaxwvpTfjPlo6bAex+BFu+T18NJ8erqjXmwn/qgKslpiPSqB0RP+dCdjGiVFgE0jsmFjkyLIiGy81hYdL1/mGpYGLT4Eprb3VCV4F2OoaWOF658/M3sp83fxDhNNY21myk7Aok=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735641635; c=relaxed/simple;
	bh=k7jTZnE26/g0Ae9SpVXy7fWU0iUyuOkzd1s5WuxV6aA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=seCs3B3w+2f6OxurAI9SUJg/3Jd6Ei+519ktAgd4RErvgA9ugXIXrXhbbZ4vxV4UUBJND0EH6JQkyjyoEGdROpmWijCqw67TulI6Z182NQMVbQQXVtrN/1ek7Y5ZvHjOhYr5I/B7PaMu4XpYWFwwtGe+U5SD7ho45cuWIa9V39I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=HqcIjpfG; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="HqcIjpfG"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3C58EFF804;
	Tue, 31 Dec 2024 10:40:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735641631;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=tgG7ptM2LlMfthlPU8YWespBaBvmS478hMiXjlaUP0E=;
	b=HqcIjpfGPJ7HiTpnjXCWHYSxYs4m2PoWbzHFTFNZknw5Q+CIQwoqQiqr5x+QuPMyj4MgvT
	U/SQZzalPCu3wL0rKIqkrcpRYhznEsL+rOLoMeGEvprMWAhoYWG3WWrb72Zzj066tA0TlV
	Y8ozkuWoCIY56F4h/ChouQKrW5By1Tk47CfN49fQttpJG5MK7VoDCShyfN4T15lnZoKF7l
	6i7Bb5cNnsKKq2MaVhUooZOe/0Eg1SeSEdHLTclJzB6thXs3bIz6+o4Ypm+ud+TJsjotXz
	vDCGE97iwxLEfy+oSgEK1LD6u7hOmcBId4zwVIk05sxD6RNE8LvUBA4IE9Lu7g==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 31 Dec 2024 11:40:00 +0100
Subject: [PATCH v5 06/10] drm/bridge: ti-sn65dsi83: use dynamic lifetime
 management
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241231-hotplug-drm-bridge-v5-6-173065a1ece1@bootlin.com>
References: <20241231-hotplug-drm-bridge-v5-0-173065a1ece1@bootlin.com>
In-Reply-To: <20241231-hotplug-drm-bridge-v5-0-173065a1ece1@bootlin.com>
To: Simona Vetter <simona@ffwll.ch>, Inki Dae <inki.dae@samsung.com>, 
 Jagan Teki <jagan@amarulasolutions.com>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Daniel Thompson <danielt@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, Jonathan Corbet <corbet@lwn.net>
Cc: Paul Kocialkowski <contact@paulk.fr>, 
 Maxime Ripard <mripard@kernel.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 =?utf-8?q?Herv=C3=A9_Codina?= <herve.codina@bootlin.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, 
 Paul Kocialkowski <paul.kocialkowski@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.2
X-GND-Sasl: luca.ceresoli@bootlin.com

With proper use of drm_bridge_get() and _put(), this allows the bridge to
be removable without dangling pointers and use-after-free.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

This patch was added in v5.
---
 drivers/gpu/drm/bridge/ti-sn65dsi83.c | 13 +++++++++++--
 1 file changed, 11 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ti-sn65dsi83.c b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
index 246fece303bc0ae9fb2eaa9c6218ce2ecd550f3b..df3ec39817f32879f9aab65812b6e7f4723f72fb 100644
--- a/drivers/gpu/drm/bridge/ti-sn65dsi83.c
+++ b/drivers/gpu/drm/bridge/ti-sn65dsi83.c
@@ -267,6 +267,11 @@ static void sn65dsi83_detach(struct drm_bridge *bridge)
 	ctx->dsi = NULL;
 }
 
+static void sn65dsi83_destroy(struct drm_bridge *bridge)
+{
+	kfree(bridge_to_sn65dsi83(bridge));
+}
+
 static u8 sn65dsi83_get_lvds_range(struct sn65dsi83 *ctx,
 				   const struct drm_display_mode *mode)
 {
@@ -695,6 +700,7 @@ sn65dsi83_atomic_get_input_bus_fmts(struct drm_bridge *bridge,
 static const struct drm_bridge_funcs sn65dsi83_funcs = {
 	.attach			= sn65dsi83_attach,
 	.detach			= sn65dsi83_detach,
+	.destroy		= sn65dsi83_destroy,
 	.atomic_enable		= sn65dsi83_atomic_enable,
 	.atomic_pre_enable	= sn65dsi83_atomic_pre_enable,
 	.atomic_disable		= sn65dsi83_atomic_disable,
@@ -813,10 +819,14 @@ static int sn65dsi83_probe(struct i2c_client *client)
 	struct sn65dsi83 *ctx;
 	int ret;
 
-	ctx = devm_kzalloc(dev, sizeof(*ctx), GFP_KERNEL);
+	ctx = kzalloc(sizeof(*ctx), GFP_KERNEL);
 	if (!ctx)
 		return -ENOMEM;
 
+	ret = drm_bridge_init(dev, &ctx->bridge, &sn65dsi83_funcs);
+	if (ret)
+		return ret;
+
 	ctx->dev = dev;
 	INIT_WORK(&ctx->reset_work, sn65dsi83_reset_work);
 	INIT_DELAYED_WORK(&ctx->monitor_work, sn65dsi83_monitor_work);
@@ -855,7 +865,6 @@ static int sn65dsi83_probe(struct i2c_client *client)
 	dev_set_drvdata(dev, ctx);
 	i2c_set_clientdata(client, ctx);
 
-	ctx->bridge.funcs = &sn65dsi83_funcs;
 	ctx->bridge.of_node = dev->of_node;
 	ctx->bridge.pre_enable_prev_first = true;
 	drm_bridge_add(&ctx->bridge);

-- 
2.34.1

