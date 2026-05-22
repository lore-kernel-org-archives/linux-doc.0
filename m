Received: from mail-wr1-f43.google.com (mail-wr1-f43.google.com [209.85.221.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 484BC3A901C
	for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 08:24:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.43
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779438257; cv=none; b=iyO4PjWVVqh63m4YkvFhatkfsO9KSdsEpxNsDa6zguabikfB2HthQ9nym2R7bq4GxECVrewSZOK0YI/a2g2vuYg/U6emA1dmQXP7e2Gl9G05oFKfCqdlGO4tN2E807Fna+fydrdDmrARSJLKd5SNpgEgTcnuemeAtoccmxYBxSg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779438257; c=relaxed/simple;
	bh=3DzBepA5OaBxS3rEqzaa//JlAmU/tnAvZdNl+JJosYM=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=M7B15VQuqv3Wl1dVsV0HACJS5KQsKV5e9utWOmScEUoKE+pKRxIHiZjwHBKyKHQyTTMNhAjK0/tCqxrQGnBoO3j6D0LH25LtZErregNZF8RhTbCnOEgRIKj9LW+hiHLqSjkPFmklpdfTci957/kv1pwNVMS7Eoy4tZX8TV24Xfo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com; spf=pass smtp.mailfrom=baylibre.com; dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b=XuRpK3F8; arc=none smtp.client-ip=209.85.221.43
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=baylibre.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=baylibre.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=baylibre.com header.i=@baylibre.com header.b="XuRpK3F8"
Received: by mail-wr1-f43.google.com with SMTP id ffacd0b85a97d-45e7c636e74so3842222f8f.0
        for <linux-doc@vger.kernel.org>; Fri, 22 May 2026 01:24:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=baylibre.com; s=google; t=1779438255; x=1780043055; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=r1aINRhdCxbmlFp0SOoS/8BQxCjj22TF2jiFyvu2ZRU=;
        b=XuRpK3F8JcOQENl+OadbHzE7Kd+lY/zVqGFNMXrcQ+dZ52ys3ewfzO2sgSTDeQjKZd
         z+jgJr+mHMapo0V2MWWsG5EC5xI2XXwUIDn2lyup35yORAIBiXmiQ+2lpMaQi4Y/ZO1w
         iv6cnTzOxpHXdOOcueuvPsbe5yoCpZnzAeCCGxxutjuNYUMiPPrmY0S2KUHhDLbW0u7n
         xq8Y0ELLjA14kNHgiEnvps7CJVKa3ofW4ucgsx5sQ4i1T4Rm948hlAlZtsKUBv0B6paJ
         2XymPJSgpQZgm76TlzbTYNPDUsl1F4610p483KdPiU0PnDqZWpEpGfkRtujZOCHUwrRD
         9ruw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1779438255; x=1780043055;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=r1aINRhdCxbmlFp0SOoS/8BQxCjj22TF2jiFyvu2ZRU=;
        b=XihWpcDQmUNbHNO5m74/nBGamfooO5tOa1h3CKvWQLxTxf7QW+q9lm4uc7B9Lc5dih
         kIpgJKiSXnYRvImFl8LJuTuTMgQIzcnM2rcLNiuZamoeu9vI8jk0KFDBumUxPKcUvmUs
         4Hgh+cSZS3kF2GKXzs+C/LEfntbZMeyZwDmjG0G9KgbrKTq4OYcKTjFvB3pf9gYXR9sm
         EzKC9JWs+rBfHUAuvT5reqmpJ1nx3VyMNWez7yZdc8Za5KPO3bFwcmnsi130y3zjtA3x
         tYQQUbvZm9+kIZrmtM1+rK7CjnmTyJzndIx6ONb5GvU5BCICnug24fpsjxHDnepDrSz6
         L3TQ==
X-Forwarded-Encrypted: i=1; AFNElJ8PyKCo7HgCDEpd8+NQ2ocHAUBk5OT2lHwF0/L/6YXwBsjez+Fktu52adqvII0ZFjBMZl2edhjIPJM=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxx1yvjH9uvOLsJHnJaEjWbDIO52fBMw+gnrSOucooInnM1x0+6
	tb/cmsulbUdsHBMz339rp9FSiTuQ4FeE7syhV+Q8flc/3HeL9ekF7vzoNb1fsiHegDo=
X-Gm-Gg: Acq92OEaBR3c6pabG2MNRK8/d/Nq6Ju8a2Upf/fN5e6ln/gMfIeKyCE3fGRqZZAI0xt
	dXpeMtuxqS3jphdg6VjAOo+Ilsad3SRkHRavy8tPNK8/g/dcaxIWWAcGErFRbQGyNR/ABrKvCfT
	YJZRRRhpjHF93J2s7l7zqUoIK0TcyoIEdiWTo10oKcUsfbRt8S1pXJ+CgECiUP5JsbpAZAoNuD1
	ne/YYYaTlBF0oXT8jn/74QvN55QsTr01Kdw0ziXElS1Nf+lWUhRfVjD+ATteEJWWm6skWBURMfp
	nkOgFgzEYqC8WL2lkIvsFlIvGo/nMyVs+SvMqLeo1wQP7QcgJ4Dl/VK/rSPkOQQTa1HqE09AmE2
	QlsjinRhP88rx856LA5m0eRN6Ww/INPFkKlAaKunegXEPE67scyX2cI4lRY88UnzK1zN9C8MTLl
	cmSIAZyQbRGCcJoPLjd7Uz2kFZavE4St7TsECi89AE3dBTbjyvEZoa0P8UE/v74AZb+kjev/2VZ
	psI5ih45dg=
X-Received: by 2002:a05:6000:4905:b0:43d:7508:c9c9 with SMTP id ffacd0b85a97d-45eb38a66d6mr3096802f8f.27.1779438254651;
        Fri, 22 May 2026 01:24:14 -0700 (PDT)
Received: from silence.. ([46.10.240.40])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-45eb6c9f58dsm2398471f8f.5.2026.05.22.01.24.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 May 2026 01:24:14 -0700 (PDT)
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
Subject: [PATCH v4 3/4] dt-bindings: hwmon: pmbus/tps25990: Add TPS1689
Date: Fri, 22 May 2026 11:23:38 +0300
Message-ID: <20260522082349.2749970-4-sbogdanov@baylibre.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260522082349.2749970-1-sbogdanov@baylibre.com>
References: <20260522082349.2749970-1-sbogdanov@baylibre.com>
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

