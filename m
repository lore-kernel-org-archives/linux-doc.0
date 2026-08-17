Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BCCE23F7ABE
	for <linux-doc@vger.kernel.org>; Mon, 17 Aug 2026 10:15:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.44
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786961709; cv=none; b=O5sYJrLkFzoGTEOrsw/URKs57kb5LdjbkKtmKGWGydeMeeknM33Tm3lbo59SFc5rcnNNmRZmWVNfUhwo1QGUomYhye/SO/C95agMzP63wVYgVVawRScp2G/6X934oDK2a87eaZa96tbcOj9KU/wwZEgDeqwOnOCwnx5eLx0yZAU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786961709; c=relaxed/simple;
	bh=3DzBepA5OaBxS3rEqzaa//JlAmU/tnAvZdNl+JJosYM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=i/wlp49VFMe5X9Op6xgO+IzHbq/1xgeQCG1mq9BmFPrcmUkzLYfBgjb5LlLdOnQuV5hNF7Bucc+TfnkEMUehnU1nOHF8DyMJ5XgdwUBjDOV5BwzZv59wEtIrO1y3GXgvvJCqmkHSGKeZyna9K7PxubG4aDs0oeoN2ycuGyNWuQg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=TJ5iRcym; arc=none smtp.client-ip=209.85.128.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="TJ5iRcym"
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-49954b88fffso36228785e9.0
        for <linux-doc@vger.kernel.org>; Mon, 17 Aug 2026 03:15:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1786961705; x=1787566505; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r1aINRhdCxbmlFp0SOoS/8BQxCjj22TF2jiFyvu2ZRU=;
        b=TJ5iRcymvPvgCwbT4ggwBvIwopS347JUMjptTsUE1KGh/hNhsuF7f/WeIh/ZsQb1lK
         49zX+3sRTKgZFUumC0bnYbyQgeqoXTGqDXqhrBWB0E161KNaHC2IBl2y+QepRT4wgzz0
         dxalwafQZ5mFcTPYOXIn0vAxwRy30NXGXDAbf3+koCLphv9t67riL3pqKYIBr4MLKNKi
         XiUHlGcpORPVxzfRc3SQM07ToWi7IIJRyl5W0Xg8LzJvlhZs2INlbU51QHeKM7IImFnB
         lk33dCzHKFM5ElYhCpKfNvMkVOl9aJwFgfwjkdE5UnSJbfMbU6KcBFkam1zgXPTaxeO8
         Y1lQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1786961705; x=1787566505;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r1aINRhdCxbmlFp0SOoS/8BQxCjj22TF2jiFyvu2ZRU=;
        b=rM/v2veGOqgtxPxH7CVXbibdI2++rCHpWqYzQlaJbtKxHTLNQBZp62hIVUyM9sWSqX
         BkWF5nf/H+yT07IIpqDvVeblgusBBY0B4V0UCHnaBHhJ6nMhbG0h/GnUiwvx+ogPqyMK
         tAC2RT6Cv562+XCxNfpSam11xnOkVREudQhWcsi7Yp2IC92JH3dp/c6A3ctrlc9AlK6W
         tOxzbRtrHryoRV/z834Quz1wa78558WxmDuygpw4O3X3BzAjbGjuFNj19uTOTZUfRMnS
         rmnZfi6Y43EcmGslg91dPc5vwhZOw/NVF9OeaZLmd0l6BGsjx5oDxj6nXpGInMEA0VGf
         k3XQ==
X-Forwarded-Encrypted: i=1; AHgh+RpsAO+fOT03GwzGnEWFuuI3d+huBiYoRbfI9iVhNzPJhiCb6eUz5zl/kpYiHWfmWUus5Iq2fmS21Zk=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHn0jH3YIdEW3NFRZds+go1xngxsHkRRg5Sm/eI0A0BuDDK9qT
	p3puG7esC8jvpFMhox24Ua1MHyvnwnHcEJe6tVf9jfbgGv+HfmgUlXLsKQ5A905DmAE=
X-Gm-Gg: AR+sD11IE2ZPK7X/F7EXSNwuw5Lbs1hv5frW3gxzWhv3IAiDOa8uhk5+a5mzcYG30D0
	88IxT4e9c7x7ZnwG1p68ci0PdBu4J3p+2DFslGflNN3TF4A95J4v6QBfnXCTFd2Qm8exfEdUvS2
	LHP0edhjCGTEz6KDl70BDrC7Y4chZMbmEzYKrx2ZfDKObuJfHNvvk+iIO/RBEaqZHyQOMcvLtN5
	NhvRJ4jZ8LyGq4eC8XCTBBnbWMgssOyU4AxpAZUcSB0gtEmU57e/pjmGWqA9IepEyISQoaWyGy5
	P9eO2CJY1+v/8VpO5aroaXBbcMfdD6bmRNI17hJyCkHMhREBFgOdQlvNi+evewbQzkUI/1DPu3G
	6ZNZXFxsqDB46XkMYVx23+4BWIAJT7M63uk10T5cZOjT1+9TPDZO71GVrvrTmNGUGeYoIPBd4tR
	TJUJFJXDAkWYS/3G+rUjT7NNOFJ03Jh462pZe2BIr7mT/nQ/Sw+G5BJBRcFWXCSsv+9wdiZyqxY
	4p0fQGpr0bbE4dpkLqH9WBfDr4MgXNkHzgfCIGfiIsgTX5LcgLS/p4+YXfZ9UpgDzRFlE/Y+5FJ
	aYQzmN6ys87Ys6++EMDXBV69ie60TIiXD7x6z4Nf
X-Received: by 2002:a05:600c:4690:b0:498:2b1f:e0c6 with SMTP id 5b1f17b1804b1-499879af606mr341527175e9.18.1786961705026;
        Mon, 17 Aug 2026 03:15:05 -0700 (PDT)
Received: from silence.. ([46.10.240.40])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4999d06167csm29542255e9.3.2026.08.17.03.15.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 17 Aug 2026 03:15:04 -0700 (PDT)
From: Stoyan Bogdanov <sbogdanov@baylibre.com>
To: jbrunet@baylibre.com,
	linux@roeck-us.net,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org
Cc: linux-hwmon@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Stoyan Bogdanov <sbogdanov@baylibre.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: [PATCH v7 2/3] dt-bindings: hwmon: pmbus/tps25990: Add TPS1689
Date: Mon, 17 Aug 2026 13:14:44 +0300
Message-ID: <20260817101455.3526260-3-sbogdanov@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260817101455.3526260-1-sbogdanov@baylibre.com>
References: <20260817101455.3526260-1-sbogdanov@baylibre.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add device compatible support for TPS1689

Signed-off-by: Stoyan Bogdanov <sbogdanov@baylibre.com>
Acked-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
---
 .../devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml      | 8 +++++---
 1 file changed, 5 insertions(+), 3 deletions(-)

diff --git a/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml b/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml
index f4115870e450..63ccb67576df 100644
--- a/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml
+++ b/Documentation/devicetree/bindings/hwmon/pmbus/ti,tps25990.yaml
@@ -5,18 +5,20 @@
 $id: http://devicetree.org/schemas/hwmon/pmbus/ti,tps25990.yaml#
 $schema: http://devicetree.org/meta-schemas/core.yaml#
 
-title: Texas Instruments TPS25990 Stackable eFuse
+title: Texas Instruments Stackable eFuses
 
 maintainers:
   - Jerome Brunet <jbrunet@baylibre.com>
 
 description:
-  The TI TPS25990 is an integrated, high-current circuit
+  The TI TPS25990 and TPS1689 are integrated, high-current circuit
   protection and power management device with PMBUS interface
 
 properties:
   compatible:
-    const: ti,tps25990
+    enum:
+      - ti,tps1689
+      - ti,tps25990
 
   reg:
     maxItems: 1
-- 
2.43.0

