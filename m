Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794784937;
	b=L0Nbyeh5EO532D6y3nxQK4jNbdT8tL2xT9RVUtKDepmFCeen5WDoR7woXft6fxQPWUCS
	 7lWqmdM/+nz+7vRf9JNGICKzvwv6vadNiIF9TPPT7IFBu8MXprVjN5LwzffEWGgib+wcg
	 MrUq58nBkilP6NlTkWZ7abs3ZzpkfU13+kUCq/enSEPAWwz4em5kDwhHTXmArHgXCSoNd
	 Hn8IXBU6jII2GemnvOAMHi/cHWnatO1E962lYuPJHX38e5FsIiOMfk4DHTT1qf8TodsOo
	 gIpk97KlNrCOPp9KrKXpYxmq6YacNMvLj8VMpjoU23iyjbz1ceSNwWbSf2NkSOW5k0Q==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794784937;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=Erdyei72788KVv8pLaqul7iSgCQZTDqlNCfVWoF2cUc=;
	b=DHwXeu1AXc3KBU5do+ujqyq8qcfnmfPLScgAiKQ+5wM7ChxAmgUeEeDOFqCByWyl7N3J
	 eX1Q8v0dVtmGaZ/tOcLbu0EfnW56FRsSrlaWEsr37u8i/ZPffOgeRoCrkHjBU8VDN5xtK
	 ZbOmzRraPQQJoOUw9i+C8OVvo0V/A5ZhGYWGVK4P4+U9lTvpdFpgE2VjO3eA7Vf7ums1z
	 p/dDLLE8hnAT0LJiTY0JOVS8LyedbKnFnamf6cqYcGD54l9Vig5wX3WohDxmD26Gg3DDC
	 h2xFZYr/hQ6XYUWo8keQqFZFlwTp/Pa0O/L02ZfWUAtn6mHyN4G6dv+ic3x3ItiXxqw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LopHEaxb;
	arc=none smtp.remote-ip=209.85.128.47
Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8EB14606A88F
	for <linux-doc@vger.kernel.org>; Sun, 15 Nov 2026 23:22:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8EB14606A88F
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LopHEaxb
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4bb70074ab2so3653365e9.0
        for <linux-doc@vger.kernel.org>; Sun, 15 Nov 2026 15:22:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794784935; x=1795389735; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Erdyei72788KVv8pLaqul7iSgCQZTDqlNCfVWoF2cUc=;
        b=LopHEaxbU8qluG0bNr0X7YSDk+c0OsgMfGYigZ//YqyCiIDFOvvTCgvq4FYIvzWR5L
         2WxbabMKUv2GXxZwVT777BbykE9Pt73WrQ3c8jH0H6c+Yk/nSQLHK/ROeiv3Tw72dKXm
         8LOi/aISgXUGLQTrQ+bZsiW+vtc3Hlkwm+8czErJfQgaIxkrhqXzLcNubNchYhvq9ORX
         7d32GFh8QvbGh3Tp662n1q2rwQFnjBYjEYczFxotThVDzUblLAEP6ycMVbZ8UwQTCNZ5
         xI2aLRfs9lVYfboicZmB1tcl1R+v80EYEwjVpU7PH63NTXJXLv7CFu1m6U9UeZmjcqNe
         gZsQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794784935; x=1795389735;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Erdyei72788KVv8pLaqul7iSgCQZTDqlNCfVWoF2cUc=;
        b=Cc56fmzYlfflSz6sSb47V4mJekyJKhygkxfFg2iU1V4aIovvbZkHGBQxFa6/XIgaiR
         8Mta87Lk7GpmasP6FwF25NT3F4g9be1s6R2ddkIXI47aO4xLzSyHF6Z6s/wC7/MmcHpR
         wLqWKOR00NZ40XJEzrHsAM0zAJ+ySzkc/fhpSqz3maMl7cAaL5tE1lxmpjF95vmNTMNc
         UXrjmTN4EpyyttVGhyPDrL/GgeQyotj+xxpXb5PHSOIO2e6NicKSTryfnoHftKeScFSR
         0dF3/UwRRGe4NsPbr6wle25P9IEJBYzRnjEo0n1gp6CV4vnu6EkV7e6rDaLsWRaiHSoQ
         qZYg==
X-Forwarded-Encrypted: i=1; AL+hErGTaJCm+XsTqy4B/GCrSexQIN8sAa+htjUafNEOFZcQNQxEbws3Afp8BDFHF62JTEnH5R5SM97AuXs=@vger.kernel.org
X-Gm-Message-State: APuU4Z9zUo4yyLyvEHkqwDpoPi4SK29DEPxCN570ZpYsqFOpDaK8/ye8
	2zUfvQgOeBGPk/ZSGwxZV2d7FgO7k1bCulBdQuEJ5xkfNKqHDRkSoCbu
X-Gm-Gg: AYBFou0qCgy7MIUqmrrsgh0nqyHtUKyfkE77fzFHEFFsLlQ9ltSLmYq4i1r/iKV27oJ
	SkQwOy1IOWMd1uoyLpC/xVAaf9wO7MjdGAzCiW+MisGQYO3jnQZrGBN7i7kvZoiB2gIufp3iZMC
	qCpwnoMO76Kpy3Ad4GKU06NNb6rn3y+aSfZJl6humGBiZA5+/te3w3IBC3OVNQ0W0AnMzbeABxy
	UR5uySAMHWetWyGmO968PRguZ49Oxv8JqzDxnpiRzkmFXyeNXV+voLsIlFOCgbQMuznMfg8XBIZ
	KFqjvl0V3Ml0k7w6+yKHF64aVrCBPlk0aysr5URb8MypTcLRvO3u1/95isWXRqlRT1y1CEvtt0s
	Eu29q7Nhja8Qp2e6vYkZ2YIPUIFHkHu+9f7pYw0u6J4/bmy7HXeFm/jqnkyY+f+Hk6AQBwR1Exj
	twYjJwv3OTMkoQzA4XDEJMDBxnQirY40a8D5GXH767e7Hxqy3lDhyn2fuSuwIW4pgo+gUugJHrm
	0jY+PsOg30EUjXHJRYGkMka0imWNQJMuRDGsT7L2hlz8+NvD/wN0T8x+qjy1Fh/CyO37IzbOUhw
	8vjmeAHWGAokPwXqKnpJn+yZQgj6EwaltRzEAumFIlSyPBwxo6NhVHg=
X-Received: by 2002:a05:600c:3509:b0:4a1:dbdf:17a8 with SMTP id 5b1f17b1804b1-4bb559f2cc3mr183275325e9.2.1794784934909;
        Sun, 15 Nov 2026 15:22:14 -0800 (PST)
Received: from ingenieria31.oficinasStQ.local ([79.117.0.220])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb571f976esm127920955e9.3.2026.11.15.15.22.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 15 Nov 2026 15:22:14 -0800 (PST)
From: =?UTF-8?q?M=C3=A0xim=20Pedraza=20Padilla?= <maximpedraza@gmail.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
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
	linux-efi@vger.kernel.org,
	linux-fbdev@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-embedded@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 6/6] drm/client: splash: pick the image source in one place
Date: Mon, 16 Nov 2026 01:21:56 +0100
Message-Id: <20261116002156.1027726-7-maximpedraza@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261116002156.1027726-1-maximpedraza@gmail.com>
References: <20261116002156.1027726-1-maximpedraza@gmail.com>
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

The client chooses between two sources with a boolean: the BGRT if the
firmware left one, otherwise the BMP loaded as firmware. A third one is
coming, and with it an order of preference that a boolean cannot hold.

Name the source in use with an enum, picked once by
drm_splash_pick_source(), and have drm_splash_image_load() switch on
it. No functional change.

v7:
- DRM_SPLASH_SRC_FW for DRM_SPLASH_SRC_BMP: the BGRT is a BMP too

Suggested-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Màxim Pedraza Padilla <maximpedraza@gmail.com>
---
 drivers/gpu/drm/clients/drm_splash.c | 46 ++++++++++++++++++++++------
 1 file changed, 37 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/clients/drm_splash.c b/drivers/gpu/drm/clients/drm_splash.c
index d54cf628cf17..fbbdc034e417 100644
--- a/drivers/gpu/drm/clients/drm_splash.c
+++ b/drivers/gpu/drm/clients/drm_splash.c
@@ -39,6 +39,16 @@
  * a static image.
  */
 
+/*
+ * Where the image comes from. drm_splash_pick_source() sets the order of
+ * preference; NONE is zero, so that a new splash starts without a source.
+ */
+enum drm_splash_source {
+	DRM_SPLASH_SRC_NONE,
+	DRM_SPLASH_SRC_BGRT,
+	DRM_SPLASH_SRC_FW,
+};
+
 struct drm_splash_scanout {
 	int id;
 	/* Modesets scanning this buffer out, by position in the list */
@@ -91,7 +101,7 @@ struct drm_splash {
 	const struct firmware *fw;
 	void *map_data;
 
-	bool use_bgrt;
+	enum drm_splash_source src;
 };
 
 static struct drm_splash *client_to_drm_splash(struct drm_client_dev *client)
@@ -439,7 +449,7 @@ static int drm_splash_bmp_to_scanout(struct drm_splash *splash,
 		return -EINVAL;
 	}
 
-	if (splash->use_bgrt) {
+	if (splash->src == DRM_SPLASH_SRC_BGRT) {
 		x_pad = efi_bgrt_image_offset_x();
 		y_pad = efi_bgrt_image_offset_y();
 
@@ -509,13 +519,31 @@ static int drm_splash_bmp_to_scanout(struct drm_splash *splash,
 static int drm_splash_image_load(struct drm_splash *splash, const u8 **img_data,
 				 size_t *img_data_len)
 {
-	if (splash->use_bgrt)
+	switch (splash->src) {
+	case DRM_SPLASH_SRC_BGRT:
 		return drm_splash_bgrt_load(splash, img_data, img_data_len);
+	case DRM_SPLASH_SRC_FW:
+		return drm_splash_fw_load(splash, img_data, img_data_len);
+	case DRM_SPLASH_SRC_NONE:
+		break;
+	}
 
-	if (!IS_ENABLED(CONFIG_DRM_CLIENT_SPLASH_SRC_FW))
-		return -ENOENT;
+	return -ENOENT;
+}
+
+/*
+ * Pick the one source the image will come from: the BGRT is whatever the
+ * firmware shows, and the BMP loaded as firmware is the fallback. With
+ * neither, only the background colour is drawn.
+ */
+static enum drm_splash_source drm_splash_pick_source(struct drm_splash *splash)
+{
+	if (drm_splash_bgrt_available(splash))
+		return DRM_SPLASH_SRC_BGRT;
+	if (IS_ENABLED(CONFIG_DRM_CLIENT_SPLASH_SRC_FW))
+		return DRM_SPLASH_SRC_FW;
 
-	return drm_splash_fw_load(splash, img_data, img_data_len);
+	return DRM_SPLASH_SRC_NONE;
 }
 
 /* At unregister, once nothing else can use the image */
@@ -858,10 +886,10 @@ static void drm_splash_rebuild(struct drm_splash *splash)
 
 	if (!splash->source_picked) {
 		splash->source_picked = true;
-		splash->use_bgrt = drm_splash_bgrt_available(splash);
+		splash->src = drm_splash_pick_source(splash);
 
-		/* If no other image has been loaded, try to load a BMP as firmware */
-		if (IS_ENABLED(CONFIG_DRM_CLIENT_SPLASH_SRC_FW) && !splash->use_bgrt) {
+		/* The BMP loaded as firmware is the only source that arrives later */
+		if (splash->src == DRM_SPLASH_SRC_FW) {
 			ret = drm_splash_fw_request(splash);
 			splash->fw_requested = !ret;
 			if (ret)
-- 
2.39.5

