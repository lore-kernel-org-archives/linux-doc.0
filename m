Received: from mail-pg1-f174.google.com (mail-pg1-f174.google.com [209.85.215.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC1AF314B9D
	for <linux-doc@vger.kernel.org>; Fri, 16 Jan 2026 09:00:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768554014; cv=none; b=uZpZqsTDhT/zgSmbo8srLImnGJR/qBweIJ/PGc22dTWYbZhtpYgxDTAysVcTB9Y5YyLkIqr8tmAJ4k8/B2IxNZG0QuzsUpeL/OXYPPyMRHWVWP2TyOxVmRzK9eg6rryle2my/n2JHiO48IHQDxX7vavHqA/yu5iPrRErtK8oNMk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768554014; c=relaxed/simple;
	bh=k6kJZK+mSCtSaeQ/Na3/Nw6zleT4XQn7IR5BvpypeEg=;
	h=From:To:Cc:Subject:Date:Message-Id:MIME-Version; b=RJx/j2BkaimQfkaLBZqQMkMI5UKw4KrsfgVaiYkGPa5k380iy8wmWYLHhZ3fVZnCdFkB/mdYjscYT1xu/p0tRkaFL76b7V5caPXH3BhvW7IFgv/IZeYl1i7tGR8QyNWcNjDxRIQJFJMJ1dEki0OqEcTJyaNUAamu7AAcJ6FCppo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=CbK4WM0o; arc=none smtp.client-ip=209.85.215.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="CbK4WM0o"
Received: by mail-pg1-f174.google.com with SMTP id 41be03b00d2f7-c0ec27cad8cso790960a12.1
        for <linux-doc@vger.kernel.org>; Fri, 16 Jan 2026 01:00:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1768554011; x=1769158811; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=i4V8XqUH2nzegFm44X+jl+a+Lf24yE7XhsC0KU3eBG0=;
        b=CbK4WM0oNmsiD4PuBpttHMGmWa8udqCN0IRYH8sJvepkJ2xGw506y/B8bCNq0zEYDy
         DRtfcHSNnVxYiN/7pg6EC5oR19qTS4rCnLPknXYqeeBT6cJJMo1a0Wn7fwztWmUy9WXW
         kwngtE4yyptAAJLo78Km0tDZu6MRrBfmFt8wzTjs0w7Cp4mJA+Rc9jdTfg2N92g3KTRU
         yMh/Gua6lCcO20O+y4By8HtBe7/Q8aFUt4r0ggrrH8t60AX29CFoWMQD+or5BpfQ0vqt
         ZfparrEP9174vNVg0JsnqJrPIujnepKAMSqXILoU19L1TIodJeXdCox3fNwLGZ2bNGxZ
         XydA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768554011; x=1769158811;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=i4V8XqUH2nzegFm44X+jl+a+Lf24yE7XhsC0KU3eBG0=;
        b=XWzXL0M59A6JPqribGvjGhWXshE718WsoLyaQu0AzCgqeGngvPdkgGq2FStAwYZoU6
         C18HQKQUKeMTwFf8WtP8AeiiOvGBvNu0M67lteLIpeJswzMdUmhqT4lyJGWcdims1I4j
         /0jMNJbRY7v+XJkX99vETsXD+6X3/wdhAiCYwLYXZuJ2skA8c6bNAoxe/CF0M66S1+Ur
         BG3m914d+RiGL7Ryz7QMdu3jJNcWRcfSClD0+7KORs2D5l5vd6XuMT4OclSsXEncoOQh
         603Or2Z2qTsP8WA5zdU4ODgfoWThrUZkYD/ZewFvyrdkzukkCnZfcT2zgovmq+qD0+Da
         V7Tw==
X-Forwarded-Encrypted: i=1; AJvYcCWcMHdel8VJCQ876/8YS36erfSLAlIC3QuX9TrUurhZeDKbCWdcq+oohsXT6DtPeAl7HTQ9YTYOyLo=@vger.kernel.org
X-Gm-Message-State: AOJu0YwxXoHHuWofgNPOSFhEGUi1X1eRNmsUwE2C7le0l3mVqcR8LOrF
	4jr49WacYI1X1nzDB1OSWkDdlKWyafMr5T11i/FhqESYT8R37lqRkZk6
X-Gm-Gg: AY/fxX5zAINH6ff7Y1Z6HS/k86mOz/EjKAmgA5vSd6D7H8TdTGRN89ykJ2/UBw2aq0B
	l/zhr00qdZcJJqkoEDDBfAau2Z7Lguq/3dxYKmG5PtEWVYA6wb7kU+gvcMa00GGZca4kvW8Y8dh
	S1GdNg+8TKbd85WgVjTcn1LdJKwvH6tH8WSYUKlpnAYn/iX+6lZHSi3qZNx2h42qoXvAWLAM/sm
	6/r9jfDVZ+qJiGd9MQt5tNWsfP0X2BFWFeip1HWh2VMrMn//KzQxchBJD6bhJD/+pEffUfgjnw9
	FRpqbveQ1YRYyjVP7hw0kuAkjcJiBKPvLvQW2zvTYhsdTM5HSVdM5UPgLHNGFbB+HVAySLpPKwQ
	Xb/ehlHlOllPWReFNnlDuecwHsRckvOcaFWuWHHOm+UUnnde2wrjpK2g9E+ZYR5evngSCa+YKId
	Avk+0QY/l5rgKSK1OF6Xgeu+B+K3iIsf85c0g+HO0uANlAhnMVcKCA6oIpEMla+RjW3P+/QE6V2
	P7JsshsCZWd1qie9gC2XXn6pwpCi10=
X-Received: by 2002:a17:903:1cd:b0:2a0:be68:9457 with SMTP id d9443c01a7336-2a7177d0da0mr26039185ad.44.1768554011456;
        Fri, 16 Jan 2026 01:00:11 -0800 (PST)
Received: from charles-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a71941b915sm15304445ad.90.2026.01.16.01.00.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 16 Jan 2026 01:00:11 -0800 (PST)
From: Charles Hsu <hsu.yungteng@gmail.com>
To: linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org,
	Charles Hsu <hsu.yungteng@gmail.com>
Subject: [PATCH v6 1/2] dt-bindings: hwmon: add STEF48H28
Date: Fri, 16 Jan 2026 16:58:01 +0800
Message-Id: <20260116085802.696661-1-hsu.yungteng@gmail.com>
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
Changes in v6:
- Fix patch formatting issues.

Changes in v5:
- Move the change list into the commit message.

Changes in v4:
- Fix an incorrect datasheet URL and update it to the correct reference.

Changes in v3:
- Move the STEF48H28 Device Tree binding from
  trivial-devices.yaml to pmbus/stef48h28.yaml.

Changes in v2:
- Fix the entry in trivial-devices.yaml by correcting the comment
  and compatible string ordering.
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

