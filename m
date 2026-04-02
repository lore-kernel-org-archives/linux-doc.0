Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9546D34CFAC
	for <linux-doc@vger.kernel.org>; Thu,  2 Apr 2026 01:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775095194; cv=none; b=gTUC50x9H8g8Re8D5Ujj8zNiWNkZ/gw00ldkSm14B7/fvmTGhRS/RLECUpiVvWQ3Wh9jXbd5FqfPCo7OZijt96GzufPraZ1ynrpBwVtXy6rXjkkX19M+Ip877Y5QVmfcJ8Gr7mhKK5MT5YqfkhGqNCUYU+POPvh2uHICMieJIfs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775095194; c=relaxed/simple;
	bh=G9ErukyjtFQQONiLAGMEclYQ3lC/nZkKFqeuRk5+bII=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=m0+6MSbqxnL7LrLc2J9gkhJpXnkta7W0tYcm/p0ZKDBfdULmjE/1RqsnIhTtBJ7E8nsyy2Y8rtNO9yaKjqUgaMXwTCav8YDTPAq60OCfahOcJ6weJW7PPsih8L8sN//W9K2bKfQJ+I77ua0CPyeE1Ior2HcM9y23YZxGNpVSrGY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=jpZTNAKK; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="jpZTNAKK"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-35d9827661bso147149a91.3
        for <linux-doc@vger.kernel.org>; Wed, 01 Apr 2026 18:59:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1775095189; x=1775699989; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=1HRLPCzgG72vKngIOPMMcPHhtLpKEoLGj3vPRDEvTYE=;
        b=jpZTNAKKcsuq6+jSNZvtl3J9HxWg7l4lLK/mRVHB+SY40WA9ynaQUrLU8yflp3A/lY
         yOtxjy7s6rAmPmxJFZh7JwAHwZ7YW5El83xBgHBdM4Ul9mPWbxf/A6mcRmtcGF0Ui3Ue
         zw21cVYOkx6mh5qjwy5yyHkbqscThNNrSSLNo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1775095189; x=1775699989;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=1HRLPCzgG72vKngIOPMMcPHhtLpKEoLGj3vPRDEvTYE=;
        b=DOhZmCOZtaT1tltOuSbZ0C8dK8g9+qugxpSkJZOTHUNPKbRYCTkQQQICgCC8F31JZr
         sBQ3yhyJNA+c8goQro854ewYheqk1uFH7qltBj8j3EgOUoO+dqo13oqBG+4aP8esTFk2
         pviwiM2PiFw+2tkx4d1Za9BxXR0v6jdOdICp4xORurzi7Mn9hidB8ndrT0Pa3r2r2IKJ
         bsNAcMu6sZVW/B5FC7r8w2euRzkNiMaWy1SR1C5ZISW6p68gFxQ0ofiIEcyZjT0FqbAI
         VCuiQ+ES2dMPHGazhlYLykmihxEhMNJMSuadyCKQap26AL4D841BOC33Vohp2E6eS1Io
         pK/g==
X-Forwarded-Encrypted: i=1; AJvYcCUx5Ji5WPLxRNP+K3XKn09Gfak04jci/R2+qNqUaQi4xDfxjh1GNtnxvHg2vYB2rI8N/UX5MLyVBVQ=@vger.kernel.org
X-Gm-Message-State: AOJu0Yx+bELEbcc0ii6R9E6uluZetnma8hWv0DtoEOHZa0qrIdFqYn+A
	Tpr7hJjGdyB4jemzPUx+hyWO3o1d7uV+zZxPa0OGqcDrNqkA8i0VFg0BMWX/IxpmDQ==
X-Gm-Gg: ATEYQzzhzUKSWhiXGdPXSyInjTMm6gEIDofjo3HtzfX2HGY4eoz+/wTNEAlKwtyPu//
	RhZWwntHQnzAoe4SzVBeRvHzGNC2Aq+KCWHGJQw1wV7urHYePf5r4ZDeFR6WmMhQDLK0AuE3QkA
	VgNpX2yOfx6vPE7Gv/VW0BiCyXWqPo84mSUpjn3TV1gNXDnzUsyPY4/AGKowkZrZKy2dvL3iMZV
	grvLsGIZDsc68izO3LXkkK7Yv/AwhtyluEiKPrmZzLmbQV35AGWoqwhZaAbOR4+YmMOemK3uSjQ
	2fqlvvQnA9dl69RbqxIZ/EDWaZVwW5hsCS2JE29ounE/I3lYsGsD/aPNVmVKEmYCWfF3AtF00Y5
	39SZq8+HvSxeqxklwAacByUlOw0lo3k3XJp7oGUCd2nfKmaWOuq4MnfVUcfqaqaCOrvLSEEG3oH
	M2+0hoGOkIu9kPzu2ZF81j6dp5Yksudn3bcvfUOLkrrzHTAkV50e6FOWjQv6+60AvYUdZPap++1
	6RNvg62vTUKfY1Hqzg9I+bVb06ChwjDNw==
X-Received: by 2002:a17:903:22d1:b0:2ae:fc60:2650 with SMTP id d9443c01a7336-2b269c94d5dmr58282855ad.39.1775095188890;
        Wed, 01 Apr 2026 18:59:48 -0700 (PDT)
Received: from jingyliang-input-linux.c.googlers.com (111.169.168.34.bc.googleusercontent.com. [34.168.169.111])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2b27478cb4fsm11187535ad.29.2026.04.01.18.59.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Apr 2026 18:59:48 -0700 (PDT)
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Thu, 02 Apr 2026 01:59:46 +0000
Subject: [PATCH v3 09/11] dt-bindings: input: Document hid-over-spi DT
 schema
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260402-send-upstream-v3-9-6091c458d357@chromium.org>
References: <20260402-send-upstream-v3-0-6091c458d357@chromium.org>
In-Reply-To: <20260402-send-upstream-v3-0-6091c458d357@chromium.org>
To: Jiri Kosina <jikos@kernel.org>, Benjamin Tissoires <bentiss@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Mark Brown <broonie@kernel.org>, 
 Steven Rostedt <rostedt@goodmis.org>, 
 Masami Hiramatsu <mhiramat@kernel.org>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>
Cc: linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-spi@vger.kernel.org, 
 linux-trace-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
 hbarnor@chromium.org, tfiga@chromium.org, 
 Jingyuan Liang <jingyliang@chromium.org>, 
 Dmitry Antipov <dmanti@microsoft.com>, 
 Jarrett Schultz <jaschultz@microsoft.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1775095180; l=4684;
 i=jingyliang@chromium.org; s=20260213; h=from:subject:message-id;
 bh=G9ErukyjtFQQONiLAGMEclYQ3lC/nZkKFqeuRk5+bII=;
 b=ycKoinGQcCRHLiNXC/cPrBW/8Eb646sAYUjTLCBWfa8jeV0fetsq980x3F7Mj3e2GB9rJqrL3
 pMQPugikmo/CIMzn+dRTxihOXhj4JvYuFrgOkwZyMmKNE9uU1LucVvv
X-Developer-Key: i=jingyliang@chromium.org; a=ed25519;
 pk=VTYSdqslTtYOjWWoIGgYoWupGWqNSidrggReKMgfPo4=

Documentation describes the required and optional properties for
implementing Device Tree for a Microsoft G6 Touch Digitizer that
supports HID over SPI Protocol 1.0 specification.

The properties are common to HID over SPI.

Signed-off-by: Dmitry Antipov <dmanti@microsoft.com>
Signed-off-by: Jarrett Schultz <jaschultz@microsoft.com>
Signed-off-by: Jingyuan Liang <jingyliang@chromium.org>
---
 .../devicetree/bindings/input/hid-over-spi.yaml    | 126 +++++++++++++++++++++
 1 file changed, 126 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/hid-over-spi.yaml b/Documentation/devicetree/bindings/input/hid-over-spi.yaml
new file mode 100644
index 000000000000..d1b0a2e26c32
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/hid-over-spi.yaml
@@ -0,0 +1,126 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/hid-over-spi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: HID over SPI Devices
+
+maintainers:
+  - Benjamin Tissoires <benjamin.tissoires@redhat.com>
+  - Jiri Kosina <jkosina@suse.cz>
+
+description: |+
+  HID over SPI provides support for various Human Interface Devices over the
+  SPI bus. These devices can be for example touchpads, keyboards, touch screens
+  or sensors.
+
+  The specification has been written by Microsoft and is currently available
+  here: https://www.microsoft.com/en-us/download/details.aspx?id=103325
+
+  If this binding is used, the kernel module spi-hid will handle the
+  communication with the device and the generic hid core layer will handle the
+  protocol.
+
+allOf:
+  - $ref: /schemas/input/touchscreen/touchscreen.yaml#
+
+properties:
+  compatible:
+    oneOf:
+      - items:
+          - enum:
+              - microsoft,g6-touch-digitizer
+          - const: hid-over-spi
+      - description: Just "hid-over-spi" alone is allowed, but not recommended.
+        const: hid-over-spi
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    maxItems: 1
+
+  reset-gpios:
+    maxItems: 1
+    description:
+      GPIO specifier for the digitizer's reset pin (active low). The line must
+      be flagged with GPIO_ACTIVE_LOW.
+
+  vdd-supply:
+    description:
+      Regulator for the VDD supply voltage.
+
+  input-report-header-address:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 0xffffff
+    description:
+      A value to be included in the Read Approval packet, listing an address of
+      the input report header to be put on the SPI bus. This address has 24
+      bits.
+
+  input-report-body-address:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 0xffffff
+    description:
+      A value to be included in the Read Approval packet, listing an address of
+      the input report body to be put on the SPI bus. This address has 24 bits.
+
+  output-report-address:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    minimum: 0
+    maximum: 0xffffff
+    description:
+      A value to be included in the Output Report sent by the host, listing an
+      address where the output report on the SPI bus is to be written to. This
+      address has 24 bits.
+
+  read-opcode:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    description:
+      Value to be used in Read Approval packets. 1 byte.
+
+  write-opcode:
+    $ref: /schemas/types.yaml#/definitions/uint8
+    description:
+      Value to be used in Write Approval packets. 1 byte.
+
+required:
+  - compatible
+  - interrupts
+  - reset-gpios
+  - vdd-supply
+  - input-report-header-address
+  - input-report-body-address
+  - output-report-address
+  - read-opcode
+  - write-opcode
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+    #include <dt-bindings/gpio/gpio.h>
+
+    spi {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      hid@0 {
+        compatible = "microsoft,g6-touch-digitizer", "hid-over-spi";
+        reg = <0x0>;
+        interrupts-extended = <&gpio 42 IRQ_TYPE_EDGE_FALLING>;
+        reset-gpios = <&gpio 27 GPIO_ACTIVE_LOW>;
+        vdd-supply = <&pm8350c_l3>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&ts_d6_int_bias>;
+        input-report-header-address = <0x1000>;
+        input-report-body-address = <0x1004>;
+        output-report-address = <0x2000>;
+        read-opcode = /bits/ 8 <0x0b>;
+        write-opcode = /bits/ 8 <0x02>;
+      };
+    };

-- 
2.53.0.1185.g05d4b7b318-goog

