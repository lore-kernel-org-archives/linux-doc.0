Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BDD143C342A;
	Tue, 10 Mar 2026 16:07:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773158866; cv=none; b=OgZasKse/i0hhIvKTJa5H+9Gw3HqXtwfAvuLpbDXtHEpSwv1ZqNv8uUH4mBYhuptkYGFAAFi7RDT/Ua8ln2uHlH21SJjdGpSsJWLxyoc7ctohXbxR6NchT2zJiV5PQ9x+pNzHjmIAecaVlwYhFHNRM+SNnyeP722v1lEdUrO/d4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773158866; c=relaxed/simple;
	bh=MEDGk/rh93wNi6cr2oco3L6Llp5wif5wEB6hoxGlP3s=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oadGlWcIssiQM8J3veNCrqyqmy3J+pc3t1mFK1rDHr3A3aggn9839Rx2U9muMe3fT6UPFrMeb6UF61KhGHQoWMmyrmkUyZjX+xONGj2T5+RwALqJ18a6tT5C4u/XiSdvb4s7MYOnD1DQ1AVNs6gjH0YhBZsfJyv5dHe8PMq4uWY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=LXOHX6C8; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="LXOHX6C8"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3F397C2BC9E;
	Tue, 10 Mar 2026 16:07:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773158866;
	bh=MEDGk/rh93wNi6cr2oco3L6Llp5wif5wEB6hoxGlP3s=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=LXOHX6C8GUNSKMaifqru8XlgS+ZWcD10w7j/Ye7dJDZ5C1kNtk9/HGHIHjbG57fkN
	 LK9b0n8zUx8sbLewYHZ8olxtC6s/qU+ai/GSVK176KoqkK/ci3tOq17PX7NNxQs9LB
	 RjhSndtnXn1Td+t2XHLpph2x/T/ef81oBxRNFx544YaJe6g785HquL4KrgE1hFGoRz
	 z9bEreuiGs1s2e9Pc0kEKWImyMK7fZR5J1pfQ811qkKIZeXafbun8zjCrfCf88IPeT
	 AJWvUtxc5W1jWETaWC9/PQO0OODq7Ks3SaWlQ6kW84Y2Am6/pcm+Ayx5b7TY3ELgsw
	 7H9+J0X94vvCw==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 10 Mar 2026 17:07:05 +0100
Subject: [PATCH 13/14] drm/tidss: Convert to atomic_create_state
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-drm-mode-config-init-v1-13-de7397c8e1cf@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3067; i=mripard@kernel.org;
 h=from:subject:message-id; bh=MEDGk/rh93wNi6cr2oco3L6Llp5wif5wEB6hoxGlP3s=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJkbHFfGnA3f7e5o3/3otMwSy6+vjVVUXcUcpjfMmunzh
 nm18rOIjqksDMKcDLJiiixPZMJOL29fXOVgv/IHzBxWJpAhDFycAjARw8WMDb3i0xke1fWW5jzL
 MHyw2eVuhZ3Zl6nfQorll7sf2ZOg4xyz4n/mli0HdLzS73JG8YjaMdYpP+/LfDD36IJChZwSg5k
 hC1YZpsWJp7R9Vebe8pNv/TO1LtWOc3kHD6vOmy1f5HjimAEA
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

Our driver uses reset to create the various object states, but only
calls the helper that allocate a new state. They are thus strictly
equivalent to the new atomic_create_state helpers, so let's switch to
these.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/tidss/tidss_crtc.c  | 17 +++++++----------
 drivers/gpu/drm/tidss/tidss_plane.c |  2 +-
 2 files changed, 8 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/tidss/tidss_crtc.c b/drivers/gpu/drm/tidss/tidss_crtc.c
index a31c21c5f855ac8a94089dd3908e2510193b7d67..66e3d161c60bc14b2982cff4cdd43030d4086798 100644
--- a/drivers/gpu/drm/tidss/tidss_crtc.c
+++ b/drivers/gpu/drm/tidss/tidss_crtc.c
@@ -355,24 +355,21 @@ static void tidss_crtc_destroy_state(struct drm_crtc *crtc,
 
 	__drm_atomic_helper_crtc_destroy_state(&tstate->base);
 	kfree(tstate);
 }
 
-static void tidss_crtc_reset(struct drm_crtc *crtc)
+static struct drm_crtc_state *tidss_crtc_create_state(struct drm_crtc *crtc)
 {
 	struct tidss_crtc_state *tstate;
 
-	if (crtc->state)
-		tidss_crtc_destroy_state(crtc, crtc->state);
-
 	tstate = kzalloc_obj(*tstate);
-	if (!tstate) {
-		crtc->state = NULL;
-		return;
-	}
+	if (!tstate)
+		return ERR_PTR(-ENOMEM);
 
-	__drm_atomic_helper_crtc_reset(crtc, &tstate->base);
+	__drm_atomic_helper_crtc_create_state(crtc, &tstate->base);
+
+	return &tstate->base;
 }
 
 static struct drm_crtc_state *tidss_crtc_duplicate_state(struct drm_crtc *crtc)
 {
 	struct tidss_crtc_state *state, *current_state;
@@ -403,14 +400,14 @@ static void tidss_crtc_destroy(struct drm_crtc *crtc)
 	drm_crtc_cleanup(crtc);
 	kfree(tcrtc);
 }
 
 static const struct drm_crtc_funcs tidss_crtc_funcs = {
-	.reset = tidss_crtc_reset,
 	.destroy = tidss_crtc_destroy,
 	.set_config = drm_atomic_helper_set_config,
 	.page_flip = drm_atomic_helper_page_flip,
+	.atomic_create_state = tidss_crtc_create_state,
 	.atomic_duplicate_state = tidss_crtc_duplicate_state,
 	.atomic_destroy_state = tidss_crtc_destroy_state,
 	.enable_vblank = tidss_crtc_enable_vblank,
 	.disable_vblank = tidss_crtc_disable_vblank,
 };
diff --git a/drivers/gpu/drm/tidss/tidss_plane.c b/drivers/gpu/drm/tidss/tidss_plane.c
index aaa02c851c595aa3781ec2e6741af1999092aa40..518498d4576528a0ec59fd03cf27a87b1b3f1e6e 100644
--- a/drivers/gpu/drm/tidss/tidss_plane.c
+++ b/drivers/gpu/drm/tidss/tidss_plane.c
@@ -176,12 +176,12 @@ static const struct drm_plane_helper_funcs tidss_primary_plane_helper_funcs = {
 };
 
 static const struct drm_plane_funcs tidss_plane_funcs = {
 	.update_plane = drm_atomic_helper_update_plane,
 	.disable_plane = drm_atomic_helper_disable_plane,
-	.reset = drm_atomic_helper_plane_reset,
 	.destroy = drm_plane_destroy,
+	.atomic_create_state = drm_atomic_helper_plane_create_state,
 	.atomic_duplicate_state = drm_atomic_helper_plane_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_plane_destroy_state,
 };
 
 struct tidss_plane *tidss_plane_create(struct tidss_device *tidss,

-- 
2.53.0

