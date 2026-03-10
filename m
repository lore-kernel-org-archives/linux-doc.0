Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1F7BB3BFE4D;
	Tue, 10 Mar 2026 16:07:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773158835; cv=none; b=iPm4S0pq2aIjKLAJ+uLnE8tv0TAHJW4XWfA+eKiCKz8pkQ0YZmevUnsTErRGEWFoTfKvLpaRoOoAym/6i/4eHIcvFcgw1nEfWGr3FrkS0HRg8Z/dnISOJTFFI3xaUIg/cFaXBH2VxmtcydLr9ytqgb94oVnCoBbEtmOxQUPrpuQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773158835; c=relaxed/simple;
	bh=50Fbqi2VnTgdkuk+BUDOfNFbw8A7u/ctiLVkwrOd0Js=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=d5tgT5IStZrsWlEMW6H7VsciUwIwQB+CYdYhN8+eql+paNpzxwFd/pv5XBWwdlh3AjTSTOhUYioyYpcd/8t7t+xC31n7hR9/BnRpkRYOnOH0fqOWtVCBKTI58InqaP3GTuyleUdB9lQdFx6AjHgpNlDwUc63erkSCRqSCmzRMMo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=Yna6ypOK; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="Yna6ypOK"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A1EF7C19425;
	Tue, 10 Mar 2026 16:07:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773158835;
	bh=50Fbqi2VnTgdkuk+BUDOfNFbw8A7u/ctiLVkwrOd0Js=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=Yna6ypOKP2w9ugdKDmwmMj1Nbt5JRRXejloG5crfwbiFKquek67b5ZyB6ZMQBrKLI
	 Kry4nsKTCkN2Zpab26y+OevAtN6m3d4BsLr4U+wJWG2rXz2rB8sEfm4TuUXZjbCQUZ
	 vCY7CiyFgLl5opgUf1UFycPCNUYD3EycN6LgYj9tMUO+iOiPVd9ZkNdVk1v/1oBmz9
	 XwbAHFDISwM+XB/9GYt4kAaDvX7OhDCVJ2VYW3Fx42pc1re2s16ljZL4xiQ07qhZNI
	 DNEDtR8ZK/s6I01k4ZAfSh6dIqbXTc/jUlaE2JhcFWTZvODveDCgrJYF/a+WrtUuHX
	 CFwjbh4QQxcFg==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 10 Mar 2026 17:06:54 +0100
Subject: [PATCH 02/14] drm/atomic: Drop drm_private_state.obj assignment
 from create_state
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-drm-mode-config-init-v1-2-de7397c8e1cf@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1530; i=mripard@kernel.org;
 h=from:subject:message-id; bh=50Fbqi2VnTgdkuk+BUDOfNFbw8A7u/ctiLVkwrOd0Js=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJkbHJecqfD3UWGL2S8c/Xye2VuNVhbxDP+Gikc6vZlLl
 YLmPefvmMrCIMzJICumyPJEJuz08vbFVQ72K3/AzGFlAhnCwMUpABNJDWasYp63I2w56+Z+vaLL
 r/6oMBo/say/7Om8v6Swz+Wdy7G9DYZCsV5piQVVT0N1Wl84ce1grFNUav2xYN2G1a8O6xm8Xpi
 m9er9vspLfmsufZNcof+0XvCD4I3Any7rZkhKMTtduXNftxIA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

The initial intent of the atomic_create_state helper was to simply
allocate a proper drm_private_state and returning it, without any side
effect.

However, the __drm_atomic_helper_private_obj_create_state() introduces a
side effect by setting the drm_private_obj.state to the newly allocated
state.

This assignment defeats the purpose, but is also redundant since
the only caller, drm_atomic_private_obj_init(), will also set this
pointer to the newly allocated state.

Let's drop the assignment in __drm_atomic_helper_private_obj_create_state().

Fixes: e7be39ed1716 ("drm/atomic-helper: Add private_obj atomic_create_state helper")
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic_state_helper.c | 2 --
 1 file changed, 2 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index bd6faa09f83b498b1417869493f31d876cd13914..323abc9926e084ad595768c06d5c5ee28c22c014 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -728,12 +728,10 @@ EXPORT_SYMBOL(drm_atomic_helper_connector_destroy_state);
 void __drm_atomic_helper_private_obj_create_state(struct drm_private_obj *obj,
 						  struct drm_private_state *state)
 {
 	if (state)
 		state->obj = obj;
-
-	obj->state = state;
 }
 EXPORT_SYMBOL(__drm_atomic_helper_private_obj_create_state);
 
 /**
  * __drm_atomic_helper_private_obj_duplicate_state - copy atomic private state

-- 
2.53.0

