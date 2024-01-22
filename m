Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D179C39ACC
	for <linux-doc@vger.kernel.org>; Mon, 22 Jan 2024 09:32:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705915950; cv=none; b=qF5pWwriwi1WVVtgqaVV7hedeXOagpJReEo0du5MOFBFkA+qWnYdiGBQcdv6p1kD+AOxIZP7ccY4o3Spw3/ZjRegxTsmVpin3EHjvbOmpa/bx+T6I+ZmCXnBbrSmRIvGEUBSjLcnc/rWNGIsLbcHqZ/znQ/IvQbI1XegZG71Re0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705915950; c=relaxed/simple;
	bh=orUBy2ThRG+quPFIcuiNi0Lw3inksbXqbuGLMegrTlI=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=Ji9hXIQonGycIeK4aW4nyc4WUrd5x0FWCZtxeM2KYvytXP4kwrqTj/TqiGVgKMBVZBykrIB4L0Vk2752Bb1UgGJ08af3NXP5u+me584N/H688kklZTBmqNIM10XgAq/4rbuYbZAtYPM41NXl+UQ+FNmF34sAR9lWQYbaU/Bhh0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=0VpXK0Eg; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=FESh+kIH; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="0VpXK0Eg";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="FESh+kIH"
From: Anna-Maria Behnsen <anna-maria@linutronix.de>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1705915946;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S3Q++ZZVIT73Oqt8Lzm/5pR9Oqo7gGEAVkbQKMjR/cI=;
	b=0VpXK0Egn/l4x9K+YDdO/JxPyOgzmPYRMCkGooAMQiMgEAzwYafssFczFUOy34b/CIttM8
	b/zZ3J1MZS01i+LMydpouJ/caQ/LnjmwDgwymypj4E72D9CRkwIcMTMBKbzNAW4qhlxwqj
	SC6ZJSDIHOT5HSfi6ZyDDk+dRQqNt0gJBSYs6YLAUhsICTj5okYBK7e2WrylF3BhkaX9su
	SwM8CvU5XOO2BiYlWBNEwrZUVvUnwYABIjbqVvqJ/Fy+pI6h0B6CurcQ6ZAq8dUSSaPbTx
	TUQyg3Iagx2i+QTaQe+2C+BJctPT9bzBSE83I0J0wcnV+sAe4kcikKGFRSo+zA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1705915946;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=S3Q++ZZVIT73Oqt8Lzm/5pR9Oqo7gGEAVkbQKMjR/cI=;
	b=FESh+kIH0l1GaienKJ9rB2q5s8Oc/8Gi/VhXgKQcMeiDUbJcopn4YjIC93s0eMqstpteyZ
	B0+JdXKrtFxp1gDQ==
To: linux-doc@vger.kernel.org
Cc: Matthew Wilcox <willy@infradead.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Daniel Vetter <daniel@ffwll.ch>,
	dri-devel@lists.freedesktop.org,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Jani Nikula <jani.nikula@intel.com>
Subject: [PATCH 1/2] drm/vram-helper: Fix 'multi-line' kernel-doc comments
Date: Mon, 22 Jan 2024 10:31:51 +0100
Message-Id: <20240122093152.22536-2-anna-maria@linutronix.de>
In-Reply-To: <20240122093152.22536-1-anna-maria@linutronix.de>
References: <20240122093152.22536-1-anna-maria@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Reformat lines in kernel-doc comments, which make use of the backslash at
the end to suggest it is a multi-line comment. kernel-doc is able to
process e.g. the short description of a function properly, even if it is
across two lines.

No functional change.

Signed-off-by: Anna-Maria Behnsen <anna-maria@linutronix.de>
Reviewed-by: Jani Nikula <jani.nikula@intel.com>
---
 drivers/gpu/drm/drm_gem_vram_helper.c | 44 ++++++++++++---------------
 include/drm/drm_gem_vram_helper.h     | 16 +++++-----
 2 files changed, 28 insertions(+), 32 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_vram_helper.c b/drivers/gpu/drm/drm_gem_vram_helper.c
index b67eafa55715..b7d42210fccc 100644
--- a/drivers/gpu/drm/drm_gem_vram_helper.c
+++ b/drivers/gpu/drm/drm_gem_vram_helper.c
@@ -260,8 +260,7 @@ static u64 drm_gem_vram_pg_offset(struct drm_gem_vram_object *gbo)
 }
 
 /**
- * drm_gem_vram_offset() - \
-	Returns a GEM VRAM object's offset in video memory
+ * drm_gem_vram_offset() - Returns a GEM VRAM object's offset in video memory
  * @gbo:	the GEM VRAM object
  *
  * This function returns the buffer object's offset in the device's video
@@ -470,14 +469,15 @@ void drm_gem_vram_vunmap(struct drm_gem_vram_object *gbo,
 EXPORT_SYMBOL(drm_gem_vram_vunmap);
 
 /**
- * drm_gem_vram_fill_create_dumb() - \
-	Helper for implementing &struct drm_driver.dumb_create
+ * drm_gem_vram_fill_create_dumb() - Helper for implementing
+ *				     &struct drm_driver.dumb_create
+ *
  * @file:		the DRM file
  * @dev:		the DRM device
  * @pg_align:		the buffer's alignment in multiples of the page size
  * @pitch_align:	the scanline's alignment in powers of 2
- * @args:		the arguments as provided to \
-				&struct drm_driver.dumb_create
+ * @args:		the arguments as provided to
+ *			&struct drm_driver.dumb_create
  *
  * This helper function fills &struct drm_mode_create_dumb, which is used
  * by &struct drm_driver.dumb_create. Implementations of this interface
@@ -575,8 +575,7 @@ static int drm_gem_vram_bo_driver_move(struct drm_gem_vram_object *gbo,
  */
 
 /**
- * drm_gem_vram_object_free() - \
-	Implements &struct drm_gem_object_funcs.free
+ * drm_gem_vram_object_free() - Implements &struct drm_gem_object_funcs.free
  * @gem:       GEM object. Refers to &struct drm_gem_vram_object.gem
  */
 static void drm_gem_vram_object_free(struct drm_gem_object *gem)
@@ -591,12 +590,11 @@ static void drm_gem_vram_object_free(struct drm_gem_object *gem)
  */
 
 /**
- * drm_gem_vram_driver_dumb_create() - \
-	Implements &struct drm_driver.dumb_create
+ * drm_gem_vram_driver_dumb_create() - Implements &struct drm_driver.dumb_create
  * @file:		the DRM file
  * @dev:		the DRM device
- * @args:		the arguments as provided to \
-				&struct drm_driver.dumb_create
+ * @args:		the arguments as provided to
+ *			&struct drm_driver.dumb_create
  *
  * This function requires the driver to use @drm_device.vram_mm for its
  * instance of VRAM MM.
@@ -639,8 +637,8 @@ static void __drm_gem_vram_plane_helper_cleanup_fb(struct drm_plane *plane,
 }
 
 /**
- * drm_gem_vram_plane_helper_prepare_fb() - \
- *	Implements &struct drm_plane_helper_funcs.prepare_fb
+ * drm_gem_vram_plane_helper_prepare_fb() - Implements &struct
+ *					    drm_plane_helper_funcs.prepare_fb
  * @plane:	a DRM plane
  * @new_state:	the plane's new state
  *
@@ -690,8 +688,8 @@ drm_gem_vram_plane_helper_prepare_fb(struct drm_plane *plane,
 EXPORT_SYMBOL(drm_gem_vram_plane_helper_prepare_fb);
 
 /**
- * drm_gem_vram_plane_helper_cleanup_fb() - \
- *	Implements &struct drm_plane_helper_funcs.cleanup_fb
+ * drm_gem_vram_plane_helper_cleanup_fb() - Implements &struct
+ *					    drm_plane_helper_funcs.cleanup_fb
  * @plane:	a DRM plane
  * @old_state:	the plane's old state
  *
@@ -717,8 +715,8 @@ EXPORT_SYMBOL(drm_gem_vram_plane_helper_cleanup_fb);
  */
 
 /**
- * drm_gem_vram_simple_display_pipe_prepare_fb() - \
- *	Implements &struct drm_simple_display_pipe_funcs.prepare_fb
+ * drm_gem_vram_simple_display_pipe_prepare_fb() - Implements &struct
+ *				   drm_simple_display_pipe_funcs.prepare_fb
  * @pipe:	a simple display pipe
  * @new_state:	the plane's new state
  *
@@ -739,8 +737,8 @@ int drm_gem_vram_simple_display_pipe_prepare_fb(
 EXPORT_SYMBOL(drm_gem_vram_simple_display_pipe_prepare_fb);
 
 /**
- * drm_gem_vram_simple_display_pipe_cleanup_fb() - \
- *	Implements &struct drm_simple_display_pipe_funcs.cleanup_fb
+ * drm_gem_vram_simple_display_pipe_cleanup_fb() - Implements &struct
+ *						   drm_simple_display_pipe_funcs.cleanup_fb
  * @pipe:	a simple display pipe
  * @old_state:	the plane's old state
  *
@@ -761,8 +759,7 @@ EXPORT_SYMBOL(drm_gem_vram_simple_display_pipe_cleanup_fb);
  */
 
 /**
- * drm_gem_vram_object_pin() - \
-	Implements &struct drm_gem_object_funcs.pin
+ * drm_gem_vram_object_pin() - Implements &struct drm_gem_object_funcs.pin
  * @gem:	The GEM object to pin
  *
  * Returns:
@@ -785,8 +782,7 @@ static int drm_gem_vram_object_pin(struct drm_gem_object *gem)
 }
 
 /**
- * drm_gem_vram_object_unpin() - \
-	Implements &struct drm_gem_object_funcs.unpin
+ * drm_gem_vram_object_unpin() - Implements &struct drm_gem_object_funcs.unpin
  * @gem:	The GEM object to unpin
  */
 static void drm_gem_vram_object_unpin(struct drm_gem_object *gem)
diff --git a/include/drm/drm_gem_vram_helper.h b/include/drm/drm_gem_vram_helper.h
index e18429f09e53..2938ba80750d 100644
--- a/include/drm/drm_gem_vram_helper.h
+++ b/include/drm/drm_gem_vram_helper.h
@@ -33,8 +33,8 @@ struct vm_area_struct;
  * struct drm_gem_vram_object - GEM object backed by VRAM
  * @bo:		TTM buffer object
  * @map:	Mapping information for @bo
- * @placement:	TTM placement information. Supported placements are \
-	%TTM_PL_VRAM and %TTM_PL_SYSTEM
+ * @placement:	TTM placement information. Supported placements are %TTM_PL_VRAM
+ *		and %TTM_PL_SYSTEM
  * @placements:	TTM placement information.
  *
  * The type struct drm_gem_vram_object represents a GEM object that is
@@ -126,8 +126,8 @@ drm_gem_vram_plane_helper_cleanup_fb(struct drm_plane *plane,
 				     struct drm_plane_state *old_state);
 
 /**
- * DRM_GEM_VRAM_PLANE_HELPER_FUNCS -
- *	Initializes struct drm_plane_helper_funcs for VRAM handling
+ * DRM_GEM_VRAM_PLANE_HELPER_FUNCS - Initializes struct drm_plane_helper_funcs
+ *				     for VRAM handling
  *
  * Drivers may use GEM BOs as VRAM helpers for the framebuffer memory. This
  * macro initializes struct drm_plane_helper_funcs to use the respective helper
@@ -150,8 +150,8 @@ void drm_gem_vram_simple_display_pipe_cleanup_fb(
 	struct drm_plane_state *old_state);
 
 /**
- * define DRM_GEM_VRAM_DRIVER - default callback functions for \
-	&struct drm_driver
+ * define DRM_GEM_VRAM_DRIVER - default callback functions for
+ *				&struct drm_driver
  *
  * Drivers that use VRAM MM and GEM VRAM can use this macro to initialize
  * &struct drm_driver with default functions.
@@ -185,8 +185,8 @@ struct drm_vram_mm {
 };
 
 /**
- * drm_vram_mm_of_bdev() - \
-	Returns the container of type &struct ttm_device for field bdev.
+ * drm_vram_mm_of_bdev() - Returns the container of type &struct ttm_device for
+ *			   field bdev.
  * @bdev:	the TTM BO device
  *
  * Returns:
-- 
2.39.2

