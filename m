Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D0D9199230;
	Tue, 31 Dec 2024 10:40:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735641630; cv=none; b=XZuUUZswYeZrBSZDRKZVqmN+whcltv0fcPkJ452f8O3/L+qpWgFYEAzKlkcWC4boH605DbeIMBoQh97yZgPldJ9SI/O8x8yU390inV4c21iqFUfrQj3fOJ9zZp1Li3HvKyE0iuuRnVw9bXl6B+YRLkmSoQkbBCCYl+c4bdQX8ms=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735641630; c=relaxed/simple;
	bh=1eUewscTjwOt0WWhQpbvOF2ADhVG4fkl6tFSRx2gCdY=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=U4dX26UtRDSV9Sz7wZYTDUmMkh7z9RVrP7V3LkT2RXgvNtxIa9vwxyd+cX+cl7Zqi0lUy/RLemPF1caA3zSw1nAj/qTioqRn5IWL7WV8MdiznFBUwPtJrp7ynt1gycj6qYs0jt0Pceh8cJk9u3frp+u++tx8Z0T1HSuizkJhvPc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=YVHsRKu1; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="YVHsRKu1"
Received: by mail.gandi.net (Postfix) with ESMTPSA id 2C459FF809;
	Tue, 31 Dec 2024 10:40:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735641626;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=5spdtsuPp+u1VNzPSbXTjsRuHOgdZOi+G4vXrmIfO38=;
	b=YVHsRKu1ZmAMCJF6LBakIfnJ0Zun+wi3LyZY2btFOmM7UcqeVYJxBNuTZn7UQb2mDIOpaP
	VJWlUxzMrSk+b7swGgczM6rbm0aAzhaKaanocbIUpgMbjEzBADifFNrvg2LPh7RbsxX6p5
	ZJ2MlWslDXYZUUROvaI1BjtgPfk95A2z0OCLni7rq9WF+aRr/uXwgiFVpg6+tUn0dPMw4l
	U2O0ddK1gUoLSNUq43u1emYf/cCG/SVHhg2jjabcahPdDqT3JzyvEh1itFeY7Pd7qN6Beq
	8sgFFw0MrWiSluebylysYjkHfYOXhIkeBk0KZ1/MVfUCMnwU0sCVVo18EnOt4A==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 31 Dec 2024 11:39:58 +0100
Subject: [PATCH v5 04/10] drm/bridge: add documentation of refcounted
 bridges
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241231-hotplug-drm-bridge-v5-4-173065a1ece1@bootlin.com>
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

Document in detail the new refcounted bridges as well as the "legacy" way.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

This patch was added in v5.
---
 Documentation/gpu/drm-kms-helpers.rst |   6 ++
 drivers/gpu/drm/drm_bridge.c          | 122 ++++++++++++++++++++++++++++++++++
 2 files changed, 128 insertions(+)

diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/drm-kms-helpers.rst
index 8cf2f041af4704875910ce8228ae04615d0f21bd..ca2cfef2101988933e1464fe146997c1a661a117 100644
--- a/Documentation/gpu/drm-kms-helpers.rst
+++ b/Documentation/gpu/drm-kms-helpers.rst
@@ -151,6 +151,12 @@ Overview
 .. kernel-doc:: drivers/gpu/drm/drm_bridge.c
    :doc: overview
 
+Bridge lifecycle
+----------------
+
+.. kernel-doc:: drivers/gpu/drm/drm_bridge.c
+   :doc: bridge lifecycle
+
 Display Driver Integration
 --------------------------
 
diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
index 6255ef59f73d8041a8cb7f2c6e23e5a67d1ae926..e9f138aa5b3270b4e3a1a56dc8d4b7e5f993c929 100644
--- a/drivers/gpu/drm/drm_bridge.c
+++ b/drivers/gpu/drm/drm_bridge.c
@@ -60,6 +60,128 @@
  * encoder chain.
  */
 
+/**
+ * DOC: bridge lifecycle
+ *
+ * Allocation, initializion and teardown of a bridge can be implemented in
+ * one of two ways: *refcounted* mode and *legacy* mode.
+ *
+ * In **refcounted** mode:
+ *
+ * - each &struct drm_bridge is reference counted since its instantiation
+ * - any code taking a pointer to a bridge has get and put APIs to refcount
+ *   it and so ensure the bridge won't be deallocated while using it
+ * - deallocation is done when the last put happens and the refcount drops
+ *   to zero
+ * - the driver instantiating the bridge also holds a reference, but the
+ *   allocated struct can survive it
+ *
+ * A bridge using refcounted mode is called a *refcounted bridge*.
+ *
+ * In **legacy** mode the &struct drm_bridge lifetime is tied to the device
+ * instantiating it: it is allocated on probe and freed on removal. Any
+ * other kernel entities holding a pointer to the bridge could incur in
+ * use-after-free in case the bridge is deallocated at runtime.
+ *
+ * Legacy mode used to be the only one until refcounted bridges were
+ * introduced, hance the name. It is still fine in case the bridges are a
+ * fixed part of the pipeline, i.e. if the bridges are removed only when
+ * tearing down the entire card. Refcounted bridges support both that case
+ * and the case of more dynamic hardware with bridges that can be removed
+ * at runtime without tearing down the entire card.
+ *
+ * Usage of refcounted bridges happens in two sides: the driver
+ * implementing the bridge and the code using the bridge.
+ *
+ * For *drivers implemeting the bridge*, in both refcounted and legacy
+ * modes the common and expected pattern is that the driver declares a
+ * driver-specific struct embedding a &struct drm_bridge. E.g.::
+ *
+ *   struct my_bridge {
+ *       ...
+ *       struct drm_bridge bridge;
+ *       ...
+ *   };
+ *
+ * When using refcounted mode, the driver should allocate ``struct
+ * my_bridge`` using regular allocation (as opposed to ``devm_`` or
+ * ``drmm_`` allocation), call drm_bridge_init() immediately afterwards to
+ * transfer lifecycle management to the DRM bridge core, and implement a
+ * ``.destroy`` function to deallocate the ``struct my_bridge``, as in this
+ * example::
+ *
+ *     static void my_bridge_destroy(struct drm_bridge *bridge)
+ *     {
+ *         kfree(container_of(bridge, struct my_bridge, bridge));
+ *     }
+ *
+ *     static const struct drm_bridge_funcs my_bridge_funcs = {
+ *         .destroy = my_bridge_destroy,
+ *         ...
+ *     };
+ *
+ *     static int my_bridge_probe(...)
+ *     {
+ *         struct my_bridge *mybr;
+ *         int err;
+ *
+ *         mybr = kzalloc(sizeof(*mybr), GFP_KERNEL);
+ *         if (!mybr)
+ *             return -ENOMEM;
+ *
+ *         err = drm_bridge_init(dev, &mybr->bridge, &my_bridge_funcs);
+ *         if (err)
+ *             return err;
+ *
+ *         ...
+ *         drm_bridge_add();
+ *         ...
+ *     }
+ *
+ *     static void my_bridge_remove()
+ *     {
+ *         struct my_bridge *mybr = ...;
+ *         drm_bridge_remove(&mybr->bridge);
+ *         // ... NO kfree here!
+ *     }
+ *
+ * In legacy mode, the driver can either use ``devm_`` allocation or
+ * equivalently free ``struct my_bridge`` in their remove function::
+ *
+ *     static int my_bridge_probe(...)
+ *     {
+ *         struct my_bridge *mybr;
+ *
+ *         mybr = devm_kzalloc(dev, sizeof(*mybr), GFP_KERNEL);
+ *         if (!mybr)
+ *             return -ENOMEM;
+ *
+ *         ...
+ *         drm_bridge_add();
+ *         ...
+ *     }
+ *
+ *     static void my_bridge_remove()
+ *     {
+ *         struct my_bridge *mybr = ...;
+ *         drm_bridge_remove(&mybr->bridge);
+ *         // kfree(mybr) if not using devm_*() for allocation
+ *     }
+ *
+ * The *code using the bridge* is all the code taking a &struct drm_bridge
+ * pointer, including other bridges, encoders and the DRM core. As the
+ * bridge could be removed at any time, such code can incur in
+ * use-after-free. To void that, it has to call drm_bridge_get() when
+ * taking a pointer and drm_bridge_put() after it has done using it. This
+ * will extend the allocation lifetime of the bridge struct until the last
+ * reference has been put, potentially after the bridge device has been
+ * removed from the kernel.
+ *
+ * Calling drm_bridge_get() and drm_bridge_put() on a bridge that is not
+ * refcounted does nothing, so code using these two APIs will work both on
+ * refcounted bridges and non-refcounted ones.
+ */
+
 /**
  * DOC:	display driver integration
  *

-- 
2.34.1

