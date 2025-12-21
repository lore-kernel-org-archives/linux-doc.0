Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5DB201F75A6
	for <linux-doc@vger.kernel.org>; Sun, 21 Dec 2025 04:20:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766290829; cv=none; b=DOyJ6DlDjP81vZTeUxwSdMLtof1VRxmbNEVkN1Z8+G1JXsFFL5InYTVCVrVsLjC1DHiYBEdf36EFyDUcR+UUVvwRxTmcM9Dg9KcifPhkMRWZCJI+RIe22ntKqeRL/jgHrWuPpfS+NjvQ+4yHc/4g5qESpmfRNdYU+5Gg7dI1Cp4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766290829; c=relaxed/simple;
	bh=kxvIpbUgvslFpHuyxurwqgQcXHL029H34uofMySvB2E=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=iuZTQ1O9URosHerMbq9PUfaSIC2+gGeAmpL8Y6gb2PRQSjctVvKEZPfa5Z/MzGd6ATpA0xKCdxLrHj6u7yBYD5Cqo6Z0I2imFYGNeatBpECS4Hkj5OlH297df0aVRnRGL7nJo8BePcWXH7oog3JccgG6t+qdt+ycbeTXtPU09gg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=JabZMid0; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="JabZMid0"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-2a0d5c365ceso37475885ad.3
        for <linux-doc@vger.kernel.org>; Sat, 20 Dec 2025 20:20:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766290827; x=1766895627; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=e3unxyl0KTpbTfaWEmAlF0bEaP21z5y6mnXhjxR3yaQ=;
        b=JabZMid0iNDhd2sLQ1toCSHe+9YHtfwaEKIADQyrhG7qR+iom9+ApxMEDhF7Sl69qf
         YRClinjP+JIfNEIZEMUn1W2xXrqBjsB7+jU8vYwWdw1AS1s0mndw45eLLAVAr0j5BiVB
         BafQ49mhw+MuSp/Bo7CAD50k+EDqrDaODTXBrV2b1rCntSfGCQDf5doywZ0055uBt2Sw
         Jt7MKxeS2PNG/qAicewWVM0QS7jf8QVjKK7F87UT4qH0L6AJErEInTePCxY9JTh2ABV+
         Tvl1u+h2X9kU9RdpiDzg61HGHBznqeUEhluHjRclvK3v1qqWVEV+vnOfUV377oXQ4yOf
         Mbjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766290827; x=1766895627;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=e3unxyl0KTpbTfaWEmAlF0bEaP21z5y6mnXhjxR3yaQ=;
        b=DiaNWetPXjgki87fKw01fwO6EVikeG0hdDCfsYuRRC9gK+YPR7U5fMOBcPCwh3A9iq
         AaiYchCJOTH7h3TAyKRcTfc8yMJDZfo3+AWXLHOH4Ll78N8rypXSsXm/T4hA7LAuk4Tr
         XSLbwcpwlXthwbddEFpJwPWKYn0PsUOSilIRjFvwb3iRhHnudGIfEM0oM32qx/sB9zsC
         kseH3txZJA3IT1a43Bfnqk/bYOR36f5s2pZaOOAW1oGW0O8MnzGdGL9Elo40nUIeM0zj
         8/21DG6ivVK6stoG75ep3oi4rrsJj6iSJHtaNl+4CLmuEr2t+QyXrPYsdpP0LMTIDTl2
         T0YQ==
X-Forwarded-Encrypted: i=1; AJvYcCX+qHFmsIT+hgv3bdIIUTdS1FZVMuZSUWtZXQFHIQv5wP94qP9S+i3hqgvXaCh20vChug6e5pBt5F8=@vger.kernel.org
X-Gm-Message-State: AOJu0YxS7cBDbf2VyheEMbJKYOPez0t06XL//0moIZrfJ6yjJrx2m+G6
	7g7wghVZ1r1TehE003hs+WSwaJSfbRO883AKdeVgzT0MEgsXLqqpGu0C
X-Gm-Gg: AY/fxX53Fvea7no7g91i0+MdGtwhrJ6JZIEI6w61tNfaPBE3fk05wxqVUmljnhqVKDa
	nJG94fbKXe1dORD8MZ2NcLm8/6gbcad1a4OxGNhYZ1V5M6Xt+pScVFkL/Jecvai1Um0K5xQeSNn
	S4A3ZvJrdWj7XUSlPuPRLF/YA9IeUI2PPu9vlFrHtsph71ZXO1wG2hMAVmGUnHgXhFsgbUBWsjb
	JhZNOr+SbbjKxlLfOby5zjdBSWo3+wodZR9Wxq3LuZMMb+yW40P4DR38px3bCWQG4r6GExu42a7
	pwInvSQb2sc2Hym6FG5D0caB5TNwqYK4wgndR2QMl8wi9i9BCuY4v9yGZjEzfAuhKBOJyV9qOyw
	Gx6rVC0qA6uMA7oXBFBxFOwlmpjgrFVPMJnb0JS88W+5AHhNrqHInJd6RF+XYlu8CLd+PRqjsxV
	imKB+jHXxHuWslYA9MHygakFmOKdmSoM6oLw==
X-Google-Smtp-Source: AGHT+IFztACcGCaNDp2RZ/Gb4OUoZiBRSASJSq9iKgv66pH4oWOR55ktnOK9hdLDA4b3P7FCZyfNkA==
X-Received: by 2002:a17:902:e552:b0:2a0:8360:3a74 with SMTP id d9443c01a7336-2a2f2835cfdmr55972695ad.51.1766290827400;
        Sat, 20 Dec 2025 20:20:27 -0800 (PST)
Received: from localhost.localdomain ([14.255.43.222])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3d4cb90sm62319245ad.51.2025.12.20.20.20.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 20 Dec 2025 20:20:26 -0800 (PST)
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
Subject: [PATCH v20 1/3] dt-bindings: leds: add TI/National Semiconductor LP5812 LED Driver
Date: Sun, 21 Dec 2025 11:19:48 +0700
Message-Id: <20251221041950.4631-2-trannamatk@gmail.com>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20251221041950.4631-1-trannamatk@gmail.com>
References: <20251221041950.4631-1-trannamatk@gmail.com>
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

Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Nam Tran <trannamatk@gmail.com>
---
 .../devicetree/bindings/leds/ti,lp5812.yaml   | 246 ++++++++++++++++++
 MAINTAINERS                                   |   6 +
 2 files changed, 252 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/ti,lp5812.yaml

diff --git a/Documentation/devicetree/bindings/leds/ti,lp5812.yaml b/Documentation/devicetree/bindings/leds/ti,lp5812.yaml
new file mode 100644
index 000000000000..de34bff441c7
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/ti,lp5812.yaml
@@ -0,0 +1,246 @@
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
index 5b11839cba9d..e9f5325e841a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -25836,6 +25836,12 @@ S:	Supported
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

