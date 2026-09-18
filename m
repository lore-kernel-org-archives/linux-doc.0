Received: from mail-pj2-f18.google.com (mail-pj2-f18.google.com [74.125.227.146])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 20D605221DD
	for <linux-doc@vger.kernel.org>; Fri, 18 Sep 2026 18:25:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.227.146
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1789755933; cv=none; b=hEolaVHenG7wryTVIf8os1lNQNSlSPJytKdNlxs3EaqdZdQzGIt2dBjiAYqzOhv1H3ZaEj3I5NUrXdA8NNNiS1bOjpGj40KvhsIKSGI7D9pEDQ8HqY5xefrr0R4FqhupAZXA3tylrc3sr5gJHce8OoM9+dUyEDWhll0xMFxZcwI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1789755933; c=relaxed/simple;
	bh=FwBxD9C+mtpAY3FvuFjka8wR/91ggAo5qXxEvQFo4r8=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=cMARmaRXMrrE2Rd+5d1oLYvnK5xj+8P6mlO1ygQEuDHmLCopbd4DjAYIIM5FVgO7l5N6ltyFfD1XiPrDAQriNLP72pM7VeanXttu5DZ3aovS4ovspVqwHfAsNsoqfkaBirgoRKf+CfoaC9EmjlKn9z6pXk2DdkrwiXEAiG9BpyM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=iyCT3uuL; arc=none smtp.client-ip=74.125.227.146
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="iyCT3uuL"
Received: by mail-pj2-f18.google.com with SMTP id d9443c01a7336-2db22383fe8so7366825ad.2
        for <linux-doc@vger.kernel.org>; Fri, 18 Sep 2026 11:25:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1789755930; x=1790360730; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=JoyOc8CCoSjGkrWB9rL6T/fUpbguLCUgVumFgPvb6SI=;
        b=iyCT3uuLPseT5dBjBbZdM+cfyLZnZQ0dLpT7vuP0AMM+DEWtKF8jcCvhynuxtAIfs3
         RSmZ7PbmQyzvBr15YeWLtFlObWV0wqBacjuTR9qNtd2cXJEOvm+5uOOALoQP9at7gq3N
         p03t4BKl1qqcxPWUrneO0y60ub5fhcItYk4HulNctIodwimT1JXFd0SHyOGp3xDGxmGm
         cu/HT4xaecAYK+pYmibj3vMGD+rozvgzkVbsbtycH4pZWLTk4tZ/owB5bqTcjw8H56oa
         /wrrKJu6F7D2imhV0/+MY8Y/a/Noajd0pK5+6iakfP5ug8JSuXPL9FmcuntI2S72+6ak
         H1og==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1789755930; x=1790360730;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=JoyOc8CCoSjGkrWB9rL6T/fUpbguLCUgVumFgPvb6SI=;
        b=iXMv/XNwnAaML3EPD81UMlz4oV62tsl7TPTlnPPSdCLfzoQJAYgQqMDeDmidWb7j7P
         KtB4namWgTnOUM5AdsvEe1bGwX52wKPrCsoEeWBcMXP88Oa4+jkDGTgp5ijJSJLWW1WB
         VhavCYXd9rj4ttlvJu1tIglBLn/4lLFOOyNlIRt56LeaKob4yLZR1xt8RF/Jw2nAloZo
         c/k5UKO3/iCzgparVGaLDe4rRDUvdVJgohc/3WHa6ENSlePD4qAyoUbKuWO+e6rS8kMX
         h4bEP14REEryb5RDhWjIYUtC8LJL7FnedZbyKG7B6irsYRgBSeTop6swNr82mfQ8okj5
         Yr3g==
X-Forwarded-Encrypted: i=1; AKwUvBx+0MQ82qh+JzvrwM8yajvafBkQ67N28+SgWCuYBrTaJaxwOLoDaMGZDOQp98TD00scv55U34OItH8=@vger.kernel.org
X-Gm-Message-State: AFuF++l7c0OjWnq4xXiqoJtUjBPeKcGmSB8Mw9zvO00bZuw6yFmtum+m
	LjOrmibgvnVWsQKcZwAthnNYd0vkhF92czqUOmj5Glx9mYCgZ0YdbsE6
X-Gm-Gg: AYBFou0hCKA3GDgjvNfwJgwOZcQjKUxb3r0FXkZM6PsBGE1fc56NtUfwHLvKnu0oiUw
	YutsBTvp2UlDHTUOloy2XEkM3WOwltfSkmS3gAB2BHz34MMVHiy2MA3iFhkdZplQxxZcZCeh1ZP
	SzNDBucwx4pfc5EWEhCpD9vE+d2NOmniztYXpwx383Y0vsgx1IArR7XLNFtBG8vvY4kNwlLYYTe
	dqCVd06eAfjGlDTqo7EUZxtosh0vW8+VXoXQCLDibzmHWGzbB4rb3XojkXRAuq31fL4G8oo2Ac+
	uXnH5xDUb1qrkbTll4SHFUVg3fIhXmeq3aEE1zFJM7JwJiSnUXPCEEiK8gX6urXYsVY2rkTzJPp
	pPA9vTyTPp7X+t5cM554WIstOYt/YkU+T6pUYZZfIuNAM2BRHzk23x4m3gKZyYSy5PCq0Y69str
	JyubkEolwLoIzEamjvVC3LCEYP62aFV+7OQkQoXyURaB/2FuNprAl7ErA3iG3yb1OdQW0WCobwf
	hbhu/acIRSf279EWyDGdt537696fKrPMLlXthCdDzhz56qFfMyLwnPYAVd2IOJOTfQdyx0AJOqV
	qlL+qp5p
X-Received: by 2002:a17:903:1a0b:b0:2dd:7549:39d0 with SMTP id d9443c01a7336-2ddb1b86d77mr59804075ad.18.1789755929744;
        Fri, 18 Sep 2026 11:25:29 -0700 (PDT)
Received: from DESKTOP-G3E0OSP.localdomain ([58.224.60.243])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ddc16b49casm871895ad.7.2026.09.18.11.25.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 18 Sep 2026 11:25:28 -0700 (PDT)
From: Jinseob Kim <kimjinseob88@gmail.com>
To: jic23@kernel.org,
	linux-iio@vger.kernel.org
Cc: dlechner@baylibre.com,
	nuno.sa@analog.com,
	andriy.shevchenko@intel.com,
	linux-kernel@vger.kernel.org,
	rdunlap@infradead.org,
	joshua.crofts1@gmail.com,
	u.kleine-koenig@baylibre.com,
	julianbraha@gmail.com,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	linux-doc@vger.kernel.org
Subject: [PATCH v10 1/8] dt-bindings: iio: add Open Sensor Fusion device
Date: Sat, 19 Sep 2026 03:24:39 +0900
Message-ID: <499ecb38dc0b58b979ca1f38d2d30b4ef56cf825.1789753020.git.kimjinseob88@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1789753020.git.kimjinseob88@gmail.com>
References: <cover.1789753020.git.kimjinseob88@gmail.com>
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
index ba2002969373..0ec4e481c64b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1267,6 +1267,8 @@ patternProperties:
     description: OpenPandora GmbH
   "^openrisc,.*":
     description: OpenRISC.io
+  "^opensensorfusion,.*":
+    description: Open Sensor Fusion
   "^openwrt,.*":
     description: OpenWrt
   "^option,.*":
diff --git a/MAINTAINERS b/MAINTAINERS
index 214aeee7642e..9463b8111d52 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -20511,6 +20511,12 @@ F:	Documentation/process/maintainer-devicetree.rst
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

