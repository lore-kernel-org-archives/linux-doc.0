Received: from mail-pl1-f170.google.com (mail-pl1-f170.google.com [209.85.214.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54E152727F3
	for <linux-doc@vger.kernel.org>; Tue, 23 Dec 2025 01:50:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766454645; cv=none; b=TK0k73Fy8lPnHbfxGWt3DH7U8DY6vSnPGzOhHAbMAcBBrANxQ+eOmjrskqALc3yOSp2bnuB8JXH9a07vGUVZNora3oUJbLe0+d9EvNeDhrRWvg6E4v3EANWdbNvBVDmTPwYKuP1JMFBA56zFPo0c6XZSDRhyn/N7knurdL3xY4E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766454645; c=relaxed/simple;
	bh=+DRRDzLT8DTORlxy/aZPYTHIgYcOA6ac65ZoTv8eqdM=;
	h=From:To:Cc:Subject:Date:Message-Id:In-Reply-To:References:
	 MIME-Version; b=YLUcwQUQJFTLLgESb90bhKni5rFXcVVhfAgSLInOYZglRkC/CP0s++rQyqrIEP2KNFErLaMbIJAllum0z7y5KzMu9svqmy8UZtfqlFSkehcQhir2YqsXAPfR5Keaou7yXkSOk+bf7RgiL8UoQM3DBUa2jXUuRdqiCQe9qvghYyg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AmJnJjPq; arc=none smtp.client-ip=209.85.214.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AmJnJjPq"
Received: by mail-pl1-f170.google.com with SMTP id d9443c01a7336-29f0f875bc5so65464445ad.3
        for <linux-doc@vger.kernel.org>; Mon, 22 Dec 2025 17:50:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766454644; x=1767059444; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XByBk8lgIUY6LkZMpTEMonf8apmm2vmEOstW9GDn3gk=;
        b=AmJnJjPqJo0qP4vu1xD3ln74+i1i7G389pI112du8DUZv8otrNz7AQ//4HUOvsNodV
         6LmEhKw8Q8KA1FPuFhp8gfepM7kaubPE99i3W2NFb9RkUIK1jSOnxFfopclhECHxNNPQ
         wPrh4A2RMTTShGgdHg/wytqHnQX+cBdGak3WAm0XgWNc1bGk/GTFm2tG6Oo33FtkiIrY
         fETBN2DHKHsw7FHgijT1dJN9aISJ6STKOjV6O8m27N7q7i0/fAgao2trgeuFlH/67P2m
         fpWZ5J6Iobt9tOItPAdxAFglQ+NWcI//8NaZGTEbS1XBLoOBgDrZmdbb2/BmuvmIW2WQ
         dacw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766454644; x=1767059444;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=XByBk8lgIUY6LkZMpTEMonf8apmm2vmEOstW9GDn3gk=;
        b=IbPpX/Zh0Uq3XWZUSl3LvZiOiG52xS1jK0YznowkFFWxOGl/bWIUlkkxDUCwvHVcNJ
         E0PhgKq2QkF4Qcd8dYWlJWJlwiRMFTXxEXwf1+yVtbvIExhgTcJ5IAw4cfyVJcxbdvUp
         q8MC7wNQPjRj+kSe1U5oO0VEPkW4iPtFSax4pmVZsAauLNXdmO5qxPSJ1Os7XFsjtVRQ
         nDE+Wzqh0WqA2H3xK+KiOHqQChv2cWZy3DATG0wwph2YhJUK37JYjwEqs5JcNF7+Wfuj
         ByzdgNkhvQlRbaa8gfsTj7d5kMfpVz2bPLosZCzkiueoq+2CdhedJzbBNaxdf7INnfXD
         IxuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXiejIKXunI6ipmDuOYCOskxqHWVhTY8eqrHqszCp0PkRW5IDWCWYtSOXWMAOztchLqcTVEJQj15lk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxVc6PSCAOP3PIBBWFz/BPoKOADk0R8zz7CbbfmwxVS8NmSYVKK
	k+kcDAuscJkSyjGn3c7BOXUIE7aUZ9/emi+d03t0mvf+fHkx5UkO6itG
X-Gm-Gg: AY/fxX49MJrA6ZXhtuDzYtDJiufIArT2yfdC9ZUR+svczkxScDBej8Cp6YpJOBf4RHy
	61gaG9Xc4ECchQfG6Ws/n0E/G1kt8cf9m++PnV7zTkRHJ+DStf6kopomUBUnFgwevIYMlOG+1qx
	tRsHek+Zv8eINiUKCOvgxd3G0On2XFHNWlkoRkjDEts46HzN67YgZydxY50psGGl2r6RSzMDOFq
	XY3j1o6eaUPZHD3hGJlwO08OvWObpThgxDAb99DF/mEV4OGLKSWzAbC6+IiuZsUe9x9pAJYYQIS
	BBrIXUZdYNhq0WBxpCmoK2/dm0bAIJRktuYtyPiq2gc9DYvreXMr9b/WAmzz4Y9jeU4i0UOCkMY
	+CejqqZ5KelsGWN6cIYHecvfUYQ6pEoPE2v0A0309Cp57KK+e6tNPG0E6Dd01va37bW+9j0UbDH
	r6dVQxSbMUkh3qd8fMzjczlCHzOBeDxe7AA1YkrSN5o4KTsP0t0UGBr0/8rGwvGvoroX8YjgmDk
	Zy+5+zT7LzM1XWFSTqREsJo97NE/XU=
X-Google-Smtp-Source: AGHT+IFuLmSgGCHBA8ArEdz0YQFPa1X9JXSVLCSg9VUSqix/ullq3l5owDpKTQ9DPoUEa4WlUL9fCw==
X-Received: by 2002:a17:902:d488:b0:29f:2b8a:d3d with SMTP id d9443c01a7336-2a2f2202ccamr121012555ad.4.1766454643637;
        Mon, 22 Dec 2025 17:50:43 -0800 (PST)
Received: from charles-System-Product-Name.dhcpserver.bu9bmc.local (61-220-246-151.hinet-ip.hinet.net. [61.220.246.151])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2a2f3c66834sm107316205ad.9.2025.12.22.17.50.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Dec 2025 17:50:43 -0800 (PST)
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
Subject: [PATCH v3 1/2] dt-bindings: hwmon: add STEF48H28
Date: Tue, 23 Dec 2025 09:48:31 +0800
Message-Id: <20251223014832.1813114-2-hsu.yungteng@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20251223014832.1813114-1-hsu.yungteng@gmail.com>
References: <20251223014832.1813114-1-hsu.yungteng@gmail.com>
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
 .../bindings/hwmon/pmbus/st,stef48h28.yaml    | 46 +++++++++++++++++++
 1 file changed, 46 insertions(+)
 create mode 100644 Documentation/devicetree/bindings/hwmon/pmbus/st,stef48h28.yaml

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/st,stef48h28.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/st,stef48h28.yaml
new file mode 100644
index 000000000000..e4711c4ef38a
--- /dev/null
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/st,stef48h28.yaml
@@ -0,0 +1,46 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/hwmon/pmbus/st,stef48h28.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Infineon XDP730 hot-swap controller with PMBus interface
+
+maintainers:
+  - Charles Hsu <hsu.yungteng@gmail.com>
+
+description: |
+  The STEF48H28 is an advanced 30A integrated electronic fuse for
+  the 9-80V DC power lines.
+
+  Datasheet:
+    https://www.infineon.com/assets/row/public/documents/24/49/infineon-xdp730-001-datasheet-en.pdf
+
+allOf:
+  - $ref: /schemas/regulator/regulator.yaml#
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
+        stef48h28@11 {
+            compatible = "st,stef48h28";
+            reg = <0x11>;
+        };
+    };
-- 
2.34.1

