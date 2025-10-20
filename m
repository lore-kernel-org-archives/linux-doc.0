Received: from mail-pf1-f180.google.com (mail-pf1-f180.google.com [209.85.210.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0985E3321B3
	for <linux-doc@vger.kernel.org>; Mon, 20 Oct 2025 20:22:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760991769; cv=none; b=TcUgIAHNgOlinIcDpdjezj1RAPya4CmOofBF/zjTDlrj23HhxBUB6LvG1vOJToMZJy7GPJy1USuGMnhD58a1w8+iakbyPlVqlw+42w63Mypa1Cmcz1BVbAtFKf/VIZZR8uHUvcXLx9BuUvxzU/3KW1AnqBmgS3F5/e+CyBtYU40=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760991769; c=relaxed/simple;
	bh=6O/Y7lNaPncL3CoLRCG/BrN84szVrA2SetULdeO50IQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=NfhkhuK/h06TDQsUssW6c4k8ovDcwRtFDLVHaJAVp7rDfTmTv13++p8IjqnkUw6Aq7pWjmiMvN+AZlJe6fSzsx4zGmNFhPY7d+Gs2i20cEbFHO2G0JN6cV5og+RV2eSI4tq3yZYeY1DdVBcCaptPxPMg8y4p6alS5d8m9uAPBHo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b=Js5mAXYZ; arc=none smtp.client-ip=209.85.210.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b="Js5mAXYZ"
Received: by mail-pf1-f180.google.com with SMTP id d2e1a72fcca58-7841da939deso4460082b3a.2
        for <linux-doc@vger.kernel.org>; Mon, 20 Oct 2025 13:22:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1760991766; x=1761596566; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bNLdHsHLApoBXgPow7nD4EiYKLadWrqIeWAFyfWBQTM=;
        b=Js5mAXYZ7U8UU25CQAwshK63xIuZT1dOg0zimQBjr9NMFaM5GjHMeE/fcGOAaANGD0
         LHQ8iK1Ks8QYT55vv/hkiVNAhp+TFjI+Ju+v4+14EwkvIz/vYAtmsxLUSgrpcj9qCU/J
         sfNQLzSi1R6JOJ6ztCgprmCTatkOyS/MyfRfh3kDfmFt9X29Zqm0CnFE+nJD/rPhemYf
         PEsrZUsL0JYftVu01efoTowg3ln7FjL1Lw1l3/AhYLS+DypzuQonUSSj0/l4/hiKJZpe
         JRXEOfVU49NguENecp2P0jAYKCELmP+5x468P9lYxNigV7hOYj4AZCPJQIQ+tc5qLpEw
         0B0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760991766; x=1761596566;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bNLdHsHLApoBXgPow7nD4EiYKLadWrqIeWAFyfWBQTM=;
        b=F5HLMYrKRhHd2TUKCOVPMP6LZ6SyWRBZbI6xHexKJ8S38vZXBQfKWgXxBK9TdxyhL5
         7YpOGanyVKLlp4d2JptpX5VKSR4o49SOi8k1/hP2POy+hgl/NOyhhsW9/T9aOx6K4TCb
         kkEgSdEBjJwJR2yDZpCsWXcobxNFQ1wTxvjH8Tltm8xfRb/r0HVViUHmdK3HtRKCU8nY
         pjPTh7/vHYxzHSfeo6nS/Z3t8F+Iost5S0nO2Itka/Wy3tGuG8EX70kh1dhKT28gIsvf
         iIQb1Y9mFBcWfxoXNpktx2T3J1Vl0ISIU7/ld63vvIDhjg3nmkV93L3q2zk/aet65HtO
         iNXg==
X-Forwarded-Encrypted: i=1; AJvYcCU1ddeOOga2d9+85FQkwF5+ZgEAEKGLsLsyJ0yaOrC9wloQqyv1aAMmdnPT1vulMHJ3/9KenNiVv3g=@vger.kernel.org
X-Gm-Message-State: AOJu0YwJfFl5YRZ4yt5Lrvg020UqZ9yPrwWMMGfsjvinnB14Y5EmFa/o
	xyHORuhGLCW6NlKYKYDHm2Sf3sO2TME3a9JMWSccHv/dWkAW+cjU4LGyaxIJKDwfj6c=
X-Gm-Gg: ASbGncsPZwVVq0RCrm+m4C7s11ZFA1RWYE2Jh1lGrXXFtylgh/RYU/tAAUQdLJ2grCJ
	xZepVL/fxInnFK1MZEDw+KAyHZgZbwmxxbYE+ylkElPUyMmQ5fdP6fvl9dogFp9sV3F9D4aZStk
	0AFEzw1kHdq97HBDNpuHSpO2ILMYNORogzA5CBzYthVovV6UCXkfEVybLj8CMKD5FttfDo7HbBA
	CQb3l/y0j1mvFGTStH48olKQEc+iUoN2PK8p9t9YcR9Pvp+a3F167ylYg8QKmluBomgPSEyiBWM
	hOuDaOouzCN8ijObfILazx6SZ19BsVd09lN2jG4i9izeAYKZOCyH0I9IAsWJ7hknKm4U6xWD7IC
	c61SqDfdL10vyPmNq2MIEctff2aXz3R8bZRISZGgm8JXcGd6bhNrwqXMZxRmTo59vkGEvcxLzdj
	RcndEOVIccVLiUpljuQkKj
X-Google-Smtp-Source: AGHT+IGEGkQ/GC8t0NOwkUogPjF7cO1kT60SXt/VRwKMgl2Ot2MJzGp+Dj2kvvgz4fiB3gPv8XWB0A==
X-Received: by 2002:a17:90b:2781:b0:32b:9750:10e4 with SMTP id 98e67ed59e1d1-33bcf8f9844mr16500269a91.27.1760991766307;
        Mon, 20 Oct 2025 13:22:46 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-b6a766745dasm8443240a12.14.2025.10.20.13.22.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 20 Oct 2025 13:22:45 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 20 Oct 2025 13:22:33 -0700
Subject: [PATCH v22 04/28] riscv: zicfiss / zicfilp extension csr and bit
 definitions
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251020-v5_user_cfi_series-v22-4-66732256ad8f@rivosinc.com>
References: <20251020-v5_user_cfi_series-v22-0-66732256ad8f@rivosinc.com>
In-Reply-To: <20251020-v5_user_cfi_series-v22-0-66732256ad8f@rivosinc.com>
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
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0

zicfiss and zicfilp extension gets enabled via b3 and b2 in *envcfg CSR.
menvcfg controls enabling for S/HS mode. henvcfg control enabling for VS
while senvcfg controls enabling for U/VU mode.

zicfilp extension extends *status CSR to hold `expected landing pad` bit.
A trap or interrupt can occur between an indirect jmp/call and target
instr. `expected landing pad` bit from CPU is recorded into xstatus CSR so
that when supervisor performs xret, `expected landing pad` state of CPU can
be restored.

zicfiss adds one new CSR
- CSR_SSP: CSR_SSP contains current shadow stack pointer.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
Reviewed-by: Charlie Jenkins <charlie@rivosinc.com>
---
 arch/riscv/include/asm/csr.h | 16 ++++++++++++++++
 1 file changed, 16 insertions(+)

diff --git a/arch/riscv/include/asm/csr.h b/arch/riscv/include/asm/csr.h
index 4a37a98398ad..78f573ab4c53 100644
--- a/arch/riscv/include/asm/csr.h
+++ b/arch/riscv/include/asm/csr.h
@@ -18,6 +18,15 @@
 #define SR_MPP		_AC(0x00001800, UL) /* Previously Machine */
 #define SR_SUM		_AC(0x00040000, UL) /* Supervisor User Memory Access */
 
+/* zicfilp landing pad status bit */
+#define SR_SPELP	_AC(0x00800000, UL)
+#define SR_MPELP	_AC(0x020000000000, UL)
+#ifdef CONFIG_RISCV_M_MODE
+#define SR_ELP		SR_MPELP
+#else
+#define SR_ELP		SR_SPELP
+#endif
+
 #define SR_FS		_AC(0x00006000, UL) /* Floating-point Status */
 #define SR_FS_OFF	_AC(0x00000000, UL)
 #define SR_FS_INITIAL	_AC(0x00002000, UL)
@@ -212,6 +221,8 @@
 #define ENVCFG_PMM_PMLEN_16		(_AC(0x3, ULL) << 32)
 #define ENVCFG_CBZE			(_AC(1, UL) << 7)
 #define ENVCFG_CBCFE			(_AC(1, UL) << 6)
+#define ENVCFG_LPE			(_AC(1, UL) << 2)
+#define ENVCFG_SSE			(_AC(1, UL) << 3)
 #define ENVCFG_CBIE_SHIFT		4
 #define ENVCFG_CBIE			(_AC(0x3, UL) << ENVCFG_CBIE_SHIFT)
 #define ENVCFG_CBIE_ILL			_AC(0x0, UL)
@@ -230,6 +241,11 @@
 #define SMSTATEEN0_HSENVCFG		(_ULL(1) << SMSTATEEN0_HSENVCFG_SHIFT)
 #define SMSTATEEN0_SSTATEEN0_SHIFT	63
 #define SMSTATEEN0_SSTATEEN0		(_ULL(1) << SMSTATEEN0_SSTATEEN0_SHIFT)
+/*
+ * zicfiss user mode csr
+ * CSR_SSP holds current shadow stack pointer.
+ */
+#define CSR_SSP                 0x011
 
 /* mseccfg bits */
 #define MSECCFG_PMM			ENVCFG_PMM

-- 
2.45.0

