Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 53D57393DC8
	for <linux-doc@vger.kernel.org>; Thu,  2 Apr 2026 08:23:56 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775118236; cv=none; b=AWUNOs2XydU7VbT0Ckh9Q5Vp5h2TV2lVCpjSI0rl1UzlV3NUpupbmtIomG0BHJfbFVJPgJsmM0CyNDfb3OEDno9NPcBozYqpeJNaFfUy79UjeTut6/KsXLm5sbsg6Z99edVuXPJl/T4f8/UlQ5rQt5sLKW8OwYiabSwG9dIyFPk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775118236; c=relaxed/simple;
	bh=iWXNVIUZfnMW7ccKC6aXFgVMhK9ernXK6+j0PJXs1tU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ydx91QtOMk+5MZE7h9JbgTgUrxjWNHAcx9P57G9Uq75PaaZ+ykmvzbKVyd7jZLPwJ2JZO2BBoO6Rq2jxsFqbFrKw3pzAoB5ulKi4daGwRTLGWZ79fYJ8xB7uGFnbQTK/e33KiwLuPQEtcTI0uBEzO5N688Pu8qWt5lSiWLfya+I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=tIWiyezw; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="tIWiyezw"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4D1CC116C6;
	Thu,  2 Apr 2026 08:23:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1775118236;
	bh=iWXNVIUZfnMW7ccKC6aXFgVMhK9ernXK6+j0PJXs1tU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=tIWiyezwCAFoPLv2uxCkYLhBz+hIFf6VJN2MHl80L0OaIXtpT9YZHcgXB4lnzOJ+M
	 rKVL94vHukPQ4/Og7QQQXjzPAwf0wq7u8E3NpNxPgMB1SgvHqpJI+kxOTVX8dZ/Mky
	 pAa4VF1cxSdu9icT0pR7QHMsWTLPCmdzZLeO9MuPWU6dndfP/xehCuYVOMwLsgonJE
	 sWCSf+bX4mnJlJyA37LJNHL4SZsDfsuJkwXs0NfjGaIfH20uRuD4OvuBBVh9MSYbak
	 M/oY9DkIJ6gM846m6LXSDFDMTfnYIe1izUh3I1zMJBACBaZPgloFBb+U/tYF6EF29b
	 UofjFQm3PCenA==
From: Maxime Ripard <mripard@kernel.org>
Date: Thu, 02 Apr 2026 10:23:31 +0200
Subject: [PATCH v3 2/2] Documentation: drm: Remove drm_atomic_state rename
 entry
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-drm-drm-atomic-update-v3-2-b826f51ac511@kernel.org>
References: <20260402-drm-drm-atomic-update-v3-0-b826f51ac511@kernel.org>
In-Reply-To: <20260402-drm-drm-atomic-update-v3-0-b826f51ac511@kernel.org>
To: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Thomas Zimmermann <tzimmermann@suse.de>, Jonathan Corbet <corbet@lwn.net>
Cc: Jani Nikula <jani.nikula@linux.intel.com>, 
 Joonas Lahtinen <joonas.lahtinen@linux.intel.com>, 
 Rodrigo Vivi <rodrigo.vivi@intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Alex Deucher <alexander.deucher@amd.com>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Rob Clark <robin.clark@oss.qualcomm.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
 dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org, 
 Maxime Ripard <mripard@kernel.org>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Jani Nikula <jani.nikula@intel.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1837; i=mripard@kernel.org;
 h=from:subject:message-id; bh=iWXNVIUZfnMW7ccKC6aXFgVMhK9ernXK6+j0PJXs1tU=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJnn1Ls9TmtHJl57YFohlCAnUHChWH5CToCKsKLiDK9LH
 3IvbvreMZWFQZiTQVZMkeWJTNjp5e2LqxzsV/6AmcPKBDKEgYtTACZyT5mxoXnu5uXN8iL+a4TL
 7waZMzgLc/qx1ibx90Yb3ZSMO6Q4VylAYqnH7tP7Xzr15X2PuHGYsT5FhFt3xoR1qdKTP03bmML
 rxpp/8Phpdc8NjZvyzsQlMfR/2Ztn1my252vvrvnML+1iCwA=
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

We just did that item so we can remove it.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Acked-by: Jani Nikula <jani.nikula@intel.com>
Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 Documentation/gpu/todo.rst | 23 -----------------------
 1 file changed, 23 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 2ceb00e08c59f0602de994749ec137107c80fb14..cdddf8db35f533787aaad22c3066766e804e8ecf 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -150,33 +150,10 @@ still look at that flag.
 
 Contact: Simona Vetter, respective driver maintainers
 
 Level: Advanced
 
-Rename drm_atomic_commit
------------------------
-
-The KMS framework uses two slightly different definitions for the ``state``
-concept. For a given object (plane, CRTC, encoder, etc., so
-``drm_$OBJECT_state``), the state is the entire state of that object. However,
-at the device level, ``drm_atomic_commit`` refers to a state update for a
-limited number of objects.
-
-The state isn't the entire device state, but only the full state of some
-objects in that device. This is confusing to newcomers, and
-``drm_atomic_commit`` should be renamed to something clearer like
-``drm_atomic_commit``.
-
-In addition to renaming the structure itself, it would also imply renaming some
-related functions (``drm_atomic_commit_alloc``, ``drm_atomic_commit_get``,
-``drm_atomic_commit_put``, ``drm_atomic_commit_init``,
-``__drm_atomic_commit_free``, etc.).
-
-Contact: Maxime Ripard <mripard@kernel.org>
-
-Level: Advanced
-
 Fallout from atomic KMS
 -----------------------
 
 ``drm_atomic_helper.c`` provides a batch of functions which implement legacy
 IOCTLs on top of the new atomic driver interface. Which is really nice for

-- 
2.53.0

