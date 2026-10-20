Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.179
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792533937;
	b=lAlgf/FuxyYwZt359RTDRaq6kz1kFm2qKLt/so0iN+fZ6vOtGS7z6gF/CHm9FIV3EqcV
	 CVGqAkaSTRZyY5b0YNGdzNfHRjxZyWouPs2TM9GKxiGqgXLj7TQrh7i+wN1kHLlzFH6gw
	 RLY0JY0tzcCPxW97xMfXv/Cq9mw1011p5Qr/oom8gCyoQfTnqLb9vk/fbfmksFWVI6AWb
	 ZCPAAl5xVMuf//GdqyuAcOR0o4FDo56YG0oQty0XPfTXUj+icosSei7+L7rNlj2n3ZhZ+
	 mYsOxz0Dgs7Opp3SESTjArwcebCox9QA9j8MMP6+wSjcgFN01m274yrfdHcsYNk5BGA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792533937;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:Date:Subject:MIME-Version:Content-Type:Content-Transfer-Encoding:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key;
	bh=p4RNd2i8xpZ0CJfOEJKH1RTYHzI0AXnVPwuk8UaUecw=;
	b=XP3E0FqMad+JBSuiaOTYGErM7NGQLJDR+0KszhLXHK8pVz24LrMnAPU8+ZjUpcVBMjui
	 L6nSXzb3Z/pilNBnah/dnbsuqmJSEvCiLoQAPlknNjA6jdTechJsdk2LGBts+hIR8c2XO
	 Ar6N/PtTlO8qbjazubEO4bM18z5Dex6WLN7jlOpeQ8hGs1/eAwNX24/Xgih3q1hdH3DWl
	 +x6KBgE+eztcdaSF8KgSakcgFhesqeMmMfpeOlH0z+/h5DnluyUkSXopJ6kCacd9ycGCx
	 BGRyfSqsdOhdtbMH3eL8tvNUxoXIcdvpvzGBQ1tiFACiqbbvDV+oZKNWlDRWGJbrm2w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=nexthop.ai;
	spf=pass smtp.mailfrom=nexthop.ai;
	dkim=pass header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=NPwPE6Kx;
	arc=none smtp.remote-ip=74.125.82.179
Received: from mail-dy1-f179.google.com (mail-dy1-f179.google.com [74.125.82.179])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82792606A31A
	for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 22:05:37 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 82792606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=nexthop.ai
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=nexthop.ai header.i=@nexthop.ai header.a=rsa-sha256 header.s=google header.b=NPwPE6Kx
Received: by mail-dy1-f179.google.com with SMTP id 5a478bee46e88-3535bf8b3e0so96822eec.0
        for <linux-doc@vger.kernel.org>; Tue, 20 Oct 2026 15:05:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=nexthop.ai; s=google; t=1792533937; x=1793138737; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=p4RNd2i8xpZ0CJfOEJKH1RTYHzI0AXnVPwuk8UaUecw=;
        b=NPwPE6Kxyq+m2RXE4/kcOP4buIj/UN5TdSWBw5siUz9I/NaQ9dlqu3Bgx21vt59bhX
         Sl1uKFljcjeQQga7TzMiwfqXKp2tfzS3wdhICW/obgjIpT5MKynYNds8CO4qh8AbskB6
         onT9l3QVU45cAokS3e4XW2M6IBD+GagxwoS+jK/zWeR1AqJRLFSmh9WGAU/N8ETqWsYs
         orZeZLJRUYEfHTifC8DoZ1fmjriQMrmmYy5PLMj5gg5eqChkHPYzpND4/Zfonz7U//x1
         E5D7cijLfTPrSx+8HhMiegzt9BO1NEsr4i3GyMJtJvSsZqN/FuPWyo6jtKwhVahrHoj9
         00MA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792533937; x=1793138737;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=p4RNd2i8xpZ0CJfOEJKH1RTYHzI0AXnVPwuk8UaUecw=;
        b=GUH+SLvb7kcNFkE5fNzHlc8+8Ne2rOj8O1aC4SoSFDCbDW+jPPdsDprDV9b7wCcg88
         4p/k5XeX+yzMHciJ2mExbOYb3O+HefsG6ki9SDR3mZaPNyH33/r1HR5uWPPnDMLu1xgt
         MMjnlGOFCDg/V2gwaY5b8qbo3sx2mXO+HmC3IHSWyIAWUbGQkgKw/blS7shopWFyj5J3
         AtQ5r1OQH0wbKuTunz0NX5kBIa9wHX+a0qzAApeJ3oJ4MPJH6VVTLVCUguY4VGzSIEqh
         U6YzvANDeClPeu4y77pW/AefnDS5hpzLplaLp9y2QGM61vcYbDaglXP9NQyEV5la/wnS
         /1Gw==
X-Forwarded-Encrypted: i=1; AKwUvBwcMfq5CiwPysZdpTpSKcUf6JhEmXE/jLKDLjZrgr6qCYkf3jYhIAoeynFta5E0AEyIlRZKIA5p0e4=@vger.kernel.org
X-Gm-Message-State: AFq9FYJrNnGPDKhn4szSMGJfYdtZMSsmF7JDrH4+7mfWdTesotM0rUit
	G07nHWVwj4IwfQW2LGg7ev+vHq1BumIlchxxJLlFM5IAXaE+v+KzUVDl6TxgnYW5MKg=
X-Gm-Gg: AYBFou0PRTY5Uv1b1K1IIDewpojzgLeJofgAljSI9WWQRt18Kj7v2+kFsh9U5ZfHpvi
	v5vqmorD0mS5rXwB1iIJJjVJY5YGgcDySOuP5ljdOvjXoBe/gpx8l9TFZbr4ruIZSpCL2bBAk/7
	kj6G3O74DdMahh7CYq/2P1WV5SfHrhtLUxWttP28VH0n0I6os577osVCeMtB9UJ/rzEYd3KBD8C
	sTeWhHf5FTOXlJOJhY65RNP+E64713xKVsNw1AJ7RK0IZUA/Phl0VUEpaf5AV8loKMBeGnyOv+T
	Qm2JKcORwWhPdGwiuKbNklr0XxFCo8ZMca6LvTkGdEdGS6RNL3hCzlPPVyRTUvDsd+XACO7MU3U
	PixjlnzlDOR5pqN8Bt+QmGlMqC2RcmQxP+pSH0VJJZqBlrYjKA1scLEPMfmWItuanr2p27I7+eb
	SWM0wPj3NPVFxkB5Vpq1u3IT9DyKphMmI4uAb3DuGgPHu0a7Hq4qj0phCDWCUwPy7m2bhgS3NVU
	A==
X-Received: by 2002:a05:693c:810f:b0:341:5da1:7851 with SMTP id 5a478bee46e88-3674c63d98bmr751792eec.12.1792533936541;
        Tue, 20 Oct 2026 15:05:36 -0700 (PDT)
Received: from [127.0.0.2] ([50.145.100.174])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3674198f1d8sm1917021eec.24.2026.10.20.15.05.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 15:05:36 -0700 (PDT)
From: Abdurrahman Hussain <abdurrahman@nexthop.ai>
Date: Tue, 20 Oct 2026 15:05:29 -0700
Subject: [PATCH v3 1/4] dt-bindings: vendor-prefixes: Add TDK Corporation
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261020-hwmon-pmbus-fs1412-v3-1-51df629e13d7@nexthop.ai>
References: <20261020-hwmon-pmbus-fs1412-v3-0-51df629e13d7@nexthop.ai>
In-Reply-To: <20261020-hwmon-pmbus-fs1412-v3-0-51df629e13d7@nexthop.ai>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Guenter Roeck <linux@roeck-us.net>, 
 Abdurrahman Hussain <abdurrahman@nexthop.ai>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: Lars Petter Mostad <lars.petter.mostad@appear.net>, 
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-hwmon@vger.kernel.org, linux-doc@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1792533934; l=969;
 i=abdurrahman@nexthop.ai; s=20260510; h=from:subject:message-id;
 bh=lNuNT+gSUpQSUsDkNUaVAjvOE/3h1o85CLNGkLI/j7o=;
 b=l2kS2EcpDnhnFD/N9cvWATlaQCr1yLIqhT8XqoBCuqatXxny12JqA7U9ERy/zmBY7cxBSMgn6
 q+2S73CAQJlDD4h9tItzALF/JEuO3Td0tO+SCm/f1Zx6WEq6nxZotYC
X-Developer-Key: i=abdurrahman@nexthop.ai; a=ed25519;
 pk=omTm9cCAbO0ZhS32aKfJDKue0W3sQGpG9ub5eYHif8I=

Add the vendor prefix for TDK Corporation, the maker of the FS1412
point-of-load regulator.

Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Signed-off-by: Abdurrahman Hussain <abdurrahman@nexthop.ai>
---
 Documentation/devicetree/bindings/vendor-prefixes.yaml | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/Documentation/devicetree/bindings/vendor-prefixes.yaml b/Documentation/devicetree/bindings/vendor-prefixes.yaml
index ba2002969373..a7c484d1113b 100644
--- a/Documentation/devicetree/bindings/vendor-prefixes.yaml
+++ b/Documentation/devicetree/bindings/vendor-prefixes.yaml
@@ -1680,6 +1680,8 @@ patternProperties:
     description: Shenzhen City Tang Cheng Technology Co., Ltd.
   "^tcu,.*":
     description: TC Unterhaltungselektronik AG
+  "^tdk,.*":
+    description: TDK Corporation
   "^tdo,.*":
     description: Shangai Top Display Optoelectronics Co., Ltd
   "^team-source-display,.*":

-- 
2.54.0

