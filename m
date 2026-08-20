Received: from mail-pl1-f172.google.com (mail-pl1-f172.google.com [209.85.214.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 979631FF5E3
	for <linux-doc@vger.kernel.org>; Thu, 20 Aug 2026 05:06:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787202403; cv=none; b=htI+VnG6byJlOInkOTkCYZiTfG9lSuq85Rdcww05WzqwVlJhBELP5+2UeV8mmIvz3281KUSTLoExwmGfaDwRBHGkrUbdLVsL7fCcUuL0fqj91HZXYdFVdjHwoE1jOVSOI/6Dncuv7SckwYATSZ00CLpg5X4S75vN+LKnB5UokT8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787202403; c=relaxed/simple;
	bh=KkxZzMnZsUYISSTdErOkta5WRXqEbFAdRVIXpnFjHBo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kL0gnwCxDv1T7zdISG60bNv5+Tfbw7FO5zSPeTw/RQHKryNqdEoa9nK7dQttezkYTy2biVZlaEnLMXGJwhCMhgtz0kcZfFtvoeT6neVkrmYuBHOvxwmawe3ouJIHOaXCrAXzupraDMkm//CUEYwyDNp7GiiXWjvf8xMIro8ZiQ8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lF9OhIR0; arc=none smtp.client-ip=209.85.214.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lF9OhIR0"
Received: by mail-pl1-f172.google.com with SMTP id d9443c01a7336-2cc891373e0so21821955ad.2
        for <linux-doc@vger.kernel.org>; Wed, 19 Aug 2026 22:06:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787202401; x=1787807201; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ehvq9I2NEQVnVUVkqXgo8ZVG0AJoS+1+bAWaF+/RoEk=;
        b=lF9OhIR05pc/wrf/QVX8xxNdO4nX59FwEDB7GuDD0LzL+A3ToGsIgeEuM+wPZ7+CrN
         Q5Wqi1kIhnA3HU+In+l0/35zw7mB2euY7O6TscAvs0hjuV7BnmGuhUYjATGrb6LvFgc/
         HIDQQnp06acgUSwsLXc/aDztA45j1A+dXe+28z5ljgLJT0FkIoWJi+PwEPSo2jc1Dafk
         l/+/xviqVv7CjPpQPXmpD49+sZMOkgTRnO815p9438F41zH9wbSOZNO5w9EMz/FvMa1H
         oM8yrRd+CdKtCP98/00sUCyFMYkFtCFlIYNDUPD+WKkERu6kPdrQXjMiTLHWwWXPtOq5
         WVoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787202401; x=1787807201;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ehvq9I2NEQVnVUVkqXgo8ZVG0AJoS+1+bAWaF+/RoEk=;
        b=tVLhHBi9WKvRpB9HCDDgAfS7kp1zjfq7wEVhCNqknUrDyHvCWOr4AwETc+Izh+BfZf
         69faPo4ja/vyTd6pZXJs1piGDemLHl9yxndHdumZ7NlnMV8Pj1dIRdUU1F4WTtsG3du/
         kRtA24ALsbxcYbUM9eTRibqdhFKKrsLPGApT22lwxE1aTAZ24qdPNW6dLhflnkIA8dhs
         vK7I75u6cip4Qovi/YLoNIYr2eqGKmxoVHrS1+/wggk1SA1oWV1HPUmEHXTksms+HmUQ
         lHGt1KC8E2wmJflIqC5PnCnlhUZIvf4ZykPwTsnpBG6kYHF3aaKios13/m5+ls9PgCU3
         L7OQ==
X-Forwarded-Encrypted: i=1; AHgh+RrwMvRlG01P4OvMeADgo/Dd3/vNJj0abFjj8gp76jlWenAUNyXmAVGRqUKqaoR6sH006q4n+UBkiNQ=@vger.kernel.org
X-Gm-Message-State: AFuF++kMFzlOUJQAZpBzt3/R8R27javD5NKpD1JUvQp0U5BS0CQSazDD
	U+wr1exIfDGt9nWvclFhhmjfDmPoRDR8/OwN0d7HlYzjJKCQh/FSnA1f
X-Gm-Gg: AR+sD13SYSwBOeo3WZE95wkxvF2n7+RWJy/so6r17pUWbiGn+ldMmw8Q90q0Cn7MP0L
	mCO4HaKsTNHt4Jyt2rchvt4FUonBXrHRdC84TDkw2TIK5dl/QYGRKylcUjv2e9pskuDAcLUvbgo
	OhI6YrdWJb/5R9+c+P8eIpZ5oKqgZE8n9T31m6aM7vwz2vx86b6CQuc6n7tmu+zIsZcIsm3vuGW
	la0RStxHzhXrnHaKCTe/tcqGmEvnp7JXO0Uy7UIpwp1RMyuTkFJUvEKNpvNuvkolGPdf4AFIYyq
	jaYenqo6oeiJodFze0jNXfUvdk/HymFAmUurL7QrnUUTnCYA+pQbjOTVXL6w148YWZQ6Ymr0kvy
	kTnjAmzrfRaKRJHHbvnsKzRrhL40XXWV5+VcNCLzHBsyPgnk0TN/AR6Li6dFdxmaJrMyK0Ixr3o
	LSHG3knWtHUAJKYhkS59eFoAI5/f3TmNSfU+1OWkTNKIHiRSKvlD99CDdY9aODmdilUG6vweIsU
	c1E2nQNp0Y1JclCP9Krsb3gssK4iT3zT8KaGcZG7aXTJmRwEt46rpSaKypfz+W+2xv4Kku7/fHY
	MV0GeCtkLbM=
X-Received: by 2002:a17:903:11c9:b0:2d0:8b28:517c with SMTP id d9443c01a7336-2d5fd5ff2e9mr175571935ad.3.1787202400875;
        Wed, 19 Aug 2026 22:06:40 -0700 (PDT)
Received: from DESKTOP-G3E0OSP.localdomain ([112.172.255.242])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2d62d58a82dsm2040685ad.18.2026.08.19.22.06.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 19 Aug 2026 22:06:40 -0700 (PDT)
From: Jinseob Kim <kimjinseob88@gmail.com>
To: jic23@kernel.org,
	linux-iio@vger.kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andy@kernel.org,
	linux-kernel@vger.kernel.org,
	rdunlap@infradead.org,
	joshua.crofts1@gmail.com,
	u.kleine-koenig@baylibre.com,
	julianbraha@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	grondon@gmail.com,
	devicetree@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v8 1/5] dt-bindings: iio: add Open Sensor Fusion device
Date: Thu, 20 Aug 2026 14:06:04 +0900
Message-ID: <20260820050608.5440-2-kimjinseob88@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260820050608.5440-1-kimjinseob88@gmail.com>
References: <20260820050608.5440-1-kimjinseob88@gmail.com>
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

Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
Signed-off-by: Jinseob Kim <kimjinseob88@gmail.com>
---
 .../bindings/iio/opensensorfusion,osf.yaml    | 52 +++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml  |  2 +
 MAINTAINERS                                   |  6 +++
 3 files changed, 60 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/iio/opensensorfusion,osf.yaml

diff --git a/Documentation/devicetree/bindings/iio/opensensorfusion,osf.yaml b/Documentation/devicetree/bindings/iio/opensensorfusion,osf.yaml
new file mode 100644
index 000000000000..3998390828cc
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
index f88e595f7077..d746aadb994f 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1245,6 +1245,8 @@ patternProperties:
     description: OpenPandora GmbH
   "^openrisc,.*":
     description: OpenRISC.io
+  "^opensensorfusion,.*":
+    description: Open Sensor Fusion
   "^openwrt,.*":
     description: OpenWrt
   "^option,.*":
diff --git a/MAINTAINERS b/MAINTAINERS
index 3c5084fec202..17652ba6039d 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20293,6 +20293,12 @@ F:	Documentation/devicetree/
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

