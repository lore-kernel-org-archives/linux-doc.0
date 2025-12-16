Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2B7333CE83
	for <linux-doc@vger.kernel.org>; Tue, 16 Dec 2025 17:59:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765907984; cv=none; b=a2m0mOBlzxhjjVFnp/dKeLFZdkN9M/uBSoXpOgxedB9fPvSIL8PuYhbpTOml2Wrl9bG/lc00KJ+XUwcWw8gLV72z1dbo3Cd3r7q3JBVcpdzeNrBfDrcwU8G2JnO6pSqDd4KYwmbPmKLRD9gUzLe6xIcR8nCCEARXX5KaPBvh25c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765907984; c=relaxed/simple;
	bh=Hakz5md2WtTUqOAS6Co5XuALYNGHp+pMffIn7umInMo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=OBUhGTkS/hb43N57yLgT+xujIeyaBOdR4obtUkFf/iqiiIMTb6+t/4cNcaQ4zkIL7kD2S5oGrO9T8I0Q2cnaw9t+HN7NantdDrzduvF3xYb4KWpwYgDssr/eUJIX4mkquYShbdv0V7Ydc5ow0PR6lXAxIg1qj9GVQ4jWg09LGJo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=smKGPw0d; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="smKGPw0d"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id CD1691A2254;
	Tue, 16 Dec 2025 17:59:39 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id A04C66071C;
	Tue, 16 Dec 2025 17:59:39 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 205B7119A97E7;
	Tue, 16 Dec 2025 18:59:35 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765907978; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=5biOjWznSotMSX3PBR3P8jtLjxKY2ayNXnssZ5+ra3o=;
	b=smKGPw0dbCycuh0QpfQ/JZGiEHYRjtmgUHE6JH9usTO4AKoa3t2Qcy0/SYQOsfkw7tcw7H
	aaGd33KUYT9spKY69+UAZpDmCSQ75wjkqExc3+Oxs2fP3cku2VPBL4lqSVzan6Jh9PkGtp
	cFzzB2viEnKcHtOuZvzTgzD2Tscx1WCxSfxfdOJEexgyPxItMTS+t7+kKJnC8B/jU8F/jO
	ZThf5bSqsGOblAI5dsArem9fAW9sv1XfAuZddW+jrUIGeNTildibYUtqfwA6blof6ptaZK
	Rn90Fn6hbcgm2sBQeyXxSqWKCmXKWaK9a6ymCCBlezo8VymMZldylcdlhEQQag==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 16 Dec 2025 18:58:37 +0100
Subject: [PATCH v3 04/22] drm/bridge: make of_drm_find_bridge() a wrapper
 of of_drm_find_and_get_bridge()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-4-b5165fab8058@bootlin.com>
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

of_drm_find_bridge() is identical to of_drm_find_and_get_bridge() except it
does not increment the refcount. Rewrite it as a wrapper and put the bridge
being returned so the behaviour is still the same.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v3:
- update after of_drm_get_bridge() -> of_drm_find_and_get_bridge() rename
- fixed kerneldoc syntax for non-kerneldoc comment

Changes in v2:
- Added comment to document why we put the reference
---
 drivers/gpu/drm/drm_bridge.c | 20 +++++++++-----------
 1 file changed, 9 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index f612d486cad0..64aa69dcf46f 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1529,19 +1529,17 @@ EXPORT_SYMBOL(of_drm_find_and_get_bridge);
  */
 struct drm_bridge *of_drm_find_bridge(struct device_node *np)
 {
-	struct drm_bridge *bridge;
-
-	mutex_lock(&bridge_lock);
+	struct drm_bridge *bridge = of_drm_find_and_get_bridge(np);
 
-	list_for_each_entry(bridge, &bridge_list, list) {
-		if (bridge->of_node == np) {
-			mutex_unlock(&bridge_lock);
-			return bridge;
-		}
-	}
+	/*
+	 * We need to emulate the original semantics of
+	 * of_drm_find_bridge(), which was not getting any bridge
+	 * reference. Being now based on of_drm_find_and_get_bridge() which
+	 * gets a reference, put it before returning.
+	 */
+	drm_bridge_put(bridge);
 
-	mutex_unlock(&bridge_lock);
-	return NULL;
+	return bridge;
 }
 EXPORT_SYMBOL(of_drm_find_bridge);
 #endif

-- 
2.52.0

