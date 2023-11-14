Received: from lindbergh.monkeyblade.net (lindbergh.monkeyblade.net [23.128.96.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73047405DB
	for <linux-doc@vger.kernel.org>; Tue, 14 Nov 2023 14:13:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="uIBDpDTI"
Received: from mail-qk1-x729.google.com (mail-qk1-x729.google.com [IPv6:2607:f8b0:4864:20::729])
	by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E34CC198
	for <linux-doc@vger.kernel.org>; Tue, 14 Nov 2023 06:13:32 -0800 (PST)
Received: by mail-qk1-x729.google.com with SMTP id af79cd13be357-779d57a3343so4573185a.1
        for <linux-doc@vger.kernel.org>; Tue, 14 Nov 2023 06:13:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1699971212; x=1700576012; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=XMkgyvuzGYJaW56Gm45FtsJL6qswpkealapQbWKCBRw=;
        b=uIBDpDTIMu9VGA3u8M1nldKSmpn97SZfT6P0b+VQMlGAkkAqbaxeg3hiCjpXCSUVvF
         b05jV2ToGjDaIh84IQ23PDZKUTdsu7wgWvWTIS0RmrCCJ8/olwSHk4vtoTeYm7SyTG7L
         75FU41ZjDUBF2FPZ2lkNRlGBwqAWO/+HiTsSQ/N6ta8upyc/NAC3ecNdpt42giYYabDF
         TYhUSwAmYHuIDV700z9LIg83/akQ32ZfupFnn7XF1wDkIuURKbqJmQR3xus57ZngSAu1
         ds4jhXXJ6JrNXMBB3p1o9X54sjrIt3aIkn7cyGn9NxI/qnSsTcvndwUH/V35LfXWTMdW
         U+lg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1699971212; x=1700576012;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=XMkgyvuzGYJaW56Gm45FtsJL6qswpkealapQbWKCBRw=;
        b=lz4gG/f4AC7RIxE7DAHbJUAyNwxk2gs6USvLShjNWnRipD3n2NARAvsbBtgGjOE9dz
         hGbKm/8GvHhuIL0V8M/7/JkcwxW/NjzEmr9/SQUtEnlYV9Cfi98nIwd9lbCJp4crNDQx
         opVMVLcMm4IVSnSJAchChdPQlUm2SvYgSdHXOlkNEFtk9DJzRWkNN0z0UKlFx42Dioez
         GxhFqS+IGFCBc0vUG6UmjWk19XSt4WYsEEoOgMIhdP6UjzdP6d7FVXOHCVaix2pLADxW
         4EWviNSiGYMBpqK2i+EcM7SIZLmLBAoK/f1m9W9H1XTaJOr6MaP4sJtUGFQhnWjLGVe3
         ZgOg==
X-Gm-Message-State: AOJu0Yz66kF/08K7YyLI8R3/R4jFF9xRnzapE+nhAxGZ0sP/yNK6bLkm
	qPH56ULlfr8y5eMi9k6w3p0lwg==
X-Google-Smtp-Source: AGHT+IHnMHw8F3ryLSB+7vrra0BH+tHsLT5qn9YR2ZuZzRjWRR16+wgDWF4cMlcUDZPdu8ADN5zYkA==
X-Received: by 2002:a05:620a:1aa2:b0:77b:c622:e7fc with SMTP id bl34-20020a05620a1aa200b0077bc622e7fcmr2526334qkb.2.1699971212064;
        Tue, 14 Nov 2023 06:13:32 -0800 (PST)
Received: from carbon-x1.. ([12.186.190.2])
        by smtp.gmail.com with ESMTPSA id m2-20020a05620a220200b00777611164c5sm2701263qkh.106.2023.11.14.06.13.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 14 Nov 2023 06:13:31 -0800 (PST)
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
Subject: [PATCH v4 01/20] riscv: add ISA extension parsing for Zbc
Date: Tue, 14 Nov 2023 09:12:37 -0500
Message-ID: <20231114141256.126749-2-cleger@rivosinc.com>
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

Zbc was documented in the dt-bindings but actually not supported in ISA
string parsing. Add it.

Signed-off-by: Clément Léger <cleger@rivosinc.com>
---
 arch/riscv/include/asm/hwcap.h | 1 +
 arch/riscv/kernel/cpufeature.c | 1 +
 2 files changed, 2 insertions(+)

diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index 06d30526ef3b..afa9abc1a0b0 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -57,6 +57,7 @@
 #define RISCV_ISA_EXT_ZIHPM		42
 #define RISCV_ISA_EXT_SMSTATEEN		43
 #define RISCV_ISA_EXT_ZICOND		44
+#define RISCV_ISA_EXT_ZBC		45
 
 #define RISCV_ISA_EXT_MAX		64
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index b3785ffc1570..eae14daa5a75 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -176,6 +176,7 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA(zihpm, RISCV_ISA_EXT_ZIHPM),
 	__RISCV_ISA_EXT_DATA(zba, RISCV_ISA_EXT_ZBA),
 	__RISCV_ISA_EXT_DATA(zbb, RISCV_ISA_EXT_ZBB),
+	__RISCV_ISA_EXT_DATA(zbc, RISCV_ISA_EXT_ZBC),
 	__RISCV_ISA_EXT_DATA(zbs, RISCV_ISA_EXT_ZBS),
 	__RISCV_ISA_EXT_DATA(smaia, RISCV_ISA_EXT_SMAIA),
 	__RISCV_ISA_EXT_DATA(smstateen, RISCV_ISA_EXT_SMSTATEEN),
-- 
2.42.0

