Received: from mail-pl1-f182.google.com (mail-pl1-f182.google.com [209.85.214.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 813F530594A
	for <linux-doc@vger.kernel.org>; Wed, 12 Nov 2025 11:17:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762946273; cv=none; b=W+krY503jXwmCd6CZF7cqEI61YxGRLImaj8VDNpb6MSk99od1Ov+Wt58G5fbCRTKWdEbMpulU5p252d8+QJfMtxPQ7PSG9WrZ7zng7/gB8Th1rCTypOpepHxiYjSW3kJpmJ9kEVeLFbb+HapoPbvsQ27k3KHtT0jcjgYSX2rp4c=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762946273; c=relaxed/simple;
	bh=Og+R248Mw+N/x4bdlpMygoz9hBtddXEvmLkGHdBckw8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BZnfb8yZ6RLcowHTQMiZqZgMO8gXhPyBpSi4MWepkNPWmY8mncvToF0T7y8aUo1PwThMsjNixqkq1j1KYqPJet/air8vJh5W8FcV7RoHyA7VsDrR0kQ3R4mAIJQRJjx2Y8veqx33/6Z/lrmPi/0FUokkARWRrT6z/YOc9wUjC2w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=G11dZuTM; arc=none smtp.client-ip=209.85.214.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="G11dZuTM"
Received: by mail-pl1-f182.google.com with SMTP id d9443c01a7336-29808a9a96aso6867365ad.1
        for <linux-doc@vger.kernel.org>; Wed, 12 Nov 2025 03:17:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1762946270; x=1763551070; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EcQKV8dklg9rY1tNFTyIjTMJUni5UotcTYsuT0Sfofc=;
        b=G11dZuTMeTVQsvtAmiUhZkH3qL+fajWdORzQUbNYf1bSsOl369TJb5InK0PziPN/PH
         3Elxk6hTL6Jgk4NmjD8FU/uTLr4xNbDtUqCoZDkelS1QCEeWLY4hlpIOANQbOZ1E8fYS
         iIUg2VtDWk5ZCdYxvRnGPAKOKgXUwcibmSsrOpymoOZHc3zkJwqeSzhoLgw0Npg10TJ5
         IiKHzHnawdGjk5ACIyHHuHseanCYlZectPHplPddenLfBgEGlM7aDYe5y9WQumt2SZSE
         EipBPaQjqi1RkSmZ3k+np+tjUzKVH5SRiH92gsdzuaNxBhjC7CZSVXZaTudBHlrzC9Dl
         ekDA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762946270; x=1763551070;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=EcQKV8dklg9rY1tNFTyIjTMJUni5UotcTYsuT0Sfofc=;
        b=BT6kxP6watK+tz+EyHZe5EUGArJWYM4ccYomgtud8OdH9cZBkFULXFK3WxS5vZALgj
         JZHA/uCFCgXK6LVVyFvFXm3lT+OQ+tcRuwDMSQiKyqxD5ZAA8p3R4GTSJ21bohC2Iwx7
         MedVQRL0sENfBA5QXJ+KTimeWA6Lpz1awfghy1t05kQrU/2QBdxpMUIjs5OXQJQ74ebK
         QGZyIjd7MQ3e/4V9zeiWsmMxdjsKTo+YQXxg8qUciA2cT6oSm4xWDBWBcsOGl60XjZtW
         c6JIH0KpwPkbSSAaK2kC1AqYZ8o1dhE4X90p82Ezq6iZkjjCjNeblJijBjTCH9QSM1Ai
         PrnQ==
X-Forwarded-Encrypted: i=1; AJvYcCV0Rx9VH0zYD4YzuCqQKn8VTpShLnrofx9iN5P5kksyF6OLhtHN6c5gxlL7kipH1gSV4Icc+aM13m0=@vger.kernel.org
X-Gm-Message-State: AOJu0YxkE0Fyf7EYgt4SeLen5wCni7Mr3ydsUh1Mp2/Yjfsq8nkr+QpM
	8bft1AchjJ9SujQB+xhw0i7obFUzK6Va87lK7LJm7v5WG281EgtNlStH
X-Gm-Gg: ASbGncvAhKGRS8lQ48V6SkubtOhMEOV5H30JywkkHv+43P+95W7ZGgwiSDb/Kise40j
	0cPPQ7In3Kexcg6FX9iR75DeBxM2CTHYYCQyyQTeBQfwgBZVMAsM7UM5zxynd19SyuclHYWoyb3
	HZzqcTCH+Ys3lk8LVsDSpn0oxYaGWTE+D+9znnqIArHA5PBM/bLu9E2WQ9HKfPpCszYPUz/Qcl6
	lLxxgpsUiW0arCdm1h9aa9A1fYzgJwFQY1KMdisV7LR0zdZIIJ10co1Hv1VPyviG2Cv3tiMzhfB
	xxQGbGFSMPPGWjyHrF5SCfWRnjhKY/NRUsAbz2e/ec8y+dQuZysw9NEoTw8DfBv/xUKUXfAdDfs
	FcFLmD/khIxcRfZBjhoxKfnBHMyz5wXkgNVNJA79uaO7gSNBdCWpqhvTk2Iy4XT1JUjUYIKYxVo
	vQQqq8naEr2/g1epzD5JEH+k5KiTER0SPmd/zb0QB5otP7VOuwZVDYHaMeRk+PljvoXFQqD6KdI
	NFWSBO8CiBs+/iUdHpyz8T23bqPKR8zG/4eg67ZOosPSdIE2ExWKw4=
X-Google-Smtp-Source: AGHT+IEXmYK5Jd6abgmEKislEs51qPiJZZI8VNvYAfzYqeue6GeNd3Jr4Tt22dAg51SwyR7UXd8g9A==
X-Received: by 2002:a17:903:988:b0:298:5599:3ab0 with SMTP id d9443c01a7336-29855993c04mr5637195ad.16.1762946269736;
        Wed, 12 Nov 2025 03:17:49 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2984dca0f28sm27386695ad.60.2025.11.12.03.17.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 12 Nov 2025 03:17:49 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Wed, 12 Nov 2025 21:16:48 +1000
Subject: [PATCH v5 02/11] dt-bindings: hwmon: Add Apple System Management
 Controller hwmon schema
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251112-macsmc-subdevs-v5-2-728e4b91fe81@gmail.com>
References: <20251112-macsmc-subdevs-v5-0-728e4b91fe81@gmail.com>
In-Reply-To: <20251112-macsmc-subdevs-v5-0-728e4b91fe81@gmail.com>
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
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6691;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=Og+R248Mw+N/x4bdlpMygoz9hBtddXEvmLkGHdBckw8=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJkiOUcq327e6qDKYjd1f5/N1//5M2TPPpi34eCd1B3BV
 SGMRz7ZdUxkYRDjYrAUU2TZ0CTkMduI7Wa/SOVemDmsTCBDpEUaGICAhYEvNzGv1EjHSM9U21DP
 0FDHWMeIgYtTAKb6LxfDX7l3yuf5LWtbv7z78sJzr0akisWWxSfNO5dVvL/M+3r3JC5GhilGl9c
 5XGyQ/uax+qzWq8Yb2Z7/JGfM2vOz6WD94l33ihkA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

Apple Silicon devices integrate a vast array of sensors, monitoring
current, power, temperature, and voltage across almost every part of
the system. The sensors themselves are all connected to the System
Management Controller (SMC). The SMC firmware exposes the data
reported by these sensors via its standard FourCC-based key-value
API. The SMC is also responsible for monitoring and controlling any
fans connected to the system, exposing them in the same way.

For reasons known only to Apple, each device exposes its sensors with
an almost totally unique set of keys. This is true even for devices
which share an SoC. An M1 Mac mini, for example, will report its core
temperatures on different keys to an M1 MacBook Pro. Worse still, the
SMC does not provide a way to enumerate the available keys at runtime,
nor do the keys follow any sort of reasonable or consistent naming
rules that could be used to deduce their purpose. We must therefore
know which keys are present on any given device, and which function
they serve, ahead of time.

Add a schema so that we can describe the available sensors for a given
Apple Silicon device in the Devicetree.

Reviewed-by: Neal Gompa <neal@gompa.dev>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/hwmon/apple,smc-hwmon.yaml  | 86 +++++++++++++++++++++++++
 .../bindings/mfd/apple,smc.yaml          | 36 +++++++++++
 MAINTAINERS                              |  1 +
 3 files changed, 123 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/apple,smc-hwmon.yaml b/Documentation/devicetree/bindings/hwmon/apple,smc-hwmon.yaml
new file mode 100644
index 000000000000..2eec317bc4b3
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/apple,smc-hwmon.yaml
@@ -0,0 +1,86 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/apple,smc-hwmon.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple SMC Hardware Monitoring
+
+description:
+  Apple's System Management Controller (SMC) exposes a vast array of
+  hardware monitoring sensors, including temperature probes, current and
+  voltage sense, power meters, and fan speeds. It also provides endpoints
+  to manually control the speed of each fan individually. Each Apple
+  Silicon device exposes a different set of endpoints via SMC keys. This
+  is true even when two machines share an SoC. The CPU core temperature
+  sensor keys on an M1 Mac mini are different to those on an M1 MacBook
+  Pro, for example.
+
+maintainers:
+  - James Calligeros <jcalligeros99@gmail.com>
+
+$defs:
+  sensor:
+    type: object
+
+    properties:
+      apple,key-id:
+        $ref: /schemas/types.yaml#/definitions/string
+        pattern: "^[A-Za-z0-9]{4}$"
+        description: The SMC FourCC key of the desired sensor.
+          Must match the node's suffix.
+
+      label:
+        description: Human-readable name for the sensor
+
+    required:
+      - apple,key-id
+
+properties:
+  compatible:
+    const: apple,smc-hwmon
+
+patternProperties:
+  "^current-[A-Za-z0-9]{4}$":
+    $ref: "#/$defs/sensor"
+    unevaluatedProperties: false
+
+  "^fan-[A-Za-z0-9]{4}$":
+    $ref: "#/$defs/sensor"
+    unevaluatedProperties: false
+
+    properties:
+      apple,fan-minimum:
+        $ref: /schemas/types.yaml#/definitions/string
+        pattern: "^[A-Za-z0-9]{4}$"
+        description: SMC key containing the fan's minimum speed
+
+      apple,fan-maximum:
+        $ref: /schemas/types.yaml#/definitions/string
+        pattern: "^[A-Za-z0-9]{4}$"
+        description: SMC key containing the fan's maximum speed
+
+      apple,fan-target:
+        $ref: /schemas/types.yaml#/definitions/string
+        pattern: "^[A-Za-z0-9]{4}$"
+        description: Writeable endpoint for setting desired fan speed
+
+      apple,fan-mode:
+        $ref: /schemas/types.yaml#/definitions/string
+        pattern: "^[A-Za-z0-9]{4}$"
+        description: Writeable key to enable/disable manual fan control
+
+
+  "^power-[A-Za-z0-9]{4}$":
+    $ref: "#/$defs/sensor"
+    unevaluatedProperties: false
+
+  "^temperature-[A-Za-z0-9]{4}$":
+    $ref: "#/$defs/sensor"
+    unevaluatedProperties: false
+
+  "^voltage-[A-Za-z0-9]{4}$":
+    $ref: "#/$defs/sensor"
+    unevaluatedProperties: false
+
+additionalProperties: false
diff --git a/Documentation/devicetree/bindings/mfd/apple,smc.yaml b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
index 0410e712c900..34ce048619f5 100644
--- a/Documentation/devicetree/bindings/mfd/apple,smc.yaml
+++ b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
@@ -49,6 +49,9 @@ properties:
   rtc:
     $ref: /schemas/rtc/apple,smc-rtc.yaml
 
+  hwmon:
+    $ref: /schemas/hwmon/apple,smc-hwmon.yaml
+
 additionalProperties: false
 
 required:
@@ -89,5 +92,38 @@ examples:
           nvmem-cells = <&rtc_offset>;
           nvmem-cell-names = "rtc_offset";
        };
+
+        hwmon {
+          compatible = "apple,smc-hwmon";
+
+          current-ID0R {
+            apple,key-id = "ID0R";
+            label = "AC Input Current";
+          };
+
+          fan-F0Ac {
+            apple,key-id = "F0Ac";
+            apple,fan-minimum = "F0Mn";
+            apple,fan-maximum = "F0Mx";
+            apple,fan-target = "F0Tg";
+            apple,fan-mode = "F0Md";
+            label = "Fan 1";
+          };
+
+          power-PSTR {
+            apple,key-id = "PSTR";
+            label = "Total System Power";
+          };
+
+          temperature-TW0P {
+            apple,key-id = "TW0P";
+            label = "WiFi/BT Module Temperature";
+          };
+
+          voltage-VD0R {
+            apple,key-id = "VD0R";
+            label = "AC Input Voltage";
+          };
+        };
       };
     };
diff --git a/MAINTAINERS b/MAINTAINERS
index 51942a9a9b43..6e5e219c5fe6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2422,6 +2422,7 @@ F:	Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
 F:	Documentation/devicetree/bindings/dma/apple,admac.yaml
 F:	Documentation/devicetree/bindings/gpio/apple,smc-gpio.yaml
 F:	Documentation/devicetree/bindings/gpu/apple,agx.yaml
+F:	Documentation/devicetree/bindings/hwmon/apple,smc-hwmon.yaml
 F:	Documentation/devicetree/bindings/i2c/apple,i2c.yaml
 F:	Documentation/devicetree/bindings/input/touchscreen/apple,z2-multitouch.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/apple,*

-- 
2.51.2

