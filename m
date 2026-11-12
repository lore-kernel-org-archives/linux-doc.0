Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.174
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794510569;
	b=P1WB5mOy6OfZuGLxI6T69Ns92RRXAyI5mMfagSYZMtE2B0etFQhrBpG2WCEd1hr15rX3
	 ThfO4e8uFDmb3wwH1PXh3IqUJI5ydlFdD8WbCpQ5r1orn1iDTNS4hCEBKWi0xHh1pp6qx
	 Tev/vyrpIGYMg8AoxRDRFZ5fkSl5CtYre2VaGseCsUrXSq5tm8/UWxM/BHYDTZ1nISPlK
	 6wTkPPy1Q7Db5NjMM6u44EeBmqzqZjAKlQbt5MRtTQWRNoTCD2RmR0jgxcTbUG9DsJORA
	 Q3J18DHbBy34V6AINv45iHZ7+iCZMwh/roB3Yn4bMCCQw7KTzedFNbNDd02uSBIXsHA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794510569;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MZNgkM904EAWrQX1/wn3079usEV+qyaStHRPZPAF7SI=;
	b=rvnjgGj4Gs5kdlBlLm/yxKegrF1U4JrSuS8qKLRmeNPC1Zm4coNfm1PHTzVWDK/8OXq3
	 jo/0ysZ6AwuY67QkOkOBcNWBmkijVJD1o7WqFXkts0C3w5k0qu6l2G55acU+dL/gfqWqJ
	 sL/x1t31lZPy1/TAajf52QNt9RzIQYsfAjbpPk04S1JmoWVkcQZHDodwejPRnnyMOZ7fc
	 q3jwGcV0imBbQTV7rRTybIhG5kBbvdxgpDESmCJIXwY1V2HJRmeZbACbOFBknTmC37h+A
	 O4YxC1qmdOo28H+m+S79tFX1eyu/WeUe37c52bmx3xn7cOncxl538vODCjaJDgjxj/Q==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aFOHzwr+;
	arc=none smtp.remote-ip=74.125.82.174
Received: from mail-dy1-f174.google.com (mail-dy1-f174.google.com [74.125.82.174])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8ED9B60A2610
	for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 19:09:28 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8ED9B60A2610
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=aFOHzwr+
Received: by mail-dy1-f174.google.com with SMTP id 5a478bee46e88-33fb4680717so10391eec.1
        for <linux-doc@vger.kernel.org>; Thu, 12 Nov 2026 11:09:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794510568; x=1795115368; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MZNgkM904EAWrQX1/wn3079usEV+qyaStHRPZPAF7SI=;
        b=aFOHzwr+z8zfgGiL1j1rwCghO1Ql13ceA2/l19mnVX3+A4Z1VSMWWt+qtrXpIF9dVm
         xP9qqXjBHwJLedf8HGLSfuB/Arq9IhZCgyOBld5Tcef2QNShcFLC3V2uc/ZrEQ8k4Vp+
         EQ26nGWObftWoBoOYWBYTAI8XDKD7NkNvlIJ+S8rVSfHrfEPtAnw6awCBCZiwItIZu9p
         c0dBFRKOkMbFSmWOgqvAjBtWp+yXa3E553xB7a7rZGeeyTEpOkGieqQoJLM80V/d4mza
         TpEH5Ge3ToJQ355jUSj9/Oin+ERklDzkempk3wTPV0ZuXJ7KCDWwqRn/jOAf/FzS32Uq
         jQiA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794510568; x=1795115368;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MZNgkM904EAWrQX1/wn3079usEV+qyaStHRPZPAF7SI=;
        b=HhrnFCGNbV4xJP5ZQE6rycubyGdrncWoVRAlnIEX+Bt3yq//rAgF/MBMWf68q830ft
         wN27Z0jxnP6P9hXVfh9RVZqiwJt62TG2QpmBOcIgv2i68e0KqlWrNzlFc5MAMG6LgV7v
         oQSt94tIyN4lyTmYoYjYqWL8cmUFqOXC9ddyKV+2fENO5GWxCj/f6F/u/pX813BHFEKc
         FkN3NnE3yXM+tJon/4jEXOntb/Zlg6b+Mi+IL7XofDo8A/tBS4RDzP9f/9N0WJKCO8ye
         1bXz21/ma5b5iXxxvYoBwT+DU1x8PG1E736dJCPHVuXzce2bo8olSi4AENyb1RSHvaPk
         MAaA==
X-Forwarded-Encrypted: i=1; AL+hErHIpiIkKKzzBLfs1Uc/jjkYC6Ndto1BcauFI2e6/SDTbJoD/sK9GaUYOAY3BbS+45PHTAb6LSF1XMw=@vger.kernel.org
X-Gm-Message-State: APuU4Z83URp924vfY7V65EztWpYp0ttpE4kckR4ATgRPFYnvRi0798iP
	XX2AGzfAkw8wsNiBxQbQGznAqUtZ2PIIjXoaXOjQV4Idco1/mN4dJmcH
X-Gm-Gg: AYBFou0s2I5xrMNyGIS1GvQ/GoOVTaa6RltRtDLU78ptFUjGhz06Qxyl/016tshLbL2
	d2733Tv6UwP2RDYpuPJauz5DCrcTKlJcjDCMNeogMWzCICaUqz06Dv5EbnoyCkXChPRUNf+JMRe
	OSfjXm4xdYhjxfInAm7eUEO3Ie4PFNoMcfl9yJRU4czA+SL4E2zcdxth00u8hw2J3suZ0XiRbms
	D2dHE/HlMUhJcDGW4Alzm0CP8QsrrZVPyYLrIGHf+QLvlWY9HZMzGW2KCZYbS5grfY97a64hUVv
	IVQb83ZXKs/nab2qyHfhwxCJoDLGQGw3fNrrPKEqJ/YK0fzBMt1aOQIIJF4Ed0/5sR//XyjJrJG
	w43y++Ellbab3IGa/5iHJuIsSXnxdujv3biQwbH/7xnHs1XObhdYA2Uv2x5lgbaUiyfR9PV725U
	PaSxK2tOozM4xMix2dfYQ8oBWPKqnP4MjPG6Kp9iIAKg2IBV4Xvl2PCw7A7EhT+4SkLJVQJMfoL
	4Xr82KX5tS6yq/edA1WtL7Jj36xYxr1uBFFTPWlztSNs9l0K+BPUbtJpe1Jcac+ut9wNtBEoKFq
	Q4v0bb0G
X-Received: by 2002:a05:7301:fd09:b0:36d:4570:a32d with SMTP id 5a478bee46e88-37963953f0amr89550eec.2.1794510567383;
        Thu, 12 Nov 2026 11:09:27 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37956bad6casm395674eec.26.2026.11.12.11.09.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 12 Nov 2026 11:09:26 -0800 (PST)
From: Florian Fainelli <f.fainelli@gmail.com>
To: linux-mips@vger.kernel.org
Cc: Florian Fainelli <f.fainelli@gmail.com>,
	Thomas Bogendoerfer <tsbogend@alpha.franken.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Ingo Molnar <mingo@redhat.com>,
	Arnaldo Carvalho de Melo <acme@kernel.org>,
	Namhyung Kim <namhyung@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Alexander Shishkin <alexander.shishkin@linux.intel.com>,
	Jiri Olsa <jolsa@kernel.org>,
	Ian Rogers <irogers@google.com>,
	Adrian Hunter <adrian.hunter@intel.com>,
	James Clark <james.clark@linaro.org>,
	Thomas Gleixner <tglx@kernel.org>,
	linux-doc@vger.kernel.org (open list:DOCUMENTATION),
	linux-kernel@vger.kernel.org (open list),
	linux-perf-users@vger.kernel.org (open list:PERFORMANCE EVENTS SUBSYSTEM),
	"Maciej W. Rozycki" <macro@orcam.me.uk>
Subject: [PATCH 1/3] MIPS: SiByte: Wire up the CPU interrupt controller
Date: Thu, 12 Nov 2026 11:09:14 -0800
Message-ID: <20261112190916.3725141-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261112190916.3725141-1-f.fainelli@gmail.com>
References: <20261112190916.3725141-1-f.fainelli@gmail.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Initialize the MIPS CPU interrupt controller on SB1250 and BCM1480 so
CPU-local interrupts have a configured irq_chip and handler. Reserve IRQs
128 through 135 above both interrupt mapper ranges, and dispatch BCM1480
IP7 through the CPU controller as SB1250 already does.

This provides the CPU-local IP7 interrupt needed by the SB1 performance
counters without overlapping the SiByte interrupt mapper IRQ numbers.

Signed-off-by: Florian Fainelli <f.fainelli@gmail.com>
---
 arch/mips/include/asm/mach-sibyte/irq.h | 10 ++++++++++
 arch/mips/sibyte/bcm1480/irq.c          |  7 ++++++-
 arch/mips/sibyte/sb1250/irq.c           |  3 +++
 3 files changed, 19 insertions(+), 1 deletion(-)
 create mode 100644 arch/mips/include/asm/mach-sibyte/irq.h

diff --git a/arch/mips/include/asm/mach-sibyte/irq.h b/arch/mips/include/asm/mach-sibyte/irq.h
new file mode 100644
index 000000000000..b7073830d2ec
--- /dev/null
+++ b/arch/mips/include/asm/mach-sibyte/irq.h
@@ -0,0 +1,10 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef __ASM_MACH_SIBYTE_IRQ_H
+#define __ASM_MACH_SIBYTE_IRQ_H
+
+/* Keep CPU-local interrupts above both SiByte interrupt mapper ranges. */
+#define MIPS_CPU_IRQ_BASE	128
+
+#include <asm/mach-generic/irq.h>
+
+#endif
diff --git a/arch/mips/sibyte/bcm1480/irq.c b/arch/mips/sibyte/bcm1480/irq.c
index 4c18a2c755d2..5eff85a8659b 100644
--- a/arch/mips/sibyte/bcm1480/irq.c
+++ b/arch/mips/sibyte/bcm1480/irq.c
@@ -15,6 +15,7 @@
 #include <asm/irq_regs.h>
 #include <asm/signal.h>
 #include <asm/io.h>
+#include <asm/irq_cpu.h>
 
 #include <asm/sibyte/bcm1480_regs.h>
 #include <asm/sibyte/bcm1480_int.h>
@@ -242,6 +243,8 @@ void __init arch_init_irq(void)
 	unsigned int imask = STATUSF_IP4 | STATUSF_IP3 | STATUSF_IP2 |
 		STATUSF_IP1 | STATUSF_IP0;
 
+	mips_cpu_irq_init();
+
 	/* Default everything to IP2 */
 	/* Start with _high registers which has no bit 0 interrupt source */
 	for (i = 1; i < BCM1480_NR_IRQS_HALF; i++) {	/* was I0 */
@@ -337,7 +340,9 @@ asmlinkage void plat_irq_dispatch(void)
 
 	pending = read_c0_cause() & read_c0_status();
 
-	if (pending & CAUSEF_IP4)
+	if (pending & CAUSEF_IP7)
+		do_IRQ(MIPS_CPU_IRQ_BASE + 7);
+	else if (pending & CAUSEF_IP4)
 		do_IRQ(K_BCM1480_INT_TIMER_0 + cpu);
 #ifdef CONFIG_SMP
 	else if (pending & CAUSEF_IP3)
diff --git a/arch/mips/sibyte/sb1250/irq.c b/arch/mips/sibyte/sb1250/irq.c
index 57943fe3ac03..2df115269f81 100644
--- a/arch/mips/sibyte/sb1250/irq.c
+++ b/arch/mips/sibyte/sb1250/irq.c
@@ -15,6 +15,7 @@
 #include <asm/signal.h>
 #include <asm/time.h>
 #include <asm/io.h>
+#include <asm/irq_cpu.h>
 
 #include <asm/sibyte/sb1250_regs.h>
 #include <asm/sibyte/sb1250_int.h>
@@ -225,6 +226,8 @@ void __init arch_init_irq(void)
 	unsigned int imask = STATUSF_IP4 | STATUSF_IP3 | STATUSF_IP2 |
 		STATUSF_IP1 | STATUSF_IP0;
 
+	mips_cpu_irq_init();
+
 	/* Default everything to IP2 */
 	for (i = 0; i < SB1250_NR_IRQS; i++) {	/* was I0 */
 		__raw_writeq(IMR_IP2_VAL,
-- 
2.53.0

