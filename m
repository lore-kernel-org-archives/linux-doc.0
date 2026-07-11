Received: from mail.cyberchaos.dev (mail.cyberchaos.dev [195.39.247.168])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3D23633F597;
	Sat, 11 Jul 2026 07:35:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=195.39.247.168
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783755345; cv=none; b=iIV3n04VqXZnObmlwHxfLslTh2P+D4NmkEV8wcZH1c/677RIP7VSC/EtBQiq3txHyFZM1rE/HgiWkMrhNNdrflXYgNt5+MHzvjINhzEgx0kCP9lgEngwJQpoZ0Zo/mKsIVZ+/p0fG0z3VGuPa5JgjTqRW87NmyhszlniSBXRQoM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783755345; c=relaxed/simple;
	bh=LOBBXPaE++4Rl407pOJixhz54Adqnnixc0zS1Ucl/dM=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:To:Cc; b=HitEGwiAKKu9xX4KCDmSHp9d4Af/tsQ+QSvNqPDf2yMVWUQEOJi+w5yimmwRLWXaSqlZsz4f9gxmX877/8YbP53UUXa9sD1ml0euZ6qAmYhA9Ti4iTbnGV7A/EU4tcJ+/43DCx55G2UWbUMuUYfm+3fF8rsnhCKcyMf3lzlSro4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev; spf=pass smtp.mailfrom=cyberchaos.dev; dkim=pass (1024-bit key) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.b=o6ljqtQ5; arc=none smtp.client-ip=195.39.247.168
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=cyberchaos.dev
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=cyberchaos.dev header.i=@cyberchaos.dev header.b="o6ljqtQ5"
From: Yureka Lilian <yureka@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1783755334;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=qPHLQ2tCcNuSIH30h9+K88gtN9XOaokaNHFz9XFZTto=;
	b=o6ljqtQ5HtGtlykKMwNulgeGorEx6CZwu9TWfhSoWQSqTiMtsER7r9Rd0Lq+pVXrdT2GYk
	ov5omYzakFWbDDXaoAfkNNRBPI+4uoBqHmy1ZR7Ddmr8zR+NfzCbOQVeFD7Cra7hrnO7WE
	OwvkdAY9az4qccQtSWaah1iwPuuGg24=
Date: Sat, 11 Jul 2026 09:35:25 +0200
Subject: [PATCH v2] arch: arm64: add early_param idle=<wfi|yield|nop>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260711-arm64-idle-param-v2-1-0ab67652a435@cyberchaos.dev>
X-B4-Tracking: v=1; b=H4sIADzyUWoC/32OQQ6CMBBFr0JmbU2phUZX3MOwKGUqNULJFBsJ6
 d0tuHf5Jn/e/xsEJIcBbsUGhNEF56cM4lSAGfT0QOb6zCC4qLniFdM01jIfX8hmTXpkRihrOCr
 UvIL8NhNa9zmU9/bH4d090Sy7Z08MLiye1qMzlnvujz6WrGRKVlLIq5XqYhuzdkh5nA/nHiO0K
 aUv3oz0J8cAAAA=
X-Change-ID: 20260705-arm64-idle-param-c27fc0e7ea05
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, Yureka Lilian <yureka@cyberchaos.dev>

Overriding the idle mechanism might be useful for debugging and performance
testing. Add a cmdline parameter for it, similar to the existing idle=
parameter already present for the x86 and ppc architectures.

It is also useful on platforms where the WFI instruction misbehaves,
such as Apple Silicon SoCs. Generally, a misbehaving instruction should
be treated as an erratum and patched using the alternatives framework.
However, in the Apple Silicon case we need more flexibility because it is
difficult to detect whether the erratum applies. For example, Linux VMs
inside macOS have the same MIDR and may even seem like they're running
in EL2 in the case of NV, but should continue using WFI (it's trapped and
handled correctly by the hypervisor there). Thus, we prefer to
let the m1n1 bootloader add the idle=nop parameter[1].

Link[1]: https://lore.kernel.org/all/99b69262-e54b-424e-baa2-96ef7013b87a@kernel.org/
Suggested-by: Will Deacon <will@kernel.org>
Signed-off-by: Yureka Lilian <yureka@cyberchaos.dev>
---
Changes in v2:
- Applied suggestions by Anshuman Khandual (Thanks!)
- Link to v1: https://patch.msgid.link/20260705-arm64-idle-param-v1-1-7454249f473f@cyberchaos.dev
---
 Documentation/admin-guide/kernel-parameters.txt | 23 +++++++++++++++++++
 arch/arm64/kernel/idle.c                        | 30 +++++++++++++++++++++++--
 arch/arm64/kernel/idle.h                        | 13 +++++++++++
 arch/arm64/lib/delay.c                          |  5 ++++-
 4 files changed, 68 insertions(+), 3 deletions(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index b2d7d3540ded..d7f5471edf8f 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2239,6 +2239,29 @@ Kernel parameters
 
 			idle=nomwait: Disable mwait for CPU C-states
 
+			[ARM64,EARLY]
+			Format: idle=wfi, idle=yield, idle=nop
+
+			idle=wfi: Use the WFI (Wait For Interrupt) hint
+			instruction in the idle loop. This is the default and
+			allows the CPU to enter a low-power state until an
+			interrupt arrives.
+
+			idle=yield: Use the YIELD hint instruction instead of
+			WFI. CPUs supporting simultaneous multi-threading (SMT),
+			can continue executing another thread when the current
+			thread reaches the idle loop. This will make the CPUs
+			eat more power, but may be useful to get slightly better
+			performance in some applications, since the CPUs will
+			not enter a low-power state.
+
+			idle=nop: Do not execute any idle instruction in the
+			idle loop. This is useful on platforms where WFI
+			misbehaves, leading to system instability or loss of CPU
+			state. This will make the CPUs eat more power, but may
+			give slightly better performance in some applications,
+			since the CPUs will not enter a low-power state.
+
 	idxd.sva=	[HW]
 			Format: <bool>
 			Allow force disabling of Shared Virtual Memory (SVA)
diff --git a/arch/arm64/kernel/idle.c b/arch/arm64/kernel/idle.c
index 05cfb347ec26..f161711a9954 100644
--- a/arch/arm64/kernel/idle.c
+++ b/arch/arm64/kernel/idle.c
@@ -11,6 +11,27 @@
 #include <asm/cpufeature.h>
 #include <asm/sysreg.h>
 
+#include "idle.h"
+
+enum arm64_idle_mode idle = ARM64_IDLE_WFI;
+
+static int __init setup_idle(char *arg)
+{
+	if (!arg)
+		return -1;
+	else if (!strcmp(arg, "wfi"))
+		idle = ARM64_IDLE_WFI;
+	else if (!strcmp(arg, "yield"))
+		idle = ARM64_IDLE_YIELD;
+	else if (!strcmp(arg, "nop"))
+		idle = ARM64_IDLE_NOP;
+	else
+		return -1;
+
+	return 0;
+}
+early_param("idle", setup_idle);
+
 /*
  *	cpu_do_idle()
  *
@@ -26,8 +47,13 @@ void __cpuidle cpu_do_idle(void)
 
 	arm_cpuidle_save_irq_context(&context);
 
-	dsb(sy);
-	wfi();
+	if (likely(idle == ARM64_IDLE_WFI)) {
+		dsb(sy);
+		wfi();
+	} else if (idle == ARM64_IDLE_YIELD) {
+		dsb(sy);
+		asm volatile("yield" ::: "memory");
+	}
 
 	arm_cpuidle_restore_irq_context(&context);
 }
diff --git a/arch/arm64/kernel/idle.h b/arch/arm64/kernel/idle.h
new file mode 100644
index 000000000000..693f981c9a91
--- /dev/null
+++ b/arch/arm64/kernel/idle.h
@@ -0,0 +1,13 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ARM64_KERNEL_IDLE_H
+#define __ARM64_KERNEL_IDLE_H
+
+extern enum arm64_idle_mode idle;
+
+enum arm64_idle_mode {
+	ARM64_IDLE_WFI,
+	ARM64_IDLE_YIELD,
+	ARM64_IDLE_NOP,
+};
+
+#endif
diff --git a/arch/arm64/lib/delay.c b/arch/arm64/lib/delay.c
index e278e060e78a..2452990ed37a 100644
--- a/arch/arm64/lib/delay.c
+++ b/arch/arm64/lib/delay.c
@@ -15,6 +15,8 @@
 
 #include <clocksource/arm_arch_timer.h>
 
+#include "../kernel/idle.h"
+
 #define USECS_TO_CYCLES(time_usecs)			\
 	xloops_to_cycles((time_usecs) * 0x10C7UL)
 
@@ -49,7 +51,8 @@ void __delay(unsigned long cycles)
 		 * Start with WFIT. If an interrupt makes us resume
 		 * early, use a WFET loop to complete the delay.
 		 */
-		wfit(end);
+		if (likely(idle == ARM64_IDLE_WFI))
+			wfit(end);
 		while ((__delay_cycles() - start) < cycles)
 			wfet(end);
 	} else 	if (arch_timer_evtstrm_available()) {

---
base-commit: bee763d5f341b99cf472afeb508d4988f62a6ca1
change-id: 20260705-arm64-idle-param-c27fc0e7ea05

Best regards,
--  
Yureka Lilian <yureka@cyberchaos.dev>

