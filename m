Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793109244;
	b=TR5nkLRdcuJC+LcQMqpF+E0GTDiF76/bUEdSdybXhqwAPAK6lQFuXs72NOu5U2URSGIp
	 EnvIDpv/WDaif71oPZarXY7Pm2eiwVRQu7dai6MgBKEpJhG/uUopoKKtFumm3y9URf8UN
	 ukjoVuSGLB/E2Uc/DDYFmudEdRjRHaq2d0fT82RuTYwW+RK8seGJ2w7czZta16evKEhIt
	 xCzWMyQlupf6gPrbbny/CEHnRiiOrxrE+P8lMxJxXcbCJiFFyKwRpE9TrSkYhdgIxM5YG
	 kBgwLGd3bSrz+3MBdQe/klMvrVwtY+O3b2Vd0qd1jv8ujDSnuwOEzYl3RWJbn42iBmg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793109244;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=CNwiH8WXKlzRpf9XA93ERiKn3IeKgsDSdg+szp0134I=;
	b=yt5328b9vVDiF48CdFTLkdz+19yK3+CHW1WbUG02nsuiAaOl4wQg1P53t34PF4L4jGFl
	 jmU98wNAoYDandviv9xKACzN54UnV5EQQWaI2GjxD2ClSwSfY6hOyLx4+mOdfX/NvtV0A
	 uHbXzIi0BYcyPp7fNGNP9l7yZgBYcF3f6QgWi9MaQ1CyX9iAPC4bs7I9lMON9uP67Bo3X
	 jWZjkbfDBC52slo7rP6GPO1PIPk3qG0vZou3A2hGtHgl4GTfMMhTBLVBjXb3aQyEHHT/X
	 dtaxEFQa2pT1MER6XSKMQI5IoRMAlKnM/LS3QuplbM0dMmUsDbB23/NHnAfdLXy3MRg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fj4wjdw0;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DE56860A2617
	for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 13:54:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org DE56860A2617
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=fj4wjdw0
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48afbd2c386so2552366f8f.3
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 06:54:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1793109242; x=1793714042; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=CNwiH8WXKlzRpf9XA93ERiKn3IeKgsDSdg+szp0134I=;
        b=fj4wjdw0D3xlsVKH89Axah6M1qST+GP/oHhvyXcuwD6enLr+rUKo2loUa8YsrcI0R7
         wXT1e3nmLGw/mBrIq7Q4WzEGXqzaHDgmr98+K+ECoFxnYZYOEfSm/pz5X5n0PuBHU3ao
         BK7B1QZPO6DDZVd0h8KKTDh13A0X2+sJKWZKGb07oSaQlTI+xhDefU+4S644vpB45WLd
         L75VURnLN9vNsKLqr/+LrMNFsZUpW3plvCZM/vBOR+r+Aj6SGHhrLDG6QK09xgfHzliV
         JXjUlSFRJ1v12/LgnfZfbt7YN803n7kHe+OwlhLCN3jI6YbDThgrHE+tLciU1lXcgtKz
         PDPg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793109242; x=1793714042;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=CNwiH8WXKlzRpf9XA93ERiKn3IeKgsDSdg+szp0134I=;
        b=MXV5YSkwqIG2GXk9Ca5o9vfJfnfprG6ztrdIsLxUj7MAQ6fuG0AbW4t2Z61oDlC3nF
         uWiooumjkRoMLYUXjJ0+3oBvL3MImNeL2dZIPWcxi6hAMzlP3F/05AsNCvBKkVvD8/ou
         WBsOQOW+74cwYRaVEubqG3BDIbnKX03dHMycGawGByyWaypVmB9TIaDYpbEDsySM7wk9
         Swd7qst3BZvBs6wsjk3Rte5xS6QYxOO2L7KLzjwC8082lcJlVju8InaD1Sybi8cJ4DYr
         2UPzxyATPPanoS64eVSTm2/Waz6v18aNKU3Vy3TAppi7ylGxQ89azKK5U0Fo8m1Fcnrr
         JayQ==
X-Forwarded-Encrypted: i=1; AKwUvBw9Bw/e5nhV/++D9Dsf8kVKx8pVomFb0NwY2nutCRlXRuxseJmR9juAUxRJWwUjF9cNKsIipiSy9LI=@vger.kernel.org
X-Gm-Message-State: AFq9FYIVZlyuYvICVmGSfei8+uvccuYXROtGDZKKfgW/i0X1qwgbGfoi
	R0xPrJOOjRfs5+l1Lo/Agw+3xO0G6zSTqQaVKt76yehCgUfv9SAujRfA
X-Gm-Gg: AYBFou3sOykNLK/e0kmKUHAXGZN0dm9cvvz3o+AHxW60c/HLDDdHc9lAkvuS4ty6BbB
	yQXxxCAsTcCAbqLaa3b8h3Ds2UEG5uvjsJmE/C2JPJY6XALFCe68hECAEYx8ORzJjDC2tCrPPII
	EJS5YxM1lwuJtRNzIKuNS5sukfZgZWLEIwpdAmIEnfyEYyPlqCq45M0PPZDAuQ9Pvi8PzfJ3OI8
	QH1f0K/yVnSrmIQl6/VYVQvPjxzU67cCvOz1a7PLSgT9vPoXqGiIl++LqBPobQP+PXJ0Fltanky
	2Z5DZQAziZSkdFnIU937KCGy0ICsVR7CQ2WP2SuVxvLCJoTfIHrrLsUkGdle90x0jx8gdSBJXOU
	AAEphU5o4rKw473f8MvHCelxREG/I8RTb4qksk7/WJw3ZVE0usvZv4HoKc+jJ2p6/clOrgW8RCE
	j3YetzsHkHzayoiPB9tNt7EJenAr8rCRSWM0KXdGiWBV9b2REB3Z/pHDos6MR7cPL1WruyxF/Zj
	fwMsD1aIlNW7ZngkgIwvWgQgCIbaxN7ZHeDwm4plh+1Jzjq0HJf4QnaNzTmqnqPxDCh83iW7AOx
	qJqJGqo=
X-Received: by 2002:a05:6000:29d5:b0:48e:3d35:a18a with SMTP id ffacd0b85a97d-48e3eb98289mr9620502f8f.49.1793109242138;
        Tue, 27 Oct 2026 06:54:02 -0700 (PDT)
Received: from ingenieria31.oficinasStQ.local ([79.117.46.175])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ebcb846sm23128058f8f.25.2026.10.27.06.54.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 27 Oct 2026 06:54:01 -0700 (PDT)
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
Subject: [PATCH v6 07/15] dt-bindings: display: add a boot logo node under /chosen
Date: Tue, 27 Oct 2026 14:53:34 +0100
Message-Id: <20261027135342.2003632-8-maximpedraza@gmail.com>
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

Products built on the same board often differ only in branding. On UEFI
systems the firmware hands the operating system its boot logo through
the ACPI BGRT; a device tree system has no such table, so today the logo
is built into the kernel, and each product needs its own kernel image.
With U-Boot's Falcon mode the device tree is the only thing that reaches
the kernel, so it is also the only place the logo can come from.

Add a "logo" node, compatible "boot-logo", under /chosen. It lives
there because a logo is configuration handed over by firmware rather
than a description of the hardware, as simple-framebuffer nodes already
are.

The image is a BMP with 24 bits per pixel and no compression, the
format of the BGRT image, so that one file serves the firmware splash,
a BMP loaded as firmware and this node alike. It is carried either in
a "logo-image" property, which dtc fills in from the file with /incbin/,
or in a reserved memory region the bootloader loaded it into, named by
"memory-region". Exactly one of the two must be present.

"logo-position" takes -1 on an axis to mean centre on that axis, which
is the only way to say it when the device tree does not know the image
size, and "logo-offset" is added afterwards. "rotation" is the one of
panel-common.yaml, degrees counter clockwise, but turns the image rather
than the screen, so position and offset stay in screen pixels. The
optional "background-color" goes with the image, since a logo designed
for one background looks wrong on another.

Assisted-by: Claude:claude-opus-5-5
Signed-off-by: Màxim Pedraza Padilla <maximpedraza@gmail.com>
---
 .../bindings/display/boot-logo.yaml           | 156 ++++++++++++++++++
 MAINTAINERS                                   |   1 +
 2 files changed, 157 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/display/boot-logo.yaml

diff --git a/Documentation/devicetree/bindings/display/boot-logo.yaml b/Documentation/devicetree/bindings/display/boot-logo.yaml
new file mode 100644
index 000000000000..9cd4b2565112
--- /dev/null
+++ b/Documentation/devicetree/bindings/display/boot-logo.yaml
@@ -0,0 +1,156 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/display/boot-logo.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Boot logo supplied by the device tree
+
+maintainers:
+  - Francesco Valla <francesco@valla.it>
+  - Màxim Pedraza Padilla <maximpedraza@gmail.com>
+
+description: |
+  An image for the operating system to show on the display while it boots,
+  handed over by the firmware together with where and how to show it.
+
+  Products built on the same board often differ only in branding. Carrying
+  the logo in the device tree lets a single kernel image serve all of them,
+  each booting with its own device tree, and it works where the device tree
+  is the only thing that reaches the kernel, as with U-Boot's Falcon mode.
+  It plays the part the ACPI BGRT plays on UEFI systems.
+
+  Since a logo is configuration rather than a description of the hardware,
+  the node lives under /chosen, next to the other things firmware hands to
+  the operating system.
+
+  The image is a BMP file with a 40 byte BITMAPINFOHEADER, 24 bits per pixel
+  and no compression, the format of the BGRT image. It is carried either in
+  the node itself or in a reserved memory region the bootloader loaded it
+  into, never both.
+
+allOf:
+  - $ref: panel/panel-common.yaml#
+
+properties:
+  $nodename:
+    const: logo
+
+  compatible:
+    const: boot-logo
+
+  logo-image:
+    $ref: /schemas/types.yaml#/definitions/uint8-array
+    description:
+      The BMP file itself, byte for byte, which dtc can fill in from the file
+      with /incbin/. The device tree stays in memory for as long as the
+      system runs, and some architectures limit its size (arm64 to 2 MB), so
+      this is meant for small images; at three bytes per pixel, larger ones
+      belong in a reserved memory region.
+
+  memory-region:
+    maxItems: 1
+    description: |
+      Reserved memory region the bootloader loaded the BMP file into, starting
+      at the beginning of the region. The BMP header says how much of the
+      region is image.
+
+      This keeps the image out of the device tree, so that it can be changed
+      without rebuilding the device tree, for instance by loading it from a
+      partition of its own that userspace can update.
+
+      Memory keeps its contents across a reset, and may even across a short
+      power cycle, and the operating system cannot tell a stale image from a
+      fresh one. A bootloader that loads no image into the region therefore
+      disables the node (status = "disabled") or removes it.
+
+  logo-position:
+    $ref: /schemas/types.yaml#/definitions/int32-array
+    description:
+      X and Y coordinates, in screen pixels, of the top left corner of the
+      image once it has been rotated. A value of -1 on an axis centres the
+      image on that axis instead, which is the only way to say it when the
+      device tree does not know the image size, as with a memory region.
+      Defaults to centring on both axes.
+    default: [-1, -1]
+    items:
+      - description: X coordinate, or -1 to centre horizontally
+        minimum: -1
+        maximum: 65535
+      - description: Y coordinate, or -1 to centre vertically
+        minimum: -1
+        maximum: 65535
+
+  logo-offset:
+    $ref: /schemas/types.yaml#/definitions/int32-array
+    description:
+      X and Y displacement, in screen pixels, applied after the image has been
+      placed. Mostly useful together with a centred axis, to land the image
+      somewhere other than the middle of a panel whose visible area is not
+      the middle of the mode. Defaults to no displacement.
+    default: [0, 0]
+    items:
+      - description: X displacement
+        minimum: -65535
+        maximum: 65535
+      - description: Y displacement
+        minimum: -65535
+        maximum: 65535
+
+  rotation:
+    description:
+      Rotation applied to the image as the screen is seen, in degrees counter
+      clockwise, as for the rotation property of panels. It turns the image
+      and not the screen; a panel mounted turned is described by its own
+      rotation property, which is made up for first, so this means the same
+      whichever way the panel is mounted. A quarter turn swaps how much room
+      the image takes up, but logo-position and logo-offset stay in pixels of
+      the screen as seen either way. Defaults to 0.
+
+  background-color:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      Colour of the rest of the screen, as 0xRRGGBB. When absent, the
+      operating system uses its own default.
+    maximum: 0xffffff
+
+required:
+  - compatible
+
+# The image lives either in the node or in a reserved memory region,
+# never both and never neither.
+oneOf:
+  - required:
+      - logo-image
+  - required:
+      - memory-region
+
+additionalProperties: false
+
+examples:
+  - |
+    // A 2x1 image, red and blue, centred and 120 pixels below the middle
+    / {
+        compatible = "foo";
+        model = "foo";
+        #address-cells = <1>;
+        #size-cells = <1>;
+
+        chosen {
+            logo {
+                compatible = "boot-logo";
+                /* Normally: logo-image = /incbin/("logo.bmp"); */
+                logo-image = /bits/ 8 <0x42 0x4d 0x3e 0x00 0x00 0x00 0x00 0x00
+                                  0x00 0x00 0x36 0x00 0x00 0x00 0x28 0x00
+                                  0x00 0x00 0x02 0x00 0x00 0x00 0x01 0x00
+                                  0x00 0x00 0x01 0x00 0x18 0x00 0x00 0x00
+                                  0x00 0x00 0x08 0x00 0x00 0x00 0x13 0x0b
+                                  0x00 0x00 0x13 0x0b 0x00 0x00 0x00 0x00
+                                  0x00 0x00 0x00 0x00 0x00 0x00 0x00 0x00
+                                  0xff 0xff 0x00 0x00 0x00 0x00>;
+                logo-position = <(-1) (-1)>;
+                logo-offset = <0 120>;
+                background-color = <0x1e1e28>;
+            };
+        };
+    };
diff --git a/MAINTAINERS b/MAINTAINERS
index 321ecb9f5b5b..0d1decaedde0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -9174,6 +9174,7 @@ M:	Màxim Pedraza Padilla <maximpedraza@gmail.com>
 L:	dri-devel@lists.freedesktop.org
 S:	Maintained
 T:	git https://gitlab.freedesktop.org/drm/misc/kernel.git
+F:	Documentation/devicetree/bindings/display/boot-logo.yaml
 F:	drivers/gpu/drm/clients/drm_splash.c
 
 DRM TTM SUBSYSTEM
-- 
2.39.5

