Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.181
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792803131;
	b=J4TQDEMn9fziqB3rnOER8kkv8z1yO599ow6Av1302PpwTc/YvIPYKy2tgepFx9l5QV6p
	 sMsu11z+aZAoeAuQ17Mthobl+7JyhchY9dM+4z69VQ7w2FqZMgzqTcPpFwtbylDSU1ME4
	 LexssPX+/B9Y2GMtbc5L124eIuDAets5FbYErrpQlpMcwU2y/QDcaQXCBjxVq34gxtAb6
	 ak0bGEKyR7j/6P1fX7jn0K3+EQKiya1KJ/xmx8scJrQER0YLP2P0xeXLiBy3tftsapjPd
	 Xh4DpQcbAmbVf4x04PylonlFDz5LeS7txgokL4xHy/ybesU4GUNcN7jdWW/uauqs8Kg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792803131;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=FOqWh0YVIMqSNQR+C9AUSAav6J63QCzsPs/EWmskesI=;
	b=vzoYW+IisDseIQXAAq9sq6fnmIxNA9e+pYz/puXpLyuxH6eurullNmju1wAzkM2osXYm
	 oB7IbhbdBW+BPZinNNa+/VfZQohlLxUAAUwDt34wiE1a8D4Kd/w9BS7T3LE8UAtpfR4/L
	 UiLaK7DpMzdHo0TzUkDf1jAUi2Mwr65eu0ib8pUwJfJwtb9MYJK3zSWfdGfzn9SRC/87M
	 JtZEGveMTpGhvIk3jUFERnqubXjq/oY7sjFYB3EaVimU88pvIm07uaU5nX2+hSCXu3Xi/
	 hFFpft1RNojbGHO9qnBOLZ1yRwqvGGkoP1Z6jenr5w6kO4KnQRL3Jg+HlArzZ7vE63g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chromium.org;
	spf=pass smtp.mailfrom=chromium.org;
	dkim=pass header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=dXuB4Hch;
	arc=none smtp.remote-ip=209.85.214.181
Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6EA6560A2622
	for <linux-doc@vger.kernel.org>; Sat, 24 Oct 2026 00:51:58 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6EA6560A2622
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=chromium.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chromium.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=chromium.org header.i=@chromium.org header.a=rsa-sha256 header.s=google header.b=dXuB4Hch
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2e9cf928dc9so11670095ad.0
        for <linux-doc@vger.kernel.org>; Fri, 23 Oct 2026 17:51:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1792803118; x=1793407918; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=FOqWh0YVIMqSNQR+C9AUSAav6J63QCzsPs/EWmskesI=;
        b=dXuB4Hchn949TxwwrxnOqWrN7tFQqf8FYrosr0zcDvftQEXUenfgHn60BVKN0n3e9j
         fPhI1ylzo3uVaSGq2wfYuA5lesY5wZNd6r+UxMymP/Ln7yips+8XEPVeWsE2gJD6dApk
         CrJKThWRC/bMhsVKBj5xusQaQGD3wp7ppjIc4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792803118; x=1793407918;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=FOqWh0YVIMqSNQR+C9AUSAav6J63QCzsPs/EWmskesI=;
        b=WTwq2HYoHGQbjlscXG1PwMiKw61q2w1kNxdoCwQeaZiURi+hQqMXBc9qpvF9WruK0/
         PpRekyiXWZrULDxVh1dRwf6X/N7gXrPKOFagx9HfH/EDXMPpgppwj7yor29pPAnx+f4S
         YrydZhaQuhm0W+BXnsQtRjwPA3AqGtMop6ADwRxsRXhfVV6g6K8QzQoUQCJSDMvP9s77
         7RMY9nSOgOSrMqYUkDziQWZvGvrdS9TJOtjlb32z8GWyX5Y0lRD0E2mvRE27SFHHWnya
         GDqzfq74Ftyr1TBtknGQdU7P5vGPj1iTTdwFHJXmAwV5dBmgbK6ZlCNClp2jaT2mhL7d
         MTzw==
X-Forwarded-Encrypted: i=1; AKwUvBwtzco6h0Hg7ubAkGubn7Hcw9Xv1ey0bwsMMNDM9J5S4IAcsRZa/M1x/MnlPeo9RurKIk0lzo510l8=@vger.kernel.org
X-Gm-Message-State: AFq9FYLVAdDOYu+hySHZXdmN82JL8n2potl7bsBhSohGKtyFHTnvxlEg
	swlR+nxI18T++sPZtlZ1HxmapVzfxk3jSBdGFUH/ZLS6k7dCXlIJLi5Zy0xc14oFWA==
X-Gm-Gg: AYBFou0/L1zPlUkRGoGPqtjRFGghbKvtT84l70xtiW3mmqSm8g/iQFd7yP1P1ebiPl7
	lQRW2I9lZqicbwQN6OOcZpXt47tQYr0NZpD5w72cvPUD9ymCpsgvY5Hq6lUusf5QRqDvVJVoa2O
	XKnQGCYqs4goBn41uUcGE0nUaIePMy6bZxSMTMLiCWIZcolu02Z0WwNNN7fIYgZO7bgIXBXCqhc
	/7vFZZZjsHgg2u4ZRRao6fQ/qGiJWdWCwz0pELyjekLlhJxtpMHOIw0qJU/2O8Fqz3/Tvk1vi8T
	6ygrIE4prCbTQEmAJOCFmr2EyNIJPSG9XEtb4Xy9d62meaDRjvT9x10cfHTKFNHiGuvIkhuBWob
	UAuUhgX3+vANhRp939UZNATWlqL64Z5l2eA1Icn2E4HgYzqSG/mChmpl09kKV1zZoykl+uZ/FGD
	L2QwdXSLUGCIWXwcMcOOYIrlAbLCGMoVlktOsnJTaGrGe0/sd7e6oSZbK0uF3SXfnuYD7eBRkxR
	IjiYpi0zeU8wqz/y1uKT4gXk3IzAHSDKjj/Dh34BRK87FqoVJ3i73uFl7KGs5TCyu3w+0qODNfz
	mlg3lL9zcaaZ67lUSkeeLLyO8XoxdkisvK/u23mF9VbhaBCsAJrqaVs0bg7h2L8=
X-Received: by 2002:a17:90b:6c8:b0:3ad:ba54:c3d6 with SMTP id 98e67ed59e1d1-3adeb3aa756mr451535a91.1.1792803117836;
        Fri, 23 Oct 2026 17:51:57 -0700 (PDT)
Received: from jingyliang-input-linux.c.googlers.com (218.117.230.35.bc.googleusercontent.com. [35.230.117.218])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3adebadfeb1sm843763a91.9.2026.10.23.17.51.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Oct 2026 17:51:57 -0700 (PDT)
From: Jingyuan Liang <jingyliang@chromium.org>
Date: Sat, 24 Oct 2026 00:51:42 +0000
Subject: [PATCH v7 08/11] dt-bindings: input: Document hid-over-spi DT
 schema
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261024-send-upstream-v7-8-abad13174b43@chromium.org>
References: <20261024-send-upstream-v7-0-abad13174b43@chromium.org>
In-Reply-To: <20261024-send-upstream-v7-0-abad13174b43@chromium.org>
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
 hbarnor@chromium.org, tfiga@chromium.org, fqwqf@fqwqf.xyz, daleyo@gmail.com, 
 Jingyuan Liang <jingyliang@chromium.org>, 
 Dmitry Antipov <dmanti@microsoft.com>, 
 Jarrett Schultz <jaschultz@microsoft.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792803111; l=2819;
 i=jingyliang@chromium.org; s=20260213; h=from:subject:message-id;
 bh=LKvYa/CLhKW+YzjSrs/NoZ9wb/gOcKYEJBUJ8orknbs=;
 b=dsZaqSkAfRPlQsBnAlhhKrVeQzXIS3bZOeQJ5YOz7fnco+9KGbTAo5yazXZtfLMbg3/nVpvgb
 XOaIb5Tfds/C784G7HjUd9pqWsagfxfpzdw8j+o9DFF+ntj2LIpYQjX
X-Developer-Key: i=jingyliang@chromium.org; a=ed25519;
 pk=VTYSdqslTtYOjWWoIGgYoWupGWqNSidrggReKMgfPo4=

From: Dmitry Antipov <dmanti@microsoft.com>

Documentation describes the required and optional properties for
implementing Device Tree for a Microsoft G6 Touch Digitizer that
supports HID over SPI Protocol 1.0 specification.

Signed-off-by: Dmitry Antipov <dmanti@microsoft.com>
Signed-off-by: Jarrett Schultz <jaschultz@microsoft.com>
Signed-off-by: Jingyuan Liang <jingyliang@chromium.org>
---
 .../devicetree/bindings/input/hid-over-spi.yaml    | 75 ++++++++++++++++++++++
 1 file changed, 75 insertions(+)

diff --git a/Documentation/devicetree/bindings/input/hid-over-spi.yaml b/Documentation/devicetree/bindings/input/hid-over-spi.yaml
new file mode 100644
index 000000000000..bed0746f004c
--- /dev/null
+++ b/Documentation/devicetree/bindings/input/hid-over-spi.yaml
@@ -0,0 +1,75 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/input/hid-over-spi.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: HID over SPI Devices
+
+maintainers:
+  - Benjamin Tissoires <bentiss@kernel.org>
+  - Jiri Kosina <jikos@kernel.org>
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
+allOf:
+  - $ref: /schemas/input/touchscreen/touchscreen.yaml#
+  - $ref: /schemas/spi/spi-peripheral-props.yaml#
+
+properties:
+  compatible:
+    enum:
+      - microsoft,g6-touch-digitizer
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
+      GPIO specifier for the device's reset line. The HID over SPI
+      specification requires a dedicated, host-driven, active-low reset
+      line. The line must be flagged with GPIO_ACTIVE_LOW.
+
+  vdd-supply:
+    description:
+      Regulator for the VDD supply voltage.
+
+required:
+  - compatible
+  - reg
+  - interrupts
+  - reset-gpios
+  - vdd-supply
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
+        compatible = "microsoft,g6-touch-digitizer";
+        reg = <0x0>;
+        interrupts-extended = <&gpio 42 IRQ_TYPE_EDGE_FALLING>;
+        reset-gpios = <&gpio 27 GPIO_ACTIVE_LOW>;
+        vdd-supply = <&pm8350c_l3>;
+        pinctrl-names = "default";
+        pinctrl-0 = <&ts_d6_int_bias>;
+      };
+    };

-- 
2.56.0.257.gf7497c7d27-goog

