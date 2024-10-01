Received: from mail-pl1-f180.google.com (mail-pl1-f180.google.com [209.85.214.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57DD41D096B
	for <linux-doc@vger.kernel.org>; Tue,  1 Oct 2024 16:08:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727798898; cv=none; b=ld61OE+LbVVr6ZwzKwTC27El6LLgvIVNbnW35DRN5bgl1CH8JW8JNW1wvhDde5jVZM219Sz2LRZ6kuQtwD7crntCmDD9PsV3dISYslN0TGhMbDlPfWgF1dzTgxSUJ/2Gt48bf3PZXNJPsV5ETQiPZeJjvyLYrACzlDVY9rlJvpA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727798898; c=relaxed/simple;
	bh=0axzMG+jMLcPTkOotz3/NOaUKJsXbFkqFClsPN+H9FI=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=GKJJmctL1KGS6tP68SXQ6zdN/bPjfQ/itj/2MbKDjL1D89ozdbSqJs7086tifrOox6QA5cuesYgZIEKGEV2D7uCNKzgPZ8avzjtUwTU4ZarfNC+GoRYUeLqmukhSRavNDzPBk7IbF9d4akp2Vi686/elLW/gAqDt98XH+2Hg7Vg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=BnBzYDc5; arc=none smtp.client-ip=209.85.214.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="BnBzYDc5"
Received: by mail-pl1-f180.google.com with SMTP id d9443c01a7336-20b6458ee37so38585305ad.1
        for <linux-doc@vger.kernel.org>; Tue, 01 Oct 2024 09:08:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1727798895; x=1728403695; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=COCNpmNzP6WC0TkslCp4YYWczFrCYYnCulBqOF+s4dc=;
        b=BnBzYDc5NZHPFNe7S9beCT19btucRwBAhwdiRbbzk3Bx3WcuI4b5nO8FmSb/+gvK27
         NdWiL8TdAo/MrVQKiuthWWEozG86RMKOuW+Eo/m8WsRcovCQPyrNy+7nIUGMsVWsGB8q
         QDDF1rsdiJTZG7dJMs44DgLvMzZ7KImQNWzKqBUw+bIuvSKH/BFHtwhrm0GRn2owaUHK
         iOzdPu/QEBsKxUSjhNbG+yCpMw6qBcGalVIEKpSgHfV3WLvouzfbKJce1DkfpEm4o0xZ
         B7O0fs5dwZQJv4z2OXDWkYLNkcGWDwzOtUystRHQyTchLKI771Y3r1Tx/1WfUpIdPLUu
         A7xQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1727798895; x=1728403695;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=COCNpmNzP6WC0TkslCp4YYWczFrCYYnCulBqOF+s4dc=;
        b=j/KFdqOSKC+Yczg50sNytcm2UO4Es7cEXQ0LL+aBWvuu7YKEOHX3R/b+L7u2/7ALml
         rUieJsy2VNolzHuuhztOApiSDdS35d0xTNjCqsq0BoFVfJ83f+qTOXKna/QyoAfGnabV
         tMf49e1T3OCutZHULcbWPmyV/CSGsOgD8YXnOsVXXrDugoeOkqfiAbhSmw67wDw1U/70
         wUtwm3eHvzpS+h4U5dviHSZncZ+FGskbTYcyZGOxfYpm7WfxFCPkas2tCH8awLm5xqWn
         4U8c0qcDJApW/c2K7O1y5mQ1lMeBx4oJ0Wd4hVKWdFaJOJo0763R110QpytgjBzWRV+5
         Y+tQ==
X-Forwarded-Encrypted: i=1; AJvYcCVG0GfIxoXGptSTTQ696+xrcAWDIxZZ7W8no0kNHFRJ4/0TBtgPWic5X68X0rVahJ0EPCAe6nO2Jgg=@vger.kernel.org
X-Gm-Message-State: AOJu0YwWSN67GKO0Yjz0i2/M1QBiMVnF9yU5ITnVEAzVSz/oZILkKbz7
	/0HVii5NH5e0h3CHSCVEiv4dE4vOaEaIIezD4jGCefL+WOCS0xiDfRxR1jxw7Wc=
X-Google-Smtp-Source: AGHT+IHJ9Lg6QUp5AJMvLZl2TSQwbNKVqaUFdkYSpxGCN34z5YgLawRUhWByN+Lq6nFf2iRfOgfH3g==
X-Received: by 2002:a17:90b:2250:b0:2d8:7561:db71 with SMTP id 98e67ed59e1d1-2e1848f66edmr219547a91.25.1727798894659;
        Tue, 01 Oct 2024 09:08:14 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2e06e1d7d47sm13843973a91.28.2024.10.01.09.08.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 01 Oct 2024 09:08:14 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Tue, 01 Oct 2024 09:06:33 -0700
Subject: [PATCH 28/33] riscv: enable kernel access to shadow stack memory
 via FWFT sbi call
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241001-v5_user_cfi_series-v1-28-3ba65b6e550f@rivosinc.com>
References: <20241001-v5_user_cfi_series-v1-0-3ba65b6e550f@rivosinc.com>
In-Reply-To: <20241001-v5_user_cfi_series-v1-0-3ba65b6e550f@rivosinc.com>
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
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>
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

Kernel will have to perform shadow stack operations on user shadow stack.
Like during signal delivery and sigreturn, shadow stack token must be
created and validated respectively. Thus shadow stack access for kernel
must be enabled.

In future when kernel shadow stacks are enabled for linux kernel, it must
be enabled as early as possible for better coverage and prevent imbalance
between regular stack and shadow stack. After `relocate_enable_mmu` has
been done, this is as early as possible it can enabled.

Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/kernel/asm-offsets.c |  4 ++++
 arch/riscv/kernel/head.S        | 12 ++++++++++++
 2 files changed, 16 insertions(+)

diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index 766bd33f10cb..a22ab8a41672 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -517,4 +517,8 @@ void asm_offsets(void)
 	DEFINE(FREGS_A6,	    offsetof(struct ftrace_regs, a6));
 	DEFINE(FREGS_A7,	    offsetof(struct ftrace_regs, a7));
 #endif
+	DEFINE(SBI_EXT_FWFT, SBI_EXT_FWFT);
+	DEFINE(SBI_EXT_FWFT_SET, SBI_EXT_FWFT_SET);
+	DEFINE(SBI_FWFT_SHADOW_STACK, SBI_FWFT_SHADOW_STACK);
+	DEFINE(SBI_FWFT_SET_FLAG_LOCK, SBI_FWFT_SET_FLAG_LOCK);
 }
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 356d5397b2a2..6244408ca917 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -164,6 +164,12 @@ secondary_start_sbi:
 	call relocate_enable_mmu
 #endif
 	call .Lsetup_trap_vector
+	li a7, SBI_EXT_FWFT
+	li a6, SBI_EXT_FWFT_SET
+	li a0, SBI_FWFT_SHADOW_STACK
+	li a1, 1 /* enable supervisor to access shadow stack access */
+	li a2, SBI_FWFT_SET_FLAG_LOCK
+	ecall
 	scs_load_current
 	call smp_callin
 #endif /* CONFIG_SMP */
@@ -320,6 +326,12 @@ SYM_CODE_START(_start_kernel)
 	la tp, init_task
 	la sp, init_thread_union + THREAD_SIZE
 	addi sp, sp, -PT_SIZE_ON_STACK
+	li a7, SBI_EXT_FWFT
+	li a6, SBI_EXT_FWFT_SET
+	li a0, SBI_FWFT_SHADOW_STACK
+	li a1, 1 /* enable supervisor to access shadow stack access */
+	li a2, SBI_FWFT_SET_FLAG_LOCK
+	ecall
 	scs_load_current
 
 #ifdef CONFIG_KASAN

-- 
2.45.0

