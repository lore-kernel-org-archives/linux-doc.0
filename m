Received: from mail-pl1-f177.google.com (mail-pl1-f177.google.com [209.85.214.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AA5B3303A0B
	for <linux-doc@vger.kernel.org>; Wed, 15 Oct 2025 18:13:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760552031; cv=none; b=GaaFrQoPjQKgkj547M0kQCZv2c/vv9WdqcHdJrYyiE5NmG+25cWWUUlxNdL5tw7wADsEE4X/91/MGXlO0y+sCP6f4GiZifZnWxSTDIDaVXySzI2gHPKRucZPHSiNP5ODlm2pBsqyf5JjFsFI5vQWEypP+rJ+P1E03lo3O8sOIUU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760552031; c=relaxed/simple;
	bh=deI8AoZPctoPZRL1uqTvQmr6gi6xgPskQ2JbS5WJlvk=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Gjimb0OLqZZVEIU/SKUy01kjxruAQK+bKxGnIwAdGUpNY+ULqwX3Qgf9VknmUNThSoOaGPP+PWNzMGNm/CM5TBLrLXg3u7naxb1ej3xu8AI70Lt8B11bNwrNEkDSLc9zADJUrp6zJOZ4r4vNz6oR01OSMd6nSpZFL6WSKiuKnfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b=Ay1PQW6Y; arc=none smtp.client-ip=209.85.214.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b="Ay1PQW6Y"
Received: by mail-pl1-f177.google.com with SMTP id d9443c01a7336-28a5b8b12a1so63027995ad.0
        for <linux-doc@vger.kernel.org>; Wed, 15 Oct 2025 11:13:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1760552029; x=1761156829; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=njWxpRWfJB7aZ6YZP/EJ8dyU7DPEUOfUxx+ytpaopVc=;
        b=Ay1PQW6Yb2onumjjM2u33xmMbc1HBjGgEf7ulSx9fpstqyOfPkHfWNp2OMuCyr3FQn
         8S+05wwdWZ4g485/bw2AOoX47egHhXb6N91I9wK0KMJmqD8tR9H74Ko8nfw2fEByXmX6
         ZGEWUwNyXvais3G1JC5TulbbImMxgAhk1vfLJ5Xewni1C2szKAOYaSvQCryQb2ctJENE
         3vU7NY6tmymhkcOKgIt7GljB4IKTV5mSm6W+LyxUAHHQ3urrJO7U4RUQOQ1E0PdrP4+y
         H1dpuk5qIJC4Du8tL7fEbnmG8KNkzasKV+Tz8ynBqlbBIjrIV84GaQNdHtVCM3jQkNsf
         ES2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760552029; x=1761156829;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=njWxpRWfJB7aZ6YZP/EJ8dyU7DPEUOfUxx+ytpaopVc=;
        b=hjc3gRRx4/Kc5SlF6zyA7jScPuz+uNh/T/+/0KzxGlLkGrAAsosjyA8+E+QcKub7/1
         8CLx3rUzrH1K09Kyad4tFYXi6KIPUIHI5U1rA/rsVu+dmKqGXN0Km0MdfKTIsVU8KIru
         JXXbMN2f3tP4mzuO/PKm4vTn/JPTF4NIi2sUKk6QQLY8lBCmRrfu3OxppuqE3LXfEOwU
         5TUJb+5JhsDojzjNgE+CsGt3+oMy2zhR9K8dxUXD2bVWGNj9pT42HvD2yqOWRa9tJn+V
         Lzmq6hGasUy8TQQ+utOI/qrWl/KFyHxM8qPIvOmqLtmSRujLOEu8k6XnV6yviBq7IMVU
         sEfw==
X-Forwarded-Encrypted: i=1; AJvYcCXGIwHwiDyBUFsTF59iupV0UgS9QRfXaLXT7u0cqNhS1ZKCs9os8o5OACllrJHqfg/lkDI3FlOreCc=@vger.kernel.org
X-Gm-Message-State: AOJu0YwmLUJeVTrXBueBP10tR87wx8dxcv0erCs9i6ArEvbP62mXqlUc
	xb6wUhZ92TBwm7q+/MVoTPxRPX++79cvAiDvVuA58sJypeNdA6ZMkHIwOmTxghcN5sY=
X-Gm-Gg: ASbGncsvNFWvUPB2o8045s/lG7am/BRrWN1qANzXgKWwY+m9kyzXGD8f2Vwew8bW5h0
	mpYFC5a/rZGtVU57CT+dDxQye9FfszPJ/xJBAOIDLwYyILowFUl1Jos8Lc5GiftLq4P8gVYzCH/
	DetWtBHVBHXzCYpJSkLjVgAzSVF9LQfFv9s6At/s+J0lMsKmNTF7NV+AvuZM+H15IAqnaZlbw+f
	gE9eFxEfu3lkpWt1+k2yncq6+TlZ4s0EHku9+1tuhabBxouHotYnJYUxag3xJ2+DHJ719roT+3s
	OMfJUR3Y9ht3aT0Y8XWBHjhCcQI79HZdrMutfPygIGSHmeAeZZSlKRe3dnvmBpMW52sxINia1O4
	pkdPlFlo6aTyi1Jy6JeuPPGkgLbqVOTfPr3/jrzZXJF+sZlJm3UA=
X-Google-Smtp-Source: AGHT+IGLJo6dWzbyiMLfZeqj0X7MFaITDk1+T71ftISWllJONzXEpgCvzxXwD6lN4wBAx5b9omdSsw==
X-Received: by 2002:a17:903:2d0:b0:25e:78db:4a0d with SMTP id d9443c01a7336-290273eddd5mr362160075ad.36.1760552028613;
        Wed, 15 Oct 2025 11:13:48 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2909930a72esm3126625ad.21.2025.10.15.11.13.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 15 Oct 2025 11:13:48 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Wed, 15 Oct 2025 11:13:35 -0700
Subject: [PATCH v21 03/28] riscv: zicfiss / zicfilp enumeration
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251015-v5_user_cfi_series-v21-3-6a07856e90e7@rivosinc.com>
References: <20251015-v5_user_cfi_series-v21-0-6a07856e90e7@rivosinc.com>
In-Reply-To: <20251015-v5_user_cfi_series-v21-0-6a07856e90e7@rivosinc.com>
To: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, 
 x86@kernel.org, "H. Peter Anvin" <hpa@zytor.com>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 "Liam R. Howlett" <Liam.Howlett@oracle.com>, 
 Vlastimil Babka <vbabka@suse.cz>, 
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, 
 Paul Walmsley <paul.walmsley@sifive.com>, 
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, 
 Conor Dooley <conor@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
 Christian Brauner <brauner@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>, Oleg Nesterov <oleg@redhat.com>, 
 Eric Biederman <ebiederm@xmission.com>, Kees Cook <kees@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>, 
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>, 
 Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
 Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
 =?utf-8?q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>, Benno Lossin <lossin@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, rust-for-linux@vger.kernel.org, 
 Zong Li <zong.li@sifive.com>, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0

This patch adds support for detecting zicfiss and zicfilp. zicfiss and
zicfilp stands for unprivleged integer spec extension for shadow stack
and branch tracking on indirect branches, respectively.

This patch looks for zicfiss and zicfilp in device tree and accordinlgy
lights up bit in cpu feature bitmap. Furthermore this patch adds detection
utility functions to return whether shadow stack or landing pads are
supported by cpu.

Reviewed-by: Zong Li <zong.li@sifive.com>
Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/cpufeature.h | 12 ++++++++++++
 arch/riscv/include/asm/hwcap.h      |  2 ++
 arch/riscv/kernel/cpufeature.c      | 22 ++++++++++++++++++++++
 3 files changed, 36 insertions(+)

diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index fbd0e4306c93..481f483ebf15 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -150,4 +150,16 @@ static __always_inline bool riscv_cpu_has_extension_unlikely(int cpu, const unsi
 	return __riscv_isa_extension_available(hart_isa[cpu].isa, ext);
 }
 
+static inline bool cpu_supports_shadow_stack(void)
+{
+	return (IS_ENABLED(CONFIG_RISCV_USER_CFI) &&
+		riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICFISS));
+}
+
+static inline bool cpu_supports_indirect_br_lp_instr(void)
+{
+	return (IS_ENABLED(CONFIG_RISCV_USER_CFI) &&
+		riscv_has_extension_unlikely(RISCV_ISA_EXT_ZICFILP));
+}
+
 #endif
diff --git a/arch/riscv/include/asm/hwcap.h b/arch/riscv/include/asm/hwcap.h
index affd63e11b0a..7c4619a6d70d 100644
--- a/arch/riscv/include/asm/hwcap.h
+++ b/arch/riscv/include/asm/hwcap.h
@@ -106,6 +106,8 @@
 #define RISCV_ISA_EXT_ZAAMO		97
 #define RISCV_ISA_EXT_ZALRSC		98
 #define RISCV_ISA_EXT_ZICBOP		99
+#define RISCV_ISA_EXT_ZICFILP		100
+#define RISCV_ISA_EXT_ZICFISS		101
 
 #define RISCV_ISA_EXT_XLINUXENVCFG	127
 
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index 67b59699357d..5a1a194e1180 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -274,6 +274,24 @@ static int riscv_ext_svadu_validate(const struct riscv_isa_ext_data *data,
 	return 0;
 }
 
+static int riscv_cfilp_validate(const struct riscv_isa_ext_data *data,
+			      const unsigned long *isa_bitmap)
+{
+	if (!IS_ENABLED(CONFIG_RISCV_USER_CFI))
+		return -EINVAL;
+
+	return 0;
+}
+
+static int riscv_cfiss_validate(const struct riscv_isa_ext_data *data,
+			      const unsigned long *isa_bitmap)
+{
+	if (!IS_ENABLED(CONFIG_RISCV_USER_CFI))
+		return -EINVAL;
+
+	return 0;
+}
+
 static const unsigned int riscv_a_exts[] = {
 	RISCV_ISA_EXT_ZAAMO,
 	RISCV_ISA_EXT_ZALRSC,
@@ -461,6 +479,10 @@ const struct riscv_isa_ext_data riscv_isa_ext[] = {
 	__RISCV_ISA_EXT_DATA_VALIDATE(zicbop, RISCV_ISA_EXT_ZICBOP, riscv_ext_zicbop_validate),
 	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicboz, RISCV_ISA_EXT_ZICBOZ, riscv_xlinuxenvcfg_exts, riscv_ext_zicboz_validate),
 	__RISCV_ISA_EXT_DATA(ziccrse, RISCV_ISA_EXT_ZICCRSE),
+	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicfilp, RISCV_ISA_EXT_ZICFILP, riscv_xlinuxenvcfg_exts,
+					  riscv_cfilp_validate),
+	__RISCV_ISA_EXT_SUPERSET_VALIDATE(zicfiss, RISCV_ISA_EXT_ZICFISS, riscv_xlinuxenvcfg_exts,
+					  riscv_cfiss_validate),
 	__RISCV_ISA_EXT_DATA(zicntr, RISCV_ISA_EXT_ZICNTR),
 	__RISCV_ISA_EXT_DATA(zicond, RISCV_ISA_EXT_ZICOND),
 	__RISCV_ISA_EXT_DATA(zicsr, RISCV_ISA_EXT_ZICSR),

-- 
2.43.0

