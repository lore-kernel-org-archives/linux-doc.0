Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5231014601C
	for <linux-doc@vger.kernel.org>; Fri, 19 Jul 2024 16:19:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1721405948; cv=none; b=Q7Fww5jX8dstOJg/ePGl+goPousHgXs+szYZXruQoiaL9p4dCQsOqMYJwkP3ntCAo2o3kpmmW5KA3JM2QEW780qQIrNqKOgR9Q7TPzI8jnml8rLXKuZ+MHlgABFxc/XqvhVpVZr68tcbhe2clffqXHJ9VU9y2JkmAH7ZiCLvwNs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1721405948; c=relaxed/simple;
	bh=ZzH0VgSdYutk/uKY2omj651o9v+E5HP1BijtgXJzAp0=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=IpWA+KZ27ciC/3wGyBhAY0rfPKT0/ivdvLduGkW7YvArmRwxOEwBVpRLGeE+dImWCKHQBwYCeqC4k4eU6psRku7MkdZiYmHJHE+NKKJ9LVRr0oBQ+5ERL5Vi53t1aUhKCr+3M86CdZ+6qvHQO+ihi9/Wmf7doIn+Nfm3KpI2nC8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=WZVNhzlS; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="WZVNhzlS"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-70b4267ccfcso807882b3a.3
        for <linux-doc@vger.kernel.org>; Fri, 19 Jul 2024 09:19:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1721405944; x=1722010744; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=GWtR9ZjYZiSKNZtqnpkUxp+qNZzbKrCzo+6HVfyCbsc=;
        b=WZVNhzlS4Lzo53lsdJx4P7dJOUCdyRSemNVGGknJ/eP9LxqONnxE5Nhs6QImGUvqjZ
         5s/yshiDAWjb+5Y5d9seFHq+6HW1sZ0Bx0rlzksR2wG7VLVS5bRCbXPIiv4W4t54JNjo
         0UF4agyr3j73rdVWzRvhp2APKGOetBiCy5LZZCxHCuTj9j6ePBx8FDx53jm5Zn6E3XKr
         hJWmE5SyAYx+pmBL//yOapVpati9Q5/+Ah+y6pxG2NkGCPhGKorL4w38w6vwl3V5QHH3
         NSxZf+DrljdvBtJvqJOcDUeOtalDmY7Se9vvS+AL/gp/Qylan2dV2itfwfz3gfuP74kR
         U8ww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1721405944; x=1722010744;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GWtR9ZjYZiSKNZtqnpkUxp+qNZzbKrCzo+6HVfyCbsc=;
        b=THSosWC5+/ZNue52b2U8L+5neFdpI3BcV39cBuO7CM8DGsNLO4CcEi0rP0iwlq2KKU
         WP8rOJ/TOQhLSTCKNaU0aS0rR/RrGospXQQQpQ6t8PoJH5axzArdHoYN8urN3GM6C1x9
         QCKt7ymA+kXCv2C6zqXXsrPmhmbVas/K1Y63Qt69VaFOSIgNCtYS2kRnYAZSYV93//oh
         /8koPpLM+1qPITb5LspCFvYEuM8XwEST9YIwiHMMNVWWFZdSQKdpOGzLemXF7JKWDAfB
         OjCv5GNmc8EkYF4mh9pRzyXY3HYSRHC/SAjJR4l8i8EKxn4e5g6b4nTw6+UHcU6JHzGp
         zmHA==
X-Forwarded-Encrypted: i=1; AJvYcCUDs/VLGovpIs2s6iWOzjPtyVqenfxrXyZzoVCLKK/YUSK0Ki8og6gC3ZOxmn47x617SZWBpdUQdEuG7rFffSRsez4FAGHtum8s
X-Gm-Message-State: AOJu0YwPhoCVqVcV1D0ROfwrJRVXTHfisPWBJ4O4sFIXX5L8jo39Pxz7
	A+qrwSusK4a56qJ3KAz27f0IRwNfBOhxgw/eqDA/EjWzDOHvrmFVpvILC5U/+b8=
X-Google-Smtp-Source: AGHT+IF+GUycFbxFYTPQ12A0f+u6HHfmC+GBd8iT7cSCSlcQGb4rtoa2bA7r6TUBDPjdWpdM8jx1FA==
X-Received: by 2002:a05:6a20:6a0f:b0:1c0:f648:8571 with SMTP id adf61e73a8af0-1c3fdc5c9b3mr10485350637.4.1721405944499;
        Fri, 19 Jul 2024 09:19:04 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-1fd6f490dcbsm6461435ad.297.2024.07.19.09.19.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 19 Jul 2024 09:19:03 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Fri, 19 Jul 2024 09:18:56 -0700
Subject: [PATCH v5 01/13] dt-bindings: riscv: Add xtheadvector ISA
 extension description
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240719-xtheadvector-v5-1-4b485fc7d55f@rivosinc.com>
References: <20240719-xtheadvector-v5-0-4b485fc7d55f@rivosinc.com>
In-Reply-To: <20240719-xtheadvector-v5-0-4b485fc7d55f@rivosinc.com>
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
 Andy Chiu <andy.chiu@sifive.com>, Jessica Clarke <jrtc27@jrtc27.com>
Cc: linux-riscv@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-sunxi@lists.linux.dev, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 Charlie Jenkins <charlie@rivosinc.com>, 
 Conor Dooley <conor.dooley@microchip.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1721405940; l=1788;
 i=charlie@rivosinc.com; s=20231120; h=from:subject:message-id;
 bh=ZzH0VgSdYutk/uKY2omj651o9v+E5HP1BijtgXJzAp0=;
 b=rsQNwNk/nGw07WypZ0WFD3o9JfwjjscYkiNaMlQ+k6T5GEeUL6lGIKjpeR+owwiCEdCVico/6
 whuYOjwhUL5CLoFlffJhH8svBTCXqBxdop2d5EsODMFY81AqvwP2Mwf
X-Developer-Key: i=charlie@rivosinc.com; a=ed25519;
 pk=t4RSWpMV1q5lf/NWIeR9z58bcje60/dbtxxmoSfBEcs=

The xtheadvector ISA extension is described on the T-Head extension spec
Github page [1] at commit 95358cb2cca9.

Link: https://github.com/T-head-Semi/thead-extension-spec/blob/95358cb2cca9489361c61d335e03d3134b14133f/xtheadvector.adoc [1]

Signed-off-by: Charlie Jenkins <charlie@rivosinc.com>
Reviewed-by: Conor Dooley <conor.dooley@microchip.com>
---
 Documentation/devicetree/bindings/riscv/extensions.yaml | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index a06dbc6b4928..1a3d01aedde6 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -556,6 +556,10 @@ properties:
             latency, as ratified in commit 56ed795 ("Update
             riscv-crypto-spec-vector.adoc") of riscv-crypto.
 
+        # vendor extensions, each extension sorted alphanumerically under the
+        # vendor they belong to. Vendors are sorted alphanumerically as well.
+
+        # Andes
         - const: xandespmu
           description:
             The Andes Technology performance monitor extension for counter overflow
@@ -563,6 +567,12 @@ properties:
             Registers in the AX45MP datasheet.
             https://www.andestech.com/wp-content/uploads/AX45MP-1C-Rev.-5.0.0-Datasheet.pdf
 
+        # T-HEAD
+        - const: xtheadvector
+          description:
+            The T-HEAD specific 0.7.1 vector implementation as written in
+            https://github.com/T-head-Semi/thead-extension-spec/blob/95358cb2cca9489361c61d335e03d3134b14133f/xtheadvector.adoc.
+
     allOf:
       # Zcb depends on Zca
       - if:

-- 
2.44.0

