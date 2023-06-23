Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C08FC001B0
	for <linux-doc@archiver.kernel.org>; Fri, 23 Jun 2023 22:20:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232362AbjFWWUv (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 23 Jun 2023 18:20:51 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52606 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232429AbjFWWUu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 23 Jun 2023 18:20:50 -0400
Received: from mail-pg1-x535.google.com (mail-pg1-x535.google.com [IPv6:2607:f8b0:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E88AC2951
        for <linux-doc@vger.kernel.org>; Fri, 23 Jun 2023 15:20:40 -0700 (PDT)
Received: by mail-pg1-x535.google.com with SMTP id 41be03b00d2f7-54f87d5f1abso764449a12.0
        for <linux-doc@vger.kernel.org>; Fri, 23 Jun 2023 15:20:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=rivosinc-com.20221208.gappssmtp.com; s=20221208; t=1687558840; x=1690150840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=9tOWF5jVjkcJnGVSJRQXmOufijKMT1TZldHmns4l6jA=;
        b=j7Uv46y88tuBgLQu6gWfP6l1YvmyaedR9YtQXaYX46hKRc81vhJsaHPRG1Hs0/l1cO
         mMgV7FKk6FmtZeBkWeoBHnN5QVus9+Evd9TD3kHi/hYRUNQ0OTND9lFox6aBOGTWphkk
         XBBaNdslGJb3bfB42fhGE/9DRzBk8QTwfYx3ndmbP6POwft9BGYyYr6IqiaPAM2VEGEK
         C0033CwonW4UvCgbYXCOU9Oht1NYmh8GN6hf0jOzrLWmAfNzxnXV+yOClk5ojLOAdPtC
         0ksRmXof7Rn+WvlBXTH18FhEhVv0XBM8fyIuAps2575BxtugwqY2VZa9iu7VODrQhcDa
         6iXQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687558840; x=1690150840;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=9tOWF5jVjkcJnGVSJRQXmOufijKMT1TZldHmns4l6jA=;
        b=fJjCJW6gBEKwdCr5yyAk0opLLpB2d7lF/CtNNNHQffcFwWQol8P0sLzZhdDJJn3PnM
         e0UZe3BmjiGPkH8aLQ7QPnjJf85VHnKSjaRegcJVb3lngB7a/KDUIbuixrx/1JJInbd3
         BJ9rHqvaEsjKSE+3pp9u6BO2KF4HGyxoQ6mWX3wAx80pMeGfgwO/f6GMHQ7zX+ceYM5Q
         hXYe3QHEVZdIDbZEBB23ds9j6t7ObpQLJn7b96KIay1XZJDYP5x0ZTYhQORW31djoBBc
         ysstFOBw5vBxYswtHQd+dRrFpPLgXRiyD/igmC+XvOSdNRxwH20N+UsJHA3/1JFOgFpe
         RkKQ==
X-Gm-Message-State: AC+VfDw5xgt2vMk+6OtGwxTfE9q9POBOKJ0qAWwgUkLjlhFl93KU3vXJ
        Ecu0Qu1OlWAC2Mt6a8m/wsW8gQ==
X-Google-Smtp-Source: ACHHUZ5jseNwiCBYx3Vp2Jt1EnuGruMwwk6GbcJvwh8JVNPX3obSZyczhHcgUYVl3ZCui0U1efkKGQ==
X-Received: by 2002:a05:6a20:729f:b0:118:e70:6f7d with SMTP id o31-20020a056a20729f00b001180e706f7dmr18899903pzk.10.1687558840398;
        Fri, 23 Jun 2023 15:20:40 -0700 (PDT)
Received: from evan.ba.rivosinc.com ([66.220.2.162])
        by smtp.gmail.com with ESMTPSA id ju20-20020a170903429400b001a80ad9c599sm35535plb.294.2023.06.23.15.20.38
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 23 Jun 2023 15:20:39 -0700 (PDT)
From:   Evan Green <evan@rivosinc.com>
To:     Palmer Dabbelt <palmer@rivosinc.com>
Cc:     Simon Hosie <shosie@rivosinc.com>, Evan Green <evan@rivosinc.com>,
        Albert Ou <aou@eecs.berkeley.edu>,
        Alexandre Ghiti <alexghiti@rivosinc.com>,
        Andrew Jones <ajones@ventanamicro.com>,
        Andy Chiu <andy.chiu@sifive.com>,
        Anup Patel <apatel@ventanamicro.com>,
        Conor Dooley <conor.dooley@microchip.com>,
        Greentime Hu <greentime.hu@sifive.com>,
        Guo Ren <guoren@kernel.org>,
        Heiko Stuebner <heiko.stuebner@vrull.eu>,
        Jisheng Zhang <jszhang@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Ley Foon Tan <leyfoon.tan@starfivetech.com>,
        Li Zhengyu <lizhengyu3@huawei.com>,
        Masahiro Yamada <masahiroy@kernel.org>,
        Palmer Dabbelt <palmer@dabbelt.com>,
        Paul Walmsley <paul.walmsley@sifive.com>,
        Sia Jee Heng <jeeheng.sia@starfivetech.com>,
        Sunil V L <sunilvl@ventanamicro.com>,
        Xianting Tian <xianting.tian@linux.alibaba.com>,
        Yangyu Chen <cyy@cyyself.name>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-riscv@lists.infradead.org
Subject: [PATCH 1/2] RISC-V: Probe for unaligned access speed
Date:   Fri, 23 Jun 2023 15:20:15 -0700
Message-Id: <20230623222016.3742145-2-evan@rivosinc.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20230623222016.3742145-1-evan@rivosinc.com>
References: <20230623222016.3742145-1-evan@rivosinc.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Rather than deferring misaligned access speed determinations to a vendor
function, let's probe them and find out how fast they are. If we
determine that a misaligned word access is faster than N byte accesses,
mark the hardware's misaligned access as "fast".

Fix the documentation as well to reflect this bar. Previously the only
SoC that returned "fast" was the THead C906. The change to the
documentation is more a clarification, since the C906 is fast in the
sense of the corrected documentation.

Signed-off-by: Evan Green <evan@rivosinc.com>
---

 Documentation/riscv/hwprobe.rst     |  8 +--
 arch/riscv/include/asm/cpufeature.h |  2 +
 arch/riscv/kernel/Makefile          |  1 +
 arch/riscv/kernel/copy-noalign.S    | 71 ++++++++++++++++++++++++++
 arch/riscv/kernel/copy-noalign.h    | 13 +++++
 arch/riscv/kernel/cpufeature.c      | 78 +++++++++++++++++++++++++++++
 arch/riscv/kernel/smpboot.c         |  2 +
 7 files changed, 171 insertions(+), 4 deletions(-)
 create mode 100644 arch/riscv/kernel/copy-noalign.S
 create mode 100644 arch/riscv/kernel/copy-noalign.h

diff --git a/Documentation/riscv/hwprobe.rst b/Documentation/riscv/hwprobe.rst
index 19165ebd82ba..710325751766 100644
--- a/Documentation/riscv/hwprobe.rst
+++ b/Documentation/riscv/hwprobe.rst
@@ -88,12 +88,12 @@ The following keys are defined:
     always extremely slow.
 
   * :c:macro:`RISCV_HWPROBE_MISALIGNED_SLOW`: Misaligned accesses are supported
-    in hardware, but are slower than the cooresponding aligned accesses
-    sequences.
+    in hardware, but are slower than N byte accesses, where N is the native
+    word size.
 
   * :c:macro:`RISCV_HWPROBE_MISALIGNED_FAST`: Misaligned accesses are supported
-    in hardware and are faster than the cooresponding aligned accesses
-    sequences.
+    in hardware and are faster than N byte accesses, where N is the native
+    word size.
 
   * :c:macro:`RISCV_HWPROBE_MISALIGNED_UNSUPPORTED`: Misaligned accesses are
     not supported at all and will generate a misaligned address fault.
diff --git a/arch/riscv/include/asm/cpufeature.h b/arch/riscv/include/asm/cpufeature.h
index 23fed53b8815..b8e917176616 100644
--- a/arch/riscv/include/asm/cpufeature.h
+++ b/arch/riscv/include/asm/cpufeature.h
@@ -30,4 +30,6 @@ DECLARE_PER_CPU(long, misaligned_access_speed);
 /* Per-cpu ISA extensions. */
 extern struct riscv_isainfo hart_isa[NR_CPUS];
 
+void check_misaligned_access(int cpu);
+
 #endif
diff --git a/arch/riscv/kernel/Makefile b/arch/riscv/kernel/Makefile
index a42951911067..f934d7ab7840 100644
--- a/arch/riscv/kernel/Makefile
+++ b/arch/riscv/kernel/Makefile
@@ -34,6 +34,7 @@ extra-y += vmlinux.lds
 obj-y	+= head.o
 obj-y	+= soc.o
 obj-$(CONFIG_RISCV_ALTERNATIVE) += alternative.o
+obj-y	+= copy-noalign.o
 obj-y	+= cpu.o
 obj-y	+= cpufeature.o
 obj-y	+= entry.o
diff --git a/arch/riscv/kernel/copy-noalign.S b/arch/riscv/kernel/copy-noalign.S
new file mode 100644
index 000000000000..3807fc2324b2
--- /dev/null
+++ b/arch/riscv/kernel/copy-noalign.S
@@ -0,0 +1,71 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/* Copyright (C) 2023 Rivos Inc. */
+
+#include <linux/linkage.h>
+#include <asm/asm.h>
+
+	.text
+
+/* void __copy_words_unaligned(void *, const void *, size_t) */
+/* Performs a memcpy without aligning buffers, using word loads and stores. */
+/* Note: The size is truncated to a multiple of 8 * SZREG */
+ENTRY(__copy_words_unaligned)
+	andi a4, a2, ~((8*SZREG)-1)
+	beqz a4, 2f
+	add a3, a1, a4
+1:
+	REG_L a4,       0(a1)
+	REG_L a5,   SZREG(a1)
+	REG_L a6, 2*SZREG(a1)
+	REG_L a7, 3*SZREG(a1)
+	REG_L t0, 4*SZREG(a1)
+	REG_L t1, 5*SZREG(a1)
+	REG_L t2, 6*SZREG(a1)
+	REG_L t3, 7*SZREG(a1)
+	REG_S a4,       0(a0)
+	REG_S a5,   SZREG(a0)
+	REG_S a6, 2*SZREG(a0)
+	REG_S a7, 3*SZREG(a0)
+	REG_S t0, 4*SZREG(a0)
+	REG_S t1, 5*SZREG(a0)
+	REG_S t2, 6*SZREG(a0)
+	REG_S t3, 7*SZREG(a0)
+	addi a0, a0, 8*SZREG
+	addi a1, a1, 8*SZREG
+	bltu a1, a3, 1b
+
+2:
+	ret
+END(__copy_words_unaligned)
+
+/* void __copy_bytes_unaligned(void *, const void *, size_t) */
+/* Performs a memcpy without aligning buffers, using only byte accesses. */
+/* Note: The size is truncated to a multiple of 8 */
+ENTRY(__copy_bytes_unaligned)
+	andi a4, a2, ~(8-1)
+	beqz a4, 2f
+	add a3, a1, a4
+1:
+	lb a4, 0(a1)
+	lb a5, 1(a1)
+	lb a6, 2(a1)
+	lb a7, 3(a1)
+	lb t0, 4(a1)
+	lb t1, 5(a1)
+	lb t2, 6(a1)
+	lb t3, 7(a1)
+	sb a4, 0(a0)
+	sb a5, 1(a0)
+	sb a6, 2(a0)
+	sb a7, 3(a0)
+	sb t0, 4(a0)
+	sb t1, 5(a0)
+	sb t2, 6(a0)
+	sb t3, 7(a0)
+	addi a0, a0, 8
+	addi a1, a1, 8
+	bltu a1, a3, 1b
+
+2:
+	ret
+END(__copy_bytes_unaligned)
diff --git a/arch/riscv/kernel/copy-noalign.h b/arch/riscv/kernel/copy-noalign.h
new file mode 100644
index 000000000000..99fbb9c763e0
--- /dev/null
+++ b/arch/riscv/kernel/copy-noalign.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0 */
+/*
+ * Copyright (C) 2023 Rivos, Inc.
+ */
+#ifndef __RISCV_KERNEL_COPY_NOALIGN_H
+#define __RISCV_KERNEL_COPY_NOALIGN_H
+
+#include <linux/types.h>
+
+void __copy_words_unaligned(void *dst, const void *src, size_t size);
+void __copy_bytes_unaligned(void *dst, const void *src, size_t size);
+
+#endif /* __RISCV_KERNEL_COPY_NOALIGN_H */
diff --git a/arch/riscv/kernel/cpufeature.c b/arch/riscv/kernel/cpufeature.c
index bdcf460ea53d..3f7200dcc00c 100644
--- a/arch/riscv/kernel/cpufeature.c
+++ b/arch/riscv/kernel/cpufeature.c
@@ -19,11 +19,21 @@
 #include <asm/cacheflush.h>
 #include <asm/cpufeature.h>
 #include <asm/hwcap.h>
+#include <asm/hwprobe.h>
 #include <asm/patch.h>
 #include <asm/processor.h>
 #include <asm/vector.h>
 
+#include "copy-noalign.h"
+
 #define NUM_ALPHA_EXTS ('z' - 'a' + 1)
+#define MISALIGNED_ACCESS_JIFFIES_LG2 1
+#define MISALIGNED_BUFFER_SIZE 0x4000
+#define MISALIGNED_COPY_SIZE ((MISALIGNED_BUFFER_SIZE / 2) - 0x80)
+
+#define MISALIGNED_COPY_MBS(_count) \
+	((HZ * (_count) * MISALIGNED_COPY_SIZE) >> \
+	 (20 + MISALIGNED_ACCESS_JIFFIES_LG2))
 
 unsigned long elf_hwcap __read_mostly;
 
@@ -396,6 +406,74 @@ unsigned long riscv_get_elf_hwcap(void)
 	return hwcap;
 }
 
+void check_misaligned_access(int cpu)
+{
+	unsigned long j0, j1;
+	struct page *page;
+	void *dst;
+	void *src;
+	long word_copies = 0;
+	long byte_copies = 0;
+	long speed = RISCV_HWPROBE_MISALIGNED_SLOW;
+
+	page = alloc_pages(GFP_NOWAIT, get_order(MISALIGNED_BUFFER_SIZE));
+	if (!page) {
+		pr_warn("Can't alloc pages to measure memcpy performance");
+		return;
+	}
+
+	/* Make a misaligned destination buffer. */
+	dst = (void *)((unsigned long)page_address(page) | 0x1);
+	/* Misalign src as well, but differently (off by 1 + 2 = 3). */
+	src = dst + (MISALIGNED_BUFFER_SIZE / 2);
+	src += 2;
+	/* Do a warmup. */
+	__copy_words_unaligned(dst, src, MISALIGNED_COPY_SIZE);
+	preempt_disable();
+	j0 = jiffies;
+	while ((j1 = jiffies) == j0)
+		cpu_relax();
+
+	while (time_before(jiffies,
+			   j1 + (1 << MISALIGNED_ACCESS_JIFFIES_LG2))) {
+
+		__copy_words_unaligned(dst, src, MISALIGNED_COPY_SIZE);
+		word_copies += 1;
+	}
+
+	__copy_bytes_unaligned(dst, src, MISALIGNED_COPY_SIZE);
+	j0 = jiffies;
+	while ((j1 = jiffies) == j0)
+		cpu_relax();
+
+	while (time_before(jiffies,
+			   j1 + (1 << MISALIGNED_ACCESS_JIFFIES_LG2))) {
+		__copy_bytes_unaligned(dst, src, MISALIGNED_COPY_SIZE);
+		byte_copies += 1;
+	}
+
+	preempt_enable();
+	if (word_copies >= byte_copies)
+		speed = RISCV_HWPROBE_MISALIGNED_FAST;
+
+	pr_info("cpu%d: Unaligned word copy %ld MB/s, byte copy %ld MB/s, misaligned accesses are %s\n",
+		cpu,
+		MISALIGNED_COPY_MBS(word_copies),
+		MISALIGNED_COPY_MBS(byte_copies),
+		(speed == RISCV_HWPROBE_MISALIGNED_FAST) ? "fast" : "slow");
+
+	per_cpu(misaligned_access_speed, cpu) = speed;
+	__free_pages(page, get_order(MISALIGNED_BUFFER_SIZE));
+}
+
+static int check_misaligned_access0(void)
+{
+	check_misaligned_access(0);
+	return 0;
+}
+
+arch_initcall(check_misaligned_access0);
+
 #ifdef CONFIG_RISCV_ALTERNATIVE
 /*
  * Alternative patch sites consider 48 bits when determining when to patch
diff --git a/arch/riscv/kernel/smpboot.c b/arch/riscv/kernel/smpboot.c
index bb0b76e1a6d4..e34a71b4786b 100644
--- a/arch/riscv/kernel/smpboot.c
+++ b/arch/riscv/kernel/smpboot.c
@@ -26,6 +26,7 @@
 #include <linux/sched/task_stack.h>
 #include <linux/sched/mm.h>
 #include <asm/cpu_ops.h>
+#include <asm/cpufeature.h>
 #include <asm/irq.h>
 #include <asm/mmu_context.h>
 #include <asm/numa.h>
@@ -244,6 +245,7 @@ asmlinkage __visible void smp_callin(void)
 	notify_cpu_starting(curr_cpuid);
 	numa_add_cpu(curr_cpuid);
 	set_cpu_online(curr_cpuid, 1);
+	check_misaligned_access(curr_cpuid);
 	probe_vendor_features(curr_cpuid);
 
 	if (has_vector()) {
-- 
2.34.1

