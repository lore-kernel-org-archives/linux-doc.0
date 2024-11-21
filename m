Received: from mail-ej1-f44.google.com (mail-ej1-f44.google.com [209.85.218.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5191E1AA78F
	for <linux-doc@vger.kernel.org>; Thu, 21 Nov 2024 16:58:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1732208326; cv=none; b=SAfWnKc+pjN3vcNakQqpv97qvU1IENAUixeoaS0jNge7X4GIz0GYSzPwSpCaMUv0fVnRIqe57U0Y6BImqjZdMMSEcrTDqmWZf64vhAGvwy47JDKWbu1go8EqsK6ht6ncS4aIiP+zGAqip+3KICZqgqLhB2SmmKT9U+SsqG6DQBw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1732208326; c=relaxed/simple;
	bh=/rk98YphhHbe/ZYSTzfJFAmQ84Ek4SJoyxchXfYoArI=;
	h=From:To:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=OcgaB/udJafbf63ZSvprS4GmpWTtKtjqT4hOUSuCIv6uTpa1JC+q5gnOZ1SAepJCn3Fz+NCmLAKKGbD0ANzSv92IrXfoa3/IXH/KWSJQMMn2YaYaUtodxPgPQfiI40fhQUf8C2fgK2zRm1pdfzphsFDw+Rsw2KnUmI1aqqffqOo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk; spf=pass smtp.mailfrom=remote-tech.co.uk; dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b=XOCP8dES; arc=none smtp.client-ip=209.85.218.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=remote-tech.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b="XOCP8dES"
Received: by mail-ej1-f44.google.com with SMTP id a640c23a62f3a-a9ec267b879so196851266b.2
        for <linux-doc@vger.kernel.org>; Thu, 21 Nov 2024 08:58:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=remote-tech-co-uk.20230601.gappssmtp.com; s=20230601; t=1732208322; x=1732813122; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Xjtc7Bjar9DjwKzmJO26f3PuO3HlGp9yAOlHl5sQvtU=;
        b=XOCP8dESN9NM3rC91JyQHBKGCO2UMFoIBp3AyF1JZgSEkq6zSW6F1ROtNwB5GL+PEP
         PabHtrGQZdQgEqpEwdK0CefM2oWXIomUKeHonrCMz15aReV1/ElhW4mU3Gq7gXO41JCu
         YS9CD7kpsDpYcNLiHRLZVjeoQG715ko7uPo5sig5/hu74HqD94CiWVy9HskMR6ScAPmG
         hCxeiaU/hvGCC/2tpCZUVf+yjr6l3IXpKDXfmkEDI3B66BF4V0Xmf8WuTwm5PVdA4r+K
         jZagVrm5MjIjswT3lqCmEm201MsMDkEKpAelCSsEiCNg20JWaNAF0pXnoA0Uk3RQLMgT
         K4TA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1732208322; x=1732813122;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Xjtc7Bjar9DjwKzmJO26f3PuO3HlGp9yAOlHl5sQvtU=;
        b=X31IYkgUUGJwsQPFlDXTEs5i6ZUNZz+6Exe4LSMAUzmRGRCwZ0cmZUl5yHXlWKEuja
         UZ9evTatuSVlbQSOIy/svZ6vwFjiLGXUEGGg9y9kB2Yk7oVCE4x5bVMMgCts/qB/Xnn+
         W9Czu9+4zOR998sUNlaOI1JtmfSOMrQCP5aIS851ou3oYSAHYTiZ7jUfVA5hgi6pYZ5F
         Ou6gg8aaGABmmUp0SJzaBXR122YA/26VssWV092HT6ZcpoumV/czc3C2Uc9WfM+HMmYb
         ICeClRiSYBlOJ+JGRiDdXimWxldusz1xjSxgv+QrdLW66QaIUIU6+Lr9QqRw4AClwo2S
         NYlQ==
X-Forwarded-Encrypted: i=1; AJvYcCUAKu1/p4iPjKbPH1A1BigIU9/QzPbMc1NrZka6J0Ibv8kmrRzIzdiPKR37h0Nwi8iVwUO/CWXiUQs=@vger.kernel.org
X-Gm-Message-State: AOJu0YxjXhCpT3OfWD4/+ekJtBSN+IwDSaU/DE0lImHWFFKCZKFnf/Ex
	MIi6i26miSB3FEj4cO0Gwjf0tVNd7XV1L7r1Fka4b/EpKQXKwbxyJrKN8qqdW2Kn6no5xWrCRMF
	HVJeW0k00Vy5J+pz2LbDdgbSELTS24oj1a1H1gWxx5Z5cihPlYefd57UiDCjurgeuJni4trsvLj
	X605eZvlT3W2XQW20l0+OvSqs=
X-Gm-Gg: ASbGncvTSr7l2Sy4Hs30m1BuQezD/ngaatfC3LLwEKznFSd4Hcx0OfjDNZf4TnLKDkh
	gh0yUsb+ImFuH5zLbvAjprNHQYN7qi+yKEmgtJDtj5n1bU9WQIMGfCVEe114matyojQJArEZppR
	dPk4JHDl27v63ytacvO3O9IUNGXeeLfonEk0qeow9QA1c8fBWYXZtf+nVbNHHjsLD81o9tv7M7D
	P1bEJt4TX3xnoTp/8tMIXsWC0qWxTLIzIfVyiTaSIhdFbAjqAaPcA2YkUkLOWO+SojsTLeoWQFe
	P0TJdtw2dk8KYUC7EbMo
X-Google-Smtp-Source: AGHT+IGLS3KmQ7W38uHkAUt5viZ2Av6E/2C/dV0BXFOoBaL8NmcaVp/OqwnPRW9xtIPS0QThu5bqjw==
X-Received: by 2002:a17:907:97c9:b0:a9a:1792:f1a with SMTP id a640c23a62f3a-aa4dd52c6femr719914166b.7.1732208322610;
        Thu, 21 Nov 2024 08:58:42 -0800 (PST)
Received: from localhost.localdomain ([178.27.36.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aa4f41536d3sm101502766b.24.2024.11.21.08.58.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 21 Nov 2024 08:58:42 -0800 (PST)
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
Subject: [PATCH v9 2/3] dt-bindings: leds: Add LED1202 LED Controller
Date: Thu, 21 Nov 2024 16:58:24 +0000
Message-Id: <20241121165829.8210-3-vicentiu.galanopulo@remote-tech.co.uk>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241121165829.8210-1-vicentiu.galanopulo@remote-tech.co.uk>
References: <20241121165829.8210-1-vicentiu.galanopulo@remote-tech.co.uk>
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
v1: https://lore.kernel.org/lkml/ZnCnnQfwuRueCIQ0@admins-Air/T/
v2: https://lore.kernel.org/all/ZniNdGgKyUMV-hjq@admins-Air/T/
v3: https://lore.kernel.org/all/ZniNdGgKyUMV-hjq@admins-Air/T/

Changes in v4:
  - remove label property, use devm_led_classdev_register_ext instead
Changes in v3:
  - remove active property
Changes in v2:
  - renamed label to remove color from it
  - add color property for each node
  - add function and function-enumerator property for each node

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

