Received: from mail-pf1-f170.google.com (mail-pf1-f170.google.com [209.85.210.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F363D1F5842
	for <linux-doc@vger.kernel.org>; Tue,  4 Nov 2025 00:33:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762216409; cv=none; b=aGj5ZbPvdUqm6cn6zBJJXce57jAgSMwJGOm9NXMK60JvW1jPvewLm34Sq2Ozv6gfnBmeKlv9Gt32kokcmaVhfWXjpJpdwrg0M8bnVJw4DyXmffNJuZYvpSs5t9NyMrxfHNudpMse0KoDOKJzqsCbi4brY7nO/a8WO3D9xgbfSfk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762216409; c=relaxed/simple;
	bh=jmST4cbclzkiAEDiwG2BErRGZct5eZ5VJ+6Q/QlBDqs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=V9ZxkbBCoXcQ3JBRncBt7WUs0EYaPBN0HXKmP9e1Oe87Dt2b4ydSpB3/i16IpGkP9QprEoIl04TFHqgNt7ZCDC5SwRo/fdtOr7guWCAO0IcctENpFDlFuhxtT153dnhsxP8W1JofC4sYf39tCRAUVqNxPZf0CJfxspXHwDwoDHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net; spf=none smtp.mailfrom=dpplabs.com; dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b=obyEU/IY; arc=none smtp.client-ip=209.85.210.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=reznichenko.net
Authentication-Results: smtp.subspace.kernel.org; spf=none smtp.mailfrom=dpplabs.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=reznichenko.net header.i=@reznichenko.net header.b="obyEU/IY"
Received: by mail-pf1-f170.google.com with SMTP id d2e1a72fcca58-7a9fb6fccabso1633374b3a.0
        for <linux-doc@vger.kernel.org>; Mon, 03 Nov 2025 16:33:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=reznichenko.net; s=google; t=1762216405; x=1762821205; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=kowxeIsoBsM6IJaG5YMYXb1ynonjUIpE7aGx2hbnyfI=;
        b=obyEU/IY+FKe4TUfKRMQLRnLkRFx+e4EgyNgU1O+n62ZVTyR76BhrWuWMQu8ngU5ro
         JiyO35kcJW5nq3DdvIu381gfjbCbigzaDcjkeGQu6Cf6W7Mw/t1BULGVZgoA0nCNT8p+
         oWnO837uTI7UqfIGHEC5FgmEUTw2UmQVFloZ64o26VvlDBY4ob8mWcEplbl1OfvKeCtI
         EC3MLZ+CNvZtnWF6uA7E5yt91WS7nEKUCS6nuOvmvdnrUQvha+9Qv0A6jcmL5wWOSzKO
         IgJAq10u1KJG1mVWGe2djXy6tiUPQ9SvMnAXA2mPt+O8/HToEtZ41v7S0qZ+uaACulcI
         7g7w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1762216405; x=1762821205;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=kowxeIsoBsM6IJaG5YMYXb1ynonjUIpE7aGx2hbnyfI=;
        b=CeO7UH8IB88kTe+967T+T0Eczr8bB2b/CZVLbb3XQmitTsZUTsfIUKV0ArLaFo4t6D
         wDE24e3lWiccZi5Z1/g1fCaThGkhK8SNDzR7zJ58QavhILQlaSJBo3i7+wruvxx9TSAz
         iC9l7IKeLcbJrZDAq3mGS56j34pBHCdpYrz758ks9l82hlGm0Gho0SWn+ZJOFz555qaB
         00LDtu1FNJKiPZzI7/wSOR/gmB2svFmML783M1KTQBdou+vtmMpCI3WMgLK6we+2NIde
         LlTKNZVd3RrCiK3OgAhkrxMLaqzmiyb3LhuTz/g3TRkX0L39zxcptJklyxXGx7kmfc/6
         DxzQ==
X-Forwarded-Encrypted: i=1; AJvYcCUw2hQWyHyHeQL4l73yEts2YaRllxkIx3wMLD15EgtJgm5WXvlLwAzGFJK0iQnZI2PtV8I16Ao3ldQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyddF3YhmBWYtV4YPIBGXiGTulPSS1Br2fHTNw+KizqdprCWC1G
	nJov8j/vrtNtvQSim6pYl84YeHTdOyRAMkq1+xEvev56je2ULmg9YUVHKTYxMsEXB9QVtODhMGZ
	mXgpduWC1UQ==
X-Gm-Gg: ASbGncsMWDbtNfkdOTHlaU9mhWPu4EhLHPIfMfSd7EOrvEYu1VM+xxOX0qKjHFzJvCA
	fE9dVF+NXUt8PIjKA0iX2cxV3GdRIiYdeSnJ09mD6VaRJsaWUwZhOx/1WgPZh9ewhe3zVkzhvCb
	i2tnQC/S233QW03W9y4VK8Ge+9es31fKByaOzTw/4squ4SS5dunUbW8PbOYDEnhhPMhMtxw0FzI
	HVB/VPmCvJvd1OJEkPFIKSMytaSzDxzbKGwpU4qtDdzizGANCCp68U3CHy3b9ptG5KgSG2U7joM
	OUldI9/ZPRwg0AsBq1h/1pSsKaSlPSWGWA4U2ciMrCkPstIOtEWwjvy/1b+KnePIazUMNl54jfd
	X5/42Iu0nZSEhgOnhPWPSQSEsMxgiU1GTs6FagOeNPThK0Rz7mMKsZ9EqgvPge0v2e/xvZzAPLq
	ghKWBTwh1/FUDi3T2EgQ==
X-Google-Smtp-Source: AGHT+IHVIWBSA0y1P83cw1L08AqwpYVRKzgFYZZwfU98ZbJAsIFB6Q3vOEOtHFbXZCtKTvVXIwNvag==
X-Received: by 2002:a05:6a21:3394:b0:334:8f40:d6bf with SMTP id adf61e73a8af0-348cc2d2b76mr19149622637.42.1762216405308;
        Mon, 03 Nov 2025 16:33:25 -0800 (PST)
Received: from z440.. ([2601:1c0:4502:2d00:6127:c8ee:79ad:a4c2])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-ba1f9615c9dsm360123a12.36.2025.11.03.16.33.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Nov 2025 16:33:25 -0800 (PST)
From: Igor Reznichenko <igor@reznichenko.net>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net
Cc: david.hunter.linux@gmail.com,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-hwmon@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	skhan@linuxfoundation.org
Subject: [PATCH v3 1/2] dt-bindings: hwmon: ST TSC1641 power monitor
Date: Mon,  3 Nov 2025 16:33:19 -0800
Message-ID: <20251104003320.1120514-2-igor@reznichenko.net>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20251104003320.1120514-1-igor@reznichenko.net>
References: <20251104003320.1120514-1-igor@reznichenko.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add binding for the TSC1641 I2C power monitor.

Signed-off-by: Igor Reznichenko <igor@reznichenko.net>
---
 .../devicetree/bindings/hwmon/st,tsc1641.yaml | 67 +++++++++++++++++++
 1 file changed, 67 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/st,tsc1641.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/st,tsc1641.yaml b/Documentation/devicetree/bindings/hwmon/st,tsc1641.yaml
new file mode 100644
index 000000000000..cb4e41f0f99e
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/st,tsc1641.yaml
@@ -0,0 +1,67 @@
+# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/st,tsc1641.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: ST Microelectronics TSC1641 I2C power monitor
+
+maintainers:
+  - Igor Reznichenko <igor@reznichenko.net>
+
+description: |
+  TSC1641 is a 60 V, 16-bit high-precision power monitor with I2C and
+  MIPI I3C interface
+
+  Datasheets:
+    https://www.st.com/resource/en/datasheet/tsc1641.pdf
+
+properties:
+  compatible:
+    const: st,tsc1641
+
+  reg:
+    maxItems: 1
+
+  interrupts:
+    description: Optional alert interrupt.
+    maxItems: 1
+
+  shunt-resistor-micro-ohms:
+    description: Shunt resistor value in micro-ohms. Since device has internal
+      16-bit RSHUNT register with 10 uOhm LSB, the maximum value is capped at
+      655.35 mOhm.
+    minimum: 100
+    default: 1000
+    maximum: 655350
+
+  st,alert-polarity-active-high:
+    $ref: /schemas/types.yaml#/definitions/flag
+    description: Default value is 0 which configures the normal polarity of the
+      ALERT pin, being active low open-drain. Setting this to 1 configures the
+      polarity of the ALERT pin to be inverted and active high open-drain.
+      Specify this property to set the alert polarity to active-high.
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    #include <dt-bindings/interrupt-controller/irq.h>
+
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        power-sensor@40 {
+            compatible = "st,tsc1641";
+            reg = <0x40>;
+            interrupt-parent = <&gpio1>;
+            interrupts = <1 IRQ_TYPE_LEVEL_LOW>; /* Polarity board dependent */
+            shunt-resistor-micro-ohms = <1000>;
+            st,alert-polarity-active-high;
+        };
+    };
-- 
2.43.0

