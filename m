Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=185.246.84.56
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795197812;
	b=pihDDPOE+MqdylrouhXdyeWRXbLG0PvW5RKc5lTKMc9BlDGZJ0vxi79vamJAMJre026O
	 RIDiDddE0w1jBYescrgRULusz4bo9QrU4Xn6YYzzJvoIhqyLWzFiiTn9BmpANJK4h1Uqm
	 rt7xzNwsOueWooStXFRVTF11R+/TyCu2jKRMeSJju/aBBSJ0fUaOcJhP/pt0GEJkvOiMM
	 cX4wJFhIcuec++CB3L51uLjUP1teujFrQYcHC6T0MUGrWZ+ZND9eonzH5GnvcbfcT+zBf
	 XgpGPK555B316rGyHED/tl5YkkrF8bKhRaevdYSKoN3IBhY7KLcFK1SpVhPCtWz2OsQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795197812;
	h=DMARC-Filter:Received:Received:Received:DKIM-Signature:From:Date:
	 Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Last-TLS-Session-Version;
	bh=igrgnKvfig2Btr1MEOm3H8h+NFW/vPQnq+WswDulsck=;
	b=oYnd4zCdXjFp/J7GDeU5CtMvBRB/3kC4fsh8PywGyX9qMbrnEQ6KFP2BIWBpC/d+Nzle
	 HngEQrzk0LUBETYt1bXCLQRMVuOP6oKpXozmk0D8Bm44gyMcbXpXmdxsLbZlAFRiBzylK
	 Tv0p8W39bUM7NvpxG3w05S6sYlstvs6Uo8eqZ+Mkb7SZAGhy5ircdL6LIbsqBYAXucavG
	 Fc17b98RE4tdfrH8p5wMa7GwuNJ71d6SkvciX2dhcXSZeDixQD7C3svkLXL+YPEqjI/d/
	 Q/f0WhvpvJMNEmCUkxt4OOOyr+KpqWBN+DczltGoP6aNHuLFCiim/Gm1OMjDizw6oIA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bootlin.com;
	spf=pass smtp.mailfrom=bootlin.com;
	dkim=pass header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=I7zvyOoQ;
	arc=none smtp.remote-ip=185.246.84.56
Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 348B860A2618
	for <linux-doc@vger.kernel.org>; Fri, 20 Nov 2026 18:03:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 348B860A2618
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=I7zvyOoQ
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 037E81A1757;
	Fri, 20 Nov 2026 18:03:30 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id C39EB601B9;
	Fri, 20 Nov 2026 18:03:29 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 89E0711BC08D7;
	Fri, 20 Nov 2026 19:03:19 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1795197803; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=igrgnKvfig2Btr1MEOm3H8h+NFW/vPQnq+WswDulsck=;
	b=I7zvyOoQiVJYurCXxuCzuTzXXhh+RmwsdJKRbhoiNkQQa5hJGrH9Wij9lzEmc9spi862+h
	sNCuj2WIy83K2qcxFBFAoz9RnQ4CsWmVPtdQn1/hjriz3ylh71cdoGcq38bxcC+rlgqwJL
	8PzqrfgmEht6lWy2+yuMD6HaAindDah0oO9Wv7d0b8GQzVW3tcG5eDxtWrouiS8wA7Jr22
	JjnrGf9unfv5ZH8XkqHvC9WsDFPyE1kdJfrunC+SAsGjnvhOEFh5SK2GK99k2Jx/zTDZ7a
	MHWST5w1rH3Rk/7FgRXvGCpwi6hOjbTzNQl2rmvginCF+S2pt+68GKYYGghfcg==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Fri, 20 Nov 2026 18:58:52 +0100
Subject: [PATCH v6 10/43] drm/drm_atomic_state_helper: Properly load
 default value for rotation
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
Content-Transfer-Encoding: 8bit
Message-Id: <20261120-vkms-all-config-v6-10-78ace90f4fc1@bootlin.com>
References: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com>
In-Reply-To: <20261120-vkms-all-config-v6-0-78ace90f4fc1@bootlin.com>
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
 linux-doc@vger.kernel.org, Simona Vetter <simona.vetter@ffwll.ch>, 
 llvm@lists.linux.dev
X-Mailer: b4 0.17-dev
X-Developer-Signature: v=1; a=openpgp-sha256; l=1556;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=/rQ6Wm2eymebL5/sRFItZQlgeqH0lbZ7MQnRiX+73Dk=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBrAIr+TN890aHOM06Z4sF9YOZInnw4dsGdtsCOw
 FskVgmC6mSJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCawCK/hsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMiwyLDIACgkQIK0uxlsQLOLSAQ//dBzBboZEHh6a3mAkXd/Oi7TdgfiC60L
 f1wlo8abF7mZdvztdDNv9imQdSlC8HDb2gd8kNgNbEcsM/D1lW9evBz9RrVjo2uLB895VyC0BAJ
 w34gFfXH8xAaTTd2VZiGaufG0Hd5+QCVF4ntM59dZ7bRBYh6PeTqvN9rgDNm8/03MM3OhOpBXcP
 mVG8Rr7H8Gvf1P+2PwJrBl8hQ5Rgm9nEhrsEJvpiVyARRKOHm3wtCwTAiNwi8z4BaJdDq0u/rim
 uOYhE0Ce20LZu52MxFeuG3ZJElBTru5NIOZd3CuRnDT1cU03A1iHiiAVayWkDtCYlRpp+xFPsxg
 UeuP+if6k52SuhtSA8WmaFpul/J/UQ6JIB487ZrHmksFeMMCLV0OA9SqHRYfP44o57Qm2KcWUYF
 fZivsHS6cZNV6MSqFiv4ouHqShHNKqYyKyOJdl/u3LFF8BKoeXxsYukNoQprZHahgSD6rBrcUpa
 ERUkSL6ObrQ3JZeXJD2bzwvRQow612vj55vslZLrtTt10uFUg5TEp0geyWaC8taT6pERRW2eJrI
 PjudeRmbvprKUKNM2WFJSkoaQJHkvm3+EIuFJe6gPcbIf7mOVya6dEq2azq17zFOUIo7Q0OqZO7
 HNl+m87aRNfV0z2l44Mrzr0sIPXr8p1hshkxbYhngCzhHuclpuC4=
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-Last-TLS-Session-Version: TLSv1.3

Currently, the default rotation is always DRM_MODE_ROTATE_0 for all planes.
Some planes may have a rotation property, and the property may specify a
different default value and supported values.

This is not an issue for "fixed" configurations, but with the introduction
of VKMS configuration, some plane may only support 90° and 180°
rotations, so the reset state of the plane was wrong (forced to 0°).

Fixes: ab2dd990f4ab ("drm: Add __drm_atomic_helper_crtc_state_reset() & co.")
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/drm_atomic_state_helper.c | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/drivers/gpu/drm/drm_atomic_state_helper.c b/drivers/gpu/drm/drm_atomic_state_helper.c
index 267f44330629..13e848abb33c 100644
--- a/drivers/gpu/drm/drm_atomic_state_helper.c
+++ b/drivers/gpu/drm/drm_atomic_state_helper.c
@@ -32,6 +32,7 @@
 #include <drm/drm_crtc.h>
 #include <drm/drm_device.h>
 #include <drm/drm_framebuffer.h>
+#include <drm/drm_mode_object.h>
 #include <drm/drm_plane.h>
 #include <drm/drm_print.h>
 #include <drm/drm_vblank.h>
@@ -231,6 +232,11 @@ void __drm_atomic_helper_plane_state_init(struct drm_plane_state *plane_state,
 
 	plane_state->plane = plane;
 	plane_state->rotation = DRM_MODE_ROTATE_0;
+	if (plane->rotation_property &&
+	    !drm_object_property_get_default_value(&plane->base,
+						   plane->rotation_property,
+						   &val))
+		plane_state->rotation = val;
 
 	plane_state->alpha = DRM_BLEND_ALPHA_OPAQUE;
 

-- 
2.56.0

