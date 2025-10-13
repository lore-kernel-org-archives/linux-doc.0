Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DC53C2FD1DD
	for <linux-doc@vger.kernel.org>; Mon, 13 Oct 2025 21:56:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760392611; cv=none; b=FJgocdkKOOC7pp/lh/t/09UD2mlLK3Dbo0z1GxZKatUzkJEYyS57J0R/sT8q2CD0WyRaGIhfN4T7LQIEmrZCVSXQBbNI/fd3tihEWD8g8g51UeypW3KhU+Nnvv9Lw4lkhqSjOr+6BHxqavQYY+M7qiGuQG0+0kNtRdlgNPy1C1E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760392611; c=relaxed/simple;
	bh=6jhZAX7qSjG5giCOVCgCSSpmySXxQ3X5SeSFJU/GKzQ=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cj2ssxBqbAiesX2leRuD/PU8VLpIG7MGiqfVM82zRzJegYjQIc60elCypHcjBhTm+US/8KHgXLuINh6X9Tm0Po5i+1L/9OvAOtxNsVhfaNZPGM3wgccxuFX3XmC8zULpVkO6DQXCMzjkHl4TaBId3gUy0xjGlI/uHPTmPtBayUk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b=PQgojkNO; arc=none smtp.client-ip=209.85.216.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b="PQgojkNO"
Received: by mail-pj1-f46.google.com with SMTP id 98e67ed59e1d1-33067909400so3451424a91.2
        for <linux-doc@vger.kernel.org>; Mon, 13 Oct 2025 14:56:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1760392608; x=1760997408; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=bdNStz76VWOE6F3y+SVDIONwXTUEF86LLBNXBRlWzEc=;
        b=PQgojkNOS7mh97U46n3nAkl9Kt6Z6dAzgJvnxQgqC6VewBDwHGVGRiI5MbikCnfaIE
         97Vf//SzIkTEPZQW0xXLEocY5S5ffd2jTPW3khZ9YXYGaqIYQS/B+qKN53zoANJ1g2fZ
         JUxl6AoM2tq5IUjj5zQYxx4yM7dw67zmyWbQcu/oehSD5VuJt0sheucRMSV8tx5clLVw
         bTkXMB6TkhVvUQkN7olY/3YV5E0PGMiw5qvqZeZkEB9he8BiwNDfDNlUa2fSodrQwxzD
         grMPwfK/xWYmq1tSl52KudzaHzfjlnboD2FHmXW4Q/rTOB3bAAA02XrNx3G4Ut+68kzh
         tGkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1760392608; x=1760997408;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=bdNStz76VWOE6F3y+SVDIONwXTUEF86LLBNXBRlWzEc=;
        b=rBSbFIof38ISEbG3Y3rztembTQOmfGk0mYM51++0VxrITHJUgZPfJcIND8mBCECgmw
         /2fWTIZDjqUxFsl2PwQrvUj5dLbiWOqpPa2ikAe2qMgksLlAggtmaUT0b6qPYTTDUlKN
         Ztb3JxfQzAbgdwQJ4vn3zZ6QfhzDDSxg6h+9p5azmQBa4V+u9gytbowjxLvErod49Jcv
         LGJgyQvu/muWrqQgPMV8js5S7YtTYbb0dta7fpsfkeKd07kp6kMBa9kXECwZwkvU/UuQ
         quVgD+6BwkbZPd1ryw/jQhSMlxr0WIjN8HXQofs+cQ6Km1O0ZWW44bG5t85tPWviBzM/
         H47w==
X-Forwarded-Encrypted: i=1; AJvYcCXQ4UBUhZimEtvCXokkW0bZJvJIBeGztbHb01tO3aNN9BXl27yZQCLonbplJzIfzZ0PKdSXcbSh6Z8=@vger.kernel.org
X-Gm-Message-State: AOJu0YwAkQHYCLfEmQ6Gu6F9CzIiuK/EkUweK8sr5Z70DhXcGAE2VpXG
	aGYQcJB2TZwOQ3hwW3tpR4aygVG2OqC07fL3rHca4dmUveGlH/ZTdlkjidPfpC8zB5I=
X-Gm-Gg: ASbGnctOvQ+XZQ0MS6FutgtpGm0AWtErLZyKKvBw0mAToykSHVRDNLs0OO4E9Hc3wId
	vtirsmlKu+CI2CUys9PbW0kRlYWFBgbyUP9dq8lrikwbSm1l06ODc9qgBmnIEh7GnP+GjQVPK7Z
	apKkbaJh3GpBNG/zw/O0rOt17cf3gqOZn18BgowJ6Q+UoyueKMxWX32V5L4IFjPhTiWZJ3vJj+a
	yn3jwJZnAh9nBlbI0Efnnx0PM146rrtqg0UiMUDrBCQGMKSv2opu1i2qFva+F+XFFEHB2O4/Jwc
	YYcNunOUZU0oq1lf0nRRLHY8sCnDMMrREhAWTd6RPnns6zYEZ9YabyJ+3NnlYUeXQpo2UBxguf5
	x9v9pp+1BA5Rson78XIXA9EpddcYrjwAh96KRMhPoeoSWxJfgeKPc44KC3CdQBw==
X-Google-Smtp-Source: AGHT+IEpDqoontntF3sIrR5a3fhwgo8215k0m01p1A4l+Szf/Qfs7CCjIFRuTV7hnhhmb/2mstaCGw==
X-Received: by 2002:a17:90b:4d06:b0:32c:2cd:4d67 with SMTP id 98e67ed59e1d1-33b511188dcmr28426761a91.13.1760392607917;
        Mon, 13 Oct 2025 14:56:47 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-33b626bb49esm13143212a91.12.2025.10.13.14.56.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Oct 2025 14:56:47 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Mon, 13 Oct 2025 14:56:14 -0700
Subject: [PATCH v20 22/28] riscv: enable kernel access to shadow stack
 memory via FWFT sbi call
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251013-v5_user_cfi_series-v20-22-b9de4be9912e@rivosinc.com>
References: <20251013-v5_user_cfi_series-v20-0-b9de4be9912e@rivosinc.com>
In-Reply-To: <20251013-v5_user_cfi_series-v20-0-b9de4be9912e@rivosinc.com>
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

Kernel will have to perform shadow stack operations on user shadow stack.
Like during signal delivery and sigreturn, shadow stack token must be
created and validated respectively. Thus shadow stack access for kernel
must be enabled.

In future when kernel shadow stacks are enabled for linux kernel, it must
be enabled as early as possible for better coverage and prevent imbalance
between regular stack and shadow stack. After `relocate_enable_mmu` has
been done, this is as early as possible it can enabled.

Reviewed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/kernel/asm-offsets.c |  6 ++++++
 arch/riscv/kernel/head.S        | 27 +++++++++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index 8a2b2656cb2f..af827448a609 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -533,4 +533,10 @@ void asm_offsets(void)
 	DEFINE(FREGS_A6,	    offsetof(struct __arch_ftrace_regs, a6));
 	DEFINE(FREGS_A7,	    offsetof(struct __arch_ftrace_regs, a7));
 #endif
+#ifdef CONFIG_RISCV_SBI
+	DEFINE(SBI_EXT_FWFT, SBI_EXT_FWFT);
+	DEFINE(SBI_EXT_FWFT_SET, SBI_EXT_FWFT_SET);
+	DEFINE(SBI_FWFT_SHADOW_STACK, SBI_FWFT_SHADOW_STACK);
+	DEFINE(SBI_FWFT_SET_FLAG_LOCK, SBI_FWFT_SET_FLAG_LOCK);
+#endif
 }
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index bdf3352acf4c..9c99c5ad6fe8 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -15,6 +15,7 @@
 #include <asm/image.h>
 #include <asm/scs.h>
 #include <asm/xip_fixup.h>
+#include <asm/usercfi.h>
 #include "efi-header.S"
 
 __HEAD
@@ -170,6 +171,19 @@ secondary_start_sbi:
 	call relocate_enable_mmu
 #endif
 	call .Lsetup_trap_vector
+#if defined(CONFIG_RISCV_SBI) && defined(CONFIG_RISCV_USER_CFI)
+	li a7, SBI_EXT_FWFT
+	li a6, SBI_EXT_FWFT_SET
+	li a0, SBI_FWFT_SHADOW_STACK
+	li a1, 1 /* enable supervisor to access shadow stack access */
+	li a2, SBI_FWFT_SET_FLAG_LOCK
+	ecall
+	beqz a0, 1f
+	la a1, riscv_nousercfi
+	li a0, CMDLINE_DISABLE_RISCV_USERCFI_BCFI
+	REG_S a0, (a1)
+1:
+#endif
 	scs_load_current
 	call smp_callin
 #endif /* CONFIG_SMP */
@@ -330,6 +344,19 @@ SYM_CODE_START(_start_kernel)
 	la tp, init_task
 	la sp, init_thread_union + THREAD_SIZE
 	addi sp, sp, -PT_SIZE_ON_STACK
+#if defined(CONFIG_RISCV_SBI) && defined(CONFIG_RISCV_USER_CFI)
+	li a7, SBI_EXT_FWFT
+	li a6, SBI_EXT_FWFT_SET
+	li a0, SBI_FWFT_SHADOW_STACK
+	li a1, 1 /* enable supervisor to access shadow stack access */
+	li a2, SBI_FWFT_SET_FLAG_LOCK
+	ecall
+	beqz a0, 1f
+	la a1, riscv_nousercfi
+	li a0, CMDLINE_DISABLE_RISCV_USERCFI_BCFI
+	REG_S a0, (a1)
+1:
+#endif
 	scs_load_current
 
 #ifdef CONFIG_KASAN

-- 
2.43.0

