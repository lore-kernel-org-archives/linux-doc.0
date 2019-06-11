Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A5B1F7D2EF
	for <lwn-linux-doc@archive.lwn.net>; Tue, 11 Jun 2019 16:09:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389344AbfFKQJj (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 11 Jun 2019 12:09:39 -0400
Received: from mail-qt1-f193.google.com ([209.85.160.193]:36391 "EHLO
        mail-qt1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387814AbfFKQJj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 11 Jun 2019 12:09:39 -0400
Received: by mail-qt1-f193.google.com with SMTP id p15so7790266qtl.3
        for <linux-doc@vger.kernel.org>; Tue, 11 Jun 2019 09:09:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=poorly.run; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=iXk3In61G/xVZVremlzhKSVYIWcrDPo+B818qbXfT4U=;
        b=ApImcsDHgY9DuJPSsiAQBL7oJdObheTioD4GcA61c47UozVbu7S2pHBUdcKQk+Wpkx
         ZNiE8OJrlh4DQ/LagDKUiG2nLjuTlu6FNO6r+bObn030KcRWbk3xROMghSrtIPlli9Dq
         9OL77zL9k+/LkloRI1rdKkncTrGSxa6YcTd1Qc/YG1WyAnqPHuCrVDhlWwXCtOBVZx0t
         EmIF3mn/Qcbq5CrcZNBIqF/8LIEaHl5mp19V86iq+M8HIZAyjhCVSY7kV7QLo7ALdzRv
         +yIfDciTV/ffteMUFiz8uv0j+CmoYc8cP+Aler9WmWUR6lXOm1rVtcGLf1QIX+q8wshJ
         z74Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=iXk3In61G/xVZVremlzhKSVYIWcrDPo+B818qbXfT4U=;
        b=od0o0XattPrh+IGUN7p1+b1Jdi9H33cx1cNszi9wGQjlxrk9apIAfwPU+PwOCJJ2Wk
         NndYVmXGNhIp5UINPyMQNJU9jCRX3Sh4iewxpTw5nVDywGHucFL0l1KsZB9v5FSbrCoo
         YBayDwOO8yIG4MmNA+rHQ0U1VywJms9zoEpHpskJL0m7/oyGee2L1cGi5EJG0aMUS2h0
         mOAA462QQlN25c6QbEO88xvLJhPCV9KfhQuIgmCKjPemtxfHELoWPPrZEIVcCU+xtFKF
         tKFfxNbdSq+x7eEs4Wn2TSMrSLMHk5Kb4r03ZhpQ7Ew7zykh+z6GIfUlkrhu8O/9npBC
         te8A==
X-Gm-Message-State: APjAAAUzMpQZ96PTgTMtaV8nmH+7/39meOLdd2O9w+OnGOLTyNb5o59I
        e91+SpsL0swAI4y5wWyFbCT1hg==
X-Google-Smtp-Source: APXvYqzFJhkt3GwRHx33Av6pxPu4r3CVStuPZPJba8WsR8RH6rwaS7G4imFGuZdRxHC5scFqIZX/rw==
X-Received: by 2002:a0c:880b:: with SMTP id 11mr44882459qvl.185.1560269377622;
        Tue, 11 Jun 2019 09:09:37 -0700 (PDT)
Received: from rosewood.cam.corp.google.com ([2620:0:1013:11:89c6:2139:5435:371d])
        by smtp.gmail.com with ESMTPSA id d188sm6755094qkf.40.2019.06.11.09.09.36
        (version=TLS1_3 cipher=AEAD-AES256-GCM-SHA384 bits=256/256);
        Tue, 11 Jun 2019 09:09:37 -0700 (PDT)
From:   Sean Paul <sean@poorly.run>
To:     dri-devel@lists.freedesktop.org
Cc:     Sean Paul <seanpaul@chromium.org>, Daniel Vetter <daniel@ffwll.ch>,
        Jose Souza <jose.souza@intel.com>,
        Zain Wang <wzz@rock-chips.com>,
        Tomasz Figa <tfiga@chromium.org>,
        =?UTF-8?q?Ville=20Syrj=C3=A4l=C3=A4?= 
        <ville.syrjala@linux.intel.com>, Heiko Stuebner <heiko@sntech.de>,
        David Airlie <airlied@linux.ie>,
        Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
        Maxime Ripard <maxime.ripard@bootlin.com>,
        Sean Paul <sean@poorly.run>, Jonathan Corbet <corbet@lwn.net>,
        linux-doc@vger.kernel.org
Subject: [PATCH v5 05/11] drm: Add helpers to kick off self refresh mode in drivers
Date:   Tue, 11 Jun 2019 12:08:19 -0400
Message-Id: <20190611160844.257498-6-sean@poorly.run>
X-Mailer: git-send-email 2.22.0.rc2.383.gf4fbbf30c2-goog
In-Reply-To: <20190611160844.257498-1-sean@poorly.run>
References: <20190611160844.257498-1-sean@poorly.run>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Sean Paul <seanpaul@chromium.org>

This patch adds a new drm helper library to help drivers implement
self refresh. Drivers choosing to use it will register crtcs and
will receive callbacks when it's time to enter or exit self refresh
mode.

In its current form, it has a timer which will trigger after a
driver-specified amount of inactivity. When the timer triggers, the
helpers will submit a new atomic commit to shut the refreshing pipe
off. On the next atomic commit, the drm core will revert the self
refresh state and bring everything back up to be actively driven.

From the driver's perspective, this works like a regular disable/enable
cycle. The driver need only check the 'self_refresh_active' state in
crtc_state. It should initiate self refresh mode on the panel and enter
an off or low-power state.

Changes in v2:
- s/psr/self_refresh/ (Daniel)
- integrated the psr exit into the commit that wakes it up (Jose/Daniel)
- made the psr state per-crtc (Jose/Daniel)
Changes in v3:
- Remove the self_refresh_(active|changed) from connector state (Daniel)
- Simplify loop in drm_self_refresh_helper_alter_state (Daniel)
- Improve self_refresh_aware comment (Daniel)
- s/self_refresh_state/self_refresh_data/ (Daniel)
Changes in v4:
- Move docbook location below panel (Daniel)
- Improve docbook with references and more detailed explanation (Daniel)
- Instead of register/unregister, use init/cleanup (Daniel)
Changes in v5:
- Resolved conflict in drm_atomic_helper.c #include block
- Resolved conflict in rst with HDCP helper docs

Link to v1: https://patchwork.freedesktop.org/patch/msgid/20190228210939.83386-2-sean@poorly.run
Link to v2: https://patchwork.freedesktop.org/patch/msgid/20190326204509.96515-1-sean@poorly.run
Link to v3: https://patchwork.freedesktop.org/patch/msgid/20190502194956.218441-6-sean@poorly.run
Link to v4: https://patchwork.freedesktop.org/patch/msgid/20190508160920.144739-6-sean@poorly.run

Cc: Daniel Vetter <daniel@ffwll.ch>
Cc: Jose Souza <jose.souza@intel.com>
Cc: Zain Wang <wzz@rock-chips.com>
Cc: Tomasz Figa <tfiga@chromium.org>
Cc: Ville Syrjälä <ville.syrjala@linux.intel.com>
Tested-by: Heiko Stuebner <heiko@sntech.de>
Reviewed-by: Daniel Vetter <daniel@ffwll.ch>
Signed-off-by: Sean Paul <seanpaul@chromium.org>
---
 Documentation/gpu/drm-kms-helpers.rst     |   9 +
 drivers/gpu/drm/Makefile                  |   2 +-
 drivers/gpu/drm/drm_atomic.c              |   2 +
 drivers/gpu/drm/drm_atomic_helper.c       |  35 +++-
 drivers/gpu/drm/drm_atomic_state_helper.c |   4 +
 drivers/gpu/drm/drm_atomic_uapi.c         |   7 +-
 drivers/gpu/drm/drm_self_refresh_helper.c | 213 ++++++++++++++++++++++
 include/drm/drm_atomic.h                  |  15 ++
 include/drm/drm_connector.h               |  14 ++
 include/drm/drm_crtc.h                    |  19 ++
 include/drm/drm_self_refresh_helper.h     |  22 +++
 11 files changed, 337 insertions(+), 5 deletions(-)
 create mode 100644 drivers/gpu/drm/drm_self_refresh_helper.c
 create mode 100644 include/drm/drm_self_refresh_helper.h

diff --git a/Documentation/gpu/drm-kms-helpers.rst b/Documentation/gpu/drm-kms-helpers.rst
index 0fe726a6ee678..b327bbc111821 100644
--- a/Documentation/gpu/drm-kms-helpers.rst
+++ b/Documentation/gpu/drm-kms-helpers.rst
@@ -181,6 +181,15 @@ Panel Helper Reference
 .. kernel-doc:: drivers/gpu/drm/drm_panel_orientation_quirks.c
    :export:
 
+Panel Self Refresh Helper Reference
+===================================
+
+.. kernel-doc:: drivers/gpu/drm/drm_self_refresh_helper.c
+   :doc: overview
+
+.. kernel-doc:: drivers/gpu/drm/drm_self_refresh_helper.c
+   :export:
+
 HDCP Helper Functions Reference
 ===============================
 
diff --git a/drivers/gpu/drm/Makefile b/drivers/gpu/drm/Makefile
index d36feb4a62330..9d630a28a7880 100644
--- a/drivers/gpu/drm/Makefile
+++ b/drivers/gpu/drm/Makefile
@@ -43,7 +43,7 @@ drm_kms_helper-y := drm_crtc_helper.o drm_dp_helper.o drm_dsc.o drm_probe_helper
 		drm_simple_kms_helper.o drm_modeset_helper.o \
 		drm_scdc_helper.o drm_gem_framebuffer_helper.o \
 		drm_atomic_state_helper.o drm_damage_helper.o \
-		drm_format_helper.o
+		drm_format_helper.o drm_self_refresh_helper.o
 
 drm_kms_helper-$(CONFIG_DRM_PANEL_BRIDGE) += bridge/panel.o
 drm_kms_helper-$(CONFIG_DRM_FBDEV_EMULATION) += drm_fb_helper.o
diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index a4e779deab0fb..419381abbdd16 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -384,6 +384,7 @@ static void drm_atomic_crtc_print_state(struct drm_printer *p,
 	drm_printf(p, "crtc[%u]: %s\n", crtc->base.id, crtc->name);
 	drm_printf(p, "\tenable=%d\n", state->enable);
 	drm_printf(p, "\tactive=%d\n", state->active);
+	drm_printf(p, "\tself_refresh_active=%d\n", state->self_refresh_active);
 	drm_printf(p, "\tplanes_changed=%d\n", state->planes_changed);
 	drm_printf(p, "\tmode_changed=%d\n", state->mode_changed);
 	drm_printf(p, "\tactive_changed=%d\n", state->active_changed);
@@ -999,6 +1000,7 @@ static void drm_atomic_connector_print_state(struct drm_printer *p,
 
 	drm_printf(p, "connector[%u]: %s\n", connector->base.id, connector->name);
 	drm_printf(p, "\tcrtc=%s\n", state->crtc ? state->crtc->name : "(null)");
+	drm_printf(p, "\tself_refresh_aware=%d\n", state->self_refresh_aware);
 
 	if (connector->connector_type == DRM_MODE_CONNECTOR_WRITEBACK)
 		if (state->writeback_job && state->writeback_job->fb)
diff --git a/drivers/gpu/drm/drm_atomic_helper.c b/drivers/gpu/drm/drm_atomic_helper.c
index e58be69960692..bc43cc08cdc11 100644
--- a/drivers/gpu/drm/drm_atomic_helper.c
+++ b/drivers/gpu/drm/drm_atomic_helper.c
@@ -33,6 +33,7 @@
 #include <drm/drm_damage_helper.h>
 #include <drm/drm_device.h>
 #include <drm/drm_plane_helper.h>
+#include <drm/drm_self_refresh_helper.h>
 #include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
 #include <drm/drm_writeback.h>
@@ -953,10 +954,33 @@ int drm_atomic_helper_check(struct drm_device *dev,
 	if (state->legacy_cursor_update)
 		state->async_update = !drm_atomic_helper_async_check(dev, state);
 
+	drm_self_refresh_helper_alter_state(state);
+
 	return ret;
 }
 EXPORT_SYMBOL(drm_atomic_helper_check);
 
+static bool
+crtc_needs_disable(struct drm_crtc_state *old_state,
+		   struct drm_crtc_state *new_state)
+{
+	/*
+	 * No new_state means the crtc is off, so the only criteria is whether
+	 * it's currently active or in self refresh mode.
+	 */
+	if (!new_state)
+		return drm_atomic_crtc_effectively_active(old_state);
+
+	/*
+	 * We need to run through the crtc_funcs->disable() function if the crtc
+	 * is currently on, if it's transitioning to self refresh mode, or if
+	 * it's in self refresh mode and needs to be fully disabled.
+	 */
+	return old_state->active ||
+	       (old_state->self_refresh_active && !new_state->enable) ||
+	       new_state->self_refresh_active;
+}
+
 static void
 disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
 {
@@ -977,7 +1001,14 @@ disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
 
 		old_crtc_state = drm_atomic_get_old_crtc_state(old_state, old_conn_state->crtc);
 
-		if (!old_crtc_state->active ||
+		if (new_conn_state->crtc)
+			new_crtc_state = drm_atomic_get_new_crtc_state(
+						old_state,
+						new_conn_state->crtc);
+		else
+			new_crtc_state = NULL;
+
+		if (!crtc_needs_disable(old_crtc_state, new_crtc_state) ||
 		    !drm_atomic_crtc_needs_modeset(old_conn_state->crtc->state))
 			continue;
 
@@ -1023,7 +1054,7 @@ disable_outputs(struct drm_device *dev, struct drm_atomic_state *old_state)
 		if (!drm_atomic_crtc_needs_modeset(new_crtc_state))
 			continue;
 
-		if (!old_crtc_state->active)
+		if (!crtc_needs_disable(old_crtc_state, new_crtc_state))
 			continue;
 
 		funcs = crtc->helper_private;
diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 97ab26679b969..7d7347a6f1943 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -129,6 +129,10 @@ void __drm_atomic_helper_crtc_duplicate_state(struct drm_crtc *crtc,
 	state->commit = NULL;
 	state->event = NULL;
 	state->pageflip_flags = 0;
+
+	/* Self refresh should be canceled when a new update is available */
+	state->active = drm_atomic_crtc_effectively_active(state);
+	state->self_refresh_active = false;
 }
 EXPORT_SYMBOL(__drm_atomic_helper_crtc_duplicate_state);
 
diff --git a/drivers/gpu/drm/drm_atomic_uapi.c b/drivers/gpu/drm/drm_atomic_uapi.c
index eb22e8bdd8531..abe38bdf85ae6 100644
--- a/drivers/gpu/drm/drm_atomic_uapi.c
+++ b/drivers/gpu/drm/drm_atomic_uapi.c
@@ -490,7 +490,7 @@ drm_atomic_crtc_get_property(struct drm_crtc *crtc,
 	struct drm_mode_config *config = &dev->mode_config;
 
 	if (property == config->prop_active)
-		*val = state->active;
+		*val = drm_atomic_crtc_effectively_active(state);
 	else if (property == config->prop_mode_id)
 		*val = (state->mode_blob) ? state->mode_blob->base.id : 0;
 	else if (property == config->prop_vrr_enabled)
@@ -788,7 +788,10 @@ drm_atomic_connector_get_property(struct drm_connector *connector,
 	if (property == config->prop_crtc_id) {
 		*val = (state->crtc) ? state->crtc->base.id : 0;
 	} else if (property == config->dpms_property) {
-		*val = connector->dpms;
+		if (state->crtc && state->crtc->state->self_refresh_active)
+			*val = DRM_MODE_DPMS_ON;
+		else
+			*val = connector->dpms;
 	} else if (property == config->tv_select_subconnector_property) {
 		*val = state->tv.subconnector;
 	} else if (property == config->tv_left_margin_property) {
diff --git a/drivers/gpu/drm/drm_self_refresh_helper.c b/drivers/gpu/drm/drm_self_refresh_helper.c
new file mode 100644
index 0000000000000..c7083c5694fee
--- /dev/null
+++ b/drivers/gpu/drm/drm_self_refresh_helper.c
@@ -0,0 +1,213 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright (C) 2019 Google, Inc.
+ *
+ * Authors:
+ * Sean Paul <seanpaul@chromium.org>
+ */
+#include <drm/drm_atomic.h>
+#include <drm/drm_atomic_helper.h>
+#include <drm/drm_connector.h>
+#include <drm/drm_crtc.h>
+#include <drm/drm_device.h>
+#include <drm/drm_mode_config.h>
+#include <drm/drm_modeset_lock.h>
+#include <drm/drm_print.h>
+#include <drm/drm_self_refresh_helper.h>
+#include <linux/bitops.h>
+#include <linux/slab.h>
+#include <linux/workqueue.h>
+
+/**
+ * DOC: overview
+ *
+ * This helper library provides an easy way for drivers to leverage the atomic
+ * framework to implement panel self refresh (SR) support. Drivers are
+ * responsible for initializing and cleaning up the SR helpers on load/unload
+ * (see &drm_self_refresh_helper_init/&drm_self_refresh_helper_cleanup).
+ * The connector is responsible for setting
+ * &drm_connector_state.self_refresh_aware to true at runtime if it is SR-aware
+ * (meaning it knows how to initiate self refresh on the panel).
+ *
+ * Once a crtc has enabled SR using &drm_self_refresh_helper_init, the
+ * helpers will monitor activity and call back into the driver to enable/disable
+ * SR as appropriate. The best way to think about this is that it's a DPMS
+ * on/off request with &drm_crtc_state.self_refresh_active set in crtc state
+ * that tells you to disable/enable SR on the panel instead of power-cycling it.
+ *
+ * During SR, drivers may choose to fully disable their crtc/encoder/bridge
+ * hardware (in which case no driver changes are necessary), or they can inspect
+ * &drm_crtc_state.self_refresh_active if they want to enter low power mode
+ * without full disable (in case full disable/enable is too slow).
+ *
+ * SR will be deactivated if there are any atomic updates affecting the
+ * pipe that is in SR mode. If a crtc is driving multiple connectors, all
+ * connectors must be SR aware and all will enter/exit SR mode at the same time.
+ *
+ * If the crtc and connector are SR aware, but the panel connected does not
+ * support it (or is otherwise unable to enter SR), the driver should fail
+ * atomic_check when &drm_crtc_state.self_refresh_active is true.
+ */
+
+struct drm_self_refresh_data {
+	struct drm_crtc *crtc;
+	struct delayed_work entry_work;
+	struct drm_atomic_state *save_state;
+	unsigned int entry_delay_ms;
+};
+
+static void drm_self_refresh_helper_entry_work(struct work_struct *work)
+{
+	struct drm_self_refresh_data *sr_data = container_of(
+				to_delayed_work(work),
+				struct drm_self_refresh_data, entry_work);
+	struct drm_crtc *crtc = sr_data->crtc;
+	struct drm_device *dev = crtc->dev;
+	struct drm_modeset_acquire_ctx ctx;
+	struct drm_atomic_state *state;
+	struct drm_connector *conn;
+	struct drm_connector_state *conn_state;
+	struct drm_crtc_state *crtc_state;
+	int i, ret;
+
+	drm_modeset_acquire_init(&ctx, 0);
+
+	state = drm_atomic_state_alloc(dev);
+	if (!state) {
+		ret = -ENOMEM;
+		goto out;
+	}
+
+retry:
+	state->acquire_ctx = &ctx;
+
+	crtc_state = drm_atomic_get_crtc_state(state, crtc);
+	if (IS_ERR(crtc_state)) {
+		ret = PTR_ERR(crtc_state);
+		goto out;
+	}
+
+	if (!crtc_state->enable)
+		goto out;
+
+	ret = drm_atomic_add_affected_connectors(state, crtc);
+	if (ret)
+		goto out;
+
+	for_each_new_connector_in_state(state, conn, conn_state, i) {
+		if (!conn_state->self_refresh_aware)
+			goto out;
+	}
+
+	crtc_state->active = false;
+	crtc_state->self_refresh_active = true;
+
+	ret = drm_atomic_commit(state);
+	if (ret)
+		goto out;
+
+out:
+	if (ret == -EDEADLK) {
+		drm_atomic_state_clear(state);
+		ret = drm_modeset_backoff(&ctx);
+		if (!ret)
+			goto retry;
+	}
+
+	drm_atomic_state_put(state);
+	drm_modeset_drop_locks(&ctx);
+	drm_modeset_acquire_fini(&ctx);
+}
+
+/**
+ * drm_self_refresh_helper_alter_state - Alters the atomic state for SR exit
+ * @state: the state currently being checked
+ *
+ * Called at the end of atomic check. This function checks the state for flags
+ * incompatible with self refresh exit and changes them. This is a bit
+ * disingenuous since userspace is expecting one thing and we're giving it
+ * another. However in order to keep self refresh entirely hidden from
+ * userspace, this is required.
+ *
+ * At the end, we queue up the self refresh entry work so we can enter PSR after
+ * the desired delay.
+ */
+void drm_self_refresh_helper_alter_state(struct drm_atomic_state *state)
+{
+	struct drm_crtc *crtc;
+	struct drm_crtc_state *crtc_state;
+	int i;
+
+	if (state->async_update || !state->allow_modeset) {
+		for_each_old_crtc_in_state(state, crtc, crtc_state, i) {
+			if (crtc_state->self_refresh_active) {
+				state->async_update = false;
+				state->allow_modeset = true;
+				break;
+			}
+		}
+	}
+
+	for_each_new_crtc_in_state(state, crtc, crtc_state, i) {
+		struct drm_self_refresh_data *sr_data;
+
+		/* Don't trigger the entry timer when we're already in SR */
+		if (crtc_state->self_refresh_active)
+			continue;
+
+		sr_data = crtc->self_refresh_data;
+		if (!sr_data)
+			continue;
+
+		mod_delayed_work(system_wq, &sr_data->entry_work,
+				 msecs_to_jiffies(sr_data->entry_delay_ms));
+	}
+}
+EXPORT_SYMBOL(drm_self_refresh_helper_alter_state);
+
+/**
+ * drm_self_refresh_helper_init - Initializes self refresh helpers for a crtc
+ * @crtc: the crtc which supports self refresh supported displays
+ * @entry_delay_ms: amount of inactivity to wait before entering self refresh
+ */
+int drm_self_refresh_helper_init(struct drm_crtc *crtc,
+				 unsigned int entry_delay_ms)
+{
+	struct drm_self_refresh_data *sr_data = crtc->self_refresh_data;
+
+	/* Helper is already initialized */
+	if (WARN_ON(sr_data))
+		return -EINVAL;
+
+	sr_data = kzalloc(sizeof(*sr_data), GFP_KERNEL);
+	if (!sr_data)
+		return -ENOMEM;
+
+	INIT_DELAYED_WORK(&sr_data->entry_work,
+			  drm_self_refresh_helper_entry_work);
+	sr_data->entry_delay_ms = entry_delay_ms;
+	sr_data->crtc = crtc;
+
+	crtc->self_refresh_data = sr_data;
+	return 0;
+}
+EXPORT_SYMBOL(drm_self_refresh_helper_init);
+
+/**
+ * drm_self_refresh_helper_cleanup - Cleans up self refresh helpers for a crtc
+ * @crtc: the crtc to cleanup
+ */
+void drm_self_refresh_helper_cleanup(struct drm_crtc *crtc)
+{
+	struct drm_self_refresh_data *sr_data = crtc->self_refresh_data;
+
+	/* Helper is already uninitialized */
+	if (sr_data)
+		return;
+
+	crtc->self_refresh_data = NULL;
+
+	cancel_delayed_work_sync(&sr_data->entry_work);
+	kfree(sr_data);
+}
+EXPORT_SYMBOL(drm_self_refresh_helper_cleanup);
diff --git a/include/drm/drm_atomic.h b/include/drm/drm_atomic.h
index f122156478010..927e1205d7aa4 100644
--- a/include/drm/drm_atomic.h
+++ b/include/drm/drm_atomic.h
@@ -957,4 +957,19 @@ drm_atomic_crtc_needs_modeset(const struct drm_crtc_state *state)
 	       state->connectors_changed;
 }
 
+/**
+ * drm_atomic_crtc_effectively_active - compute whether crtc is actually active
+ * @state: &drm_crtc_state for the CRTC
+ *
+ * When in self refresh mode, the crtc_state->active value will be false, since
+ * the crtc is off. However in some cases we're interested in whether the crtc
+ * is active, or effectively active (ie: it's connected to an active display).
+ * In these cases, use this function instead of just checking active.
+ */
+static inline bool
+drm_atomic_crtc_effectively_active(const struct drm_crtc_state *state)
+{
+	return state->active || state->self_refresh_active;
+}
+
 #endif /* DRM_ATOMIC_H_ */
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 071143bc0ebd1..c6f8486d8b8f3 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -548,6 +548,20 @@ struct drm_connector_state {
 	/** @tv: TV connector state */
 	struct drm_tv_connector_state tv;
 
+	/**
+	 * @self_refresh_aware:
+	 *
+	 * This tracks whether a connector is aware of the self refresh state.
+	 * It should be set to true for those connector implementations which
+	 * understand the self refresh state. This is needed since the crtc
+	 * registers the self refresh helpers and it doesn't know if the
+	 * connectors downstream have implemented self refresh entry/exit.
+	 *
+	 * Drivers should set this to true in atomic_check if they know how to
+	 * handle self_refresh requests.
+	 */
+	bool self_refresh_aware;
+
 	/**
 	 * @picture_aspect_ratio: Connector property to control the
 	 * HDMI infoframe aspect ratio setting.
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index dc42b9e353333..4fda610d76f26 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -54,6 +54,7 @@ struct drm_mode_set;
 struct drm_file;
 struct drm_clip_rect;
 struct drm_printer;
+struct drm_self_refresh_data;
 struct device_node;
 struct dma_fence;
 struct edid;
@@ -300,6 +301,17 @@ struct drm_crtc_state {
 	 */
 	bool vrr_enabled;
 
+	/**
+	 * @self_refresh_active:
+	 *
+	 * Used by the self refresh helpers to denote when a self refresh
+	 * transition is occuring. This will be set on enable/disable callbacks
+	 * when self refresh is being enabled or disabled. In some cases, it may
+	 * not be desirable to fully shut off the crtc during self refresh.
+	 * CRTC's can inspect this flag and determine the best course of action.
+	 */
+	bool self_refresh_active;
+
 	/**
 	 * @event:
 	 *
@@ -1088,6 +1100,13 @@ struct drm_crtc {
 	 * The name of the CRTC's fence timeline.
 	 */
 	char timeline_name[32];
+
+	/**
+	 * @self_refresh_data: Holds the state for the self refresh helpers
+	 *
+	 * Initialized via drm_self_refresh_helper_register().
+	 */
+	struct drm_self_refresh_data *self_refresh_data;
 };
 
 /**
diff --git a/include/drm/drm_self_refresh_helper.h b/include/drm/drm_self_refresh_helper.h
new file mode 100644
index 0000000000000..405e86fb8461e
--- /dev/null
+++ b/include/drm/drm_self_refresh_helper.h
@@ -0,0 +1,22 @@
+/* SPDX-License-Identifier: MIT */
+/*
+ * Copyright (C) 2019 Google, Inc.
+ *
+ * Authors:
+ * Sean Paul <seanpaul@chromium.org>
+ */
+#ifndef DRM_SELF_REFRESH_HELPER_H_
+#define DRM_SELF_REFRESH_HELPER_H_
+
+struct drm_atomic_state;
+struct drm_connector;
+struct drm_device;
+struct drm_modeset_acquire_ctx;
+
+void drm_self_refresh_helper_alter_state(struct drm_atomic_state *state);
+
+int drm_self_refresh_helper_init(struct drm_crtc *crtc,
+				     unsigned int entry_delay_ms);
+
+void drm_self_refresh_helper_cleanup(struct drm_crtc *crtc);
+#endif
-- 
Sean Paul, Software Engineer, Google / Chromium OS

