Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.131
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793260191;
	b=AQKss3Htzr3nzin5Muy4M+vuPjM/GyQyFdDxl5qVajNKsTVfaLFNG5HKK/8wpkMWZRxm
	 QLLlGeo8W7DGGiKzcl36dpqig7vK0y+Z7aS+PlAXFe0TxI7c+NnXDoCzF8+mFiR4ehXlO
	 Fm7VyKyFFTn5Jt/sf6zUB/dNgBs9PaCE+TdI3o6wpNQFMweZ9e2dJs+wk+bWDpWktrQHz
	 Xaebja9mM+tD75/NgX7QdpKRGKb3ResALMMrSiZUlmXTIqrcC8jhPmLIKxdP/71woiZ7z
	 uqnB6hwmCbtq9K0dFoEaRjRrj5eCK8TqDZbmauexJFwJib9f77nT0NernDtltNsoMLw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793260191;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-ID:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=yz8i4WKkbNXEG8JNojJIwkG6eD/QvdmFoULtZaxCats=;
	b=M01eojnS//TPpOk9oAEZ+PbjWmyDk7eBOoYMpoPsAyYNUjUD2Y2Oa8vcO4feHs3cMUVt
	 VZ19F9R9u5cruDKO0gk20zqQ3Q/U/1UDXkwW0KhvtbaT14YaGuLaWRbYtMiZO+623pzor
	 Ob1S8gzEvudxdFmfH2UyPi1fsSD7HPZve/jA5Fp0/oqXD2EyhIK8nrTuFwDaISsB96lIb
	 zu/TRUponwEKBkpwBYjvxO/wXek/rOBLMcSNQ+rt0lILINGzXlDfgRBqMPznClDLnHUpL
	 nA2Wm2dRtLISWclNWQFKyc7nCDbmt75t6cPZCNzPURiYN3/bRezkOZXF3HMRv/AhWfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=bytedance.com;
	spf=pass smtp.mailfrom=bytedance.com;
	dkim=pass header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b="JQEhOH/A";
	arc=none smtp.remote-ip=74.125.227.131
Received: from mail-pj2-f3.google.com (mail-pj2-f3.google.com [74.125.227.131])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4866606A325
	for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 07:49:50 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4866606A325
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=bytedance.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=bytedance.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=JQEhOH/A
Received: by mail-pj2-f3.google.com with SMTP id d9443c01a7336-2e831901331so14382155ad.1
        for <linux-doc@vger.kernel.org>; Thu, 29 Oct 2026 00:49:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793260190; x=1793864990; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=yz8i4WKkbNXEG8JNojJIwkG6eD/QvdmFoULtZaxCats=;
        b=JQEhOH/AcH+D00whwk5YV2SCmCAIr9A4mreKRfPCO+U5z1fI+gJYKPW0nXRB+YW4/M
         wFL7MFo5HR0p5w8cXZ36ka+3r39vzeOeGlTLOJzCkuuN602PMe5ohvO1hc1tar0cBIg3
         R2GZ7e/eDg/0UyBvCQyU8bN8kn8Vpu43pZRnlyxH6BYbdGIRLCAS3dj4qr1iQgvkoCr6
         ZchzgXu8aKR1VASXb2XRLqKHmWjt9INRnP+y1NGDluZ6jv249/+ml5scLncR3LhI7SrZ
         9jP25OeZzxQz4gLvPigG25eeQwHoQFzXZHy8OIXdIyBuWKpRIR3RSSzUlZyvqxd1h8+T
         LMSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793260190; x=1793864990;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=yz8i4WKkbNXEG8JNojJIwkG6eD/QvdmFoULtZaxCats=;
        b=nSBceuduukfq05IJ7jC6vELqPfOj+zaLjtNtpZpUBEA3HCatHNBT0kErTx2nu8mUQJ
         QrhIHHVF6FiUS8cN6G7oAt5KRUS5r4PxsBbrVNya0r9kMp5+L6Dh3wHpcOS/6ISkjvL6
         zjeS0Nf815WOl71kXnwamtBXqj5/uHnCGT+OqKfurreKW5AiRguaR9Pc6F+hWegrx2om
         jCYy2Iiv26QG4jwcGYbNeO8V64aW42WyHbXvM1LTRRm+Qc81hErocuJMiYrfPp2ZTq16
         BLcabiCiJC/xKCJtqVAAPcUU+QW0HiQfMObx4sMTyZF45CVa+TbsWLnrJosIAdE8/jUu
         0EKA==
X-Forwarded-Encrypted: i=1; AKwUvBwGnxZkRAs/aJA8djLfWk8Y6J7kHbcmYs5AxQmVoU/v4gkQdsysVcmyCqk+0TXi44DzaomIVjVzxwY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJYnROzNqYjUy0oRoF21H5WV91t3jj4MjrW7eFYj6yn3hbJqVbr
	bYk1S9ug21XPO2l+yo3DdldnOEEowGM6zBQBaFTX8Icv7GSJLBnsx3arKI8YGkqkz/0=
X-Gm-Gg: AYBFou13HsSj+++wqsF8ZC6ZPOy+/ha0pwZecVzzX7gmU8KUvFCzPlCFk89WL0g7Ld9
	R40Nsl/JWYdG0Y0fqJkyUjq8TPioqk6oEPuQCcBITPLt+CvvtkHUhugPQzNa+nNknin83ueTyF+
	Cz24MSrdv3P8L1Kz9BMDjRj2Z48cm+hnqzqZVQs3vaz13IJxyXqLtSJuc9iWUcgUwwaI+jOmTKx
	sHGqNDOyXNo4A6wW6daR8YUERM19twAGaI4fIhhf4jtB8OSsRNo46VnviSG/EuyiwT4OpOZ1zB5
	e1MFX0ykbe5Xm9GGonzIwsoa5YxedAlUhRHqNVPxfAnIsF6Sz3QI9wot+FNVUQNYbVK0tOvupny
	D2GCLUXJi41izjZ/L9jO73tVjQr7Lir+OUfjsiN6/3mfT8BpQUfDSNsOwR8j2t2zdVuQFpBA48u
	1LU+kilH3eHIGye+bVWzblWsxGT5KTChWPIXp+uU7wp9Eb77yfpf/ZYGUAgr69LaKyzTIknv38t
	b4EbVkMrqKBUNRgCSCoZ46BYTNCIe0sL7jYnlzKcxLBy6RdjhSbdfqtv7Q0fZHEGz3cxzV6xzSJ
	+u3yGozlfSs/f7M8j2L02laZsS42DG6olZTDUxCUbmoG9bh1owo9zuOXD4DA6sFpNjcSzXNQssa
	weTRScm4=
X-Received: by 2002:a17:902:f691:b0:2e9:5eee:e071 with SMTP id d9443c01a7336-2eb00587616mr45487815ad.57.1793260189931;
        Thu, 29 Oct 2026 00:49:49 -0700 (PDT)
Received: from FJ7FR2JRQ3.bytedance.net ([186.240.245.239])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eae6bd60desm30598915ad.29.2026.10.29.00.49.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 29 Oct 2026 00:49:49 -0700 (PDT)
From: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
To: Paul Walmsley <pjw@kernel.org>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Alexandre Ghiti <alex@ghiti.fr>,
	Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>,
	Conor Dooley <conor@kernel.org>,
	Anup Patel <anup.patel@oss.qualcomm.com>
Cc: =?UTF-8?q?Cl=C3=A9ment=20L=C3=A9ger?= <cleger@rivosinc.com>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Atish Patra <atish.patra@linux.dev>,
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
	Will Deacon <will@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Randy Dunlap <rdunlap@infradead.org>,
	Shuah Khan <shuah@kernel.org>,
	yuanzhu@bytedance.com,
	yang.yicong@picoheart.com,
	yang.susheng@zte.com.cn,
	linux-riscv@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-perf-users@vger.kernel.org,
	linux-doc@vger.kernel.org,
	linux-kselftest@vger.kernel.org,
	Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
Subject: [PATCH v12 03/11] riscv: sse: mask events during shutdown and kexec
Date: Thu, 29 Oct 2026 15:48:45 +0800
Message-ID: <20261029074853.35467-4-zhangzhanpeng.jasper@bytedance.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20261029074853.35467-1-zhangzhanpeng.jasper@bytedance.com>
References: <20261029074853.35467-1-zhangzhanpeng.jasper@bytedance.com>
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

SSE delivery is independent of normal S-mode interrupts. Firmware may also
retain an event registration until Linux explicitly unregisters it. A hart
must therefore stop accepting SSE events before Linux stops servicing the
registered handler.

Mask SSE on the local hart before panic stop, CPU stop, restart, poweroff,
and crash shutdown paths. This prevents firmware from entering Linux-owned
handler state after the corresponding CPU or kernel context is no longer
valid.

A crash kernel cannot identify or take ownership of registrations
inherited from the crashed kernel. Reject a later normal kexec while such
SSE state may still exist, rather than transferring unknown firmware state
to another kernel.

The restriction is deliberately based on firmware SSE availability, not
CONFIG_RISCV_SBI_SSE or registrations made by the crash kernel. Disabling
SSE in the crash kernel does not establish that registrations left by the
crashed kernel are absent. Consequently, normal kexec from a crash kernel
is also rejected when firmware advertises SSE but no registrations were
actually left behind. This conservative restriction remains until a safe
way to establish or clear inherited firmware state is available.

Link: https://lore.kernel.org/r/as7-3PbWDxygadnJ@hu-himchau-blr.qualcomm.com/
Reviewed-by: Himanshu Chauhan <himanshu.chauhan@oss.qualcomm.com>
Signed-off-by: Zhanpeng Zhang <zhangzhanpeng.jasper@bytedance.com>
---
 arch/riscv/kernel/machine_kexec.c | 11 +++++++++++
 arch/riscv/kernel/reset.c         | 18 ++++++++++++++++++
 arch/riscv/kernel/smp.c           | 17 +++++++++++++++++
 3 files changed, 46 insertions(+)

diff --git a/arch/riscv/kernel/machine_kexec.c b/arch/riscv/kernel/machine_kexec.c
index 738df176ff6..24e7affae70 100644
--- a/arch/riscv/kernel/machine_kexec.c
+++ b/arch/riscv/kernel/machine_kexec.c
@@ -14,10 +14,13 @@
 #include <asm/set_memory.h>	/* For set_memory_x() */
 #include <linux/compiler.h>	/* For unreachable() */
 #include <linux/cpu.h>		/* For cpu_down() */
+#include <linux/crash_dump.h>
 #include <linux/reboot.h>
 #include <linux/interrupt.h>
 #include <linux/irq.h>
 
+#include <asm/sse.h>
+
 /*
  * machine_kexec_prepare - Initialize kexec
  *
@@ -36,6 +39,13 @@ machine_kexec_prepare(struct kimage *image)
 	unsigned int control_code_buffer_sz = 0;
 	int i = 0;
 
+	/* A crash kernel cannot tear down registrations inherited from firmware. */
+	if (is_kdump_kernel() && image->type != KEXEC_TYPE_CRASH &&
+	    riscv_sse_available()) {
+		pr_err("Normal kexec from a crash kernel is unsupported with SSE\n");
+		return -EOPNOTSUPP;
+	}
+
 	/* Find the Flattened Device Tree and save its physical address */
 	for (i = 0; i < image->nr_segments; i++) {
 		if (image->segment[i].memsz <= sizeof(fdt))
@@ -127,6 +137,7 @@ void
 machine_crash_shutdown(struct pt_regs *regs)
 {
 	local_irq_disable();
+	riscv_sse_mask_current_hart();
 
 	/* shutdown non-crashing cpus */
 	crash_smp_send_stop();
diff --git a/arch/riscv/kernel/reset.c b/arch/riscv/kernel/reset.c
index 14eb08a6db8..fdab37e7ae5 100644
--- a/arch/riscv/kernel/reset.c
+++ b/arch/riscv/kernel/reset.c
@@ -6,6 +6,20 @@
 #include <linux/efi.h>
 #include <linux/reboot.h>
 #include <linux/pm.h>
+#include <linux/smp.h>
+
+#include <asm/sse.h>
+
+#ifndef CONFIG_SMP
+void __noreturn panic_smp_self_stop(void)
+{
+	riscv_sse_mask_current_hart();
+	local_irq_disable();
+
+	for (;;)
+		cpu_relax();
+}
+#endif
 
 static void __noreturn default_power_off(void)
 {
@@ -18,6 +32,8 @@ EXPORT_SYMBOL(pm_power_off);
 
 void machine_restart(char *cmd)
 {
+	riscv_sse_mask_current_hart();
+
 	/*
 	 * UpdateCapsule() depends on the system being reset via ResetSystem().
 	 */
@@ -30,12 +46,14 @@ void machine_restart(char *cmd)
 
 void machine_halt(void)
 {
+	riscv_sse_mask_current_hart();
 	do_kernel_power_off();
 	default_power_off();
 }
 
 void machine_power_off(void)
 {
+	riscv_sse_mask_current_hart();
 	do_kernel_power_off();
 	default_power_off();
 }
diff --git a/arch/riscv/kernel/smp.c b/arch/riscv/kernel/smp.c
index eddbc3ad06c..9ad38df4827 100644
--- a/arch/riscv/kernel/smp.c
+++ b/arch/riscv/kernel/smp.c
@@ -22,10 +22,13 @@
 #include <linux/irq.h>
 #include <linux/irq_work.h>
 #include <linux/nmi.h>
+#include <linux/panic.h>
 
 #include <asm/tlbflush.h>
 #include <asm/cacheflush.h>
 #include <asm/cpu_ops.h>
+#include <asm/sbi.h>
+#include <asm/sse.h>
 
 enum ipi_message_type {
 	IPI_RESCHEDULE,
@@ -78,8 +81,18 @@ int riscv_hartid_to_cpuid(unsigned long hartid)
 	return -ENOENT;
 }
 
+void __noreturn panic_smp_self_stop(void)
+{
+	riscv_sse_mask_current_hart();
+	local_irq_disable();
+
+	for (;;)
+		cpu_relax();
+}
+
 static void ipi_stop(void)
 {
+	riscv_sse_mask_current_hart();
 	set_cpu_online(smp_processor_id(), false);
 	while (1)
 		wait_for_interrupt();
@@ -90,6 +103,7 @@ static atomic_t waiting_for_crash_ipi = ATOMIC_INIT(0);
 
 static inline void ipi_cpu_crash_stop(unsigned int cpu, struct pt_regs *regs)
 {
+	riscv_sse_mask_current_hart();
 	crash_save_cpu(regs, cpu);
 
 	atomic_dec(&waiting_for_crash_ipi);
@@ -253,6 +267,8 @@ void smp_send_stop(void)
 {
 	unsigned long timeout;
 
+	riscv_sse_mask_current_hart();
+
 	if (num_online_cpus() > 1) {
 		cpumask_t mask;
 
@@ -300,6 +316,7 @@ void crash_smp_send_stop(void)
 		return;
 
 	cpus_stopped = 1;
+	riscv_sse_mask_current_hart();
 
 	/*
 	 * If this cpu is the only one alive at this point in time, online or
-- 
2.50.1 (Apple Git-155)

