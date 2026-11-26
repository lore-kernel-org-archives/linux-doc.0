Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795692724;
	b=L/2kClTI2RgxffBMsBvGkmvSYmo+B1raaj28zuzl8pJ2x+ZgBJfPDz4lI4h+7q1nF1S/
	 O9DKMIgzU8dC8BY144UQXm+zE35qq4aB7Tk+gceRsW6UPgLcJniIbMh5kUbgxSyekKWBO
	 +MS5bm8lEn95CJOBZ44IXH6YDOeuskzuHUElMV99z2ImWX+qRHX37LVWQBoZVRFEXYKZF
	 1Km1vSJVimhcPeUjBwB5yFUSMFXm+j6Kk7WphEdpuUVfWC1U1vncy8LrZIXcjU41mFLzR
	 0YtgkpNazuxENGlQsdGQkJafoRikQzQqnYXrt4keoBouTM7ajH9CaM4Lzu3VKgzk7MQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795692724;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Last-TLS-Session-Version;
	bh=gbsdBUqknC0EeL3+wfraXPXc6qkvnAiATIJni8y7zLA=;
	b=F8asOpaPi5HPltZgnyBKc0nip3MnLnCRoqEPlnJlbY/+U0PJmTr9ipCuOjkshxcWhGjV
	 c1Xf/VP+fXSBjb7giwlkgPKjFcs3s2U6wo93T7s6NRPxx1/bxWg7ej/OAuqfb+d/CsxWs
	 WvhHey5s4E6uoGC2dO7UesC8eOVpvndqvWwR9qCxy4SFwDAvXg6d2hFPd/oVQpenaMjmO
	 DB5tfthG5Sfj5QBGUh9VYZMPd0FWa+tDbVAX090gC4rjdikojehIYaGO8RX4OG4YYk8ss
	 cYpbkz9ys69ee4zHtG3AJAK5D+tlRsW2b24Zat/bNRWF5g0R4IhcBnvreOStLu2zIrw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ZYu7E+l4;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C2754606A323;
	Thu, 26 Nov 2026 11:32:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C2754606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=ZYu7E+l4
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 72AEE1A1810;
	Thu, 26 Nov 2026 11:32:02 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3DE7360237;
	Thu, 26 Nov 2026 11:32:02 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 89C7811E6B306;
	Thu, 26 Nov 2026 12:31:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795692716; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=gbsdBUqknC0EeL3+wfraXPXc6qkvnAiATIJni8y7zLA=;
	b=ZYu7E+l4C0WMnK9FHdrKyv19gIZSVVzfeDezavy9V3mIX5KSYn4uonVjFcCXEWS1uiJFPJ
	uWDnsi29YBjMW0JGElZAX3gTXe/8GW9G5CFix/ByjuHTX/sYmBy+ZjplYloTZpmzfTItBf
	/G7f8B+ZyxQ+gYx5TCn14Jzm7ut9NqWEsyBdg9TkhJ1ZvSbBpO2RF7B8fEnwePC+Mrrz2M
	qhteHsDPOamdxjBv9TWHNzdpP6A5OPI+u/IgCM2cviOvBDzH8pBHWSg02k/gLO6MlnHWG1
	00Z0okmyWPvDuyACCdjNmFxBOcNT2DFdRo2IDSNgNJsMMlZiLtb80/lhIT9Hgw==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Thu, 26 Nov 2026 12:29:10 +0100
Subject: [PATCH v7 27/43] drm/vkms: Properly render plane using their zpos
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-vkms-all-config-v7-27-21194cda2468@bootlin.com>
References: <20261126-vkms-all-config-v7-0-21194cda2468@bootlin.com>
In-Reply-To: <20261126-vkms-all-config-v7-0-21194cda2468@bootlin.com>
To: Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, jose.exposito89@gmail.com, 
 Jonathan Corbet <corbet@lwn.net>, Oarora Etimis <oaroraetimis@gmail.com>, 
 Harry Wentland <harry.wentland@amd.com>, 
 Lucas De Marchi <demarchi@kernel.org>, 
 =?utf-8?q?Ville_Syrj=C3=A4l=C3=A4?= <ville.syrjala@linux.intel.com>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 Shuah Khan <skhan@linuxfoundation.org>, Miguel Ojeda <ojeda@kernel.org>, 
 Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Kory Maincent <kory.maincent@bootlin.com>, sebastian.wick@redhat.com, 
 victoria@system76.com, thomas.petazzoni@bootlin.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, llvm@lists.linux.dev
X-Mailer: b4 0.17-dev
X-Last-TLS-Session-Version: TLSv1.3

Currently planes are rendered in creation order. This is not an issue, but
with the introduction of new zpos configuration, it is required to
properly render planes.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_composer.c | 15 ++++++++++++---
 drivers/gpu/drm/vkms/vkms_crtc.c     | 16 ++++++++--------
 drivers/gpu/drm/vkms/vkms_drv.c      |  2 ++
 3 files changed, 22 insertions(+), 11 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_composer.c b/drivers/gpu/drm/vkms/vkms_composer.c
index 7a6a7875520c..4ccca8bd0c5c 100644
--- a/drivers/gpu/drm/vkms/vkms_composer.c
+++ b/drivers/gpu/drm/vkms/vkms_composer.c
@@ -592,7 +592,8 @@ static void blend(struct vkms_writeback_job *wb,
 
 		/* The active planes are composed associatively in z-order. */
 		for (size_t i = 0; i < n_active_planes; i++) {
-			blend_line(plane[i], y, crtc_x_limit, stage_buffer, output_buffer);
+			if (plane[i])
+				blend_line(plane[i], y, crtc_x_limit, stage_buffer, output_buffer);
 		}
 
 		apply_lut(crtc_state, output_buffer);
@@ -610,9 +611,13 @@ static int check_format_funcs(struct vkms_crtc_state *crtc_state,
 	struct vkms_plane_state **planes = crtc_state->active_planes;
 	u32 n_active_planes = crtc_state->num_active_planes;
 
-	for (size_t i = 0; i < n_active_planes; i++)
+	for (size_t i = 0; i < n_active_planes; i++) {
+		/* Invisible planes are stored as NULL entries */
+		if (!planes[i])
+			continue;
 		if (!planes[i]->pixel_read_line)
 			return -1;
+	}
 
 	if (active_wb && !active_wb->pixel_write)
 		return -1;
@@ -625,9 +630,13 @@ static int check_iosys_map(struct vkms_crtc_state *crtc_state)
 	struct vkms_plane_state **plane_state = crtc_state->active_planes;
 	u32 n_active_planes = crtc_state->num_active_planes;
 
-	for (size_t i = 0; i < n_active_planes; i++)
+	for (size_t i = 0; i < n_active_planes; i++) {
+		/* Invisible planes are stored as NULL entries */
+		if (!plane_state[i])
+			continue;
 		if (iosys_map_is_null(&plane_state[i]->frame_info.map[0]))
 			return -1;
+	}
 
 	return 0;
 }
diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index 019d7bc90cdc..eaddd8b70494 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -133,9 +133,6 @@ static int vkms_crtc_atomic_check(struct drm_crtc *crtc,
 		plane_state = drm_atomic_get_new_plane_state(crtc_state->state, plane);
 		WARN_ON(!plane_state);
 
-		if (!plane_state->visible)
-			continue;
-
 		i++;
 	}
 
@@ -144,15 +141,18 @@ static int vkms_crtc_atomic_check(struct drm_crtc *crtc,
 		return -ENOMEM;
 	vkms_state->num_active_planes = i;
 
-	i = 0;
 	drm_for_each_plane_mask(plane, crtc->dev, crtc_state->plane_mask) {
 		plane_state = drm_atomic_get_new_plane_state(crtc_state->state, plane);
 
+		/*
+		 * normalized_zpos is computed by the DRM core and is unique
+		 * in the range 0..n_planes-1: use it to index the array.
+		 */
 		if (!plane_state->visible)
-			continue;
-
-		vkms_state->active_planes[i++] =
-			to_vkms_plane_state(plane_state);
+			vkms_state->active_planes[plane_state->normalized_zpos] = NULL;
+		else
+			vkms_state->active_planes[plane_state->normalized_zpos] =
+				to_vkms_plane_state(plane_state);
 	}
 
 	return 0;
diff --git a/drivers/gpu/drm/vkms/vkms_drv.c b/drivers/gpu/drm/vkms/vkms_drv.c
index f73f136e5588..6c88e2a6a890 100644
--- a/drivers/gpu/drm/vkms/vkms_drv.c
+++ b/drivers/gpu/drm/vkms/vkms_drv.c
@@ -155,6 +155,8 @@ static int vkms_modeset_init(struct vkms_device *vkmsdev)
 	dev->mode_config.preferred_depth = 0;
 	dev->mode_config.helper_private = &vkms_mode_config_helpers;
 
+	dev->mode_config.normalize_zpos = true;
+
 	return vkms_output_init(vkmsdev);
 }
 

-- 
2.56.0

