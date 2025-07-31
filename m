Received: from mail-pj1-f50.google.com (mail-pj1-f50.google.com [209.85.216.50])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C178F28031C
	for <linux-doc@vger.kernel.org>; Thu, 31 Jul 2025 23:19:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.50
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754003972; cv=none; b=bZOSeEaooUvzXG5NZOWIVsVSZlFpORyw6F+J0osGORRWnw4PujkawK4xwo1VuqkAoU8Oi2qkfNrlAnKMYZi7w9ZH/JphXj99cQFkXyCIvhAULr7FxarvgZ+wwzPaxHP/9JyVG8b01wDWClUHM+3h5glt2mKQvvGf7B0ymS25JTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754003972; c=relaxed/simple;
	bh=ynTUDLBp2gEKhFeiYfxgOCPe6wht1rOzpyg0Vu3jGXs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cUJt72dBWCxRQv+FMV0/jCsnGbSPjsdjwzu4yv16fsPWgPm8iy9xJ2nXpGrpFPJ1j0Mh4FhpoQhHnmZh7oa7hn6ztyR01MlPjQxxulxrNxQIw7CAFdJN3Z6zk2eOft5oUigut+mJd1kT5KItncN6tDh9qXvNUughbaKnDvi1t+w=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=ufdpYXrj; arc=none smtp.client-ip=209.85.216.50
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="ufdpYXrj"
Received: by mail-pj1-f50.google.com with SMTP id 98e67ed59e1d1-31f3b54da19so1083809a91.1
        for <linux-doc@vger.kernel.org>; Thu, 31 Jul 2025 16:19:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1754003970; x=1754608770; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Ome3u7rmCNb01KyjL0hHySpySbFvJDab/QcqkVOgxo4=;
        b=ufdpYXrjZLKwKW/apeCKt5rRByAeEza9TLVHW5U5Wbn2PsimgKVCYLJtu2CZTgfIyV
         3CwZ7oMKQOQhmrEScxWD/GJmMU8kQOTfeo19PERqhAUYz3pE2W2Rzj8Pg9Kb7j8QzLOD
         HbBFA0c1hGwoDAHwBhWsgv62ymThxRHen38iLgDrMP7B7LovfS7rS2u0Xft57M1DSJZq
         ijo57MDkm4GObXgrIv/nsK3MGDLLHBRMlyz0CPQa8bxH8Tu2mVKi9TOPijCIUNFZReNW
         6Gj1r4JIz2PvzBXrYcqddgbJz/gEvDFjQ4tz28eLsq/rtXcWj0pFPPumICtq1ZaGJhX1
         vl4g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754003970; x=1754608770;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Ome3u7rmCNb01KyjL0hHySpySbFvJDab/QcqkVOgxo4=;
        b=bGCOTysQL0IfgsxPx77SeOHrLbrh117HLMyinihC+Tx19nWUzgCNvt3YrgCRJkef/b
         tU6plwQV4dtBoR46GGdhNFDnbaqgRAoU0OkEUkwOtdJa1Yku9yl2Z7cE4uwome+rvARO
         YAwm7bmJQ8TA2feLfCI1YwtlWsU89sB7l0yEDOVScn8s+uQDANulT6sLAaagLFerc4Lf
         gTCCn+MtpLgUkAun90/WzjGenLW8vvnvbWadKdDwRjarc2Dka0jAI3hnatTy0RIbsW12
         VhQEXg6iAcqSkSndnMnM7/9W70pezpyWXkykbUO72VJuh4Q+nGJNpVjvJCVTBWCdnoiw
         y3YA==
X-Forwarded-Encrypted: i=1; AJvYcCUi1s0QOjI6zerDYduRB2Cu/lICfidAgxTG4Dwu+R8fxXyyHzL5Ed7A8FfmIe0ZfbhVPl48awOUtwE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxHfby3kx2tSpUdyStvq/pnvYOie5fODz+khEVAMZ9QNtIi8v8M
	UJcg2pfhClXN+Ap8M6oUikeO8ZLp0xLTnk0zEkeaPRuG7Q5wNsDXiryDc/3J3ipgPKM=
X-Gm-Gg: ASbGncsaj/aNuJLJs+POJAEPwGsR7nJI+x8V1XCe23KK83YsDubuXv86GdT/nzj1LPa
	UjfCS29UOS6SEYOU0AdXFVaFz1Rz4lqYxFsbhioUyl/8MgTIUh1RyMnQ6bqDZSI7bOsXFZPq9u9
	y3sIAsQw/heEX2S20Fv7fZhd85NlKq2qfQwA39XZfJEVy5YAwRV/v3/DiImcCeQxWrp8qRnOGJ3
	c9KT7NJp/LRO0+102xGlwgzy6ohunsCtUrYygFYUz9xbuns0oGzcGmcKowUekdy5pXLCE8EvrI8
	2Ei9hEw29lOOq+vsOfaUVl6iABjK4DayJWZdPIfJN2FDp5U4qm0ipm6hdXNF3cpbR3wd4zxYoTd
	3ZOz/wocqq3l82WtJ3VIs+/v35n/U6wiw
X-Google-Smtp-Source: AGHT+IEW/IYpi8/2d1JJvWg/cAIN1Y+XWLtRcPc5BAni0gcHSZT0OGnkDz3++3xD4dhcW2YSKWJWHA==
X-Received: by 2002:a17:90a:d607:b0:31c:c434:dec8 with SMTP id 98e67ed59e1d1-31f5de4b8eamr12568167a91.20.1754003970168;
        Thu, 31 Jul 2025 16:19:30 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31f63da8fcfsm5773085a91.7.2025.07.31.16.19.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 31 Jul 2025 16:19:29 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 31 Jul 2025 16:19:14 -0700
Subject: [PATCH v19 04/27] riscv: zicfiss / zicfilp extension csr and bit
 definitions
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250731-v5_user_cfi_series-v19-4-09b468d7beab@rivosinc.com>
References: <20250731-v5_user_cfi_series-v19-0-09b468d7beab@rivosinc.com>
In-Reply-To: <20250731-v5_user_cfi_series-v19-0-09b468d7beab@rivosinc.com>
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
index 6fed42e37705..2f49b9663640 100644
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
2.43.0

