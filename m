Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F38217DFE7
	for <linux-doc@vger.kernel.org>; Sat, 25 Oct 2025 00:25:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761351905; cv=none; b=TuH5ncyAFCFSW3PDsoqxNMWPscTPKe+uaoVSqkLWtP/6qJRzsI3McTjP3g7DbLa8I8ZULx0UZcYlfW4dmDQHu6oy4WSDjpYLu+uzDxbGpdov9BceDlzrATWIhbq5i+xY/F+Hfx9yEsefk9ch4PioOwzcjq09Xbktei8YlWpeDaA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761351905; c=relaxed/simple;
	bh=doc6D/qsvutmJbzXvdZDYSYz0ZxXLQM+iyKROYiaouk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KLqMyB18Ay9W1yxX9OScc5PkKwmiAFkxX5XNdeCA4XnMTWIddCbjy+2p3kn/QEO68Xfj3+u4oiF0ELUdYGh0Xb5O4IqTDArMTK1nnIUh5+3zNBwfyWfrodVVU4aJtUrtPsuBHb+19LZXG+hrXbQx4FfjyhqcGghp7d9/qaSBXZY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DpGam7Tx; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DpGam7Tx"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-b6cf3174ca4so1800315a12.2
        for <linux-doc@vger.kernel.org>; Fri, 24 Oct 2025 17:25:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1761351902; x=1761956702; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wae5anKN9hvFHOBxJWNDxfF+UZ1MN51bIQyhwDOYr8M=;
        b=DpGam7Tx91C3uwnzdqHANFynSeEaPGgVqstnUk4slv0fq87EaP6eGvTyPSaZSKpwoU
         8lty4dwHo8cAtxbVwYDzNIZwXOwTmKoPMvabSn0/whEWCTT9Fl2eBb3Q6QQEtdTSfH5+
         vpyasGtXqN8U+3XEiQGzE6nXAEg9xfJAdLvoOTY/tjlwe4InBVi02H+f7QLp/gGc3H6R
         lJAlaued35/Yyl++Hr66tacDWlZG2KomI8MXxYAtVCstUwIb7G6dOAf3zTln3BgI6gaS
         i1QOTrgZ8Zwdc+ZEiw75xo96Klo/CM3C4/RPJ9BJzeqIYP+DlJxFo09c5vBAYx+fpvNQ
         KIYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1761351902; x=1761956702;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wae5anKN9hvFHOBxJWNDxfF+UZ1MN51bIQyhwDOYr8M=;
        b=cdWitlA2MBZmfOwwAc2ykE3bxOl76yAxTzhhxhacytKtNVVgwsnScAY+HlSXr8ODLc
         2WEHCU/bTnbplFvB0UOXUbwpcnaaHwDF5g6zjsgMuDwYK/gqXRPbCJCC60gDcoBuw9xU
         NbR/xR6gG6GTsh2f/bA7idMlHnIMFXdAWcuBcpgwSyZ8/Qwsrgt5mxoViUxnOonCH3Sw
         L2wFAUsVqqaPLFgANh7iVgOb5j6f8jKS7zH0Myig0aohnmU39UhNwVe8CaFB10VktL4w
         Tpja2nh1cjZ4qPi2x7J8mtoNGO55/DvcVwDXhg0J8Zwtau3D9nQnNuMZQ2ldYJbX7zN/
         8ZSg==
X-Forwarded-Encrypted: i=1; AJvYcCXz4Q+G4l4POyQ2pNAbDurMQfCo8exyB4NB7PQsEzQcRlV0zTXVxYHzDnPen72VJjfasUfpy+72q0g=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxda8xMyM8rr5eWVmtRqWRcnGpBlfFnd46ZCH7fxaPNGpOq7w3o
	OzgG1V0krDQF2juBRVnCmGiYLadTEYMZzlqUi72nNpEX5U2mHBgqJjDV
X-Gm-Gg: ASbGnctkzC9K9aau/OWzQvB8hFwhj9t51j4VjOAgXp8m/lJJW3FP/X21h4/q3CnFMwa
	iGypKgjcY8CsndeyVhTF/bQU27cxmpJ76zseXIzdQGBSw/71CTt7PSIh3T1DhKUOhsfFrTRlDIh
	hxMQLIr4vbERFg8jM6J3dMIBJvctTGnurFcvqx5hNEjKddagtTfafsPeGiCY4ykPAyDRC7V/or6
	VJYICLSrNHnfsaOhg0zanpyEROOxXmL7yn/AvQGy7IyoZ26sWlBGDYWWPZEwVyerW749ZnY4jt8
	52MJeOQhPujYohO79TjkhmDoNilWPZJh7VlsDp0jcCa3lvR+vQpefIQzie7052OLcalUFX3uZiK
	PC0RRO0KsRBKpNgaWZFaB9dXa+ZuVjf0rMxcZ+K0p3AGoHPLdPeS0G2gbAFTKqemhtonHwYx4Qt
	vn3+lePrIsGTCg94ocU21hJ+x6FLdEQsPF7c2CH6YUNU4PdPVnOW09477d4msRpQgAq8go7N0iU
	kPQ0so0OIpamBWuKM4mCxGQepKWe0BnxVJYfRLpaGzgr/oZsjDR7A==
X-Google-Smtp-Source: AGHT+IFEqmXz9bRiukdYngtpXwv8pFo+7VapY1AMW8bk3PUTqtg9ECS2KTxI+6Fj45sxyikhlb2EeQ==
X-Received: by 2002:a17:902:cec7:b0:269:8edf:67f8 with SMTP id d9443c01a7336-290cb27f40emr370038515ad.52.1761351902363;
        Fri, 24 Oct 2025 17:25:02 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29498cf3f4asm4728885ad.11.2025.10.24.17.24.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Oct 2025 17:25:02 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Sat, 25 Oct 2025 10:24:32 +1000
Subject: [PATCH v4 01/11] dt-bindings: rtc: Add Apple SMC RTC
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251025-macsmc-subdevs-v4-1-374d5c9eba0e@gmail.com>
References: <20251025-macsmc-subdevs-v4-0-374d5c9eba0e@gmail.com>
In-Reply-To: <20251025-macsmc-subdevs-v4-0-374d5c9eba0e@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 James Calligeros <jcalligeros99@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
 Mark Kettenis <kettenis@openbsd.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3352;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=mFOSrinm6mR52T1DXQZDpIdEAeTd/TshZKSbr4XqCgw=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBl/JM5KOUU19IWnm920k5nipVbb7c99zz1Ye9FD1RWXL
 bg5V1p2TGRhEONisBRTZNnQJOQx24jtZr9I5V6YOaxMIEOkRRoYgICFgS83Ma/USMdIz1TbUM/Q
 UMdYx4iBi1MApnpmICPD/JeKQcuVJpTJ5a0VO/JY8PkWXavfna5xi4x7tfR/GthfZmQ4vNRKL0n
 +VX/I1WCGLzziV2SPLPpV/aN1bcasfeJRCZ94AQ==
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Sven Peter <sven@kernel.org>

Apple Silicon Macs (M1, etc.) have an RTC that is part of the PMU IC,
but most of the PMU functionality is abstracted out by the SMC.
An additional RTC offset stored inside NVMEM is required to compute
the current date/time.

Reviewed-by: Mark Kettenis <kettenis@openbsd.org>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Sven Peter <sven@kernel.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/mfd/apple,smc.yaml          |  9 +++++++
 .../bindings/rtc/apple,smc-rtc.yaml      | 35 +++++++++++++++++++++++++
 MAINTAINERS                              |  1 +
 3 files changed, 45 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/apple,smc.yaml b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
index 5429538f7e2e..0410e712c900 100644
--- a/Documentation/devicetree/bindings/mfd/apple,smc.yaml
+++ b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
@@ -46,6 +46,9 @@ properties:
   reboot:
     $ref: /schemas/power/reset/apple,smc-reboot.yaml
 
+  rtc:
+    $ref: /schemas/rtc/apple,smc-rtc.yaml
+
 additionalProperties: false
 
 required:
@@ -80,5 +83,11 @@ examples:
           nvmem-cell-names = "shutdown_flag", "boot_stage",
                              "boot_error_count", "panic_count";
         };
+
+        rtc {
+          compatible = "apple,smc-rtc";
+          nvmem-cells = <&rtc_offset>;
+          nvmem-cell-names = "rtc_offset";
+       };
       };
     };
diff --git a/Documentation/devicetree/bindings/rtc/apple,smc-rtc.yaml b/Documentation/devicetree/bindings/rtc/apple,smc-rtc.yaml
new file mode 100644
index 000000000000..607b610665a2
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/apple,smc-rtc.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/apple,smc-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple SMC RTC
+
+description:
+  Apple Silicon Macs (M1, etc.) have an RTC that is part of the PMU IC,
+  but most of the PMU functionality is abstracted out by the SMC.
+  An additional RTC offset stored inside NVMEM is required to compute
+  the current date/time.
+
+maintainers:
+  - Sven Peter <sven@kernel.org>
+
+properties:
+  compatible:
+    const: apple,smc-rtc
+
+  nvmem-cells:
+    items:
+      - description: 48bit RTC offset, specified in 32768 (2^15) Hz clock ticks
+
+  nvmem-cell-names:
+    items:
+      - const: rtc_offset
+
+required:
+  - compatible
+  - nvmem-cells
+  - nvmem-cell-names
+
+additionalProperties: false
diff --git a/MAINTAINERS b/MAINTAINERS
index b45db73e55df..745d85b66365 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2435,6 +2435,7 @@ F:	Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
 F:	Documentation/devicetree/bindings/power/apple*
 F:	Documentation/devicetree/bindings/power/reset/apple,smc-reboot.yaml
 F:	Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
+F:	Documentation/devicetree/bindings/rtc/apple,smc-rtc.yaml
 F:	Documentation/devicetree/bindings/spi/apple,spi.yaml
 F:	Documentation/devicetree/bindings/spmi/apple,spmi.yaml
 F:	Documentation/devicetree/bindings/watchdog/apple,wdt.yaml

-- 
2.51.0

