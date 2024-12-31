Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 652DE1A2399;
	Tue, 31 Dec 2024 10:40:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735641637; cv=none; b=TlpmAfdck8iO2Fpn7I3a96UwdH5mw+NeYBxfUzCf2fUyDdQMLEY6701mKtmGftyERwwbZXJCURACumpDLgiUbOuDwL9MAtfRyI6vClIHiGSu1X6Hi84mqi++z6UUtqGZxRY3sTDZt9Tvbvh0I1FCmdTKSI5imPWfKEl0Ty3DWE4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735641637; c=relaxed/simple;
	bh=sMIfxVHzKMxJNya//K+PY0XEq/erXQCVHNDW2gqgYAs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=QfCztIogNn4a/8WcYcgt97OntDW0ygR10fEetrdjgbwEoBxlcZmuckQXTbg3qxbRm65ij2+sBzGruKXQDI+M3yptuEMskgRPHGJVPhhOVBc7T9EHKHlU/3GhvLW43fF6N2phLCXWmH69mWDN2c3POylYxwTfOYCLq76aQT/BcDc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=KK+ZBFK4; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="KK+ZBFK4"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 925E2FF806;
	Tue, 31 Dec 2024 10:40:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735641633;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=32FGOgMqkFd24eRdy6LzV+vdiYs/LXpL2vGROONBsso=;
	b=KK+ZBFK4Fduf5wjOvpZjiAOMyEjY0gITQhDROVMyIzrcY3DlPAiTXgfd1qvp0sc522kKxd
	fg2NtpdplM31yNw9djttbDyHRAMEtkOT8SenYYpGnrkXNYCmLAGMhg3WGNdJLXI1I2zNnH
	1Z5mX02RbBOhBYb3rkGHr6+kXvxL0kxlmXheqB3xWZK+pqsult4zXLgT0VYnymf950K8kS
	vuPY5R5ggmNq7kKIdilwStMKf+BUlDrR5JJ15Trfy3zN5zaF8LJXPVYk2H+fNQOHV6VZ5i
	eQj8ooU2mAsKJ6p7iJkhUm51apwG8vUeywrr1eP/BCJwCqqQUMWibdhC5LCfPA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 31 Dec 2024 11:40:01 +0100
Subject: [PATCH v5 07/10] drm/bridge: panel: use dynamic lifetime
 management
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241231-hotplug-drm-bridge-v5-7-173065a1ece1@bootlin.com>
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

Enable lifetime management of panel-bridge, so that other modules taking a
pointer to a panel bridge can refcount it and avoid use-after-free in case
the panel bridge is hot-unplugged.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

This patch was added in v5.
---
 drivers/gpu/drm/bridge/panel.c | 20 ++++++++++++--------
 1 file changed, 12 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/panel.c
index 6e88339dec0f5faee690b7c53e8dcd0f1ee2281c..805809778f79f4519d9e31214cc5407357264da3 100644
--- a/drivers/gpu/drm/bridge/panel.c
+++ b/drivers/gpu/drm/bridge/panel.c
@@ -108,6 +108,11 @@ static void panel_bridge_detach(struct drm_bridge *bridge)
 		drm_connector_cleanup(connector);
 }
 
+static void panel_bridge_destroy(struct drm_bridge *bridge)
+{
+	kfree(drm_bridge_to_panel_bridge(bridge));
+}
+
 static void panel_bridge_atomic_pre_enable(struct drm_bridge *bridge,
 				struct drm_bridge_state *old_bridge_state)
 {
@@ -210,6 +215,7 @@ static void panel_bridge_debugfs_init(struct drm_bridge *bridge,
 static const struct drm_bridge_funcs panel_bridge_bridge_funcs = {
 	.attach = panel_bridge_attach,
 	.detach = panel_bridge_detach,
+	.destroy = panel_bridge_destroy,
 	.atomic_pre_enable = panel_bridge_atomic_pre_enable,
 	.atomic_enable = panel_bridge_atomic_enable,
 	.atomic_disable = panel_bridge_atomic_disable,
@@ -286,19 +292,22 @@ struct drm_bridge *drm_panel_bridge_add_typed(struct drm_panel *panel,
 					      u32 connector_type)
 {
 	struct panel_bridge *panel_bridge;
+	int err;
 
 	if (!panel)
 		return ERR_PTR(-EINVAL);
 
-	panel_bridge = devm_kzalloc(panel->dev, sizeof(*panel_bridge),
-				    GFP_KERNEL);
+	panel_bridge = kzalloc(sizeof(*panel_bridge), GFP_KERNEL);
 	if (!panel_bridge)
 		return ERR_PTR(-ENOMEM);
 
+	err = drm_bridge_init(panel->dev, &panel_bridge->bridge, &panel_bridge_bridge_funcs);
+	if (err)
+		return ERR_PTR(err);
+
 	panel_bridge->connector_type = connector_type;
 	panel_bridge->panel = panel;
 
-	panel_bridge->bridge.funcs = &panel_bridge_bridge_funcs;
 	panel_bridge->bridge.of_node = panel->dev->of_node;
 	panel_bridge->bridge.ops = DRM_BRIDGE_OP_MODES;
 	panel_bridge->bridge.type = connector_type;
@@ -317,18 +326,13 @@ EXPORT_SYMBOL(drm_panel_bridge_add_typed);
  */
 void drm_panel_bridge_remove(struct drm_bridge *bridge)
 {
-	struct panel_bridge *panel_bridge;
-
 	if (!bridge)
 		return;
 
 	if (bridge->funcs != &panel_bridge_bridge_funcs)
 		return;
 
-	panel_bridge = drm_bridge_to_panel_bridge(bridge);
-
 	drm_bridge_remove(bridge);
-	devm_kfree(panel_bridge->panel->dev, bridge);
 }
 EXPORT_SYMBOL(drm_panel_bridge_remove);
 

-- 
2.34.1

