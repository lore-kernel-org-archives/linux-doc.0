Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BBE75199249
	for <linux-doc@vger.kernel.org>; Wed, 23 Oct 2024 09:19:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729675186; cv=none; b=uNZHwJNkGK/BcMSAgHwti+5Rae7kJzUVbLvxSHEhLJThzWwqyGW02MDkEBSBh1lHpSL7AUEl4ZCqxJ6F5AFdaJAj3vaSKwI2BNwY7K0bZJYq5e0o1pt4B39tju6T1dAk1mkn9kdvIoOnvkotdppPY8918aKJQsRZEBU7WTEYCqI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729675186; c=relaxed/simple;
	bh=71SFQ7URbRm1unU+yOo+bsXksMKw0BZgy2kSE2RSd6w=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=O7WKlnjLvGcNuXDGSUWLwqgiQXMfLB3bQrhYEcAmWg1500B+Oa+gSG14Gyg2rRmeNLcqh0O4BpBVDsU3lzPlV5vB7sw7m/ZWe+WNcz3TjChamROIb06RgVfyMrjDC678NdrOU6QcZS1sn1heW3z1U2iPXjP6csYR5ylNkcqnfgk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=zM0MFb4H; arc=none smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="zM0MFb4H"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-37d4d1b48f3so4756265f8f.1
        for <linux-doc@vger.kernel.org>; Wed, 23 Oct 2024 02:19:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1729675183; x=1730279983; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=920ffWWvUWDGbBU56/ZZKeI4adOcPBv24vNwmVJoAN4=;
        b=zM0MFb4H9fBppw7eZfX4UAXCqC/xpgVo98XzEV5FeoW6FwqAsgsyNmUulLf+EVxiCc
         cNnKw/EKIi5bL5gUwScQjQrDiO9Y5lRb2fIcLjm1QK6sDjPSvU2vMprCOFjrzxacKbFx
         5opONSyDuuZwm12e2Ut6OF3nPWdX4aoGb7+VsgEzuGbJPslWQu926nr9Us8H1Inf/OPG
         lNxqmqBgIOmuyGGdlfKmgbbJpiB4w/LE5aEkUdHzOLkdxJrakYl+6AMFoemMpkq4k0MG
         ArMPm3gkrp7WG/UyjJQABCDsCUHhRU/YVBy1fGc1aoks9jH+HsaPyVTvErn43kAJHNnI
         eKpw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1729675183; x=1730279983;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=920ffWWvUWDGbBU56/ZZKeI4adOcPBv24vNwmVJoAN4=;
        b=jJueUn1spkmzoTcBU9UVrjVt9fP3jAN6t79K8YBDXUa7D0y/HwhBi7PdODvkZnZ/P8
         DuFcrl20lfMbMBA89eCwkz4or3p4PzArcz7hHDGH+F+CVDnPV4QdsomsvNU7EGcrVJSG
         LTYH23HB5rCK/i+jeT9OHvNqHzS7sq5qFX5Mj3psNJjrHOWVDo0EStkyrR9VHMXSLW9m
         4fut5fiZNAh1Kl19w/zFrr3XANVPe202nBoQlTsQ3kR+2tAsjaDwoy5jlrfc5RNGseBa
         V7MDA6H5vx5gkBZTQ4zEqRzyG3GpQuE1mebQShp4MTJ36SCikhGKi4CtkyKKRuBWKwZQ
         Bf3g==
X-Forwarded-Encrypted: i=1; AJvYcCXw7xamBVCIhEUMt44YGo1xaEsY/jir50CPSpHkpgAQ19Kjz3xdjDN+4iEKdD6Su6XcRs4BWb4ZHLQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz5CL8bVP/3L/vTUb9e1993wFx0SyZMmtJvrjbMsHUGk0RIYnbF
	Xa3hryePTpFX8+fe2bEXv2BQFA97J/jA5L6uiQFatEw4ykUGD1nZjhO2PZz29XA=
X-Google-Smtp-Source: AGHT+IH0jz7mpDLs/+ZuOO4mKfYMLL4LeUUNinNhp/bMdj9LMhJOzXhq9AHgvCKl8rFH7mcBjviykw==
X-Received: by 2002:adf:f58e:0:b0:37d:39aa:b9f4 with SMTP id ffacd0b85a97d-37efcf1a775mr1188313f8f.26.1729675182928;
        Wed, 23 Oct 2024 02:19:42 -0700 (PDT)
Received: from [192.168.1.62] (2a02-842a-d52e-6101-6f8f-5617-c4b6-8627.rev.sfr.net. [2a02:842a:d52e:6101:6f8f:5617:c4b6:8627])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-37ee0b94363sm8515796f8f.73.2024.10.23.02.19.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 23 Oct 2024 02:19:42 -0700 (PDT)
From: Julien Stephan <jstephan@baylibre.com>
Date: Wed, 23 Oct 2024 11:19:33 +0200
Subject: [PATCH v2 1/4] dt-bindings: iio: adc: ad7380: add adaq4370-4 and
 adaq4380-4 compatible parts
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241023-ad7380-add-adaq4380-4-support-v2-1-d55faea3bedf@baylibre.com>
References: <20241023-ad7380-add-adaq4380-4-support-v2-0-d55faea3bedf@baylibre.com>
In-Reply-To: <20241023-ad7380-add-adaq4380-4-support-v2-0-d55faea3bedf@baylibre.com>
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 David Lechner <dlechner@baylibre.com>, Jonathan Cameron <jic23@kernel.org>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Julien Stephan <jstephan@baylibre.com>
X-Mailer: b4 0.14.2

adaq4370-4 (2MSPS) and adaq4380-4 (4MSPS) are quad-channel precision data
acquisition signal chain μModule solutions compatible with the ad738x
family, with the following differences:

- pin selectable gain in front of each 4 adc
- internal reference is 3V derived from refin-supply (5V)
- additional supplies

To select the gain a new patternProperties is added to describe each
channel. It is restricted to adaq devices.

Signed-off-by: Julien Stephan <jstephan@baylibre.com>
---
 .../devicetree/bindings/iio/adc/adi,ad7380.yaml    | 121 +++++++++++++++++++++
 1 file changed, 121 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad7380.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad7380.yaml
index 0065d650882489e21b952bb9fb25f1e3a070ee68..d5eaa2d667eb4310daf0d35e85216363c14956da 100644
--- a/Documentation/devicetree/bindings/iio/adc/adi,ad7380.yaml
+++ b/Documentation/devicetree/bindings/iio/adc/adi,ad7380.yaml
@@ -25,6 +25,8 @@ description: |
   * https://www.analog.com/en/products/ad7386-4.html
   * https://www.analog.com/en/products/ad7387-4.html
   * https://www.analog.com/en/products/ad7388-4.html
+  * https://www.analog.com/en/products/adaq4370-4.html
+  * https://www.analog.com/en/products/adaq4380-4.html
 
 
 $ref: /schemas/spi/spi-peripheral-props.yaml#
@@ -46,6 +48,8 @@ properties:
       - adi,ad7386-4
       - adi,ad7387-4
       - adi,ad7388-4
+      - adi,adaq4370-4
+      - adi,adaq4380-4
 
   reg:
     maxItems: 1
@@ -70,6 +74,20 @@ properties:
   refin-supply:
     description:
       A 2.5V to 3.3V supply for external reference voltage, for ad7380-4 only.
+      For adaq devices, a 5V supply voltage. A 3.3V internal reference is
+      derived from it. Connect to vs-p-supply for normal operation.
+
+  vs-p-supply:
+    description:
+      Amplifiers positive supply.
+
+  vs-n-supply:
+    description:
+      Amplifiers negative supply.
+
+  ldo-supply:
+    description:
+      LDO supply. Connect to vs-p-supply or a 3.6 to 5.5 V supply.
 
   aina-supply:
     description:
@@ -97,12 +115,46 @@ properties:
       specify the ALERT interrupt.
     maxItems: 1
 
+  '#address-cells':
+    const: 1
+
+  '#size-cells':
+    const: 0
+
 required:
   - compatible
   - reg
   - vcc-supply
   - vlogic-supply
 
+patternProperties:
+  "^channel@([0-3])$":
+    $ref: adc.yaml
+    type: object
+
+    properties:
+      reg:
+        description:
+          The channel number. From 0 to 3 corresponding to channels A,B,C,D
+        items:
+          minimum: 0
+          maximum: 3
+
+      adi,gain-milli:
+        description:
+          The hardware gain applied to the ADC input (in milli units).
+          If not present, default to 1000 (no actual gain applied).
+          Refer to the typical connection diagrams section of the datasheet for
+          pin wiring.
+        $ref: /schemas/types.yaml#/definitions/uint16
+        enum: [300, 600, 1000, 1600]
+        default: 1000
+
+    required:
+      - reg
+
+    additionalProperties: false
+
 unevaluatedProperties: false
 
 allOf:
@@ -140,6 +192,7 @@ allOf:
         aind-supply: false
 
   # ad7380-4 uses refin-supply as external reference.
+  # adaq devices use internal reference only, derived from refin-supply
   # All other chips from ad738x family use refio as optional external reference.
   # When refio-supply is omitted, internal reference is used.
   - if:
@@ -147,6 +200,8 @@ allOf:
         compatible:
           enum:
             - adi,ad7380-4
+            - adi,adaq4370-4
+            - adi,adaq4380-4
     then:
       properties:
         refio-supply: false
@@ -156,6 +211,27 @@ allOf:
       properties:
         refin-supply: false
 
+  # adaq devices need more supplies and using channel to declare gain property
+  # only applies to adaq devices
+  - if:
+      properties:
+        compatible:
+          enum:
+            - adi,adaq4370-4
+            - adi,adaq4380-4
+    then:
+      required:
+        - vs-p-supply
+        - vs-n-supply
+        - ldo-supply
+    else:
+      properties:
+        vs-p-supply: false
+        vs-n-supply: false
+        ldo-supply: false
+      patternProperties:
+        "^channel@([0-3])$": false
+
 examples:
   - |
     #include <dt-bindings/interrupt-controller/irq.h>
@@ -180,3 +256,48 @@ examples:
             refio-supply = <&supply_2_5V>;
         };
     };
+
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        adc@0 {
+            compatible = "adi,adaq4380-4";
+            reg = <0>;
+
+            spi-cpol;
+            spi-cpha;
+            spi-max-frequency = <80000000>;
+
+            interrupts = <27 IRQ_TYPE_EDGE_FALLING>;
+            interrupt-parent = <&gpio0>;
+
+            vcc-supply = <&supply_3_3V>;
+            vlogic-supply = <&supply_3_3V>;
+            refin-supply = <&supply_5V>;
+            vs-p-supply = <&supply_5V>;
+            vs-n-supply = <&supply_0V>;
+            ldo-supply = <&supply_5V>;
+
+            #address-cells = <1>;
+            #size-cells = <0>;
+
+            channel@0 {
+                reg = <0>;
+                adi,gain-milli = /bits/ 16 <300>;
+            };
+
+            channel@2 {
+                reg = <2>;
+                adi,gain-milli = /bits/ 16 <600>;
+            };
+
+            channel@3 {
+                reg = <3>;
+                adi,gain-milli = /bits/ 16 <1000>;
+            };
+        };
+    };

-- 
2.47.0

