Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 406CE3BF69B;
	Tue, 10 Mar 2026 16:07:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773158844; cv=none; b=qe/Kd0noTyv7+EFQPzp66ABtSLNjCqcfyP4oaO0FjlV1V/X3LzIED5QYrQKu46dji8DSsc4LRoozYzfuR9qdMTB1t3AwDcfd32YfSH/qzwuTS9JdQK4S9ux44A7o+g9megTI8p1L7BQT2cU1NsX28MAnThqm/RT9gVHetCIzGHA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773158844; c=relaxed/simple;
	bh=vjC/BB4+6nV6lrTleZ0dvGqZuB+/+HLlfLrcv7dUBiQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Y5CVjYE0MQsNIdgWelPWeum4MpicG4XiFXc9bryBidq8yFwVHY60nLoVCCtJlXpKkVzcK+2duSqvg/0KzuYfg1ir3gB7wF8IL6xEKDYqMNA+E41Syk94VbDk+sdWP1K6q5A+JPmGTSa6TzsiktFdnL+5tC1SCcHnzSX06zFJ+U4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LhycQOGp; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LhycQOGp"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 792EBC19423;
	Tue, 10 Mar 2026 16:07:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773158843;
	bh=vjC/BB4+6nV6lrTleZ0dvGqZuB+/+HLlfLrcv7dUBiQ=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LhycQOGpSsJG7C/UDjQuZfiU0jn7+7HADmoSEN0DPDxdxYl7/Zbr2a6Z1xgsxW/2w
	 NTNlOYRwUFYV8Cx4G8uwu3vXjbTiAWvAobQN14Wt5nQf+09ET4UbMl1ON0U7tKYgvq
	 rYbq4isL9To0mABPD9fCDZ+Uw5IIVfGqQ8HTkGz8mewvTjOfZpbGd7dzclMsGI9o6D
	 JgPJdP/ce9mrNtTcoPwaF+kL9B/OBWnchjpItvTQvS9VxZEZCg85xzsBEu1EsNx1RQ
	 EOO/2R0qpu7kjJBj3jbMxHED2DokpQuAdsYYbbuKGXKF1hqmR/97xRZvRvXtgNUWPp
	 pwUq3UwoX+DxA==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 10 Mar 2026 17:06:57 +0100
Subject: [PATCH 05/14] drm/plane: Add new atomic_create_state callback
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-drm-mode-config-init-v1-5-de7397c8e1cf@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=7412; i=mripard@kernel.org;
 h=from:subject:message-id; bh=vjC/BB4+6nV6lrTleZ0dvGqZuB+/+HLlfLrcv7dUBiQ=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJkbHJdeFXjLeLCd+dKzDcftFjPxH9kdONWp+c5Ui998p
 erCUSfTO6awMAhzMsiKKbI8kQk7vbx9cZWD/cofMHNYmUCGMHBxCsBEON4xVhxYN/cJx/PaUMlV
 W7p/xd6ycH4nLp1b+PRI6bd/O9JuiayUip65bknRzTyVj5f3MKq/YWxY6GUyy+99WYPZcq+kS29
 kFmytUnsn1Ne6/pm12HLZkJ3feRV+XD/0UlxR4Mkcn60yO1UB
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

Let's continue the transition to the new pattern with planes.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_state_helper.c | 41 +++++++++++++++++++++++++++++++
 drivers/gpu/drm/drm_mode_config.c         | 18 ++++++++++++++
 include/drm/drm_atomic_state_helper.h     |  4 +++
 include/drm/drm_plane.h                   | 13 ++++++++++
 4 files changed, 76 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index a1abf4247c348eca21da348c3893dd843b9ed391..898e168eeae1c3899121ffd13c79fae7803fcd2a 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -318,10 +318,29 @@ void __drm_atomic_helper_plane_reset(struct drm_plane *plane,
 
 	plane->state = plane_state;
 }
 EXPORT_SYMBOL(__drm_atomic_helper_plane_reset);
 
+/**
+ * __drm_atomic_helper_plane_create_state - initializes plane state
+ * @plane: plane object
+ * @state: new state to initialize
+ *
+ * Initializes the newly allocated @state, usually required when
+ * initializing the drivers.
+ *
+ * @state is assumed to be zeroed.
+ *
+ * This is useful for drivers that subclass @drm_plane_state.
+ */
+void __drm_atomic_helper_plane_create_state(struct drm_plane *plane,
+					    struct drm_plane_state *state)
+{
+	__drm_atomic_helper_plane_reset(plane, state);
+}
+EXPORT_SYMBOL(__drm_atomic_helper_plane_create_state);
+
 /**
  * drm_atomic_helper_plane_reset - default &drm_plane_funcs.reset hook for planes
  * @plane: drm plane
  *
  * Resets the atomic state for @plane by freeing the state pointer (which might
@@ -337,10 +356,32 @@ void drm_atomic_helper_plane_reset(struct drm_plane *plane)
 	if (plane->state)
 		__drm_atomic_helper_plane_reset(plane, plane->state);
 }
 EXPORT_SYMBOL(drm_atomic_helper_plane_reset);
 
+/**
+ * drm_atomic_helper_plane_create_state - default &drm_plane_funcs.atomic_create_state hook for planes
+ * @plane: plane object
+ *
+ * Initializes a pristine @drm_plane_state.
+ *
+ * This is useful for drivers that don't subclass @drm_plane_state.
+ */
+struct drm_plane_state *drm_atomic_helper_plane_create_state(struct drm_plane *plane)
+{
+	struct drm_plane_state *state;
+
+	state = kzalloc_obj(*state);
+	if (!state)
+		return ERR_PTR(-ENOMEM);
+
+	__drm_atomic_helper_plane_reset(plane, state);
+
+	return state;
+}
+EXPORT_SYMBOL(drm_atomic_helper_plane_create_state);
+
 /**
  * __drm_atomic_helper_plane_duplicate_state - copy atomic plane state
  * @plane: plane object
  * @state: atomic plane state
  *
diff --git a/drivers/gpu/drm/drm_mode_config.c b/drivers/gpu/drm/drm_mode_config.c
index 54c27376f9894ef5eee378bb5b1e5fc7049de922..43fe64540b8ec4df4bb823d96db607e6bfe58824 100644
--- a/drivers/gpu/drm/drm_mode_config.c
+++ b/drivers/gpu/drm/drm_mode_config.c
@@ -180,10 +180,26 @@ int drm_mode_getresources(struct drm_device *dev, void *data,
 	drm_connector_list_iter_end(&conn_iter);
 
 	return ret;
 }
 
+static int drm_mode_config_plane_create_state(struct drm_plane *plane)
+{
+	struct drm_plane_state *plane_state;
+
+	if (!plane->funcs->atomic_create_state)
+		return 0;
+
+	plane_state = plane->funcs->atomic_create_state(plane);
+	if (IS_ERR(plane_state))
+		return PTR_ERR(plane_state);
+
+	plane->state = plane_state;
+
+	return 0;
+}
+
 /**
  * drm_mode_config_reset - call ->reset callbacks
  * @dev: drm device
  *
  * This functions calls all the crtc's, encoder's and connector's ->reset
@@ -207,10 +223,12 @@ void drm_mode_config_reset(struct drm_device *dev)
 		drm_colorop_reset(colorop);
 
 	drm_for_each_plane(plane, dev)
 		if (plane->funcs->reset)
 			plane->funcs->reset(plane);
+		else if (plane->funcs->atomic_create_state)
+			drm_mode_config_plane_create_state(plane);
 
 	drm_for_each_crtc(crtc, dev)
 		if (crtc->funcs->reset)
 			crtc->funcs->reset(crtc);
 
diff --git a/include/drm/drm_atomic_state_helper.h b/include/drm/drm_atomic_state_helper.h
index 900672c6ea90ba9cb87e38a7c84225972aee43c5..f56a91fca20e778d8ccb1767301dc00783bf40f3 100644
--- a/include/drm/drm_atomic_state_helper.h
+++ b/include/drm/drm_atomic_state_helper.h
@@ -51,12 +51,16 @@ struct drm_crtc_state *
 drm_atomic_helper_crtc_duplicate_state(struct drm_crtc *crtc);
 void __drm_atomic_helper_crtc_destroy_state(struct drm_crtc_state *state);
 void drm_atomic_helper_crtc_destroy_state(struct drm_crtc *crtc,
 					  struct drm_crtc_state *state);
 
+void __drm_atomic_helper_plane_create_state(struct drm_plane *plane,
+					    struct drm_plane_state *state);
 void __drm_atomic_helper_plane_state_reset(struct drm_plane_state *state,
 					   struct drm_plane *plane);
+struct drm_plane_state *
+drm_atomic_helper_plane_create_state(struct drm_plane *plane);
 void __drm_atomic_helper_plane_reset(struct drm_plane *plane,
 				     struct drm_plane_state *state);
 void drm_atomic_helper_plane_reset(struct drm_plane *plane);
 void __drm_atomic_helper_plane_duplicate_state(struct drm_plane *plane,
 					       struct drm_plane_state *state);
diff --git a/include/drm/drm_plane.h b/include/drm/drm_plane.h
index 703ef4d1bbbcf084c43aa5e127d28691878061c4..4d4d511b681d50c17fbc593cce9f706d63e04a52 100644
--- a/include/drm/drm_plane.h
+++ b/include/drm/drm_plane.h
@@ -386,10 +386,23 @@ struct drm_plane_funcs {
 	 * 0 on success or a negative error code on failure.
 	 */
 	int (*set_property)(struct drm_plane *plane,
 			    struct drm_property *property, uint64_t val);
 
+	/**
+	 * @atomic_create_state:
+	 *
+	 * Allocates a pristine, initialized, state for the plane object
+	 * and returns it.
+	 *
+	 * RETURNS:
+	 *
+	 * A new, pristine, plane state instance or an error pointer
+	 * on failure.
+	 */
+	struct drm_plane_state *(*atomic_create_state)(struct drm_plane *plane);
+
 	/**
 	 * @atomic_duplicate_state:
 	 *
 	 * Duplicate the current atomic state for this plane and return it.
 	 * The core and helpers guarantee that any atomic state duplicated with

-- 
2.53.0

