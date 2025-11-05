Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 35AFF28488F
	for <linux-doc@vger.kernel.org>; Wed,  5 Nov 2025 20:14:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762373658; cv=none; b=WscMfxl3b3v1nhiwxf9ehIeYM52yNSGAlkYwhty2ctDjveE+mjtqUBUCtxBHZGrYJ7sf0laYhCwFmF7o61yLMXNjUd+gDq3gDSCDoSitZGR6BDU1Vm8kO7j8J0f2zKgsH9hdm8SWl9aFMiESGiPuHDk7yb6V1MBpxKZfsWgJNRE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762373658; c=relaxed/simple;
	bh=Ykvay+KbmIz4mfBpsW6reUfGaWR/oBY1ov+y0XO0Gi4=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=l/BA4sD+tzo93Kl0i7KYDDPwlYh2mv3cFPepiR/LP566tBK1aK156E16nuDXx1hoNhkxfGwDf3YVIFXmhA/LmAavbUO5aUTWJmzM+g9HjJE5tw5EqUe+jbtiGu44ER2JTEGlyGHOV/P+1NzeQvD3ATWzePy+YkgTCmuOwg2Grn4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net; spf=none smtp.mailfrom=dpplabs.com; dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b=anF113TB; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dpplabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b="anF113TB"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-295548467c7so2668595ad.2
        for <linux-doc@vger.kernel.org>; Wed, 05 Nov 2025 12:14:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=reznichenko.net; s=google; t=1762373655; x=1762978455; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=M5UUjWOJCMb12I/BWzOWhp+eaG/l4rBJ5tx7KBsTma4=;
        b=anF113TBFdGCwBVy4exG+TjYZ8rzr6yppxd3TG4JUruavX8aRpZ5242FhEBoqvf9eQ
         iGRYFsr2GH9kpaZ1sCVXbQ1tZ/J8PBcpnjqN288VE7MxZY9J+ObQRdbBEjyj0E5rlZjx
         +YUtHGeTfnBNifJ3br6/rTX4suogwBQwF9YCMwRJc05La/D0un4fR42+XlbejBslkXm0
         CDxch6lWoPqKR7rpS5HyZmtwAOVAhGoBIvy66bJYdIGCW6gz3YUvIcpCCTPyvfNPh0ZC
         Hyg5Ge6AYsgTL9UWDwBvhkt0DDuXi1Aee+dqlfXqh1bPOsGjvo6eanPsCYc+F1q0i48o
         QOCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762373655; x=1762978455;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=M5UUjWOJCMb12I/BWzOWhp+eaG/l4rBJ5tx7KBsTma4=;
        b=JmXdOS1E8onwCAucpJah3meLol57N3B+MXljUi41VVZ1r9WpxEYq6bzPNrB9de7xOx
         ha/PuOFs8KyNZOXc9T6bNgHe/A24PUhSamv1adBsZvwRpn8GU14aZIEA608rDI56Vf1W
         MUbDU5f+4EIR8Sd5+fKaLNr+gTtI7sNUApl+MJ05CWG1MMuaDGfkQwkTWmxKd7NqUQSF
         Trx71Wm8qj4J6vGlZAogDKv8URdBChff8a9NC5FmE+8hDgEQfqF4i5qdvK9klwhA1XsR
         2ZKLj2JRpCGvuwCiNQok928qMqCRajBBZrHO59Pi555lKGH8cIepZJ0W1cbm6xWDMY79
         K+lw==
X-Forwarded-Encrypted: i=1; AJvYcCWt29Xi2RgSzdKbHK5h+ojgTukoRRc1e2a23U2wK9v0Guqcv6ir5FKxtKvOkqXWSllE3RFMq1cn0HM=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAWnalWaHCRmpehrRVaAnEN2O2DPMtnksFLb8U45D4+F41M6d2
	eyH5eaxAyEcsoTdbimmr6dFaW5GB8hUK64/6J/VmUWkudGXe8utvELlJlKVKZ83rhQ4=
X-Gm-Gg: ASbGncs0CaIuDWb4wJ+WC7iA+F7mos9obJtM8SOWQQ7zl2zw8Tey4nId+FqNQS5OtR+
	bLrQLEZGDzD461w+BupF7kHZ7wy9/r5qsbe6QFqE5hLIw1OR9jn38od2CC2G4DvJZJSF2Pp2hXu
	XVj2lgIOoaWhQqgz6vCUE8BJeT6rtiZFHBgWO0/dJZ6wspkyEqnZNZbwtqRJ3r736xwrP1ib82M
	ZI9W10iJNeoMxmFiVcw3z7IYtCPIom7z76GxzFqQ7D8KMUOCKgv8Ud2Xsg4U2kcN2pCdv9G92II
	2gr9YwEkP5RU+CqicAql0A9B4aykh7LwX9gxMhCWIcjMrz0se5ej+ZSR+zqV9o7xpgXfbrqv+MU
	heom9wA9UREcvU1Fmr2tYWQh5RXkqpQsYGZs55KUFEmo7V4ANgyvlK/Y62hxzRikd6FESGW+0uK
	vlKRANqoY=
X-Google-Smtp-Source: AGHT+IFsZQ3ivEoCdxUegpplY25ctIsfGAFJ5rAU93tEd/MzTCmdN2ztCF+pwuYG4rHstc9J65so6Q==
X-Received: by 2002:a17:902:d2c6:b0:295:1e92:6b6d with SMTP id d9443c01a7336-2962adb2866mr67889775ad.46.1762373655002;
        Wed, 05 Nov 2025 12:14:15 -0800 (PST)
Received: from z440.. ([2601:1c0:4502:2d00:3099:85d6:dec7:dbe0])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2965096b8ddsm4039435ad.5.2025.11.05.12.14.14
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Nov 2025 12:14:14 -0800 (PST)
From: Igor Reznichenko <igor@reznichenko.net>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net
Cc: david.hunter.linux@gmail.com,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org
Subject: [PATCH v4 1/2] dt-bindings: hwmon: ST TSC1641 power monitor
Date: Wed,  5 Nov 2025 12:14:05 -0800
Message-ID: <20251105201406.1210856-2-igor@reznichenko.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251105201406.1210856-1-igor@reznichenko.net>
References: <20251105201406.1210856-1-igor@reznichenko.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add binding for the TSC1641 I2C power monitor.

Signed-off-by: Igor Reznichenko <igor@reznichenko.net>
---
 .../devicetree/bindings/hwmon/st,tsc1641.yaml | 63 +++++++++++++++++++
 1 file changed, 63 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/st,tsc1641.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/st,tsc1641.yaml b/Documentation/devicetree/bindings/hwmon/st,tsc1641.yaml
new file mode 100644
index 000000000000..aaf244790663
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/st,tsc1641.yaml
@@ -0,0 +1,63 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/st,tsc1641.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ST Microelectronics TSC1641 I2C power monitor
+
+maintainers:
+  - Igor Reznichenko <igor@reznichenko.net>
+
+description: |
+  TSC1641 is a 60 V, 16-bit high-precision power monitor with I2C and
+  MIPI I3C interface
+
+  Datasheets:
+    https://www.st.com/resource/en/datasheet/tsc1641.pdf
+
+properties:
+  compatible:
+    const: st,tsc1641
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    description: Optional alert interrupt.
+    maxItems: 1
+
+  shunt-resistor-micro-ohms:
+    description: Shunt resistor value in micro-ohms. Since device has internal
+      16-bit RSHUNT register with 10 uOhm LSB, the maximum value is capped at
+      655.35 mOhm.
+    minimum: 100
+    default: 1000
+    maximum: 655350
+
+  st,alert-polarity-active-high:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: Default value is 0 which configures the normal polarity of the
+      ALERT pin, being active low open-drain. Setting this to 1 configures the
+      polarity of the ALERT pin to be inverted and active high open-drain.
+      Specify this property to set the alert polarity to active-high.
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        power-sensor@40 {
+            compatible = "st,tsc1641";
+            reg = <0x40>;
+            shunt-resistor-micro-ohms = <1000>;
+            st,alert-polarity-active-high;
+        };
+    };
-- 
2.43.0

