Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D94D2C872
	for <linux-doc@vger.kernel.org>; Tue,  7 Nov 2023 10:56:11 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="gZokaBPX"
Received: from mail-wr1-x42f.google.com (mail-wr1-x42f.google.com [IPv6:2a00:1450:4864:20::42f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6713BD78
	for <linux-doc@vger.kernel.org>; Tue,  7 Nov 2023 02:56:08 -0800 (PST)
Received: by mail-wr1-x42f.google.com with SMTP id ffacd0b85a97d-32fa4183535so811423f8f.1
        for <linux-doc@vger.kernel.org>; Tue, 07 Nov 2023 02:56:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699354566; x=1699959366; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=sMnpi79X7SvPehiPmk4gRm0VBHL4POtxgFx0CajIeKI=;
        b=gZokaBPX2TCvHaZGjbAH0J8BEoCZs9yXP9Ur7le8C+q0a3ZD3x9DCU2KmSagx+dFcX
         /9A/OyBdHM/ptQgpiaHiKWwLwpCkYhiVkiK17GqvVVTQoj4FrWkcHpae8GUy+3EYfCbn
         g/mT4p4x2/FT6161xCT/snyBaH5fgYgGGGFcGn5vC44fo3v16UCEliz7WEGQ79n+6yUw
         o5jy+XDBUurNe0FWVQ+vrYTTccxrL0sJ+LFmw8F9+Oy5vU7XHRq1j+mDClUewjxVzh21
         wLQeOD02kluxcA9LdcTQ7Pikau339kUJVCRWHPNDQT6IoC7M9xKr+tBbszq63CTMgLUL
         T1mw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699354566; x=1699959366;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=sMnpi79X7SvPehiPmk4gRm0VBHL4POtxgFx0CajIeKI=;
        b=nWTt3Xnn+E/RGb98qg+3BEXFmXgcMBLZH/dxEGb4fHAiWYj4QQjWR4u9naNAW2A5oC
         6KQ4NSEo4Pa6pJSuMMfwrqlPJs2stwye0KfmiZsuM205JcNu2/ccWLTtTTVxnFHcuVvz
         FAgUlfYx14Jb1WRBGHkbCQSsCvfjxKBCQ5ruFnQbmt4pRHERxzzdmuBKKPK1/oXYwNpc
         tVO+7p+jIDey5R3rmmBZPFfPJST0csbtVeKGvRBDgcWPpraHOGB5rfLyqf6DpD+3ICpz
         VfbIg1OPIFrpkoczxiryH2O9VxekOgEEjyEnp/oLOoV4rK0rxvsxuL4FRBLiGwruvGww
         Mjpw==
X-Gm-Message-State: AOJu0YysS1pcWmJcH5f+yJUTv5ENTxq3lHfwDXjPFqH4YAWTC1hIv94I
	ldB0C1aWw6eZ59x7RGSvdov3lQ==
X-Google-Smtp-Source: AGHT+IFTaUb/5dQv+OZXaV1szaLrFMm+/+NNM4GP2T1RF5zEOMF3p1Mp4sxm0kbHOX9zra49UOac4w==
X-Received: by 2002:a05:600c:3b91:b0:407:52f0:b01a with SMTP id n17-20020a05600c3b9100b0040752f0b01amr26054397wms.2.1699354566602;
        Tue, 07 Nov 2023 02:56:06 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:7db3:bdd9:4cab:2ee3])
        by smtp.gmail.com with ESMTPSA id n30-20020a05600c501e00b00405442edc69sm15396853wmr.14.2023.11.07.02.56.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 02:56:05 -0800 (PST)
From: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>
To: linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Palmer Dabbelt <palmer@rivosinc.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Rob Herring <robh+dt@kernel.org>,
	Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Jonathan Corbet <corbet@lwn.net>,
	Andrew Jones <ajones@ventanamicro.com>,
	Evan Green <evan@rivosinc.com>,
	Conor Dooley <conor@kernel.org>,
	Samuel Ortiz <sameo@rivosinc.com>
Subject: [PATCH v3 05/20] dt-bindings: riscv: add scalar crypto ISA extensions description
Date: Tue,  7 Nov 2023 11:55:41 +0100
Message-ID: <20231107105556.517187-6-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231107105556.517187-1-cleger@rivosinc.com>
References: <20231107105556.517187-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add description for scalar crypto ISA extensions which can now be
reported through hwprobe for userspace usage. These extensions are the
following:

- Zbkb
- Zbkc
- Zbkx
- Zknd
- Zkne
- Zknh
- Zkr
- Zksed
- Zksh
- Zkt

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 .../devicetree/bindings/riscv/extensions.yaml | 77 +++++++++++++++++++
 1 file changed, 77 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index c91ab0e46648..a89363ad653a 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -190,12 +190,89 @@ properties:
             multiplication as ratified at commit 6d33919 ("Merge pull request
             #158 from hirooih/clmul-fix-loop-end-condition") of riscv-bitmanip.
 
+        - const: zbkb
+          description:
+            The standard Zbkb bitmanip instructions for cryptography as ratified
+            in version 1.0 of RISC-V Cryptography Extensions Volume I
+            specification.
+
+        - const: zbkc
+          description:
+            The standard Zbkc carry-less multiply instructions as ratified
+            in version 1.0 of RISC-V Cryptography Extensions Volume I
+            specification.
+
+        - const: zbkx
+          description:
+            The standard Zbkx crossbar permutation instructions as ratified
+            in version 1.0 of RISC-V Cryptography Extensions Volume I
+            specification.
+
         - const: zbs
           description: |
             The standard Zbs bit-manipulation extension for single-bit
             instructions as ratified at commit 6d33919 ("Merge pull request #158
             from hirooih/clmul-fix-loop-end-condition") of riscv-bitmanip.
 
+        - const: zk
+          description:
+            The standard Zk Standard Scalar cryptography extension as ratified
+            in version 1.0 of RISC-V Cryptography Extensions Volume I
+            specification.
+
+        - const: zkn
+          description:
+            The standard Zkn NIST algorithm suite extensions as ratified in
+            version 1.0 of RISC-V Cryptography Extensions Volume I
+            specification.
+
+        - const: zknd
+          description: |
+            The standard Zknd for NIST suite: AES decryption instructions as
+            ratified in version 1.0 of RISC-V Cryptography Extensions Volume I
+            specification.
+
+        - const: zkne
+          description: |
+            The standard Zkne for NIST suite: AES encryption instructions as
+            ratified in version 1.0 of RISC-V Cryptography Extensions Volume I
+            specification.
+
+        - const: zknh
+          description: |
+            The standard Zknh for NIST suite: hash function instructions as
+            ratified in version 1.0 of RISC-V Cryptography Extensions Volume I
+            specification.
+
+        - const: zkr
+          description:
+            The standard Zkr entropy source extension as ratified in version
+            1.0 of RISC-V Cryptography Extensions Volume I specification.
+
+        - const: zks
+          description:
+            The standard Zks ShangMi algorithm suite extensions as ratified in
+            version 1.0 of RISC-V Cryptography Extensions Volume I
+            specification.
+
+        - const: zksed
+          description: |
+            The standard Zksed for ShangMi suite: SM4 block cipher instructions
+            as ratified in version 1.0 of RISC-V Cryptography Extensions
+            Volume I specification.
+
+        - const: zksh
+          description: |
+            The standard Zksh for ShangMi suite: SM3 hash function instructions
+            as ratified in version 1.0 of RISC-V Cryptography Extensions
+            Volume I specification.
+
+        - const: zkt
+          description:
+            The standard Zkt for data independent execution latency as ratified
+            in version 1.0 of RISC-V Cryptography Extensions Volume I
+            specification.
+
         - const: zicbom
           description:
             The standard Zicbom extension for base cache management operations as
-- 
2.42.0

