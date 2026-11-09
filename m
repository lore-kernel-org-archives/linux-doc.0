Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.51
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794231384;
	b=ONFuJwyaKu6efw9PGwK6iIEVwbWpLlPDrbtlL/NX7a1oY1euIyLQM5Wz4REEK8PZTltD
	 /gSPvr1ij0NOcB54UNFlBY9lX1ZA0lAneFE4svv1c82Rcin6ohfiIYGr3D0vHVzJCcthX
	 bE+LfRhlVuW/6PtPbSVJDm2t/llGbGt76arEohkojJeksNevOq6M+zmYsTu2PmyZWpsLB
	 2abLva4tLTutLdavYJ3+MU91aQweinFmvF7bN+cYAsjKmFHjOZZe68Jc9erZgaBp7P2AK
	 prkL9AUPm9IBqPCVTgEOhE8SEjyWEuVX/hUivzNIA62Xpve4UqkQcfFjRARQU+QCp0w==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794231384;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:MIME-Version:
	 Content-Transfer-Encoding;
	bh=O3DcDAcu/e7R2Ks6MhqHwiL2VWmAmz6xdp3JBivfIuM=;
	b=1vqQ7Dat/gss7fcaNDUw4oMAlnj+vHChA8VxK/+OM9qgGfmeUmdc1lXHzJZRVz3gOGOj
	 x1JjGuTziknQkwJLnpN1E8yZA6sRs+1Q4jchFOJv6pboQRb7Dmd+LVgElqExafXsQTL24
	 UblOY9o2tFg1x/UVOVoyYedUoRWbvryfOMbESsbFvzkkfi9t+VkN7wzywDNNC2PGnXDhu
	 2hAs8GNcCBhNjBBRl9a6PmqUQj5SOKm/vgV4WB2uaXeipW3xwc+jgYHJVcvySxRSZ8CxB
	 1Lrpz++SfoIdL590n1FJ1mH7NIgkL57YD7YsgtqKiaLZL9A2gSVbBE5fFTDYut+/Xqg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sartura.hr;
	spf=pass smtp.mailfrom=sartura.hr;
	dkim=pass header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=Lddqbonz;
	arc=none smtp.remote-ip=209.85.128.51
Received: from mail-wm1-f51.google.com (mail-wm1-f51.google.com [209.85.128.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 134E0606A326
	for <linux-doc@vger.kernel.org>; Mon,  9 Nov 2026 13:36:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 134E0606A326
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=Lddqbonz
Received: by mail-wm1-f51.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso7123835e9.3
        for <linux-doc@vger.kernel.org>; Mon, 09 Nov 2026 05:36:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1794231382; x=1794836182; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=O3DcDAcu/e7R2Ks6MhqHwiL2VWmAmz6xdp3JBivfIuM=;
        b=LddqbonzUr6K0romfGF6hlerJbpmIzHvEHhqyIWAmAqdmk/R/RLWOz57Zi/UW/CxWH
         znBTgbW4yHY5aYHkODU8j2wnYFi/mel9aRfgUbkIxM+mHIoNhu15PMhrj1e7+E8OhMcT
         j8x+KiRb1/La5Rooi5P6A6uu9lXmk7j+uByHVEjrnV3amn0x/sRYfmJ5edOQesRb+he/
         aJl4karHtl4ur9/hWKlLgGPSay0ISSarnokiHFKgoVCeOHF8kJOQloMP/OmlLTcszoGC
         qbp5tnbYmGXru/ffupw7/Y4LpMU41pEBoxKS8btbKzb8vYC9lIKPkwyKN05QV+Mi78XP
         mqkA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794231382; x=1794836182;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=O3DcDAcu/e7R2Ks6MhqHwiL2VWmAmz6xdp3JBivfIuM=;
        b=m1bZUNSNt+5uqgG2RIo8jPOZdcEpqx1eHYjY7t3ZNkM78FMIGdEB3VANwglZY1/Ipt
         ha+EIejMzNF4bgHZT1JeMFrKlgbp7N6b3WTnSw0pR6xs9NE9PBLyf7Dqw+3FX8526WOn
         MxslZPwPsQwt16EAIfODieitwZQdzL9vYunoCZuP1pZesRQTK47CxIctOUm3vDmW1HHU
         QUn/hUpB3nSUfUzthH3ahuLqPAVHA8ku0NMcvvvmmn8DZZnLtBQx1yU1d5zYXJui+5Vn
         WHW4f+3en6je3ZWabtAj+uHGyZmmV5ueSTni3zZnrM4yTQdUdVZGwXG5kGEvo1jFSrI5
         IOZA==
X-Forwarded-Encrypted: i=1; AL+hErFVDeeZ/BlWkxdeiXwEsoVHGfW7rTXaWBSRWPz17bTbD2WTJcI9zgVBFgh9r8IrgGdxG5QI5Wz+RSA=@vger.kernel.org
X-Gm-Message-State: APuU4Z/ni5TXBrDsxqJZIQr0hlxvGNVmsPy3ntfgCu3zyRn1JiCWUBaa
	yW5bwpgO9/0hP5to6JryJA+UuoT7wdro+O+cUjACh6n2Ym6YYtvcybPWcpG9H8NuEGs=
X-Gm-Gg: AYBFou2khsqNHquvwV5IwqyL5xnczGtShvvSaVWyQrSFkGczdNCNFIYcrxsMX7KMMri
	Sfro5FfXiyA0nv6zMK6QaVfgsxlWA3RVtSPRGerQLovUnGlzMJOBugcM26Q4yQIaMsx1CRhK5RM
	yRQPawuO4g2GHhRtCAoYQNjHxp2TvmadzKeyScvhVvqWMuaL2HGzEouKlpR6WrKi77KW+FnYYog
	gC17ZS3wAr2QTUq/YiB9oPzsp8ajx92MyVHsswOtsI03COYS8lJ9fXxS9JeIuNBCORpvG0oEB1C
	KBHQDbyw2X9A078t3iNIsVb/mgM4XPxpxvyyh8r+YYj0aHfwUvOnWDcYhRBt3ZEVBknQYwZbqSS
	RxgxFvjKTsWVrnGIcbjy4416rIq/tUqJbn+zL0kRIqc6/rNEKBoffSbXYe5tIqltTq6HnmcPc/U
	sTKVYKAAyLyCpTfthK4qyxBVOW03kWywEMCgjrxAn/JHjiWLNYyTSSukjVMVGz1ePqgTSUDzmss
	DvQLReNdPwzRuRp6rOd4zGvKmA8O0z1gXfCPSUbZsjPqWbe/IY4XEAqOFNnOa99cpeBhgjZ9XUO
	ODPSgvJ685hftbCRe3tXzT1p7H/t86vDPZZkCX5nDzX5HyiRi67tiANu4mup2IyVfnDI0NZANpB
	jDojf+ISy6LVBKHdL7pG1zO0bjxa2phDijHpNspWGaDHYY+kNz3MINp5f/3bthrwJL9lS+uCSaz
	4w/b5b68kieFyycXx+jC65+u90
X-Received: by 2002:a05:600c:3e88:b0:4b0:bc65:b9b5 with SMTP id 5b1f17b1804b1-4b963c8809emr71051325e9.35.1794231382337;
        Mon, 09 Nov 2026 05:36:22 -0800 (PST)
Received: from threadripper-fedora-workstation (cpe-109-60-83-229.zg3.cable.xnet.hr. [109.60.83.229])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4b7efb1b64esm245418915e9.13.2026.11.09.05.36.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Nov 2026 05:36:20 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	Steen.Hegelund@microchip.com,
	daniel.machon@microchip.com,
	UNGLinuxDriver@microchip.com,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>
Subject: [PATCH v2 1/6] dt-bindings: hwmon: add Microchip LAN969x fan controller
Date: Mon,  9 Nov 2026 14:35:05 +0100
Message-ID: <20261109133609.810876-1-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.56.0
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

The LAN969x fan controller has a PWM output and tachometer input in a
register block separate from the Sparx5-compatible temperature sensor.
Describe it with its own compatible and binding.

The optional fan child specifies PWM period and polarity, tachometer
pulses per revolution, and thermal cooling levels.

Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v2:
- Describe the fan controller in a separate binding and compatible.
- Keep the existing temperature-sensor binding unchanged.

 .../bindings/hwmon/microchip,lan9691-fan.yaml | 83 +++++++++++++++++++
 1 file changed, 83 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/microchip,lan9691-fan.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/microchip,lan9691-fan.yaml b/Documentation/devicetree/bindings/hwmon/microchip,lan9691-fan.yaml
new file mode 100644
index 0000000000000..0b7d38a6d20ae
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/microchip,lan9691-fan.yaml
@@ -0,0 +1,83 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/microchip,lan9691-fan.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Microchip LAN969x Fan Controller
+
+maintainers:
+  - Robert Marko <robert.marko@sartura.hr>
+
+description: |
+  LAN969x fan controller with a PWM output and tachometer input. The fan
+  child's pwms property references this node to specify the PWM period and
+  polarity.
+
+properties:
+  compatible:
+    const: microchip,lan9691-fan
+
+  reg:
+    maxItems: 1
+
+  clocks:
+    items:
+      - description: System reference clock
+
+  '#pwm-cells':
+    const: 2
+    description: |
+      Number of cells in a PWM specifier.
+      - cell 0: PWM period in nanoseconds
+      - cell 1: PWM polarity: 0 or PWM_POLARITY_INVERTED
+
+  fan:
+    $ref: fan-common.yaml#
+    unevaluatedProperties: false
+
+    properties:
+      cooling-levels:
+        description:
+          PWM duty-cycle values corresponding to thermal cooling states.
+        items:
+          maximum: 255
+
+      pulses-per-revolution:
+        minimum: 1
+        maximum: 4
+        default: 2
+
+    required:
+      - pwms
+
+    dependencies:
+      '#cooling-cells':
+        - cooling-levels
+      cooling-levels:
+        - '#cooling-cells'
+
+required:
+  - compatible
+  - reg
+  - clocks
+  - '#pwm-cells'
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/pwm/pwm.h>
+
+    fanctrl: fan-controller@e2010348 {
+        compatible = "microchip,lan9691-fan";
+        reg = <0xe2010348 0xc>;
+        clocks = <&sys_clk>;
+        #pwm-cells = <2>;
+
+        fan {
+            pwms = <&fanctrl 40000 PWM_POLARITY_INVERTED>;
+            cooling-levels = <0 128 192 255>;
+            #cooling-cells = <2>;
+        };
+    };
-- 
2.56.0

