Received: from mail-wm1-f43.google.com (mail-wm1-f43.google.com [209.85.128.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE6A1357D08
	for <linux-doc@vger.kernel.org>; Wed,  5 Aug 2026 09:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1785920656; cv=none; b=d3VtCGar5gDyzqP5itU7WDazq+f+85B+VzFbXYvEUd34dOr3vw6S0QnuC14HRbwDXyLqMnnVpYYdZ/Wm2eGjnXnNZSZfvOSAOvTxdqbauerBATBb+WXuEy601BQbBQdaJX3Ndkcgena7rcWI4ViCA0GIRaMAKD5JAehFNIRk1WQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1785920656; c=relaxed/simple;
	bh=3DzBepA5OaBxS3rEqzaa//JlAmU/tnAvZdNl+JJosYM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=oFugoEAJEyPCpg3JgdaDz7hhqLQettQlUIUT5QkgwOxnHSjhHZTHA54Xhol68maNMPXR/jT5Z52xNSQ0V5MphHOVJNvCGJ9MMC/9G7t7l9yyA+wkXW36ILRAoehoOHpVhmaoOo6iku5WwquL6l2tLM3ghgxrijF4fXKy9iczWKU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=EtsLWIxm; arc=none smtp.client-ip=209.85.128.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="EtsLWIxm"
Received: by mail-wm1-f43.google.com with SMTP id 5b1f17b1804b1-4954df200ddso4860375e9.0
        for <linux-doc@vger.kernel.org>; Wed, 05 Aug 2026 02:04:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1785920651; x=1786525451; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=r1aINRhdCxbmlFp0SOoS/8BQxCjj22TF2jiFyvu2ZRU=;
        b=EtsLWIxm90bqO0pNwLeOvny9TOKms0H7hvq1lu3sCTDQrNN+6zn8FAxJKxvvIlhPIP
         5O5QXsakOEdFJxL1gd2z1ytNTKD4Ar1k3oXVzOOjoOGjvp2EfaZyioD928DMa52xfNO5
         yOBhIVShmHuK1ioSNmnaKxP8SAj9DDFAHq0L+AhPqPThjD309BcLpJcQbT+3e4ZQo/Kk
         mUWPxHo5JfirnW4ssQ9DdlWaAouXGryAkqng+9FzQzdmR2t7xGYjmo37c4mpoxce6/lV
         0vabw0bE8+L1ec7Y1vlGSLkwk8twkwhu+3pjj+YD81iTFBTxTW7EH7XNoFIvOLPdAuPU
         BSYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785920651; x=1786525451;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=r1aINRhdCxbmlFp0SOoS/8BQxCjj22TF2jiFyvu2ZRU=;
        b=qWHdloKm+oJpKcPBFshvD0P+7khP+N3EuI1yexw3OScBwoz40TZKVNNpEA/VEFRLxb
         nULQtesX+OgfIxEQ6pifygDWOEfXMR0Bl0+WWTUj/F87vZzXuBkBKm+EYKw9fKk4iBRa
         bCDlX3gXnQxQJ2dTO88a6XBYROXuLZvt5peCfM79WdEetuck7jHYaRm7z2pdR0nxBnbI
         n5Dm0jU7iQY++/vUjLsB+oXcti7uRGXlsf4YYQq0MNVnNANsoPOGQC3iv4NpwQvRLqmp
         7IVxSC3Oht4vj7Dzl5S4vaHhVvKHky4wzINY5nAiCQiw4SeKvp2x/eNUAn+G2d39ct7+
         02PQ==
X-Forwarded-Encrypted: i=1; AHgh+RqAuJfH7I9GR/Ev8YPtDEGS3O1+nEYvzN45M6UI+EhuUTn10c1F6xZ9M0MBHjXTCbdKmhvheOB9bzg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxsHbnFQLvHzAMd9/TDeYA253+W9mh49i/nMblZERN8VY1vDRuA
	ycaNhMa1Mb02lPncaPIGeMX9KeeFMe7WZ6NdlHCQoyhc/ALVGXJtKX3OMjr1Oy01wQc=
X-Gm-Gg: AR+sD11JTr2PNnsOxoZKcY6E/RNcoVK1sNbEP4nJDkTccF+TWJX9dWY27abwF4CrUH/
	NbGLQsjbDhag2CZ+Ec7sQpHjPzdVVcj48HX/4OjCNszRWMM7WFptR55ALn6q73Jd0RknwwoxJZi
	L6Yf0gTOriCid7tzky/z4BUigPSNBBhz63m5Ng67qNN7DBenyXc00aOOwlHF5KwLPcZGZ3ZDPje
	Z4NOvWtCwNLJP5r6htRemonNyzri/XEppc8981v2fHwIi420Ux4NZN36JyAkEdzF9PlIRTbLX4H
	G6HTTs6+gqJ70eYiYq2kS11lu1WcKC5NTIdqyQqH04O7cJ/Pdy61Hk6jPMoCxYmywvSCGEfeDQg
	zzGiHIf1LdLE9cLpVXWdTW0n00Bq1emeAZJQt8HYY45S2GhGISU4U88vV1uiOFh1PZkYzhUcBlF
	Fy91llzSf3vN0Uz4/sudFvrku4ug5b6jNJOm0mWxSwebJ6uOz5MTBHeNYv+X5vXhKEGRq8WTqBY
	I8Be7TohjU/pXGEWUgRCnhGxx0k8BUv6eYUE+Hi3uX88sxl5BPELl7yuL/5U6PscmqiwfAL9uu1
	i6C7TsX13NwTrTwNtxWq+Mo2MJ8Ksg==
X-Received: by 2002:a05:600d:8483:b0:498:1371:6612 with SMTP id 5b1f17b1804b1-4994e7a70aemr44104035e9.6.1785920650758;
        Wed, 05 Aug 2026 02:04:10 -0700 (PDT)
Received: from silence.. ([46.10.240.40])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4994e99319bsm34082105e9.3.2026.08.05.02.04.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 05 Aug 2026 02:04:10 -0700 (PDT)
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
Subject: [PATCH v6 2/3] dt-bindings: hwmon: pmbus/tps25990: Add TPS1689
Date: Wed,  5 Aug 2026 12:03:56 +0300
Message-ID: <20260805090400.2059006-3-sbogdanov@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260805090400.2059006-1-sbogdanov@baylibre.com>
References: <20260805090400.2059006-1-sbogdanov@baylibre.com>
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

