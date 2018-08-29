Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.4 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,T_DKIMWL_WL_MED,USER_IN_DEF_DKIM_WL autolearn=ham
	autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EBD657D581
	for <lwn-linux-doc@archive.lwn.net>; Wed, 29 Aug 2018 11:35:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728678AbeH2PcX (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 29 Aug 2018 11:32:23 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:41629 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728658AbeH2PcW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 29 Aug 2018 11:32:22 -0400
Received: by mail-wr1-f66.google.com with SMTP id z96-v6so4494035wrb.8
        for <linux-doc@vger.kernel.org>; Wed, 29 Aug 2018 04:35:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CCBGVbMzHdvCWnsB/Yhk2lUOwxfWB4ZppCmhRRUM9JA=;
        b=P+4HLBVNOxPKN9sWnmTedOcFE/v3k7mqmCD4VSAgFSMl7of3OTjZlSlH3AnkitKzKX
         JAU41HXyYVWcUHQAIswpIi1IcmwpgAEdWg2AJBHPz3piJeWXckqIhM5+FxSDEMK4gYbP
         Jqhj6ue6k2WMJZrncYGU96Fx+RXGfhyWuPXz0Oe8l7GHkmQnmvh5ZRx9KTsdzO65tUQg
         bqgezWXIEtPPcAp9SKFZNI8q8MTba6UZXLfbPIDXEr23IYXon4oTWUDX/O78Yt1INXVl
         fKdJjPeFsXUUxxufErLlE5iMPDNfHZtEA3hpjNEMu12w1uep9wsis+IuSqkZ7PZamP9M
         J8PA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CCBGVbMzHdvCWnsB/Yhk2lUOwxfWB4ZppCmhRRUM9JA=;
        b=fDg3E05JG8U3T1pGwiOHny4iR/zXeu0RRFRfV8vNdMl/d0pJf5D7pUFsr6TZ91MGER
         YAHJF24vZjxC0UCroeaxoD29gyQtBM/hjHP/ycTsjWkTODT93mBSZNXkR5WPQzULchg+
         Fc+sOgV/fJe6vYNjBBdBliuxbCn5o82ie5/wPUTjDxmxiGoWmZ0a7DDw+Bbs1Y1R5Gmt
         4DOpI0dI5ZP4aDmnmt4pVngDqKN+xfDDKIW0xp7CY6ORPOF67gLHq3b3AvmCCAbIIUUm
         /oweSZkF0HIyvD0EgBVaOAWIw4xsKvy/PSRGOwaxpPNQpGj6r1FP6BK2rdoYGMvDn2BR
         wGwQ==
X-Gm-Message-State: APzg51A9Dry0Xk4zvBGhIK7q/A+HSDacE+t6QfXKYfOZLr5ulD2rqTxm
        TVsg870j36sDFbAl96YtnVVjkg==
X-Google-Smtp-Source: ANB0VdY7wAqGQmJ0i2uIa33LwCvnvSHs2CfWQfVuo6/YpmsR4i13uiWmzLzd40PO+KO2QnZtwWBklw==
X-Received: by 2002:a5d:4648:: with SMTP id j8-v6mr3974471wrs.52.1535542552181;
        Wed, 29 Aug 2018 04:35:52 -0700 (PDT)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:84be:a42a:826d:c530])
        by smtp.gmail.com with ESMTPSA id s10-v6sm7800454wmd.22.2018.08.29.04.35.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 29 Aug 2018 04:35:51 -0700 (PDT)
From:   Andrey Konovalov <andreyknvl@google.com>
To:     Andrey Ryabinin <aryabinin@virtuozzo.com>,
        Alexander Potapenko <glider@google.com>,
        Dmitry Vyukov <dvyukov@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Christoph Lameter <cl@linux.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Nick Desaulniers <ndesaulniers@google.com>,
        Marc Zyngier <marc.zyngier@arm.com>,
        Dave Martin <dave.martin@arm.com>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        "Eric W . Biederman" <ebiederm@xmission.com>,
        Ingo Molnar <mingo@kernel.org>,
        Paul Lawrence <paullawrence@google.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Arnd Bergmann <arnd@arndb.de>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Kate Stewart <kstewart@linuxfoundation.org>,
        Mike Rapoport <rppt@linux.vnet.ibm.com>,
        kasan-dev@googlegroups.com, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-sparse@vger.kernel.org, linux-mm@kvack.org,
        linux-kbuild@vger.kernel.org
Cc:     Kostya Serebryany <kcc@google.com>,
        Evgeniy Stepanov <eugenis@google.com>,
        Lee Smith <Lee.Smith@arm.com>,
        Ramana Radhakrishnan <Ramana.Radhakrishnan@arm.com>,
        Jacob Bramley <Jacob.Bramley@arm.com>,
        Ruben Ayrapetyan <Ruben.Ayrapetyan@arm.com>,
        Jann Horn <jannh@google.com>,
        Mark Brand <markbrand@google.com>,
        Chintan Pandya <cpandya@codeaurora.org>,
        Vishwath Mohan <vishwath@google.com>,
        Andrey Konovalov <andreyknvl@google.com>
Subject: [PATCH v6 15/18] khwasan, arm64: add brk handler for inline instrumentation
Date:   Wed, 29 Aug 2018 13:35:19 +0200
Message-Id: <f5e73b5ead3355932ad8b5fc96b141c3f5b8c16c.1535462971.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.19.0.rc0.228.g281dcd1b4d0-goog
In-Reply-To: <cover.1535462971.git.andreyknvl@google.com>
References: <cover.1535462971.git.andreyknvl@google.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

KHWASAN inline instrumentation mode (which embeds checks of shadow memory
into the generated code, instead of inserting a callback) generates a brk
instruction when a tag mismatch is detected.

This commit add a KHWASAN brk handler, that decodes the immediate value
passed to the brk instructions (to extract information about the memory
access that triggered the mismatch), reads the register values (x0 contains
the guilty address) and reports the bug.

Signed-off-by: Andrey Konovalov <andreyknvl@google.com>
---
 arch/arm64/include/asm/brk-imm.h |  2 +
 arch/arm64/kernel/traps.c        | 69 +++++++++++++++++++++++++++++++-
 2 files changed, 69 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/brk-imm.h b/arch/arm64/include/asm/brk-imm.h
index ed693c5bcec0..e4a7013321dc 100644
--- a/arch/arm64/include/asm/brk-imm.h
+++ b/arch/arm64/include/asm/brk-imm.h
@@ -16,10 +16,12 @@
  * 0x400: for dynamic BRK instruction
  * 0x401: for compile time BRK instruction
  * 0x800: kernel-mode BUG() and WARN() traps
+ * 0x9xx: KHWASAN trap (allowed values 0x900 - 0x9ff)
  */
 #define FAULT_BRK_IMM			0x100
 #define KGDB_DYN_DBG_BRK_IMM		0x400
 #define KGDB_COMPILED_DBG_BRK_IMM	0x401
 #define BUG_BRK_IMM			0x800
+#define KHWASAN_BRK_IMM			0x900
 
 #endif
diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
index 039e9ff379cc..fd70347d1ce7 100644
--- a/arch/arm64/kernel/traps.c
+++ b/arch/arm64/kernel/traps.c
@@ -35,6 +35,7 @@
 #include <linux/sizes.h>
 #include <linux/syscalls.h>
 #include <linux/mm_types.h>
+#include <linux/kasan.h>
 
 #include <asm/atomic.h>
 #include <asm/bug.h>
@@ -269,10 +270,14 @@ void arm64_notify_die(const char *str, struct pt_regs *regs,
 	}
 }
 
-void arm64_skip_faulting_instruction(struct pt_regs *regs, unsigned long size)
+void __arm64_skip_faulting_instruction(struct pt_regs *regs, unsigned long size)
 {
 	regs->pc += size;
+}
 
+void arm64_skip_faulting_instruction(struct pt_regs *regs, unsigned long size)
+{
+	__arm64_skip_faulting_instruction(regs, size);
 	/*
 	 * If we were single stepping, we want to get the step exception after
 	 * we return from the trap.
@@ -775,7 +780,7 @@ static int bug_handler(struct pt_regs *regs, unsigned int esr)
 	}
 
 	/* If thread survives, skip over the BUG instruction and continue: */
-	arm64_skip_faulting_instruction(regs, AARCH64_INSN_SIZE);
+	__arm64_skip_faulting_instruction(regs, AARCH64_INSN_SIZE);
 	return DBG_HOOK_HANDLED;
 }
 
@@ -785,6 +790,59 @@ static struct break_hook bug_break_hook = {
 	.fn = bug_handler,
 };
 
+#ifdef CONFIG_KASAN_HW
+
+#define KHWASAN_ESR_RECOVER	0x20
+#define KHWASAN_ESR_WRITE	0x10
+#define KHWASAN_ESR_SIZE_MASK	0x0f
+#define KHWASAN_ESR_SIZE(esr)	(1 << ((esr) & KHWASAN_ESR_SIZE_MASK))
+
+static int khwasan_handler(struct pt_regs *regs, unsigned int esr)
+{
+	bool recover = esr & KHWASAN_ESR_RECOVER;
+	bool write = esr & KHWASAN_ESR_WRITE;
+	size_t size = KHWASAN_ESR_SIZE(esr);
+	u64 addr = regs->regs[0];
+	u64 pc = regs->pc;
+
+	if (user_mode(regs))
+		return DBG_HOOK_ERROR;
+
+	kasan_report(addr, size, write, pc);
+
+	/*
+	 * The instrumentation allows to control whether we can proceed after
+	 * a crash was detected. This is done by passing the -recover flag to
+	 * the compiler. Disabling recovery allows to generate more compact
+	 * code.
+	 *
+	 * Unfortunately disabling recovery doesn't work for the kernel right
+	 * now. KHWASAN reporting is disabled in some contexts (for example when
+	 * the allocator accesses slab object metadata; same is true for KASAN;
+	 * this is controlled by current->kasan_depth). All these accesses are
+	 * detected by the tool, even though the reports for them are not
+	 * printed.
+	 *
+	 * This is something that might be fixed at some point in the future.
+	 */
+	if (!recover)
+		die("Oops - KHWASAN", regs, 0);
+
+	/* If thread survives, skip over the brk instruction and continue: */
+	__arm64_skip_faulting_instruction(regs, AARCH64_INSN_SIZE);
+	return DBG_HOOK_HANDLED;
+}
+
+#define KHWASAN_ESR_VAL (0xf2000000 | KHWASAN_BRK_IMM)
+#define KHWASAN_ESR_MASK 0xffffff00
+
+static struct break_hook khwasan_break_hook = {
+	.esr_val = KHWASAN_ESR_VAL,
+	.esr_mask = KHWASAN_ESR_MASK,
+	.fn = khwasan_handler,
+};
+#endif
+
 /*
  * Initial handler for AArch64 BRK exceptions
  * This handler only used until debug_traps_init().
@@ -792,6 +850,10 @@ static struct break_hook bug_break_hook = {
 int __init early_brk64(unsigned long addr, unsigned int esr,
 		struct pt_regs *regs)
 {
+#ifdef CONFIG_KASAN_HW
+	if ((esr & KHWASAN_ESR_MASK) == KHWASAN_ESR_VAL)
+		return khwasan_handler(regs, esr) != DBG_HOOK_HANDLED;
+#endif
 	return bug_handler(regs, esr) != DBG_HOOK_HANDLED;
 }
 
@@ -799,4 +861,7 @@ int __init early_brk64(unsigned long addr, unsigned int esr,
 void __init trap_init(void)
 {
 	register_break_hook(&bug_break_hook);
+#ifdef CONFIG_KASAN_HW
+	register_break_hook(&khwasan_break_hook);
+#endif
 }
-- 
2.19.0.rc0.228.g281dcd1b4d0-goog

