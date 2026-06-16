Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04350397E92
	for <linux-doc@vger.kernel.org>; Tue, 16 Jun 2026 07:23:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781594597; cv=none; b=R7t94wS/pa9weBVwFSO9N/SsTqjGjrQdvD4bapzr4rOspFWryV7t3EsQ/TeGzEzhzAcWF2h9Tra1WqV7/d409KSvcrnsmGKfP9lLLlnO7A9TBZpsx1zXKE3jGyeCnjcfT6g+f1o1PhJTlqZNkrmHZ06DHw3hgrdosRrGcmmDFW8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781594597; c=relaxed/simple;
	bh=kM4IFxId6iI+JUfXwPMBu04c47p58k/M9UeSdYBvKXQ=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=RBSp4CZZmyvW0rBlpMEGSJbyDKwghZoC6L81024v+uu0WfXLkCWDPdOu5eXaZDtcOyH9WX9KbqKYmrtcz5DXrgSkGvW1BER4k4JdjzHECNNGZeTCEIBZRUYK4F+XoPpRl66fvw62EYOM2RRL1tgLxuJ3rUY3gmxmvX2tbcXvxZE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=eOHY+R6f; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="eOHY+R6f"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2bf77d4a4e2so24697015ad.1
        for <linux-doc@vger.kernel.org>; Tue, 16 Jun 2026 00:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781594595; x=1782199395; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9CIevGN6UD/mncJtIR8fA4hE9qdWOxUftvaCbnwqxcM=;
        b=eOHY+R6fVkxRx5fi/ZnkOpPOXmdeYO3bVUiQ6BYg8yMQ6M7vmrR5Ds9QrN6DQ9tS4u
         9/d8P6j1vRKMY2IGedWMp1DV3/Mj7iLT5wH/ni0sbZLADbVwpQAd6YaQfuBVJKt2h587
         bLK3U430saY2vgkJJqXZ7mZfi5HV5Uxa/a3g+uwo5hkXb34wqYHRojx8Q57Voaz4EMoa
         mHnqE7cYiW0NQwi1KcLwEXu0hpORHXA09snqQo3GcoHEgqenDdQFXHx6Oj4g+B1aVlk+
         a7MSrXbTXqdDl2b6HjhlRH7VD5FF6lXh96LL2A4d9llODKdm2qCGpjWsc6DKLJjLyGHP
         jjYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781594595; x=1782199395;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=9CIevGN6UD/mncJtIR8fA4hE9qdWOxUftvaCbnwqxcM=;
        b=sKv7mRbkNLJ+RuxtBkCftBek6DO5e1qptS2XcFWvOIg3RCcPmG2sT2+zuiNczq2moN
         7CsJJ8JKY/ha+XNkN6zCTb5+6QG0khcLScZnaCM1DpWffyujmNastv9/EtEZgX2JUfvP
         DY8f3YmVl54vNuV9LSP35YQQbIeyaKHhtjWA5yMyHunaSJv6rTUtGZ8aL/1JLGO+0bYI
         anim7ZhuBuwngD23S/7OxVVJagzt2WYrx58mQzGJnHJDQj+scGhWIHx8Xy9jx81mxmTH
         VnfX+KVauXvqrHf3eRFnvgYQRUqpJ5KShrpzIbFswDlJm32x9YshAM4jCFiiKQHMTf5f
         6k+w==
X-Forwarded-Encrypted: i=1; AFNElJ+ocdCkOoksUt/iXl1EO5UWeGdjXjpHwXH6uQvo6mbgl7NB+61zIFJCumI/hOS6iWXXOFpAXbmV3xg=@vger.kernel.org
X-Gm-Message-State: AOJu0Yy4y46aiEsouFYHpj1907ug79icx93OzKTrMU+0TzLz3HKJbpjm
	oXZkkEXDQQS4j8s7nj4Bj/a4BBPwRKp22cV81MivuRFTm5lYymmPPuhv
X-Gm-Gg: Acq92OFDQcCZCH0BO4DBv6RNX/rm2ApkB39snEUX9okrz7KfF2BF0ALJD1iiXyb8zUR
	16qLSIRUjY0hctVJr6MxG/CCTKumLKPSGPCDhpYVp43yR6mua8U811GNrSfV4zy/TPB1YNQ5DDk
	W8liN2rMhyaRh0yg5onirNAeGt+WGSyJ6u9oc475HFwl8sNghjXQ+v6IIql26PkVBDu/8WDcRZ5
	2TLdYaFLdj5AY6G8HTn4nRz683+hQxsDf879C9JF/HyWmuxh3vbfM9gUzfT+R2OBy3P8h7dz0Hz
	+aG3e/NjNFL5XLologkNut/zBa6BpnfW/lnfv4GaZeqfYI1AYjo2AIfWHC4YHmONlwFaRzqyGke
	gEdWCRDNTon5Y83u2SfLHJqjO94vwMYgKkq/IziiZ3vbX7ik/SFSEV7SHn+lR1aBBPhz3tX8lu2
	g7E/ffZ5cyYH16xatHRjlYZBlOiVA+0upbzAZ6yCPPTfZ3E9vxMyq8lyhbLZUYUgvIOPR3VADh1
	KTicGtyOQMCxe8QC/fnYbyVDyyY3y7iCRBwBXM=
X-Received: by 2002:a17:903:38c4:b0:2bf:367b:f46f with SMTP id d9443c01a7336-2c699bc3108mr22536675ad.30.1781594595263;
        Tue, 16 Jun 2026 00:23:15 -0700 (PDT)
Received: from DESKTOP-G3E0OSP.localdomain ([112.172.255.242])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2c42f1f1014sm123513435ad.16.2026.06.16.00.23.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 16 Jun 2026 00:23:14 -0700 (PDT)
From: Jinseob Kim <kimjinseob88@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andy@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	linux-iio@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Jinseob Kim <kimjinseob88@gmail.com>
Subject: [PATCH RFC v5 1/6] dt-bindings: iio: add Open Sensor Fusion device
Date: Tue, 16 Jun 2026 16:22:37 +0900
Message-ID: <20260616072242.3942-2-kimjinseob88@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260616072242.3942-1-kimjinseob88@gmail.com>
References: <20260616072242.3942-1-kimjinseob88@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add the generic Open Sensor Fusion device binding for a serdev-attached
IIO sensor aggregation hub, and document the opensensorfusion vendor
prefix.

The opensensorfusion,osf compatible describes the generic Open Sensor
Fusion host interface. OSF GREEN is not the Linux compatible identity.
Likewise, OSF0 is the current wire magic and a wire-format detail, not
the Linux driver identity.

The fixed OSF frame header carries protocol_major and protocol_minor at
fixed offsets. This driver currently supports protocol_major 0.
protocol_minor changes are intended to remain backward-compatible within
that fixed header layout. Incompatible wire-format changes require a new
protocol_major. If a future device cannot expose compatible version
discovery through the fixed header layout, it will need a different
compatible.

Require vcc-supply so the driver can enable device power before starting
communication.

Signed-off-by: Jinseob Kim <kimjinseob88@gmail.com>
---
 .../bindings/iio/opensensorfusion,osf.yaml    | 59 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 MAINTAINERS                                   | 13 ++++
 3 files changed, 74 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/opensensorfusion,osf.yaml

diff --git a/Documentation/devicetree/bindings/iio/opensensorfusion,osf.yaml b/Documentation/devicetree/bindings/iio/opensensorfusion,osf.yaml
new file mode 100644
index 000000000..012a07fd6
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/opensensorfusion,osf.yaml
@@ -0,0 +1,59 @@
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
+  Open Sensor Fusion is a sensor aggregation hub. The hub exposes an OSF
+  protocol data stream over its host interface and may report capabilities and
+  samples for multiple sensor classes. The Linux driver discovers the actual
+  sensor channels from OSF capability reports instead of describing those
+  sensors in Device Tree.
+
+  Open Sensor Fusion is not a generic industry standard. Public project
+  documentation is available at:
+
+    https://github.com/opensensorfusion
+
+  The compatible describes the generic Open Sensor Fusion host interface. It
+  is not an OSF GREEN board identity, and it does not encode the OSF0 wire
+  magic. OSF0, protocol_major, and protocol_minor are wire-protocol details
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
+    vcc_sensor: regulator-0 {
+        compatible = "regulator-fixed";
+        regulator-name = "sensor-vcc";
+    };
+
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
index c2c6d7927..2ddefc42d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20011,6 +20011,19 @@ F:	Documentation/devicetree/
 F:	arch/*/boot/dts/
 F:	include/dt-bindings/
 
+OPEN SENSOR FUSION IIO DRIVER
+M:	Jinseob Kim <kimjinseob88@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/iio/opensensorfusion,osf.yaml
+F:	Documentation/iio/open-sensor-fusion.rst
+F:	drivers/iio/opensensorfusion/Kconfig
+F:	drivers/iio/opensensorfusion/Makefile
+F:	drivers/iio/opensensorfusion/osf_core.*
+F:	drivers/iio/opensensorfusion/osf_iio.*
+F:	drivers/iio/opensensorfusion/osf_protocol.*
+F:	drivers/iio/opensensorfusion/osf_serdev.c
+F:	drivers/iio/opensensorfusion/osf_stream.*
+
 OPENCOMPUTE PTP CLOCK DRIVER
 M:	Vadim Fedorenko <vadim.fedorenko@linux.dev>
 L:	netdev@vger.kernel.org
-- 
2.43.0

