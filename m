Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96E0C3191C6
	for <linux-doc@vger.kernel.org>; Mon, 22 Dec 2025 10:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766398332; cv=none; b=M2DlxrZaTyG4NVOMSySPOo1CGc6mBTamXOM9QlfKprMdvOEQwG86W9p5gDDfxomm5cbioTmcWNgvFE45slzOGoANcZGW9B/U7JzE1ZMjh6lmVaN9QJieeoCejoue8ABITxp42cnsiSGkDQH9swhBRc9ZDkzoR4+ojfwDvZqJcmA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766398332; c=relaxed/simple;
	bh=gGNgp7xNX8I1tSnKb8b5F8sjM7kP31NFBOBuYHhf1YA=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=R0qOZVTu14Msx+qswpYb6TjVs8ZowmWoA4vspdeAqW+G11GNOUXrHUubeHwgRpqmiDmAOqdY3a+Me4NU6z+//F1uesnDjGrAWTAvQsLLYj/jDxsiWtNs1n41hReP2b4X+l6XaX0zroNpx3Y4Y1EBtqgEOTAhS3uzR9ewpmnH568=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=NNrDIomQ; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="NNrDIomQ"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 3F1414E41D33;
	Mon, 22 Dec 2025 10:12:07 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 0EF2C606C1;
	Mon, 22 Dec 2025 10:12:07 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4905D10AB019D;
	Mon, 22 Dec 2025 11:12:04 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766398325; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=/i5I/GI6hYApVeEPXn4xiDPsvzwpR3K9s7zhvtoZ2/E=;
	b=NNrDIomQNnQN8m/ayvSVubfl+KL04Pd4b4hYbKy5dd4qcJyPLf/oeFsjoDDp6/U3E/AiKv
	bvf0qqpBameqoJlyFXkvVC9+F96VHZXcytCePQZe3PjS1wUuU19BgKOd+fkMPMOUUde2go
	pawB2xANqc9WSI8gdkenZ3uJP3E5veyAciP57Cszb6QIQBR6YiC7JnVKrJg2SVu/QQ9rV9
	fbguv5/L1AxFN0i+oyfXTnjUmp9tOejLZwXYIQB88L0KDZMo/kYj6tLYhHLSDsNqtNfHQP
	MxT4in9b0Et9jejs/aRnNUR0bTFNIlQIuwnm++HGHhogHnLdrk5XNQnFy0jNSg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 22 Dec 2025 11:11:21 +0100
Subject: [PATCH v3 19/33] drm/vkms: Properly render plane using their zpos
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-vkms-all-config-v3-19-ba42dc3fb9ff@bootlin.com>
References: <20251222-vkms-all-config-v3-0-ba42dc3fb9ff@bootlin.com>
In-Reply-To: <20251222-vkms-all-config-v3-0-ba42dc3fb9ff@bootlin.com>
To: Haneen Mohammed <hamohammed.sa@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, Melissa Wen <melissa.srw@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, jose.exposito89@gmail.com, 
 Jonathan Corbet <corbet@lwn.net>
Cc: victoria@system76.com, sebastian.wick@redhat.com, victoria@system76.com, 
 airlied@gmail.com, thomas.petazzoni@bootlin.com, 
 dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
 linux-doc@vger.kernel.org, Louis Chauvet <louis.chauvet@bootlin.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=1576;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=gGNgp7xNX8I1tSnKb8b5F8sjM7kP31NFBOBuYHhf1YA=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpSRlCtM+wm77OJKgVGtdAO9TEI5kIfVaA9oWuH
 3+V2PKYzGiJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaUkZQhsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOK0/BAAkB5ogctUFbmXg5hz0hjuDKK2LrWlr8T
 PzRdTsJu81Wu7z/jn+bk57wISBuiH/QSkYoyPOr5nQPPy09m9vNTRA7j2L3niTtdhw/AxZJ5L4T
 NcE6maSgSaBNCh4q5qhwk+c6RvpBqxv3TU9+bVA88P9txVUg+pdyuvFLQJvQmt3MpT7Cb6XT6uV
 LRmXVYcMlstwXoV//Q5lKeP/6GHx3z1vnUZGOELF+uO+16kGpsM7mFOUM5xhdPU3upeqVbCZWUh
 3Ng1KejNH08U3wAAzV3POasGov7DzQGJRrNvNrOd2u2gAXuwRpJt+4BXNVYVuusoI9pvxFiP7Gk
 /Ljj37stjF+nfhT33yIkRA30amEr0l+k0DqnIbv7VYxHScdLEkoQYlf63n3EeAI3qeq/Zbulm/a
 ImpVy2t0ZyUxsBmQu81uAEmaNCbC9qTTSVuDF8Ke9MFKIkS38TBEgzGMeDXLSsST98CB2wrr7lw
 cO4JtU8x+xYTDE39bdg693jAJ51yp2rAUCU3G1OqaIihM2eoCztHMaiTDigBxLnM7ZuplaX6VG8
 8p9GPbuzNKFOqdIt3p5HmCAZtstAJVdXI43Rt1+J0yal2L0Y9CmZ9MNhMvn6cl6Bnw/ExA01rNm
 qxfYhXHcBYTbqbhErv1lBrRoO93FqYh4UQywa6pnYtvxHIYPibQQ=
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-Last-TLS-Session-Version: TLSv1.3

Currently planes are rendered in creation order. This is not an issue, but
with the introduction of new zpos configuration, it is required to
properly render planes.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/vkms/vkms_crtc.c | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/drivers/gpu/drm/vkms/vkms_crtc.c b/drivers/gpu/drm/vkms/vkms_crtc.c
index 9a7db1d51022..ae0d3356dceb 100644
--- a/drivers/gpu/drm/vkms/vkms_crtc.c
+++ b/drivers/gpu/drm/vkms/vkms_crtc.c
@@ -4,6 +4,7 @@
 
 #include <drm/drm_atomic.h>
 #include <drm/drm_atomic_helper.h>
+#include <drm/drm_blend.h>
 #include <drm/drm_managed.h>
 #include <drm/drm_print.h>
 #include <drm/drm_probe_helper.h>
@@ -142,14 +143,20 @@ static int vkms_crtc_atomic_check(struct drm_crtc *crtc,
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
2.51.2

