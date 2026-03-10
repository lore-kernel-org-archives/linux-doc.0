Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 72F5C309F08;
	Tue, 10 Mar 2026 16:07:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773158829; cv=none; b=tUT9goQluBCOUWpTkN8m6uuLlrTBqjR8YidnK/p3AsEHbsoXF+oxDBiu1i2AHkUgJQFEVI8K5UrKTuKl3E/rkaTd2alcrhpl055yxka8L5qvAJoGH+z83egZBMGEqCajNdvgGALhNychjxuudrCr+BGvHSvjrpvkksSGHg7yupU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773158829; c=relaxed/simple;
	bh=Qq3X3N7gOYGl/sml9oYcc/UUAUhuLd5AlHRoJX3DFnI=;
	h=From:Subject:Date:Message-Id:MIME-Version:Content-Type:To:Cc; b=ujNB7QSjCegrKXFYEBYf04HELIBXJFVAnTlBCIhRZcV48wmR0V6N2livtwSWCK7CsZDXYWl4/ik/Ol4TUQP3MtvKL8OVbRgk7HXSJjTGhHkOleWzpfikpwZhK3A5IwxQQNiCSDh4lH0euM6fY20EBlScZrToMlvwt+1Nx/y6Ank=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=kXZcD01E; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="kXZcD01E"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2404C19423;
	Tue, 10 Mar 2026 16:07:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773158829;
	bh=Qq3X3N7gOYGl/sml9oYcc/UUAUhuLd5AlHRoJX3DFnI=;
	h=From:Subject:Date:To:Cc:From;
	b=kXZcD01Ew7k40ulLinffclGQghOeR6bCmU4TKHH6Dlr7G9UVyMNfkQ1/sV9DW8+qX
	 8BGIBoOo3ze2Xq5GJRzQDSzBBxpby7zbRmOcl48bw0V/VMUviWrUakbI9f4QCeFcGx
	 ReVtmB4+uk4CJaPqv++MKTCo+bpIpRIeH0SuUFEta+D2TnfhGV2FCqMEcKrAZnfNSL
	 XWuxzF2JtmbRmlR9D72bgQcM+BLmNAAlO7DfyDp+iaF2FZEYrPwxIiHtBfpF87hjyb
	 vXMhUfdPhWmTrR9vjM9miQ/iFNTR7EIWfNYGDHQLcNvoh4kU5gNhx5xZ/UX55ZyIlN
	 Ub4AF9XOql6lg==
From: Maxime Ripard <mripard@kernel.org>
Subject: [PATCH 00/14] drm/atomic: Rework initial state allocation
Date: Tue, 10 Mar 2026 17:06:52 +0100
Message-Id: <20260310-drm-mode-config-init-v1-0-de7397c8e1cf@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-B4-Tracking: v=1; b=H4sIAAAAAAAC/02OQQqDMBBFryKz7kCSGi1epbiIZrRTSLRJKoJ49
 0bddPnmM+//DSIFpghNsUGghSNPPoO8FdC/jB8J2WYGJVQl7lKgDQ7dZAn7yQ88IntOKEkOWnV
 1qa2A/DoHGng9tc/24kCfb7an6widiYfCOU5NcTo59uhpTXhUoVCoKvhf0RQ50FKIx7lhDryYR
 Dh1bwwUKaEhSaoupVC1aRYN7b7/AMFUgnTfAAAA
X-Change-ID: 20260310-drm-mode-config-init-1e1f52b745d0
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3440; i=mripard@kernel.org;
 h=from:subject:message-id; bh=Qq3X3N7gOYGl/sml9oYcc/UUAUhuLd5AlHRoJX3DFnI=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJkbHBdnvgvgyniVOntjZkD/9vbAcj3ztkmTFx2YsknyZ
 /Yjg6/SHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAiZ9kZ69RYpy218VD723nB
 VcqGI23x7kUT5lyuku2f/Vgwi3H6mbpJVWL7T71nWMbzcf5n6xVqaoz14VPf3Nh/wMFJeXryk0Z
 PRTttr+Vr2N+GP5U209Y8b1z9S6aCn2U2e/U09ohdXPH1a0sA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

Hi,

This series started from my work on the hardware state readout[1], and
more specifically a discussion with Thomas[2].

This series expands the work that has been merged recently to make
drm_private_obj and drm_private_state allocation a bit more consistent
and ended up creating a new atomic_create_state callback to allocate a
new state with no side effect.

The first patches are a documentation of the existing behaviour and some
random cleanups.

Then, we add the new atomic_create_state callback to every other DRM
object. Next, we leverage those new callbacks to create a new helper,
drm_mode_config_create_state() to create the initial state for all the
objects of a driver.

Finally, we hook that new helper in drm_dev_register and start
converting a few drivers.

This was tested on a TI SK-AM62, with the tidss driver.

Let me know what you think,
Maxime

1: https://lore.kernel.org/dri-devel/20250902-drm-state-readout-v1-0-14ad5315da3f@kernel.org/
2: https://lore.kernel.org/dri-devel/5920ffe5-b6b1-484b-b320-332b9eb9db82@suse.de/

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
Maxime Ripard (14):
      drm/atomic: Document atomic state lifetime
      drm/atomic: Drop drm_private_state.obj assignment from create_state
      drm/mode-config: Mention drm_mode_config_reset() culprits
      drm/atomic-state-helper: Fix __drm_atomic_helper_plane_reset() doc typo
      drm/plane: Add new atomic_create_state callback
      drm/crtc: Add new atomic_create_state callback
      drm/connector: Add new atomic_create_state callback
      drm/mode-config: Create drm_mode_config_create_state()
      drm/drv: Call drm_mode_config_create_state() by default
      drm/atomic: Drop private obj state allocation
      drm/drv: Drop drm_mode_config_reset() from our skeleton
      drm/tidss: Drop call to drm_mode_config_reset at probe time
      drm/tidss: Convert to atomic_create_state
      drm/bridge_connector: Convert to atomic_create_state

 Documentation/gpu/drm-kms.rst                  |   6 ++
 drivers/gpu/drm/display/drm_bridge_connector.c |  15 ++-
 drivers/gpu/drm/drm_atomic.c                   |  67 ++++++++++--
 drivers/gpu/drm/drm_atomic_state_helper.c      | 128 +++++++++++++++++++++-
 drivers/gpu/drm/drm_drv.c                      |   6 +-
 drivers/gpu/drm/drm_mode_config.c              | 141 +++++++++++++++++++++++++
 drivers/gpu/drm/tidss/tidss_crtc.c             |  17 ++-
 drivers/gpu/drm/tidss/tidss_kms.c              |   2 -
 drivers/gpu/drm/tidss/tidss_plane.c            |   2 +-
 include/drm/drm_atomic_state_helper.h          |  12 +++
 include/drm/drm_connector.h                    |  13 +++
 include/drm/drm_crtc.h                         |  13 +++
 include/drm/drm_mode_config.h                  |   1 +
 include/drm/drm_plane.h                        |  13 +++
 14 files changed, 408 insertions(+), 28 deletions(-)
---
base-commit: 7b80021b1f0daed917ecc7f75077df799a8a698c
change-id: 20260310-drm-mode-config-init-1e1f52b745d0
prerequisite-change-id: 20251008-drm-private-obj-reset-ae1e2741027a:v5
prerequisite-patch-id: 9684f0ca4b16455c1340409561e8fb32f98b327a
prerequisite-patch-id: e177eb92b269436a94d7ef603d44436799be7469
prerequisite-patch-id: fef6d20ab33358c1db6cd9d21aa8ec0990cae758
prerequisite-patch-id: 2dcc96d43f34d8f6237829ed29d0087c092954d1

Best regards,
-- 
Maxime Ripard <mripard@kernel.org>

