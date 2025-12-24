Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7440178F20
	for <linux-doc@vger.kernel.org>; Wed, 24 Dec 2025 08:50:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766566231; cv=none; b=lFtD9nS9moIFNji+AIzdSVxkrHCLh7r2tRxqQIJ5wasIpGUAqp/1b2Zn2qLNpdjcLFleNfN81jbY9wtBuZPGkleP26s4K4PvO0N8im44xwXmeaXeia6Y+S9SCSGNOpt7uWWK9es6UChAqvcIshG7UqWAKsjRZMPs89DYAsYyN6s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766566231; c=relaxed/simple;
	bh=14Q2KrQgefP7k2CkV/AvXV2dv7qPTPm5udnPs2slKWQ=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=WOMB3LX151fb/ppxcW1nJ4CQ/LYaMHOoqjNijg/NXKY8G6Ou35DuMwqvZyo3pyo7deQe/MgJK0iRbPFdhLXleLoqxFsx2Q7K8F0GymegIJymqvhA5nYgxqdd3Jpi02XsQJ/AeIscQvgANMFInuRC5I9up25jaONru7d6HhKDguA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=BhwYUUMY; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="BhwYUUMY"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-34c708702dfso5963575a91.1
        for <linux-doc@vger.kernel.org>; Wed, 24 Dec 2025 00:50:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766566229; x=1767171029; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EqUvLG+FaPCBDIi8nSafdxPiptVy75Ukg1G+12V+F10=;
        b=BhwYUUMYW3Xa46ALpJDNKFo6VZi2DT851YcABY7RkevD0rDbLgF02Vo3HKEt1LE1lp
         3D6RR3EZT2ViOckgvPVSIQcBpQLl+/Tq0nXiKii4yNDthyWls1Q2NV5JkAMsFqtxEAG4
         iKM9+qdm8awnvtbd0wNUn+FKXToq6ls3cJr1XDCx5RzaWtsP09sp6lbBklSRpujkg6NH
         Eq3LLgOu21oPQ+IHJ9x7rQXXo4Q3k8E6pQ+1+sL5ko7sQ9ZzWIxVwR4oLU+yc18j4fos
         XHZ4jCNbVjv9rd+83ykD3PLMNsHO44kakjLhywhDK/5NEIimThRFNFqQVMpYDSfPMmeH
         Hf+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766566229; x=1767171029;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EqUvLG+FaPCBDIi8nSafdxPiptVy75Ukg1G+12V+F10=;
        b=iVOWk9zdV+uoqOEXsJ2LPad5fIA15w2JhS/5xD2qEdL9iWgkbrAiNg0QbMTK3xNeHl
         Ph1zv4INuiYGINkUSUxsHVhPPYZ/JSBxpN2AhzEMY2IyeLV7YFse93cfQ8Zvd68JoHRI
         Qk3h4JbiZyGY1ONA1NUnKekRS3sBxvU/plnfLTC0tlVhjAV6A7CVUdvgkfN5aDd6xElD
         Pc4NiKPqmjU6t0plFX/VSmsXfqgoztg6a4O3+qzO2h8MBtFw4vy0721lc9S7KfQuw4Dz
         rsSxrLCjfyuihpDee6iOtKKwIkUPNnFN/Nxu6wgRReEZfyCELQ4VxLRmRbYznUgEeLda
         8kwg==
X-Forwarded-Encrypted: i=1; AJvYcCWMSTw/7O7w410H78dcPVfMKGma3B/CVBh7FrU0dSKSN4suFxMEwyj3iwD1qx6kLtFySzqBCWAjIoo=@vger.kernel.org
X-Gm-Message-State: AOJu0Yz3gucejFOwVfF92Mya4lEXoHxHBHdKpmT4nh3fZGoVtLSMX9Ak
	3veYnylsb+w1W66Wn0TdshG0nUv57YBXVN2noVFmosHgRinFLbxGiKd6
X-Gm-Gg: AY/fxX46x6hDrk04cW8O3CyBzeZx3Fnn7gdNZZSFUeT0uNg4n9TxdKHZyyARQ+3JMbt
	lwv6xZwgBwTD7Rw1tJ+7nw1K/HRvVT563xSuA4LCUcphFvvKWz5ZSKqi+3HXj6oO/l4JIMCEDhb
	SruLKKdbkZVqGl1KnSA1nKGz/5yX+AN2spNKURVZdptqjq9zYBI1sxCDvLdMAi5ybW8cdSvcNTW
	9LhrsmD7fJGckNUmPc2W4fHFWHBkSiOfn3v3a8rNBWB31hyRcKW+rjiH4oKm4Nt/+t2hI9ufuxn
	WZ5yBUUPnmIcxUatN2zphhlNvqHThSCU3iT8v7kB4BA0rwt0wEzE8E+/IVGIXwNbZJPd2VxZVQ5
	JoUgLW8sMG+DhfPLNNHWrvkaGUiPJKR+YZkpPzp53P459PsDFQjQ0HTo/jI8iJUD8dld8OvDn/o
	5LYorvwa3dP0NOyQymYvVYKQX2/rSqjBFENBdwlWtfUxhyCXLw3/NbHeFtOZvBp9HUQCYigG3No
	ACvoEhL+7iAuiVTP1ViXjYnAmT+fJ0=
X-Google-Smtp-Source: AGHT+IG32bEqtgGX+aUU+Vghs/FHpYAMoBhmbtVYpF3KZbFDPID9DvkIR8rsUWNz2u9SL+Wd3iWElQ==
X-Received: by 2002:a17:90b:1f8c:b0:349:2936:7f4 with SMTP id 98e67ed59e1d1-34e921bc5c1mr12117693a91.32.1766566228667;
        Wed, 24 Dec 2025 00:50:28 -0800 (PST)
Received: from charles-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-34e9219eb13sm14994055a91.1.2025.12.24.00.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Dec 2025 00:50:28 -0800 (PST)
From: Charles Hsu <hsu.yungteng@gmail.com>
To: Guenter Roeck <linux@roeck-us.net>
Cc: linux-hwmon@vger.kernel.org,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	Jonathan Corbet <corbet@lwn.net>,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Charles Hsu <hsu.yungteng@gmail.com>
Subject: [PATCH v4 1/2] dt-bindings: hwmon: add STEF48H28
Date: Wed, 24 Dec 2025 16:48:20 +0800
Message-Id: <20251224084821.2092169-1-hsu.yungteng@gmail.com>
X-Mailer: git-send-email 2.34.1
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device tree bindings for the hot-swap controller STEF48H28.

Signed-off-by: Charles Hsu <hsu.yungteng@gmail.com>
---
 .../bindings/hwmon/pmbus/st,stef48h28.yaml    | 43 +++++++++++++++++++
 1 file changed, 43 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/st,stef48h28.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/st,stef48h28.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/st,stef48h28.yaml
new file mode 100644
index 000000000000..c6a4b02bcd84
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/st,stef48h28.yaml
@@ -0,0 +1,43 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/pmbus/st,stef48h28.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: STMicroelectronics hot-swap controller with PMBus interface
+
+maintainers:
+  - Charles Hsu <hsu.yungteng@gmail.com>
+
+description: |
+  The STEF48H28 is an advanced 30A integrated electronic fuse for
+  the 9-80V DC power lines.
+
+  Datasheet:
+    https://www.st.com/resource/en/data_brief/stef48h28.pdf
+
+properties:
+  compatible:
+    enum:
+      - st,stef48h28
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+unevaluatedProperties: false
+
+examples:
+  - |
+    i2c {
+        #address-cells = <1>;
+        #size-cells = <0>;
+
+        pmic@11 {
+            compatible = "st,stef48h28";
+            reg = <0x11>;
+        };
+    };
-- 
2.34.1

