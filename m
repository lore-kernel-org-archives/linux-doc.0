Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE016309F08;
	Tue, 10 Mar 2026 16:07:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773158847; cv=none; b=JB6L5INpV5l5GD2lCb1s3IvZ/oHCTOH7GixbpNLUoELzVCpF+M0n3MKGt0zzJk8YAfk+K4SWXlHZLpkzQpCJrdok26IZ5IZR3TmV5FiyGFp0tIGh1ks65s4Hp/P9uZ2PcdcYTZi1MwHw2Z2cCx1O+hOifRV2GdZYGFLf9ctxVrU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773158847; c=relaxed/simple;
	bh=Uobxq4K2wAwHRPAxJh14lNMQ5N5l4VnlxVpQCTJ3MCQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=edWA01CNLP895q8h2iONYbuggOVRYtCcazGMNmPHBHfTuqkDnB8zpdNvbuI7FpZ6jjehtdKA5EmoUx2j70oFVjSeG1Ov1LI4wmxYwpnCJi4S/mipNIFpXpIo/W+k/R1CE8Dvvv1on2T6Wa8Suc2jS/BQKqqKD1oj9AHjd4XFDMw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KOfN3c97; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KOfN3c97"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A5FBC2BC9E;
	Tue, 10 Mar 2026 16:07:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773158846;
	bh=Uobxq4K2wAwHRPAxJh14lNMQ5N5l4VnlxVpQCTJ3MCQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KOfN3c97C7EIGRek7JDP11uWiiDQyMenLU5tkcYrpKdqNknGWN5JtEvtMmLDLMjs2
	 j4XxnhoxCEhKmHhOsaBMT+5xqeODUX8OvqlSvA577P8qzTUDTtZEqWKy/tVD5PE0TR
	 SmEyBsMederRZ5WNd1n+Gkg6dRKXWz7TluvBVQJmCD3CnmsP2C8knKWTOLGePlJxvW
	 qpQlM0NvBINmnw2Sc2DUjvmd8bhjXrkREaKcIv6Bz0re0sPFtzxPJP3G15bORLfUWR
	 /lgWVpZkIdC5s0ngsUZzwJGIoGGkg3lrgR+/saorvhiqgc1ImuV7LNtTw+gQqZ3x9R
	 lVzbp2MbCpDug==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 10 Mar 2026 17:06:58 +0100
Subject: [PATCH 06/14] drm/crtc: Add new atomic_create_state callback
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-drm-mode-config-init-v1-6-de7397c8e1cf@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7227; i=mripard@kernel.org;
 h=from:subject:message-id; bh=Uobxq4K2wAwHRPAxJh14lNMQ5N5l4VnlxVpQCTJ3MCQ=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJkbHJc9OO59/erPYz7MafP5JuzvUO2/9eBe6tnQa1vMX
 hqJRzW4d0xlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJbP7CWF9/r4Nj0Rp1o9tn
 Js8MO/GU4/vp6kTPzenhalyFn53uLuTLc3aQE7m1/1SF1zGlw8+jsxhr5WZwxc1aIGniP/mb+XN
 e++0p9kXMnXfdNSfJ3HZewbDV5tgTl+hLKl/iu/8UP5w3pfoOAA==
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

Let's continue the transition to the new pattern with crtcs.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_state_helper.c | 41 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_mode_config.c         | 18 ++++++++++++++
 include/drm/drm_atomic_state_helper.h     |  4 +++
 include/drm/drm_crtc.h                    | 13 ++++++++++
 4 files changed, 76 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 898e168eeae1c3899121ffd13c79fae7803fcd2a..28fa315586c2530e50f0b470d9ad43f5c3a5e056 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -102,10 +102,29 @@ __drm_atomic_helper_crtc_reset(struct drm_crtc *crtc,
 
 	crtc->state = crtc_state;
 }
 EXPORT_SYMBOL(__drm_atomic_helper_crtc_reset);
 
+/**
+ * __drm_atomic_helper_crtc_create_state - initializes crtc state
+ * @crtc: crtc object
+ * @state: new state to initialize
+ *
+ * Initializes the newly allocated @state, usually required when
+ * initializing the drivers.
+ *
+ * @state is assumed to be zeroed.
+ *
+ * This is useful for drivers that subclass @drm_crtc_state.
+ */
+void __drm_atomic_helper_crtc_create_state(struct drm_crtc *crtc,
+					   struct drm_crtc_state *state)
+{
+	__drm_atomic_helper_crtc_reset(crtc, state);
+}
+EXPORT_SYMBOL(__drm_atomic_helper_crtc_create_state);
+
 /**
  * drm_atomic_helper_crtc_reset - default &drm_crtc_funcs.reset hook for CRTCs
  * @crtc: drm CRTC
  *
  * Resets the atomic state for @crtc by freeing the state pointer (which might
@@ -121,10 +140,32 @@ void drm_atomic_helper_crtc_reset(struct drm_crtc *crtc)
 
 	__drm_atomic_helper_crtc_reset(crtc, crtc_state);
 }
 EXPORT_SYMBOL(drm_atomic_helper_crtc_reset);
 
+/**
+ * drm_atomic_helper_crtc_create_state - default &drm_crtc_funcs.atomic_create_state hook for crtcs
+ * @crtc: crtc object
+ *
+ * Initializes a pristine @drm_crtc_state.
+ *
+ * This is useful for drivers that don't subclass @drm_crtc_state.
+ */
+struct drm_crtc_state *drm_atomic_helper_crtc_create_state(struct drm_crtc *crtc)
+{
+	struct drm_crtc_state *state;
+
+	state = kzalloc_obj(*state);
+	if (!state)
+		return ERR_PTR(-ENOMEM);
+
+	__drm_atomic_helper_crtc_reset(crtc, state);
+
+	return state;
+}
+EXPORT_SYMBOL(drm_atomic_helper_crtc_create_state);
+
 /**
  * __drm_atomic_helper_crtc_duplicate_state - copy atomic CRTC state
  * @crtc: CRTC object
  * @state: atomic CRTC state
  *
diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
index 43fe64540b8ec4df4bb823d96db607e6bfe58824..6d47af4097071cfb93a2c23909dd5d643687111f 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -196,10 +196,26 @@ static int drm_mode_config_plane_create_state(struct drm_plane *plane)
 	plane->state = plane_state;
 
 	return 0;
 }
 
+static int drm_mode_config_crtc_create_state(struct drm_crtc *crtc)
+{
+	struct drm_crtc_state *crtc_state;
+
+	if (!crtc->funcs->atomic_create_state)
+		return 0;
+
+	crtc_state = crtc->funcs->atomic_create_state(crtc);
+	if (IS_ERR(crtc_state))
+		return PTR_ERR(crtc_state);
+
+	crtc->state = crtc_state;
+
+	return 0;
+}
+
 /**
  * drm_mode_config_reset - call ->reset callbacks
  * @dev: drm device
  *
  * This functions calls all the crtc's, encoder's and connector's ->reset
@@ -229,10 +245,12 @@ void drm_mode_config_reset(struct drm_device *dev)
 			drm_mode_config_plane_create_state(plane);
 
 	drm_for_each_crtc(crtc, dev)
 		if (crtc->funcs->reset)
 			crtc->funcs->reset(crtc);
+		else if (crtc->funcs->atomic_create_state)
+			drm_mode_config_crtc_create_state(crtc);
 
 	drm_for_each_encoder(encoder, dev)
 		if (encoder->funcs && encoder->funcs->reset)
 			encoder->funcs->reset(encoder);
 
diff --git a/include/drm/drm_atomic_state_helper.h b/include/drm/drm_atomic_state_helper.h
index f56a91fca20e778d8ccb1767301dc00783bf40f3..d7e8ac09d81febef3a95ed460cd00b91ee3d05b2 100644
--- a/include/drm/drm_atomic_state_helper.h
+++ b/include/drm/drm_atomic_state_helper.h
@@ -43,10 +43,14 @@ struct drm_device;
 void __drm_atomic_helper_crtc_state_reset(struct drm_crtc_state *state,
 					  struct drm_crtc *crtc);
 void __drm_atomic_helper_crtc_reset(struct drm_crtc *crtc,
 				    struct drm_crtc_state *state);
 void drm_atomic_helper_crtc_reset(struct drm_crtc *crtc);
+void __drm_atomic_helper_crtc_create_state(struct drm_crtc *crtc,
+					   struct drm_crtc_state *state);
+struct drm_crtc_state *
+drm_atomic_helper_crtc_create_state(struct drm_crtc *crtc);
 void __drm_atomic_helper_crtc_duplicate_state(struct drm_crtc *crtc,
 					      struct drm_crtc_state *state);
 struct drm_crtc_state *
 drm_atomic_helper_crtc_duplicate_state(struct drm_crtc *crtc);
 void __drm_atomic_helper_crtc_destroy_state(struct drm_crtc_state *state);
diff --git a/include/drm/drm_crtc.h b/include/drm/drm_crtc.h
index 66278ffeebd68e69e9d0724ea5a33f93231e3f8b..30dbf430586ee7b106acbdfb28d27ea81c1377a6 100644
--- a/include/drm/drm_crtc.h
+++ b/include/drm/drm_crtc.h
@@ -624,10 +624,23 @@ struct drm_crtc_funcs {
 	 * 0 on success or a negative error code on failure.
 	 */
 	int (*set_property)(struct drm_crtc *crtc,
 			    struct drm_property *property, uint64_t val);
 
+	/**
+	 * @atomic_create_state:
+	 *
+	 * Allocates a pristine, initialized, state for the crtc object
+	 * and returns it.
+	 *
+	 * RETURNS:
+	 *
+	 * A new, pristine, crtc state instance or an error pointer
+	 * on failure.
+	 */
+	struct drm_crtc_state *(*atomic_create_state)(struct drm_crtc *crtc);
+
 	/**
 	 * @atomic_duplicate_state:
 	 *
 	 * Duplicate the current atomic state for this CRTC and return it.
 	 * The core and helpers guarantee that any atomic state duplicated with

-- 
2.53.0

