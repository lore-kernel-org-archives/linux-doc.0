Received: from relay9-d.mail.gandi.net (relay9-d.mail.gandi.net [217.70.183.199])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4824D2114;
	Tue, 31 Dec 2024 10:40:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.70.183.199
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735641627; cv=none; b=ahGDnhR4fZHOKgtRzr3p0piY/EeaipXJB+O4SMMSDC0KkrMNVhyv2V8NQcTUiZ6kGZrJX1e6rGagKrx4/8BbNx731YYOXCHzb58icBTiF6ieNZaTx+bkY5EaQy1pR94LMEOa8rvQYt00EvFUNUz95M1JC2znmnD195Y9s6DIYzg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735641627; c=relaxed/simple;
	bh=xSN9YxMqUfvd0ilIdREZNIejV8mYM/Bsq11M4a1vq4M=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=b35Pi9d1HZjEbm22ZmPErSklrGQxkdAeIzVN8ipi8yA1ZDoFxv64v4CrTix/TMSa5D13ysCOgkSGvIIpnxM0+SfdYBJZVQrqmIfWBpUBNt74PXCmQKeL1H6+IkvVNN8xB7qWq1/IPDLEeW4Lw9tWD+QfK7qoGLoogyG11F6pM80=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=WPAPKtUY; arc=none smtp.client-ip=217.70.183.199
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="WPAPKtUY"
Received: by mail.gandi.net (Postfix) with ESMTPSA id D16AEFF804;
	Tue, 31 Dec 2024 10:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1735641616;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=W8zUqXj3O8IYkBLRhov4a12tIG87b03AACsNoJSr458=;
	b=WPAPKtUY3pxjlFskCb8iIB53zr8YVO4xMR3hikXeN47PjsuMjsWfGhduVtXvg0YRlVCNWO
	TkDY0bdJwxtsfjKK/H80zQiAZfgiBxG3WxvRZXPPl1oP8vpBu7dnoj76ZgYPdszVZq3Kij
	YvcVAn+TH2z8qlWVSMc0j5/l2bL3gmi+Dm3OArDegpwrykTN6l8a8VhDYaMRsGJzh+rxZ7
	DfvUZz1EQlvBS3Vfeb1EPMof9wWxcnaDKryjJqCJLWf6l+RkncccXxzrmXUsA3IeJDz0Zb
	OVDWxO6UvcJk2T2Ax832es2Ge4kwPrXbnPXUSjF7us0fXrj8NkOl7xzn5i2U2A==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: [PATCH v5 00/10] Add support for hot-pluggable DRM bridges
Date: Tue, 31 Dec 2024 11:39:54 +0100
Message-Id: <20241231-hotplug-drm-bridge-v5-0-173065a1ece1@bootlin.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAPvJc2cC/23PzWrDMAwH8FcpPs/D8leSnvoeZYfJVhJDGwcnN
 R0l7z6nDAJLjn8h/SS92EQp0MTOpxdLlMMU4lCC+Tgx138PHfHgS2ZSSC0UNLyP83h7dNynO8c
 UfOkAi7UlW7XUSFYGx0RteL7R61fJfZjmmH7eOzKs1T9O2iMuAxdcowE0hJXx5oIxzrcwfLp4Z
 yuY5YYYEIeILAg5JVvprPXG7hG1IbU4fCyrgqB2UNWqFuiaPaI3pIHqENEr4rRviSwg/btkWZZ
 f0vZr4IUBAAA=
X-Change-ID: 20240319-hotplug-drm-bridge-16b86e67fe92
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

Hello,

this series aims at supporting Linux devices with a DRM pipeline whose
final components can be hot-plugged and hot-unplugged, including one or
more bridges.

If you already know the use case and the approach, feel free to skip to
"Roadmap and current status" below for the ongoing changes.

Use case
========

This series targets a professional product (GE SUNH) that is composed of a
"main" part running on battery, with the main SoC and able to work
autonomously with limited features, and an optional "add-on" that enables
more features by adding more hardware peripherals.

The hotplug connector has a MIPI DSI bus. The addon has a DSI-to-LVDS
bridge and an LVDS panel attached to it. Different addon models can have
different components. As a consequence, a DRM bridge must be added and
removed at runtime without tearing down the whole card, which is currently
not possible.

Up to v4 (link at the bottom) there was a single patch series implementing
both the hotplug connector driver (based on device tree overlays) and the
DRM aspects. Starting with v5 we have split the two series to let each part
of the work progress with its own pace.

DRM hotplug bridge driver
=========================

DRM natively supports pipelines whose display can be removed, but all the
components preceding it (all the display controller and any bridges) are
assumed to be fixed and cannot be plugged, removed or modified at runtime.

This series adds support for DRM pipelines having a removable part after
the encoder, thus also allowing bridges to be removed and reconnected at
runtime, possibly with different components.

This picture summarizes the DRM structure implemented by this series:

 .------------------------.
 |   DISPLAY CONTROLLER   |
 | .---------.   .------. |
 | | ENCODER |<--| CRTC | |
 | '---------'   '------' |
 '------|-----------------'
        |
        |DSI            HOTPLUG
        V              CONNECTOR
   .---------.        .--.    .-.        .---------.         .-------.
   | 0 to N  |        | _|   _| |        | 1 to N  |         |       |
   | BRIDGES |--DSI-->||_   |_  |--DSI-->| BRIDGES |--LVDS-->| PANEL |
   |         |        |  |    | |        |         |         |       |
   '---------'        '--'    '-'        '---------'         '-------'

 [--- fixed components --]  [----------- removable add-on -----------]

Fixed components include:

 * all components up to the DRM encoder, usually part of the SoC
 * optionally some bridges, in the SoC and/or as external chips

Components on the removable add-on include:

 * one or more bridges
 * a fixed connector (not one natively supporting hotplug such as HDMI)
 * the panel

The video bus is MIPI DSI in the example and in the implementation provided
by this series, but the implementation is meant to allow generalization to
other video busses without native hotplug support, such as parallel video
and LVDS.

Note that the term "connector" in this context is different from the "DRM
connector" abstraction already present in the DRM subsystem (struct
drm_connector).

More details in the commit message of patch 4.

Roadmap and current status
==========================

Up to v4 the design idea was heavily based on a "hotplug bridge driver" to
decouple the two sides of the DRM pipeline. After a long discussion during
Linux Plumbers Conference 2024, a different strategy was agreed with other
DRM developers, which adds:

 1. add refcounting to DRM bridges (struct drm_bridge)
 2. handle gracefully atomic updates during bridge removal
 3. avoid DSI host drivers to have dangling pointers to DSI devices
 4. finish the hotplug bridge work, moving code to the core and
    potentially removing the hotplug-bridge itself (this needs to be
    clarified as points 1-3 are developed)

This version implements the first item. Items 2-4 have not yet been
developed. This version is sent to allow discussing the bridge refcounting
implementation as soon as possible.

Patch series overview
=====================

 * 2 Preliminary patches (may to be removed as this work progresses):
   - drm/bridge: allow bridges to be informed about added and removed bridges
   - drm/encoder: add drm_encoder_cleanup_from()

 * Implement refcounting in the drm_bridge core:
   - drm/bridge: add support for refcounted DRM bridges
   - drm/tests: bridge: add KUnit tests for DRM bridges (init and destroy)
   - drm/bridge: add documentation of refcounted bridges

 * Adapt some existing bridges to be refcounted and/or to refcount bridges
   they take a pointer to:
   - drm/bridge: ti-sn65dsi83: use dynamic lifetime management
   - drm/bridge: panel: use dynamic lifetime management
   - drm/bridge: samsung-dsim: use supporting variable for out_bridge
   - drm/bridge: samsung-dsim: refcount the out_bridge

 * Add hotplug-bridge (may be removed as this work progresses): 
   - drm/bridge: hotplug-bridge: add driver to support hot-pluggable DSI bridges

That's all
==========

Thanks for you patience in reading this!

Luca

Changes in v5:
- Implemented DRM bridge refcounting
- removed the non-DRM patches, now in a separate series
- Updated To/Cc list
- Link to v4: https://lore.kernel.org/r/20240917-hotplug-drm-bridge-v4-0-bc4dfee61be6@bootlin.com

Changes in v4:
- Replaced DRM bridge notifier with a new callback in struct drm_bridge_funcs
- Added patch for missing devlink (LEDs used by backlight)
- Various cleanups
- Rebased on v6.11
- Link to v3: https://lore.kernel.org/r/20240809-hotplug-drm-bridge-v3-0-b4c178380bc9@bootlin.com

Changes in v3 (too many changes in v3 to mention them all, but here are the
big ones):
- Rewrote the DT format to allow fully decoupled overlays and to avoid
  adding properties (with the NVMEM exception still to be solved)
- Implemented device instantiation based on the new DT format: i2c in
  i2c-core-of.c nobus-devices in the connector driver
- DRM: insert/remove an LVDS DRM connector on hot(un)plug events
- Added patch for a devlink issue on overlay removal (mostly to start
  discussion)
- Link to v2: https://lore.kernel.org/r/20240510-hotplug-drm-bridge-v2-0-ec32f2c66d56@bootlin.com

Changes in v2:
- Added bindings and driver for ge,sunh-addon-connector
- Removed bindings for the hotplug-video-connector, this is now represented
  in DT as part of the ge,sunh-addon-connector
- Various monior improvements to the DRM hotplug-bridge driver
- Link to v1: https://lore.kernel.org/r/20240326-hotplug-drm-bridge-v1-0-4b51b5eb75d5@bootlin.com

Co-developed-by: Paul Kocialkowski <paul.kocialkowski@bootlin.com>
Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
---
Luca Ceresoli (10):
      drm/bridge: allow bridges to be informed about added and removed bridges
      drm/encoder: add drm_encoder_cleanup_from()
      drm/bridge: add support for refcounted DRM bridges
      drm/bridge: add documentation of refcounted bridges
      drm/tests: bridge: add KUnit tests for DRM bridges (init and destroy)
      drm/bridge: ti-sn65dsi83: use dynamic lifetime management
      drm/bridge: panel: use dynamic lifetime management
      drm/bridge: samsung-dsim: use supporting variable for out_bridge
      drm/bridge: samsung-dsim: refcount the out_bridge
      drm/bridge: hotplug-bridge: add driver to support hot-pluggable DSI bridges

 Documentation/gpu/drm-kms-helpers.rst   |   6 +
 MAINTAINERS                             |   5 +
 drivers/gpu/drm/bridge/Kconfig          |  17 +
 drivers/gpu/drm/bridge/Makefile         |   1 +
 drivers/gpu/drm/bridge/hotplug-bridge.c | 695 ++++++++++++++++++++++++++++++++
 drivers/gpu/drm/bridge/panel.c          |  20 +-
 drivers/gpu/drm/bridge/samsung-dsim.c   |  26 +-
 drivers/gpu/drm/bridge/ti-sn65dsi83.c   |  13 +-
 drivers/gpu/drm/drm_bridge.c            | 221 ++++++++++
 drivers/gpu/drm/drm_encoder.c           |  21 +
 drivers/gpu/drm/tests/Makefile          |   1 +
 drivers/gpu/drm/tests/drm_bridge_test.c | 128 ++++++
 include/drm/drm_bridge.h                | 125 ++++++
 include/drm/drm_encoder.h               |   1 +
 14 files changed, 1261 insertions(+), 19 deletions(-)
---
base-commit: be4c56b4b053bc75d98260740df4f9ec261c9699
change-id: 20240319-hotplug-drm-bridge-16b86e67fe92

Best regards,
-- 
Luca Ceresoli <luca.ceresoli@bootlin.com>

