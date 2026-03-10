Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D093346FB3;
	Tue, 10 Mar 2026 16:07:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773158850; cv=none; b=Z14WyejCnssnz8kMwF+RM8+qkZZQ6iG+TvLVA50KRfyoBJVCw2BOjQOmA11OX7cY028f7D3EzRfQ/ioAUUfdogb/GobNtl3lwEeUI7AKfUxgYhNB10NuxbTcS65I1IsZAvB980aTmeJeX5CbFdFr/NK8kvonMpm9xoRGsMkBnCE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773158850; c=relaxed/simple;
	bh=XdoyFw1BJuo1zHelq873QMJCNghKWxb4OWgnKcCwHJw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MtU7LwgH2p5cTw0sQrzzhgAQjUs0+F5GFHcGfZxkSRrDbnjaNDwcMRKPajtzTtEyfGzfErlyA6qlanyzSlSJ/eX835qTD+gw+5K8/d2up5bmPub23Cu+IxKifHoV5WnctggJ+FbarohTnbctmgY/Dktvf3+B+tJHBy70qGgnyGA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=aSNOzzST; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="aSNOzzST"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7E62EC19423;
	Tue, 10 Mar 2026 16:07:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773158849;
	bh=XdoyFw1BJuo1zHelq873QMJCNghKWxb4OWgnKcCwHJw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=aSNOzzSTbOV11eKY5TvCN4cYZed4e4Pw+yaPluMVLf7XT1PW87C3ekuDbr+Dddour
	 K6hq1sjftJ40TleO2hFxa5pE+WqKazvUsesNFiq9MdcjoqmTSTxkbE3Hnho11+2MPM
	 u3j3UvFP42g5OsC50mJaDVL5eOOkCp9jJL/JgoA0l2uMJcg0cDGUhnG7CpMj2V2vnA
	 eD8DClBYQZ+qgVICnfk3HyzHJjgeEq+4KLCJrY6Ef8T/d6r12JZQC8Pw/GKOy4lmXK
	 aj761Aq7TnhqYl6YBpkKsXllhOG+yZmJpVUPWIP7EoVAGmNDK1TyD/mc+eBzGRTEm5
	 agGMYaAkFe25g==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 10 Mar 2026 17:06:59 +0100
Subject: [PATCH 07/14] drm/connector: Add new atomic_create_state callback
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-drm-mode-config-init-v1-7-de7397c8e1cf@kernel.org>
References: <20260310-drm-mode-config-init-v1-0-de7397c8e1cf@kernel.org>
In-Reply-To: <20260310-drm-mode-config-init-v1-0-de7397c8e1cf@kernel.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Jyri Sarha <jyri.sarha@iki.fi>, 
 Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>
Cc: dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7817; i=mripard@kernel.org;
 h=from:subject:message-id; bh=XdoyFw1BJuo1zHelq873QMJCNghKWxb4OWgnKcCwHJw=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJkbHJc9CrPhDlveHmt77eSexUvlWbrStm9gykh9PHPWJ
 32HgzK9HVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAi114yNlw+Om+9goyzw2Px
 piSbuA18s1am/bPVKF//qzpkYjQT/3GXK3vvZ8svbNnSesbUJLXRirFWaKLF9+1L+i/PvNNQv0V
 COH3xFIXexP4Vr+bI6PfcvDaN90Pb3YRLGzd3HMyIn9fiO1ENAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

Commit 47b5ac7daa46 ("drm/atomic: Add new atomic_create_state callback
to drm_private_obj") introduced a new pattern for allocating drm object
states.

Instead of relying on the reset() callback, it created a new
atomic_create_state hook. This is helpful because reset is a bit
overloaded: it's used to create the initial software tate, reset it, but
also reset the hardware.

It can also be used either at probe time, to create the initial state
and possibly reset the hardware to an expected default, but also during
suspend/resume.

Both these cases come with different expectations too: during the
initialization, we want to initialize all states, but during
suspend/resume, drm_private_states for example are expected to be kept
around.

And reset() isn't fallible, which makes it harder to handle
initialization errors properly.

And this is only really relevant for some drivers, since all the helpers
for reset only create a new state, and don't touch the hardware at all.

It was thus decided to create a new hook that would allocate and
initialize a pristine state without any side effect:
atomic_create_state to untangle a bit some of it, and to separate the
initialization with the actual reset one might need during a
suspend/resume.

Let's continue the transition to the new pattern with connectors.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_state_helper.c | 42 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_mode_config.c         | 18 +++++++++++++
 include/drm/drm_atomic_state_helper.h     |  4 +++
 include/drm/drm_connector.h               | 13 ++++++++++
 4 files changed, 77 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 28fa315586c2530e50f0b470d9ad43f5c3a5e056..72cc88972e154d931e9ae828888ea6a7cfb95904 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -543,10 +543,29 @@ __drm_atomic_helper_connector_reset(struct drm_connector *connector,
 
 	connector->state = conn_state;
 }
 EXPORT_SYMBOL(__drm_atomic_helper_connector_reset);
 
+/**
+ * __drm_atomic_helper_connector_create_state - initializes connector state
+ * @connector: connector object
+ * @state: new state to initialize
+ *
+ * Initializes the newly allocated @state, usually required when
+ * initializing the drivers.
+ *
+ * @state is assumed to be zeroed.
+ *
+ * This is useful for drivers that subclass @drm_connector_state.
+ */
+void __drm_atomic_helper_connector_create_state(struct drm_connector *connector,
+						struct drm_connector_state *state)
+{
+	__drm_atomic_helper_connector_reset(connector, state);
+}
+EXPORT_SYMBOL(__drm_atomic_helper_connector_create_state);
+
 /**
  * drm_atomic_helper_connector_reset - default &drm_connector_funcs.reset hook for connectors
  * @connector: drm connector
  *
  * Resets the atomic state for @connector by freeing the state pointer (which
@@ -563,10 +582,33 @@ void drm_atomic_helper_connector_reset(struct drm_connector *connector)
 	kfree(connector->state);
 	__drm_atomic_helper_connector_reset(connector, conn_state);
 }
 EXPORT_SYMBOL(drm_atomic_helper_connector_reset);
 
+/**
+ * drm_atomic_helper_connector_create_state - default &drm_connector_funcs.atomic_create_state hook for connectors
+ * @connector: connector object
+ *
+ * Initializes a pristine @drm_connector_state.
+ *
+ * This is useful for drivers that don't subclass @drm_connector_state.
+ */
+struct drm_connector_state *
+drm_atomic_helper_connector_create_state(struct drm_connector *connector)
+{
+	struct drm_connector_state *state;
+
+	state = kzalloc_obj(*state);
+	if (!state)
+		return ERR_PTR(-ENOMEM);
+
+	__drm_atomic_helper_connector_reset(connector, state);
+
+	return state;
+}
+EXPORT_SYMBOL(drm_atomic_helper_connector_create_state);
+
 /**
  * drm_atomic_helper_connector_tv_margins_reset - Resets TV connector properties
  * @connector: DRM connector
  *
  * Resets the TV-related properties attached to a connector.
diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
index 6d47af4097071cfb93a2c23909dd5d643687111f..95759a4b5176ff17032a9a267ec9de6980be0abc 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -212,10 +212,26 @@ static int drm_mode_config_crtc_create_state(struct drm_crtc *crtc)
 	crtc->state = crtc_state;
 
 	return 0;
 }
 
+static int drm_mode_config_connector_create_state(struct drm_connector *connector)
+{
+	struct drm_connector_state *conn_state;
+
+	if (!connector->funcs->atomic_create_state)
+		return 0;
+
+	conn_state = connector->funcs->atomic_create_state(connector);
+	if (IS_ERR(conn_state))
+		return PTR_ERR(conn_state);
+
+	connector->state = conn_state;
+
+	return 0;
+}
+
 /**
  * drm_mode_config_reset - call ->reset callbacks
  * @dev: drm device
  *
  * This functions calls all the crtc's, encoder's and connector's ->reset
@@ -256,10 +272,12 @@ void drm_mode_config_reset(struct drm_device *dev)
 
 	drm_connector_list_iter_begin(dev, &conn_iter);
 	drm_for_each_connector_iter(connector, &conn_iter)
 		if (connector->funcs->reset)
 			connector->funcs->reset(connector);
+		else if (connector->funcs->atomic_create_state)
+			drm_mode_config_connector_create_state(connector);
 	drm_connector_list_iter_end(&conn_iter);
 }
 EXPORT_SYMBOL(drm_mode_config_reset);
 
 /*
diff --git a/include/drm/drm_atomic_state_helper.h b/include/drm/drm_atomic_state_helper.h
index d7e8ac09d81febef3a95ed460cd00b91ee3d05b2..d5259cbfdb150553932d2b3c9c513bf8e773c96d 100644
--- a/include/drm/drm_atomic_state_helper.h
+++ b/include/drm/drm_atomic_state_helper.h
@@ -76,11 +76,15 @@ void drm_atomic_helper_plane_destroy_state(struct drm_plane *plane,
 
 void __drm_atomic_helper_connector_state_reset(struct drm_connector_state *conn_state,
 					       struct drm_connector *connector);
 void __drm_atomic_helper_connector_reset(struct drm_connector *connector,
 					 struct drm_connector_state *conn_state);
+void __drm_atomic_helper_connector_create_state(struct drm_connector *connector,
+						struct drm_connector_state *state);
 void drm_atomic_helper_connector_reset(struct drm_connector *connector);
+struct drm_connector_state *
+drm_atomic_helper_connector_create_state(struct drm_connector *connector);
 void drm_atomic_helper_connector_tv_reset(struct drm_connector *connector);
 int drm_atomic_helper_connector_tv_check(struct drm_connector *connector,
 					 struct drm_atomic_state *state);
 void drm_atomic_helper_connector_tv_margins_reset(struct drm_connector *connector);
 void
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index c18be8c19de0ab1e02e7d7b1fcd9f2ab5ef1dd15..6d73068de157144770931c64ce3f91e6f15ef0e4 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -1509,10 +1509,23 @@ struct drm_connector_funcs {
 	 * when a connector is being hot-unplugged for drivers that support
 	 * connector hotplugging (e.g. DisplayPort MST).
 	 */
 	void (*destroy)(struct drm_connector *connector);
 
+	/**
+	 * @atomic_create_state:
+	 *
+	 * Allocates a pristine, initialized, state for the connector object
+	 * and returns it.
+	 *
+	 * RETURNS:
+	 *
+	 * A new, pristine, connector state instance or an error pointer
+	 * on failure.
+	 */
+	struct drm_connector_state *(*atomic_create_state)(struct drm_connector *connector);
+
 	/**
 	 * @atomic_duplicate_state:
 	 *
 	 * Duplicate the current atomic state for this connector and return it.
 	 * The core and helpers guarantee that any atomic state duplicated with

-- 
2.53.0

