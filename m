Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A9ED62D04E
	for <linux-doc@vger.kernel.org>; Tue,  7 Nov 2023 10:56:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="1wIith9B"
Received: from mail-ej1-x62b.google.com (mail-ej1-x62b.google.com [IPv6:2a00:1450:4864:20::62b])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DEBD4EA
	for <linux-doc@vger.kernel.org>; Tue,  7 Nov 2023 02:56:15 -0800 (PST)
Received: by mail-ej1-x62b.google.com with SMTP id a640c23a62f3a-9c6f0530929so165567466b.1
        for <linux-doc@vger.kernel.org>; Tue, 07 Nov 2023 02:56:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699354574; x=1699959374; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=K+noeIiO0ZzRdCBLgjz9J+sy56GBx1867ixAgWMD4Wc=;
        b=1wIith9BIdnPlLltM/62yqwKTVZcSImm4+ad2Gk0VDRpQe2WzCvLgT+Hr7usm7OxSz
         jk41Km8ltUuWCE51dGojhIp2PnB3+3h5T48M7DxyZaBZD5m6ohFmSfE8FryJ2qORZ9ko
         iM8/gj6pnR5A9H6KcwrlWhMefYGY3QCfYUcl3axE2UrISp77HH0atxKDB46GS8BQTnsF
         QsX8bOZJV0b1RqGC6plEWYzuA/Oiod+ZjMOqTacw62vWk1BplxOj6W/lMDLpJcrfzL4k
         eN487W+x+n9sc5MGPqrc2BIb2ZU/jiYBfDDsiAn5vPde8l7w1T4/8m9ATxXdzRSmtZko
         ruIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699354574; x=1699959374;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=K+noeIiO0ZzRdCBLgjz9J+sy56GBx1867ixAgWMD4Wc=;
        b=AuCqg5wk+kIKS69VmDGq9XAgmQlkKfqD2ziRSQSTDRxxLpM1o7H6e0r1UZFGKH49rF
         LM3UXbrHGtldw/S3V1C8lQHiLe92Yn1rxO4iqn/lRoLipkR/mMXbHVgAC1/TJ7tk7d4U
         Ws3Yo1xos9o9NLxj7gqoMlbwtkWEgwEYbY0bb4zFQE1gRcDQytCNLty9lZMVDWWRmMT5
         Jla0OgmNsnS0jy1EVu6EkhKQhTet2WQyWoleXba2YSaVuZ9kbSd+rYUzbLeBb6ZY2qfl
         v/YBZw/YkghMja2pN5P2ojEovCdDGsA1/dWvnaseLY6ZJKplVouylnCAcF+Yry9GrrVm
         s9TA==
X-Gm-Message-State: AOJu0YxfTYiKeRl3Mv6O1gdM6EfLzkNWHF6BFejTzOxs4quWczAL3fZ5
	VrVyZOHRPZPIHHq+aMNc/r8Zsw==
X-Google-Smtp-Source: AGHT+IGQ52RAx3C3PSFQKflfCCfN+v4u5QXrEdDEyMd6Gzx8ZtOWMB3t8ixpUgsMGHhCAPNhRGbMJA==
X-Received: by 2002:a17:907:6d02:b0:9c9:603c:407e with SMTP id sa2-20020a1709076d0200b009c9603c407emr28520448ejc.0.1699354573974;
        Tue, 07 Nov 2023 02:56:13 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:7db3:bdd9:4cab:2ee3])
        by smtp.gmail.com with ESMTPSA id n30-20020a05600c501e00b00405442edc69sm15396853wmr.14.2023.11.07.02.56.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 02:56:12 -0800 (PST)
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
	Conor Dooley <conor.dooley@microchip.com>
Subject: [PATCH v3 11/20] dt-bindings: riscv: add Zfh[min] ISA extensions description
Date: Tue,  7 Nov 2023 11:55:47 +0100
Message-ID: <20231107105556.517187-12-cleger@rivosinc.com>
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

Add description of Zfh[min] ISA extensions[1] which can now be reported
through hwprobe for userspace usage.

Link: https://drive.google.com/file/d/1z3tQQLm5ALsAD77PM0l0CHnapxWCeVzP/view [1]
Signed-off-by: Clément Léger <cleger@rivosinc.com>
Acked-by: Conor Dooley <conor.dooley@microchip.com>
---
 .../devicetree/bindings/riscv/extensions.yaml       | 13 +++++++++++++
 1 file changed, 13 insertions(+)

diff --git a/Documentation/devicetree/bindings/riscv/extensions.yaml b/Documentation/devicetree/bindings/riscv/extensions.yaml
index b68edfd1fb43..62b5fe40b4a3 100644
--- a/Documentation/devicetree/bindings/riscv/extensions.yaml
+++ b/Documentation/devicetree/bindings/riscv/extensions.yaml
@@ -214,6 +214,19 @@ properties:
             instructions as ratified at commit 6d33919 ("Merge pull request #158
             from hirooih/clmul-fix-loop-end-condition") of riscv-bitmanip.
 
+        - const: zfh
+          description:
+            The standard Zfh extension for 16-bit half-precision binary
+            floating-point instructions, as ratified in commit 64074bc ("Update
+            version numbers for Zfh/Zfinx") of riscv-isa-manual.
+
+        - const: zfhmin
+          description:
+            The standard Zfhmin extension which provides minimal support for
+            16-bit half-precision binary floating-point instructions, as ratified
+            in commit 64074bc ("Update version numbers for Zfh/Zfinx") of
+            riscv-isa-manual.
+
         - const: zk
           description:
             The standard Zk Standard Scalar cryptography extension as ratified
-- 
2.42.0

