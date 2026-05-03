Received: from mail-ej1-f49.google.com (mail-ej1-f49.google.com [209.85.218.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 01BC43C3452
	for <linux-doc@vger.kernel.org>; Sun,  3 May 2026 16:21:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777825319; cv=none; b=nqb+RVHv/D3vUNM7cIzm/WhClZLtnS4NWCrgRSelSQKyrVOfd2S4qOOfeofRgEMBvxl+ZU/iKOSEZ/4F4/2eG6QS+Kp4tkNVBGztu0zvZzqfUvld7FrteBGemz+EUJ7MU1OKXVBdLDbDSsgw0hf1Xal2JqapBjkjHGLEI1k6+4Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777825319; c=relaxed/simple;
	bh=dwCxRMEisxexISOwxJ7Jmn5BKMZAjr7fD5C91acVSrs=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=jOD+FIoyHKWSpNTisLCdtzezvqS1B0cxgOY+32o1mg7CcM8nuUjP1c/sBE/LDaz7O6PdAq0JniMI7ssisU3fqyUklkLNKrFt49OXMHAwP1U64DdEi4o76PrG/ATKxkW0c3H6KwXkvc1YTaoCoKFVGfXiWOtLuH7+AvvnwQV4Ps4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tss.black; spf=pass smtp.mailfrom=tss.black; dkim=pass (2048-bit key) header.d=tss-black.20251104.gappssmtp.com header.i=@tss-black.20251104.gappssmtp.com header.b=fgGbm94R; arc=none smtp.client-ip=209.85.218.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=tss.black
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=tss.black
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=tss-black.20251104.gappssmtp.com header.i=@tss-black.20251104.gappssmtp.com header.b="fgGbm94R"
Received: by mail-ej1-f49.google.com with SMTP id a640c23a62f3a-ba699316b42so471471066b.3
        for <linux-doc@vger.kernel.org>; Sun, 03 May 2026 09:21:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=tss-black.20251104.gappssmtp.com; s=20251104; t=1777825316; x=1778430116; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=kxzFrXvbXVkOb9Id0VGPhGUKe6bbCmGVkQRkUolvNt8=;
        b=fgGbm94R4JigJg1UGrniktHzB8XuKGZ1e5rjXPac+LYn/38sR5MKeMaD1VsY+98cvg
         194xBmBjHrupdaVTzS3x92hU31XJgualg6n5/paLjGb8UO9W0rZBq/kw2wQDF/pgJTsa
         HT5H+mvm1ZGofHCv6JWEBI66eQAYUnjjJGFBTqbPLfECWFNCTmIJp99ZMm4n4U05E2D1
         fnmXT0E/ndPUYkc5W03AFb1Nvc7rkKJZh4zDRVRTlxFox+O4hFcVlPNMAp/FZux+zjHr
         3qbh+oYoq1ay8BuRkS1YEUOpcuRuS5s8vfkQ0AssLsJjOCBkQyfaWmB/t7dZ9ps7/U/Y
         eY3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777825316; x=1778430116;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kxzFrXvbXVkOb9Id0VGPhGUKe6bbCmGVkQRkUolvNt8=;
        b=R+JArGqv8l2FOI+XGLGEW7gSxRqq7ohN1jn4lFB3iP0IdtQryA3ineTAyfejJflbIi
         a5g2VKHKnz9nMuC1bmwigk3FIDwDmeai7IBcGgsJ3rzzHTAHs/WBGSvd7zbDHl1uwbQ7
         rVs5hWkLwgBx+h44iVFKOFxzww4CUXxD6YFHaiSQpjpAuFwCW9HiiA05lbef2Bk+DAet
         6HZS2kbSd/pf7DQZcbcDD9SM8HROVXOkCV2rwGCeEaaOK00rQJ1GEbifdZmrCsUc35Tr
         F2Mz9VKqJ5mWtXlZIPF8Fczje365rz1QD2fxI2aBRukngrH53oTNWdidFZmM77qMr+I+
         TCgw==
X-Gm-Message-State: AOJu0YyzraBusNO97/LHfWSE1BBRG7xO6mSmFzODLJtFhaJs2M7YLSkb
	COYcbk42SPcZF5U0kwOLHT+XZ7fcvaebkOc2Sc5vVdJxGLy9O5fgDvh/+vgjB+MxiLU=
X-Gm-Gg: AeBDieucJMH7jLL4ZLPqfWyJExmYQ0gMN4o2clhS+7ROL1ueC2/pbCMqbsFS7+zojoT
	f5g8RJU3lqnmAnnl9U8TNs+jvuQUO8kmPNn/wi0x+vVItmweitoZU+BUPZIXOrDLXg6yYIgQE2Z
	xZmGtDqXikS/0qWuaDYle1WJOkLRTjNbcjkskheydULcU/MyhlSxBlRGGDnuCqkfHio1T3FpvoM
	awg8N7Ww7i2f/iLNHVGiefUaapN67/02XlijysH383wINzI4ktyDUZJs153jeddqysjYa2YsHIV
	07qXiLe7Fy4uHZx4ZWVgspBnG4ZZb8tRLSxknJgqBG8aXW0+A/CZnaAurOlYAgIh5VKR06s5bM5
	V1FJ5hA6gklxWQb7rWCW6v/aHr/EEaCoxtsmLgum90n0woV34V0qFX2z1PY2JxHNmVUJVqpxaVG
	HBYmsaoJ668WVQ8qfJ3MBr8zj6K2lyuuepDeHbMFuLlGC05cfgVkYJpPTtV2RZpA7r2KPQ6k/FX
	u1D2cv9bjlv8AJpdtMo
X-Received: by 2002:a17:907:9617:b0:ba4:a7a3:d03f with SMTP id a640c23a62f3a-bbffaf45fafmr321087666b.27.1777825316071;
        Sun, 03 May 2026 09:21:56 -0700 (PDT)
Received: from dell (public-gprs524604.centertel.pl. [31.61.168.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-bc21478931dsm35710666b.24.2026.05.03.09.21.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 03 May 2026 09:21:55 -0700 (PDT)
From: Karol Antczak <karol.antczak@tss.black>
To: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
	Karol Antczak <karol.antczak@tss.black>
Subject: [PATCH] MAINTAINERS: fix typos
Date: Sun,  3 May 2026 18:21:50 +0200
Message-ID: <20260503162150.575620-1-karol.antczak@tss.black>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Fix spelling and capitalization issues.

Signed-off-by: Karol Antczak <karol.antczak@tss.black>
---
 MAINTAINERS | 40 ++++++++++++++++++++--------------------
 1 file changed, 20 insertions(+), 20 deletions(-)

diff --git a/MAINTAINERS b/MAINTAINERS
index 882214b0e7db..c4abb127ce30 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -12,7 +12,7 @@ Descriptions of section entries and preferred order
 	   Supported:	Someone is actually paid to look after this.
 	   Maintained:	Someone actually looks after it.
 	   Odd Fixes:	It has a maintainer but they don't have time to do
-			much other than throw the odd patch in. See below..
+			much other than throw the odd patch in. See below.
 	   Orphan:	No current maintainer [but maybe you could take the
 			role as you write your new code].
 	   Obsolete:	Old code. Something tagged obsolete generally means
@@ -1913,7 +1913,7 @@ F:	drivers/iio/addac/stx104.c
 
 APM DRIVER
 M:	Jiri Kosina <jikos@kernel.org>
-S:	Odd fixes
+S:	Odd Fixes
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/jikos/apm.git
 F:	arch/x86/kernel/apm_32.c
 F:	drivers/char/apm-emulation.c
@@ -1936,7 +1936,7 @@ F:	security/apparmor/
 APPLE BCM5974 MULTITOUCH DRIVER
 M:	Henrik Rydberg <rydberg@bitmath.org>
 L:	linux-input@vger.kernel.org
-S:	Odd fixes
+S:	Odd Fixes
 F:	drivers/input/mouse/bcm5974.c
 
 APPLE PCIE CONTROLLER DRIVER
@@ -1948,12 +1948,12 @@ F:	drivers/pci/controller/pcie-apple.c
 APPLE SMC DRIVER
 M:	Henrik Rydberg <rydberg@bitmath.org>
 L:	linux-hwmon@vger.kernel.org
-S:	Odd fixes
+S:	Odd Fixes
 F:	drivers/hwmon/applesmc.c
 
 APPLETALK NETWORK LAYER
 L:	netdev@vger.kernel.org
-S:	Odd fixes
+S:	Odd Fixes
 F:	include/linux/atalk.h
 F:	include/uapi/linux/atalk.h
 F:	net/appletalk/
@@ -4059,7 +4059,7 @@ ASYMMETRIC KEYS - GOST
 M:	Lukas Wunner <lukas@wunner.de>
 M:	Ignat Korchagin <ignat@linux.win>
 L:	linux-crypto@vger.kernel.org
-S:	Odd fixes
+S:	Odd Fixes
 F:	crypto/ecrdsa*
 
 ASYMMETRIC KEYS - RSA
@@ -4071,7 +4071,7 @@ F:	crypto/rsa*
 
 ASYNCHRONOUS TRANSFERS/TRANSFORMS (IOAT) API
 R:	Dan Williams <djbw@kernel.org>
-S:	Odd fixes
+S:	Odd Fixes
 W:	http://sourceforge.net/projects/xscaleiop
 F:	Documentation/crypto/async-tx-api.rst
 F:	crypto/async_tx/
@@ -5550,7 +5550,7 @@ F:	include/uapi/linux/btrfs*
 BTTV VIDEO4LINUX DRIVER
 M:	Mauro Carvalho Chehab <mchehab@kernel.org>
 L:	linux-media@vger.kernel.org
-S:	Odd fixes
+S:	Odd Fixes
 W:	https://linuxtv.org
 T:	git git://linuxtv.org/media.git
 F:	Documentation/driver-api/media/drivers/bttv*
@@ -6898,7 +6898,7 @@ F:	drivers/media/dvb-frontends/cx24120*
 CX88 VIDEO4LINUX DRIVER
 M:	Mauro Carvalho Chehab <mchehab@kernel.org>
 L:	linux-media@vger.kernel.org
-S:	Odd fixes
+S:	Odd Fixes
 W:	https://linuxtv.org
 T:	git git://linuxtv.org/media.git
 F:	Documentation/driver-api/media/drivers/cx88*
@@ -9822,7 +9822,7 @@ FBTFT Framebuffer drivers
 M:	Andy Shevchenko <andy@kernel.org>
 L:	dri-devel@lists.freedesktop.org
 L:	linux-fbdev@vger.kernel.org
-S:	Odd fixes
+S:	Odd Fixes
 F:	drivers/staging/fbtft/
 
 FC0011 TUNER DRIVER
@@ -11289,7 +11289,7 @@ HARDWARE RANDOM NUMBER GENERATOR CORE
 M:	Olivia Mackall <olivia@selenic.com>
 M:	Herbert Xu <herbert@gondor.apana.org.au>
 L:	linux-crypto@vger.kernel.org
-S:	Odd fixes
+S:	Odd Fixes
 F:	Documentation/admin-guide/hw_random.rst
 F:	Documentation/devicetree/bindings/rng/
 F:	drivers/char/hw_random/
@@ -12714,7 +12714,7 @@ F:	include/uapi/linux/uinput.h
 INPUT MULTITOUCH (MT) PROTOCOL
 M:	Henrik Rydberg <rydberg@bitmath.org>
 L:	linux-input@vger.kernel.org
-S:	Odd fixes
+S:	Odd Fixes
 F:	Documentation/input/multi-touch-protocol.rst
 F:	drivers/input/input-mt.c
 K:	\b(ABS|SYN)_MT_
@@ -14098,7 +14098,7 @@ R:	Nicholas Piggin <npiggin@gmail.com>
 L:	linuxppc-dev@lists.ozlabs.org
 L:	kvm@vger.kernel.org
 S:	Maintained (Book3S 64-bit HV)
-S:	Odd fixes (Book3S 64-bit PR)
+S:	Odd Fixes (Book3S 64-bit PR)
 S:	Orphan (Book3E and 32-bit)
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/powerpc/linux.git topic/ppc-kvm
 F:	arch/powerpc/include/asm/kvm*
@@ -14787,7 +14787,7 @@ F:	arch/powerpc/platforms/44x/
 LINUX FOR POWERPC EMBEDDED PPC85XX
 M:	Scott Wood <oss@buserror.net>
 L:	linuxppc-dev@lists.ozlabs.org
-S:	Odd fixes
+S:	Odd Fixes
 T:	git git://git.kernel.org/pub/scm/linux/kernel/git/scottwood/linux.git
 F:	Documentation/devicetree/bindings/cache/freescale-l2cache.txt
 F:	Documentation/devicetree/bindings/powerpc/fsl/
@@ -14908,7 +14908,7 @@ F:	tools/testing/selftests/liveupdate/
 
 LLC (802.2)
 L:	netdev@vger.kernel.org
-S:	Odd fixes
+S:	Odd Fixes
 F:	include/linux/llc.h
 F:	include/net/llc*
 F:	include/uapi/linux/llc.h
@@ -19837,7 +19837,7 @@ F:	drivers/media/i2c/ov7670.c
 OMNIVISION OV772x SENSOR DRIVER
 M:	Jacopo Mondi <jacopo@jmondi.org>
 L:	linux-media@vger.kernel.org
-S:	Odd fixes
+S:	Odd Fixes
 T:	git git://linuxtv.org/media.git
 F:	Documentation/devicetree/bindings/media/i2c/ovti,ov772x.yaml
 F:	drivers/media/i2c/ov772x.c
@@ -23635,7 +23635,7 @@ F:	drivers/media/i2c/saa6588*
 SAA7134 VIDEO4LINUX DRIVER
 M:	Mauro Carvalho Chehab <mchehab@kernel.org>
 L:	linux-media@vger.kernel.org
-S:	Odd fixes
+S:	Odd Fixes
 W:	https://linuxtv.org
 T:	git git://linuxtv.org/media.git
 F:	Documentation/driver-api/media/drivers/saa7134*
@@ -24340,7 +24340,7 @@ F:	drivers/iio/light/gp2ap002.c
 SHARP RJ54N1CB0C SENSOR DRIVER
 M:	Jacopo Mondi <jacopo@jmondi.org>
 L:	linux-media@vger.kernel.org
-S:	Odd fixes
+S:	Odd Fixes
 T:	git git://linuxtv.org/media.git
 F:	drivers/media/i2c/rj54n1cb0c.c
 F:	include/media/i2c/rj54n1cb0c.h
@@ -24434,7 +24434,7 @@ F:	drivers/media/radio/si4713/radio-usb-si4713.c
 SIANO DVB DRIVER
 M:	Mauro Carvalho Chehab <mchehab@kernel.org>
 L:	linux-media@vger.kernel.org
-S:	Odd fixes
+S:	Odd Fixes
 W:	https://linuxtv.org
 T:	git git://linuxtv.org/media.git
 F:	drivers/media/common/siano/
@@ -26135,7 +26135,7 @@ F:	drivers/media/i2c/tda9840*
 TEA5761 TUNER DRIVER
 M:	Mauro Carvalho Chehab <mchehab@kernel.org>
 L:	linux-media@vger.kernel.org
-S:	Odd fixes
+S:	Odd Fixes
 W:	https://linuxtv.org
 T:	git git://linuxtv.org/media.git
 F:	drivers/media/tuners/tea5761.*
-- 
2.54.0

