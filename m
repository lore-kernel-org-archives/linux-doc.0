Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 750F226B74A;
	Tue, 10 Mar 2026 16:07:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773158858; cv=none; b=tc9pPnVO1LffupWnoXgytFKQMadq8DtF2Z2stjIhUD7AEZ/5/4o/RJSkyxcFmpaFrDCVAHSiLHLCyh3gLeEPDdMHgV6wvWAMvIvgIdG3jGs467blsgPw5Uax+3xNDH6T/TaQAA+q0/gbfiO3OPIGcl/9QTAlq/oSqAQmEkA7uqQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773158858; c=relaxed/simple;
	bh=0NCrUYiDXTVQ3wJ3wTIEbkD/aAsEjfCXUe8n9jnE9ik=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Dufm9+divyxZr0PgbTNBTncSECuzALnksnPSAHQhIxJUD2YbxyReteVOhmo4fgY4OQ2ASbDmYqyueJ04cOKEELUivO9u5UFMmc+uOazOjS/LlOBVjxJRwalBS3EmZwhiPSwom0te7atLzk/EmB3hnRm52czGHk1nwvG05q0Z6js=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=PO4CUllf; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="PO4CUllf"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3AA2C19423;
	Tue, 10 Mar 2026 16:07:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773158858;
	bh=0NCrUYiDXTVQ3wJ3wTIEbkD/aAsEjfCXUe8n9jnE9ik=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=PO4CUllfUHE/ztReyFTdk5126NLtBfGijLff5Nb49Diy8OECQp1+Xu3ySkcUrxIOO
	 i1ODzVi4KDWo3/hcZaz5ZQHKPOiR2TRNRGVziqRBPYe79Vi1ZjFTNy4J+3wkS1VjwL
	 GT4cw1WbRodE7VXhyFd96Gyhaxx5rsOkDK43WFIMzUd82FLelWn5CChNTSaS9VYNCn
	 j4zG4MrjKk3SdTeJRDP0V83V9J0Bt2Y4+ydd+7JAIphVYbYN8/PkIe8ReStqnT0JWO
	 UPU5B3lg/vrWOekaLNAvPqxUF49vDzFxpEMEt9s4rDNUe86gGQbO85eJwSLEkCE4IT
	 QCJkiBaS7S7OQ==
From: Maxime Ripard <mripard@kernel.org>
Date: Tue, 10 Mar 2026 17:07:02 +0100
Subject: [PATCH 10/14] drm/atomic: Drop private obj state allocation
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260310-drm-mode-config-init-v1-10-de7397c8e1cf@kernel.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1376; i=mripard@kernel.org;
 h=from:subject:message-id; bh=0NCrUYiDXTVQ3wJ3wTIEbkD/aAsEjfCXUe8n9jnE9ik=;
 b=owGbwMvMwCmsHn9OcpHtvjLG02pJDJkbHFcUifcdOHxAzsv338UFy732PV/SdjsvwJdxs35jw
 PuNbCKsHVNZGIQ5GWTFFFmeyISdXt6+uMrBfuUPmDmsTCBDGLg4BWAiuq6MtRIFQZlBhu6nOWaJ
 V+9SlDn/dMlb1oYbdzjCnuhE2ZrNl2VUiHf6vvDuiatJK/wXRy48z1jFvDrjdLXDlxkbukp/Rcy
 Puey1ef8m+SXf32ywbVPxK3hrmfTsVqerh1HdxU1p3sWP3SQB
X-Developer-Key: i=mripard@kernel.org; a=openpgp;
 fpr=BE5675C37E818C8B5764241C254BCFC56BF6CE8D

Now that drm_dev_register() calls drm_mode_config_create_state() for
every modeset driver, the private obj states will be initialized at
driver registration automatically if they haven't already.

Thus, the explicit initial allocation we have in
drm_atomic_private_obj_init() is now redundant, and we can remove it.

Signed-off-by: Maxime Ripard <mripard@kernel.org>
---
 drivers/gpu/drm/drm_atomic.c | 7 -------
 1 file changed, 7 deletions(-)

diff --git a/drivers/gpu/drm/drm_atomic.c b/drivers/gpu/drm/drm_atomic.c
index d1885f895cce78725419b6291f4dbe5563e3b240..e8dc019364d27123c3a682a10323fba9ff76f9df 100644
--- a/drivers/gpu/drm/drm_atomic.c
+++ b/drivers/gpu/drm/drm_atomic.c
@@ -991,25 +991,18 @@ static void drm_atomic_plane_print_state(struct drm_printer *p,
  */
 int drm_atomic_private_obj_init(struct drm_device *dev,
 				struct drm_private_obj *obj,
 				const struct drm_private_state_funcs *funcs)
 {
-	struct drm_private_state *state;
 	memset(obj, 0, sizeof(*obj));
 
 	drm_modeset_lock_init(&obj->lock);
 
 	obj->dev = dev;
 	obj->funcs = funcs;
 	list_add_tail(&obj->head, &dev->mode_config.privobj_list);
 
-	state = obj->funcs->atomic_create_state(obj);
-	if (IS_ERR(state))
-		return PTR_ERR(state);
-
-	obj->state = state;
-
 	return 0;
 }
 EXPORT_SYMBOL(drm_atomic_private_obj_init);
 
 /**

-- 
2.53.0

