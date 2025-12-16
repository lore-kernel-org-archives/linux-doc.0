Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 644E833C53A
	for <linux-doc@vger.kernel.org>; Tue, 16 Dec 2025 17:59:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765907970; cv=none; b=CbFt0PlM0v7aDDDHoEuSTeW4qvxXO7yhVVC9cqnJIf1FJw9FszFdgEN66omyW6p+ixsjHWFnlIlQ188Wx8rjxH1xfPxvIeREYW2cQd+yWVtyJFpMeLMY/dcygnXZer6XmWKeAU5uqm2pHFWKYUBJZFkqM52zKo51TwavC7Z6byA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765907970; c=relaxed/simple;
	bh=6khviIdOpvJs4tr8agkgptmFqNfHkNH5ns91HJPjmew=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=rdW3CGyhrEj4iIZp7g8x/goFb4HJSP2s74tWTfjS7Cwzocva2Rt4s9oj5aLzcoqUSWWodmGJFlQpDn1Aftks+8xN5maU8yfOznE1X+C/mRZIzbIObybQS7EO/aMd4QjRNFK/OpqgXGCyvumhbePK0IOfsiI/sFFymv117mkZ33Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=mglTxps3; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="mglTxps3"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E0B0E1A2254;
	Tue, 16 Dec 2025 17:59:26 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B4DB96071C;
	Tue, 16 Dec 2025 17:59:26 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F3960119A97DA;
	Tue, 16 Dec 2025 18:59:17 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765907961; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=UIaP6MBQMsmgUd6KNZ2JPVRiNKPK9KzdPCLhOdPMcsc=;
	b=mglTxps3VJvXj01Xn7Z00ZX0+ktA34Ri+t6nmNLd/3pITvNRyM2H/5RiysX8I77F3lLpN8
	AstjDTu2JwLLib5j4sD6E7pYv2UGa8HPSDCuoBOrG/i/9fLQRpDhPSif1bymWPuuL6skmV
	ynBNBz/CXdF5xPqsPk0X7uYomHtPfomqWUrDpD5vzAOLEE8KvwBiPE+xCltUVLwddBUy34
	LjxTLWBJME10BIamkSfhhM+3SEhA7GouaJXUzwl18J6HUgok0zSrInl2eMEw4ezyINXaz8
	svIOTGNxO1tCzUHICkfGkwhGHVn5mU4ZpW9+IhexxkeiZGezzMMXyzNrYh3Jig==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 16 Dec 2025 18:58:34 +0100
Subject: [PATCH v3 01/22] drm/bridge: add of_drm_find_and_get_bridge()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-1-b5165fab8058@bootlin.com>
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

of_drm_find_bridge() does not increment the refcount for the returned
bridge, but that is required now. However converting it and all its users
is not realistically doable at once given the large amount of (direct and
indirect) callers and the complexity of some.

Solve this issue by creating a new of_drm_find_and_get_bridge() function
that is identical to of_drm_find_bridge() except also it takes a
reference. Then of_drm_find_bridge() will be deprecated to be eventually
removed.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Link: https://lore.kernel.org/dri-devel/20250319-stylish-lime-mongoose-0a18ad@houat/
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Changes in v3:
- rename to of_drm_find_and_get_bridge()

Changes in v2:
- fix "mutex_unlock() before drm_bridge_get()", and use scoped_guard() to
  do it cleaning instead of complicating code
- rename to of_drm_get_bridge()

Note: a simple implementation would just be
  { return drm_bridge_get(of_drm_find_bridge(np)); }
but it would release the mutex before getting the reference, so it is
not safe. Make things simple by duplicating the code. A later patch will
make instead the (to be deprecated) of_drm_find_bridge() become a wrapper
of the new of_drm_get_bridge()
---
 drivers/gpu/drm/drm_bridge.c | 25 +++++++++++++++++++++++++
 include/drm/drm_bridge.h     |  5 +++++
 2 files changed, 30 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index db40c26d1cb3..0dbc8b59c3be 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -1479,6 +1479,31 @@ void drm_bridge_hpd_notify(struct drm_bridge *bridge,
 EXPORT_SYMBOL_GPL(drm_bridge_hpd_notify);
 
 #ifdef CONFIG_OF
+/**
+ * of_drm_find_and_get_bridge - find the bridge corresponding to the device
+ *                              node in the global bridge list
+ * @np: device node
+ *
+ * The refcount of the returned bridge is incremented. Use drm_bridge_put()
+ * when done with it.
+ *
+ * RETURNS:
+ * drm_bridge control struct on success, NULL on failure
+ */
+struct drm_bridge *of_drm_find_and_get_bridge(struct device_node *np)
+{
+	struct drm_bridge *bridge;
+
+	scoped_guard(mutex, &bridge_lock) {
+		list_for_each_entry(bridge, &bridge_list, list)
+			if (bridge->of_node == np)
+				return drm_bridge_get(bridge);
+	}
+
+	return NULL;
+}
+EXPORT_SYMBOL(of_drm_find_and_get_bridge);
+
 /**
  * of_drm_find_bridge - find the bridge corresponding to the device node in
  *			the global bridge list
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index d2683846cc61..8f10d2fd6016 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -1325,8 +1325,13 @@ int drm_bridge_attach(struct drm_encoder *encoder, struct drm_bridge *bridge,
 		      enum drm_bridge_attach_flags flags);
 
 #ifdef CONFIG_OF
+struct drm_bridge *of_drm_find_and_get_bridge(struct device_node *np);
 struct drm_bridge *of_drm_find_bridge(struct device_node *np);
 #else
+static inline struct drm_bridge *of_drm_find_and_get_bridge(struct device_node *np)
+{
+	return NULL;
+}
 static inline struct drm_bridge *of_drm_find_bridge(struct device_node *np)
 {
 	return NULL;

-- 
2.52.0

