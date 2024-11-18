Received: from mail-ed1-f52.google.com (mail-ed1-f52.google.com [209.85.208.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 895B91B6D0A
	for <linux-doc@vger.kernel.org>; Mon, 18 Nov 2024 14:55:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731941706; cv=none; b=cacDT49PGOPmPTOwXs70Q3Tm61MDA8/58fIRD+Fs/jHeRJmwGTrYxMDBm8B61K3sPrDUN5WmKdVTNT8bhfaiLgVB4VZKv9yrJIPEXaSQ1LW7v7Q4qk2A6cLrbNq4JllXGN6fgy+IIzXAivj0g9ebEFPPEs45jIFOl1Yg6VsHaU4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731941706; c=relaxed/simple;
	bh=dv2/+Rc9yxwcZ2ND2dAyftrng/AjLfmMhWY48feSw7c=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=IuxdXHwB//WnMxnTBkBkyzK8t5cYLeHcktyLrWJR8nkS70cbkUJnSCNfxeh0gJjhYIKj6U+BqQBJtswJjjEEHKS9R1xtfwiMF12y9v1DtC/1Y82BqkMS3azZTuviCkrBZhHygCHGO79KYvEWGUrxiSk5A0usdsGSCn5+Z72PSbE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk; spf=pass smtp.mailfrom=remote-tech.co.uk; dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b=fGvIvmss; arc=none smtp.client-ip=209.85.208.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=remote-tech.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b="fGvIvmss"
Received: by mail-ed1-f52.google.com with SMTP id 4fb4d7f45d1cf-5cfa1ec3b94so3046651a12.2
        for <linux-doc@vger.kernel.org>; Mon, 18 Nov 2024 06:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=remote-tech-co-uk.20230601.gappssmtp.com; s=20230601; t=1731941703; x=1732546503; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HDksoDp0rwZZvhM7tfWOTul1zfu84mkjAf3xJn2pMg8=;
        b=fGvIvmssmzboydxCuDt04lVh1xlmklOQlJivFCKjbCUNRR15kwabjQ6iYceWlKardT
         Rm+IUDsMADTPg9Pe22xTWb4vyTfohkSFUBDRUDq3e7pXpi/aeUktgKwMxVyqjCIKJGhk
         5P5wb7PRsXt99rQ4uhExXiM/GwGFMnuhq6wt7pKhGHJ5x5QRnJUBp1XzF+oeEMEqiVNg
         5tyixfTH1D4Vs3NSyP0w7gy6sR7f2/xY1cghLypkRxmNPe253tqXoJqecdyL4HmS48Kx
         m0JNUUKFMf7FnL+Yajk/OuUMm82CPAbxaG+NNAtclYf0UV2rpPs4/2QXjHziDIzWEbTD
         S0Og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1731941703; x=1732546503;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=HDksoDp0rwZZvhM7tfWOTul1zfu84mkjAf3xJn2pMg8=;
        b=JJuvAK532/gF+muHLui9pQY8kD+qzrBRgpxyOlCzX8/vA73ALPU1hp4yCXkAOj17wB
         LgkDi6iKsNUEcahOphil3Sfo0Y9v+PTbUxrObEgwhbGtx54SkHOwCe+r7H9XaGOgg32u
         yeTxBq9tc7qLMOazCycxx4BRj94rveR1/q+lHuyBHa1SRD7xUAID46t80tlLRLqWct2G
         93GFa47vozUIYr7CI8ZBt75DdOj7/Ek08O7440X3jDFd73SD4oHzjvKW0UobPwC7kyhK
         jR+hIMxtwm/4hUObvJ+QCJSHJA1et3fyVLJveCB6mw0fd2jXlEw1gk95oANoxLqlU2uX
         2ePQ==
X-Forwarded-Encrypted: i=1; AJvYcCW9M4yuqClbAGISgnAG1NN2r179qYe5kNexVwj6/hrk4a3kEV6WSnqJv9fObefjEBYS0q2VLoiG8yI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyqW6f0YVFiWmGuGbAbIISWTJRX139wW5knzUe/fn2Mkyh1XAW8
	BPVn8Is9OKajoLnMM4rw7/JkeM8p2GVHIgaygH+Tk0xDxYFUBAzTwD6aKhpo620psw9JtQACMvm
	3V6e9SVH+5dT4QvDahtt5BIP4SE+nriLBQGfS4S+BOS2OZfPmZFtKX6XE5nCG/3jnk4JunXEB57
	xDil2o51gOVTODRH9u8eSsEVM=
X-Google-Smtp-Source: AGHT+IEw/8Rd958gcjQ3nia1tg5M9oS0PLVfT7Ts7ZiqMxu69u1ESP6k5StqjkwwG6LrEz5Pxdj+hg==
X-Received: by 2002:a17:907:1c29:b0:a9e:df65:3a81 with SMTP id a640c23a62f3a-aa483554f81mr886273566b.59.1731941702918;
        Mon, 18 Nov 2024 06:55:02 -0800 (PST)
Received: from localhost.localdomain ([178.27.36.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa20df1b642sm546125666b.40.2024.11.18.06.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Nov 2024 06:55:01 -0800 (PST)
From: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
To: Pavel Machek <pavel@ucw.cz>,
	Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>,
	linux-leds@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v7 2/3] dt-bindings: leds: Add LED1202 LED Controller
Date: Mon, 18 Nov 2024 14:54:44 +0000
Message-Id: <20241118145449.7370-3-vicentiu.galanopulo@remote-tech.co.uk>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241118145449.7370-1-vicentiu.galanopulo@remote-tech.co.uk>
References: <20241118145449.7370-1-vicentiu.galanopulo@remote-tech.co.uk>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The LED1202 is a 12-channel low quiescent current LED driver with:
  * Supply range from 2.6 V to 5 V
  * 20 mA current capability per channel
  * 1.8 V compatible I2C control interface
  * 8-bit analog dimming individual control
  * 12-bit local PWM resolution
  * 8 programmable patterns

If the led node is present in the controller then the channel is
set to active.

Signed-off-by: Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
---
 .../devicetree/bindings/leds/st,led1202.yaml  | 132 ++++++++++++++++++
 1 file changed, 132 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/leds/st,led1202.yaml

diff --git a/Documentation/devicetree/bindings/leds/st,led1202.yaml b/Documentation/devicetree/bindings/leds/st,led1202.yaml
new file mode 100644
index 000000000000..f1e5e4efaa3a
--- /dev/null
+++ b/Documentation/devicetree/bindings/leds/st,led1202.yaml
@@ -0,0 +1,132 @@
+# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/leds/st,led1202.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ST LED1202 LED controllers
+
+maintainers:
+  - Vicentiu Galanopulo <vicentiu.galanopulo@remote-tech.co.uk>
+
+description: |
+  The LED1202 is a 12-channel low quiescent current LED controller
+  programmable via I2C; The output current can be adjusted separately
+  for each channel by 8-bit analog and 12-bit digital dimming control.
+  Datasheet available at
+  https://www.st.com/en/power-management/led1202.html
+
+properties:
+  compatible:
+    const: st,led1202
+
+  reg:
+    maxItems: 1
+
+  "#address-cells":
+    const: 1
+
+  "#size-cells":
+    const: 0
+
+patternProperties:
+  "^led@[0-9a-f]$":
+    type: object
+    $ref: common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      reg:
+        minimum: 0
+        maximum: 11
+
+    required:
+      - reg
+
+required:
+  - compatible
+  - reg
+  - "#address-cells"
+  - "#size-cells"
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
+        led-controller@58 {
+            compatible = "st,led1202";
+            reg = <0x58>;
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            led@0 {
+                reg = <0x0>;
+                function = LED_FUNCTION_STATUS;
+                color = <LED_COLOR_ID_RED>;
+                function-enumerator = <1>;
+            };
+
+            led@1 {
+                reg = <0x1>;
+                function = LED_FUNCTION_STATUS;
+                color = <LED_COLOR_ID_GREEN>;
+                function-enumerator = <2>;
+            };
+
+            led@2 {
+                reg = <0x2>;
+                function = LED_FUNCTION_STATUS;
+                color = <LED_COLOR_ID_BLUE>;
+                function-enumerator = <3>;
+            };
+
+            led@3 {
+                reg = <0x3>;
+                function = LED_FUNCTION_STATUS;
+                color = <LED_COLOR_ID_RED>;
+                function-enumerator = <4>;
+            };
+
+            led@4 {
+                reg = <0x4>;
+                function = LED_FUNCTION_STATUS;
+                color = <LED_COLOR_ID_GREEN>;
+                function-enumerator = <5>;
+            };
+
+            led@5 {
+                reg = <0x5>;
+                function = LED_FUNCTION_STATUS;
+                color = <LED_COLOR_ID_BLUE>;
+                function-enumerator = <6>;
+            };
+
+            led@6 {
+                reg = <0x6>;
+                function = LED_FUNCTION_STATUS;
+                color = <LED_COLOR_ID_RED>;
+                function-enumerator = <7>;
+            };
+
+            led@7 {
+                reg = <0x7>;
+                function = LED_FUNCTION_STATUS;
+                color = <LED_COLOR_ID_GREEN>;
+                function-enumerator = <8>;
+            };
+
+            led@8 {
+                reg = <0x8>;
+                function = LED_FUNCTION_STATUS;
+                color = <LED_COLOR_ID_BLUE>;
+                function-enumerator = <9>;
+            };
+        };
+    };
+...
-- 
2.39.3 (Apple Git-145)

