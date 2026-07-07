Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27A041DB356
	for <linux-doc@vger.kernel.org>; Tue,  7 Jul 2026 01:46:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783388766; cv=none; b=r8MWqMKkUnHwCrgVp5VoTAwheCPDXnYcF9olc+IkutlXi101Py6HgTls7q5J0Cn+Vzsn0kU2jzsMI6BIoAzUWB2zBPsTwZBeN2XsKB6Zf2HeERtmou31MIZnb6flFkFMlBvVyes8TtNglZigFgm6vVBZQrdf+PYKx9Ef26Qrbc0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783388766; c=relaxed/simple;
	bh=vgU8I3i5fbxFbPui0chOgO4hzLDJFniEdqgCRKD2a+Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Bxxn9CwSLFXFhpjnwQoMpOnbmb3alFjz/DrvgR9js265iv3yaqcXjZyPM0+nRL55GD0M1251mJyMx4vqJOfag2Ya8GqcOt11GwFd3GfLOfdv+wqnqi+MrB2T0EAmZ1p6dx2Kl2HQc2tZNEJky0OSXRwwTHpK6HDi+lcYnU1XSR0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=b4jsgsw7; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="b4jsgsw7"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-84592b55832so3569469b3a.3
        for <linux-doc@vger.kernel.org>; Mon, 06 Jul 2026 18:46:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1783388764; x=1783993564; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=l0i+/j/bfcPk03DKuYUjCyKBjIDP+ErpyRxJSaeYrl4=;
        b=b4jsgsw7h7r0KtiseTN5H/mPMExscEjyMwn3Ob2DURB+MwixL99Pn/cugRiQRYJ8Pm
         FsbLlCTdn92VCZU+jUf74JLEetemMgxFe/Mk3eR1EOGCcY7PRgm4hclS4Yuh5B1eLN2F
         Cn00naFcfjMkgqk3mfKp46per8RnWEi18/eF42gka8eWQcd6aiX060DnHpPDYMhH5SbL
         SaxswauXOsWSouI4cycDZSKkgpEfJQclm1/pIee58sPTI7KFiU/sJoWzI3WxFwhB0b/K
         2m4VZ6/SiX3UXS+/IcBP0b92zYyvk36OK2IwZUdyzYE2713G6JE2F0FKDdkFWVtsvTyc
         s+RQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783388764; x=1783993564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=l0i+/j/bfcPk03DKuYUjCyKBjIDP+ErpyRxJSaeYrl4=;
        b=oeE9tWFoNgvzNmUwlGjgJttLpO8ERoMpCyLcWlxeCpfJ+q6mYKA0MmAwbvXR4bAYLH
         KbfcaIPc3eoe+Jx+aiBeZITXfAiuRx5Y4W6lXu2qEoPtU67xUh07QPiaCo7HIWW7Jrzt
         GUcdMQqGw4HvFva7aaxvu8hDFmtsin5nj0n3cMjToGNLZDTx0mtlUQ/mjXu67MpBRvUJ
         76Uta5gZIUcU4ety733zTNf9y8HsV6U4JzbV9Fy7cfM6drgAYaG5Fo/yBsNCDK+oGjcR
         u6PPuUVAKoP/SauDynumQSAlQcQtGsRyLAEWaXKmKx/K+8tCiM4l2/TwXX5NQoT8jp3X
         dSCw==
X-Forwarded-Encrypted: i=1; AHgh+Rp2OJI2Lmz0X/KXcl0xdPVq4V/n4+LDMEutbGHT/iXByrrXcaOeBezbVViFLI8CVqopz0onq55nzhc=@vger.kernel.org
X-Gm-Message-State: AOJu0YyyF58NORQc/l2AqaQ3qEXoSPme65qcKbYYaZ6w82yLHFHAfg01
	gdtesIculjMpjZZa6gHMACw/wCAc7hKzMeDc6qpY6v7eFY2ad50VIZIM
X-Gm-Gg: AfdE7cljtvVAXT67HwV8piI7YvHqGgF4Pkpitefa+8W5tP3PFPjmmvhkSLkPzisnC2K
	0o0WjpRMq6RCkOAIizSuVNtFHjFfkgEFr1Yi70BAlxCHV7KHFnsbtiNV9HBUv55Mig1Zj5KVFus
	8kXgw/+OqNYJPZCjVioaIS128dcvrJTqGcNEboZZ4B2Bn0AgnDbtZA6J0ziaapFRw5B+1uPYswv
	QD1T2dzOjCF0dFddk6f3ES657iThJ3yk0M1v3Rq+AI+xjLxAONDjxj5cIKQa9S6vrFUxZ2iMwgS
	CPaFrKKKCPyMznKP7nQNmAaDNVCk/eKHrbj/Zp0ksLEPigP+HLmO8+GhV4ZMgrzXMfgxjvd0QBd
	bkooERpPSZXoxLBGLYcVk4McwEV9P+9EtuY/MCHOwYbi7NNKN7VloVDkxA2RFhVwDm+hEzBc6BD
	TsIVkI+ZWRGWDVhQjRyV8jGNum+LOf7uISH85YW6xz5VDD8UEQuA7ARs3y4LLFG3A08lMippeBE
	b2zmH3gQ1C56JXpkf2VEaxJlwiw
X-Received: by 2002:a05:6a00:b83:b0:845:344f:ef1a with SMTP id d2e1a72fcca58-84826be9d43mr2994044b3a.15.1783388764346;
        Mon, 06 Jul 2026 18:46:04 -0700 (PDT)
Received: from DESKTOP-G3E0OSP.localdomain ([112.172.255.242])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-847f6d4e741sm4645653b3a.28.2026.07.06.18.46.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 18:46:03 -0700 (PDT)
From: Jinseob Kim <kimjinseob88@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	Nuno Sa <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Jinseob Kim <kimjinseob88@gmail.com>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 1/5] dt-bindings: iio: add Open Sensor Fusion device
Date: Tue,  7 Jul 2026 10:45:21 +0900
Message-ID: <20260707014525.1015-2-kimjinseob88@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260707014525.1015-1-kimjinseob88@gmail.com>
References: <20260707014525.1015-1-kimjinseob88@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a binding for the generic Open Sensor Fusion host interface.

Open Sensor Fusion devices report capabilities and samples over an OSF
protocol stream. Sensor channels are discovered at runtime from
capability reports instead of being described individually in Device
Tree.

The protocol version is discovered at runtime from the OSF frame header.
OSF GREEN is a product identity, and OSF0 is a wire-format magic value,
so neither is used as the Linux compatible string.

Signed-off-by: Jinseob Kim <kimjinseob88@gmail.com>
---
 .../bindings/iio/opensensorfusion,osf.yaml    | 52 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 MAINTAINERS                                   |  6 +++
 3 files changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/opensensorfusion,osf.yaml

diff --git a/Documentation/devicetree/bindings/iio/opensensorfusion,osf.yaml b/Documentation/devicetree/bindings/iio/opensensorfusion,osf.yaml
new file mode 100644
index 000000000..399839082
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/opensensorfusion,osf.yaml
@@ -0,0 +1,52 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/iio/opensensorfusion,osf.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Open Sensor Fusion Sensor Aggregation Hub
+
+maintainers:
+  - Jinseob Kim <kimjinseob88@gmail.com>
+
+description: |
+  This binding documents the generic Open Sensor Fusion host interface. Open
+  Sensor Fusion is a sensor aggregation hub. The hub exposes an OSF protocol
+  data stream over its host interface and reports capabilities and samples for
+  multiple sensor classes. The actual sensor channels are discovered at runtime
+  from OSF capability reports instead of describing them in Device Tree. The
+  protocol version is discovered at runtime.
+
+  Public project documentation is available at:
+
+    https://github.com/opensensorfusion
+
+  OSF0, protocol_major, and protocol_minor are wire-protocol details
+  exchanged in OSF frames.
+
+allOf:
+  - $ref: /schemas/serial/serial-peripheral-props.yaml#
+
+properties:
+  compatible:
+    const: opensensorfusion,osf
+
+  vcc-supply:
+    description:
+      Regulator supplying power to the Open Sensor Fusion device.
+
+required:
+  - compatible
+  - vcc-supply
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    serial {
+        sensor {
+            compatible = "opensensorfusion,osf";
+            vcc-supply = <&vcc_sensor>;
+        };
+    };
+...
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index 28784d66a..88172d4a4 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1237,6 +1237,8 @@ patternProperties:
     description: OpenPandora GmbH
   "^openrisc,.*":
     description: OpenRISC.io
+  "^opensensorfusion,.*":
+    description: Open Sensor Fusion
   "^openwrt,.*":
     description: OpenWrt
   "^option,.*":
diff --git a/MAINTAINERS b/MAINTAINERS
index c2c6d7927..e4df9d8dc 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20011,6 +20011,12 @@ F:	Documentation/devicetree/
 F:	arch/*/boot/dts/
 F:	include/dt-bindings/
 
+OPEN SENSOR FUSION
+M:	Jinseob Kim <kimjinseob88@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/iio/opensensorfusion,osf.yaml
+K:	opensensorfusion
+
 OPENCOMPUTE PTP CLOCK DRIVER
 M:	Vadim Fedorenko <vadim.fedorenko@linux.dev>
 L:	netdev@vger.kernel.org
-- 
2.43.0

