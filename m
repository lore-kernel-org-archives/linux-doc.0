Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793109255;
	b=ZB/OmDQZjHysdiVrUjCj8WSkql90DFc8sUkZ6uQUC0boJ7+zd5vlwMh5YZXW6m1jg8qY
	 6EgDSupe1cX21I82UoXwMCdFcERCk5suUVxtD36yy7qwhjA3/nYwt76NRahkUlZHNd7As
	 2YB4JXXXqo/K78MHi9N5ATyNtJXkfkBUOUbze9MzoH5JJAlvJI/w1lQSqsFmn04d2AFbD
	 zqq2UrFByTyIp9Gpq2D4dEdJjNY8EgEGwNI8P+5s9RHSitiGBaKg21ZhPRwHpv/cmeWIE
	 GPaGGFbjpzcw2qQlaPfy0b11RMYUCUFs4FsVNtTIrxe+jRKwT0bbG6mBnpoQ2CoIu3Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793109255;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=IMpToc8GUbpePaS/6DB+RjKW/EgdDLHWVJxbsQxIDG0=;
	b=F7ZhIcZ7/w8jbTseNMkxSAd+RELtUhrSHLOIUBi9DBcGfC689wkAEN43DS7a/BTfZPsn
	 UnCx5ZrUCh24sBQGAvNuritPtEPoyohoC+zdIXEwMfkOBkIc/sH3AoxWlCplDRM8AiTpd
	 ucJLuoxjSlO8b6bwYFbq3EzWHdGQe/mwPATdco5xy8DP9/7Wyw3tzmB/t9Vdw15bmH8Cn
	 5YWwst/X/QxXdJBuq7cYyNEyPGby84qj7ZEF6PsCBZIMFOdQedQGZ1THl8nnuARwVMfaY
	 xRnBtxaLePl/Tc3SvvVdZtV2DdjUsVNbyvQNTIH8Ivd6Hn+Qbh/sIGB+i2IgHKu1iQg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="g/a7IWIa";
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DEB7660A6F6C
	for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 13:54:14 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DEB7660A6F6C
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=g/a7IWIa
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4a4d7ae1ae9so23974245e9.1
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 06:54:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793109253; x=1793714053; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=IMpToc8GUbpePaS/6DB+RjKW/EgdDLHWVJxbsQxIDG0=;
        b=g/a7IWIaUlEuSLjlKCX3yHtkNeiiQRYTYC7D+Ng/EVl+KLbalqyl0FWv3PYFslZoTG
         gxcPx5MgXBZ0dLO3ijTzxRBFJbYKZ5tH6xPFppXm3HxeBSKp2IWn5SCmfsITujGEwRys
         7ED1ebhpbyji3P3TwrMKmTM34oZpTtQjaGxz9P0AIoeD84Ey6f8Pjx5EVIw1CxqPmpZU
         ATheQqGg/LdVvlAeGd6R+gR7jC7ZPsU1P/1xYvgk2s3AGyFeHCoMUCPzJXdIzWu5UisU
         PnblmJybqTSP3uR2ERfR6e5AGqsA/G0Yv3fFwtdu2dzENDoOW2+sSD7rCsvx7bR8k+Ii
         GkCA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793109253; x=1793714053;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=IMpToc8GUbpePaS/6DB+RjKW/EgdDLHWVJxbsQxIDG0=;
        b=MLjVRNGxMRw+LmaxwPyFUNYD6iz/b4WETeL8QUMTOu4wdW0CrrltJYLn925JhLvBBE
         /Bii/1ZYvJK0tjoXPX/Vvy+5emS1Tj7/Q8PbSB2/MWYmARWxKq/QyX+wrEO0878JUKqq
         4eI0x6TYGMfiyYrZiVLwBgvQ2pUruKxn8W4LpSqf7DMsN644GqlprQnHsK8BW9SP1jGU
         zw1AjVBL9UZSZbliBgm56+hnBHEHtPQbVJ/t/2SNVM1cHsZ1mdPjAFGjWNxBYbw8zwRz
         +jh9w0cuEsvCGJ/BSL+ixXK+u4vCFFbF6/6dyAQZny+0I69e1Irzeb4I8dqqB0Ax4Clw
         0PCg==
X-Forwarded-Encrypted: i=1; AKwUvBxUkM4XHlqRWrBZvMwnK33TZ73f4zphcdM4+i0IkkoB41VnTTiCUBmXhNM8AUClnRKgna6BuLcEePk=@vger.kernel.org
X-Gm-Message-State: AFq9FYIMHld9qjPi1CraEeO8tKNBitH+fiieQR7OYxsNccv8luTvO+jD
	Zd3LV81AKPDNH02noejOWDBazTtQZpGmDVqXkpn85hcTREBkq0yprn7I
X-Gm-Gg: AYBFou2naMSmWJ3ND5xLI32PAYQY5Tznc1M2YjjuOz94mplHvL7nhjWcim5CNDp+PKG
	39PLgoRtuI/X1zaRT/WgIUXOdb63wc1iPf4XS93fyt+nSCjLIpEYxA01NVpte0qvmiiPVeC8IOW
	bdXg3rFMWbo+0Zg102VOKLOWYaXjieStPMjEB7e04Li95pbWOyvLRxvd709oNGnOkBP/0Fjcl0P
	U4i7dov4XZoGNmSX7Xih42i9hTGElVoj5fmgkaDJhDi8KGcaySt71p31HV5/d8L41E3HajviWqs
	E5M+dgjdVG8D8Sg7RD0vLRyCQGxdH009hLsabGjmMM/XWgx4VwAkN7UVYMSIxTVwXmNiXej2dfp
	NPsyuFR8l98BR6wgORx00bb2t7yDbAl/xG3bfRegwoVG7m5WyWAFjezxZ/HewX+MqiCpyHQ2PT9
	4nvqzrqoqGjmt0ADt7GcUo9Qx3jsAHMyUyF6Wqy20cDlj1GU5ayu1UOaVNOCrmMnPpd6/qTQgZ0
	qkxmrc7XEelf/YgWcASLg9YUkp8dDpEAswuUjsi0VQBD/ZSsGt/rj5noxU1crXc65cDwjirBAPg
	cYF4CMg=
X-Received: by 2002:a05:600c:6219:b0:4a1:de8a:603a with SMTP id 5b1f17b1804b1-4a35ac80a9emr181345205e9.6.1793109253262;
        Tue, 27 Oct 2026 06:54:13 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.117.46.175])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb846sm23128058f8f.25.2026.10.27.06.54.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:54:12 -0700 (PDT)
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
Subject: [PATCH v6 12/15] drm/client: splash: take the background colour from the image source
Date: Tue, 27 Oct 2026 14:53:39 +0100
Message-Id: <20261027135342.2003632-13-maximpedraza@gmail.com>
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

A logo designed for a light background looks wrong framed in black, and
products that share a board support package differ in their colours as
much as in their logos. The background colour belongs with the image,
so a device tree image takes it from the optional "background-color" of
its node. A value that is not one cell of RGB888 is reported and left
out.

CONFIG_DRM_CLIENT_SPLASH_BACKGROUND_COLOR remains the colour wherever
the source says nothing, as with the BGRT, which carries no colour, and
the BMP loaded as firmware.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Màxim Pedraza Padilla <maximpedraza@gmail.com>
---
 drivers/gpu/drm/clients/Kconfig      |  3 ++-
 drivers/gpu/drm/clients/drm_splash.c | 33 +++++++++++++++++++++-------
 2 files changed, 27 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/clients/Kconfig b/drivers/gpu/drm/clients/Kconfig
index 172781bbc2d7..bb5fe5019756 100644
--- a/drivers/gpu/drm/clients/Kconfig
+++ b/drivers/gpu/drm/clients/Kconfig
@@ -104,7 +104,8 @@ config DRM_CLIENT_SPLASH_BACKGROUND_COLOR
 	default 0x000000
 	range 0x000000 0xffffff
 	help
-	  The splash background color, in RGB888 format.
+	  The splash background color, in RGB888 format, unless the image
+	  source has its own: a device tree image can carry its color.
 
 config DRM_CLIENT_SPLASH_SRC_DT
 	bool "Device tree as splash source"
diff --git a/drivers/gpu/drm/clients/drm_splash.c b/drivers/gpu/drm/clients/drm_splash.c
index a50036155763..3f54bec87413 100644
--- a/drivers/gpu/drm/clients/drm_splash.c
+++ b/drivers/gpu/drm/clients/drm_splash.c
@@ -117,6 +117,8 @@ struct drm_splash {
 	s32 off_x, off_y;
 	/* One of DRM_MODE_ROTATE_*: turns the image, not the screen */
 	unsigned int rotation;
+	/* RGB888, from the image source or the kernel's default */
+	u32 bg_color;
 };
 
 static struct drm_splash *client_to_drm_splash(struct drm_client_dev *client)
@@ -272,12 +274,23 @@ static void drm_splash_dt_pair(struct drm_splash *splash,
 	*y = val[1];
 }
 
-/* The optional placement properties of the node, read once */
-static void drm_splash_dt_placement(struct drm_splash *splash,
-				    struct device_node *np)
+/* The optional properties of the node, read once */
+static void drm_splash_dt_props(struct drm_splash *splash,
+				struct device_node *np)
 {
 	u32 val;
 
+	/* The colour travels with the image; a bad one is reported */
+	if (of_property_present(np, "background-color")) {
+		if (of_property_count_u32_elems(np, "background-color") != 1 ||
+		    of_property_read_u32(np, "background-color", &val) ||
+		    val > 0xffffff)
+			drm_warn(splash->client.dev, "splash: %pOF: invalid %s\n",
+				 np, "background-color");
+		else
+			splash->bg_color = val;
+	}
+
 	drm_splash_dt_pair(splash, np, "logo-position", -1, 65535,
 			   &splash->pos_x, &splash->pos_y);
 	drm_splash_dt_pair(splash, np, "logo-offset", -65535, 65535,
@@ -375,8 +388,8 @@ static bool drm_splash_dt_open(struct drm_splash *splash)
 	return false;
 }
 
-static void drm_splash_dt_placement(struct drm_splash *splash,
-				    struct device_node *np)
+static void drm_splash_dt_props(struct drm_splash *splash,
+				struct device_node *np)
 {
 }
 
@@ -802,13 +815,17 @@ static int drm_splash_image_load(struct drm_splash *splash, const u8 **img_data,
  */
 static enum drm_splash_source drm_splash_pick_source(struct drm_splash *splash)
 {
+	/* Unless the source says otherwise, the kernel's default colour */
+	splash->bg_color = CONFIG_DRM_CLIENT_SPLASH_BACKGROUND_COLOR;
+
 	if (drm_splash_dt_open(splash)) {
-		drm_splash_dt_placement(splash, splash->dt_np);
+		drm_splash_dt_props(splash, splash->dt_np);
 		return DRM_SPLASH_SRC_DT;
 	}
 
 	if (drm_splash_bgrt_available(splash))
 		return DRM_SPLASH_SRC_BGRT;
+
 	if (IS_ENABLED(CONFIG_DRM_CLIENT_SPLASH_SRC_BMP))
 		return DRM_SPLASH_SRC_BMP;
 
@@ -875,8 +892,8 @@ static void drm_splash_work(struct work_struct *work)
 			continue;
 
 		if (!scanout->bg_drawn) {
-			u32 rgb = CONFIG_DRM_CLIENT_SPLASH_BACKGROUND_COLOR;
-			u32 color = drm_draw_color_from_xrgb8888(rgb, scanout->format);
+			u32 color = drm_draw_color_from_xrgb8888(splash->bg_color,
+								 scanout->format);
 
 			/* Only success marks it done: a later pass retries */
 			ret = drm_splash_fill_solid_color(scanout->buffer, color);
-- 
2.39.5

