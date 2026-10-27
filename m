Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793109251;
	b=qahBwdy1Y+EqTYXE8TWzzaX8eAhA69PszIj7kKUPztmEylC8HZ4Cl3Yj/XxrtFDkjyK+
	 S143jxBWrOVkDet7nfJ/HkD9QE1akAL6iJMKnGm2pHfFfrXuX57r7pMjsMSnXtU+D0Iij
	 BYK11B47GUWjhoaQDBOS47arjw1JWOCETCrPDXxslP0lC4bSRaBRP9x7zuCHtf9FA+9O+
	 ObAPPsKn+mx6OKYCUlRObetsKw+wjMQPT5cDtO0lriOpYMhzivsbnxz9WJRyY4w/b4kFt
	 bgYxwUiP/eawXIdYK5Ek8/sfYdBP06p3n3seld4oasQr1cvrI8USZ3iEXXsGVfXN+KA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793109251;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=fU1UKpzBNuXU6ySePDsKYMB2Kq9NDiCM/53N3kd7ajQ=;
	b=EL0BSp4MoUK2a+NTeOEwvlVbU7BstGxak1BxV+OcGLoEDm/pHq5VEjebHhtuVc9K/lby
	 yt5g+9082mRrfxSPn4Mfk1HAe7To8weDBvhwMrgCwajAj5bctmzZQsHdeXBb8gl4Exizr
	 JGwjm8njNvd5xL+iic6VEh0BekuPIP7hc3ZDj3szYyuN29oj7mTgOtKR4kqbU+MDVWhu4
	 qHnBm+eh+JX4UOSHPFjEhZTXxZoltbojui/qh6IBNPbB0WF9BHGg2UorGDHyYlZRowlFr
	 H0vFy3T3K6Dx4FKw6sukECD3anRTm/XVo7pDgMreYGIJN2wWVKLQ96bjyIWR7UBcaUQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IqGU5Z+y;
	arc=none smtp.remote-ip=209.85.221.49
Received: from mail-wr1-f49.google.com (mail-wr1-f49.google.com [209.85.221.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CADAE60A2606
	for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 13:54:10 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org CADAE60A2606
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=IqGU5Z+y
Received: by mail-wr1-f49.google.com with SMTP id ffacd0b85a97d-48df4e9d2d4so2496360f8f.3
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 06:54:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793109249; x=1793714049; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=fU1UKpzBNuXU6ySePDsKYMB2Kq9NDiCM/53N3kd7ajQ=;
        b=IqGU5Z+yI//Uf1f1InC3HbWaNBA9juMow4J6j21/IjLsy/OIkWb8l1dy+22F09jNzV
         pDR9l4AM1iB5b8gdMgCmA0McivtMFc6/ynrCQY5iULmmlvGkphtZuPZCoI6JVhhKEqpr
         Dg6sHWh0itWUOkLmnyLLremMAkJYHAFS3DgTLLk9/Ow9xQF2aPYwQB3ZcNOm9QJ5T/Rv
         rlGXXpvjjleJRsRRPJkYgVlQPOsMaNo8Jxb1RIA2rbddhAZpnELZLvMn5wkRBRDtEBMb
         +uugvAZLXOPIMdh37rUjulu/J+SLa8Lu5eURbtTL03+78xOqgArIfXFyBmKmKslt5eBh
         ANCg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793109249; x=1793714049;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=fU1UKpzBNuXU6ySePDsKYMB2Kq9NDiCM/53N3kd7ajQ=;
        b=ZJZZ04yNpO2HCbD+ezumzv9/r3XW+BbmZ38B1IF7ytvH6SC90oLm1Wx60s/fFkGYBh
         1y4JYdfsw7oyIQUGeGUzJXETn2ejnMnCfFDXS9ZIWpskhE0n+hxp1YhsCc3l+fAJpSbq
         eeJI1K7Ci+iw7lI+n5fcb/1eeNtrK48SQOVMh1UhgFjdDYFNSHQjuCnCg+0+uY7rJpk6
         Phqw9vKz7vhKZHqM8olg+pbWetRsmPjM5McQTTnWAA0+nP+tKMNtjKmespuuOoQfardg
         14RB+H2BOJCMBzj/VEH2Bor3vkEX8HeWAuBxExsyLTbsXXhO9Si5DmHwSwxrpQe9iLew
         c+Bw==
X-Forwarded-Encrypted: i=1; AKwUvBxBljkrhCVtFfk5UieeGfeN9SbfJtB0Ehz07Q6OllFfaBnIzAy6SZ50E/VUTECYOE7XQ4hb3gCj0Fo=@vger.kernel.org
X-Gm-Message-State: AFq9FYKh5kc94BN3AU7MdHJibnQQTR4YJSnn6KYAx4jQyJIH8Hyu9Cbz
	qC+nBBjDMzyZ9MvqaPWFQZ0yN7XL+bGClNJ45iDXYm4NWaYye7sUKuTD
X-Gm-Gg: AYBFou1Z+lEC9wLBMBm6gbRRnR4aTxyio5N8EgDyGgwnQ/AcrrwVP0pwEhreUXA4we6
	aTaAfobQvNSCAZ3ouVIW4Dh7TWo3WsMRLTSa985tEAR5RiGpTHS8dHQpRQC5e/46glCpS1JBVsF
	ePd13bKk4Z/1kRK1PMoKRdUcTNQyFQCcJexBB/9JiNSVuF9aPLkid/nlRVAuU8BmccwYqb+Dvji
	ABBgU/a1xmU0N+i4XDOw9xFDgfJNbQo046CR+iBCwQ3x1GsbRCGIYNmqmHrY8Pa23kdehXoSKt9
	+ai9EjZUw525lkvSrw6CY0tkAIQjld4Ri+DH5LxcrZTC/N92MEvMzIAI5QfQIgqd2aCWXZBueqa
	g2CVXR8Osr+bpFt5xCk5Xg03VJK7DUgmCyqqHPeZdQf3nUBURXlN7j8L8CEKqbfcMhSpU2v7ZR7
	Hf/IMeWJJw5HQdXlkFu0WZctS1E3/MPTdIf/K7lHnq7+5Ei0FLwRkoqDBdrmnsA51lc/LdahKWh
	jkQOXiqT1eIAdgCuw8c8LquHxdCuLwk6PTYguevzQK8AQIaVuZhBCz4woHY37qDkulNSMVktvNi
	aq3N9OE=
X-Received: by 2002:adf:e186:0:b0:48d:eec5:d243 with SMTP id ffacd0b85a97d-48e3eb8b71emr19191940f8f.9.1793109249072;
        Tue, 27 Oct 2026 06:54:09 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.117.46.175])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb846sm23128058f8f.25.2026.10.27.06.54.06
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:54:08 -0700 (PDT)
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
	Jonathan Corbet <corbet@lwn.net>,
	Helge Deller <deller@gmx.de>,
	Peter Jones <pjones@redhat.com>
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
	linux-fbdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-embedded@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 10/15] drm/client: splash: place the device tree image where it asks
Date: Tue, 27 Oct 2026 14:53:37 +0100
Message-Id: <20261027135342.2003632-11-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261027135342.2003632-1-maximpedraza@gmail.com>
References: <20261027135342.2003632-1-maximpedraza@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
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

Both come straight from the device tree. A property that is not two
cells, or that is out of the binding's range, is reported and keeps its
default;
otherwise the sum is done in 64 bits and clamped, and a silly pair of
values lands the image against an edge rather than off the screen: the
blitters do not clip. Every other source keeps being centred, except
the BGRT, which keeps its own offsets.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Màxim Pedraza Padilla <maximpedraza@gmail.com>
---
 drivers/gpu/drm/clients/drm_splash.c | 82 ++++++++++++++++++++++++++--
 1 file changed, 78 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/clients/drm_splash.c b/drivers/gpu/drm/clients/drm_splash.c
index 618c060f33d5..81070547390f 100644
--- a/drivers/gpu/drm/clients/drm_splash.c
+++ b/drivers/gpu/drm/clients/drm_splash.c
@@ -106,6 +106,14 @@ struct drm_splash {
 	size_t dt_len;
 
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
@@ -238,6 +246,39 @@ static struct device_node *drm_splash_dt_node(struct drm_splash *splash)
 	return NULL;
 }
 
+/* An X and Y pair; anything but two cells from @min to @max is reported */
+static void drm_splash_dt_pair(struct drm_splash *splash,
+			       struct device_node *np, const char *name,
+			       s32 min, s32 max, s32 *x, s32 *y)
+{
+	u32 val[2];
+
+	if (!of_property_present(np, name))
+		return;
+
+	if (of_property_count_u32_elems(np, name) != 2 ||
+	    of_property_read_u32_array(np, name, val, 2) ||
+	    (s32)val[0] < min || (s32)val[0] > max ||
+	    (s32)val[1] < min || (s32)val[1] > max) {
+		drm_warn(splash->client.dev, "splash: %pOF: invalid %s\n",
+			 np, name);
+		return;
+	}
+
+	*x = val[0];
+	*y = val[1];
+}
+
+/* The optional placement properties of the node, read once */
+static void drm_splash_dt_placement(struct drm_splash *splash,
+				    struct device_node *np)
+{
+	drm_splash_dt_pair(splash, np, "logo-position", -1, 65535,
+			   &splash->pos_x, &splash->pos_y);
+	drm_splash_dt_pair(splash, np, "logo-offset", -65535, 65535,
+			   &splash->off_x, &splash->off_y);
+}
+
 /*
  * Find the image when the source is picked, and keep it for the outputs
  * plugged in later. A node whose image cannot be had leaves the other
@@ -307,6 +348,11 @@ static bool drm_splash_dt_open(struct drm_splash *splash)
 	return false;
 }
 
+static void drm_splash_dt_placement(struct drm_splash *splash,
+				    struct device_node *np)
+{
+}
+
 static int drm_splash_dt_load(struct drm_splash *splash,
 			      const u8 **data, size_t *size)
 {
@@ -428,6 +474,26 @@ static int drm_splash_fill_solid_color(struct drm_client_buffer *buffer,
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
 /* The rows of a 24 bpp BMP, bottom up or top down, upright in XRGB8888 */
 static void drm_splash_bmp_decode(u32 *dst, const u8 *src, unsigned int spitch,
 				  unsigned int width, unsigned int height,
@@ -595,9 +661,10 @@ static int drm_splash_bmp_to_scanout(struct drm_splash *splash,
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
@@ -659,8 +726,11 @@ static int drm_splash_image_load(struct drm_splash *splash, const u8 **img_data,
  */
 static enum drm_splash_source drm_splash_pick_source(struct drm_splash *splash)
 {
-	if (drm_splash_dt_open(splash))
+	if (drm_splash_dt_open(splash)) {
+		drm_splash_dt_placement(splash, splash->dt_np);
 		return DRM_SPLASH_SRC_DT;
+	}
+
 	if (drm_splash_bgrt_available(splash))
 		return DRM_SPLASH_SRC_BGRT;
 	if (IS_ENABLED(CONFIG_DRM_CLIENT_SPLASH_SRC_BMP))
@@ -1114,6 +1184,10 @@ void drm_splash_register(struct drm_device *dev,
 	mutex_init(&splash->lock);
 	init_completion(&splash->fw_done);
 
+	/* Centred unless the image source asks otherwise */
+	splash->pos_x = -1;
+	splash->pos_y = -1;
+
 	if (format && format->num_planes == 1) {
 		splash->preferred_format = format->format;
 	} else {
-- 
2.39.5

