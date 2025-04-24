Received: from mail-pl1-f173.google.com (mail-pl1-f173.google.com [209.85.214.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 42069229B16
	for <linux-doc@vger.kernel.org>; Thu, 24 Apr 2025 07:21:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745479301; cv=none; b=tCLdTM/Wb4Wo1KIyROOo9ch2HaNtH1rZetoLu9UwanJrDI5aXfZZTPIRM/0PvQrNCrTJUX1dxnAdmYh73EcJUcoLhn77qeqjI0RzRNMIUMrWFMRyS5dtsldTAyjoOylntw+kgo/nUgmYrgTdfJie4nmLJe3CW/dK0BFMTbh/qKk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745479301; c=relaxed/simple;
	bh=MwtlwJBNUHFndna04P1tlZjfQuYyDCB9oWGnKPvf18Q=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=dZDB+zV7jo23wThFyohwTDj0DCUuwBOALMDXkXLnSNQzowMpCMG/KPnTzp/iEej/pJKjYubwiRJk26tkJNX+4M2fBIJ5eQav8lZgMjNEIm115s10OkV8yCBkAAPYi0BoK5/KI4WlvwrmC4BE8emTQlFmkTDReqW2K9F0qZMMIgo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b=n6JlNIZM; arc=none smtp.client-ip=209.85.214.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc-com.20230601.gappssmtp.com header.i=@rivosinc-com.20230601.gappssmtp.com header.b="n6JlNIZM"
Received: by mail-pl1-f173.google.com with SMTP id d9443c01a7336-2295d78b433so7001335ad.2
        for <linux-doc@vger.kernel.org>; Thu, 24 Apr 2025 00:21:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20230601.gappssmtp.com; s=20230601; t=1745479298; x=1746084098; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cFz+/4buGG21gqDMlIHIpI2LyTeJMnqyc0qHyBDGzIU=;
        b=n6JlNIZMFkBAQsFPTPLa5Yv/BnVlaEtPh25DsHByIMDVdNPNen5hp0R6MqAkZH4WWU
         nPCffgCi9lkyDn25HLe6Wdnu4633O8M1m8tzJ//yGoewzKEVttMr6XZD076KWt+017vl
         0/DFujBzTC6k6nYZfHqgbeqTvo+7PrM2Co6MbU0fJmr/6lkTFAf1oLO47zrwMl+aNyZs
         G5RFyDpQw+t7X8y6/yZr+HN2yellrIU5TCGcGbh2b2lauMtDjFJrkTjBGrWWbmWslLwL
         6aFiG5AJ7cDX2d+Zd/cLB1vkyU2NXEF34cKrpVxvNHCEqqBE2TEQkJx+cCh5fTkTiF2t
         7d3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745479298; x=1746084098;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cFz+/4buGG21gqDMlIHIpI2LyTeJMnqyc0qHyBDGzIU=;
        b=b3aR+mOW0XTOYBgTNwAB33qs1AcKqcyr2Z8aC4xYHs0ihyqs+xki9a+QiUuOt2v1bu
         amqdZ4cjuOuItvPU4VwPosla5NjZyzobauw7eK+f9burXJNnh8iz/CtpYDxkIl9rCuZv
         Xfb/r+Bf84MCwXuHD60ikCSzRF5QcFdUXQwfjE8Vxk3QBEtPARv/gJZbjS9SE26craNK
         QHoo+8HGqedkeSqgPxRoQ2gw7ZD4jFrg0kP2JDEaqXtuIgnahkaldV3nbqbZYV1zxQ9x
         bHFTdUjdvNGB9zIWdFngmlTvqjTwQqNEOaq/KyEFK736QNXmiZMLcVVZazak1Nv2OSkE
         zB+g==
X-Forwarded-Encrypted: i=1; AJvYcCXruwRokXvxzxWS68g23WwsuZGeYab6+inXdh7BMC/vX9NE3Cv6hN9WnNCBMEzodkQ88FNfwER3iVg=@vger.kernel.org
X-Gm-Message-State: AOJu0YxaWdf3ySMt7sZ4wBVsLoAyHJa8ZAuvQDTUkvoheB5iZoyWkzQD
	XTKzJNHGZ6gjqPT6j3NtU2LGn1oy6Mg+to1lJ6L7ltJTzOuppgHmQenKPh40Qk4=
X-Gm-Gg: ASbGncs1/F5SpONYx1mC0VeDWHe/ojm8BjOjeOjB98A9F7ziZ25ZABulBsd6Wq+ZfQn
	sscpvwN8gCJdcxUgacpLd/2c1KnTTl+WrMZRZN5ZPPg4xyCtTt+896CL4eRoXUQTiho3lhaNXUX
	KT6xevaTJgp0ztVxrgSP2WSGA8fGX65zdisQiTuYiVgyhrRSrreuPV+kVu3UWX/cbHoytBkmOFX
	01c+iwlKgoA4EHAqE6lCNVnO1O3bK7AE0gCGHZ4GdK3/am3mAK2zjSrogP/WzgRVn7AXK4oWPhG
	sYFf1sqRe4p7QgeWKWmHW3M+Ega7zgbxUWcVphg1rb2jtq4GWqg=
X-Google-Smtp-Source: AGHT+IEO8Xd4tVdyUa9PjnzD8nPNNIzaFyukV8ZkIipYXkGmr/TGbVqh3iRHaB96zvxslBoo9AWYIQ==
X-Received: by 2002:a17:902:e74c:b0:22d:b240:34c9 with SMTP id d9443c01a7336-22db3dc845cmr26466965ad.53.1745479298272;
        Thu, 24 Apr 2025 00:21:38 -0700 (PDT)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-22db52163d6sm6240765ad.214.2025.04.24.00.21.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 24 Apr 2025 00:21:37 -0700 (PDT)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 24 Apr 2025 00:20:38 -0700
Subject: [PATCH v13 23/28] riscv: enable kernel access to shadow stack
 memory via FWFT sbi call
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250424-v5_user_cfi_series-v13-23-971437de586a@rivosinc.com>
References: <20250424-v5_user_cfi_series-v13-0-971437de586a@rivosinc.com>
In-Reply-To: <20250424-v5_user_cfi_series-v13-0-971437de586a@rivosinc.com>
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
 Benno Lossin <benno.lossin@proton.me>, 
 Andreas Hindborg <a.hindborg@kernel.org>, Alice Ryhl <aliceryhl@google.com>, 
 Trevor Gross <tmgross@umich.edu>
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
 arch/riscv/kernel/asm-offsets.c |  4 ++++
 arch/riscv/kernel/head.S        | 23 +++++++++++++++++++++++
 2 files changed, 27 insertions(+)

diff --git a/arch/riscv/kernel/asm-offsets.c b/arch/riscv/kernel/asm-offsets.c
index 0c188aaf3925..21f99d5757b6 100644
--- a/arch/riscv/kernel/asm-offsets.c
+++ b/arch/riscv/kernel/asm-offsets.c
@@ -515,4 +515,8 @@ void asm_offsets(void)
 	DEFINE(FREGS_A6,	    offsetof(struct __arch_ftrace_regs, a6));
 	DEFINE(FREGS_A7,	    offsetof(struct __arch_ftrace_regs, a7));
 #endif
+	DEFINE(SBI_EXT_FWFT, SBI_EXT_FWFT);
+	DEFINE(SBI_EXT_FWFT_SET, SBI_EXT_FWFT_SET);
+	DEFINE(SBI_FWFT_SHADOW_STACK, SBI_FWFT_SHADOW_STACK);
+	DEFINE(SBI_FWFT_SET_FLAG_LOCK, SBI_FWFT_SET_FLAG_LOCK);
 }
diff --git a/arch/riscv/kernel/head.S b/arch/riscv/kernel/head.S
index 356d5397b2a2..d47876eca637 100644
--- a/arch/riscv/kernel/head.S
+++ b/arch/riscv/kernel/head.S
@@ -15,6 +15,7 @@
 #include <asm/image.h>
 #include <asm/scs.h>
 #include <asm/xip_fixup.h>
+#include <asm/usercfi.h>
 #include "efi-header.S"
 
 __HEAD
@@ -164,6 +165,17 @@ secondary_start_sbi:
 	call relocate_enable_mmu
 #endif
 	call .Lsetup_trap_vector
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
 	scs_load_current
 	call smp_callin
 #endif /* CONFIG_SMP */
@@ -320,6 +332,17 @@ SYM_CODE_START(_start_kernel)
 	la tp, init_task
 	la sp, init_thread_union + THREAD_SIZE
 	addi sp, sp, -PT_SIZE_ON_STACK
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
 	scs_load_current
 
 #ifdef CONFIG_KASAN

-- 
2.43.0

