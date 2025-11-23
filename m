Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E6EEB218AA0
	for <linux-doc@vger.kernel.org>; Sun, 23 Nov 2025 19:11:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1763925063; cv=none; b=OYGubxiPHsiKS5zh0fYf/kb8b3IQtj5a/0hpeN6L3t1IojOt+ono5kL+gdcrDsWOJRiH7LL0zT4qHY+KpCOUzfscXXNIlQotOclFhDbZRQIUUSM/WaPV5eviuz3bY7w5QbDpMaoqj8DO2AY9BaDpge6gJ5SiSKoYLuva8hmQfEk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1763925063; c=relaxed/simple;
	bh=W+d111LR+xNx3RKW8XANYn1tFwiI7uSiriuB+9Vemgc=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=sG1bUrIyDGQdRSsa7kwy0RJNGGTLzi6N743T5tRiGibYu73igFvKC61YyQDnHJK8aQiMm4KUt2fdN/sImxTQWw6KijfQE72uIA8qTx0PoPGhFpl5XJBGmhzlE71U81PnWFEOdkNl3r7LDIDfLKwtFC/2QNyf2ifg22m2RDzoxuQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=K7oJ8stR; arc=none smtp.client-ip=209.85.214.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="K7oJ8stR"
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2984dfae0acso57100505ad.0
        for <linux-doc@vger.kernel.org>; Sun, 23 Nov 2025 11:11:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1763925061; x=1764529861; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=snR5Ie8ioOVLlQgQYszHxBdrNEYSsK+md57vZ0OA05A=;
        b=K7oJ8stRncxOmLzI0RIpJe1ptAsj/UNjCZzu04s0VyghasLPCgymeC9j2bAuwV3V7I
         jRrieF/EZls2wnGFRIic0npOzQcSTjxC+QAY+T+dl4vXEWkqgQJVmi+uhlRymVQmfCCi
         HYlVpJ58sTit5JATAnKf0oOXP4lzuANEiE/1DdF4W318thlNJm4oEWRdycMnHdw8+an1
         q7C9zvAgbeuZFLWztYh3yCpQbMRG5Cg/2PsdgQm6PMQ1YyEpyjlZTSyXKlc7yQhkQhl5
         Wj2jmwCZ5mxi/Bi7qWkuMuDG19hGgYUeiI8qAMuNbAK6d19dW7xNZ62+Hfpbtzhzj/0q
         Q9Ig==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1763925061; x=1764529861;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=snR5Ie8ioOVLlQgQYszHxBdrNEYSsK+md57vZ0OA05A=;
        b=ssdZBcF+Wh+iHEg9TlYnItSPedkIUghfv3ZCZuYGbDuqnD+peECJcmHz/SYFAmw5R2
         mkxoaxcAdtMsECSKQ8v7KaNIhLN8/TuCECoZg4HpFEqjNxZX9MMdD6lMUOKnEdMw8m7r
         0KYyAfwoTCWayAIrfYTOhenudyQkPwYVn8IRBBfBwU/zGsnx3dhyG0wbzn+9xX8KhWyj
         WpLi+FyXRNx7QG9Mbn7x3GylhPAYXn3aIzbdB1S7IFV9/PVxwbi/KlTq38Z6Ba/frkE0
         IFwRkbfYoXWfz5o90D0xp4kV60ZAV+rIWmpR4aCcptdbqthQOdUETaU+VCnr5UmlKFLM
         1MuA==
X-Forwarded-Encrypted: i=1; AJvYcCVIx1cL8JOryT+XzYO7f8p6eETkS07PHbkrh1Ae6Rq+ipmR0XKM00mGaj/P1UXDKRsz62nQmaYXOaw=@vger.kernel.org
X-Gm-Message-State: AOJu0YxTSWGbmulM8pQC4DT2zE4y/dGCQwf2uJ+/6C6LOeh52BGPunw8
	vup6bsKedzjOLnnaN6zuiEsemLQaiUM4rTkRIqSXbgvC4sM8sSqvt6Jj
X-Gm-Gg: ASbGncucBNfrFtkJrazNGj4bksApSRFrUL811m/tWQ9WdWDNG18qdAeonkLyPY+QiiQ
	FZq0FcBBEBsKA4YYQ9A8JYifRs5BzaTWEYjjRikJmF4exjalFDB2zerTxgVfpSYN/+TT97IsN/Q
	d8rKkOBQDqwgxGZ0HfS/ZGdlRRkCOJOri+K3A97oLebHNiFbAIzL4ngXPNomOs+f8d0S/sIyZpe
	LAhdpxR0npykNetTb+MUnZtWx7mmnG0+XVcV/JEsK1vqKG7P7fTJPlnPtAhSgnbVi1uXwiRe6I1
	GcI7j9txFnV6d2qgmmSf6Op7rLC8YiK79UcFsYiYzGHm3qUguwlVuakYihQJbZAk6TkTnvh88EW
	KuJtwf6i/uHBbvgh61cocTy/yJMY2YIg5AWoSagFM27Gwey+kDonVjPMc/3EOcz2VUnFOBJ+sTl
	y4R0f1yZ2DABuPT9wQY+yKaA==
X-Google-Smtp-Source: AGHT+IF0RXexou+mQLUqo3Kt/PJPWss92seMrQ3+jlkSL30o1VIH5TwjhSWy6HXLhbOc2rDL5Zr0QQ==
X-Received: by 2002:a17:903:2346:b0:29b:5c65:4531 with SMTP id d9443c01a7336-29b6bf806c7mr108223425ad.59.1763925061145;
        Sun, 23 Nov 2025 11:11:01 -0800 (PST)
Received: from DESKTOP-P76LG1N.lan ([42.116.199.188])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29b5b13e720sm109542655ad.42.2025.11.23.11.10.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Nov 2025 11:11:00 -0800 (PST)
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
Subject: [PATCH v18 1/3] dt-bindings: leds: add TI/National Semiconductor LP5812 LED Driver
Date: Mon, 24 Nov 2025 02:10:40 +0700
Message-Id: <20251123191042.116917-2-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251123191042.116917-1-trannamatk@gmail.com>
References: <20251123191042.116917-1-trannamatk@gmail.com>
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
 .../devicetree/bindings/leds/ti,lp5812.yaml   | 251 ++++++++++++++++++
 MAINTAINERS                                   |   6 +
 2 files changed, 257 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lp5812.yaml

diff --git a/Documentation/devicetree/bindings/leds/ti,lp5812.yaml b/Documentation/devicetree/bindings/leds/ti,lp5812.yaml
new file mode 100644
index 000000000000..ea9d6ae92344
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/ti,lp5812.yaml
@@ -0,0 +1,251 @@
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
+  ti,scan-mode:
+    description: |
+      Selects the LED scan mode of the LP5812. The device supports
+      three modes:
+        - Direct-drive mode (by default if 'ti,scan-mode' is omitted)
+        drives up to 4 LEDs directly by internal current sinks (LED0-LED3).
+        - TCM-drive mode ("tcm:<n>:<order...>") drives up to 12 LEDs
+        (4 RGB) using 1-4 scan multiplexing. The <n> specifies the number
+        of scans (1-4), and <order...> defines the scan order of the outputs.
+        - Mix-drive mode ("mix:<n>:<direct>:<order...>") combines
+        direct-drive and TCM-drive outputs. The <n> specifies the number
+        of scans, <direct> selects the direct-drive outputs, and <order...>
+        defines the scan order.
+    $ref: /schemas/types.yaml#/definitions/string
+    pattern: '^(tcm|mix):[1-4](:[0-3]){1,4}$'
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
+      - label
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
+    required:
+      - reg
+      - label
+
+required:
+  - compatible
+  - reg
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
+            ti,scan-mode = "tcm:4:0:1:2:3";
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
index 6df89b14b521..22da152c3c87 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25448,6 +25448,12 @@ S:	Supported
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

