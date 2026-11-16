Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.82.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794850730;
	b=IwnNAZSigxaSuO5SnyKwTO+kQRIBt02LN2u16R55N8GnugV2XASzxW3N+riG46cSrBSU
	 w9gNahu8D8f6EYqw2dZUuHkcWYLURw5i/wo7OL0khYV3nguCPMerQaEhmIHhWPqMyZ+Se
	 iQryYhrdibJaUS+pfib9pdHduNHSHAOtqkE0Yc8hlZGIqspwjrPuZ7nI/Prx26b2bu4j7
	 NOJTDP/xhjwkVcq3ekRF8yAAEivK3s+prPR9U5F0q+nbVCArRO85JY+RfcxT1YrwrqSWk
	 /umSDbtlU2M+XdMpGWRedRdgirw1vEbT3f+i8bNQTj94LhHwaMX7iWS9qzWn5wPNr0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794850730;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=MZNgkM904EAWrQX1/wn3079usEV+qyaStHRPZPAF7SI=;
	b=0SSWtli2e2xHyTOq8Mb7/uKBM8bHkn/meghtEh7g8+UiErDmO3G/JL+CszxHUwY/zxsr
	 Utvrynp6B70abCjpUOJFJOd5EM70ENo/vpG8GmGrAUEbkQreXgFPbJ6htNBGSsOj9Ia2a
	 yxuEKavVUACgQHJgAA9lgNRe265adsHgm4xS+vzDCp2EP8yfFpMHsBJnPNVq6VRfOHhNB
	 /gPkmLdRHrvzcXAHPmeeegsj+doHPiWnK4NrgZZlpJzzJHhdvZY4fPSxyppWsVp88QvDh
	 nFPvyru0rKU/ndAI6qaaryXevMWHCmN6OeZP6x2rrmqCmYxgULP6lNBrVEIwQog2sWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qN59dOiG;
	arc=none smtp.remote-ip=74.125.82.175
Received: from mail-dy1-f175.google.com (mail-dy1-f175.google.com [74.125.82.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C7D4606A333
	for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 17:38:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C7D4606A333
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=qN59dOiG
Received: by mail-dy1-f175.google.com with SMTP id 5a478bee46e88-3704d30b84fso4408646eec.1
        for <linux-doc@vger.kernel.org>; Mon, 16 Nov 2026 09:38:50 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794850729; x=1795455529; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=MZNgkM904EAWrQX1/wn3079usEV+qyaStHRPZPAF7SI=;
        b=qN59dOiGl7mesOCEpSrXQ60EaSajdmRqKNWvP2dAvQonOw0L8tXfnRSJx6eO0TNzoF
         HiKLb2CffDRDYudkoYCOsOX07pKgOexzU78auDQbqgVO+dn64OOZ4Uw2EQhQho7WK6hP
         4xrX0yJiBvQGEEYIxJqv7NoksoySq9Mn677OJTzTmJQ5CqPsjz0Wij8ZO5xMuZ6XBb0K
         xzgCHGUUnk0UH1fIg5NKVwjoyX0VSFvEgj9JzqCeDgGanKuard9c0dAIutiGUQYbimcS
         uf8n8EYeoZL7TlSyrLd4AS3J8SyIxl7jXi4u2yeRemkpylzwoFeUOcFoPpaiC0//i4CC
         tuoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794850729; x=1795455529;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=MZNgkM904EAWrQX1/wn3079usEV+qyaStHRPZPAF7SI=;
        b=ubbQiVVr1nrVizCPJR9orEc3mZyrpqm3nyFsgzkFANWVGqtvk1Q+hNVvstliQwfCJ/
         NU/2SGGi2eZi4TkSBk8mFU1madGiD33JsZH/4yVjMMYlSGYovpzTNqmdy7YSpYFcObPM
         YnYHaszAxHbhjrXBMUyJqPXAmTLOXDBVHE22zCgl0Kr1PAY7yfWzRs9XP5fJdNj7aYcQ
         TacMa+o86PFjJKOqdtzl6txau0/HBUseOyAFgQ72IeemVcTsg8+ddvITELyJ8nULAQ0x
         yMZJilFJFvBN3OJxTdyWi549jXccZNCAbE6eUMeMY3H20p39hlmjH5a9kiZjJTCZTJpq
         jsgQ==
X-Forwarded-Encrypted: i=1; AL+hErGAJzpwDz3Ef6Z429jZdpL5VhgniCU5DuL7FVcDF//5QbLc1uHXI0tQfRSbbHXc85yT9gczx4f/Nb8=@vger.kernel.org
X-Gm-Message-State: APuU4Z9SAJNU76jcU6CeqK837RQkcDmz5Ud9/oaWhCRtXNej4eAN/78J
	zZA7PJZRY4iQMd/hjC5cgm0PnD4p/Jt8hZBQhMNj6CMAn9LI9ftImcpC
X-Gm-Gg: AZFdTZcQZVG9sq6adsDw4kDQxeYvekXnMmH9N+eYcAGgZLTu3pqVQsvtWL1FOP3kiwP
	XiuqOLTh+fXWMHwJBaJ/NAQkG1qpaP0vKWiI4mM438RLhndzuADgh7LM86uDrdSLxcIeNQ01KI+
	HYJ4PKtOnfus7vLLl1v0Xdmgpu8p2o4MZ35MxK7XbMUpHG9sFn0QF3OgKNnofkej81JoH5Jsk8v
	Y8oHCSWVeztmy0UPtgg5Ceb/W3BC3VAzeZeDJzYWN3bFo3MNd9kEUBD1Ms/7ZIyLYRe/Yh3q01A
	d0CG6NmXPJmle8jM3jUPpBKD0sVKQn82gzKJWCrn81NkE/RqYuTxI4mUl7v9ATwzr8u+jvqwXTu
	33uKjk2oBZBgnR/aXrBFCNcOCYMmnFv23bEWk39jdGqTOF+mDDMlEXxPHgq93qW/qkx1qPxZsNW
	yebEE//nnEENGGzq5E78teuzPNVzVzEcKE788ANfDaGye/f/VNlMMoaNzy4MM94Rt2q3eNpFhYE
	YXkS74F4bkXYe5Nax/jOzo/90jC5wzpCC0WsXLc1Qz9gypAd+LRqhhHf1B2ZRVH9dZEJ7Lu4Xy0
	jm45QMqV
X-Received: by 2002:a05:7300:fd12:b0:369:a162:af96 with SMTP id 5a478bee46e88-379673164cbmr17174143eec.17.1794850729510;
        Mon, 16 Nov 2026 09:38:49 -0800 (PST)
Received: from eldorado ([2600:8802:b00:1f88::287])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-37955e0d966sm36635215eec.15.2026.11.16.09.38.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Nov 2026 09:38:48 -0800 (PST)
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
Subject: [PATCH v3 1/3] MIPS: SiByte: Wire up the CPU interrupt controller
Date: Mon, 16 Nov 2026 09:38:36 -0800
Message-ID: <20261116173843.911523-2-f.fainelli@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20261116173843.911523-1-f.fainelli@gmail.com>
References: <20261116173843.911523-1-f.fainelli@gmail.com>
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

