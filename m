Received: from smtpout-03.galae.net (smtpout-03.galae.net [185.246.85.4])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AD536314D04;
	Mon, 22 Dec 2025 10:11:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=185.246.85.4
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766398319; cv=none; b=niRzwV+ezRm3DCq9f5yeKePH/IWeza8c00tTz114TrLlMswpS3n7zDPBDfXikU1CaF3Opsz/sDGrysHQjbuJiua9AGV5Vj92VvPDb8Uuk++3YJlpMFttB63snPJyyZ/Y3jjoRXTiR7Lgs2sMPPF49xkcRpODeCF71FqmOo7dPJs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766398319; c=relaxed/simple;
	bh=tUpMSF03u5oCySjWBJEfrxWBM9Xo0Mlwcy8LL9ObI0M=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hvMO9fvkVytodKV09LYliOQSQ8zuvmI4GFjjCAXGXtmJYc15qMs05p1yfrWWwITg0MBYxf0rVZOXlxoK1WBkZcdMNqyIBNC8iHuWG5khwyqdXY+JDYt2MU3j4HS+YRHIR6E3gG0IwgmW+Yv0zwfaMxBof8U8VnVfzPzw5+WY93Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com; spf=pass smtp.mailfrom=bootlin.com; dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b=iLTRlW3i; arc=none smtp.client-ip=185.246.85.4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=bootlin.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bootlin.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=bootlin.com header.i=@bootlin.com header.b="iLTRlW3i"
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 113744E41D33;
	Mon, 22 Dec 2025 10:11:56 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id DAEAB606C1;
	Mon, 22 Dec 2025 10:11:55 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 80ACC10AB019E;
	Mon, 22 Dec 2025 11:11:52 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1766398314; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=0WkyIctWllsokt9s1/yIkBw2IMbVHkBoQ1ZiBvPE/Qc=;
	b=iLTRlW3iYOr1yGebesGDom1V661+n5Qa7UV8poYesmBJEiZHoUe05ZzZbQnh+S2iV7iVJe
	QV4Z5UwZoV1uHZxPxj9nPJprZs3DcSRmtrJfY2hrVOPwy50Rjq+Z5f7RvpDfgdgAgxnfCI
	iQr7uAR4vl1VsujMQy0IhiGCpfBSa26AR5PtXdrvDtkgs2tZ33wn/t3hmvp+kEyJoUrjK5
	uaBY/BgYG8ctTvVSCdJAK847CgM+bJTKzi2rs3CT+YuIRMBXBeF2cMSNkpm36w1nrK2ag9
	GYMUldB+B2JSN4D+RF2I2Zx1NV9xQuQAZY/AWFHuG/CRgjto0spwJv1+JNmRTQ==
From: Louis Chauvet <louis.chauvet@bootlin.com>
Date: Mon, 22 Dec 2025 11:11:16 +0100
Subject: [PATCH v3 14/33] drm/drm_color_mgmt: Expose
 drm_get_color_range_name
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251222-vkms-all-config-v3-14-ba42dc3fb9ff@bootlin.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=2211;
 i=louis.chauvet@bootlin.com; h=from:subject:message-id;
 bh=tUpMSF03u5oCySjWBJEfrxWBM9Xo0Mlwcy8LL9ObI0M=;
 b=owEBiQJ2/ZANAwAIASCtLsZbECziAcsmYgBpSRlBzly2zMBPOZ4cBIPKVXLuauYNR4f1oicRC
 7bFE9iHcxCJAk8EAAEIADkWIQRPj7g/vng8MQxQWQQgrS7GWxAs4gUCaUkZQRsUgAAAAAAEAA5t
 YW51MiwyLjUrMS4xMSwyLDIACgkQIK0uxlsQLOIGpA//Qy6yCwUoigN6/0ta1gw1KtO+naZ/YZA
 ubzf+sHw257x0NB0UDmzTmqcfwC0wI9dAlVFL0BXL5db/RQa/a4BlpYE0kXuJsAtSHjkWI9aYoM
 jpFYbhh4DCUdZjYXBVwHuOVeLpJ6H16qNF+rVzWjYrzmTjAHJU4ajrVo0smVdBdmrwsoLFct+fm
 QjOKptmJ4fYSPOBCz7jx8OYDuYsVpV9nbN5GNTsqWmjm556NPsjhOCUk2IwNziXjA6N2Z+FzpGp
 tUXASozbssNf/I+W3OdDqMjwoPdneFUIrVtoWTAQGf8NYyhYEigyAJQzwPmjZ6TWmRRSuBL0T7X
 t4FkXOw9lMBREnfMoYcL/4lSohIJTlsMw3OfZuAJnwEwDHuR4s0/p4kko0BVEpmwgJnvrncLcqm
 z9A2mhpSxPaT16GgX2Yo1z2ZLViYh6MWjNZSUeCm6ed5/aBdmS4IF9BtSxq2RCi2PVe+8b+jDgA
 zOi1WDvpaSrbBQ1CHgB5gTb21b8e/6FY8m6EfRTJHRDVWP779UFl75icD7nWl9FQQ1m/ZO7HFiu
 Svx5LvkzaXR1SkRAMK33Sa34i5yLqzaImORr4ebjzXtT24QFWjy/FSWGnZ7T+Mu/qluc3T2dmp7
 +wpqsL51rQKD40E1E1SxgEP5EZ0K2W/GN/Im5XiapaK3GFMI46r4=
X-Developer-Key: i=louis.chauvet@bootlin.com; a=openpgp;
 fpr=8B7104AE9A272D6693F527F2EC1883F55E0B40A5
X-Last-TLS-Session-Version: TLSv1.3

drm_get_color_range_name can be useful to print debugging information.
Export it so it could be used from VKMS.

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
Signed-off-by: Louis Chauvet <louis.chauvet@bootlin.com>
---
 drivers/gpu/drm/drm_color_mgmt.c    | 2 +-
 drivers/gpu/drm/drm_crtc_internal.h | 4 ----
 include/drm/drm_color_mgmt.h        | 1 +
 3 files changed, 2 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/drm_color_mgmt.c b/drivers/gpu/drm/drm_color_mgmt.c
index 56fd8e0620dd..beced449ecf1 100644
--- a/drivers/gpu/drm/drm_color_mgmt.c
+++ b/drivers/gpu/drm/drm_color_mgmt.c
@@ -512,7 +512,7 @@ const char *drm_get_color_range_name(enum drm_color_range range)
 
 	return color_range_name[range];
 }
-EXPORT_SYMBOL_IF_KUNIT(drm_get_color_range_name);
+EXPORT_SYMBOL(drm_get_color_range_name);
 
 /**
  * drm_plane_create_color_properties - color encoding related plane properties
diff --git a/drivers/gpu/drm/drm_crtc_internal.h b/drivers/gpu/drm/drm_crtc_internal.h
index 2f22b1a16dfa..54bd491fbfba 100644
--- a/drivers/gpu/drm/drm_crtc_internal.h
+++ b/drivers/gpu/drm/drm_crtc_internal.h
@@ -38,7 +38,6 @@
 #include <linux/err.h>
 #include <linux/types.h>
 
-enum drm_color_range;
 enum drm_connector_force;
 enum drm_mode_status;
 
@@ -119,9 +118,6 @@ int drm_mode_mmap_dumb_ioctl(struct drm_device *dev,
 int drm_mode_destroy_dumb_ioctl(struct drm_device *dev,
 				void *data, struct drm_file *file_priv);
 
-/* drm_color_mgmt.c */
-const char *drm_get_color_range_name(enum drm_color_range range);
-
 /* IOCTLs */
 int drm_mode_gamma_get_ioctl(struct drm_device *dev,
 			     void *data, struct drm_file *file_priv);
diff --git a/include/drm/drm_color_mgmt.h b/include/drm/drm_color_mgmt.h
index 133ca77d91c7..e91f494e5a63 100644
--- a/include/drm/drm_color_mgmt.h
+++ b/include/drm/drm_color_mgmt.h
@@ -114,6 +114,7 @@ enum drm_color_range {
 };
 
 const char *drm_get_color_encoding_name(enum drm_color_encoding encoding);
+const char *drm_get_color_range_name(enum drm_color_range range);
 
 int drm_plane_create_color_properties(struct drm_plane *plane,
 				      u32 supported_encodings,

-- 
2.51.2

