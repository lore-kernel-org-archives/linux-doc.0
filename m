Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4781B28BAA6
	for <linux-doc@vger.kernel.org>; Sun,  5 Oct 2025 15:34:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759678470; cv=none; b=j+oxuvWJ8Sq+R3zrZANCie1cSbz1NOFJM7FDJjNMk+DVLPg4cFCymiFXmEgm+bCqi52VzQQuHsvF9i1MC9EtoUP7KR+dPBye/lZZ03KDwstyec4uS0KmVMhWgoXOUtAFFhRT1XoGTtZLa3/BFMyu/ITlvfO2RB4VseLwonO24uw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759678470; c=relaxed/simple;
	bh=jvDU90SLOc+78K7dMZENIg1QewfPmCHCCe6gEbTzCZQ=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=FVbrP1S6+aep0hrOiWK+mU3ZPpxVAXSZgEUnPDen4REB1cWkhQNfX8xTSR6VhkNeYAbGvIEXo8QfjgnVek2WnLBgNW90ogePrDjciA7AbrpiTPYqk6OAoHzJPOkEetM3aVa1d66eWMrEljJaeliK+tV9U8OwPykOhgVUPkiw9DE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=E67Ar/2/; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="E67Ar/2/"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-b60971c17acso3542231a12.3
        for <linux-doc@vger.kernel.org>; Sun, 05 Oct 2025 08:34:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759678467; x=1760283267; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dNk/U6IE8mQbxqdTgBsFaFf/uVyNOzk66GK8x6NhUFE=;
        b=E67Ar/2/xbvq9WJce6DroPiS4PjQkl8rNYqN646mo3DKqPW7o96hJLA3bgQG5otq33
         aEKemoVMXSkVWsrd8Mpv/B6DzoXXU2esExjM9WA1uq0PX1M+Ycr5UZ/BgV6+3Yt4Jtib
         h5fs2udPDyS3GrSjmRxJy6OXfZNejJr4scOQ5fCwndTVclzNL82tk9BJ/kyIG+0sDQ3F
         RRI/0vkZGmXCtvkz7UqLju2SASse2sf4sXnuoJbYoxfhbOFz/pJ2GLkeGhYpde1IbL6A
         AaokXPTJEnlhqJceo6hEhlGkLkW4e9w77dQCzV+8e7+DqiByKyebEkGiHuRkZrz4cLeH
         24Qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759678467; x=1760283267;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=dNk/U6IE8mQbxqdTgBsFaFf/uVyNOzk66GK8x6NhUFE=;
        b=CRV74Mp3uIJyshVmyXEDi/6+DgpPKLkZKFjgTUiEveayWZoApL2LGeK4A1u7CWQIyj
         /mt5RfOUQLiKEF1tNc+ZeqszGX/LtwPk1tIJTH6VjAQ3bGPNSYc94hkVnj5LwJojBKfh
         edaJnnEGIDYRwtNFsJ5d9vkEx65zOVpaXHwjEJFvPM4UyAi26LKEPZsiRn+dgAJwp+/b
         fNSLxb70rl+AOQV/1roPeQLdjoGg6+t/2oiYR/3+lpLELcZuyHYRp34NYeUHVYQfI8gZ
         p422H41ecZasFHBc0YJAn8srinsdNoMrpOBHEXLqZMiSEVorbRHfM+0Jkc0ZH1Okmbdc
         JFHA==
X-Forwarded-Encrypted: i=1; AJvYcCVBMt8jzg0+cufBE9KYhkhJ9XBdYk5Mz1h5O4GO0W24esoB/g8sM/RRRTXpcCoOgh8x+TK9uQGcW0k=@vger.kernel.org
X-Gm-Message-State: AOJu0YzWi+qQU1x9a6d13oOW5jhPAISxCjGD8t/KNkN6ASQTl0dT5d1t
	RFB1ooaQX8WQyTn/gtudngSRTKd8UjoQKn5ITY1BWHmS2qHS+hYdPoqz
X-Gm-Gg: ASbGncsrgJohn6TxD0aNW9e8dMX0v6VA3cE3H6KzmI7J5Z1NoeUSEkN1T2VAM2z/02J
	3CrN7UTxalAmDhHLM9U/EYi76k39Bg3DEHvwgvAWOrVeKd8tnQzknWxcNQybgDuFesnRDaPgxn8
	NWAatMlkQdrWzTB631SPNn/95ERVSEOkZgwebSeNPiid58XUyxf6C+L4VBWH7hSGqRxGOjQhYfy
	dzhnLr4DkBUJ3j54RI7OkO97TeZS0owdfwJkB5uPMGpkbc5oQU/7RjX36aRL5zm3dPypFeYCKU4
	dRvO2OcdZBxkYOrnRFDGybYIqcIFsbnrCWCoGF6/+KS/mEaxUZLJtmMkWWEIkwsVltCYhYLGcj+
	U/iRejZXHKEP6CzMCHHghkc6wr3uwqEI6u4uRcGkvRMp6KBO7MzkOW3w=
X-Google-Smtp-Source: AGHT+IFXbfpfbAoB2bwhEvZbvUOaR+Uknsssi4Wg8VDAS21liMVscqEo+1sERzHpiYFDBwYxldGa+g==
X-Received: by 2002:a17:903:2f0e:b0:250:bd52:4cdb with SMTP id d9443c01a7336-28e9a62ff1emr98496115ad.32.1759678467527;
        Sun, 05 Oct 2025 08:34:27 -0700 (PDT)
Received: from DESKTOP-P76LG1N.lan ([58.187.66.63])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d110d9csm105555965ad.2.2025.10.05.08.34.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Oct 2025 08:34:27 -0700 (PDT)
From: Nam Tran <trannamatk@gmail.com>
To: lee@kernel.org
Cc: pavel@kernel.org,
	gregkh@linuxfoundation.org,
	rdunlap@infradead.org,
	christophe.jaillet@wanadoo.fr,
	krzk+dt@kernel.org,
	robh@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	linux-leds@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Nam Tran <trannamatk@gmail.com>
Subject: [PATCH v15 1/3] dt-bindings: leds: add TI/National Semiconductor LP5812 LED Driver
Date: Sun,  5 Oct 2025 22:33:35 +0700
Message-Id: <20251005153337.94025-2-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251005153337.94025-1-trannamatk@gmail.com>
References: <20251005153337.94025-1-trannamatk@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The LP5812 is a 4x3 RGB LED driver with an autonomous animation
engine and time-cross-multiplexing (TCM) support for up to 12 LEDs
or 4 RGB LEDs. It supports both analog (256 levels) and PWM (8-bit)
dimming, including exponential PWM for smooth brightness control.

Signed-off-by: Nam Tran <trannamatk@gmail.com>
---
 .../devicetree/bindings/leds/ti,lp5812.yaml   | 290 ++++++++++++++++++
 MAINTAINERS                                   |   6 +
 2 files changed, 296 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lp5812.yaml

diff --git a/Documentation/devicetree/bindings/leds/ti,lp5812.yaml b/Documentation/devicetree/bindings/leds/ti,lp5812.yaml
new file mode 100644
index 000000000000..d759ba7a86fc
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/ti,lp5812.yaml
@@ -0,0 +1,290 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/ti,lp5812.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: TI LP5812 4x3 Matrix RGB LED Driver with Autonomous Control
+
+maintainers:
+  - Nam Tran <trannamatk@gmail.com>
+
+description: |
+  The LP5812 is a 4x3 matrix RGB LED driver with I2C interface
+  and autonomous animation engine control.
+  For more product information please see the link below:
+  https://www.ti.com/product/LP5812#tech-docs
+
+properties:
+  compatible:
+    const: ti,lp5812
+
+  reg:
+    maxItems: 1
+
+  ti,operation-mode:
+    description: |
+      Selects the LED operation mode of the LP5812. The device supports
+      three modes:
+        - Direct-drive mode ("direct_mode") drives up to 4 LEDs directly
+        by internal current sinks (LED0-LED3).
+        - TCM-drive mode ("tcmscan:<n>:<order...>") drives up to 12 LEDs
+        (4 RGB) using 1-4 scan multiplexing. The <n> specifies the number
+        of scans (1-4), and <order...> defines the scan order of the outputs.
+        - Mix-drive mode ("mixscan:<n>:<direct>:<order...>") combines
+        direct-drive and TCM-drive outputs. The <n> specifies the number
+        of scans, <direct> selects the direct-drive outputs, and <order...>
+        defines the scan order.
+    $ref: /schemas/types.yaml#/definitions/string
+    enum:
+      - direct_mode
+      - tcmscan:1:0
+      - tcmscan:1:1
+      - tcmscan:1:2
+      - tcmscan:1:3
+      - tcmscan:2:0:1
+      - tcmscan:2:0:2
+      - tcmscan:2:0:3
+      - tcmscan:2:1:2
+      - tcmscan:2:1:3
+      - tcmscan:2:2:3
+      - tcmscan:3:0:1:2
+      - tcmscan:3:0:1:3
+      - tcmscan:3:0:2:3
+      - tcmscan:4:0:1:2:3
+      - mixscan:1:0:1
+      - mixscan:1:0:2
+      - mixscan:1:0:3
+      - mixscan:1:1:0
+      - mixscan:1:1:2
+      - mixscan:1:1:3
+      - mixscan:1:2:0
+      - mixscan:1:2:1
+      - mixscan:1:2:3
+      - mixscan:1:3:0
+      - mixscan:1:3:1
+      - mixscan:1:3:2
+      - mixscan:2:0:1:2
+      - mixscan:2:0:1:3
+      - mixscan:2:0:2:3
+      - mixscan:2:1:0:2
+      - mixscan:2:1:0:3
+      - mixscan:2:1:2:3
+      - mixscan:2:2:0:1
+      - mixscan:2:2:0:3
+      - mixscan:2:2:1:3
+      - mixscan:2:3:0:1
+      - mixscan:2:3:0:2
+      - mixscan:2:3:1:2
+      - mixscan:3:0:1:2:3
+      - mixscan:3:1:0:2:3
+      - mixscan:3:2:0:1:3
+      - mixscan:3:3:0:1:2
+
+  vcc-supply:
+    description: Regulator providing power to the 'VCC' pin.
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^led@[0-3]$":
+    type: object
+    $ref: common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        minimum: 0
+        maximum: 3
+
+    required:
+      - reg
+
+  "^multi-led@[4-7]$":
+    type: object
+    $ref: leds-class-multicolor.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        minimum: 4
+        maximum: 7
+
+      "#address-cells":
+        const: 1
+
+      "#size-cells":
+        const: 0
+
+    patternProperties:
+      "^led@[4-9a-f]$":
+        type: object
+        $ref: common.yaml#
+        unevaluatedProperties: false
+
+        properties:
+          reg:
+            minimum: 4
+            maximum: 15
+
+        required:
+          - reg
+
+required:
+  - compatible
+  - reg
+  - ti,operation-mode
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/leds/common.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        led-controller@1b {
+            #address-cells = <1>;
+            #size-cells = <0>;
+            compatible = "ti,lp5812";
+            reg = <0x1b>;
+            ti,operation-mode = "tcmscan:4:0:1:2:3";
+            vcc-supply = <&vdd_3v3_reg>;
+
+            led@0 {
+                reg = <0x0>;
+                label = "LED0";
+                led-max-microamp = <25500>;
+            };
+
+            led@1 {
+                reg = <0x1>;
+                label = "LED1";
+                led-max-microamp = <25500>;
+            };
+
+            led@2 {
+                reg = <0x2>;
+                label = "LED2";
+                led-max-microamp = <25500>;
+            };
+
+            led@3 {
+                reg = <0x3>;
+                label = "LED3";
+                led-max-microamp = <25500>;
+            };
+
+            multi-led@4 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <0x4>;
+                color = <LED_COLOR_ID_RGB>;
+                label = "LED_A";
+
+                led@4 {
+                    reg = <0x4>;
+                    color = <LED_COLOR_ID_GREEN>;
+                    led-max-microamp = <25500>;
+                };
+
+                led@5 {
+                    reg = <0x5>;
+                    color = <LED_COLOR_ID_RED>;
+                    led-max-microamp = <25500>;
+                };
+
+                led@6 {
+                    reg = <0x6>;
+                    color = <LED_COLOR_ID_BLUE>;
+                    led-max-microamp = <25500>;
+                };
+            };
+
+            multi-led@5 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <0x5>;
+                color = <LED_COLOR_ID_RGB>;
+                label = "LED_B";
+
+                led@7 {
+                    reg = <0x7>;
+                    color = <LED_COLOR_ID_GREEN>;
+                    led-max-microamp = <25500>;
+                };
+
+                led@8 {
+                    reg = <0x8>;
+                    color = <LED_COLOR_ID_RED>;
+                    led-max-microamp = <25500>;
+                };
+
+                led@9 {
+                    reg = <0x9>;
+                    color = <LED_COLOR_ID_BLUE>;
+                    led-max-microamp = <25500>;
+                };
+            };
+
+            multi-led@6 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <0x6>;
+                color = <LED_COLOR_ID_RGB>;
+                label = "LED_C";
+
+                led@a {
+                    reg = <0xa>;
+                    color = <LED_COLOR_ID_GREEN>;
+                    led-max-microamp = <25500>;
+                };
+
+                led@b {
+                    reg = <0xb>;
+                    color = <LED_COLOR_ID_RED>;
+                    led-max-microamp = <25500>;
+                };
+
+                led@c {
+                    reg = <0xc>;
+                    color = <LED_COLOR_ID_BLUE>;
+                    led-max-microamp = <25500>;
+                };
+            };
+
+            multi-led@7 {
+                #address-cells = <1>;
+                #size-cells = <0>;
+                reg = <0x7>;
+                color = <LED_COLOR_ID_RGB>;
+                label = "LED_D";
+
+                led@d {
+                    reg = <0xd>;
+                    color = <LED_COLOR_ID_GREEN>;
+                    led-max-microamp = <25500>;
+                };
+
+                led@e {
+                    reg = <0xe>;
+                    color = <LED_COLOR_ID_RED>;
+                    led-max-microamp = <25500>;
+                };
+
+                led@f {
+                    reg = <0xf>;
+                    color = <LED_COLOR_ID_BLUE>;
+                    led-max-microamp = <25500>;
+                };
+            };
+        };
+    };
+
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 5a2cde903910..38f913ba7a4c 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25383,6 +25383,12 @@ S:	Supported
 F:	Documentation/devicetree/bindings/iio/dac/ti,dac7612.yaml
 F:	drivers/iio/dac/ti-dac7612.c
 
+TEXAS INSTRUMENTS' LP5812 RGB LED DRIVER
+M:	Nam Tran <trannamatk@gmail.com>
+L:	linux-leds@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/leds/ti,lp5812.yaml
+
 TEXAS INSTRUMENTS' LB8864 LED BACKLIGHT DRIVER
 M:	Alexander Sverdlin <alexander.sverdlin@siemens.com>
 L:	linux-leds@vger.kernel.org
-- 
2.25.1

