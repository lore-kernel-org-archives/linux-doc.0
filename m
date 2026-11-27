Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795761558;
	b=vTjt843z6IAHwZbB3vGEqwPZQBIQFtEyHyUL++8J9vR8A2hiwlIFxzX7MH05sPHu3XdZ
	 SUNgktyMecAkg7HvNkHWuexezyeP96TRQl7hx1TRLxNRXPQFGw4/bTWx7zhmn6s6wlZnE
	 zNmarSmn1Rq9n6pWiVN9s/F4OBm4M6+G2QwpatgIJhj1eMJg9UWe0MXJuNhjY3ZtLQRTl
	 PG1stm4JCmznU+oC8gaCXOwN0wvf0Ey5gFkhjNUT0fjmzZNL0CGNiXQAwY7imGvyxY5WZ
	 qJod3l+x4NT2bB8ZvCUq4MY3GlGBf93hjnUnfaAGaQfPg2Fr/Uj04773hwnXwDsSQEQ==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795761558;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=rWMp0RZgvnnYmHR76LXWmpYYURibs72iO4Pe9ZHYHMk=;
	b=sAnk65VOUWY9BM+DWdZ9mrWJ5DnC9a04KA4fiPVNdrkZlaCJK7gmNRGGyVEVUz8M6tq1
	 mtd+BF3Kx+omF6/xByJz4OkGoHvYsqaeM1cvfdyhCadKCwPNFrbiF1U7oPgRtz9w74Lfa
	 6/csftRkAMkCpi8OLBAltk++Y1J7WBsqwa1q/X4K+Pv5gLqq+cLzBqyKlkUYXrUqC2He3
	 shWxC5xLQhA8Q5IdSLbiiTdSeRKfqkmE4CqwNOv+7FiKD0XBruccjuxAvso2XdeTqvvBd
	 Idzp417PcpRNgoHKqDz3/NDkWM9dG577uvEarr2F5+JvL4XJW16PIVFVVwPJPAjnTiw==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Uf0+sb25;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 26CA6606A31C;
	Fri, 27 Nov 2026 06:39:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=Uf0+sb25
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795761557;
	b=OTcaJMlRoexeCt9NXtc06zNBGzOVUk+uE4ABnF93isTZe5EvoI60+DyjxG3k7hocLSSD
	 XjK2w1Dj8ycOr3s1N7o461cW/N3/0ogejJcMvvkHCRboRH9dEIl6aI1LZe0FGuPEkSx8c
	 tPasoziEQApP9UusLxI8cCPvWq8AnMIsAX2SyUXVyGghyhWFYXHUvodsvHtgVDVcZbzwA
	 zyMQ5+/m/TLAZrJzQ/rtt0Nn0H/D2BH3lUFuowRLTa9N/9UCJUMpU4DSvGs6mPvMX4eol
	 mL4BnAC+TzTP/hD1jnI5YrkNE303Pp4k8mtAF1P8jZgEsUucJi54W6VPwYVujvfkFrg==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795761557;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=rWMp0RZgvnnYmHR76LXWmpYYURibs72iO4Pe9ZHYHMk=;
	b=uGqOLv+3zjpeP7LOO8dCQHjh1xfQBFTYPzSYij5BvmtrmiDvw2SQSI9Fqo4BY2mMQmld
	 d3gTQHO+8QQEww3Ggr+jz2MrKunqcORo24NCnK4ni3pdYgc36H5yXTVrxlD+eD2qfLj6d
	 UxRIH9UEorTn8A48OZqyJPhqBZlIC4WoPDiizOk2q6ZuDFOZZsNGD7QbFrO74ph0xV/9k
	 pSMaFvZM0Ipf3WfkI4UKU0HIh1llb/Rw3sqD3g1/znRT/v3m6IneZbt8ulUHfzAzOQ06W
	 WxZ1p72bh/IF8CFaS4ByEnFlPf4KXHoYeYgCfmib1QeYAYcrZ3wfB8QIPwM/X0F6jhQ==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id 15F121F00934;
	Fri, 27 Nov 2026 06:38:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795761557;
	bh=rWMp0RZgvnnYmHR76LXWmpYYURibs72iO4Pe9ZHYHMk=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=Uf0+sb25g71iqjnzJdjvhJMxAyCvlvtnWv6NPbz0GDdu8nRpM3M1CKtn8A29ut82H
	 LIM5pJ7L/RurpCpVBYwRaJEEqhWUabv8kvfuphCDjg4JhJiZVMWBvWTRYcblm7tjQq
	 CO37a3iDnOlXe0GnqBJE8Mdlabakkj988+O9HvX14myYYp6FSEecRado6/R70phZCZ
	 gZ/2wsdIVkxNgAzkIbH5oawqnBo6jNgBJ/EtsE1NLqNtvbFCrPqPtMPfu6WqpeeZl3
	 yt+/DsefWaAPzxtcHWc+xtqN3rHNn2TQPLjcMVc0nvD00OSHlnlH1wsJexRJCtBeNP
	 s43fjsp4jjlcg==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id 136274B5DC;
	Fri, 27 Nov 2026 06:38:47 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Fri, 27 Nov 2026 08:38:46 +0200
Subject: [PATCH RFC 09/10] coresight: cpu-debug: Remove the panic notifier
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Message-Id: <20261127-b4-coresight-cpu-debug-lockup-v1-9-69d3ad1e0fc8@iav.lv>
References: <20261127-b4-coresight-cpu-debug-lockup-v1-0-69d3ad1e0fc8@iav.lv>
In-Reply-To: <20261127-b4-coresight-cpu-debug-lockup-v1-0-69d3ad1e0fc8@iav.lv>
To: Suzuki K Poulose <suzuki.poulose@arm.com>, 
 Mike Leach <mike.leach@arm.com>, James Clark <james.clark@linaro.org>, 
 Leo Yan <leo.yan@arm.com>, Andrew Morton <akpm@linux-foundation.org>, 
 Alexander Shishkin <alexander.shishkin@linux.intel.com>
Cc: coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, 
 Douglas Anderson <dianders@chromium.org>, Petr Mladek <pmladek@suse.com>, 
 Feng Tang <feng.tang@linux.alibaba.com>, Igor Velkov <iav@iav.lv>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=10556; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=69Z8TmRBXxQ+yhXG6sdog2ItaDNEiEq/4FhCjNot2/E=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDNmcqsUhskr6LisTfE7LW9nqzH7lsE3+T0tN5P1zbIH9a
 74dez6ho5SFQYyLQVZMkWXCIY1bGUuu/vX3MH8AM4eVCWQIAxenAEyEXZCRof1t+Lwb7vcudflM
 /ushvlb3+e8lvNkx79su38uIKw1kPcrIsEo8bkd07Y5J4uJyF/dsOzLj3PcPs/Zud0tw/CG+taP
 YlBcA
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
Reply-To: iav@iav.lv
Content-Transfer-Encoding: 7bit

From: Igor Velkov <iav@iav.lv>

The CPUs that ignore a backtrace request are dumped from the backtrace
stall notifier. When the hard lockup detector finds another CPU locked
up, it sends such a request to that CPU before it panics, and the panic
notifier then dumps the same CPU once more.

The panic notifier also reads every possible CPU through the EDPRCR
power request. On the platforms where that is not safe it raises an
SError in the middle of the panic.

Remove it. This changes what a panic prints: the dump no longer covers
every CPU and no longer comes with every panic. "panic_sys_info=all_bt"
brings back the dump of the CPUs that do not respond, as the kernel
then requests a backtrace from all CPUs before it stops them.

Without SMP there is no backtrace request to ignore and the driver
would do nothing, so make it depend on SMP.

The example output in the documentation came from the panic notifier;
replace it with a dump of a CPU locked up by LKDTM HARDLOCKUP on
RK3399.

Suggested-by: Leo Yan <leo.yan@arm.com>
Link: https://lore.kernel.org/r/20261118104917.GW9176@e132581.arm.com
Signed-off-by: Igor Velkov <iav@iav.lv>
---
 .../trace/coresight/coresight-cpu-debug.rst        | 47 +++++++++---------
 drivers/hwtracing/coresight/Kconfig                |  8 ++--
 drivers/hwtracing/coresight/coresight-cpu-debug.c  | 55 +---------------------
 3 files changed, 29 insertions(+), 81 deletions(-)

diff --git a/Documentation/trace/coresight/coresight-cpu-debug.rst b/Documentation/trace/coresight/coresight-cpu-debug.rst
index e25177b3b857..d841c2fb610e 100644
--- a/Documentation/trace/coresight/coresight-cpu-debug.rst
+++ b/Documentation/trace/coresight/coresight-cpu-debug.rst
@@ -20,9 +20,8 @@ The debug module provides sample-based profiling extension, which can be used
 to sample CPU program counter, secure state and exception level, etc; usually
 every CPU has one dedicated debug module to be connected. Based on self-hosted
 debug mechanism, Linux kernel can access these related registers from mmio
-region when the kernel panic happens. The callback notifier for kernel panic
-will dump related registers for every CPU; finally this is good for assistant
-analysis for panic.
+region when a CPU does not respond to a backtrace request. The driver then
+dumps the related registers of that CPU, which shows where it is stuck.
 
 
 Implementation
@@ -34,20 +33,23 @@ Implementation
   this feature is not supported then registration will fail.
 
 - At the time this documentation was written, the debug driver mainly relies on
-  information gathered by the kernel panic callback notifier from three
-  sampling registers: EDPCSR, EDVIDSR and EDCIDSR: from EDPCSR we can get
-  program counter; EDVIDSR has information for secure state, exception level,
-  bit width, etc; EDCIDSR is context ID value which contains the sampled value
-  of CONTEXTIDR_EL1.
+  information gathered from three sampling registers: EDPCSR, EDVIDSR and
+  EDCIDSR: from EDPCSR we can get program counter; EDVIDSR has information for
+  secure state, exception level, bit width, etc; EDCIDSR is context ID value
+  which contains the sampled value of CONTEXTIDR_EL1.
 
-- The driver also dumps the CPUs that do not respond to a backtrace request.
+- The driver dumps the CPUs that do not respond to a backtrace request.
   A CPU that is locked up with interrupts masked does not respond unless the
   request is delivered as an NMI. A CPU that the scheduler does not report as
   idle is sampled without the EDPRCR power request, and only if EDPRSR shows
   it accessible (powered, out of reset, OS Double Lock clear). An idle CPU is
-  sampled the way the panic notifier does it, with the power request, unless
-  the "skip_idle" parameter is set. Idle is what idle_cpu() reports: the CPU
-  runs its idle task and has no task waiting to run.
+  sampled with the power request, unless the "skip_idle" parameter is set.
+  Idle is what idle_cpu() reports: the CPU runs its idle task and has no task
+  waiting to run.
+
+- A panic by itself does not produce the dump. With "panic_sys_info=all_bt"
+  the kernel requests a backtrace from all CPUs before it stops them, and the
+  CPUs that do not respond are dumped.
 
 - The driver supports a CPU running in either AArch64 or AArch32 mode. The
   registers naming convention is a bit different between them, AArch64 uses
@@ -164,7 +166,7 @@ on a system that keeps running, for example on SysRq-l or on an RCU stall
 warning. If the idle states are to stay enabled there, set
 "coresight_cpu_debug.skip_idle=1" in the kernel command line or write '1' into
 /sys/module/coresight_cpu_debug/parameters/skip_idle: the driver then does not
-sample the idle CPUs. The dump on panic still reads every CPU.
+sample the idle CPUs.
 
 If you want to limit idle states at boot time, you can use "nohlt" or
 "cpuidle.off=1" in the kernel command line.
@@ -194,16 +196,13 @@ Documentation/admin-guide/pm/cpuidle.rst)::
 Output format
 -------------
 
-Here is an example of the debugging output format::
+Here is an example of the debugging output format, for CPU1 locked up with
+interrupts masked::
 
+  After 10 seconds, these CPUS still haven't responded to the NMI: 1
   ARM external debug module:
-  coresight-cpu-debug 850000.debug: CPU[0]:
-  coresight-cpu-debug 850000.debug:  EDPRSR:  00000001 (Power:On Reset:No DLK:Unlock)
-  coresight-cpu-debug 850000.debug:  EDPCSR:  handle_IPI+0x174/0x1d8
-  coresight-cpu-debug 850000.debug:  EDCIDSR: 00000000
-  coresight-cpu-debug 850000.debug:  EDVIDSR: 90000000 (State:Non-secure Mode:EL1/0 Width:64bits VMID:0)
-  coresight-cpu-debug 852000.debug: CPU[1]:
-  coresight-cpu-debug 852000.debug:  EDPRSR:  00000001 (Power:On Reset:No DLK:Unlock)
-  coresight-cpu-debug 852000.debug:  EDPCSR:  debug_notifier_call+0x23c/0x358
-  coresight-cpu-debug 852000.debug:  EDCIDSR: 00000000
-  coresight-cpu-debug 852000.debug:  EDVIDSR: 90000000 (State:Non-secure Mode:EL1/0 Width:64bits VMID:0)
+  coresight-cpu-debug fe432000.debug: CPU[1]:
+  coresight-cpu-debug fe432000.debug:  EDPRSR:  0000000b (Power:On Reset:No DLK:Unlock)
+  coresight-cpu-debug fe432000.debug:  EDPCSR:  lkdtm_HARDLOCKUP+0x14/0x38 [lkdtm]
+  coresight-cpu-debug fe432000.debug:  EDCIDSR: 00000000
+  coresight-cpu-debug fe432000.debug:  EDVIDSR: 90000000 (State:Non-secure Mode:EL1/0 Width:64bits VMID:0)
diff --git a/drivers/hwtracing/coresight/Kconfig b/drivers/hwtracing/coresight/Kconfig
index 6a4239ebb582..3bacb33af615 100644
--- a/drivers/hwtracing/coresight/Kconfig
+++ b/drivers/hwtracing/coresight/Kconfig
@@ -148,11 +148,13 @@ config CORESIGHT_CTCU
 config CORESIGHT_CPU_DEBUG
 	tristate "CoreSight CPU Debug driver"
 	depends on ARM || ARM64
+	depends on SMP
 	depends on DEBUG_FS
 	help
 	  This driver provides support for coresight debugging module. This
-	  is primarily used to dump sample-based profiling registers when
-	  system triggers panic, the driver will parse context registers so
+	  is primarily used to dump sample-based profiling registers when a
+	  CPU does not respond to a backtrace request, as when it is locked
+	  up with interrupts masked; the driver will parse context registers so
 	  can quickly get to know program counter (PC), secure state,
 	  exception level, etc. Before use debugging functionality, platform
 	  needs to ensure the clock domain and power domain are enabled
@@ -166,7 +168,7 @@ config CORESIGHT_CPU_DEBUG_DEFAULT_ON
 	bool "Enable CoreSight CPU Debug by default"
 	depends on CORESIGHT_CPU_DEBUG
 	help
-	  Say Y here to enable the CoreSight Debug panic-debug by default. This
+	  Say Y here to enable the CoreSight CPU Debug dump by default. This
 	  can also be enabled via debugfs, but this ensures the debug feature
 	  is enabled as early as possible.
 
diff --git a/drivers/hwtracing/coresight/coresight-cpu-debug.c b/drivers/hwtracing/coresight/coresight-cpu-debug.c
index ffbdad1204a4..5c5a1f6a6e33 100644
--- a/drivers/hwtracing/coresight/coresight-cpu-debug.c
+++ b/drivers/hwtracing/coresight/coresight-cpu-debug.c
@@ -20,7 +20,6 @@
 #include <linux/moduleparam.h>
 #include <linux/nmi.h>
 #include <linux/notifier.h>
-#include <linux/panic_notifier.h>
 #include <linux/platform_device.h>
 #include <linux/pm_qos.h>
 #include <linux/rcupdate.h>
@@ -420,44 +419,6 @@ static void debug_init_arch_data(void *info)
 	}
 }
 
-/*
- * Dump out information on panic.
- */
-static int debug_notifier_call(struct notifier_block *self,
-			       unsigned long v, void *p)
-{
-	int cpu;
-	struct debug_drvdata *drvdata;
-
-	/* Bail out if we can't acquire the mutex or the functionality is off */
-	if (!mutex_trylock(&debug_lock))
-		return NOTIFY_DONE;
-
-	if (!debug_enable)
-		goto skip_dump;
-
-	pr_emerg("ARM external debug module:\n");
-
-	for_each_possible_cpu(cpu) {
-		drvdata = debug_drvdata_locked(cpu);
-		if (!drvdata)
-			continue;
-
-		dev_emerg(drvdata->dev, "CPU[%d]:\n", drvdata->cpu);
-
-		debug_read_regs(drvdata);
-		debug_dump_regs(drvdata);
-	}
-
-skip_dump:
-	mutex_unlock(&debug_lock);
-	return NOTIFY_DONE;
-}
-
-static struct notifier_block debug_notifier = {
-	.notifier_call = debug_notifier_call,
-};
-
 /*
  * Dump the CPUs that did not respond to a backtrace request. This can run
  * in NMI context.
@@ -633,27 +594,15 @@ static int debug_func_init(void)
 	debugfs_create_file("enable", 0644, debug_debugfs_dir, NULL,
 			    &debug_func_knob_fops);
 
-	/* Register function to be called for panic */
-	ret = atomic_notifier_chain_register(&panic_notifier_list,
-					     &debug_notifier);
-	if (ret) {
-		pr_err("%s: unable to register notifier: %d\n",
-		       __func__, ret);
-		goto err;
-	}
-
 	ret = nmi_backtrace_stall_notifier_register(&debug_stall_notifier);
 	if (ret) {
 		pr_err("%s: unable to register stall notifier: %d\n",
 		       __func__, ret);
-		goto err_stall;
+		goto err;
 	}
 
 	return 0;
 
-err_stall:
-	atomic_notifier_chain_unregister(&panic_notifier_list,
-					 &debug_notifier);
 err:
 	debugfs_remove_recursive(debug_debugfs_dir);
 	return ret;
@@ -662,8 +611,6 @@ static int debug_func_init(void)
 static void debug_func_exit(void)
 {
 	nmi_backtrace_stall_notifier_unregister(&debug_stall_notifier);
-	atomic_notifier_chain_unregister(&panic_notifier_list,
-					 &debug_notifier);
 	debugfs_remove_recursive(debug_debugfs_dir);
 }
 

-- 
2.43.0


