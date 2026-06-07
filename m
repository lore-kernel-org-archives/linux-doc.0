Received: from mail-pf1-f178.google.com (mail-pf1-f178.google.com [209.85.210.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9265233ADA8
	for <linux-doc@vger.kernel.org>; Sun,  7 Jun 2026 23:45:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.178
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1780875916; cv=none; b=hNB2fhTh6oBYMs3z3WDaIS/v7xO/9S0DqAMWqHenppU1LowrBn1Xdy8gBkIRiQyRR8+hSYyA2p9q4bwM+GWhKopmiwyiGR+i7zjIIh4Uf+s1i4OwIKk/exDZYJPCCMTXVQ3EAWGdlVcF3vdExfg9GC3BZL1yOUZuydDoEGZc7Z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1780875916; c=relaxed/simple;
	bh=Spsg1lhJOwmJ2qBBDyH8EyO73klzrypmW6Q3Hscl2pI=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=aKFSE5dwoqgq5J7nx8TOzX33cT7fzbgzD9Rjr+KOFiim6srK8HjERNYJke74BpaJsw66y1MaI8WKFzaWb9JVlcdBj5gUIlgh6JEBePmcMq5hcf0XndytsA/aL5zhlmzQDCj4bSg/hfA2kXPCTggfle14/neA0sAgrDoNsfxOX0c=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=RELLlOtd; arc=none smtp.client-ip=209.85.210.178
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="RELLlOtd"
Received: by mail-pf1-f178.google.com with SMTP id d2e1a72fcca58-842848fd613so2982148b3a.3
        for <linux-doc@vger.kernel.org>; Sun, 07 Jun 2026 16:45:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1780875914; x=1781480714; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Ahs7nLcf9FlQuNK4toxYY0XgtCKzjOPXWCt75LqsX8Q=;
        b=RELLlOtdJeuklN0IPC0N4fELBQGbivMj+u3cRt89hqX1QvJQ8s0tO1w9peG8L7xNPp
         uwIE89aEQazibfTOJ1PBvniK7fyNEqr+FY1S8saUMXOQC7tEfF42nra20UegijpDwiri
         yskHvDY595YC/N5ELX7tDdK2oyByhDOS7tikErE7Q7GBt6zXb3gZy5nQfz3zYSdAmvBt
         BADlyYd0IaIj5g7U/cT4geYK8klz45BFFoNM9zHb5n00BbpKfPMBFZjQGHNgFAlJT4Fu
         +q0txLOGxHDI9gVHOeNH7XeShxY0ZyeEtZOJ0vFQupf7/MFAQFuUInpw8jJLIwAp+nWQ
         eIbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1780875914; x=1781480714;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=Ahs7nLcf9FlQuNK4toxYY0XgtCKzjOPXWCt75LqsX8Q=;
        b=gs0R2vYnVvER1YW2ZWht32yaICMcA7rOzvDvqDwxDZz1MY+8VvXwqKXvDcC/PlAs6d
         YQHR8L6VsW8LiKxv13hV8C6dVTSym7n8Hs1P0EdwfkGYgE6HlLDiR/cfvu8K3lrQo05G
         u5UFo6TmrE9R+bWdgwVDOGKEJ1Upj7pmgn7/b3B6hkkbyQWldTXN3Ke3pLhVnBSHN2o5
         39SLiLuRIxTm1LBw89CgP220Ji5DfNGWLy/SI9MO17Fhk/dAPsJ+iv4wpMGDxPoO5H4a
         O30S8NkhsgIrZFPLm6EwHq7sQxTG3K+NxdhLXvp1d++tJJ95xdAtqJgw15tYCEgr0MV0
         Nsxw==
X-Forwarded-Encrypted: i=1; AFNElJ+Mm10McjlhRJ3CeB/VSdJJAucTEGrj2rPKi/iUasnfeRYyCOZbBqvPGi28EY+XHrh50Ezqkuq+/2k=@vger.kernel.org
X-Gm-Message-State: AOJu0YwyvSDllbDlaWl7PqcE+XAlOFFejh2qmJzgrQ52RKVSaECskw/y
	jYSqCMkLsW7Jo/biPFNGJyiSXl11e2E4rNcgqh+QMFy8EYqkcR6dJdH8
X-Gm-Gg: Acq92OH7qF77TInN+meXmSrwTvXXMqlJYA5h4/S8fZDQdSCcJCCUmi0KzAl0cvWK/JG
	FAOv0uKGxP+0VpzmPvNFmfcLT05yxAWI5gw8cIliJLrIzvu6l/Y69ZzP/NE/hb/mQr/YhHctYnL
	x9LEk3zvUKK9eYlt4m6sn4j7+pq0GZLKaYdLdi7s4lq+xCZyHABEbdJxOB/foFYchB5vcAlEYl/
	1gvOX33VeO5Tm8k3k9mTFiiYwfH2AMHGiLg4WXoPAgcS+mhGLCtFpjBXmKrj7K2eH/WSKPWkoSS
	gw6PznyfRoHefc3H7b7oCUoCSqs0VaDBGJ4i0QhVZnTzKIzgzyYTB0jihLStnKCh2IwpGhy8II7
	nvPPLBz90e83zyavwaPMDlsj38JIfGh8yM0u2/UNzmLb/L5P/21yVG6Esp9FdgZPHwtl88Cq8s/
	Ai1/IFrlwS3jY2fdn++dNHIyrxAx7sElD7YMSts5+Tg0B1LMpQah+El3I/giDHG5CyAEyIPBTVL
	zmb+fFAlSFcjphwYOb6AAnMfKI8PEteQm1eOOTxKBKchpXE
X-Received: by 2002:a05:6a00:4298:b0:83a:4846:90b0 with SMTP id d2e1a72fcca58-842b10980d8mr13046383b3a.46.1780875913704;
        Sun, 07 Jun 2026 16:45:13 -0700 (PDT)
Received: from DESKTOP-G3E0OSP.localdomain ([112.172.255.242])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-842828d6bd1sm19257732b3a.44.2026.06.07.16.45.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 Jun 2026 16:45:13 -0700 (PDT)
From: Jinseob Kim <kimjinseob88@gmail.com>
To: Jonathan Cameron <jic23@kernel.org>,
	linux-iio@vger.kernel.org
Cc: David Lechner <dlechner@baylibre.com>,
	=?UTF-8?q?Nuno=20S=C3=A1?= <nuno.sa@analog.com>,
	Andy Shevchenko <andriy.shevchenko@intel.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: [PATCH RFC v4 1/6] dt-bindings: iio: add Open Sensor Fusion device
Date: Mon,  8 Jun 2026 08:43:38 +0900
Message-ID: <20260607234343.22109-2-kimjinseob88@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260607234343.22109-1-kimjinseob88@gmail.com>
References: <20260607234343.22109-1-kimjinseob88@gmail.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Describe the OSF sensor aggregation hub.

Use the generic opensensorfusion,osf compatible.

Signed-off-by: Jinseob Kim <kimjinseob88@gmail.com>
---
 .../iio/imu/opensensorfusion,osf-green.yaml   | 43 -------------------
 .../bindings/iio/opensensorfusion,osf.yaml    | 43 +++++++++++++++++++
 MAINTAINERS                                   | 27 ++++++------
 3 files changed, 57 insertions(+), 56 deletions(-)
 delete mode 100644 Documentation/devicetree/bindings/iio/imu/opensensorfusion,osf-green.yaml
 create mode 100644 Documentation/devicetree/bindings/iio/opensensorfusion,osf.yaml

diff --git a/Documentation/devicetree/bindings/iio/imu/opensensorfusion,osf-green.yaml b/Documentation/devicetree/bindings/iio/imu/opensensorfusion,osf-green.yaml
deleted file mode 100644
index 626b41fb0..000000000
--- a/Documentation/devicetree/bindings/iio/imu/opensensorfusion,osf-green.yaml
+++ /dev/null
@@ -1,43 +0,0 @@
-# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
-%YAML 1.2
----
-$id: http://devicetree.org/schemas/iio/imu/opensensorfusion,osf-green.yaml#
-$schema: http://devicetree.org/meta-schemas/core.yaml#
-
-title: OSF GREEN sensor aggregation board
-
-maintainers:
-  - Jinseob Kim <kimjinseob88@gmail.com>
-
-description: |
-  OSF GREEN is an STM32F405-based sensor aggregation board from the Open
-  Sensor Fusion open hardware project. It sends OSF0 capability, status, and
-  sample frames to a host over a UART link.
-
-  Open Sensor Fusion is not a generic industry standard. Public project and
-  hardware documentation is available at:
-
-    https://github.com/opensensorfusion
-    https://github.com/opensensorfusion/opensensorfusion-hardware
-
-allOf:
-  - $ref: /schemas/serial/serial-peripheral-props.yaml#
-
-properties:
-  compatible:
-    const: opensensorfusion,osf-green
-
-required:
-  - compatible
-
-unevaluatedProperties: false
-
-examples:
-  - |
-    serial {
-        sensor {
-            compatible = "opensensorfusion,osf-green";
-        };
-    };
-
-...
diff --git a/Documentation/devicetree/bindings/iio/opensensorfusion,osf.yaml b/Documentation/devicetree/bindings/iio/opensensorfusion,osf.yaml
new file mode 100644
index 000000000..a4049715a
--- /dev/null
+++ b/Documentation/devicetree/bindings/iio/opensensorfusion,osf.yaml
@@ -0,0 +1,43 @@
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
+allOf:
+  - $ref: /schemas/serial/serial-peripheral-props.yaml#
+
+properties:
+  compatible:
+    const: opensensorfusion,osf
+
+required:
+  - compatible
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    serial {
+        sensor {
+            compatible = "opensensorfusion,osf";
+        };
+    };
+...
diff --git a/MAINTAINERS b/MAINTAINERS
index 56181470d..e227b9aff 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -19977,19 +19977,6 @@ F:	Documentation/networking/oa-tc6-framework.rst
 F:	drivers/net/ethernet/oa_tc6.c
 F:	include/linux/oa_tc6.h
 
-OPEN SENSOR FUSION IIO DRIVER
-M:	Jinseob Kim <kimjinseob88@gmail.com>
-S:	Maintained
-F:	Documentation/devicetree/bindings/iio/imu/opensensorfusion,osf-green.yaml
-F:	Documentation/iio/open-sensor-fusion-protocol-v0.rst
-F:	drivers/iio/opensensorfusion/Kconfig
-F:	drivers/iio/opensensorfusion/Makefile
-F:	drivers/iio/opensensorfusion/osf_core.*
-F:	drivers/iio/opensensorfusion/osf_iio.*
-F:	drivers/iio/opensensorfusion/osf_protocol.*
-F:	drivers/iio/opensensorfusion/osf_serdev.c
-F:	drivers/iio/opensensorfusion/osf_stream.*
-
 OPEN FIRMWARE AND FLATTENED DEVICE TREE
 M:	Rob Herring <robh@kernel.org>
 M:	Saravana Kannan <saravanak@kernel.org>
@@ -20024,6 +20011,20 @@ F:	Documentation/devicetree/
 F:	arch/*/boot/dts/
 F:	include/dt-bindings/
 
+OPEN SENSOR FUSION IIO DRIVER
+M:	Jinseob Kim <kimjinseob88@gmail.com>
+S:	Maintained
+F:	Documentation/devicetree/bindings/iio/opensensorfusion,osf.yaml
+F:	Documentation/iio/open-sensor-fusion-protocol-v0.rst
+F:	drivers/iio/opensensorfusion/Kconfig
+F:	drivers/iio/opensensorfusion/Makefile
+F:	drivers/iio/opensensorfusion/osf_core.*
+F:	drivers/iio/opensensorfusion/osf_iio.*
+F:	drivers/iio/opensensorfusion/osf_protocol.*
+F:	drivers/iio/opensensorfusion/osf_serdev.c
+F:	drivers/iio/opensensorfusion/osf_stream.*
+
+
 OPENCOMPUTE PTP CLOCK DRIVER
 M:	Vadim Fedorenko <vadim.fedorenko@linux.dev>
 L:	netdev@vger.kernel.org
-- 
2.43.0

