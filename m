Received: from mail-pl1-f181.google.com (mail-pl1-f181.google.com [209.85.214.181])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2A8B6188CA7
	for <linux-doc@vger.kernel.org>; Thu, 12 Sep 2024 05:55:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.181
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1726120549; cv=none; b=kTYuOfdHJiSxbq2N6s4rmgiGawoyymec3M9ntJZTTOn7I5hxZFW44ISKWA+X+KIPcSShK2mARO9kLwisz80cDYjquIHuk7ue/crOWq5sl52V4wdScmoSGgNTmkQid0wyjkoVrtS9Od3J8IG6CU8zmWPGxdk+R/5V9jVF9Jki4iA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1726120549; c=relaxed/simple;
	bh=n+1uXcpPSzDKbEZ3gf2yswWeiNf7ojNdJOC78EyvEvs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=MJAUXW5Yu5Sue+VYmGhITgjKnIf7uYE/8ieVPiwyNvVvgR6HEwLGnQEYMbP1I4bczUf+65GyOfXGqVFraODIp+2RmS1QxO4ugJUNe5936gZ8Jj+FTyi5UPEROUNJgvQv94h/QlG/OY4TQUXB71+adPclnG7p04tEycDUSZhGulQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=snt5MbLj; arc=none smtp.client-ip=209.85.214.181
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="snt5MbLj"
Received: by mail-pl1-f181.google.com with SMTP id d9443c01a7336-2059204f448so5685835ad.0
        for <linux-doc@vger.kernel.org>; Wed, 11 Sep 2024 22:55:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1726120547; x=1726725347; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=XJ+D4p75bjfTb0EItLpHxQIjWmqIJlAlnUMhz5TxedE=;
        b=snt5MbLj+IcENEwYb0XRZagHioPIPXExiA0a5u4LjDbgsZa361tr1OL3+pS2d3CjFc
         87J6plf1YrDqGXpMMyAI1rf8hvNIKbTL6YEvhakIjh59eC2clvSgedReo55M06HUqUyT
         aV8d7ULxpFioiFDqca/roiG9C5s2+NMPC0Qk/yANo4/k5Aoe7eIkm2qxUHdYRGDb+W68
         tnBbAvFt5NCL7jwecTYuUMcvjbRr7HRal+/n8jeXnniXcc9fxRdvvNCPyLwO9HiLHamD
         r0G+Z6BDKDA3uaGaSlpBVLj6drXmltzrLPoumK25oMkNw+iVBy7tAlkTF+RQg5Z3hVMk
         64mA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726120547; x=1726725347;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XJ+D4p75bjfTb0EItLpHxQIjWmqIJlAlnUMhz5TxedE=;
        b=CX2LkdNEUvxi/SdSqPeLUcx92HPIm6owh3NTjqaqgahFmSXxh9KQvcib0BQq12PimB
         BXGRv5nYn4FlDVIvE5RjvqR5M4agMiNTnX9qwo12ltLSb2z6SkHVT1Hx5bTArkmJixRj
         b+NzroYdcs2loHM/E6UsKFbIgvgbrFd3UNMq5NhsxtSF7sLvQ9o1+BsaJilKyM7mMg+7
         Tktg/qO5eTwPjit6KLzu82VA17cv8WUbMXNkk/hNBvmZUQTmfq9IDX3GAVvM6HttIAZ5
         cqRJh20K0uJlYEMUoV4dhHTcebMSuwvCwU/yaza6IPo2061slOMKsSgtdTAR3DzHGjjK
         hR/w==
X-Forwarded-Encrypted: i=1; AJvYcCXtVB0xePo7R4bjD98H1mKP8WMhPvs0bTR868J6RN5jPt3QyWMCiiJ9kL1UngRicZ00sT0EY4gu+AM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwiZ13J3QKIUrKVPPqnnWcUH7uBCd2sgzQRuwvU6OSSEgZc5k0U
	DcDJfDmpllQoQ7Ntj4Y6ARsdBlgdlWhUwcG0bvALe1rXbNCmysii2xZfXJDpABbrZRpEZQQhIWD
	r
X-Google-Smtp-Source: AGHT+IG9O0CsFGhPXNWP6Lh0fHcN+qnZpsCNiZQA7ou2TZYGAxKoqEVVtduYd2aqXpKrOB/KDynEnQ==
X-Received: by 2002:a17:902:bc82:b0:202:4712:e838 with SMTP id d9443c01a7336-2076e34805fmr20473945ad.14.1726120546804;
        Wed, 11 Sep 2024 22:55:46 -0700 (PDT)
Received: from charlie.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2076afe99b6sm7870465ad.209.2024.09.11.22.55.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Sep 2024 22:55:45 -0700 (PDT)
From: Charlie Jenkins <charlie@rivosinc.com>
Date: Wed, 11 Sep 2024 22:55:09 -0700
Subject: [PATCH v10 01/14] dt-bindings: riscv: Add xtheadvector ISA
 extension description
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240911-xtheadvector-v10-1-8d3930091246@rivosinc.com>
References: <20240911-xtheadvector-v10-0-8d3930091246@rivosinc.com>
In-Reply-To: <20240911-xtheadvector-v10-0-8d3930091246@rivosinc.com>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=1788; i=charlie@rivosinc.com;
 h=from:subject:message-id; bh=n+1uXcpPSzDKbEZ3gf2yswWeiNf7ojNdJOC78EyvEvs=;
 b=owGbwMvMwCHWx5hUnlvL8Y3xtFoSQ9qjpqgZ1w/w/ftku2TJD4uz+t+3x4iXX2BNW5b+/WQo6
 8bjN+eIdJSyMIhxMMiKKbLwXGtgbr2jX3ZUtGwCzBxWJpAhDFycAjARlTOMDF/jJh5VvijwP67J
 VKVJwXXLN+O4Ccpr4rb16DJeSYqLLGD47+eWbnRtrtIkRe/gq3cFjFfOFeOyVO+O70hJSZ+nude
 JHQA=
X-Developer-Key: i=charlie@rivosinc.com; a=openpgp;
 fpr=7D834FF11B1D8387E61C776FFB10D1F27D6B1354

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
2.45.0

