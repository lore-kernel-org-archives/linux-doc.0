Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.9 required=5.0 tests=DKIM_ADSP_CUSTOM_MED,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E4C337DE7C
	for <lwn-linux-doc@archive.lwn.net>; Thu,  9 Aug 2018 19:22:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727708AbeHIVrz (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 9 Aug 2018 17:47:55 -0400
Received: from mail-wr1-f66.google.com ([209.85.221.66]:39689 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726997AbeHIVrz (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 9 Aug 2018 17:47:55 -0400
Received: by mail-wr1-f66.google.com with SMTP id h10-v6so6084126wre.6
        for <linux-doc@vger.kernel.org>; Thu, 09 Aug 2018 12:21:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=twF6sNhTtfvVSGfxuaySSxIXOdHaX4FE6UrAMHW8nGM=;
        b=EC41x2JjiJzik3Wnv94TlySKVymUooeutcZL8WXdifFiDQVmHKUbYlQDL6Ej2ctx6E
         oHRBUG14qjk0cxdUsBg+Ir7AnWicRNPrnDNrGfRfEoIgnuwlB5Yy3G+cDOc8HmETBTBV
         ZcB8Ms4y6tbKEv/RNXoLMJvpHZZmxsFMt8eedataLqmQMLur8uh7rV/6JIAXOs9KH1hM
         5mLbypAprgTDjq5AREvz9zOoNJ1c2sy08Hn5HQE37W6BeWTeFsdfeXLuB57wKly0f1Ms
         HnnCp6n4UA/+5EMcKVUAmPEWCKj04JJ8/a0FTvYGFFoQfXzF9dwQ36ZdGzLUosq0tGg3
         mHUw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=twF6sNhTtfvVSGfxuaySSxIXOdHaX4FE6UrAMHW8nGM=;
        b=pD+0JthVDUJtjlqURRaDE1uIqYMdR0dOzhG6ZT3TbRmr5PhTHyKKpat4TQO2hi/LbM
         T91jroNRGElO+6dd5cioGTq20P6MJLbEi9kuTXgFC6FsF2ro6u4g1etEt+vCgXE5yYv4
         TvTF4vBRJI0s0wVeUE5Y/Z4m4Ofs5gZhYAIY9r1RlMuByshrsLLKGN2TLxUIHZV3E96m
         +NHC1lQG0u1K85sz/A4PwgMxXqLDFsLEn3eRfaN05co5yjgU1O9RLGh1cEQI91BoBbng
         LQnKqjdMfEAmwkePVN+r6KBNKt+ZPSzQH5Iew3TePKJd5SMp2kA59Y+UKoHh/pS6+V0F
         wQLg==
X-Gm-Message-State: AOUpUlGsga7dQeTQGRSgZ02ogbn/+EAU/qyXjQiTqjQDZVzofHDIhmfR
        2B9aFJ6+Z4/ZtPCDV5YihKWxIA==
X-Google-Smtp-Source: AA+uWPyRQtYXfr8FUdpGU+RB5iX5B4yuhSfTZOkAZZey5WmW6ezBoCWEkP49Bu5n5WocQNV2IKBARA==
X-Received: by 2002:adf:d207:: with SMTP id g7-v6mr2297275wri.91.1533842499723;
        Thu, 09 Aug 2018 12:21:39 -0700 (PDT)
Received: from andreyknvl0.muc.corp.google.com ([2a00:79e0:15:10:84be:a42a:826d:c530])
        by smtp.gmail.com with ESMTPSA id o14-v6sm14738797wmd.35.2018.08.09.12.21.38
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 09 Aug 2018 12:21:38 -0700 (PDT)
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
Subject: [PATCH v5 15/18] khwasan, arm64: add brk handler for inline instrumentation
Date:   Thu,  9 Aug 2018 21:21:07 +0200
Message-Id: <8f925694d0c885413d38e4fc79a39726d4281a3d.1533842385.git.andreyknvl@google.com>
X-Mailer: git-send-email 2.18.0.597.ga71716f1ad-goog
In-Reply-To: <cover.1533842385.git.andreyknvl@google.com>
References: <cover.1533842385.git.andreyknvl@google.com>
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
index d399d459397b..95152a4fd202 100644
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
@@ -791,7 +796,7 @@ static int bug_handler(struct pt_regs *regs, unsigned int esr)
 	}
 
 	/* If thread survives, skip over the BUG instruction and continue: */
-	arm64_skip_faulting_instruction(regs, AARCH64_INSN_SIZE);
+	__arm64_skip_faulting_instruction(regs, AARCH64_INSN_SIZE);
 	return DBG_HOOK_HANDLED;
 }
 
@@ -801,6 +806,59 @@ static struct break_hook bug_break_hook = {
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
@@ -808,6 +866,10 @@ static struct break_hook bug_break_hook = {
 int __init early_brk64(unsigned long addr, unsigned int esr,
 		struct pt_regs *regs)
 {
+#ifdef CONFIG_KASAN_HW
+	if ((esr & KHWASAN_ESR_MASK) == KHWASAN_ESR_VAL)
+		return khwasan_handler(regs, esr) != DBG_HOOK_HANDLED;
+#endif
 	return bug_handler(regs, esr) != DBG_HOOK_HANDLED;
 }
 
@@ -815,4 +877,7 @@ int __init early_brk64(unsigned long addr, unsigned int esr,
 void __init trap_init(void)
 {
 	register_break_hook(&bug_break_hook);
+#ifdef CONFIG_KASAN_HW
+	register_break_hook(&khwasan_break_hook);
+#endif
 }
-- 
2.18.0.597.ga71716f1ad-goog

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
