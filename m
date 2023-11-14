Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 296F6405FA
	for <linux-doc@vger.kernel.org>; Tue, 14 Nov 2023 14:13:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="KQovk5T3"
Received: from mail-qk1-x72f.google.com (mail-qk1-x72f.google.com [IPv6:2607:f8b0:4864:20::72f])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8DAC5198
	for <linux-doc@vger.kernel.org>; Tue, 14 Nov 2023 06:13:37 -0800 (PST)
Received: by mail-qk1-x72f.google.com with SMTP id af79cd13be357-77bccdea0ffso8944085a.0
        for <linux-doc@vger.kernel.org>; Tue, 14 Nov 2023 06:13:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699971216; x=1700576016; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Tj3F7r4bXKdKcLl3zXhsKyMtAAaQ3OyO+btxNZcVTGo=;
        b=KQovk5T3zyZjqWs9fop4fBE8ix/blBR8Kp4r6eow32o3h3UwbFOoHpKfWHMaotKX+j
         OyQ9xMQI5CpH0UItqcK2k/+E6z3aS4yY2IoalqEQiQ51IwXfCooi71tU2pY6TGdQxDxG
         DJjZK/J6lmUqJU5L5zjcvNrMEb8iCKKF/QgLNqANVrQYv/4xmFPKp/513cXhUTEKJbi4
         Y5EL6ywCf71XfDA+KyOYc1a20FvsRoDk/DJ7t497g8AFQw+2h0HAGyc9CDa595aWxKuR
         r9V1TfSKkZmlWyphFH7M49fmUgduPkWJwNIgLq8OwplbjYor/a3kiaROi7Ka4KhYo5Tn
         2eIA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699971216; x=1700576016;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Tj3F7r4bXKdKcLl3zXhsKyMtAAaQ3OyO+btxNZcVTGo=;
        b=pA+cLU9LdrE5e+HzFYuuL+d7zseinC9NEzMTVGAuK+pAzzEa1BSpIe/liKK+s9piol
         O1OhGUF2Vuiw4uFJmdOQ95SNXQnsQqSBbtIelxRlBEFMwfG6k4XcxoIgyfvMJVWua12j
         aVHC01GBS3aM0A0Sh3b3bRS30qh28ce0egCSR/04dgdtJBjKiJ4iUW2zSrHyaD4IjdUW
         7gaYjf0IueddUP5Ha8keAFzI8RR3S7s7Da9j7eYk9q6DK4Z4bV/NV1m2lsRteqYBTPyM
         kGRsyW9LzbW5WOmOsYUSR+RMjGiABhgvzU8qw8UcsSfKFVF/l2RbZpvq7f1eU1k+gu8J
         gsqQ==
X-Gm-Message-State: AOJu0Yxh3MPpN/CAowyWwBf5fO/XIy9kolHJ9VQmMal53JBcVxyfDZRK
	R0REoNEMX2QdoqHp5oTieSubag==
X-Google-Smtp-Source: AGHT+IFh0Kg7TsQGIegnmes1+Kqf8PJcacK9no05PQKvW4IVexEI0Bnw1hLpRCsL4VG1Y2MfFWnXFQ==
X-Received: by 2002:a05:620a:460f:b0:777:7178:ebf0 with SMTP id br15-20020a05620a460f00b007777178ebf0mr2719131qkb.5.1699971216721;
        Tue, 14 Nov 2023 06:13:36 -0800 (PST)
Received: from carbon-x1.. ([12.186.190.2])
        by smtp.gmail.com with ESMTPSA id m2-20020a05620a220200b00777611164c5sm2701263qkh.106.2023.11.14.06.13.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 06:13:36 -0800 (PST)
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
	Samuel Ortiz <sameo@rivosinc.com>,
	Jerry Shih <jerry.shih@sifive.com>
Subject: [PATCH v4 05/20] dt-bindings: riscv: add scalar crypto ISA extensions description
Date: Tue, 14 Nov 2023 09:12:41 -0500
Message-ID: <20231114141256.126749-6-cleger@rivosinc.com>
X-Mailer: git-send-email 2.42.0
In-Reply-To: <20231114141256.126749-1-cleger@rivosinc.com>
References: <20231114141256.126749-1-cleger@rivosinc.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit

Add description for scalar crypto ISA extensions:

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
 .../devicetree/bindings/riscv/extensions.yaml | 80 +++++++++++++++++++
 1 file changed, 80 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index c91ab0e46648..a3803b22cf4f 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -190,12 +190,92 @@ properties:
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
+            This string being present means that the CSR associated to this
+            extension is accessible at the privilege level to which that
+            device-tree has been provided.
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

