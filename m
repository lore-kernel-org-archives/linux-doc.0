Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A3A29228CBF
	for <linux-doc@vger.kernel.org>; Wed,  5 Feb 2025 01:22:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738718524; cv=none; b=PnFu/PQjPZeM8UydVYrhy7HufEcNqvf3OgOAi4qe2SRhouEAh9gLZ1rFW9GplnM2Yp/QudaTKEg9TcTOq9+ChIBfg1kXcJc3HifDBAWu6mqqOAbq1l+L9kngyScz+0TkWDJI1YlZ3+ZGyOoqJ++X02NShUPEwrc78zt/XVV5/8w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738718524; c=relaxed/simple;
	bh=f+s1qRILk5w2zoTzbSGEFuSk9CM1mNXrrF3BbhojAEc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=jr++rws2nIiv5mZAmdZ57qNgx4Zfvar3eVhDyN6W4jCKDp4lI9uVroJVywyGWO1WrXMq79tgy+MjWoiVHOwJE3+hs8y7TLsgDWe0yoc4pMkOPBHVgG7zAk8cJU75KSaGrmcbi6FdpX6smfATmhNJqhd3bOXzahbwkUwNKitWBhU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=N9q/Ip8p; arc=none smtp.client-ip=209.85.216.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="N9q/Ip8p"
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-2f9d9f14a74so1153916a91.0
        for <linux-doc@vger.kernel.org>; Tue, 04 Feb 2025 17:22:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1738718522; x=1739323322; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=n3DM8zy+WllPP0TujEXFZ0Ycc0zGrpNRrMRWPkPmGZc=;
        b=N9q/Ip8paiGdBMlMe2ehBfybqtj4NgCucQKo8e+0dob+sT1U+X8fg9T5ssWJFwscyb
         gXcVLNeraORJnHShF6kgnIa+OCEJDhi/6ZEPZ9TZAit+Yinj1jJ2UGs5CtFxy+EKdfX8
         RmOT7xM/Rfj5bMDTXm9ldlgtBi1DY6dtzDnUsiI7HNW8sQTA0zmPA9ycD29rRJiG0o2D
         q8urRJm2cgPRiscHgU2eWMpgmgtuHW/MULm4E5FdMD5wgW/HjEbMzfhelOCd8T/ZGvto
         okfT1VvmuupefNGsPxmxv7ufa6p5OAy3CDhPCE8qm1WtOa+oaEDuw7otb6e5Xy+ZeR0o
         8zyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738718522; x=1739323322;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n3DM8zy+WllPP0TujEXFZ0Ycc0zGrpNRrMRWPkPmGZc=;
        b=FnxFyJmJxrpNE0Eg30R/HiQQGdrrzLxn+BLYg1mi2N4FuXGsS2H+6f8mMAp/MLm1rV
         d0o29DtewZEvGRm9rwsg2XUVOWpARHFIBav9aJottf89bRQhHpM6RKXZ7pUEUjlJOgT5
         Nl1s2bvITysovk8oGAoU5n1UagUt0TAehymFKKDBNHXbpQAHSo42z4CG/X8hjaM9yA07
         WqE51VU9H+nWHbz+8vqgq7gimFa+nMvSoI3t0N2UCo0FXeYHtBQjTYZcfBNnURlSvQEu
         TDGyoc0FFH5KXs18wqSyM1iCGNoyrn3HkCzSdJJGv+5s6yXTsBIcYw5j75PajbUqJ/as
         L9GA==
X-Forwarded-Encrypted: i=1; AJvYcCVHtBQ+kYXJfDkvrzdNus5ktwpT6wkc94jvyFHAOSrl45yTD6pzf+KXevJ4IOnySPLpH9TCRrNH0sE=@vger.kernel.org
X-Gm-Message-State: AOJu0YxDVUktuigy5AB2BDevDDYDAaRe+2tfCw1H7h3FcfU/RNo+BDFU
	VzDTjxCU9AP4/uk8GZAT1khxm9phVO5WUOcl9bm1EWtmrDptGLFbrse0Vk71+HI=
X-Gm-Gg: ASbGncvqk9S8LjxEMZ3f0ajTOAAuGpbT0Lu/JuTSnbNXzJvGhG5xVxjmfsSIK+aqh50
	DM5RHtjcUHznwr13y7hHdZzMDtUIEmGKDjxTIQx3enkw9MiBS2qPgP8T1voNOeFeRtlcXMn9mKD
	E19EwTmEuXXUz859AMNjPULQq4ATaMG/36D1cdRyeconUF0k/kK4iOeUAVPdIoThPPdAFnIamD6
	UDbDDxU7Stcr3NFTuhYE9xf4MVBkHfi4+21TPVOmQBTtbfOUMA5Tl/Dd/n3xJku9rfGTmAJfYr4
	/9fv0v79LTPqDPbtxqQgX6PbTA==
X-Google-Smtp-Source: AGHT+IGTMhaxmFsvWrTefkXBFDqJevilxfDmNJ8PU7kLoH+rq+SB81MDslBfLWbGGJU9DTXRp8pAhQ==
X-Received: by 2002:a05:6a00:2287:b0:725:e499:5b86 with SMTP id d2e1a72fcca58-7303521977bmr1539398b3a.20.1738718521754;
        Tue, 04 Feb 2025 17:22:01 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-72fe69cec0fsm11457202b3a.137.2025.02.04.17.22.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Feb 2025 17:22:01 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 04 Feb 2025 17:21:51 -0800
Subject: [PATCH v9 04/26] riscv: zicfiss / zicfilp extension csr and bit
 definitions
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250204-v5_user_cfi_series-v9-4-b37a49c5205c@rivosinc.com>
References: <20250204-v5_user_cfi_series-v9-0-b37a49c5205c@rivosinc.com>
In-Reply-To: <20250204-v5_user_cfi_series-v9-0-b37a49c5205c@rivosinc.com>
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
 Jann Horn <jannh@google.com>, Conor Dooley <conor+dt@kernel.org>
Cc: linux-kernel@vger.kernel.org, linux-fsdevel@vger.kernel.org, 
 linux-mm@kvack.org, linux-riscv@lists.infradead.org, 
 devicetree@vger.kernel.org, linux-arch@vger.kernel.org, 
 linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, 
 alistair.francis@wdc.com, richard.henderson@linaro.org, jim.shu@sifive.com, 
 andybnac@gmail.com, kito.cheng@sifive.com, charlie@rivosinc.com, 
 atishp@rivosinc.com, evan@rivosinc.com, cleger@rivosinc.com, 
 alexghiti@rivosinc.com, samitolvanen@google.com, broonie@kernel.org, 
 rick.p.edgecombe@intel.com, Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.14.0

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
2.34.1

