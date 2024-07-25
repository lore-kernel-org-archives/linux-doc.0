Received: from mail-pg1-f173.google.com (mail-pg1-f173.google.com [209.85.215.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2DFBB1C6A3
	for <linux-doc@vger.kernel.org>; Thu, 25 Jul 2024 04:16:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721881002; cv=none; b=eGiRI1KXM2BgXl4YebS7mELew5AWEYDNX2cwL93ByTYGyVlTxpIv0UsvyjkbMS4Et0qxeCKHtqRRH7BLng8J/SWfNf4vcpRxNmUzSsNxw28W1AsXc0uJhFfdDaXrsrmy7slT2c7WRGIAWq9z6D8jWvCPDh1kdn9jrYuDMAAOdxg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721881002; c=relaxed/simple;
	bh=lK25kSvuXBbjCsm1KOScKY69sa4rMHinL5Ye8aockR0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=phZz9P1lgtGSLm1cskSg0hXo6wH7dY1Sd/Dxw8JmYqocrrWeJuVReQ8U0D6+rXP8rV16aKpDrjp8MaJzBe4EriZJTuW1ylBA9pkSse+NGJlLg6v2/8feTVhJAP578CPqsqXEAEPepOC81WqHHppibglEu2tasjc3FyI7FezKjMU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=gtfNUgXp; arc=none smtp.client-ip=209.85.215.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="gtfNUgXp"
Received: by mail-pg1-f173.google.com with SMTP id 41be03b00d2f7-7a1215dd114so359651a12.1
        for <linux-doc@vger.kernel.org>; Wed, 24 Jul 2024 21:16:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721880999; x=1722485799; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=0RiVgzby/fIL0Kxxx3Y50ysZFHbsEJYdDMqDhTheyzc=;
        b=gtfNUgXpuCDsl6TpxoJUxuHdMffOlb253QMMlUZucHiTX9iGvfrwNV13GPxfaLli9h
         QiD8BkzAUskjs6M94Af3es/LIQbn8X52+N5TLU2/g+NYekh3IiGPYKz7PzLGxz54/Y7Y
         yF5JAxbXgm+TNVF2oerHPQ4nUHO7NXTy06+Aj42oInRcZPxtRYH4LtSWuTOgk6Ftm7o5
         vWuKFAxwvEZuFsTBe3xzJuChe4ue3gquXpOcWFGmj+Oag8/33o5tkZj1OdEVlNOCkvLy
         /eKmPoMo3mk7LTgtE8QLptouDShnrXFIeQh8LIo6POa9xgBLIOXZrlE1xv7a7XtLraTP
         OvHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721880999; x=1722485799;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=0RiVgzby/fIL0Kxxx3Y50ysZFHbsEJYdDMqDhTheyzc=;
        b=XVuQkwhotsV0Ouy4rtHTsq597kH/z79meIiDhqck5vvU4Vyu62i18sihgIzm7+QINz
         3uFiQJnYY9nXVvXt4LkzLU1q7fTdeN4z5/l3e2O/rIgV4VAI4kmZHUczYdLASXeUh5Iw
         pXzfOBR+PBz/LBU9VlFZaD0j8P41J9b6AwouIKXLAaueo6G2cP8oTh/xcRnPkdecd+b1
         tsqT105NdLaT+6YXsAERiutAuAi+NMt5yvqp8Dhd+kYezGO9hkriYttGjEgOb6b5bb93
         Mrv349USNsCj1JeQsWRbqcPFgK4Zf9FRtEPFLgDkashHWyul5t4FkezUDPMBNd1cNjt2
         PEEQ==
X-Forwarded-Encrypted: i=1; AJvYcCVrqc464y5M+L+CIO39XMis+qpy7+zM0Zn4Mg3vcgY8D5TO/sh4lwpa61paNQGiqcRA/5Te2AyukXinz11AAzMQjMTK7k5xnVpx
X-Gm-Message-State: AOJu0Yy3VYDov6W6FO8uJKI9q0dwTL32r34N/TbE3at28uSpobV3gSDV
	jg4cAdhDipnnkgNZy2woJe7LNxRLyda9r/Qpf8XQNQnsM6fiPAVw6ODpVhuJYEE=
X-Google-Smtp-Source: AGHT+IHBqouUd60StUuFY3y20z9rotElPmPvr8np0xp/cOd/5D5tZBs9q3oV3mBGdN2o0+1sfhUmuQ==
X-Received: by 2002:a05:6a21:99a1:b0:1c4:231e:8ee5 with SMTP id adf61e73a8af0-1c47b229b19mr919358637.29.1721880999516;
        Wed, 24 Jul 2024 21:16:39 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fed7f2b80bsm3781825ad.205.2024.07.24.21.16.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Jul 2024 21:16:38 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 24 Jul 2024 21:16:19 -0700
Subject: [PATCH v8 02/13] dt-bindings: cpus: add a thead vlen register
 length property
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240724-xtheadvector-v8-2-cf043168e137@rivosinc.com>
References: <20240724-xtheadvector-v8-0-cf043168e137@rivosinc.com>
In-Reply-To: <20240724-xtheadvector-v8-0-cf043168e137@rivosinc.com>
To: Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Jisheng Zhang <jszhang@kernel.org>, Chen-Yu Tsai <wens@csie.org>, 
 Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Samuel Holland <samuel@sholland.org>, 
 Samuel Holland <samuel.holland@sifive.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Guo Ren <guoren@kernel.org>, Evan Green <evan@rivosinc.com>, 
 Andy Chiu <andy.chiu@sifive.com>, Jessica Clarke <jrtc27@jrtc27.com>, 
 Andrew Jones <ajones@ventanamicro.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721880992; l=1911;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=lK25kSvuXBbjCsm1KOScKY69sa4rMHinL5Ye8aockR0=;
 b=U6hkM0vK7Fw/IQIGJFsZnHJIDTo03z/90pw0ylmD8Hl1YapQisvOP8xIEUjrga2P3in7QNuEq
 K4vTINX6W0gBsmwtfDrGgJt9ujpdnjnf1swACzykXFrMVEH2Gorza/1
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

Add a property analogous to the vlenb CSR so that software can detect
the vector length of each CPU prior to it being brought online.
Currently software has to assume that the vector length read from the
boot CPU applies to all possible CPUs. On T-Head CPUs implementing
pre-ratification vector, reading the th.vlenb CSR may produce an illegal
instruction trap, so this property is required on such systems.

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/cpus.yaml | 19 +++++++++++++++++++
 1 file changed, 19 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/cpus.yaml b/Documentation/devicetree/bindings/riscv/cpus.yaml
index 8edc8261241a..c0cf6cf56749 100644
--- a/Documentation/devicetree/bindings/riscv/cpus.yaml
+++ b/Documentation/devicetree/bindings/riscv/cpus.yaml
@@ -26,6 +26,18 @@ description: |
 allOf:
   - $ref: /schemas/cpu.yaml#
   - $ref: extensions.yaml
+  - if:
+      not:
+        properties:
+          compatible:
+            contains:
+              enum:
+                - thead,c906
+                - thead,c910
+                - thead,c920
+    then:
+      properties:
+        thead,vlenb: false
 
 properties:
   compatible:
@@ -95,6 +107,13 @@ properties:
     description:
       The blocksize in bytes for the Zicboz cache operations.
 
+  thead,vlenb:
+    $ref: /schemas/types.yaml#/definitions/uint32
+    description:
+      VLEN/8, the vector register length in bytes. This property is required on
+      thead systems where the vector register length is not identical on all harts, or
+      the vlenb CSR is not available.
+
   # RISC-V has multiple properties for cache op block sizes as the sizes
   # differ between individual CBO extensions
   cache-op-block-size: false

-- 
2.44.0

