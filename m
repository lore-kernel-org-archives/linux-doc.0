Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0420E423EB7
	for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 09:33:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791883995; cv=none; b=D+4tRxCyheruswtgmQlOAgv0vqaerdp4r1jzxFhqUGVZFHbeaJqPTJztJOz0U6dDXb+ug2OHR/cnOCK5gx0SODT6JRyLEptb2s2S7m1oRKi/OOIrP4XrJdTIT4xp3xtL+gN7DypUhz74gaPXmqZEWzRAnRLpJXJebAOmqIOO8Bs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791883995; c=relaxed/simple;
	bh=1sI4RrB3Cz4VCdyv6jI1n0jKRwRC4PWdTTVXHirEdoM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version:Content-Type; b=JAj1VtD/+MXCVIyfcymQ8liDyO4hJpiHRn6bNIb94LB3BVgAY1R6dbndDRmkj8zkD76+YS/7StcPoBwLSb/fP69JhhCwUflBSdrie7xkDhDsHX5YLKLfTSBo6W1CeSIvTTu1LrvQN22VKqI3OJGMCPXYW0YQBLFieY3n4E5+Mpg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=XU5atTGI; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="XU5atTGI"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-48c4649b35bso2535378f8f.3
        for <linux-doc@vger.kernel.org>; Tue, 13 Oct 2026 02:33:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791883988; x=1792488788; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=J3Mhzxgfk8rELBjNtRbn8fBvJ+iG+2e3C6/7nA4ujsg=;
        b=XU5atTGIZH/OyIyYWjfOekJUW7DcJ3kPuO7lEUzH6UgxTmYc8aMO82L3luaV9LsEs5
         zKAikQ2vb6YSW4r78EChULEdZFfg99T3ZJN3xMQ5VJWtUlkX3JmjBrc25dBKfO1AJZvA
         VczBxCpsv6WENrsuy4Goa9mvuL0PJUaEtf0y0OG6JZfN3I2prSRVzU6LWsoE9F2wU+fw
         z3YCioz+yIVhBBAdryMvho+eD71KGt4DQNcq3MBNLEVvjLe9AebMLBcxLS8SpCEGqDuo
         OrbB4ia+Wbm+19xgNkEeVAw983GbGFybx2Wvd3mufStsGmY5/HeQXWuHxvqZt6qiYbQ2
         AIpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791883988; x=1792488788;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=J3Mhzxgfk8rELBjNtRbn8fBvJ+iG+2e3C6/7nA4ujsg=;
        b=yl5J5/YDHcTJp0u9A2Sc/RHT/W+cJcQG1MxPaGlIVTzurj9sQefDij4wWmtzJZrkGQ
         b6xuwHwAxZIUDTlUGNWDc6JiFcxDGE6JWt9f7Qm86TL501oYIi08NM3nXDfw0zzp5kSa
         fwEjh3w1qGVzlJpqpk5y8YaGN27WwDrhwGiwNOAcAJa7Z7ATmOM9G/ddwIeuMOtq1Im8
         g7SXBgNOg+zyiQHMPgHDR8NEYNbE3GBIoMlj7ScYzERa1IfrOMY/O0u/YkkAcL7hjRaC
         y6guAJijzQHDdF2z6/4Qorm/kImx9sdKJ4gBRG1nb9x7KKebg8fRZQGuhIq+dzTS17TC
         kp9g==
X-Forwarded-Encrypted: i=1; AKwUvBzMcFB66jejt9T6s+T9CYgTFzmr8t47u7CXZDC7rJiEmT9wk2jkqhQEsQKyEpbxLXGieoJNhWvuryM=@vger.kernel.org
X-Gm-Message-State: AFq9FYIfPR2DuI9RL/LIgYF0yZ8O8KDORJvQyxX1BIyqzoskF2OtCEHL
	s0cHQH2vpuVAz3vB7kYAddvbufG60FvmRPWyAAZ25ceAa+78wnh+TvPA
X-Gm-Gg: AYBFou2Dt8s+Z6vRmcA9nafBBrnP6BNpB5bnvCp0CjaaMEdUaU1hYjDk43CCodkOimW
	1MiX3ilsCZ5iVN2vJ22LKLGrIUmLBSL61mZEKHR5kWiTxVnRPpQtHMhiLvKRtqfIk9Pdf010KMv
	XD7thEzEhMkGa/O0+uNA4TyuhOQcAplnWmpi3dpSD3N50pYzihRcWuHkr7uWz58mhigDoAApHvw
	NpcOyQ3zRA7RTrDxyId5OHJLH6nscLJT37UZ7f+qTngzV6PchDuP2zQh8BCMLR2nUzXnY3hu8Dd
	BmSD3DCNmXsyeZaPZU3Vw0YIoj11PKSQOuV+fiMtplMtbB9RIRwo0PveFHRayzXsPDZnDCYC1+3
	7vCliJ8TSenJLVHpq4RdxAfo3KB1JkHlG5zGQnERzYAhfDfgivGNiJ1xx1/Dtrh0K8ma34a8tOs
	2GXMYM+7jLvjduhJNBCGLSAT1bzpPhvhdKHUKLKt2ZoEGXH5cIxHydqnvmgLxnYEOsY/rFHl9mV
	1DPUxrJ0pFM6w4mr1gO0nY5
X-Received: by 2002:a05:6000:46c7:b0:48c:6955:a603 with SMTP id ffacd0b85a97d-48dbaadd962mr15329987f8f.13.1791883987585;
        Tue, 13 Oct 2026 02:33:07 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.112.15.218])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48de0bc4ec6sm3986774f8f.48.2026.10.13.02.33.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Oct 2026 02:33:06 -0700 (PDT)
From: =?UTF-8?q?M=C3=A0xim=20Pedraza=20Padilla?= <maximpedraza@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Ard Biesheuvel <ardb@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>
Cc: Francesco Valla <francesco@valla.it>,
	Jani Nikula <jani.nikula@linux.intel.com>,
	Mario Limonciello <mario.limonciello@amd.com>,
	Javier Martinez Canillas <javierm@redhat.com>,
	Jocelyn Falempe <jfalempe@redhat.com>,
	Sam Ravnborg <sam@ravnborg.org>,
	Ilias Apalodimas <ilias.apalodimas@linaro.org>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	dri-devel@lists.freedesktop.org,
	devicetree@vger.kernel.org,
	linux-efi@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-embedded@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v5 08/13] drm/client: splash: place the device tree image where it asks
Date: Tue, 13 Oct 2026 11:32:38 +0200
Message-Id: <20261013093243.505776-9-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261013093243.505776-1-maximpedraza@gmail.com>
References: <20261013093243.505776-1-maximpedraza@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

A logo supplied by the device tree describes a particular product, and
where it lands on the panel matters: some panels only show part of the
mode, so the middle of the mode is not the middle of what the user
sees.

Read the optional "logo-position" and "logo-offset" properties of the
node. The position is the top left corner, with -1 on an axis meaning
centre on that axis, and the offset is added afterwards, which is the
only way to say "below the centre" when the device tree does not know
the image size, as with an image in a reserved region.

Both come straight from the device tree, so the sum is done in 64 bits
and clamped, and a silly pair of values lands the image against an
edge rather than off the screen: the blitters do not clip. Every other
source keeps being centred, except the BGRT, which keeps its own
offsets.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Màxim Pedraza Padilla <maximpedraza@gmail.com>
---
 drivers/gpu/drm/clients/drm_splash.c | 73 ++++++++++++++++++++++++----
 1 file changed, 63 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/clients/drm_splash.c b/drivers/gpu/drm/clients/drm_splash.c
index 50842922a7f8..8561d00a5b96 100644
--- a/drivers/gpu/drm/clients/drm_splash.c
+++ b/drivers/gpu/drm/clients/drm_splash.c
@@ -122,6 +122,14 @@ struct drm_splash {
 	void *map_data;
 
 	enum drm_splash_source src;
+
+	/*
+	 * Where the image goes, in screen pixels: a coordinate of -1 centres
+	 * it on that axis, and the offset is added afterwards. Only the device
+	 * tree asks for anything but the centre.
+	 */
+	s32 pos_x, pos_y;
+	s32 off_x, off_y;
 };
 
 static struct drm_splash *client_to_drm_splash(struct drm_client_dev *client)
@@ -260,13 +268,21 @@ static struct device_node *drm_splash_dt_node(struct drm_splash *splash)
 	return NULL;
 }
 
-static bool drm_splash_dt_available(struct drm_splash *splash)
+/* The optional placement properties of the node, read once */
+static void drm_splash_dt_placement(struct drm_splash *splash,
+				    struct device_node *np)
 {
-	struct device_node *np = drm_splash_dt_node(splash);
+	u32 val[2];
 
-	of_node_put(np);
+	if (!of_property_read_u32_array(np, "logo-position", val, 2)) {
+		splash->pos_x = (s32)val[0];
+		splash->pos_y = (s32)val[1];
+	}
 
-	return np;
+	if (!of_property_read_u32_array(np, "logo-offset", val, 2)) {
+		splash->off_x = (s32)val[0];
+		splash->off_y = (s32)val[1];
+	}
 }
 
 static int drm_splash_dt_load(struct drm_splash *splash, const u8 **data,
@@ -319,9 +335,14 @@ static int drm_splash_dt_load(struct drm_splash *splash, const u8 **data,
 	return ret;
 }
 #else
-static bool drm_splash_dt_available(struct drm_splash *splash)
+static struct device_node *drm_splash_dt_node(struct drm_splash *splash)
+{
+	return NULL;
+}
+
+static void drm_splash_dt_placement(struct drm_splash *splash,
+				    struct device_node *np)
 {
-	return false;
 }
 
 static int drm_splash_dt_load(struct drm_splash *splash,
@@ -438,6 +459,26 @@ static int drm_splash_fill_solid_color(struct drm_client_buffer *buffer,
 }
 
 #if IS_ENABLED(CONFIG_DRM_CLIENT_SPLASH_BMP_SUPPORT)
+/*
+ * Place the image along one axis of the screen. @pos is the coordinate asked
+ * for, or -1 to centre on that axis, and @off is added afterwards. Both may
+ * come from the device tree, so the sum is done wide enough not to wrap, and
+ * the result keeps the whole image on the screen: the blitters do not clip.
+ */
+static unsigned int drm_splash_place_axis(s32 pos, s32 off, unsigned int span,
+					  unsigned int size)
+{
+	s64 last = (s64)span - size;
+	s64 coord;
+
+	if (last <= 0)
+		return 0;
+
+	coord = pos == -1 ? last / 2 : pos;
+
+	return clamp_t(s64, coord + off, 0, last);
+}
+
 static void drm_splash_blit_pix16(struct iosys_map *map, unsigned int dpitch,
 				  unsigned int x_pad, unsigned int y_pad,
 				  const u8 *sbuf8, unsigned int spitch,
@@ -636,9 +677,10 @@ static int drm_splash_bmp_to_scanout(struct drm_splash *splash,
 		}
 #endif
 	} else {
-		/* Center X and Y */
-		x_pad = (scanout->width - bmp_width) / 2;
-		y_pad = (scanout->height - bmp_height) / 2;
+		x_pad = drm_splash_place_axis(splash->pos_x, splash->off_x,
+					      scanout->width, bmp_width);
+		y_pad = drm_splash_place_axis(splash->pos_y, splash->off_y,
+					      scanout->height, bmp_height);
 	}
 
 	image_data = data + bitmap_offset;
@@ -721,8 +763,15 @@ static int drm_splash_image_load(struct drm_splash *splash, const u8 **img_data,
  */
 static enum drm_splash_source drm_splash_pick_source(struct drm_splash *splash)
 {
-	if (drm_splash_dt_available(splash))
+	struct device_node *np;
+
+	np = drm_splash_dt_node(splash);
+	if (np) {
+		drm_splash_dt_placement(splash, np);
+		of_node_put(np);
 		return DRM_SPLASH_SRC_DT;
+	}
+
 	if (drm_splash_bgrt_available(splash))
 		return DRM_SPLASH_SRC_BGRT;
 	if (IS_ENABLED(CONFIG_DRM_CLIENT_SPLASH_SRC_BMP))
@@ -1144,6 +1193,10 @@ void drm_splash_register(struct drm_device *dev,
 	spin_lock_init(&splash->fw_lock);
 	init_completion(&splash->fw_done);
 
+	/* Centred unless the image source asks otherwise */
+	splash->pos_x = -1;
+	splash->pos_y = -1;
+
 	if (format && format->num_planes == 1)
 		splash->preferred_format = format->format;
 	else
-- 
2.39.5

