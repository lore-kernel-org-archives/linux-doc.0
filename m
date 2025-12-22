Received: from smtpout-02.galae.net (smtpout-02.galae.net [185.246.84.56])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 471B2316199;
	Mon, 22 Dec 2025 10:11:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.84.56
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766398312; cv=none; b=t62D7GIJMziTI4Dcpva7PbNZZP440JjKt4wRrdZmmkfADM6ougA0Ruyq/SvYI+jxIPVfncuzlFVTo4NObWpBuv8ZPdRq4DRryrb+ragIB53pdUrpVAlaOd785vwbNsR4+j8KdvwkuvW0MfbNkMmaGCT3E4qgt4tM6/u/8tEDAO0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766398312; c=relaxed/simple;
	bh=OugjWrUvcZogEswAfggVPyTpTTPf0Dkr6yW/zV275yc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=AcO9ocgYYN6I1oH6J151aHmXoSmzoq8Bdq1d0kaaa6vGdUGGv2bUobh/uoq58fl4yf4T8oQonFQXMT7kimYRXj+I9fg7dkM5IZyH2+eDpZyzqSch8v7fULApfuyuUI66gcANddE/Ae8nZXyM0yYYc7gm0RprrR+LAJXqvHIoUD8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=fR9uB0X0; arc=none smtp.client-ip=185.246.84.56
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="fR9uB0X0"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id D45971A2373;
	Mon, 22 Dec 2025 10:11:48 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AB1BA606C1;
	Mon, 22 Dec 2025 10:11:48 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A246910AB0194;
	Mon, 22 Dec 2025 11:11:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766398303; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=fQe086Z7/WxnmGwFVKgVFgBoU8PQB9Lf8nUfzyMi1WQ=;
	b=fR9uB0X0D+txfJcIlRf2BQ6rg7Vre4QQFHd0C3PuEVAT3jvXBeEhSf46UONl2kKDr4ri10
	YE/zPMckOMgiVWZUroXUGUrVLURjI7aV7Pn6dMQr8sM5MBE7c9xv+rtzG4YilOM9WNXod5
	Qh8kJtYOryF6OnptUP9uYdm+iaiMMgCc4/KIeKptJ32/cLMFjbqrCb6+Zg3ySZWeUiew3K
	/IRiO+vXcc5y2pGgIMUQfX+ZZMeiiECzcdR/2hJWNq92wI+3XvsegR7b2Dmr2ETaxrLi+J
	ZanVeMjKO2yL71G6A15GvbhDCz/1cHLbkphZLlcXTBl9M4T5HfQRYAw2xVUoAQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 22 Dec 2025 11:11:13 +0100
Subject: [PATCH v3 11/33] drm/drm_color_mgmt: Expose
 drm_get_color_encoding_name
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-vkms-all-config-v3-11-ba42dc3fb9ff@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2160;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=OugjWrUvcZogEswAfggVPyTpTTPf0Dkr6yW/zV275yc=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpSRlBtQuL/9YhMx0gfTbscxESh+zBObPykBxmQ
 hsvCswuVEiJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaUkZQRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOIeuw//QsclYzU08o1tuQAPN9wIvVJAu0PCJPo
 Nh1SR3pPxOk3vl/EWpcfdIY6bXJ5mWFR5aRjBhYh1QUJCcdcisF1n5AFb8vvv7MwGy4K1cpmG0L
 UNIp6Ool45FXAv/anl5SvBiy1vnnqusiUTPr1R5PC/ECliLskE38lbH56pRF1EcYOHLMG/1Qdcr
 rbzMMk1iJjrcawsuwiiCb2AwKRZcE46qtds6utxGhpW+9szOjTCLa/GIORL3bnh+U8A1HGsx+pJ
 J2uK8uIOnPTQuP7UmlNeA5L9Ol5wl6XB+Lb3IEB6X2o851HoRPe5voVVJ+fD7/Y44RX95tSbg7L
 jEmRIWCXZFTDaQsi8bVPZgkkBunj9c4cRheVPgaNC3yaYbx52zw9Wx6wm+RYwTqijRvy4Z/Bmjm
 M03Lv70ybVsDpKPS/qi2ljTMBAP/zAzdqqFZKkghZCxSSX/bJTRPc7Y8u9alIwLrKam8v1X9238
 o3jvXYoNJunAn0rBXwsr/ca9IQtgYb6drG9nOWFgB/s5upUAfhTqJ0k2hwmK1LJ1pzlGuXAChlN
 UP1ZJaegkoJuq4y9Rii26bIAUXrOg6MG3A9x2WTbHe7jAlDn5mqYkR4zGflu/HXgpkLirjRbRme
 IRBhBOW0JVwfvlXFShoN4apF3pH3uEbeWsoZhJ/cfs6w4ERZnsh8=
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-Last-TLS-Session-Version: TLSv1.3

drm_get_color_encoding_name can be useful to display debug information
outside drm core. Export it so it could be used for VKMS

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/drm_color_mgmt.c    | 2 +-
 drivers/gpu/drm/drm_crtc_internal.h | 2 --
 include/drm/drm_color_mgmt.h        | 2 ++
 3 files changed, 3 insertions(+), 3 deletions(-)

diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
index c598b99673fc..56fd8e0620dd 100644
--- a/drivers/gpu/drm/drm_color_mgmt.c
+++ b/drivers/gpu/drm/drm_color_mgmt.c
@@ -496,7 +496,7 @@ const char *drm_get_color_encoding_name(enum drm_color_encoding encoding)
 
 	return color_encoding_name[encoding];
 }
-EXPORT_SYMBOL_IF_KUNIT(drm_get_color_encoding_name);
+EXPORT_SYMBOL(drm_get_color_encoding_name);
 
 /**
  * drm_get_color_range_name - return a string for color range
diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
index c09409229644..2f22b1a16dfa 100644
--- a/drivers/gpu/drm/drm_crtc_internal.h
+++ b/drivers/gpu/drm/drm_crtc_internal.h
@@ -38,7 +38,6 @@
 #include <linux/err.h>
 #include <linux/types.h>
 
-enum drm_color_encoding;
 enum drm_color_range;
 enum drm_connector_force;
 enum drm_mode_status;
@@ -121,7 +120,6 @@ int drm_mode_destroy_dumb_ioctl(struct drm_device *dev,
 				void *data, struct drm_file *file_priv);
 
 /* drm_color_mgmt.c */
-const char *drm_get_color_encoding_name(enum drm_color_encoding encoding);
 const char *drm_get_color_range_name(enum drm_color_range range);
 
 /* IOCTLs */
diff --git a/include/drm/drm_color_mgmt.h b/include/drm/drm_color_mgmt.h
index 5140691f476a..133ca77d91c7 100644
--- a/include/drm/drm_color_mgmt.h
+++ b/include/drm/drm_color_mgmt.h
@@ -113,6 +113,8 @@ enum drm_color_range {
 	DRM_COLOR_RANGE_MAX,
 };
 
+const char *drm_get_color_encoding_name(enum drm_color_encoding encoding);
+
 int drm_plane_create_color_properties(struct drm_plane *plane,
 				      u32 supported_encodings,
 				      u32 supported_ranges,

-- 
2.51.2

