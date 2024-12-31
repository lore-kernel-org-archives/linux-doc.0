Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EFF08192B90;
	Tue, 31 Dec 2024 10:40:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735641630; cv=none; b=WVcBvUIvVAMDtrBbBQfHIONT5UYNB27spFAI+G7u3LpJLzqRTZ4PSam3CSWvuy101uGbpS06L1lPUR+zczWhNl1227Oqe+1r7ni9hbySrGEvAf0ATBi5L24t0IkBAYOJlKHVUT5WKbEssKm1K1NK7R4PfFfw0rxGbtVom3kUwdw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735641630; c=relaxed/simple;
	bh=0tTIZKY1/jALY3V+Fq8iqaxTzx482GxYcYZJPzNaLTo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=n9DmxYOxkaDTb1zNSgmAlr4XRBYXScynhn8ts8TgN9EhJLHbfjsXfWNydA+RCZPyyckrfwq8Hk1yChGI/QeNOM0wSHWbNDJ/9a7CRdgxjarMlCMfL52ON1GFnwqdBlEYtIFPWdZcefYFQYuei1t0m2MZycAIISckBd5I+MoBzh4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=cE5Bp8X6; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="cE5Bp8X6"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 9E58AFF807;
	Tue, 31 Dec 2024 10:40:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735641618;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=PxBzmPPEWgBw3uis0MRm89ScUFpWvhfSJUjkNyWb73w=;
	b=cE5Bp8X6m2D6qBdaYiQf1+fGQemuF8ckbTmPXPSLApfMmE0IOeS5X2FfriwrvpmbDQYmFb
	w5r4tYOJ/zBgDwVQEnE8XZedVNcQ4E3JL8+77aIVP3QPSFmc+f6UyNtwqpHe8TPuT5Ubmc
	HG+7hKT7JZuF0fFz6aNb27DwU949TkHCJ5kvAMRTdhzrH2L1zCmSY3CTt9hmp6vO67ZKzZ
	nPqE9+PusaXhSu5nlJiG+Qnjpg9eDHZSkmtTOAYwADbLBF6THMB569W0IWolR5IKER4e+K
	YrNFLzEvCXCaw4SctP721FQWg0/ScUQJhkyXW6IVUdBmCzrdxj111YeYSjMZbw==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 31 Dec 2024 11:39:55 +0100
Subject: [PATCH v5 01/10] drm/bridge: allow bridges to be informed about
 added and removed bridges
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241231-hotplug-drm-bridge-v5-1-173065a1ece1@bootlin.com>
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

In preparation for allowing bridges to be added to and removed from a DRM
card without destroying the whole card, add a new DRM bridge function
called on addition and removal of bridges.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changed in v5:
 - fixed kerneldoc errors

This patch was added in v4.
---
 drivers/gpu/drm/drm_bridge.c | 12 ++++++++++++
 include/drm/drm_bridge.h     | 23 +++++++++++++++++++++++
 2 files changed, 35 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index c6af46dd02bfa9e15b59e4c460debdd7fd84be44..b1f0d25d55e23000521ac2ac37ee410348978ed4 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -205,8 +205,14 @@ static LIST_HEAD(bridge_list);
  */
 void drm_bridge_add(struct drm_bridge *bridge)
 {
+	struct drm_bridge *br, *tmp;
+
 	mutex_init(&bridge->hpd_mutex);
 
+	list_for_each_entry_safe(br, tmp, &bridge_list, list)
+		if (br->funcs->bridge_event_notify)
+			br->funcs->bridge_event_notify(br, DRM_EVENT_BRIDGE_ADD, bridge);
+
 	mutex_lock(&bridge_lock);
 	list_add_tail(&bridge->list, &bridge_list);
 	mutex_unlock(&bridge_lock);
@@ -243,10 +249,16 @@ EXPORT_SYMBOL(devm_drm_bridge_add);
  */
 void drm_bridge_remove(struct drm_bridge *bridge)
 {
+	struct drm_bridge *br, *tmp;
+
 	mutex_lock(&bridge_lock);
 	list_del_init(&bridge->list);
 	mutex_unlock(&bridge_lock);
 
+	list_for_each_entry_safe(br, tmp, &bridge_list, list)
+		if (br->funcs->bridge_event_notify)
+			br->funcs->bridge_event_notify(br, DRM_EVENT_BRIDGE_REMOVE, bridge);
+
 	mutex_destroy(&bridge->hpd_mutex);
 }
 EXPORT_SYMBOL(drm_bridge_remove);
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index e8d735b7f6a480468c88287e2517b387ceec0f22..6976bd842cedf9ce06abfb7306e7a3b4915f0378 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -54,6 +54,11 @@ enum drm_bridge_attach_flags {
 	DRM_BRIDGE_ATTACH_NO_CONNECTOR = BIT(0),
 };
 
+enum drm_bridge_event_type {
+	DRM_EVENT_BRIDGE_ADD,
+	DRM_EVENT_BRIDGE_REMOVE,
+};
+
 /**
  * struct drm_bridge_funcs - drm_bridge control functions
  */
@@ -676,6 +681,24 @@ struct drm_bridge_funcs {
 				    enum hdmi_infoframe_type type,
 				    const u8 *buffer, size_t len);
 
+	/**
+	 * @bridge_event_notify:
+	 *
+	 * Notify that another bridge is being added or removed.
+	 *
+	 * This callback is optional. Bridges implementing it must always
+	 * check whether the event refers to a bridge they actually need to
+	 * interact with.
+	 *
+	 * @bridge: bridge being notified
+	 * @event: event happened (add/remove bridge)
+	 * @event_bridge: the bridge mentioned by the event (i.e. the
+	 * bridge being added or removed)
+	 */
+	void (*bridge_event_notify)(struct drm_bridge *bridge,
+				    enum drm_bridge_event_type event,
+				    struct drm_bridge *event_bridge);
+
 	/**
 	 * @debugfs_init:
 	 *

-- 
2.34.1

