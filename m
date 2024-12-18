Received: from mail-ej1-f51.google.com (mail-ej1-f51.google.com [209.85.218.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id ABF371FBEA9
	for <linux-doc@vger.kernel.org>; Wed, 18 Dec 2024 18:34:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.218.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734546856; cv=none; b=Xl/8m4f1c9pXwhiIArvZoYSgA8bGeXe/4SPfjyKIj0c+maH3CGEMfwTdho7/MwAVEm6my+xCEpbXutt3DLNHdFjUTVOgKnsCCNcL8uaWRNERyTJ6SPlz4MtzO/net1bTqrTB2zufJvpdiYhNffboNgbiqEuD2bfcmjkPUuFTE0A=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734546856; c=relaxed/simple;
	bh=7rngWZ9wiuEDCfmWqP6grwXXvwbRzum8pl+1rdwIHf0=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=XqbiQ8yucQy2MpxazfBDFWKj/gv136Fe55mTJUSf/6S+8MGGERAhztk/HdFhKHD48FcuqRCkda/E6jizZnUEqGRB+5300jnhXnMpAVRp91WNzY0LjnLogBZ/nk0YoTt+ZPNdAeOhubHFRZn2etO+KCOu1THo9NHlbFqiwHd1EV8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk; spf=pass smtp.mailfrom=remote-tech.co.uk; dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b=jZkLrQS4; arc=none smtp.client-ip=209.85.218.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=remote-tech.co.uk
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=remote-tech.co.uk
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=remote-tech-co-uk.20230601.gappssmtp.com header.i=@remote-tech-co-uk.20230601.gappssmtp.com header.b="jZkLrQS4"
Received: by mail-ej1-f51.google.com with SMTP id a640c23a62f3a-aa66e4d1d5aso1098513366b.2
        for <linux-doc@vger.kernel.org>; Wed, 18 Dec 2024 10:34:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=remote-tech-co-uk.20230601.gappssmtp.com; s=20230601; t=1734546852; x=1735151652; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=SJ5HY36/J0ui11Dg7uaZuRRufGAN1US5gvTMU1EzA00=;
        b=jZkLrQS4PWZEgTP4ioQEU41ss7frw50ZHnu6NnvSR9kptFSuLcYG4INvHml8aTY02w
         RIbIslJRQQ35/CNi7LPULBBRQfugsp/pecAFfvc/n0vyvwVGC1Ce33mRuEC8Nv0K+TKi
         Z9ZQ2EpGOy/XPl0WzSd3olf6z11/xNdb80lOcns3fXf74EviEOJhqO3svWygIboUkqGf
         is7LwgGdpT0ttDorBFXHvdjLzOr+0PicQTlx2lYl6p9xvDh1zYUmTPgn1IZXmkyA3dnd
         Cpw3GVPkBstOrJkddr1X1ffwPXzp8cGmN533Zs6v1rPEYRD1XOHv8d33lXQ7cfILwQMU
         fSLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734546852; x=1735151652;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=SJ5HY36/J0ui11Dg7uaZuRRufGAN1US5gvTMU1EzA00=;
        b=fCnlAFFJuBRMprGDi8RuNhzwlfWIRgN3UxpLkeyUfYnQ9QA0orPP00uJYI0s+ZkIsZ
         SIAOM04A8sMKVBH3J/1Irc0xUQPgaVhO+6yexe9uZEaG2Az0GJXYXW5tU586bEPsACQc
         u0eFFY8C+VtbnZiqojW0ljktb/hx/oqCqP64Z0XVlMynWUE/FAchjKKexDddyytnlske
         +0+nIw1so2sOE9LVBJjZBkxJYhCIiLK3mjeukhwDl9EYX2r1mpab0SH1UCbG5Hv9zIDy
         WLXXLrTJ5mbVeMoXTgq2pmF2Fm6XXiqan+PfvuCRX3wz69+MXyi4l0xiO/g1ALTurCET
         cufQ==
X-Forwarded-Encrypted: i=1; AJvYcCVS+qi1c2PnnvJSUGAo2Vf1acW8nDgONBDN/OgFeZKFohnXPeXNKy74QnZ+nAPMs+tB1F3g+bb14wY=@vger.kernel.org
X-Gm-Message-State: AOJu0YzTJPmOd2MQ70doRg/TgzPsSkfSg9Y5qH5iDmLmlmLG8pBImnjP
	eC4iKrJ4doeYohbNgM4URyPXCznbLs8a5pmuCNuOUr+t3xoTy61ib/zo7yqTfCzE8OZiGV+2yV3
	tVC8nhUYPDBWTDf7XW+tLbT7Fg1Erh3EGMmiarPhefIySai+9AdBIFacDgXGgQa7HSxFolNajMC
	emMPTsZ/+qURL5NTFeZkVM7Ug=
X-Gm-Gg: ASbGncsHevA9v5JacPt2ojrsACJYEqNMIATDWyQnkNa+cLskUZqU/DTS8oMnv+Ih/F+
	xivpW5Os6RfQ+TbL6HD4Zr1Vd+Uv91nHCLdQmSLhTZOMbX4srsf9i4DMZlhw7IqcB1BYjbnppY+
	Dc6HaK2TMmA5HkryzQfx/uzbdXCRuSXVzENO7nL/e/mEniIrRSV9/Z3zmZC8d0WFzxkBQxWLz6u
	vF1J68yWSl7WwLl5NzP9OciFfl4qKZxiCBS/uetTux2YIJbId3JDZ9sWPAqqEM4/ISbNbePosRl
	GVDqK5m+DR2sSuPWWfDmqfN+4rDWjRRKwjT2LM6zT8abZcd6rZz3XDM/mrFa2NH6zpzesBnqBWZ
	O
X-Google-Smtp-Source: AGHT+IGCDn2MMew2mm6iT8vUhiznPmGDCq2Me/lyKwaCwBQSuyo6CyoKnToSJXEdjSDkLzDOIZQhtA==
X-Received: by 2002:a17:907:3f89:b0:aab:c35e:509b with SMTP id a640c23a62f3a-aac07afaf01mr41007666b.55.1734546852036;
        Wed, 18 Dec 2024 10:34:12 -0800 (PST)
Received: from localhost.localdomain (ipb21b247d.dynamic.kabel-deutschland.de. [178.27.36.125])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-aab9638ec53sm583873366b.156.2024.12.18.10.34.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Dec 2024 10:34:11 -0800 (PST)
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
Subject: [PATCH v11 2/3] dt-bindings: leds: Add LED1202 LED Controller
Date: Wed, 18 Dec 2024 18:33:58 +0000
Message-Id: <20241218183401.41687-3-vicentiu.galanopulo@remote-tech.co.uk>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20241218183401.41687-1-vicentiu.galanopulo@remote-tech.co.uk>
References: <20241218183401.41687-1-vicentiu.galanopulo@remote-tech.co.uk>
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

