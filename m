Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A471374170
	for <linux-doc@vger.kernel.org>; Wed, 22 Apr 2026 12:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776859586; cv=none; b=sFi7fA0Kg6L6ALU+TmWfdhnTabo/E4gVEVpAhCCi+ALZVV2poPgRryhOOLUNzGEJ3wtNn6DczwCNpnweNWzkvlkyHD6lsbGKehtQ3X6pwAtNyRczFXB38zQj+tbSQsTxCLzwPUq6tFbA9EX5peoKvbPmhFhtEXc9ythJhXH+2ks=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776859586; c=relaxed/simple;
	bh=K6kXILzd2iMJnONaLp/UgH6p8zJDWKMT+WvFlL3J0Js=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=oUrsyk+X0fwGeycxiPIParY/0eroDeMFvj2k7thHOvnsrkQ04S3cXGSCrvrOsYQ5FFFK/I+HIWN9sB9LQZFWOkxjisZbHmv6HQScXXC6QHB5zbi94lmvuGco1fZXN3P0ADTv8DnXezipEkfveK6qs6yKFmByaqP18/xISOzemiY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com; spf=fail smtp.mailfrom=inventec.com; dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b=Fjk2OJOk; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=inventec.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=inventec.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=inventec.com header.i=@inventec.com header.b="Fjk2OJOk"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-82f69adeecbso2299353b3a.2
        for <linux-doc@vger.kernel.org>; Wed, 22 Apr 2026 05:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=inventec.com; s=google; t=1776859583; x=1777464383; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=HOQKPwDDzrcAD0phDanh6XQC7w96PXuOSuzVKz/b9lI=;
        b=Fjk2OJOkngr82YUWzoDl6Kd03zgRcCUpGCcHwsEJ+VDfDP0+zXimq4aUtc5Bi1grEM
         NCDE0KmDWrLixApOnFQP7vNiHPFeQtVglOxaWoRodySFSnIRVNPyhWDK/3yauclvHFYv
         ziwqRknCyHmXr+WPFLHR3oiqAj6Shoq6uJbHdXcQBylQbTGbbKGiHclrLgKcRu4Ws2rg
         UmxQKlKITCIPgktIp8W/786U4PrZyqsAhuKQ/yb2TYkjO387GFFZgj6MQaLksknET8et
         mikpn9v52+eURDeduWSrn1GTLUPqFdY8ZWW56vwoiM4VBF2ySTtxiLrIfoi2zjvrVgUn
         uJhw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776859583; x=1777464383;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=HOQKPwDDzrcAD0phDanh6XQC7w96PXuOSuzVKz/b9lI=;
        b=MPgXG16OSjFHl8A9j4fm2uCNs5GpdwdonhLKcUc/MV0IxSIJ7Em4LBgoj/dH/Mkjya
         ZKx3Fm1a6940Zn1yO0NiFxdNvOM/MkcQfPoQRgnSbOJFsc5Zjl/sQwCfEJ0H207totzj
         8HYAzovmlw6d1Z1LSwEIT8wecCbS95Errn5fQrtiumtvb61K7khF8oqfWXpdh6YdO/CB
         HqZna3CwDzRhKE2rQ+J8B7zEPvuf5dEELk+TDX/9cGijcXTw7xdBeMM5cHUAlzpwFqP3
         C1Gd0kltxLtgKiXx3W1eFWURp7Bcb29PXSKenSkW/XDFjhYji7rU7RBr6ujCF1Nfwh5a
         K+Hw==
X-Forwarded-Encrypted: i=1; AFNElJ/qQHJFoNFL9JjDwtqWUPTIXTN4IlaGkQmbIpn9OijzbJiQ/Gr0xGVisn15ozTNCUVe9NLWzhsV4Ws=@vger.kernel.org
X-Gm-Message-State: AOJu0YzjqZ8mgYndOo2/T8IOaMaCfp3R/ptbcAzk7v1e+ph9lHcx7KtV
	9cYMU24+FjeiEBLq8WNQ/NV5lMNP5esi9z6kd3E9CXwx4rguakaFN6WAPjeGp7W+orY=
X-Gm-Gg: AeBDietA+kZGOw7PoHs+Aj5qfUiAUkz8mw5L5A1ECMe89mgn5dFaZXjtDeP4ZVNWtSu
	VIv2sNubcLkpRIHYZ1bBmU5l+/A4kNfGjsCodlKkY2cbjewCzmxpjxJAb6hmEJIvoIvRUWAZheR
	o4AgJA3RcTUWCIWZt3nW1uBRfvlwksIwYSAK1mRP8VdD3K62ymBW/4d+y4WcpO28wuxTJZcMxM3
	QyXD11QEQhDNkrcrM+5RYr2C+6A5tddsdobcJp8wZ7Ntx7PLXg02cgEr3XiZhxYF1Kncwxph9kf
	vSdLY3Wz2a6l+o2VpSPGx9KLJip4fDeb4uhhi1mH24L/XWmYJpwwqXzf5AVWXsk+iocJXsXFbek
	aUusP6Lbz6FbHygS3jQ/sG47aJoahQ92zvuyd48YDFE4/zdLYEBsPOYO5GzMCZ62k16HhJtPll5
	Dw8P+HxATm23a2VxgRm06YILG7lJk/fJrWv3MYJxDn4TXsvdnl52CUS1g8aFhm7W3aANy21mqhX
	FxX
X-Received: by 2002:a05:6a00:10c5:b0:82c:ddbb:7db3 with SMTP id d2e1a72fcca58-82f8c95c94cmr23378749b3a.25.1776859583175;
        Wed, 22 Apr 2026 05:06:23 -0700 (PDT)
Received: from [127.0.1.1] (60-250-242-163.hinet-ip.hinet.net. [60.250.242.163])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-82f8ebb3fa2sm17086636b3a.29.2026.04.22.05.06.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 22 Apr 2026 05:06:22 -0700 (PDT)
From: Brian Chiang <chiang.brian@inventec.com>
Date: Wed, 22 Apr 2026 12:06:15 +0000
Subject: [PATCH 1/2] dt-bindings: (pmbus/lx1308) Add LX1308 support
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260422-add-support-lx1308-v1-1-9b8322f45aae@inventec.com>
References: <20260422-add-support-lx1308-v1-0-9b8322f45aae@inventec.com>
In-Reply-To: <20260422-add-support-lx1308-v1-0-9b8322f45aae@inventec.com>
To: Guenter Roeck <linux@roeck-us.net>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-hwmon@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Brian Chiang <chiang.brian@inventec.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1776859578; l=3150;
 i=chiang.brian@inventec.com; s=20260316; h=from:subject:message-id;
 bh=K6kXILzd2iMJnONaLp/UgH6p8zJDWKMT+WvFlL3J0Js=;
 b=eCXpJOmrWLqiPrJTwm7WXb64vLmd7+OKz7DeIasA+gQhQ608RaflSXpzWoGj6cZgUlwxmSB7+
 bW6GwKYrtpOCFd38S5TRj3zMcnG9t93tcXaawLCh4xfDP1xzQw2i5yG
X-Developer-Key: i=chiang.brian@inventec.com; a=ed25519;
 pk=q+NqJYuJbGpA9KS9941D7f+8PVVW+k7DvaGgFykBiUc=

Add device tree bindings for the Luxshare LX1308, a high-efficiency
12V 860W DC/DC power module with PMBus interface.

Signed-off-by: Brian Chiang <chiang.brian@inventec.com>
---
 .../bindings/hwmon/pmbus/luxshare,lx1308.yaml      | 49 ++++++++++++++++++++++
 .../devicetree/bindings/vendor-prefixes.yaml       |  2 +
 MAINTAINERS                                        |  8 ++++
 3 files changed, 59 insertions(+)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/luxshare,lx1308.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/luxshare,lx1308.yaml
new file mode 100644
index 000000000000..a8d92447508d
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/luxshare,lx1308.yaml
@@ -0,0 +1,49 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+
+$id: http://devicetree.org/schemas/hwmon/pmbus/luxshare,lx1308.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Luxshare LX1308 Digital DC/DC Power Module
+
+maintainers:
+  - Brian Chiang <chiang.brian@inventec.com>
+
+description: |
+  The LX1308 is a high-efficiency, non-isolated, regulated 12V, 860W,
+  digital DC/DC power module. The module operates from a 40V to 60V DC
+  primary bus and provides a 12V regulated output voltage. It can deliver
+  up to 860W continuous and 1300W in transient.
+
+properties:
+  compatible:
+    enum:
+      - luxshare,lx1308lch
+      - luxshare,lx1308nch
+      - luxshare,lx1308sch
+      - luxshare,lx1308ldh
+      - luxshare,lx1308ndh
+      - luxshare,lx1308sdh
+      - luxshare,lx1308
+
+  reg:
+    maxItems: 1
+
+required:
+  - compatible
+  - reg
+
+additionalProperties: false
+
+examples:
+  - |
+    i2c {
+      #address-cells = <1>;
+      #size-cells = <0>;
+
+      power-module@60 {
+        compatible = "luxshare,lx1308";
+        reg = <0x60>;
+      };
+    };
diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ee7fd3cfe203..67fb1592daaa 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -967,6 +967,8 @@ patternProperties:
     description: Shenzhen Luckfox Technology Co., Ltd.
   "^lunzn,.*":
     description: Shenzhen Lunzn Technology Co., Ltd.
+  "^luxshare,.*":
+    description: Luxshare-ICT Co., Ltd.
   "^luxul,.*":
     description: Lagrand | AV
   "^lwn,.*":
diff --git a/MAINTAINERS b/MAINTAINERS
index c3fe46d7c4bc..58fa595cff6a 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -15175,6 +15175,14 @@ S:	Maintained
 F:	Documentation/devicetree/bindings/iio/light/liteon,ltr390.yaml
 F:	drivers/iio/light/ltr390.c
 
+LUXSHARE LX1308 PMBUS DRIVER
+M:	Brian Chiang <chiang.brian@inventec.com>
+L:	linux-hwmon@vger.kernel.org
+S:	Maintained
+F:	Documentation/devicetree/bindings/hwmon/pmbus/luxshare,lx1308.yaml
+F:	Documentation/hwmon/lx1308.rst
+F:	drivers/hwmon/pmbus/lx1308.c
+
 LYNX 28G SERDES PHY DRIVER
 M:	Ioana Ciornei <ioana.ciornei@nxp.com>
 L:	netdev@vger.kernel.org

-- 
2.43.0

