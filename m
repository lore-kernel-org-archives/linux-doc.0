Received: from pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com (pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com [52.34.181.151])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57D5537AA8B;
	Mon,  2 Feb 2026 17:48:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=52.34.181.151
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770054498; cv=none; b=pR9nElZIhRuckEoA4fn+Eq+C9pHNZxtq7ghrIjPrl/iD3Erx+w9PIrhiqUJDZz0tJn6SPJIIEHAhIOE6EorZmchf7N6OC2zCd28O44IJORT8GFS2hMsXaRt07xjpyTs2mK/kOiryovVlRQ0rv2IvkhtnP+tyGydkvL/oQ4ILClk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770054498; c=relaxed/simple;
	bh=LDXlZbhcHzESUpJZTEFiCCo3F9zJkDAm/h41wDzx4hI=;
	h=From:To:CC:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version:Content-Type; b=DvMf//t56MS3lTIJe3R5hVUk+i0fdw9GhQPfI8VS6EnaywLb69pG8qHml+MgjiaSzMWu5PQJUxMooILEhpFndPog+FaUDz3dHBhPgsP0ToC2T1S9oqMwf91EWMqTLjksStrQeoAUqaNZwqPHRrYulCEw+5DNkA5sXc9/53ZaV/s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com; spf=pass smtp.mailfrom=amazon.de; dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b=ckLcblxa; arc=none smtp.client-ip=52.34.181.151
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amazon.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=amazon.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=amazon.com header.i=@amazon.com header.b="ckLcblxa"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=amazon.com; i=@amazon.com; q=dns/txt; s=amazoncorp2;
  t=1770054496; x=1801590496;
  h=from:to:cc:subject:date:message-id:in-reply-to:
   references:mime-version:content-transfer-encoding;
  bh=Vgpe/BvcFC++31xibFWAA9JgqIAQo9NJE3AR8mzzpS0=;
  b=ckLcblxaoV57YJzgzbxABFozPYfHqoC1EeIV3i/07ZQWZmWtqL/NOLHp
   kqQicOtAv/ICycH050J2SVekS1nPqFrI22S3l0L1qF2/O3ELxwa5PdkDA
   mkhilbMjVLAiAr0W40LaAr/OzNkP9yTl7kDRivzZ0YoIc36QwAuBKmikn
   cSJC+1w9GgE+WLBSldqBZv+Kn+CLRqDhNGecEUrLyAuHkGB5DBs6Rv72O
   MkPEFX4lMnkoutuBhYDay8uEX3Ucf0U6IY7wMGALNUCZsOk06x8KKR/ju
   LE7rjB/fdnPE+BiM2c0rloG9qgsgj7+ddPQoMFiSlVZIkOFueI2QRavAE
   Q==;
X-CSE-ConnectionGUID: u1/mTSaQQwSYWcmiilCfUg==
X-CSE-MsgGUID: JYU36IqIQw2sBhPaKXMYxQ==
X-IronPort-AV: E=Sophos;i="6.21,269,1763424000"; 
   d="scan'208";a="12112951"
Received: from ip-10-5-9-48.us-west-2.compute.internal (HELO smtpout.naws.us-west-2.prod.farcaster.email.amazon.dev) ([10.5.9.48])
  by internal-pdx-out-007.esa.us-west-2.outbound.mail-perimeter.amazon.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Feb 2026 17:48:15 +0000
Received: from EX19MTAUWB001.ant.amazon.com [205.251.233.51:12412]
 by smtpin.naws.us-west-2.prod.farcaster.email.amazon.dev [10.0.53.147:2525] with esmtp (Farcaster)
 id aa613201-4a2c-4ac2-a77e-adc4a43a9d55; Mon, 2 Feb 2026 17:48:14 +0000 (UTC)
X-Farcaster-Flow-ID: aa613201-4a2c-4ac2-a77e-adc4a43a9d55
Received: from EX19D020UWC004.ant.amazon.com (10.13.138.149) by
 EX19MTAUWB001.ant.amazon.com (10.250.64.248) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Mon, 2 Feb 2026 17:48:14 +0000
Received: from ip-10-253-83-51.amazon.com (172.19.99.218) by
 EX19D020UWC004.ant.amazon.com (10.13.138.149) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA) id 15.2.2562.35;
 Mon, 2 Feb 2026 17:48:10 +0000
From: Alexander Graf <graf@amazon.com>
To: <x86@kernel.org>
CC: <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>, "Clemens
 Ladisch" <clemens@ladisch.de>, Arnd Bergmann <arnd@arndb.de>, "Greg
 Kroah-Hartman" <gregkh@linuxfoundation.org>, Dave Hansen
	<dave.hansen@linux.intel.com>, Borislav Petkov <bp@alien8.de>, Ingo Molnar
	<mingo@redhat.com>, Thomas Gleixner <tglx@kernel.org>, Jonathan Corbet
	<corbet@lwn.net>, Paolo Bonzini <pbonzini@redhat.com>, Pasha Tatashin
	<pasha.tatashin@soleen.com>, <nh-open-source@amazon.com>, "Nicolas Saenz
 Julienne" <nsaenz@amazon.es>, Hendrik Borghorst <hborghor@amazon.de>, Filippo
 Sironi <sironi@amazon.de>, David Woodhouse <dwmw@amazon.co.uk>,
	=?UTF-8?q?Jan=20Sch=C3=B6nherr?= <jschoenh@amazon.de>
Subject: [PATCH 2/2] hpet: Add HPET-based NMI watchdog support
Date: Mon, 2 Feb 2026 17:48:03 +0000
Message-ID: <20260202174803.66640-3-graf@amazon.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260202174803.66640-1-graf@amazon.com>
References: <20260202174803.66640-1-graf@amazon.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
X-ClientProxiedBy: EX19D041UWA003.ant.amazon.com (10.13.139.105) To
 EX19D020UWC004.ant.amazon.com (10.13.138.149)
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit

The traditional NMI watchdog timer uses performance counters to trigger
periodic NMIs. But performance counters are a scarce resource that are
best used for actual performance counting. However, the HPET is another
timer source on most modern x86 systems that can inject NMI interrupts.

Add support for using HPET timer as NMI watchdog source instead of
performance counters. This frees up a PMC for profiling use.

Unlike with the PMU based watchdog where we trigger a per-CPU NMI, APIC
based interrupt descriptors can only target either a specific CPU or
perform a broadcast on all CPUs. To not run into races and allow for
CPU hotplug, the NMI watchdog switches between CPU 0 and broadcast modes
based on whether all CPUs are up or not.

The HPET watchdog always uses IO-APIC line 2. This line is
architecturally defined as the PIT source on PCs and hence always
available as long as we disable the PIT (which we do). We could in
theory try to find a vacant GSI line, but in practice that would create
a big dependency chain on ACPI which I would rather avoid for now.

The implementation uses the standard HARDLOCKUP_DETECTOR_ARCH
infrastructure, following the same pattern as powerpc's arch-specific
hardlockup detector.

With this watchdog present, I can successfully capture system lockups,
verified by adding "local_irq_disable(); while(1) {}" into
mount_root_generic().

(Disclaimer: Some of this code was written with the help of Kiro, an AI
coding assistant)

Signed-off-by: Alexander Graf <graf@amazon.com>
---
 .../admin-guide/kernel-parameters.txt         |   5 +-
 arch/x86/Kconfig                              |  19 ++
 arch/x86/kernel/hpet.c                        | 208 ++++++++++++++++++
 arch/x86/kernel/i8253.c                       |   9 +
 drivers/char/hpet.c                           |   3 +
 include/linux/hpet.h                          |  14 ++
 6 files changed, 257 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 1058f2a6d6a8..c6a98812a896 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -2045,11 +2045,14 @@ Kernel parameters
 
 	hpet=		[X86-32,HPET] option to control HPET usage
 			Format: { enable (default) | disable | force |
-				verbose }
+				verbose | watchdog }
 			disable: disable HPET and use PIT instead
 			force: allow force enabled of undocumented chips (ICH4,
 				VIA, nVidia)
 			verbose: show contents of HPET registers during setup
+			watchdog: use HPET timer as NMI watchdog source instead
+				of performance counters. Use nmi_watchdog=1 to enable
+				or nmi_watchdog=panic to panic on hard lockup detection.
 
 	hpet_mmap=	[X86, HPET_MMAP] Allow userspace to mmap HPET
 			registers.  Default set by CONFIG_HPET_MMAP_DEFAULT.
diff --git a/arch/x86/Kconfig b/arch/x86/Kconfig
index 80527299f859..e8873218a803 100644
--- a/arch/x86/Kconfig
+++ b/arch/x86/Kconfig
@@ -948,6 +948,25 @@ config HPET_EMULATE_RTC
 	def_bool y
 	depends on HPET_TIMER && (RTC_DRV_CMOS=m || RTC_DRV_CMOS=y)
 
+config HARDLOCKUP_DETECTOR_HPET
+	bool "Use HPET for NMI watchdog"
+	depends on HPET_TIMER
+	select HAVE_HARDLOCKUP_DETECTOR_ARCH
+	select HARDLOCKUP_DETECTOR_COUNTS_HRTIMER
+	help
+	  Use HPET timer as NMI source instead of performance counters.
+	  This frees up a performance counter for profiling.
+	  Enable with hpet=watchdog kernel parameter.
+
+config HARDLOCKUP_DETECTOR_HPET_DEFAULT
+	bool "Enable HPET watchdog by default"
+	depends on HARDLOCKUP_DETECTOR_HPET
+	help
+	  Say Y here to enable HPET-based NMI watchdog by default without
+	  requiring the hpet=watchdog kernel parameter.
+
+	  If unsure, say N.
+
 # Mark as expert because too many people got it wrong.
 # The code disables itself when not needed.
 config DMI
diff --git a/arch/x86/kernel/hpet.c b/arch/x86/kernel/hpet.c
index d6387dde3ff9..c9114997c383 100644
--- a/arch/x86/kernel/hpet.c
+++ b/arch/x86/kernel/hpet.c
@@ -6,9 +6,12 @@
 #include <linux/hpet.h>
 #include <linux/cpu.h>
 #include <linux/irq.h>
+#include <linux/nmi.h>
+#include <linux/syscore_ops.h>
 
 #include <asm/cpuid/api.h>
 #include <asm/irq_remapping.h>
+#include <asm/io_apic.h>
 #include <asm/hpet.h>
 #include <asm/time.h>
 #include <asm/mwait.h>
@@ -100,6 +103,8 @@ static inline void hpet_clear_mapping(void)
 /*
  * HPET command line enable / disable
  */
+static bool hpet_watchdog_mode = IS_ENABLED(CONFIG_HARDLOCKUP_DETECTOR_HPET_DEFAULT);
+
 static int __init hpet_setup(char *str)
 {
 	while (str) {
@@ -113,6 +118,8 @@ static int __init hpet_setup(char *str)
 			hpet_force_user = true;
 		if (!strncmp("verbose", str, 7))
 			hpet_verbose = true;
+		if (!strncmp("watchdog", str, 8))
+			hpet_watchdog_mode = true;
 		str = next;
 	}
 	return 1;
@@ -985,6 +992,200 @@ static bool __init hpet_is_pc10_damaged(void)
 	return true;
 }
 
+#ifdef CONFIG_HARDLOCKUP_DETECTOR_HPET
+/*
+ * HPET watchdog uses timer 0 routed to GSI 2 (legacy PIT IRQ line).
+ * When using HPET as watchdog, we repurpose this line for NMI delivery.
+ */
+#define HPET_WD_TIMER	0
+#define HPET_WD_GSI	2
+
+bool hpet_watchdog_initialized;
+static bool hpet_watchdog_ioapic_configured;
+static DEFINE_PER_CPU(u32, hpet_watchdog_next_tick);
+
+static int hpet_nmi_handler(unsigned int cmd, struct pt_regs *regs)
+{
+	u32 now, next, delta;
+
+	if (panic_in_progress())
+		return NMI_HANDLED;
+
+	/* Check if this NMI is from our HPET timer by comparing counter value */
+	now = hpet_readl(HPET_COUNTER);
+	next = __this_cpu_read(hpet_watchdog_next_tick);
+	delta = hpet_freq * watchdog_thresh;
+
+	/*
+	 * If we have a next tick set and counter hasn't reached it yet,
+	 * this NMI is not from our timer. Allow some tolerance for timing.
+	 */
+	if (next && (s32)(now - next) < -(s32)(delta / 4))
+		return NMI_DONE;
+
+	/* Update next expected tick */
+	__this_cpu_write(hpet_watchdog_next_tick, now + delta);
+
+	watchdog_hardlockup_check(smp_processor_id(), regs);
+
+	return NMI_HANDLED;
+}
+
+/*
+ * On suspend, clear the configured flag so that the first CPU to come
+ * online after resume will reconfigure the HPET timer and IO-APIC.
+ *
+ * We don't need to explicitly disable the watchdog here because:
+ * 1. The HPET registers are reset by the hibernation/suspend process anyway
+ * 2. The IO-APIC state is saved/restored by ioapic_syscore_ops, but we
+ *    need to reconfigure it for NMI delivery after resume
+ * 3. Secondary CPUs are offlined before suspend, so we can't broadcast
+ *    NMIs until they're back online - the enable callback handles this
+ */
+static int hpet_watchdog_suspend(void *data)
+{
+	hpet_watchdog_ioapic_configured = false;
+	return 0;
+}
+
+static const struct syscore_ops hpet_watchdog_syscore_ops = {
+	.suspend = hpet_watchdog_suspend,
+};
+
+static struct syscore hpet_watchdog_syscore = {
+	.ops = &hpet_watchdog_syscore_ops,
+};
+
+static int __init hpet_watchdog_init(u32 channels)
+{
+	u32 cfg, i, route_cap;
+
+	if (channels <= HPET_WD_TIMER)
+		return 0;
+
+	/* Verify GSI 2 is available in the route capability bitmap */
+	route_cap = hpet_readl(HPET_Tn_CFG(HPET_WD_TIMER) + 4);
+	if (!(route_cap & (1 << HPET_WD_GSI))) {
+		pr_info("HPET timer 0 cannot route to GSI %d\n", HPET_WD_GSI);
+		return 0;
+	}
+
+	/* Deactivate all timers */
+	for (i = 0; i < channels; i++) {
+		cfg = hpet_readl(HPET_Tn_CFG(i));
+		cfg &= ~(HPET_TN_ENABLE | HPET_TN_LEVEL | HPET_TN_FSB);
+		hpet_writel(cfg, HPET_Tn_CFG(i));
+	}
+
+	/* Configure HPET timer for periodic mode */
+	cfg = hpet_readl(HPET_Tn_CFG(HPET_WD_TIMER));
+	cfg &= ~(HPET_TN_ENABLE | HPET_TN_FSB);
+	cfg |= HPET_TN_PERIODIC | HPET_TN_32BIT | HPET_TN_SETVAL | HPET_TN_LEVEL;
+	hpet_writel(cfg, HPET_Tn_CFG(HPET_WD_TIMER));
+
+	/* Route HPET timer to the GSI */
+	cfg = hpet_readl(HPET_Tn_CFG(HPET_WD_TIMER));
+	cfg &= ~(Tn_INT_ROUTE_CNF_MASK | HPET_CFG_ENABLE);
+	cfg |= (HPET_WD_GSI << Tn_INT_ROUTE_CNF_SHIFT) & Tn_INT_ROUTE_CNF_MASK;
+	hpet_writel(cfg, HPET_Tn_CFG(HPET_WD_TIMER));
+
+	if (register_nmi_handler(NMI_LOCAL, hpet_nmi_handler, 0, "hpet_watchdog")) {
+		pr_err("Failed to register NMI_LOCAL handler\n");
+		return 0;
+	}
+	if (register_nmi_handler(NMI_UNKNOWN, hpet_nmi_handler, 0, "hpet_watchdog")) {
+		unregister_nmi_handler(NMI_LOCAL, "hpet_watchdog");
+		pr_err("Failed to register NMI_UNKNOWN handler\n");
+		return 0;
+	}
+
+	hpet_start_counter();
+
+	hpet_watchdog_initialized = true;
+
+	register_syscore(&hpet_watchdog_syscore);
+
+	pr_info("HPET watchdog initialized on timer %d, GSI %d", HPET_WD_TIMER, HPET_WD_GSI);
+
+	return 0;
+}
+
+void watchdog_hardlockup_stop(void)
+{
+	u32 cfg;
+
+	if (!hpet_watchdog_initialized)
+		return;
+
+	cfg = hpet_readl(HPET_Tn_CFG(HPET_WD_TIMER));
+	cfg &= ~HPET_TN_ENABLE;
+	hpet_writel(cfg, HPET_Tn_CFG(HPET_WD_TIMER));
+}
+
+void watchdog_hardlockup_start(void)
+{
+	u32 cfg, delta;
+
+	if (!hpet_watchdog_initialized)
+		return;
+
+	if (!hpet_watchdog_ioapic_configured) {
+		if (ioapic_set_nmi(HPET_WD_GSI, false)) {
+			pr_err("Unable to configure IO-APIC for NMI\n");
+			return;
+		}
+		hpet_watchdog_ioapic_configured = true;
+	}
+
+	delta = hpet_freq * watchdog_thresh;
+
+	cfg = hpet_readl(HPET_Tn_CFG(HPET_WD_TIMER));
+	cfg &= ~(HPET_TN_ENABLE | HPET_TN_FSB | HPET_TN_LEVEL);
+	cfg |= HPET_TN_PERIODIC | HPET_TN_32BIT | HPET_TN_SETVAL;
+	hpet_writel(cfg, HPET_Tn_CFG(HPET_WD_TIMER));
+
+	/* Write twice for AMD 81xx with buggy HPET */
+	hpet_writel(delta, HPET_Tn_CMP(HPET_WD_TIMER));
+	hpet_writel(delta, HPET_Tn_CMP(HPET_WD_TIMER));
+
+	cfg |= HPET_TN_ENABLE;
+	hpet_writel(cfg, HPET_Tn_CFG(HPET_WD_TIMER));
+}
+
+void watchdog_hardlockup_enable(unsigned int cpu)
+{
+	if (!hpet_watchdog_ioapic_configured) {
+		/*
+		 * First CPU online after resume - reconfigure HPET timer.
+		 * This also sets hpet_watchdog_ioapic_configured = true.
+		 */
+		watchdog_hardlockup_start();
+	}
+
+	if (num_online_cpus() == num_present_cpus()) {
+		ioapic_set_nmi(HPET_WD_GSI, true);
+		pr_info("switched to broadcast mode (all %d CPUs online)\n",
+			num_online_cpus());
+	}
+}
+
+void watchdog_hardlockup_disable(unsigned int cpu)
+{
+	if (num_online_cpus() < num_present_cpus()) {
+		ioapic_set_nmi(HPET_WD_GSI, false);
+		pr_info("switched to CPU 0 only (%d CPUs online)\n",
+			num_online_cpus() - 1);
+	}
+}
+
+int __init watchdog_hardlockup_probe(void)
+{
+	return hpet_watchdog_mode ? 0 : -ENODEV;
+}
+#else
+static inline int hpet_watchdog_init(u32 channels) { return 0; }
+#endif /* CONFIG_HARDLOCKUP_DETECTOR_HPET */
+
 /**
  * hpet_enable - Try to setup the HPET timer. Returns 1 on success.
  */
@@ -1031,6 +1232,10 @@ int __init hpet_enable(void)
 	/* This is the HPET channel number which is zero based */
 	channels = ((id & HPET_ID_NUMBER) >> HPET_ID_NUMBER_SHIFT) + 1;
 
+	/* If watchdog mode, hand off to watchdog driver */
+	if (hpet_watchdog_mode)
+		return hpet_watchdog_init(channels);
+
 	/*
 	 * The legacy routing mode needs at least two channels, tick timer
 	 * and the rtc emulation channel.
@@ -1122,6 +1327,9 @@ static __init int hpet_late_init(void)
 {
 	int ret;
 
+	if (hpet_is_watchdog())
+		return -ENODEV;
+
 	if (!hpet_address) {
 		if (!force_hpet_address)
 			return -ENODEV;
diff --git a/arch/x86/kernel/i8253.c b/arch/x86/kernel/i8253.c
index cb9852ad6098..36dd948371a4 100644
--- a/arch/x86/kernel/i8253.c
+++ b/arch/x86/kernel/i8253.c
@@ -7,6 +7,7 @@
 #include <linux/init.h>
 #include <linux/timex.h>
 #include <linux/i8253.h>
+#include <linux/hpet.h>
 
 #include <asm/hypervisor.h>
 #include <asm/apic.h>
@@ -31,6 +32,14 @@ struct clock_event_device *global_clock_event;
  */
 static bool __init use_pit(void)
 {
+	if (hpet_is_watchdog()) {
+		/*
+		 * The PIT overlaps the HPET IRQ line which we configure to
+		 * NMI in watchdog mode, rendering the PIT non functional.
+		 */
+		return false;
+	}
+
 	if (!IS_ENABLED(CONFIG_X86_TSC) || !boot_cpu_has(X86_FEATURE_TSC))
 		return true;
 
diff --git a/drivers/char/hpet.c b/drivers/char/hpet.c
index 4f5ccd3a1f56..9d9e4d22ab7f 100644
--- a/drivers/char/hpet.c
+++ b/drivers/char/hpet.c
@@ -977,6 +977,9 @@ static int hpet_acpi_add(struct acpi_device *device)
 	acpi_status result;
 	struct hpet_data data;
 
+	if (hpet_is_watchdog())
+		return -ENODEV;
+
 	memset(&data, 0, sizeof(data));
 
 	result =
diff --git a/include/linux/hpet.h b/include/linux/hpet.h
index 21e69eaf7a36..408b440163cc 100644
--- a/include/linux/hpet.h
+++ b/include/linux/hpet.h
@@ -108,4 +108,18 @@ static inline void hpet_reserve_timer(struct hpet_data *hd, int timer)
 
 int hpet_alloc(struct hpet_data *);
 
+#ifdef CONFIG_HARDLOCKUP_DETECTOR_HPET
+extern bool hpet_watchdog_initialized;
+
+static inline bool hpet_is_watchdog(void)
+{
+	return hpet_watchdog_initialized;
+}
+#else
+static inline bool hpet_is_watchdog(void)
+{
+	return false;
+}
+#endif
+
 #endif				/* !__HPET__ */
-- 
2.47.1




Amazon Web Services Development Center Germany GmbH
Tamara-Danz-Str. 13
10243 Berlin
Geschaeftsfuehrung: Christof Hellmis, Andreas Stieger
Eingetragen am Amtsgericht Charlottenburg unter HRB 257764 B
Sitz: Berlin
Ust-ID: DE 365 538 597

