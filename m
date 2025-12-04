Received: from mail-pl1-f174.google.com (mail-pl1-f174.google.com [209.85.214.174])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0089F34DCE7
	for <linux-doc@vger.kernel.org>; Thu,  4 Dec 2025 20:04:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.174
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1764878675; cv=none; b=L+4oPZ+FltUcaKcmDAGQHsCt+/Zjetv6KMzjMYjFvbZOM/Yb2iu/ARktK4SucQHFIQU3L4S4nscsjLfTD0nGRcrvvqoVtjghM1CrsiXEMrXu8BTMf+omhsnQ1SaA8pFvCvAv3NpH2t6GZjIVHN1zFhzaFUKMI2mCSoeVCHTydv4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1764878675; c=relaxed/simple;
	bh=TXKZlJ3jSYM/MfSFEFzUAEcoqyLgBWawjPARhtXC+wc=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=sVb/Y7b8AJpefBM5X7bhBxHGixfZkwgnd8286jipt4S76r2uNu2BQNCcau9d8riFWFuw7NiOPuJJr/nFM0OScqEU9rkYxI9KM3yI+2Y6TC25xl6kFPZsFY5eJ4tS/ZaQjVdOjT6jmVln4pO3YVhcvFX//RkYWq8qhRaFf7m2Qr8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com; spf=pass smtp.mailfrom=rivosinc.com; dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b=GDjoP2yk; arc=none smtp.client-ip=209.85.214.174
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=rivosinc.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=rivosinc.com header.i=@rivosinc.com header.b="GDjoP2yk"
Received: by mail-pl1-f174.google.com with SMTP id d9443c01a7336-29806bd47b5so8334885ad.3
        for <linux-doc@vger.kernel.org>; Thu, 04 Dec 2025 12:04:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc.com; s=google; t=1764878669; x=1765483469; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qkB1OBwYWJndx0ys60aTo8BN+99UJkZg6h3GpJG4ezg=;
        b=GDjoP2ykYDht8uqt4fuXZq3tkeQYOX87A0ph9G9P5JTo/K3WUNoj/huAGyksIWC6VM
         qXOZJvq/ZO4PJi/YBF1UER9Vh51vQ6jf28VvyzEYpU2h30n2gWInOOgyEsWATmAz7iZS
         WVryTnboyGsRG5RXdfX/oA0gbUsSjyjJ0tT/sGUdMgUpUU+2ClJOkbln7Yt3jvzUY6DL
         qO0PAAlu/zstw/4dg8TgWlaWbVNOGi03cT9xO/8HfEvHKxL48kQbKiuVlHv92yvZ3Ppu
         L1mm/rVJ+UX+V1oPR7vO/hS7mQ01hDB/qt6DgMHbv0IlxuFZvCCaw8wWOqUCtQ7/Bd8b
         mnRQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764878669; x=1765483469;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=qkB1OBwYWJndx0ys60aTo8BN+99UJkZg6h3GpJG4ezg=;
        b=ufazZKZ9BiUJXnKlFAhvn5UWc/RKa6irR8Atmpgv/93Xg+v5Ho7l8DAiPuNAWEwo8y
         x8TgDjpf5X91p5qISTJ1mWZ9Rvxh2Ly3xD6y92sffunFheDoZ7hDvkFID5uW+K2NY+GM
         POJFUEs1sVQbdbeitzm5RHZOV8+3oas5lzKctSTLnlbfixCA7HUUsDIY0IcyJZ4xhGx0
         PbHr7i6unKEAtrG7AR0E6PVFdKDDrwRF4Le2qdKd/VZ7PP9Rm1NaC6SiEfBT5hxyPuXU
         vq57avwmgjEbIpd83H1P0FqVrQsnv1w6bnJ2Mc39yK4EsBC36S0ByXltyNvuKnYwgLbR
         noZw==
X-Forwarded-Encrypted: i=1; AJvYcCW+nvoUMzMyK6/FiLfVQn7aGjwG9PO4Pk++FIUu41xB0OijmSG+ifHF4iJT62xfhA6NTLcAEtkkA7I=@vger.kernel.org
X-Gm-Message-State: AOJu0YxbRuylzEWC+pPsbs3+NDqDOA/i/jcH4p1QB6YU9WFB7TL95eIS
	jtzY/WgEX3Pix7ZNxfs1MktMKstB4d3yE+225khaUQ/wqEPKteG2aOmFLEqLjeYhHog=
X-Gm-Gg: ASbGncukRgbSeLXAyKXofJjSBTskKdYpV1V2uTjIwCnn0R/Hk1ex5WKEls6RClWQkCZ
	cQNordEvLroSemp5M63nwz7k6uvB5QUR3Y47A8vlD+B8gTNcNeSzxDY4ECMw6K2BMk9rMJb20QI
	zawtXALA7k/codGM5Zkj6lwhAd2urvs/1/ONM3FE2BwEvkJFLzb2d1/0opKrjc0Zm4d3pnp0AHp
	Eoq1F/IpCvZaKj/o+JKcy6C2w/XJHJZzy6AyJ3Dd3mYD4O2Lc1mG127kP6xthkMeuyTmavPO9xl
	WFL4t1i+dsgLpaM7b0nxPDNR0u9cK7wSvY83asVmmXWORwdWfFVD3HaXt8iq0QXHEHFtWisZfg0
	9uHisnQeOrMF1wLt6gbbw+dfwKOgKW6dR/5TDYOSTc4exmW9DK2e2jvIhV0Tf5nDQSO3QjVCtVc
	4QPJwOYRQr9Cx3A07Jsjw0
X-Google-Smtp-Source: AGHT+IHPx7V3oyF9894ZTzaeXu1IYdL7MnhPw9p6Pze6D3DEKLTqry4qdsiaQ056IInDpLwSf3YZtg==
X-Received: by 2002:a05:7022:101:b0:11b:9386:825b with SMTP id a92af1059eb24-11df0c4a9aemr5955049c88.48.1764878668954;
        Thu, 04 Dec 2025 12:04:28 -0800 (PST)
Received: from debug.ba.rivosinc.com ([64.71.180.162])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-11df76e2eefsm10417454c88.6.2025.12.04.12.04.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 04 Dec 2025 12:04:28 -0800 (PST)
From: Deepak Gupta <debug@rivosinc.com>
Date: Thu, 04 Dec 2025 12:04:04 -0800
Subject: [PATCH v24 15/28] riscv/traps: Introduce software check exception
 and uprobe handling
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20251204-v5_user_cfi_series-v24-15-ada7a3ba14dc@rivosinc.com>
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
X-Developer-Signature: v=1; a=ed25519-sha256; t=1764878636; l=5652;
 i=debug@rivosinc.com; s=20251023; h=from:subject:message-id;
 bh=TXKZlJ3jSYM/MfSFEFzUAEcoqyLgBWawjPARhtXC+wc=;
 b=2MdUL9dDxsTYXvbWgWD4UKRZ4Xhy/CtmCZPNxXxp0jork024MsfpZe5j9KF0iAs6+4kwtmUOS
 tqefTpptf2vC2VK12ioYc8+5z27ZylQ31H0jQa1yY0ol5K5E3amAUs0
X-Developer-Key: i=debug@rivosinc.com; a=ed25519;
 pk=O37GQv1thBhZToXyQKdecPDhtWVbEDRQ0RIndijvpjk=

zicfiss / zicfilp introduces a new exception to priv isa `software check
exception` with cause code = 18. This patch implements software check
exception.

Additionally it implements a cfi violation handler which checks for code
in xtval. If xtval=2, it means that sw check exception happened because of
an indirect branch not landing on 4 byte aligned PC or not landing on
`lpad` instruction or label value embedded in `lpad` not matching label
value setup in `x7`. If xtval=3, it means that sw check exception happened
because of mismatch between link register (x1 or x5) and top of shadow
stack (on execution of `sspopchk`).

In case of cfi violation, SIGSEGV is raised with code=SEGV_CPERR.
SEGV_CPERR was introduced by x86 shadow stack patches.

To keep uprobes working, handle the uprobe event first before reporting
the CFI violation in software-check exception handler. Because when the
landing pad is activated, if the uprobe point is set at the lpad
instruction at the beginning of a function, the system triggers a software
-check exception instead of an ebreak exception due to the exception
priority, then uprobe can't work successfully.

Co-developed-by: Zong Li <zong.li@sifive.com>
Reviewed-by: Zong Li <zong.li@sifive.com>
Signed-off-by: Zong Li <zong.li@sifive.com>
Tested-by: Andreas Korb <andreas.korb@aisec.fraunhofer.de>
Tested-by: Valentin Haudiquet <valentin.haudiquet@canonical.com>
Signed-off-by: Deepak Gupta <debug@rivosinc.com>
---
 arch/riscv/include/asm/asm-prototypes.h |  1 +
 arch/riscv/include/asm/entry-common.h   |  2 ++
 arch/riscv/kernel/entry.S               |  3 ++
 arch/riscv/kernel/traps.c               | 54 +++++++++++++++++++++++++++++++++
 4 files changed, 60 insertions(+)

diff --git a/arch/riscv/include/asm/asm-prototypes.h b/arch/riscv/include/asm/asm-prototypes.h
index a9988bf21ec8..41ec5cdec367 100644
--- a/arch/riscv/include/asm/asm-prototypes.h
+++ b/arch/riscv/include/asm/asm-prototypes.h
@@ -51,6 +51,7 @@ DECLARE_DO_ERROR_INFO(do_trap_ecall_u);
 DECLARE_DO_ERROR_INFO(do_trap_ecall_s);
 DECLARE_DO_ERROR_INFO(do_trap_ecall_m);
 DECLARE_DO_ERROR_INFO(do_trap_break);
+DECLARE_DO_ERROR_INFO(do_trap_software_check);
 
 asmlinkage void ret_from_fork_kernel(void *fn_arg, int (*fn)(void *), struct pt_regs *regs);
 asmlinkage void ret_from_fork_user(struct pt_regs *regs);
diff --git a/arch/riscv/include/asm/entry-common.h b/arch/riscv/include/asm/entry-common.h
index b28ccc6cdeea..34ed149af5d1 100644
--- a/arch/riscv/include/asm/entry-common.h
+++ b/arch/riscv/include/asm/entry-common.h
@@ -40,4 +40,6 @@ static inline int handle_misaligned_store(struct pt_regs *regs)
 }
 #endif
 
+bool handle_user_cfi_violation(struct pt_regs *regs);
+
 #endif /* _ASM_RISCV_ENTRY_COMMON_H */
diff --git a/arch/riscv/kernel/entry.S b/arch/riscv/kernel/entry.S
index 036a6ca7641f..53c5aa0b6a16 100644
--- a/arch/riscv/kernel/entry.S
+++ b/arch/riscv/kernel/entry.S
@@ -495,6 +495,9 @@ SYM_DATA_START_LOCAL(excp_vect_table)
 	RISCV_PTR do_page_fault   /* load page fault */
 	RISCV_PTR do_trap_unknown
 	RISCV_PTR do_page_fault   /* store page fault */
+	RISCV_PTR do_trap_unknown /* cause=16 */
+	RISCV_PTR do_trap_unknown /* cause=17 */
+	RISCV_PTR do_trap_software_check /* cause=18 is sw check exception */
 SYM_DATA_END_LABEL(excp_vect_table, SYM_L_LOCAL, excp_vect_table_end)
 
 #ifndef CONFIG_MMU
diff --git a/arch/riscv/kernel/traps.c b/arch/riscv/kernel/traps.c
index 80230de167de..d939a8dbdb15 100644
--- a/arch/riscv/kernel/traps.c
+++ b/arch/riscv/kernel/traps.c
@@ -366,6 +366,60 @@ void do_trap_ecall_u(struct pt_regs *regs)
 
 }
 
+#define CFI_TVAL_FCFI_CODE	2
+#define CFI_TVAL_BCFI_CODE	3
+/* handle cfi violations */
+bool handle_user_cfi_violation(struct pt_regs *regs)
+{
+	unsigned long tval = csr_read(CSR_TVAL);
+	bool is_fcfi = (tval == CFI_TVAL_FCFI_CODE && cpu_supports_indirect_br_lp_instr());
+	bool is_bcfi = (tval == CFI_TVAL_BCFI_CODE && cpu_supports_shadow_stack());
+
+	/*
+	 * Handle uprobe event first. The probe point can be a valid target
+	 * of indirect jumps or calls, in this case, forward cfi violation
+	 * will be triggered instead of breakpoint exception. Clear ELP flag
+	 * on sstatus image as well to avoid recurring fault.
+	 */
+	if (is_fcfi && probe_breakpoint_handler(regs)) {
+		regs->status &= ~SR_ELP;
+		return true;
+	}
+
+	if (is_fcfi || is_bcfi) {
+		do_trap_error(regs, SIGSEGV, SEGV_CPERR, regs->epc,
+			      "Oops - control flow violation");
+		return true;
+	}
+
+	return false;
+}
+
+/*
+ * software check exception is defined with risc-v cfi spec. Software check
+ * exception is raised when:-
+ * a) An indirect branch doesn't land on 4 byte aligned PC or `lpad`
+ *    instruction or `label` value programmed in `lpad` instr doesn't
+ *    match with value setup in `x7`. reported code in `xtval` is 2.
+ * b) `sspopchk` instruction finds a mismatch between top of shadow stack (ssp)
+ *    and x1/x5. reported code in `xtval` is 3.
+ */
+asmlinkage __visible __trap_section void do_trap_software_check(struct pt_regs *regs)
+{
+	if (user_mode(regs)) {
+		irqentry_enter_from_user_mode(regs);
+
+		/* not a cfi violation, then merge into flow of unknown trap handler */
+		if (!handle_user_cfi_violation(regs))
+			do_trap_unknown(regs);
+
+		irqentry_exit_to_user_mode(regs);
+	} else {
+		/* sw check exception coming from kernel is a bug in kernel */
+		die(regs, "Kernel BUG");
+	}
+}
+
 #ifdef CONFIG_MMU
 asmlinkage __visible noinstr void do_page_fault(struct pt_regs *regs)
 {

-- 
2.45.0

