Received: from mail-pg1-f172.google.com (mail-pg1-f172.google.com [209.85.215.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E746C2D94B8
	for <linux-doc@vger.kernel.org>; Tue,  7 Oct 2025 11:17:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1759835849; cv=none; b=OesVBTddMK17rSeeQ2dQh50lK591lqYGWC41yp1hEQUH6EwGMlSkEP1LY3Fzcic2HJmE4NAiOMRpG5y2q6jGfR203KK5c/R+Whda1k8SaiCiWQl1d4EPzTQ4PY+MOTSagCpzlqmzBUCsU063QAQzVaBMemEibJXUbpJW+AD8mw0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1759835849; c=relaxed/simple;
	bh=doc6D/qsvutmJbzXvdZDYSYz0ZxXLQM+iyKROYiaouk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Ki05SHAPERMvmB01vFEh5TtJiMA3qGuIaOggqmI+wCzsa7GFILr0elgDwC64OdNjOBVPQUpitHvyM3udWyXf7cdqRVbY0Lrpnp7IhQoxwyEx++lxY6mHhnX4XbZlh6/E7aVRAjzrWnUix8gOTHyXT9ppwmcbxYVqB9rAOGP4bTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=KYBH3HH+; arc=none smtp.client-ip=209.85.215.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KYBH3HH+"
Received: by mail-pg1-f172.google.com with SMTP id 41be03b00d2f7-b57bf560703so4436096a12.2
        for <linux-doc@vger.kernel.org>; Tue, 07 Oct 2025 04:17:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1759835847; x=1760440647; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Wae5anKN9hvFHOBxJWNDxfF+UZ1MN51bIQyhwDOYr8M=;
        b=KYBH3HH+7C+9XtJq+ei87qEBhzeYDF1fyjlcZv1D9vKzLp5uVNT8kqe3aX4XYphBw0
         B19bNN2uHydat7igSwa1S+NXKVgStZm5agyCZaWlVTcac9vgUUxLxhNZ6aZVtg0/bief
         gWFOYZYWfUA4HvQX/goAwCPeBZQuSLv5aw5DK0nivchfIpo+y4rEOYK1rH9LJPEktiZf
         REovMpnQYIuhSbdjtuHhoiHQZn0CksKqzerF0yhOinAjX6uYnFcUblI3fulX5SNNaBhP
         sya/BdfbomccBzw3i7VUizL93Sxnhp+KVEeaJE4ZZ+JhubYtNXMBcNlLs46Uohd+iMrx
         m82w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759835847; x=1760440647;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Wae5anKN9hvFHOBxJWNDxfF+UZ1MN51bIQyhwDOYr8M=;
        b=TsUU7d5tmUMNBRhwXhWfdO6vUgwlbyvAnSLTh7U3dGTYjPpn/NvnjsV7e/NHqz3iRF
         AsLqZJdqZK97uwy5MQprZKLsgcWz5xBGrRuSCO92XDM8rr/1V5tc60DNCT5BTQmOb2qr
         l3eA6wGP44ilRZRI2Iq3hrQ2aNoF0wUoVoyBLyhcOiwVTIfHDPh8+OVc5AGZ58A7sqiW
         XVR6c9tKAtq+7TG7tXcYX+t2+V546QJmrk3sBbbJfuEUAb68k/XN8vY1rZi+rt3+xpL/
         09Gbie0ss5mrqJHFm9NF/jHjMJp0TdMlhBY23bPTdbOFv8N1ugyDzEFBXrO/yv5x381m
         4uDA==
X-Forwarded-Encrypted: i=1; AJvYcCVLTp78vRcf8Z0JLjcQ/VVSvhwQa6585rPG5Rkf38O0pJwTgpjEUknib2yStg7muievASA//pmmKtQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YyYOgjL0cv8Acr5+c4LovpmxDOGb7OCkbTKpHyu0S5eYfb14ay2
	dtRpPobUr31lHAM+PPnRiZgQp82zwtxMp78ym5RO6rwt3c1ZakPdp/xvLdyUd3qe
X-Gm-Gg: ASbGncusG108qLx9Tl56kfqZWRhbsr8vIRu4IsWqpaZABGR7NZr6Mt1Mltv6gWMvvT8
	hdUf0NTYrsVyvU6iiNhUN72KyioqT4se0tFU/gyQsuDiGNQ7J90J2P0vpSgj7HrBZ/Ee6nCNzQM
	Pvz5QAnq6qsAKARPl58VNVFHDhcU24dqAK2i93pAZ+B37StP2VgOXchX2n1Py3U8WpYhxqZv7U1
	zAedEbll6jKRjlHIuzWabySUV5qIngrx5I/WPIJunhzPDb3cxDgvxLv4MI43e6KyH2M1FT3zGiW
	yRuEbPZWhrJHcK+7F+7w7Elqu4QFFN4AKsgMGeHHjk93zT4elHLXZb7jbiA1Hfon3hc6Zyr3P44
	fjmQ+49mfp5D1TbqRitFRlOz+PhDu9qoDDdH0G8Zkv11LYGGoL3NwsrkQ0TBWITr+fseEBTSod3
	xOAUzsfXLToQ2aEXgHogc05lgj59eL+M57NwhKK0gyH/bTTNVZCGRC
X-Google-Smtp-Source: AGHT+IG1/90ALl9Mh5f9pXLacMmG46KttwU7NHyQlkZh6ZDWb9gcUbDfJoG6/1tlU82jvfGzXcd/lA==
X-Received: by 2002:a17:903:2409:b0:27e:e96a:4c3 with SMTP id d9443c01a7336-28e9a54423bmr206081935ad.14.1759835846628;
        Tue, 07 Oct 2025 04:17:26 -0700 (PDT)
Received: from [192.168.2.3] (2403-580a-80ed-0-4835-5a07-49e7-f115.ip6.aussiebb.net. [2403:580a:80ed:0:4835:5a07:49e7:f115])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-28e8d1d31bdsm162509045ad.94.2025.10.07.04.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Oct 2025 04:17:26 -0700 (PDT)
From: James Calligeros <jcalligeros99@gmail.com>
Date: Tue, 07 Oct 2025 21:16:42 +1000
Subject: [PATCH v3 01/13] dt-bindings: rtc: Add Apple SMC RTC
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251007-macsmc-subdevs-v3-1-d7d3bfd7ae02@gmail.com>
References: <20251007-macsmc-subdevs-v3-0-d7d3bfd7ae02@gmail.com>
In-Reply-To: <20251007-macsmc-subdevs-v3-0-d7d3bfd7ae02@gmail.com>
To: Sven Peter <sven@kernel.org>, Janne Grunau <j@jannau.net>, 
 Alyssa Rosenzweig <alyssa@rosenzweig.io>, Neal Gompa <neal@gompa.dev>, 
 Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Alexandre Belloni <alexandre.belloni@bootlin.com>, 
 Jean Delvare <jdelvare@suse.com>, Guenter Roeck <linux@roeck-us.net>, 
 Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
 Jonathan Corbet <corbet@lwn.net>, 
 James Calligeros <jcalligeros99@gmail.com>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-rtc@vger.kernel.org, linux-hwmon@vger.kernel.org, 
 linux-input@vger.kernel.org, linux-doc@vger.kernel.org, 
 Mark Kettenis <kettenis@openbsd.org>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=3352;
 i=jcalligeros99@gmail.com; h=from:subject:message-id;
 bh=mFOSrinm6mR52T1DXQZDpIdEAeTd/TshZKSbr4XqCgw=;
 b=owGbwMvMwCV2xczoYuD3ygTG02pJDBlPvm1xdA/gnmZ+44Kh2IUJTdH+HyTemF9jmuURksUgv
 miFAfe/jlIWBjEuBlkxRZYNTUIes43YbvaLVO6FmcPKBDKEgYtTACbiv5zhD8+iukt/cr9KVxVI
 f541I+h7vctLgXnBV0/e/eRWMmvKiUuMDF/LG37N9Xz0pudB47fOyN/J/A5Fzhu93opzNfzgT09
 1ZgcA
X-Developer-Key: i=jcalligeros99@gmail.com; a=openpgp;
 fpr=B08212489B3206D98F1479BDD43632D151F77960

From: Sven Peter <sven@kernel.org>

Apple Silicon Macs (M1, etc.) have an RTC that is part of the PMU IC,
but most of the PMU functionality is abstracted out by the SMC.
An additional RTC offset stored inside NVMEM is required to compute
the current date/time.

Reviewed-by: Mark Kettenis <kettenis@openbsd.org>
Reviewed-by: Neal Gompa <neal@gompa.dev>
Reviewed-by: Rob Herring (Arm) <robh@kernel.org>
Signed-off-by: Sven Peter <sven@kernel.org>
Signed-off-by: James Calligeros <jcalligeros99@gmail.com>
---
 .../bindings/mfd/apple,smc.yaml          |  9 +++++++
 .../bindings/rtc/apple,smc-rtc.yaml      | 35 +++++++++++++++++++++++++
 MAINTAINERS                              |  1 +
 3 files changed, 45 insertions(+)

diff --git a/Documentation/devicetree/bindings/mfd/apple,smc.yaml b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
index 5429538f7e2e..0410e712c900 100644
--- a/Documentation/devicetree/bindings/mfd/apple,smc.yaml
+++ b/Documentation/devicetree/bindings/mfd/apple,smc.yaml
@@ -46,6 +46,9 @@ properties:
   reboot:
     $ref: /schemas/power/reset/apple,smc-reboot.yaml
 
+  rtc:
+    $ref: /schemas/rtc/apple,smc-rtc.yaml
+
 additionalProperties: false
 
 required:
@@ -80,5 +83,11 @@ examples:
           nvmem-cell-names = "shutdown_flag", "boot_stage",
                              "boot_error_count", "panic_count";
         };
+
+        rtc {
+          compatible = "apple,smc-rtc";
+          nvmem-cells = <&rtc_offset>;
+          nvmem-cell-names = "rtc_offset";
+       };
       };
     };
diff --git a/Documentation/devicetree/bindings/rtc/apple,smc-rtc.yaml b/Documentation/devicetree/bindings/rtc/apple,smc-rtc.yaml
new file mode 100644
index 000000000000..607b610665a2
--- /dev/null
+++ b/Documentation/devicetree/bindings/rtc/apple,smc-rtc.yaml
@@ -0,0 +1,35 @@
+# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
+%YAML 1.2
+---
+$id: http://devicetree.org/schemas/rtc/apple,smc-rtc.yaml#
+$schema: http://devicetree.org/meta-schemas/core.yaml#
+
+title: Apple SMC RTC
+
+description:
+  Apple Silicon Macs (M1, etc.) have an RTC that is part of the PMU IC,
+  but most of the PMU functionality is abstracted out by the SMC.
+  An additional RTC offset stored inside NVMEM is required to compute
+  the current date/time.
+
+maintainers:
+  - Sven Peter <sven@kernel.org>
+
+properties:
+  compatible:
+    const: apple,smc-rtc
+
+  nvmem-cells:
+    items:
+      - description: 48bit RTC offset, specified in 32768 (2^15) Hz clock ticks
+
+  nvmem-cell-names:
+    items:
+      - const: rtc_offset
+
+required:
+  - compatible
+  - nvmem-cells
+  - nvmem-cell-names
+
+additionalProperties: false
diff --git a/MAINTAINERS b/MAINTAINERS
index b45db73e55df..745d85b66365 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -2435,6 +2435,7 @@ F:	Documentation/devicetree/bindings/pinctrl/apple,pinctrl.yaml
 F:	Documentation/devicetree/bindings/power/apple*
 F:	Documentation/devicetree/bindings/power/reset/apple,smc-reboot.yaml
 F:	Documentation/devicetree/bindings/pwm/apple,s5l-fpwm.yaml
+F:	Documentation/devicetree/bindings/rtc/apple,smc-rtc.yaml
 F:	Documentation/devicetree/bindings/spi/apple,spi.yaml
 F:	Documentation/devicetree/bindings/spmi/apple,spmi.yaml
 F:	Documentation/devicetree/bindings/watchdog/apple,wdt.yaml

-- 
2.51.0

