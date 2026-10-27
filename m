Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793109261;
	b=F2uL2p98O7tNEV4m+1AUbf2WoamHhzge3ZJqSVhNJh0MGJovNp6IZH3fAAj73D/K64E7
	 DEJOnPbXiEX7Kp9mWeHCFuPVjRewEi2jeCrM/dcMpr8jpYIIg0SekDK8TDgH3bBVno7d9
	 OZtlkB050Xjp7fX/jaxY2OnwzCemlbZrsm1jPK4cAJI+Zbsoi5+oKSEmXwcmeOLhBhJ6C
	 sXayQoM3/pydpiIFKzi1eYEEZ2xm6Cr+oV4Z8ODpo8E38xvLwRtQF2HtENNkP7/3Tv5L3
	 mrxJGiNfNWHeG9UDd2BiC2I32/s4u+hsacmpdgPn35LdIG3Eba2E3mf5a/8f3CFIBgw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793109261;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=kjJRYbm0P/rhDwIhbhLgzvyBgDKoIc1GRXvwAOHpom0=;
	b=Fb7W1apkJb58WpzP1J+QJyKB+Js+pWRbwIVZ0jDB6Q3Deya/52UvP4HLFxlbu3TRKd8P
	 icw/kem+3wx3wxTqPYlCCxDhWlqrDiKeindpGAgMUU1Q/Vwo8fW3iQAWKjwdqep1N1An/
	 n1vaV2H6j4+2JjjfSpU0aT6/bxL39mKK97xN2e3tA3wPeKrY6K6OTB8W82iIDZcIJ4kfB
	 U/OQglg42OLfSRU8NqQEu8THQQk04bR0uYjUYvWSfbx9RhOs9EcYllZDSW97uNR1FjkyO
	 5opnv1+13Wm2fqVudQZH/4/eqt6FMqnm80ZCTDDhWaekTDXcvS/eXBk/q6w08P9YOCw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=P3w7lGMW;
	arc=none smtp.remote-ip=209.85.128.49
Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 32E9F60A5BEA
	for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 13:54:21 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 32E9F60A5BEA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=P3w7lGMW
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4a59100fa83so20576555e9.0
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 06:54:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793109259; x=1793714059; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=kjJRYbm0P/rhDwIhbhLgzvyBgDKoIc1GRXvwAOHpom0=;
        b=P3w7lGMWrm/8OwI+EFRo+LtsmUsB2SN1nnn74Ut+PUJPGP9FMEjttwA0p+LxBt/GHN
         A81VrZ1UuG+qe6c0T7Ialjis4eXoAVURYnyzUjhimOgyIcAWy06aA8hv1AGP+Hequnmf
         CJwgUV+12INPJak4+ZVVTe7vC7MSGgxgIr8cYWJU31TnibDdVRAZJijoeG503sqQ66EL
         cLCXFkX2Q1W7KmwL0ERUVHGphXKqpabe+0UGiSHoDeO63Q/9oPSZumuH5oMclDcquPBz
         DflAnr70mfqM4X4vAyVJwi5AawBP6BQiTExUMhthU5aMR9G2eHnMQQRCMncQUM0Of/CB
         xPxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793109260; x=1793714060;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=kjJRYbm0P/rhDwIhbhLgzvyBgDKoIc1GRXvwAOHpom0=;
        b=EtiND1xTArugXf2pHDOALRc6D55dF/kmL2oX8FCt7ZvMulWxVst1/CTHinabuoMGbW
         h7PSoCQ4cJvqjEgRfRP1u/6DGKNmdlV0JJXL/VECNW9HeDECyLEdlR1RarJ2pH890Qn+
         T6SlHGqdwZYMTpSWguIX2Ia35il0IhtBU4AoEFOfdmvTE3t2WLKvmKHpaKxh4PPyuigr
         dpsYd+ey5sz7QavltFdmY2rJ6BVAzUmY3xkjuPyI7ibgZ+MxsSzUNYgcFQ/8UqJ2hUT+
         mZSIYlhDK94yqSYUIoqxOQmhU4Xl8Fgqy3Ypd5c5Bv1ZNiFachfroU3vaV+UgYfTa0F2
         RgIQ==
X-Forwarded-Encrypted: i=1; AKwUvByzh/igL3Rb3xGsdR8zUDQZo7u/XjDoZ3Renp5e4PMSyPsYsfTQPrfeZ5sIraBkXaNiZyA0phVxGK4=@vger.kernel.org
X-Gm-Message-State: AFq9FYL20wpYPPF6o90YfMcfIJL0FaS4dNpVDfyu93nLYNnR82tQL60X
	ljbU+T44VAjzuEJubjGgI6HjM4UeyVsvZlkmRXtJfQkzorfs9fm6v7Oi
X-Gm-Gg: AYBFou3U+UEdE9dqWRwSETNInypZlR/GBTnOOx6Q0bNO/IHrp+wARfehF/9v/yOgLVN
	2iatD7nSy42fg7V0hH+By8eKdAdPWxlbQYOGTZOvI1X0Z6Sq7+OFqm+s1zlt63OPMBmrwMIZcXX
	qDAeOgbc88/nD0Wv99Ia7rvelN537D+8+C0mZ9LzbnYa4whItllNV9YYsBsYnLvk7m/758j/QE3
	pZRqFXunbOxxUO/Afzi9ZbG+QAASGIhFsSWccJZaq075lvApDIBMuq2lj6gIbmXu4Sr5Xu0XR2r
	sTk3VZuf6ColxZ6SEmVF/RtrDyMUxV8d6ZKix8K2PkJb5V57UOkqcGpaQoZZvz32ROeg/EUf39h
	O7eLHBEBJQE6bl7jR+ydMtSIgEsI/lRY0oF7SsdMiRKeATwp0WzOlmfPmDem9eKcOM25FkVh8WT
	wgDxOoO8VgEYz/zjSN0AxSuAR0j8Qu/FQWbMPnUTlVEmQFh35CGPcSLl4Ev5G7wuQ4jS34Oc7VP
	dpDG09HBZNqib0dtKhxPDrg85KBIghi9O/ATb9LyTOtK8XXL6uXuepNhxp9qGL175YtebDi1RIJ
	8PZHMoA=
X-Received: by 2002:a05:600c:620f:b0:4a1:9078:911 with SMTP id 5b1f17b1804b1-4a35acc731dmr180025295e9.31.1793109259383;
        Tue, 27 Oct 2026 06:54:19 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.117.46.175])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb846sm23128058f8f.25.2026.10.27.06.54.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:54:19 -0700 (PDT)
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
Subject: [PATCH v6 15/15] drm/client: splash: document the image sources
Date: Tue, 27 Oct 2026 14:53:42 +0100
Message-Id: <20261027135342.2003632-16-maximpedraza@gmail.com>
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

The overview only said that the client draws a colour or an image. By
now the image can come from three places in a set order, and be placed
and turned. Write it down: the sources and their order, the image
format, placement and rotation, and the background.

Also note that the splash rules out fbdev emulation on the same device,
and that a bootloader that loads no image into a reserved region has to
disable or remove the node, since the region can keep the previous
image across a reset and even a short power cycle.

Pull the overview into Documentation/gpu/drm-client.rst, which covers
the in-kernel clients, so that it is published.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Màxim Pedraza Padilla <maximpedraza@gmail.com>
---
 Documentation/gpu/drm-client.rst     |  6 +++
 drivers/gpu/drm/clients/drm_splash.c | 61 +++++++++++++++++++++++++++-
 2 files changed, 66 insertions(+), 1 deletion(-)

diff --git a/Documentation/gpu/drm-client.rst b/Documentation/gpu/drm-client.rst
index cbcfe30de777..a58d6440d9f2 100644
--- a/Documentation/gpu/drm-client.rst
+++ b/Documentation/gpu/drm-client.rst
@@ -16,3 +16,9 @@ Kernel clients
 
 .. kernel-doc:: drivers/gpu/drm/drm_client_event.c
    :export:
+
+Splash client
+=============
+
+.. kernel-doc:: drivers/gpu/drm/clients/drm_splash.c
+   :doc: overview
diff --git a/drivers/gpu/drm/clients/drm_splash.c b/drivers/gpu/drm/clients/drm_splash.c
index d3ed53cde0f5..0fc72a3fe989 100644
--- a/drivers/gpu/drm/clients/drm_splash.c
+++ b/drivers/gpu/drm/clients/drm_splash.c
@@ -40,7 +40,66 @@
  * DOC: overview
  *
  * This is a simple graphic bootsplash, able to display either a plain color or
- * a static image.
+ * a static image. It draws once the display driver has registered, and again
+ * on every hotplug, on the outputs there are then, until userspace takes the
+ * display over; when userspace lets it go, the splash is shown again.
+ *
+ * It is selected with ``drm_client_lib.active=splash`` or
+ * CONFIG_DRM_CLIENT_DEFAULT_SPLASH. A device has a single in-kernel client, so
+ * with the splash there is no fbdev emulation: no ``/dev/fb0`` and no
+ * framebuffer console.
+ *
+ * Image sources
+ * -------------
+ *
+ * The image is a BMP with a BITMAPINFOHEADER, or its V4 or V5 extension,
+ * 24 bits per pixel and no compression. It comes from the first of these that
+ * is present, each built in with its CONFIG_DRM_CLIENT_SPLASH_SRC_* option; if
+ * that one then fails to load, only the background is drawn:
+ *
+ * 1. a node compatible with "boot-logo" under ``/chosen`` in the device tree,
+ *    carrying the BMP itself or pointing at a reserved memory region the
+ *    bootloader loaded it into, if that region can be mapped (see
+ *    Documentation/devicetree/bindings/display/boot-logo.yaml);
+ * 2. the EFI BGRT, the image the firmware showed;
+ * 3. the BMP named by CONFIG_DRM_CLIENT_SPLASH_BMP_NAME, ``drm_splash.bmp`` by
+ *    default, loaded as firmware, for instance built into the kernel with
+ *    CONFIG_EXTRA_FIRMWARE.
+ *
+ * With none of them, only the background is drawn.
+ *
+ * A reserved memory region keeps its contents across a reset, and may even
+ * across a short power cycle, and the kernel cannot tell a stale image from a
+ * fresh one: a bootloader that loads no image there disables the node, or
+ * removes it.
+ *
+ * Placement
+ * ---------
+ *
+ * Everything is given as the screen is seen: once turned as its connector
+ * needs, for a panel mounted turned (the panel's orientation) or as asked
+ * with video=...,rotate=. The plane turns it in hardware when it can, and the
+ * splash turns its buffer in software otherwise, as fbdev does with the
+ * console. A panel mounted turned is described on the panel, not here.
+ *
+ * The image is placed at a position in pixels, where -1 centres it on that
+ * axis, and an offset is added afterwards; the result is clamped so that the
+ * whole image stays on screen. A rotation of 90, 180 or 270 degrees counter
+ * clockwise turns the image and not the screen: position and offset stay in
+ * the same pixels, and a quarter turn only swaps how much room the image
+ * takes up.
+ *
+ * A device tree image is placed and turned as its node says, and any other
+ * image is centred and upright. A BGRT image is the exception to the above: it
+ * is drawn at the table offsets on the screen the firmware drew it on,
+ * unturned but for the table's orientation bits.
+ *
+ * Background
+ * ----------
+ *
+ * The rest of the screen is filled with the node's "background-color" for a
+ * device tree image, and with CONFIG_DRM_CLIENT_SPLASH_BACKGROUND_COLOR
+ * otherwise.
  */
 
 /*
-- 
2.39.5

