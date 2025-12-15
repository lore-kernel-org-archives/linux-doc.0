Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9EDDC314D2C
	for <linux-doc@vger.kernel.org>; Mon, 15 Dec 2025 09:38:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765791510; cv=none; b=qLDZuyAPskRkgbz+PhW2X1o01VHA4hsA+hQ9hLvH8Ac1CdpIjSK7sCOIGDcDaONWOYgk9BQbDH8ZkPkpPldcJPIoJKgp2IwYPvbcQMegTOSC8UPGk8+mKjUQMmKhxYnDS3cQl9bTLW64apEXxACp2aMFyOaIlj4HacBncbWpnf0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765791510; c=relaxed/simple;
	bh=1YhAJ71JAqllcUxuxUDlvMTFEA7zknc8xk9iFLWBSoc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=FbsUghZzZdEy8Hen/cDeVDem3sc6+t/ujYIxuPN+cG3YTmWAgLUS4nMH77yNXLACjFHnPIW5+IeXcVWSnax/ExC92/S8KzyRCH7JsHSwuUcm+BWfcnkWKLBPXdzJL/9iKsubnZ5m3b15vNFRfj+jW8z3QEoOYMziaiQPEZuViVY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AobHGnmi; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AobHGnmi"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2a0d0788adaso8576095ad.3
        for <linux-doc@vger.kernel.org>; Mon, 15 Dec 2025 01:38:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1765791507; x=1766396307; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bQd1CFACF7OPtngAk8oFYqrLhlc/9YnP6z76rt/UJmA=;
        b=AobHGnmioXoitrG6fhEdyUg0hyA+R2K1WgHGY6MGe21Fq9j0nr/t+Pcm7bE1xepc49
         Tiu2rFlJhUG06UPkQoyTJSWOqwFdVJhKElKeTrzFW/F1MZv+gpWLSaxdjukAvRmiykgV
         DDbTFe75eRbjM4zXzMIinBk5LtRc+C4bBVlxtZINvRrsA0C9MqcXG2oJJsKdbbMivw8H
         VFtNDid+rY6O3vHRw02sVWW1XKT4HOl7sv32B7sIO+ZByVZ50W6tt4VU3yUCbjzga2Jo
         qr1EKc7vbwDWKKcLDxkxBJujrTlvm8YSl0eDoo0QEAtH/Fv8BCUa7eGYutdXMshJYanR
         DJhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1765791507; x=1766396307;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=bQd1CFACF7OPtngAk8oFYqrLhlc/9YnP6z76rt/UJmA=;
        b=Z9qsfn9zogikKSdrj7gSzn8a7ryk0Eo74nxOrg2PbNn7W1KF6r+fcs4OHq/d2O/Dpu
         UGZNLqz8NLs2FIph7yOQkjgFTORMNlkJCKUA/IIKm8YOLdZOm7XZn6S1Ojc6DZEaj4QV
         BOkkbpweOKRJlRwVKxJCDMfb/aPHTlQ1xkF8FXgi6qi2P4w011oonb4LpeoKD+JVL6wv
         XsKCAmfOR2B6WzBX4nKcMlMTThonwmNKpsEqXZJ5Dt9Z3IlpzSxG1z7nUTiLERkdwT4u
         HGtK/2xslM0IiKhJTL3bug2dQpVLqgXFqwRMZ8TEzhBxvAJW9lZ4kIvlZm6EZerKRcu8
         3u6A==
X-Forwarded-Encrypted: i=1; AJvYcCXCInUZRcZ2VcB+VpVmorIYounWJrvheoEqxy5/2VamJHg0wj4AYPorVTrlfp5CC//pDLp+4GjxvDw=@vger.kernel.org
X-Gm-Message-State: AOJu0YzFCmaB+r3bxpOC5qQVuYZjb6r3iWhGqUw6DDXLY8mVILoQlCad
	uzi+9eonlL+0wKTA14ZOn4lze1gIO722AY3TnPo4fVbjuwMe8zgndBvT
X-Gm-Gg: AY/fxX5uwGsw10a4jam3MHQ0BFfSIgfsGL1WZ6vyV9FjTx22k2rQLcuF5wrQpYsnvn3
	NuHDtuROVzSReZYEd+UeGO8B6PZMky67HNO6qS5wWHD6OBhk/d3O9ZGnuTZIAz5sCsB7eiD2muf
	CFy2LLMo673+i0QBmsiyzzDaAEafAi69xrx9G1dDKHC7H62OKvKwrJG7FNsnt4navN2VeiyxkZB
	ckLLiuVtyUszxlQlBQZll0DWZPq2rGwB6Ulv0BADYeOCoYTQjAcrWuiqrPUa2LN4lEIUkHSE+oV
	gzp/uzvxu7/s2Jl0iJXfW0ecDxXDUAnAeLShebLdKb4kkRHgcaDO/VUcnNFO2WNIxsMKvzH2oJH
	GfSU9/E3wUbnCfJB8cNSnRnoCQAg61PfZ1REPLDVJ+1643LAHl0qTnU6mNu8fPcYpKubI2CxfUX
	5YubZtevgSzs8D4mqB3DOMRJ5GLWprrvua/AXrr3cpH3uindA3iibbmDHJ6gEkpMT72C8p2+4cC
	WKAfxJW2SByvaaroTDkIPBerN7AWv4MHwdg2PXmYVp8wjZRhhqOtllnUOitsJuZmq4Tog6a0/TN
	pxx13qksViooTv/KwB8jNZSJobqNLkVIGBgtH8fYkpFMNkg1FPE=
X-Google-Smtp-Source: AGHT+IHXjaO0kZdI0jvqgos1WrDuGav3uz9uPzrIQ/XBD2ij7oSPEGrTgf+//QBfvWQ0XjlmdCFENg==
X-Received: by 2002:a17:903:8cc:b0:297:f0a8:e84c with SMTP id d9443c01a7336-29f24386514mr104092335ad.52.1765791506920;
        Mon, 15 Dec 2025 01:38:26 -0800 (PST)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29efd74f5e1sm113017705ad.16.2025.12.15.01.38.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 15 Dec 2025 01:38:26 -0800 (PST)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Mon, 15 Dec 2025 19:37:45 +1000
Subject: [PATCH v6 1/7] dt-bindings: hwmon: Add Apple System Management
 Controller hwmon schema
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251215-macsmc-subdevs-v6-1-0518cb5f28ae@gmail.com>
References: <20251215-macsmc-subdevs-v6-0-0518cb5f28ae@gmail.com>
In-Reply-To: <20251215-macsmc-subdevs-v6-0-0518cb5f28ae@gmail.com>
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
 bh=1YhAJ71JAqllcUxuxUDlvMTFEA7zknc8xk9iFLWBSoc=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDJn215k3aCQdqL9kFX3Dy31+Ft+WOeXTaqtd8nmEOP86H
 /HtnbWgYyILgxgXg6WYIsuGJiGP2UZsN/tFKvfCzGFlAhkiLdLAAAQsDHy5iXmlRjpGeqbahnqG
 hjrGOkYMXJwCMNUKNowMk4t+dz4091c+cuxot3MQj18u2+Gtdsd3Xd+n2n6z5fcsTYZfTKHWRS7
 C/1s+CnecWs7h/1z69ebCX589Alx0pI46m9hxAQA=
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
index 5b11839cba9d..5f160eb6762e 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2458,6 +2458,7 @@ F:	Documentation/devicetree/bindings/cpufreq/apple,cluster-cpufreq.yaml
 F:	Documentation/devicetree/bindings/dma/apple,admac.yaml
 F:	Documentation/devicetree/bindings/gpio/apple,smc-gpio.yaml
 F:	Documentation/devicetree/bindings/gpu/apple,agx.yaml
+F:	Documentation/devicetree/bindings/hwmon/apple,smc-hwmon.yaml
 F:	Documentation/devicetree/bindings/i2c/apple,i2c.yaml
 F:	Documentation/devicetree/bindings/input/touchscreen/apple,z2-multitouch.yaml
 F:	Documentation/devicetree/bindings/interrupt-controller/apple,*

-- 
2.52.0

