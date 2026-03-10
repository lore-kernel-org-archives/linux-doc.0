Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A3DD3BF69B;
	Tue, 10 Mar 2026 16:07:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773158832; cv=none; b=YGMJ335kjDIAdDF0kuEF1UgNneGbprw/u4mwcuLjc2iX04fLnYO5bBVY26LRORUfxn7wa++v6FMatO8oiZG/wlnRnevDG/j2taz+rmWFRj50sz/eiP0Mnzk1cG2Ar118xoMgil1vnXqXhCkA1sAwvCwGPuUz4o0mqIgMc+vt29s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773158832; c=relaxed/simple;
	bh=HGXDwistC7j0r/Ij2K5MQr2pye6tFQ6S1DiX2HIRAQ4=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jEYnMop7wGrOp8avx8YnlpD84wBR1o26ENVgLoZ8idAfvEmpkMIyiqUEyaZ2pzddhXJC4nJ6HwAamtTTUT/uiATsnG0jEnds4u+t/HFsAHSQ20VwPjw83HURch0rYmbPu3zeXhT0bc6/YTFoHqCiRtHw3THMs4WusuPQw7v0SYw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=J2wliESs; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="J2wliESs"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 72D01C19423;
	Tue, 10 Mar 2026 16:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773158831;
	bh=HGXDwistC7j0r/Ij2K5MQr2pye6tFQ6S1DiX2HIRAQ4=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=J2wliESseXnAdKrr8Q8T0m43B4HC6mY333oQc1PsY12N5g8VJqbWUG/p/Mea5+paI
	 K/DkECdpFxvDcrdug8gzGN/nQHE9IWycz+9PNcQeYK+q11J48dEpAHHCtOVzGTIDle
	 A3elvYAuTvLT+Sh3Q86CEttCMv4zLlp0Haafw4oO+loRK53nJJOA9OLhhATONBYwTi
	 QtuTAEDIeM+JgsYongBS3jiDc3hpsvKXTvJE7c2MxOXEsjM2TRXmUDjnGLyUxCaGlI
	 2XSfNkaElq/Og0PFwRvIOuw6932K+6Z808vq/T2pxVcKmRb8lRgLQShdEzE1om4Gfg
	 ZhS5zGM0pnyyw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 10 Mar 2026 17:06:53 +0100
Subject: [PATCH 01/14] drm/atomic: Document atomic state lifetime
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-drm-mode-config-init-v1-1-de7397c8e1cf@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=4285; i=mripard@kernel.org;
 h=from:subject:message-id; bh=HGXDwistC7j0r/Ij2K5MQr2pye6tFQ6S1DiX2HIRAQ4=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJkbHJd8nFqSsIT/1/Sdji+Pr8u+ybLZeDLn1O8/I4OyE
 0WULzUldkxlYRDmZJAVU2R5IhN2enn74ioH+5U/YOawMoEMYeDiFICJBE1jrK/SsJhuPY89hmF1
 3NRndw4tKVC9nvvfffKMXUvLi07wHhXcW1h6ff2elFdnZQ5n7Tu+ZQNjnYaI9Uy3eRLhv4R+Wko
 ZX7he+o+rUMnz8rnX7TvNptv6r3hQWmNQJTube2GTX+ma7VaeAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

How drm_atomic_state structures and the various entity structures are
allocated and freed isn't really trivial, so let's document it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 Documentation/gpu/drm-kms.rst |  6 +++++
 drivers/gpu/drm/drm_atomic.c  | 52 +++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 58 insertions(+)

diff --git a/Documentation/gpu/drm-kms.rst b/Documentation/gpu/drm-kms.rst
index 2292e65f044c3bdebafbb8f83dfe7ac12e831273..017c7b196ed7ead4cf5fa8572e1f977d9e00dda8 100644
--- a/Documentation/gpu/drm-kms.rst
+++ b/Documentation/gpu/drm-kms.rst
@@ -280,10 +280,16 @@ structure, ordering of committing state changes to hardware is sequenced using
 :c:type:`struct drm_crtc_commit <drm_crtc_commit>`.
 
 Read on in this chapter, and also in :ref:`drm_atomic_helper` for more detailed
 coverage of specific topics.
 
+Atomic State Lifetime
+---------------------
+
+.. kernel-doc:: drivers/gpu/drm/drm_atomic.c
+   :doc: state lifetime
+
 Handling Driver Private State
 -----------------------------
 
 .. kernel-doc:: drivers/gpu/drm/drm_atomic.c
    :doc: handling driver private state
diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index 4283ab4d06c581727cc98b1dc870bf69691ea654..92c6afc8f22c8307a59dc266aacdb8e03351409d 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -45,10 +45,62 @@
 #include <drm/drm_colorop.h>
 
 #include "drm_crtc_internal.h"
 #include "drm_internal.h"
 
+/**
+ * DOC: state lifetime
+ *
+ * &struct drm_atomic_state represents an update to video pipeline
+ * state. Despite its confusing name, it's actually a transient object
+ * that holds a state update as a collection of pointer to individual
+ * objects states. &struct drm_atomic_state has a much shorter lifetime
+ * than the objects states, since it's only allocated while preparing,
+ * checking or doing the update, while object states are allocated while
+ * the state will be, or is active in the hardware.
+ *
+ * Their respective lifetimes are:
+ *
+ * - at reset time, the object reset implementation will allocate a new,
+ *   default, state and will store it in the object state pointer.
+ *
+ * - whenever a new update is needed:
+ *
+ *   + we allocate a new &struct drm_atomic_state using drm_atomic_state_alloc().
+ *
+ *   + we copy the state of each affected entity into our &struct
+ *     drm_atomic_state using drm_atomic_get_plane_state(),
+ *     drm_atomic_get_crtc_state(), drm_atomic_get_connector_state(), or
+ *     drm_atomic_get_private_obj_state(). That state can then be
+ *     modified.
+ *
+ *     At that point, &struct drm_atomic_state stores three state
+ *     pointers for that particular entity: the old, new, and existing
+ *     (called "state") states. The old state is the state currently
+ *     active in the hardware, which is either the one initialized by
+ *     reset() or a newer one if a commit has been made. The new state
+ *     is the state we just allocated and we might eventually commit to
+ *     the hardware. The existing state points to the state we'll
+ *     eventually have to free when the drm_atomic_state will be
+ *     destroyed, but points to the new state for now.
+ *
+ *   + After the state is populated, it is checked. If the check is
+ *     successful, the update is committed. Part of the commit is a call
+ *     to drm_atomic_helper_swap_state() which will turn the new states
+ *     into the active states. Doing so involves updating the objects
+ *     state pointer (&drm_crtc.state or similar) to point to the new
+ *     state, and the existing states will now point to the old states,
+ *     that used to be active but isn't anymore.
+ *
+ *   + When the commit is done, and when all references to our &struct
+ *     drm_atomic_state are put, drm_atomic_state_clear() runs and will
+ *     free all the old states.
+ *
+ *   + Now, we don't have any active &struct drm_atomic_state anymore,
+ *     and only the entity active states remain allocated.
+ */
+
 void __drm_crtc_commit_free(struct kref *kref)
 {
 	struct drm_crtc_commit *commit =
 		container_of(kref, struct drm_crtc_commit, ref);
 

-- 
2.53.0

