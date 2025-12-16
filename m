Received: from smtpout-04.galae.net (smtpout-04.galae.net [185.171.202.116])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D59EB2D9EFC;
	Tue, 16 Dec 2025 18:00:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.171.202.116
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765908002; cv=none; b=MCr2AJT0V1M2BqwOoWuuzKnj9DWOMouRKq4TBV3gMLngIaWlr/Fma1jt97+F9eibkGwfztKVkigH7OWMCyVD0hn7uwUv4HnFxg0Z4k06rjrTiDjSRwK0971HW6nlSXXK5cwtwzaRtjfqdrjqA1kFr0pD4S75IjjJN/AXEt8INVc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765908002; c=relaxed/simple;
	bh=emDhk2MMrd8ZT9IWg/kP2hcjE9Z97TjWHRlexkv8XLo=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FwD13QEKnuMXaOK0k/Fn2yny6CS81Gx5wUxG9mEJbzkf6ehH0QC1Xhg0yaQ1K7ZkF+YKLI5RYKWUnGYwW0eQ/S06+rpudsbCHq90bXCnvRD2NugAEX9/080HPbyNckrwV7CWM1gErmFKqz1iBkEoZat+FV0sJI2qiB/EYTN+2zQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=rlEm/gAv; arc=none smtp.client-ip=185.171.202.116
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="rlEm/gAv"
Received: from smtpout-01.galae.net (unknown [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A2637C1A582;
	Tue, 16 Dec 2025 17:59:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 1B9576071C;
	Tue, 16 Dec 2025 17:59:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 38D9A119A97D5;
	Tue, 16 Dec 2025 18:59:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1765907987; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=GmMyYFYj3nN0WWZncwkj3rSY84I1KnZQTlsrUpqIOyA=;
	b=rlEm/gAvrMbqr3Pj4NGgu9O+LbFKm4iDqhBczJ0MFSNJklRloeIRAsDfvYUSxHPtjJWmFM
	6cKCOdkflGuz5f+0Xzgl4l41lVU9rNcFeNpED8pEwgaK5E1Dh0Rx6A+hmEkY7o2ER5tac2
	iLb7R0CH6J9upYVCg2ct4zQpvQ4DLr1Uu61thZsTh+NsXqpghIXzsPTWE58VzrBsT7RY8m
	zIbD39BzKVIUskMhJL9ZTmLtiEw1VU1Qae5G5aHZzgeHureeVPrrjAa0hhcNsCXOD4kS4Z
	thOY1qJd+CovZN8O/Go0lIxNieqk/vbiHGq4dK2f2WiTYpmeMRfXc52pPvzQCA==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 16 Dec 2025 18:58:39 +0100
Subject: [PATCH v3 06/22] drm/bridge: add next_bridge pointer to struct
 drm_bridge
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251216-drm-bridge-alloc-getput-drm_of_find_bridge-v3-6-b5165fab8058@bootlin.com>
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

Many bridge drivers store a next_bridge pointer in their private data and
use it for attach and sometimes other purposes. This is going to be risky
when bridge hot-unplug is used.

Considering this example scenario:

  1. pipeline: encoder --> bridge A --> bridge B --> bridge C
  2. encoder takes a reference to bridge B
  3. bridge B takes a next_bridge reference to bridge C
  4. encoder calls (bridge B)->b_foo(), which in turns references
     next_bridge, e.g.:

       b_foo() {
           bar(b->next_bridge);
       }

If bridges B and C are removed, bridge C can be freed but B is still
allocated because the encoder holds a reference to B. So when step 4
happens, 'b->next-bridge' would be a use-after-free.

Calling drm_bridge_put() in the B bridge .remove function does not solve
the problem as it leaves a (potentially long) risk window between B removal
and the final deallocation of B. A safe moment to put the B reference is in
__drm_bridge_free(), when the last reference has been put. This can be done
by drivers in the .destroy func. However to avoid the need for so many
drivers to implement a .destroy func, just offer a next_bridge pointer to
all bridges that is automatically put it in __drm_bridge_free(), exactly
when the .destroy func is called.

Suggested-by: Maxime Ripard <mripard@kernel.org>
Link: https://lore.kernel.org/all/20251201-thick-jasmine-oarfish-1eceb0@houat/
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
 drivers/gpu/drm/drm_bridge.c |  2 ++
 include/drm/drm_bridge.h     | 11 +++++++++++
 2 files changed, 13 insertions(+)

diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 64aa69dcf46f..6dcf8f6d3ecf 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -275,6 +275,8 @@ static void __drm_bridge_free(struct kref *kref)
 	if (bridge->funcs->destroy)
 		bridge->funcs->destroy(bridge);
 
+	drm_bridge_put(bridge->next_bridge);
+
 	kfree(bridge->container);
 }
 
diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
index 8f10d2fd6016..63660256c4f5 100644
--- a/include/drm/drm_bridge.h
+++ b/include/drm/drm_bridge.h
@@ -1278,6 +1278,17 @@ struct drm_bridge {
 	 * @hpd_cb.
 	 */
 	void *hpd_data;
+
+	/**
+	 * @next_bridge: Pointer to the following bridge, automatically put
+	 * when this bridge is freed (i.e. at destroy time). This is for
+	 * drivers needing to store a pointer to the next bridge in the
+	 * chain, and ensures any code still holding a reference to this
+	 * bridge after its removal cannot use-after-free the next
+	 * bridge. Any other bridge pointers stored by the driver must be
+	 * put in the .destroy callback by driver code.
+	 */
+	struct drm_bridge *next_bridge;
 };
 
 static inline struct drm_bridge *

-- 
2.52.0

