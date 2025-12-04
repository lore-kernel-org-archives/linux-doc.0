Received: from mail-pf1-f179.google.com (mail-pf1-f179.google.com [209.85.210.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B93134C80A
	for <linux-doc@vger.kernel.org>; Thu,  4 Dec 2025 20:04:13 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.179
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764878658; cv=none; b=UElQVFhKw2dm+LygLzsMNOGgzzNjxKlFZriai4lIVoZnBxSNnc2kWN/yd8ctvBmxVo0xZ9GxmnZxuRk+92qqGPieWLE9QnM8IP9j4PSkobxM0CPurVEmQMtqAeqqJ8mM+OOmrO2TPM6jLhhrVyHXyuQnt8/sRyVoeMyGl4oIlHI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764878658; c=relaxed/simple;
	bh=nBM+gKOHTmPMkti0DTh5flAX5grcW8t0U+G6mikLn4g=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=l49X5XtEFNRREIsmO78HV6n3coBzH4ONrq1R8OhZ5otvH0jHqUJcIPTpDB1SIo84FpTYyncto833uGx3tH2fsjbpi/w4IazrlgIeqNOc6s7Xzet8BmohN124zR5GlaQ7I0+PfpxjnYH8lbGRnGL7eB/xaUCLCLTR+Q1qRrfPrAE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b=Uo1uU2pp; arc=none smtp.client-ip=209.85.210.179
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b="Uo1uU2pp"
Received: by mail-pf1-f179.google.com with SMTP id d2e1a72fcca58-7e1651ae0d5so1074722b3a.1
        for <linux-doc@vger.kernel.org>; Thu, 04 Dec 2025 12:04:13 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1764878653; x=1765483453; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FldpuJVG3boWADnTyrci9WEZv61t3vqu/iLtDVGsedQ=;
        b=Uo1uU2ppZbO1DL0Mca7B9RaVt96KHPaOka1VEbM+Ur8pPBuNQpb47Y4UzgDeRnoSxF
         MkUbZRqOm9SgHp/ksUHTkYce3TFS797QzImBX4PbvVLkbUw0JJ/pCdudqGHy5IRlXtEa
         X0jlAq6DZbfB+oI+MUwo955U78TahdfiBdG6tknsCJXrCUGo+AaoFEt53W3ly4RfrHYU
         iCuk8zdEjm4/PDIZXSua1wsd/vEV+swYjBU1/kEZLhmM4dut3nLWJvzxyTVyTELw06dE
         dZFEJ0xf/flGArt5c/T7VOJaQAc89mJ5o9Uc8TeBS//vA8BHZoJm8cN9fWWQKckvmFAo
         //Ug==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764878653; x=1765483453;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=FldpuJVG3boWADnTyrci9WEZv61t3vqu/iLtDVGsedQ=;
        b=RMxn9J9RWvfOp15xYrFF+YGHfW+lN+39LUh/Q8oEtDNfc31j7tUaawaqk6R8Bn1gsw
         W9RugEEfbUbVfBiyQx8Uq3kdjdViDCC2ghF+eQKiRBai7QWAHA37R0iRZdJzJr1Bu3r8
         1X1dv6SUhi6grwTZIl4roT3d8aVEJ1MZ3erIyJBFNxP/fFct+5m7o38JyFa4+hiGocFJ
         X9ThPA3blqQQC7z+0d5JzZZqyuCY3SABmz2p+gPMS2Viehqoz6zsz829ookAQt7Ew+im
         QNr7FRcms0QRuPVwoc9cr8jA3Xc004uxHfsXEVobHoQBXsdLEvOZRkGyrY3LAwiC0PQe
         sU5g==
X-Forwarded-Encrypted: i=1; AJvYcCU+/i7a39KHXYFRqalOgqxxN7OUO0jrL6GOr83mXCtWdzvgME06B9AYaBGx3H6KzkFBHdeKRZrla9w=@vger.kernel.org
X-Gm-Message-State: AOJu0YzAeREfvSK4VvEeU0TCQusSQxyQpGMeXewfRJz5b2HsB1hTXEEP
	e3nGog41l7KLvAG+Ir1W2zdx7VP8J/TWt5+GKW7XseeB4EQjFB1G493b8UM+l+CJi1U=
X-Gm-Gg: ASbGncvszzwqkJqKVMLGbebpH264K19qn4jn0A2MPwMN34ZlrYJocltS4WbyL/jpLA4
	sz2Y8cDvqvZGaeYqhAxf7ztphRz/fbMSAiLGLkh6oYwQmAjg0xRIPKQrQMIoHtD5sb9oE5bft2p
	YNhXjEHu6VbfZsufdX6jRbbqg+bbsgd/YvP6Pxrz6MvS6/a5swBG2RqXQV0M8cvzFfPY1o4wYOK
	e5rxJL2HA8utIcS/r0A68IPQifLCu9qwK+hVM5OaaVThgFlDbl73BPELWmRTcZCpaWcVt9/473m
	JtQfAq2ojNuWQvvJIJg1TLrypJJY3jHRYb20/0i1wVWhfv8WG0zacGxOEjGRaJ4YnkGdWGXSG//
	TkyT6L0JKl4zxQD5h6ehn3KsMipPYseUGSO9NcDdovEQ4HdcOyxKwYLtFZAHexLIjSy5A0X4PQc
	k2TK2eOZVpza+/4ksAIFAg
X-Google-Smtp-Source: AGHT+IGjVnFtxoq+ijVcDtx0OCHTq9OmWeXCmlU4QkZIcha6VRvMSqK/PJx+/0y8YF7KOcJH2N5m7Q==
X-Received: by 2002:a05:7022:ebc6:b0:119:e56b:989d with SMTP id a92af1059eb24-11df64571cbmr3629950c88.4.1764878652823;
        Thu, 04 Dec 2025 12:04:12 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11df76e2eefsm10417454c88.6.2025.12.04.12.04.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 12:04:12 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 04 Dec 2025 12:03:56 -0800
Subject: [PATCH v24 07/28] riscv/mm: manufacture shadow stack pte
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251204-v5_user_cfi_series-v24-7-ada7a3ba14dc@rivosinc.com>
References: <20251204-v5_user_cfi_series-v24-0-ada7a3ba14dc@rivosinc.com>
In-Reply-To: <20251204-v5_user_cfi_series-v24-0-ada7a3ba14dc@rivosinc.com>
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
 Zong Li <zong.li@sifive.com>, 
 Andreas Korb <andreas.korb@aisec.fraunhofer.de>, 
 Valentin Haudiquet <valentin.haudiquet@canonical.com>, 
 Deepak Gupta <debug@rivosinc.com>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764878635; l=1430;
 i=debug@rivosinc.com; s=20251023; h=from:subject:message-id;
 bh=nBM+gKOHTmPMkti0DTh5flAX5grcW8t0U+G6mikLn4g=;
 b=uY7iQ2LIkJgteQ4Sw4sUrLdwxATM/reMziN4oXAuyJmOqbeIfYCABxovYmWTfoYHQF59573Pn
 VjYOzhAFsF+BgJRsL7YkYitn/mU561XLQqyY2K9okW1m+HpBcCwq0OE
X-Developer-Key: i=debug@rivosinc.com; a=ed25519;
 pk=O37GQv1thBhZToXyQKdecPDhtWVbEDRQ0RIndijvpjk=

This patch implements creating shadow stack pte (on riscv). Creating
shadow stack PTE on riscv means that clearing RWX and then setting W=1.

Reviewed-by: Alexandre Ghiti <alexghiti@rivosinc.com>
Reviewed-by: Zong Li <zong.li@sifive.com>
Tested-by: Andreas Korb <andreas.korb@aisec.fraunhofer.de>
Tested-by: Valentin Haudiquet <valentin.haudiquet@canonical.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/pgtable.h | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/arch/riscv/include/asm/pgtable.h b/arch/riscv/include/asm/pgtable.h
index 4c4057a2550e..e4eb4657e1b6 100644
--- a/arch/riscv/include/asm/pgtable.h
+++ b/arch/riscv/include/asm/pgtable.h
@@ -425,6 +425,11 @@ static inline pte_t pte_mkwrite_novma(pte_t pte)
 	return __pte(pte_val(pte) | _PAGE_WRITE);
 }
 
+static inline pte_t pte_mkwrite_shstk(pte_t pte)
+{
+	return __pte((pte_val(pte) & ~(_PAGE_LEAF)) | _PAGE_WRITE);
+}
+
 /* static inline pte_t pte_mkexec(pte_t pte) */
 
 static inline pte_t pte_mkdirty(pte_t pte)
@@ -765,6 +770,11 @@ static inline pmd_t pmd_mkwrite_novma(pmd_t pmd)
 	return pte_pmd(pte_mkwrite_novma(pmd_pte(pmd)));
 }
 
+static inline pmd_t pmd_mkwrite_shstk(pmd_t pte)
+{
+	return __pmd((pmd_val(pte) & ~(_PAGE_LEAF)) | _PAGE_WRITE);
+}
+
 static inline pmd_t pmd_wrprotect(pmd_t pmd)
 {
 	return pte_pmd(pte_wrprotect(pmd_pte(pmd)));

-- 
2.45.0

