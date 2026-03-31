Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 040443DD525
	for <linux-doc@vger.kernel.org>; Tue, 31 Mar 2026 14:41:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774968109; cv=none; b=r7dleJCRQ+ZNSgSWGyetWLY++yLkaTIvNNHiBNjCS4BihiQwF1vpQxfZf1vJ6a0F1qbIA6XIEkjzSVp3sliUw5nZfIrnVSIRILx6cUIlqRBtEs3+HHJIzxjhkOXWhb45Z750xafU6rnue3ByxWszdRx1kCXYxNxtmYwC4lPFbe4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774968109; c=relaxed/simple;
	bh=f9IVXML8pzkc0Fde3hPA9gWyRq9PebHuGmGgFZLCLNw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ZxsRnScO1KIs5xgHWjDRuYek1noVKzbgjeNeHRXFztHH9dML2zR771qdA/r2LeCFIpcMZIjzjEYI0HAWl5ihtUlT+hONNPP0bsjV8ReLBS5wYkS8vgaC/p08UhIYb3ljLFw6SqH4u2TWpAe3sBllMTkfOX5um9WhBN1CSzQ1A2c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=KwWG5Ll1; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="KwWG5Ll1"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 865E8C19423;
	Tue, 31 Mar 2026 14:41:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774968108;
	bh=f9IVXML8pzkc0Fde3hPA9gWyRq9PebHuGmGgFZLCLNw=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=KwWG5Ll1gWJRgP8Qzn9wCJI/71SLPGoHadBncQdMAv+gaKWYS4vfAd1NgnYOb2YuD
	 7cvLRuJgkbsodg8HALjvnQU5TCE7A0t2R0hDF6sSV/LIs7AdSj7QcunTWZRRIsFNDO
	 VSU0pvDLWw35gO6MgJXCDAV57KvuvEZmkk1M/SMLnFvqsp1ZTjUDh/LuIHG+bmplwB
	 BTcshPedQC0lRx4GNipUuuSG2ngiskdaB2ttM7ClHKnC2EUzrensdvIpH2F5YBunn5
	 QDFdQy2QtlLLPVR/OyRqB0CBpH0Thi2HRWWZ5y/WNdnbiA7o7ObA+eoIam/CIVjSMe
	 t97wCpjMRC+wA==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 31 Mar 2026 16:41:24 +0200
Subject: [PATCH v2 2/2] Documentation: drm: Remove drm_atomic_state rename
 entry
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260331-drm-drm-atomic-update-v2-2-7e8fe6ddcd32@kernel.org>
References: <20260331-drm-drm-atomic-update-v2-0-7e8fe6ddcd32@kernel.org>
In-Reply-To: <20260331-drm-drm-atomic-update-v2-0-7e8fe6ddcd32@kernel.org>
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
 Maxime Ripard <mripard@kernel.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=1734; i=mripard@kernel.org;
 h=from:subject:message-id; bh=f9IVXML8pzkc0Fde3hPA9gWyRq9PebHuGmGgFZLCLNw=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJmn7yq90T66ZIPFSpmDlwxsl70RKomeI/n1j0+dQM764
 6zbDr/a2jGVhUGYk0FWTJHliUzY6eXti6sc7Ff+gJnDygQyhIGLUwAmYjWXseH+E8//mxsbjbkM
 3VJC7za/PcJqW2e3YIni/DZhi8NyH0WrLIyXn2c9f/nwhetRLlcV3zLWih28v/zLFcOTxy4LxTJ
 lrZ0853Lhhjyfetcr5RylPB+KrfICO18bdk+NZVvCm+1apx0NAA==
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

We just did that item so we can remove it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 Documentation/gpu/todo.rst | 23 -----------------------
 1 file changed, 23 deletions(-)

diff --git a/Documentation/gpu/todo.rst b/Documentation/gpu/todo.rst
index 356f4e18b95723141cb5eb0e41bd1c3d12fa1cff..407ceb14524e6971a13812fed4496d0feb91108a 100644
--- a/Documentation/gpu/todo.rst
+++ b/Documentation/gpu/todo.rst
@@ -118,33 +118,10 @@ still look at that flag.
 
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

