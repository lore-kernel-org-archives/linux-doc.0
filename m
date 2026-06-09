Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 472E13C5832
	for <linux-doc@vger.kernel.org>; Tue,  9 Jun 2026 04:41:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780980098; cv=none; b=US8FSKOYOzX/ZFtLvgkfBoGtQKktkz6EqY9fNPjyOCeu4Xvx6g0LVuQB4aU56I8HqXU+zPwtOECkfOWSPLMmW+vjcG4RkCO5omfKZff8e9iEHYH0mJZvMUbFSyqNC/Pmr/yyyl6roZ6a7NT6GOb6XprMRx2Tv/Qtp7arlo5y0wo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780980098; c=relaxed/simple;
	bh=xvf6N522rgUwygII2E7FT/nV/spP4Oa82Sd6W1WQORk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BMwXCwq2txNF8ySo0oE44d3W9oKQyfWSt4gwuMKGV+RFqwv2WM8q4NuiB35z8TLXsqP1EkgWx/3vOE5UJbuSoTsVBoZzGUyjXGlw8M1S5VIY7MAzFDSXmEKhzuQifeYiQyxPeQ3jI0LKU/kI93RH8yYMbYknAGMlJh2P5q8fRoQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org; spf=pass smtp.mailfrom=chromium.org; dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b=kyJX4vS9; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chromium.org header.i=@chromium.org header.b="kyJX4vS9"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-2bf36a6905cso35186425ad.3
        for <linux-doc@vger.kernel.org>; Mon, 08 Jun 2026 21:41:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1780980091; x=1781584891; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=mrAqGvulCN1vkXijFyEkWAFvyvd9/cpcDbYQDOTqkK4=;
        b=kyJX4vS9fBPUICTwn+z4Iy6rPgELLKzGMg8FcLqwj83n+XTrJS9ZJuD3oj8qrMMZ6/
         CYbOyEo0VVYtACqW1/zsMSRnpEU2ahHdHt3ei2L2Rai+Q285CctGfmE2lqvKgZ+twc19
         Zw4qIN/PCEQaUlzG2aecc9aREo3lcZgItRTdQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780980091; x=1781584891;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=mrAqGvulCN1vkXijFyEkWAFvyvd9/cpcDbYQDOTqkK4=;
        b=feARxSm9+nR+t/hXHhNN1+b1dfmc8KSVrEzwL2cJncY6GXI/mSp2S+ZczkW7UK9p38
         AMlM34Kp91hXmlBmPHNIRhU2TN71h0hfBCdJXaPe/R83vYefd3dCLV0ahzmzXgkXCR+9
         EiDX/kEpA81xu8NzRxjjneKDFo2rb+SUoopuySvXBKitCcbLVI2sZTcxXA/y8ARPOnAu
         gzEXuVviX/uooMzRhtB1S69z9cDS8BnkRqBiMvWTX2C8TFjHvzAjXqhdeFlD7oGNCIfK
         ii1iBrjx3l3K+t+PgUHO39c6DFMLx8FO2ouK9+JJu9A14QAk9mO71+WBmA3YMfTlzW2C
         h2lQ==
X-Forwarded-Encrypted: i=1; AFNElJ/puC8QG7vMFjIcMV5j0hzDYh0x9R8EoxrcdgAkToBQumeK8PS1SgIeNgI+8sJ5WoUJMIavRV3RwZQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YzK/kXOuCGrTYDvEX/o2vkzrdCZHElGHKIW10LYTTz1MSHtphb6
	x48sdv3jRMEXN8gNFkJKriJPGT+6Hq3vTuQy7IgkzuIAgTVVfnQQTC8pfI4guMRyHg==
X-Gm-Gg: Acq92OGdaSk6VCp+Y24V7PrMPd7WyZWGWEzTnCvDpnxynvyv+ZN+76yU5OTscuR3WQ2
	z80WI+5R3NudOdPpNrX+PJicNmYZy4jKuFNreFGqx4pi0o+ZgSuWG3Id7HFLXoUTCAHiWBUpxIg
	M10RVBT76v5m/kLr2iet9UYBoariOKAnVUbkDGPw7F9eDeH5qZlWcRmjOkO99Ax2uLgntkEiC58
	Ed542gXvZF2i7zGWV1eb0FzIGCJxKtsXjU5b9ELnWUhJSXr2m5rPugN27VFSBKEmyiqwUnX1nks
	N0B9wyYRV1W9bRTEj5fBQWz4eTVEUPVwGcT8RizMMC73uGCe4Z7nmjaCpzJdLJU453fmH9mJcaF
	11yxZn/is3Bppw5DnJsi26M9GSEGH4LZMI4jcFgb8qMyY3SISqCU54sT/YKywIBsK0SKoWvYpuh
	w2kDSEJajllckF/CDaYHlQ+exwOwHsiW1HoaTQriOYto9p+neds1bpencoxjFtx7iLOjhMr3bcU
	v8YEn7JZgYl8uNOt9hvpqJmZg+u6jcb9Lmdup969Whd9b2wIoQ/+Ro=
X-Received: by 2002:a17:903:2ec4:b0:2c0:a711:539 with SMTP id d9443c01a7336-2c2a1bafb3emr14638365ad.5.1780980091392;
        Mon, 08 Jun 2026 21:41:31 -0700 (PDT)
Received: from jingyliang-input-linux.c.googlers.com (111.169.168.34.bc.googleusercontent.com. [34.168.169.111])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c1664a67b0sm200736065ad.80.2026.06.08.21.41.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 08 Jun 2026 21:41:31 -0700 (PDT)
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Tue, 09 Jun 2026 04:41:00 +0000
Subject: [PATCH v4 09/11] dt-bindings: input: Document hid-over-spi DT
 schema
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260609-send-upstream-v4-9-b843d5e6ced3@chromium.org>
References: <20260609-send-upstream-v4-0-b843d5e6ced3@chromium.org>
In-Reply-To: <20260609-send-upstream-v4-0-b843d5e6ced3@chromium.org>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1780980084; l=4888;
 i=jingyliang@chromium.org; s=20260213; h=from:subject:message-id;
 bh=xvf6N522rgUwygII2E7FT/nV/spP4Oa82Sd6W1WQORk=;
 b=lzd6q3Zwv0Xbtt1uCAylUOu0Rv3Lnnpd4Kb7uh/sIxxS9yumLPROty1vgqdCo2GhrgoVHqDhP
 45iDnwdhGOZD0ByMsBZNOQdx/b8PNj9kUpKTTvkwYXvRRVVIPlpBDLP
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
 .../devicetree/bindings/input/hid-over-spi.yaml    | 128 +++++++++++++++++++++
 1 file changed, 128 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/hid-over-spi.yaml b/Documentation/devicetree/bindings/input/hid-over-spi.yaml
new file mode 100644
index 000000000000..27cf311e0aab
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/hid-over-spi.yaml
@@ -0,0 +1,128 @@
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
+  - Jingyuan Liang <jingyliang@chromium.org>
+
+description: |+
+  HID over SPI provides support for various Human Interface Devices over the
+  SPI bus. These devices can be for example touchpads, keyboards, touch screens
+  or sensors.
+
+  The specification has been written by Microsoft and is currently available
+  here: https://www.microsoft.com/en-us/download/details.aspx?id=103325
+
+  The Microsoft HID over SPI specification explicitly dictates that SPI
+  opcodes and register addresses (such as input/output report addresses)
+  are not standardized. Instead, the specification requires the system
+  firmware (e.g., ACPI or Device Tree) to provide these board-specific
+  parameters to the OS. Therefore, these varying parameters must be
+  defined as properties in the Device Tree.
+
+allOf:
+  - $ref: /schemas/input/touchscreen/touchscreen.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  compatible:
+    items:
+      - enum:
+          - microsoft,g6-touch-digitizer
+      - const: hid-over-spi
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
+unevaluatedProperties: false
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
2.54.0.1064.gd145956f57-goog

