Received: from mail-ej1-f47.google.com (mail-ej1-f47.google.com [209.85.218.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A75D1FC0EE
	for <linux-doc@vger.kernel.org>; Wed, 18 Dec 2024 18:20:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734546018; cv=none; b=NmAyCtoVb4Tqcr4Vph7apwd4j9F/8N4J7lCzl2JcG4jqfEVA/DPgt/qbIdVrpJ+sHYqER6f4nXkYBc5XJ374d85uNl6u4nXMREoua+WZVgnmwJ1q7FD7B1VfbkNRTkJs8q7A3uDgkj1WJaKTwyKRX1aEnAN8fPU2R6uX2h8Ubpc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734546018; c=relaxed/simple;
	bh=+A6+s66LjKOEISFmiH3UzxHaJ3ydgiODVCNvmcUtVWg=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=GfclGOprHKUMtrhwCKZ0cn0vIDCYMgrG1gVmZKSYMtdujy2Y1lLbxPW4+emMDgQwWGmB4q0ZTU4KmLUTeQLwkvp2pxFbTnXo12DjMe5Uq5gILyjS+dzRUN7WRIAPf3Kde43XRLWtTkjm2FwyzGvAAJJJyDGr3E79g0sW050Bwx0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk; spf=pass smtp.mailfrom=remote-tech.co.uk; dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b=CVyvjKFZ; arc=none smtp.client-ip=209.85.218.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=remote-tech.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b="CVyvjKFZ"
Received: by mail-ej1-f47.google.com with SMTP id a640c23a62f3a-aa6a92f863cso85649866b.1
        for <linux-doc@vger.kernel.org>; Wed, 18 Dec 2024 10:20:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=remote-tech-co-uk.20230601.gappssmtp.com; s=20230601; t=1734546015; x=1735150815; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=V6InofCGGPfJvamdN7P/ZHJUTNfj1oFLPk/qKVvBUNk=;
        b=CVyvjKFZRpyKp30voQqq9LlRuR0VbkHok9k/mAUyMnOryXZPzyUW92+wccOI7NZIOn
         9Ld45JiDGUsuEryjsJYrx3JrpFFHl2qdC661j59eX6NI9OBXignjMCbMU4tLfLoQD72Y
         UvAf1+Vx4SBUw0EQExU6gBnilNZfo+xhb6ma8vvAZEjXy+tFpKHTQEZiRxqqgZ2yWb+O
         w1gFHde8BA9eIC/c9s4rCY7aG9uyyz2neWsy+iyUAItYhikrgp2AHXoP5zBqnUNI6HXo
         FtAowKlTMwZ2cotbYKnfchyU6gAHc23n17rvaOb79jLDn+i+va9VKV5UmufTNB2YtpeV
         Nq1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734546015; x=1735150815;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=V6InofCGGPfJvamdN7P/ZHJUTNfj1oFLPk/qKVvBUNk=;
        b=Psqhnze70j1zUKnR9FhDp1iNsXM2CfC4flvHo9M5/x91VNiVTG/oAx5fkH50K1up4h
         Q86/0DV3KwZIuFDBsuTBBfe0dO/umLBMhKmUGdMWGVlsb2mjNNBZkTOFft3LP9Xt+iRM
         Rt4Eh32zSMvN0mGA15/GuA54x3nZ/WoUpFxAJPXxH0niMcVyVeFsO9L1D0XilwWihl7A
         Z6wMvXbqpwd43jYOw23iCknHSJZetaTbXVEUd/oVg/+Gkqyy3E/yZzcvzVxPT6LpR/qo
         HSW6DKqrV7c2tUOvjRBFyECXUzolaRb1L/0wVHEv4ioMCMjkN/D84STPxCWTZx+3NZn3
         6grQ==
X-Forwarded-Encrypted: i=1; AJvYcCXGBCcQgTEHV6nQZt4fcI8e/+qmN27HymHg/KTZnXTAPSSzqODhUh9oRWrs21iyHaThK17O+phbAyQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz4urHpFYh9I7mf6Ei70RtLMfk1+p1eLz4nqQJVZiXvEfgxaHFg
	UwHSg3LlAqmDCGvoMHL0h4iKxE5B+toiYvgnVZCeeWY6m4ezNhBF1rLqJ6VNPYCYRvZnYFC+ClE
	Beh/UMJ71v3AaAn5LltRaXSN8eUVqVSYgC0+sKMHAzN9szpHkk6RdfarTkhmzHpnB5GY/qaOU7P
	1GNcbUMdGaFNRB3XiJolS0wUDtgw/hJ3gMSEaJ
X-Gm-Gg: ASbGncsIz5X9tOsWvc0iVX4g+sPkPPtKAfkLhgwD5BIPwYcF+MAVEAjrV2Ejtylir7H
	EWS/7YXC3jWbmHUTvKb11m6BfR7G9NtLQ8FdHloMK3IMuxP4iay7SIKVKwGaZTDZ8RsTAYEV4W3
	OaOAQZjIECstFCB3wGy9K8G52wbfWLYZFLlgOlHsybwe8oRibabcko9pGRbaSqJdXgqlxyFisGF
	3UCarNK+4A8h7ljHHDqhWzujp2F/WwkBDAloTTMxU8h0QXHkUg5m7wiUifiJRYGcUVQndIAlHWV
	zc206v/voVmCcJtmhjU1msHNsp8Hw/et
X-Google-Smtp-Source: AGHT+IGC33UPzFkjqqTdfe9mJzS0AIOGuRfgJF2o1SS4QqUEVX6cCiTXFhdt23FgVBqzyUHbbbkklg==
X-Received: by 2002:a17:907:60cf:b0:aab:c6a5:7c71 with SMTP id a640c23a62f3a-aac07900e07mr36642066b.14.1734546014914;
        Wed, 18 Dec 2024 10:20:14 -0800 (PST)
Received: from localhost.localdomain ([178.27.36.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab96359fdfsm584825066b.93.2024.12.18.10.20.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 10:20:13 -0800 (PST)
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
Cc: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: [PATCH v10 2/3] dt-bindings: leds: Add LED1202 LED Controller
Date: Wed, 18 Dec 2024 18:19:54 +0000
Message-Id: <20241218182001.41476-3-vicentiu.galanopulo@remote-tech.co.uk>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241218182001.41476-1-vicentiu.galanopulo@remote-tech.co.uk>
References: <20241218182001.41476-1-vicentiu.galanopulo@remote-tech.co.uk>
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
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
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

