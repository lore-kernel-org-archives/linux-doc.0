Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0FA8B1A9B5D;
	Tue, 31 Dec 2024 10:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735641642; cv=none; b=he8oJD60hLcl9bm1pdKVTHTyzGsPdEqzWZkI/gkNn2Si34MJls81YO6SWsP+VhaDOyZGZB/PxnKonoKHxbIG7kVzci9Pcho0v/bhqHMs1w60nfQsdXgndctF47JPMpiaMBaxRPhqMKgbChqzUqxsO6w0jV6DcXfPxSavfm3W2Yg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735641642; c=relaxed/simple;
	bh=qKScjCWS3zQLLINwaYi4TvLsWgmqlMHNoJzHX6q2Zss=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l6h8xZcFRsIuMZ/1JwbQ5iwa6Afo8oWWUhofKGyBo7P7hXvzU29gx86A7u0DE/HBAhgtTOPv3NVJf0y5jU2k2RIkjPAKLTF64OZxJOJzQASzQ4ltG+KUdzufpSXp6tLCV2sqsy3ih5usUhNVaPcztoQPK7OpHsGU01Z2QGyPse4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=gij91b7P; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="gij91b7P"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 5E8CDFF807;
	Tue, 31 Dec 2024 10:40:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735641638;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=TTcQh33h4sP1K7kYFcPVMoxBbZqDI+SUcTKhpuWTOmM=;
	b=gij91b7PznJGGhxAZOF/51HJTo0cqHVpkVu8A1p2EmoMQEJuGK+e9SlA4FF8hbAeYFhlVE
	eiq59Scy6JKy3SEZvXRnK41iy8x2Vx6bVl26nGdrTHxQ7MxaSvVy99VzQkgWVQHRgBSYx3
	AgSRHlrCypT/xZnlz1TD9jrxDEoBFNOzwTCoG54VKTcUwHBV2iHDrVfocM9fo7e6ROpt+F
	VaNdSfOZwK3TxNtZhpTMmKuu3rnIhxRMpELqI7/Gv1kWJm7aJyFRrKmQ4lKMh6FAeC8Tx3
	1JMpPyltnseCSFrbqQlvtRtF7jlZsVUaRS4Dvh5xtmF5BR8eANc3w2T89VNoOg==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 31 Dec 2024 11:40:03 +0100
Subject: [PATCH v5 09/10] drm/bridge: samsung-dsim: refcount the out_bridge
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241231-hotplug-drm-bridge-v5-9-173065a1ece1@bootlin.com>
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

Refcount the out_bridge to avoid a use-after-free in case it is
hot-unplugged.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

This patch was added in v5.
---
 drivers/gpu/drm/bridge/samsung-dsim.c | 11 ++++++++---
 1 file changed, 8 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/bridge/samsung-dsim.c
index c4d1563fd32019efde523dfc0863be044c05a826..4d32c453265931b5aecdc125623368fecacf4be3 100644
--- a/drivers/gpu/drm/bridge/samsung-dsim.c
+++ b/drivers/gpu/drm/bridge/samsung-dsim.c
@@ -1756,6 +1756,7 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
 		return ret;
 	}
 
+	drm_bridge_get(out_bridge);
 	dsi->out_bridge = out_bridge;
 
 	DRM_DEV_INFO(dev, "Attached %s device (lanes:%d bpp:%d mode-flags:0x%lx)\n",
@@ -1774,13 +1775,13 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
 	if (!(device->mode_flags & MIPI_DSI_MODE_VIDEO)) {
 		ret = samsung_dsim_register_te_irq(dsi, &device->dev);
 		if (ret)
-			return ret;
+			goto err_put_bridge;
 	}
 
 	if (pdata->host_ops && pdata->host_ops->attach) {
 		ret = pdata->host_ops->attach(dsi, device);
 		if (ret)
-			return ret;
+			goto err_put_bridge;
 	}
 
 	dsi->lanes = device->lanes;
@@ -1788,6 +1789,10 @@ static int samsung_dsim_host_attach(struct mipi_dsi_host *host,
 	dsi->mode_flags = device->mode_flags;
 
 	return 0;
+
+err_put_bridge:
+	drm_bridge_put_and_clear(dsi->out_bridge);
+	return ret;
 }
 
 static void samsung_dsim_unregister_te_irq(struct samsung_dsim *dsi)
@@ -1804,7 +1809,7 @@ static int samsung_dsim_host_detach(struct mipi_dsi_host *host,
 	struct samsung_dsim *dsi = host_to_dsi(host);
 	const struct samsung_dsim_plat_data *pdata = dsi->plat_data;
 
-	dsi->out_bridge = NULL;
+	drm_bridge_put_and_clear(dsi->out_bridge);
 
 	if (pdata->host_ops && pdata->host_ops->detach)
 		pdata->host_ops->detach(dsi, device);

-- 
2.34.1

