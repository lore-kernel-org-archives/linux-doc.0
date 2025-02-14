Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 586AE263C86
	for <linux-doc@vger.kernel.org>; Fri, 14 Feb 2025 12:23:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739535798; cv=none; b=gzOxnT5MegStlGj0sYyhvSDqVNu1VJ7OD3RXThloCIWTLNZQjRSj2iuvMCHUe9zFzXknacdeomxw/Z7ZbgZXbwpSWQZy26NB/3dP2LOBern5nt89Nb95W/pgDVKhwHqjvjnbTDxz4DC+XQ55oRcYUvYBCen8VpHkUtbGn8TyQYc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739535798; c=relaxed/simple;
	bh=GZiQ6zwLnj9czKKnGwp69ohjckNVfoQP2zmeBSWPev8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=KpRzUHVHIpR4+7hG+coEhDpPDf804NHQqLqcE8zPuS9Tmqbs71Ypvzsy1K2zz9/LPqxkamQQa3wOnBq0BES79CP3/QRu/9dCAFvmJfJdiHpmdWCayVdUuFhd+QWXssx049RWPy+OyKsgKNz+h+YbMjgRH76sN99z9ddrYiL0scI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b=c9INqQ8E; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre-com.20230601.gappssmtp.com header.i=@baylibre-com.20230601.gappssmtp.com header.b="c9INqQ8E"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-4396740abe9so4549365e9.1
        for <linux-doc@vger.kernel.org>; Fri, 14 Feb 2025 04:23:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre-com.20230601.gappssmtp.com; s=20230601; t=1739535795; x=1740140595; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=fm3SdUr+XcDlqAYhLCX7VaMzzxMU+2eGpj/VQCDpL2c=;
        b=c9INqQ8EMECrE/uzzfiffuljT6tpaFvIjHluodQcowUiKNWxXq2B9E68gQEw7/Q6k2
         9zAa4uJEKwxyTzUixB+3MDzn0mK14RYo1uCC5+CljSuiOI1+G417MkN+xsccCwIHDMQX
         VM4Ki1qwhgIR3qMaYDEQMplqdYjEHHw+Dzga3U34/ZTTYY5fXnN3YvC/ksuRsS0KTQpQ
         dqCgWLrbUslypyrZtM55jr8uuK8iw8bpDe+S3xrxEpCU0qrhecW6scvFHA6elo2n7pUc
         3249hsaYDTeUy/c5xc1gDL7iqvLolEjCZw43ihatnzLZwLL2PC+pcFdBxXsGXMg7gO2L
         8n2A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739535795; x=1740140595;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fm3SdUr+XcDlqAYhLCX7VaMzzxMU+2eGpj/VQCDpL2c=;
        b=HkYgjibJSiLZaUUUNsULs4JH6nT2cqKh7+9lS8Jz4g+WwC7FyKzvvrwrdlk0yH7bye
         YWHHBguzBMCNpd4K6oPwjjOvrpDENmFOYCFvHNq52/rsXRd5QMek31BrntGX/WS4xlyD
         a1b6vnmmoOO34eYyYinLn9vmW0r3TGN0CfctyBehi7xJ6WQ/cx2xz0PQBuPIItO+r6OQ
         g0Itl93N+gKGIbO87XmWGe1Sbwt6f29O4rTMDiAwrYj8g5/Brg5minkw26fGLVf6wx3N
         xWSVI4Pw5eUbnM8vj0zoD1RHHSEVsBmy8vDrKL7siXJjMux1J7QAVVRc6ZwgJO7D7bpm
         CwtQ==
X-Forwarded-Encrypted: i=1; AJvYcCVXL4pZcwD53dZpKBJ7zCIhHqlki18BbExzamzrxoFemgJD2sU3LQCQzIdHRK7/KcHLeJnyvm1ALk4=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx1CkN24DeQ6bQWDv+7dr1bgnIJTQTkRAivu1OKcLb/MVGn30ah
	ZSTha8RH82bIijsZ8UB4RSdHMUU7qrq+tk0vvhA4BrtZhbAN5wZtTZWSRYn8big=
X-Gm-Gg: ASbGncueYtDNRfr/9VGorrSWqpnP0WEiuIHMThhIhXMzrJ8Z90ssAaHTJd8Bd47JewS
	8/xa7tmFaDIzwTDE3m5fNO7PekkhLz+9uGLuYUXrlhH4ffMJX7WV0YbSC1yWTUXlNJfYxEAFXY7
	8cyf2wdHtVElEcJjwxDvMbZ8C2OuKjRA0f8IK/N4fQJCfAbrr7OuiIDu380aNHmyMy5vbF7b4W4
	BP8NN2F9AXaEEZrrGuEE0zOQuQkNSXvW+jghyngCa5XahwUGNL/cx7lLEBK8a1e+ZFF41jFdaed
	r9iFGWWFd/d5wJfbwO+caIHTMaH4kEubXpj1MQUKt7aIxTTM7pW7Zx5DII9WYfaNrBURZOPa
X-Google-Smtp-Source: AGHT+IGwkq07676KTqyEaxNz9NvrlZsawD0WRNZ0jroOP1Gbp3SkUEhcQHH3b90tMjHwD3iIKtLR2A==
X-Received: by 2002:a05:600c:870a:b0:439:554e:70d4 with SMTP id 5b1f17b1804b1-439601694f2mr75256105e9.1.1739535794612;
        Fri, 14 Feb 2025 04:23:14 -0800 (PST)
Received: from [127.0.0.1] (amontpellier-556-1-148-206.w109-210.abo.wanadoo.fr. [109.210.4.206])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-38f259f7b68sm4424654f8f.85.2025.02.14.04.23.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 14 Feb 2025 04:23:14 -0800 (PST)
From: Esteban Blanc <eblanc@baylibre.com>
Date: Fri, 14 Feb 2025 13:22:31 +0100
Subject: [PATCH v4 1/6] dt-bindings: iio: adc: add ADI ad4030, ad4630 and
 ad4632
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250214-eblanc-ad4630_v1-v4-1-135dd66cab6a@baylibre.com>
References: <20250214-eblanc-ad4630_v1-v4-0-135dd66cab6a@baylibre.com>
In-Reply-To: <20250214-eblanc-ad4630_v1-v4-0-135dd66cab6a@baylibre.com>
To: Lars-Peter Clausen <lars@metafoo.de>, 
 Michael Hennerich <Michael.Hennerich@analog.com>, 
 =?utf-8?q?Nuno_S=C3=A1?= <nuno.sa@analog.com>, 
 Jonathan Cameron <jic23@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: Michael Hennerich <michael.hennerich@analog.com>, 
 linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Esteban Blanc <eblanc@baylibre.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.14.2

This adds a binding specification for the Analog Devices Inc. AD4030,
AD4630 and AD4632 families of ADCs.

- ad4030-24 is a 1 channel SAR ADC with 24 bits of precision and a
  sampling rate of 2M samples per second
- ad4032-24 is a 1 channel SAR ADC with 24 bits of precision and a
  sampling rate of 500K samples per second
- ad4630-16 is a 2 channels SAR ADC with 16 bits of precision and a
  sampling rate of 2M samples per second
- ad4630-24 is a 2 channels SAR ADC with 24 bits of precision and a
  sampling rate of 2M samples per second
- ad4632-16 is a 2 channels SAR ADC with 16 bits of precision and a
  sampling rate of 500K samples per second
- ad4632-24 is a 2 channels SAR ADC with 24 bits of precision and a
  sampling rate of 500K samples per second

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Esteban Blanc <eblanc@baylibre.com>
---
 .../devicetree/bindings/iio/adc/adi,ad4030.yaml    | 111 +++++++++++++++++++++
 MAINTAINERS                                        |   9 ++
 2 files changed, 120 insertions(+)

diff --git a/Documentation/devicetree/bindings/iio/adc/adi,ad4030.yaml b/Documentation/devicetree/bindings/iio/adc/adi,ad4030.yaml
new file mode 100644
index 0000000000000000000000000000000000000000..cef2dc1eefb9126f836794c742b9e471a847296a
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/adc/adi,ad4030.yaml
@@ -0,0 +1,111 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+# Copyright 2024 Analog Devices Inc.
+# Copyright 2024 BayLibre, SAS.
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/adc/adi,ad4030.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Analog Devices AD4030 and AD4630 ADC families
+
+maintainers:
+  - Michael Hennerich <michael.hennerich@analog.com>
+  - Nuno Sa <nuno.sa@analog.com>
+
+description: |
+  Analog Devices AD4030 single channel and AD4630/AD4632 dual channel precision
+  SAR ADC families
+
+  * https://www.analog.com/media/en/technical-documentation/data-sheets/ad4030-24-4032-24.pdf
+  * https://www.analog.com/media/en/technical-documentation/data-sheets/ad4630-24_ad4632-24.pdf
+  * https://www.analog.com/media/en/technical-documentation/data-sheets/ad4630-16-4632-16.pdf
+
+properties:
+  compatible:
+    enum:
+      - adi,ad4030-24
+      - adi,ad4032-24
+      - adi,ad4630-16
+      - adi,ad4630-24
+      - adi,ad4632-16
+      - adi,ad4632-24
+
+  reg:
+    maxItems: 1
+
+  spi-max-frequency:
+    maximum: 102040816
+
+  spi-rx-bus-width:
+    enum: [1, 2, 4]
+
+  vdd-5v-supply: true
+  vdd-1v8-supply: true
+  vio-supply: true
+
+  ref-supply:
+    description:
+      Optional External unbuffered reference. Used when refin-supply is not
+      connected.
+
+  refin-supply:
+    description:
+      Internal buffered Reference. Used when ref-supply is not connected.
+
+  cnv-gpios:
+    description:
+      The Convert Input (CNV). It initiates the sampling conversions.
+    maxItems: 1
+
+  reset-gpios:
+    description:
+      The Reset Input (/RST). Used for asynchronous device reset.
+    maxItems: 1
+
+  interrupts:
+    description:
+      The BUSY pin is used to signal that the conversions results are available
+      to be transferred when in SPI Clocking Mode. This nodes should be
+      connected to an interrupt that is triggered when the BUSY line goes low.
+    maxItems: 1
+
+  interrupt-names:
+    const: busy
+
+required:
+  - compatible
+  - reg
+  - vdd-5v-supply
+  - vdd-1v8-supply
+  - vio-supply
+  - cnv-gpios
+
+oneOf:
+  - required:
+      - ref-supply
+  - required:
+      - refin-supply
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/gpio/gpio.h>
+
+    spi {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        adc@0 {
+            compatible = "adi,ad4030-24";
+            reg = <0>;
+            spi-max-frequency = <80000000>;
+            vdd-5v-supply = <&supply_5V>;
+            vdd-1v8-supply = <&supply_1_8V>;
+            vio-supply = <&supply_1_8V>;
+            ref-supply = <&supply_5V>;
+            cnv-gpios = <&gpio0 0 GPIO_ACTIVE_HIGH>;
+            reset-gpios = <&gpio0 1 GPIO_ACTIVE_LOW>;
+        };
+    };
+
diff --git a/MAINTAINERS b/MAINTAINERS
index 25c86f47353de25c88291cc7fd6c4e9bfb12d5c4..f0c7aa6d744040ba530917b566ca68087a49492f 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -1306,6 +1306,15 @@ F:	Documentation/devicetree/bindings/iio/adc/adi,ad4000.yaml
 F:	Documentation/iio/ad4000.rst
 F:	drivers/iio/adc/ad4000.c
 
+AD4030 ADC DRIVER (AD4030-24/AD4630-16/AD4630-24/AD4632-16/AD4632-24)
+M:	Michael Hennerich <michael.hennerich@analog.com>
+M:	Nuno Sá <nuno.sa@analog.com>
+R:	Esteban Blanc <eblanc@baylibre.com>
+L:	linux-iio@vger.kernel.org
+S:	Supported
+W:	https://ez.analog.com/linux-software-drivers
+F:	Documentation/devicetree/bindings/iio/adc/adi,ad4030.yaml
+
 ANALOG DEVICES INC AD4130 DRIVER
 M:	Cosmin Tanislav <cosmin.tanislav@analog.com>
 L:	linux-iio@vger.kernel.org

-- 
2.47.2

