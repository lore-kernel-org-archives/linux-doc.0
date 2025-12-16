Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4AFDC23D2AB
	for <linux-doc@vger.kernel.org>; Tue, 16 Dec 2025 17:59:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765907998; cv=none; b=WoTAPaUdcVHPpF/ub15VyAtUuUNvs2LgdQ2cdHXxobwqfDCrlYjtw7rQx6Ok6rNFOcomXztTkBhkzQXoH7n/nIo+pMzUglHL3YhKgNjjg6aSi1GQ8mwQKu2zYqWYLRJ5emZ8CRrJkkuJ3w5K3enS1p1f5GV3TsxKaaYkk+Tamb4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765907998; c=relaxed/simple;
	bh=UuH4n7fnC1ntL8K6yhE/4dzmBLTpArEV3BFoZaY9HgI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Djegcj06rCyuaPDM+HZ0R/ua1n0Dz3LzJkZAcyYT+aoktrc4W7XJMD6140zZwxcAqX6pIVMO0i+vKi8obDbAVV0fiShvpoE/wyBotQuUQEauL5IMi1avF1TjNt1gHQbMwyTZfVA0KoPmgNoJEgjQjJsk4JhgbZkr19NQOQrDLjc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=Yj4JB5Qj; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="Yj4JB5Qj"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E2E641A2254;
	Tue, 16 Dec 2025 17:59:54 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B6D5A6072F;
	Tue, 16 Dec 2025 17:59:54 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 3A5C2119A97E8;
	Tue, 16 Dec 2025 18:59:48 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765907991; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=w07+z7x1px2/5P0sD/KMZgJOKOJk0feHbjhM11jcOSE=;
	b=Yj4JB5QjxEBsSUUmh/Tyl7o/8qHKSKegodrvvuWZHLUQhO4pBv/ziIOd/jn42KqNj0Mycc
	JHcGScdowUu9Fs3i3vJr1S8XYxhw8//xtQMQCT4v5qnlzyoXA+HjZgORReIbup5bUbmnwV
	S2FEN9KrdPMPEUIa5ymnnAMic/E11FQ7McV1OH0CrGamPVt6fmx/kQRD4uJ31xZ8jqd9Di
	Z4GpR3XfSHYlSlz8V5hBiSz98f2Q9Vd3tK3P4VNdz6KoMsqiSVyjVixpGOV381uuKSKAcl
	HpblAmiTtrxMovBRTbvqomw+dJeYXiixSn5PvTwMevz0psjPxrbf2xMgFEn80w==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 16 Dec 2025 18:58:40 +0100
Subject: [PATCH v3 07/22] drm/bridge: ite-it66121: get/put the next bridge
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-7-b5165fab8058@bootlin.com>
References: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-0-b5165fab8058@bootlin.com>
In-Reply-To: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-0-b5165fab8058@bootlin.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Jonathan Corbet <corbet@lwn.net>, Alexey Brodkin <abrodkin@synopsys.com>, 
 Phong LE <ple@baylibre.com>, Liu Ying <victor.liu@nxp.com>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Kevin Hilman <khilman@baylibre.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>
Cc: Hui Pu <Hui.Pu@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Last-TLS-Session-Version: TLSv1.3

This driver obtains a bridge pointer from of_drm_find_bridge() in the probe
function and stores it until driver removal. of_drm_find_bridge() is
deprecated. Move to of_drm_find_and_get_bridge() for the bridge to be
refcounted and use bridge->next_bridge to put the reference on
deallocation.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/bridge/ite-it66121.c | 7 +++----
 1 file changed, 3 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/ite-it66121.c b/drivers/gpu/drm/bridge/ite-it66121.c
index 0185f61e6e59..9246e9c15a6e 100644
--- a/drivers/gpu/drm/bridge/ite-it66121.c
+++ b/drivers/gpu/drm/bridge/ite-it66121.c
@@ -298,7 +298,6 @@ struct it66121_chip_info {
 struct it66121_ctx {
 	struct regmap *regmap;
 	struct drm_bridge bridge;
-	struct drm_bridge *next_bridge;
 	struct drm_connector *connector;
 	struct device *dev;
 	struct gpio_desc *gpio_reset;
@@ -596,7 +595,7 @@ static int it66121_bridge_attach(struct drm_bridge *bridge,
 	if (!(flags & DRM_BRIDGE_ATTACH_NO_CONNECTOR))
 		return -EINVAL;
 
-	ret = drm_bridge_attach(encoder, ctx->next_bridge, bridge, flags);
+	ret = drm_bridge_attach(encoder, ctx->bridge.next_bridge, bridge, flags);
 	if (ret)
 		return ret;
 
@@ -1543,9 +1542,9 @@ static int it66121_probe(struct i2c_client *client)
 		return -EINVAL;
 	}
 
-	ctx->next_bridge = of_drm_find_bridge(ep);
+	ctx->bridge.next_bridge = of_drm_find_and_get_bridge(ep);
 	of_node_put(ep);
-	if (!ctx->next_bridge) {
+	if (!ctx->bridge.next_bridge) {
 		dev_dbg(ctx->dev, "Next bridge not found, deferring probe\n");
 		return -EPROBE_DEFER;
 	}

-- 
2.52.0

