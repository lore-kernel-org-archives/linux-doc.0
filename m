Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.45
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794413795;
	b=BgQcWlaS/7VP0jlA3j3Nfv/pMSN94XE9G0mMb0hCWv3EnNLyi64Ifx8hnkbFG8VtSaIy
	 qT9P32WfTL6kfyyHQkTzIou3oRnSQyrVuN4d0p+SRACp5bsdl8QglA/VtkT1asAhwetRN
	 6ZpM7tVW+6Kx2P/PcCInzQpMTj8v+UuwnMrinrtDAPtAmstcxn3QInzifePV3Pe73+Sq1
	 x2dIzKNNL6niYeT3RUjgiv5/UFxRK3vEaGCDv0prXuLoqgK/fvc/zJFL6FQy4jnY2KaYz
	 1hI9eqpRHL5z46d9B0CS7BzbhlNHzAXou9VrmP0cEZ1sa6lmkJoqRUyAlrsQn5TUFNg==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794413795;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mQpRUZlaWkX1Ytw6oqJM/cfVbl8bbjDHgz7gYq9iuk8=;
	b=DaNElaF3uWe6RtK34b+8aYU63/F90GPmi0CHQoPAMzFZi4pvuZo0Sy+yPT8s+HqgaQKl
	 yaQL/xAdDMObh0Z0G6S5Jom19U914YZj+It2++wHKMv4SmmWeCt+/xzBPfO8NnOGym5Cc
	 npPvZ7KPf3FJyUznkvRlt6LkwBvUvgUDjCVrCqwainkYBvZBJTMnvS66/Z0GqLMFyHteS
	 Afjj4Ev4Hb/zcIpqL5wWexbTBK/CC0MAPdY3fjOT7maTV8jrzHcyurmrmC6J/EpXitLWB
	 7GspeYgs7+d6bTLXugJ3o54pvAcp+Ddr6WJNUPmZIO7rHygDwq4Y2rkGXRnvvUJNZpg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=sartura.hr;
	spf=pass smtp.mailfrom=sartura.hr;
	dkim=pass header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=xCGgpKHO;
	arc=none smtp.remote-ip=209.85.128.45
Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 94B4E606A338
	for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 16:16:35 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 94B4E606A338
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=sartura.hr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=sartura.hr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=sartura.hr header.i=@sartura.hr header.a=rsa-sha256 header.s=sartura header.b=xCGgpKHO
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-4a214af2076so24842985e9.0
        for <linux-doc@vger.kernel.org>; Wed, 11 Nov 2026 08:16:35 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=sartura.hr; s=sartura; t=1794413794; x=1795018594; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mQpRUZlaWkX1Ytw6oqJM/cfVbl8bbjDHgz7gYq9iuk8=;
        b=xCGgpKHON65vGWLu5CG1Egngwk2+BdTi+fnSsSL8D0x8Xqivs1HujwomCjDv2PPMZR
         q1VSZnruWiOoG/A8ksoUMLToYXYFzCXX6Wka8yk3Bkz6oolx7esGfrc0u+7+e/NfowS6
         K3blGXurwKXyACJIfPTQ62IhUwWmSqR9Ajgri9lqTE5lEYbTPQIItU3FfyeA08d0SYEN
         RmPhSHR0/kChKXvGKMKn9Hc3XMRZgExRnHHXpFfOTvW9IWTYHWQGFTPhIZ+PQkKgxdfF
         zfhdOksppr/kElqDPx/cr3e1HM7bkbGnizpDpDOZxpYxaeW5nbN0SDGeiE6q4MfVH6+N
         NbyA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794413794; x=1795018594;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mQpRUZlaWkX1Ytw6oqJM/cfVbl8bbjDHgz7gYq9iuk8=;
        b=nCmymLIyTWAnmGlMTbdhwC9T/miiV1HEaVF2dwokrdwZR+hhHeVMWrZxbSEtGaA+NY
         6jc+ZYXxFTNldIzrdnz07YvJe1R/qO1G6qzT4/lqW8CbjXxxnVKS6eGNL347+hA1aLJP
         GfDbzcOOVK4w1+QFz3VwulqAFmKPWA9+yHNKu/h6IALsoDEOOqtQ1xdWUW21OjFm0uhu
         wgl0bnD1jdWlL+70gdsaS81/97XFlNSBEdRpJgAqi32HuUbfl+LAS5EQ1nVSzC5m6Nmn
         bACvziWbsJeKBjebfu6aI2yp5U4eC8ojSh17h+nut8DAeVJFx3+Vs2C1cpWyr7Cp7doz
         gdtA==
X-Forwarded-Encrypted: i=1; AL+hErErnRlIpFfZEVNrxAIptYOj0Wm44xsVXbbN1is3CYq+iRHhw7JYjcR797bjgp7Le0SYpqb1qycAV7U=@vger.kernel.org
X-Gm-Message-State: APuU4Z+4pumpdSyf8Dj2e9yTKPZCA2dC1Yu0rSHrahbwNQlJ5OMf3xZ4
	gnolzq177Fz65UAz+KFETpS+ropkK1rlG73YEyjJ31BIYT7kS/AMiAdWA63fNlE0IIY=
X-Gm-Gg: AYBFou3PoqpLAVfZavTdPXQnEDRB29DG7CruUeX9VDbsbuckDGBL8LaU/NVl2r299+j
	pdpt1VHT6to8pOhzjXCzkVN4AQ5miXoMIi7wo4xyPaagBuP4UgRn5Wiqe77bO9ub5QgwKgLb7ut
	B2BsvZAmtdUdjbLQGE/PcNxCj4OVLBfWmkAlxcYlIABvA2F4cZH+AWZ/Y4gpHRFZagwgQG1/aIG
	6Tuizrvs91iqV32eTX880a2osPgG6Oqy55JQ13ZRhzXQK6K7JqUV2LSZAAv1Sjdoz2OerCV3BVs
	BF5FFp5nFf4/6z4wYwnl5zPvcQyhcjX7f8UBhxemhS3AUqgFDi2ZaXTP4ss6zeBfAniwP+ExaFT
	UWimpqaq5PZHHoclmHbBHETOqYfufjZYkeb9F9yCXV6sgTRgbgDNhumDwQGBEg1WQdXOMu6UsL+
	VQ9QP/jeF9mkKbGh9I8oy8zZXOCV14xGYPYsiNYXZGGJYO8lnVysOx2ch7905ZyEOzYyG1z/uyk
	0zkXaYZ+G7xNMWjXf5j+blZs9839lLNylW645RiL9T3BkR0sDTDj/qvkbU5mSDKfINcUEZPyjmn
	94TshfFy4GKXv55yXHJgUVNiCR7IYRqgsLK2P920Pqclmg60uPbMf+2x8CEf4mZxTw1dEelVsts
	5WngEzG5BGz8abF0yqFi0urKeY4CJ7ZrXNsOH8hSDnlGwSwisIovS5m85keseiHza0bPVOuxy+z
	1hDfPoqBPU6MFFctwT1GLDZv0=
X-Received: by 2002:a05:600c:348d:b0:4a2:148b:c88c with SMTP id 5b1f17b1804b1-4ba0935cdafmr48000605e9.8.1794413793928;
        Wed, 11 Nov 2026 08:16:33 -0800 (PST)
Received: from threadripper-fedora-workstation (d-zg1-240.globalnet.hr. [213.149.36.254])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb4c52fd01sm8374925e9.4.2026.11.11.08.16.31
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Nov 2026 08:16:31 -0800 (PST)
From: Robert Marko <robert.marko@sartura.hr>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	rdunlap@infradead.org,
	nicolas.ferre@microchip.com,
	claudiu.beznea@tuxon.dev,
	linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Cc: luka.perkov@sartura.hr,
	Robert Marko <robert.marko@sartura.hr>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 2/4] dt-bindings: hwmon: add Microchip LAN969x fan controller
Date: Wed, 11 Nov 2026 17:12:46 +0100
Message-ID: <20261111161619.232141-2-robert.marko@sartura.hr>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <20261111161619.232141-1-robert.marko@sartura.hr>
References: <20261111161619.232141-1-robert.marko@sartura.hr>
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

Acked-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Robert Marko <robert.marko@sartura.hr>
---
Changes in v3:
- Drop the unnecessary literal-style description marker.
- Inherit pulse-count bounds from fan-common.yaml.
- Require cooling-levels only when #cooling-cells is present.
- Add Conor Dooley's Acked-by tag.

Changes in v2:
- Describe the fan controller in a separate binding and compatible.
- Keep the existing temperature-sensor binding unchanged.

 .../bindings/hwmon/microchip,lan9691-fan.yaml | 79 +++++++++++++++++++
 1 file changed, 79 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/microchip,lan9691-fan.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/microchip,lan9691-fan.yaml b/Documentation/devicetree/bindings/hwmon/microchip,lan9691-fan.yaml
new file mode 100644
index 0000000000000..6a8d05a62f7c3
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/microchip,lan9691-fan.yaml
@@ -0,0 +1,79 @@
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
+description:
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
+        default: 2
+
+    required:
+      - pwms
+
+    dependencies:
+      '#cooling-cells':
+        - cooling-levels
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

