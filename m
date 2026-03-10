Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F9993AB290;
	Tue, 10 Mar 2026 16:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773158841; cv=none; b=PUnHh48LblOAP1V7MAAtbJAsIcmKk1Nr4iWwXydGt2DKbtFiq8UQSDX0CYkiDkaf6NlXFGG3KubiXM/rYm1Sl20wL/XiCnI3q8KX9kCqGplnMA/9t3rAqk7S1/TjsmXvmcpqKC7fkgedFtd2Slzj7gVsSyBlXlpzSPvtT8ZM19E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773158841; c=relaxed/simple;
	bh=jeBMY8QrFx9AcXG0qFCtKdLKyHBMZ3v0ChKg6Vznvgk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Te1HpmkyW69MJfk7hrJfck3hdgc3zaTml97hKlR8xkc/PuQwz19r8F3q7N3EhKU9NjDwOin/IzfJOT8dHufS/o8hmdTzwllIIXSzWKI+j4XFJ8bPyZorR+0bmBcLYhOH407cmcuiC0KeJGGt1xX+sqtsR2sCEpxoI039fc1ahn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=YBeLQD9w; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="YBeLQD9w"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 90F6CC19423;
	Tue, 10 Mar 2026 16:07:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773158840;
	bh=jeBMY8QrFx9AcXG0qFCtKdLKyHBMZ3v0ChKg6Vznvgk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=YBeLQD9w+KXz0be24h7KHlACG5S2SFNWo48qlyLU6xQRaoa7hinidRjFgh6/0wy+M
	 TkqAvd3KTrYc7E6SfB7rpEHtfLbn7R22Q5ACEtL74HrAJu2A6XVa+95sG4EBhjACCs
	 UMy+f0ESomzOYQWgLS7/hlIAHlAkmZpF4PWid/Mq+Nw2GqVaEGl7tfc97+GAroE+LO
	 wRZGjcxepAYmjVzpAZ3UK9kU3dyzplE1G5Cg+0Svij6U8zIEIr3dKX7vNg9o3/auqP
	 Y+lpRHQLK3KI18XbdDY5q2+09xhAQd1Aot6/BrOUUEJ48SWWeMwzt04YzjyNVf+9oO
	 nDfsvHXoTJkLA==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 10 Mar 2026 17:06:56 +0100
Subject: [PATCH 04/14] drm/atomic-state-helper: Fix
 __drm_atomic_helper_plane_reset() doc typo
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-drm-mode-config-init-v1-4-de7397c8e1cf@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1229; i=mripard@kernel.org;
 h=from:subject:message-id; bh=jeBMY8QrFx9AcXG0qFCtKdLKyHBMZ3v0ChKg6Vznvgk=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJkbHJduMi1edq9N3oqJ12777Ru2GslXEu1OCH/p9Zjv8
 nP3vDXWHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAiLeKMDUcYfQ5Ps/r9d2c6
 r1r996/6wrPkakVP5WgUl/n7RRa6bC99/Pv1yUnHIw/XrL3yNP/YBsb66kb/bet4lX1exnzfKJF
 5qSU1UGb1wg5pps4Evu9hazeqPLt4xOttT+i5OXrZmkKKhp4A
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

A typo has slipped through in the __drm_atomic_helper_plane_reset()
documentation, probably due to copy and paste. It will not assign
drm_crtc state pointer, but rather the drm_plane's.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_state_helper.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 323abc9926e084ad595768c06d5c5ee28c22c014..a1abf4247c348eca21da348c3893dd843b9ed391 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -302,11 +302,11 @@ EXPORT_SYMBOL(__drm_atomic_helper_plane_state_reset);
  * __drm_atomic_helper_plane_reset - reset state on plane
  * @plane: drm plane
  * @plane_state: plane state to assign
  *
  * Initializes the newly allocated @plane_state and assigns it to
- * the &drm_crtc->state pointer of @plane, usually required when
+ * the &drm_plane->state pointer of @plane, usually required when
  * initializing the drivers or when called from the &drm_plane_funcs.reset
  * hook.
  *
  * This is useful for drivers that subclass the plane state.
  */

-- 
2.53.0

