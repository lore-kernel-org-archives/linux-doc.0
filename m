Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B4EF2C87C
	for <linux-doc@vger.kernel.org>; Tue,  7 Nov 2023 10:56:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="GjRjIi6S"
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96942170A
	for <linux-doc@vger.kernel.org>; Tue,  7 Nov 2023 02:56:26 -0800 (PST)
Received: by mail-ej1-x62c.google.com with SMTP id a640c23a62f3a-9bf0bee9f2fso173872966b.1
        for <linux-doc@vger.kernel.org>; Tue, 07 Nov 2023 02:56:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699354584; x=1699959384; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=PQVPAaYHkpM0GEJ73m22K8qqx/erlq7lj5m1X7f1ukE=;
        b=GjRjIi6Sv0MkxFa6Gva3AkOyRO23adoWjNZNL7rnSjqaDj2XU9+4YUn4qR9VcfG4CF
         CCviy85my/Zd3XoPs+ULsx/+glkHYHDtuIuI4nE59dP2hiBGso2Sh5Sw0bFmIyNvMcPF
         gOQaF9lO9BTDt3qKZtt7dE0dSEaTQ5v+3qpeREuzy3TabgNoHyrYo9/FvaUNVlgM+Y5c
         0aCxGgE9nI68/+E7brLL1kt+8F+NrNokul0m8wutHFQRP7ROvS0tuImjkYfLn1RA5B8H
         3+YITbyThtbcvyKqqma26JeePZIRaN83wV9C7iqEq0AU4FL2f2UZyXuJZhyrngFF2H6S
         K4EA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699354584; x=1699959384;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PQVPAaYHkpM0GEJ73m22K8qqx/erlq7lj5m1X7f1ukE=;
        b=Hzr/j1SPeD8n+fXQxVUA9IhhetYTc0CrDBR8ayN4LFTypi8LcXgSd6drB1BkybfSZ4
         tI0z29J3quNMZhXjMv/SvwOerwwmNCJkhSVPvBvbQQnpw1I+o37B7sTUE1pmTbYFj4ne
         ET+b++UJJX2H22BZnmTWagdZ7stlW8uW88BOCQ5wFxv3vZUW5kYL1aB0nX2OzS/8uZSb
         9vxhfjcmayNarbv0Mu7RHZtd84yrGgbNTJ8DIlRRVPhXxNuA2Y8cafbabziSodviKpv/
         CNuUKu8ZaD/eFHbCqyWlXdmIUjmZUlAKYB7yq0lvaUdOLKilEUc3kK1Ou9ojw5TU47nw
         /O0w==
X-Gm-Message-State: AOJu0YyRzBUFnUYREBM7GsEEU+gJCBSq7SzwUMwymxDl6qQDjjAwVnzH
	sUiJExFzC78giXAotSkI1SlNcw==
X-Google-Smtp-Source: AGHT+IGj0yQcu+DGOcyOjDKINIocvRDdaol8XKw87jQoMj8DVyz/EpNBoI48Bn4wmnkpdAazd54/WA==
X-Received: by 2002:a17:907:86aa:b0:9bf:b83c:5efd with SMTP id qa42-20020a17090786aa00b009bfb83c5efdmr24912005ejc.3.1699354584016;
        Tue, 07 Nov 2023 02:56:24 -0800 (PST)
Received: from carbon-x1.. ([2a01:e0a:999:a3a0:7db3:bdd9:4cab:2ee3])
        by smtp.gmail.com with ESMTPSA id n30-20020a05600c501e00b00405442edc69sm15396853wmr.14.2023.11.07.02.56.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 07 Nov 2023 02:56:23 -0800 (PST)
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
Subject: [PATCH v3 19/20] riscv: hwprobe: export Zfa ISA extension
Date: Tue,  7 Nov 2023 11:55:55 +0100
Message-ID: <20231107105556.517187-20-cleger@rivosinc.com>
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

Export Zfa ISA extension[1] through hwprobe.

Link: https://drive.google.com/file/d/1VT6QIggpb59-8QRV266dEE4T8FZTxGq4/view [1]
Signed-off-by: Clément Léger <cleger@rivosinc.com>
Reviewed-by: Evan Green <evan@rivosinc.com>
---
 Documentation/arch/riscv/hwprobe.rst  | 4 ++++
 arch/riscv/include/uapi/asm/hwprobe.h | 1 +
 arch/riscv/kernel/sys_riscv.c         | 1 +
 3 files changed, 6 insertions(+)

diff --git a/Documentation/arch/riscv/hwprobe.rst b/Documentation/arch/riscv/hwprobe.rst
index 2a2fe4b026e7..a53fbc076d7e 100644
--- a/Documentation/arch/riscv/hwprobe.rst
+++ b/Documentation/arch/riscv/hwprobe.rst
@@ -154,6 +154,10 @@ The following keys are defined:
        defined in the RISC-V Vector manual starting from commit e2ccd0548d6c
        ("Remove draft warnings from Zvfh[min]").
 
+  * :c:macro:`RISCV_HWPROBE_EXT_ZFA`: The Zfa extension is supported as
+       defined in the RISC-V ISA manual starting from commit 056b6ff467c7
+       ("Zfa is ratified").
+
 * :c:macro:`RISCV_HWPROBE_KEY_CPUPERF_0`: A bitmask that contains performance
   information about the selected set of processors.
 
diff --git a/arch/riscv/include/uapi/asm/hwprobe.h b/arch/riscv/include/uapi/asm/hwprobe.h
index 5124327b70ff..71f6cda52c4c 100644
--- a/arch/riscv/include/uapi/asm/hwprobe.h
+++ b/arch/riscv/include/uapi/asm/hwprobe.h
@@ -54,6 +54,7 @@ struct riscv_hwprobe {
 #define		RISCV_HWPROBE_EXT_ZIHINTNTL	(1 << 28)
 #define		RISCV_HWPROBE_EXT_ZVFH		(1 << 29)
 #define		RISCV_HWPROBE_EXT_ZVFHMIN	(1 << 30)
+#define		RISCV_HWPROBE_EXT_ZFA		(1 << 31)
 #define RISCV_HWPROBE_KEY_CPUPERF_0	5
 #define		RISCV_HWPROBE_MISALIGNED_UNKNOWN	(0 << 0)
 #define		RISCV_HWPROBE_MISALIGNED_EMULATED	(1 << 0)
diff --git a/arch/riscv/kernel/sys_riscv.c b/arch/riscv/kernel/sys_riscv.c
index 3cd5d42ae01f..dedfe3c6a37b 100644
--- a/arch/riscv/kernel/sys_riscv.c
+++ b/arch/riscv/kernel/sys_riscv.c
@@ -192,6 +192,7 @@ static void hwprobe_isa_ext0(struct riscv_hwprobe *pair,
 		if (has_fpu()) {
 			CHECK_ISA_EXT(ZFH);
 			CHECK_ISA_EXT(ZFHMIN);
+			CHECK_ISA_EXT(ZFA);
 		}
 #undef CHECK_ISA_EXT
 	}
-- 
2.42.0

