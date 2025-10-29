Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96C563358CD
	for <linux-doc@vger.kernel.org>; Wed, 29 Oct 2025 14:37:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761748646; cv=none; b=O1oiNWrRE73EtfTwADgqEbAqpCkep/x4fKs+VYi86owYjUSZpfrqx6QxZS5Mr+gRYpGWFVHkfgpnXJpjMgmo5AVIpDLSlV9Ul5cK5POwh8icDgXhcVRLYNUPSbaxdGWAVCIjyfWJz2w4QuskNucUJyfUc5MZpwmq0/vWSBwd8EA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761748646; c=relaxed/simple;
	bh=rnZm7r0xEd9LrIvetwHGtyd26t99JexCbu1jReAcAkA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=ASC78Kd5Et+nYhD2PbAvjySUWic4DGtk+A91bc56OWZjGgf+Nny6e8Hr25rkEk3pXJ5eN4vR4Nbf8Lw8w/83xCm1nRElJ2NU9omGQuBaHjiDXHqj7ks5LHMnd56p/7iNKpdEybduLn13GUokwswVQ4B9Ne+31OdKD0fSURmIE0E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=wpwXU8Li; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="wpwXU8Li"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C6E8E1A174A;
	Wed, 29 Oct 2025 14:37:22 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 9D57E606E8;
	Wed, 29 Oct 2025 14:37:22 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A3F3F117F81AF;
	Wed, 29 Oct 2025 15:37:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761748641; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=wuzcvgdxKucfzXi8j9im5vi/vTJhBZGMa5n+dwDEVE8=;
	b=wpwXU8Li2/6wN+XcWgPzVcZOQiH+n9oqv609Yka7wVMI0+znjXOocV7UxkALOoOv7QPCBn
	ecoE1pH7Mytoblv7WPVkZKm7d+1RVY0N3Xw/Zz9zMA3WggSUarkEvvtBXlJaeC8eLeDUDb
	QsR/1BumbB0fP5nt0yroKSfouYUUMs/h1N3DagWSUZoYbeTdrm65SU5Brqbdu5Jur9rp+R
	Tnc3zBzeEXYZsDcqpz/tXowJzLgTtRijG5IrmKb/clgNsLSyC8Jksufd+cGkdIiXfMt4mU
	LYdgM9AhhFD4C6aL21Nx1TouqZpq11xutXr4/BCpPAVlqc2XCJJGO6Y53jVUEA==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Wed, 29 Oct 2025 15:36:55 +0100
Subject: [PATCH RESEND v2 18/32] drm/vkms: Properly render plane using
 their zpos
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251029-vkms-all-config-v2-18-a49a2d4cba26@bootlin.com>
References: <20251029-vkms-all-config-v2-0-a49a2d4cba26@bootlin.com>
In-Reply-To: <20251029-vkms-all-config-v2-0-a49a2d4cba26@bootlin.com>
To: Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, jose.exposito89@gmail.com, 
 Jonathan Corbet <corbet@lwn.net>
Cc: victoria@system76.com, sebastian.wick@redhat.com, victoria@system76.com, 
 airlied@gmail.com, thomas.petazzoni@bootlin.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1521;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=rnZm7r0xEd9LrIvetwHGtyd26t99JexCbu1jReAcAkA=;
 b=owEBbQKS/ZANAwAKASCtLsZbECziAcsmYgBpAiZ8bCaudyWE+A46e5tkBU4wtEm5i2Rcwx3CM
 dtYEjx2VhuJAjMEAAEKAB0WIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaQImfAAKCRAgrS7GWxAs
 4ouSEAC+Az4FjpAq1CI4MetBO1K/TjVnfjMYKXHpb0KXMqNzNpKz6y5kFhL4fHqIxochAVYO+EQ
 4S7hBnTAoWTpuLJWxBrZnPhtB6XPcVTQat36SztGkgaAg/IlmJnGGswMKVbngD30fDGtE+GBi5x
 5oHqZSOZ96f2qT7c/eme3a0PYoKDu0o8V3G+z/veqc8Z/KQhiJqVibhBQxPmCzo0TLBrFU9JL8Y
 FUnVKiqmwtQsjXlOKcE6gbleXbOUYKxEkhDVFlo9tbF0Gbepo7OXqhgaKev48lJf1Sx+CzM77AK
 Tz4YkPEeCH7ix1QUJdmYULWVazQ1ZzY35hAABwfccE4ECc3CFhGFVdFzrnV4FpoW2inX0GkYRjN
 XFdiHiPc5gCXVGqcqnCogpJ0s9Dy+muPMyy7Dh8dLNDlY7dXUGK25PSxC7h0/wvhsi5iuvlBk3Q
 PSqlSlISIUUuyYLT8LDLckxzSOpUFGMHTfujwoSsAkvcqSjrhwxVppjE1PoZgITiGQF7aLNBY35
 Cx8Lq0lRlhTSVJkQr2qnJMO3DD4y7AFXkyhBeeZXjFZx0mB/tE/igHwnWdkK0yDwazM+SPcNhJ8
 MmX7EOW7hX61KulOeWZ7bHaP9AJyj0zvwnLTjaaa3rHBdvg9v01stAA110Y4R9OVDfiIZyZ3wNJ
 DhKHLt/tUShe+oQ==
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-Last-TLS-Session-Version: TLSv1.3

Currently planes are rendered in creation order. This is not an issue, but
with the introduction of new zpos configuration, it is required to
properly render planes.

Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_crtc.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index bac0790c6577..0524c47460fb 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -4,6 +4,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_blend.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_probe_helper.h>
 #include <drm/drm_vblank.h>
@@ -141,14 +142,20 @@ static int vkms_crtc_atomic_check(struct drm_crtc *crtc,
 		return -ENOMEM;
 	vkms_state->num_active_planes = i;
 
-	i = 0;
+	ret = drm_atomic_normalize_zpos(crtc->dev, state);
+	if (ret)
+		return ret;
+
 	drm_for_each_plane_mask(plane, crtc->dev, crtc_state->plane_mask) {
 		plane_state = drm_atomic_get_new_plane_state(crtc_state->state, plane);
 
 		if (!plane_state->visible)
 			continue;
 
-		vkms_state->active_planes[i++] =
+		// Order planes according to their normalized_zpos
+		// After drm_atomic_normalize_zpos, the possible values are 0..n_planes-1
+		// so store them using this index
+		vkms_state->active_planes[plane_state->normalized_zpos] =
 			to_vkms_plane_state(plane_state);
 	}
 

-- 
2.51.0

