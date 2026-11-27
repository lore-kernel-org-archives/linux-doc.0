Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1795761546;
	b=2jGg9h/Y/YWaOPPaPSyogafCvLUkuXAa9+rIYESOk2xgvU0B+eVjXNpvQdAuOcX/vmn+
	 kAtiOe5M6WNaBohOw0EOxhbzpXQHMzicMcchcrRmBZAU5G1s2PvoBqp+jZb2ezsuhpQw7
	 quzo9dPDCOOX5lWPptWcyvioCDzslfjG3l/HDluTJO1Z4mvpiVmQmjA6p0Boh4lA9868z
	 V4dRdwX20CCEwKMQA6Qx6o3Oen/tWZ7veJ0RBFoRsC41Lp6gzpvu52/5M661nSuSwKrP+
	 Mmbe/SLzrXvL7CNdw/G6qNSkyCH61sClwSOKPpQndCte9As9t/QtRXJACdhtdtO5B4w==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795761546;
	h=Received:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=XjGC0M5fpJSSlNcbeEXaj39/+McVBbE84uyM1YDnneU=;
	b=nQoywegzgewiddwKZ6j35M19xbWB6WKSJyPzwf6d5q4shGTFneIQ7qj5TbbRcNVA/k65
	 YaDuFooiz2OBajoeTSwAKkNKZ9+zbJTzHaf4CKLxgKXfNP5GEuHSG8tQeTU5iR5AjqWxx
	 ts6L7jN6MRHPcGJz4j13grCAGNiR8i+JzaV2ZewtOP+2W9kZKHgt7y+2a2RH0FvjVTvBo
	 vLDH+V6QWXX22sBfa6FL3kWZxTWRbpZl33ruPZYdAobEz3hfYUprInEQ+blPjtni+TWnf
	 UxvwBUXohatZMfffQGeVziLdy5L7LVBmMCMV62+rapu0EjBz1OkxZPHaRTGTb4CSZMA==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jbyjFl5i;
	arc=pass header.oldest-pass=0 smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EADC6606A33C;
	Fri, 27 Nov 2026 06:39:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=jbyjFl5i
Authentication-Results: smtp.kernel.org; arc=none smtp.remote-ip=100.80.115.77
ARC-Seal: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256; cv=none;
	t=1795761545;
	b=M6RkvqpDAyeH7qIij/WovTokwvWJzumb7jiWiLl0CaMIIowu2ij9bPfPkbt+9rO3gprX
	 rNHT3as42B8jLfKWIyOfGi+cqBHdSKnsDLPbqvwke23QuKaSMYysu8ZBaIrHAQLS10kBs
	 X4YScAs8rp9mfBZC4ExhP1KMC+Ausv+9OueCjHi6fwOziczmzbdHUc10bfgTiYCYnjeqx
	 HMAeruMYOyO19meWWoGDkqUzrJdgT9TUFQLpuJIW8U8Uw7fVm0uhNzY0m7Nd0DJxHgx+R
	 1S2TSUpzAM5qg0YyhB/3re/NbvPx73ZkqRAwaSuudYhJZquC4YAeu+CAnFQGbZRv0ag==
ARC-Message-Signature: i=1; d=kernel.org; s=arc20260519; a=rsa-sha256;
	c=relaxed/relaxed; t=1795761545;
	h=DKIM-Signature:Received:From:Date:Subject:MIME-Version:Content-Type:
	 Message-Id:References:In-Reply-To:To:Cc:X-Mailer:
	 X-Developer-Signature:X-Developer-Key:X-Endpoint-Received:
	 X-Original-From:Reply-To:Content-Transfer-Encoding;
	bh=XjGC0M5fpJSSlNcbeEXaj39/+McVBbE84uyM1YDnneU=;
	b=hC61VTYrORRkNjHVfUh/rj8mjg0eWMDNreLVlqENHryQ2jHGW/sOXd9qjbsHctTwkFdw
	 ddSVCgKj49BjjQyRMwzQDv2SrTL6w07ghIUOuhXUYIl/+fIiVaovmPIQhUbWpJXyHQtHz
	 oMeHbVUZfhEX0C2ZvzqiNnpmDrzI2rWnqKXT0tMJnlvehr9OWC+F9l9ie+BMyqWkxghEC
	 nfCOVgaICODUZf42S/6sQdfHfUFsBxHCuax+NrXgLWGapJZ7vjs2kE+l8XkS1xC+bjOdX
	 k2iZNKLeca8/cT5R8MT8iXFyh3cwvmFCgMwcY9aYga+1PmONtbiSsImB+eFh3iW1bUw==
ARC-Authentication-Results: i=1; smtp.kernel.org; 
	arc=none smtp.remote-ip=100.80.115.77
Received: from lkml.kernel.org (nexus.subspace.kernel.org [100.80.115.77])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.kernel.org (Postfix) with ESMTPS id C44C21F0092B;
	Fri, 27 Nov 2026 06:38:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795761545;
	bh=XjGC0M5fpJSSlNcbeEXaj39/+McVBbE84uyM1YDnneU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To;
	b=jbyjFl5ifgxOfNw19e8RHqnZ9hPj/rxsqtVsyuQUUfVSNhKX7S83v+x6gs5wn88T0
	 M7pjWt5yQXY+89f6PnAyzg0MtYsaAcaIygk5fzEAdHWiX3cyhAa8uTTfqy1YDLBktD
	 EYG7HdajkpnoiUHUxp5N/s0xtKvI+1xT4eGkINtXx9IJIPigAc0Ayn6GmJ8kfbphKI
	 u/g3ASAFh0vSREiBjhXEfdLQjvNPZkHc1OH49FLWTHTHmb7EGEmZ2GcXfh3bNtnLKi
	 gvQhafOFdmDbHEtovHzXlfG9G3OKcMm8XnSZq1GImQM9UArbMGMWPbmLxLz2MPjAP0
	 5UsmIVOcdrmBA==
Received: from nexus.subspace.kernel.org (localhost [IPv6:::1])
	by lkml.kernel.org (Postfix) with ESMTP id C4B764B5D4;
	Fri, 27 Nov 2026 06:38:46 +0000 (UTC)
From: Igor Velkov via B4 Relay <devnull+iav.iav.lv@kernel.org>
Date: Fri, 27 Nov 2026 08:38:44 +0200
Subject: [PATCH RFC 07/10] lib/nmi_backtrace: notify about CPUs that ignore
 a backtrace request
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
Message-Id: <20261127-b4-coresight-cpu-debug-lockup-v1-7-69d3ad1e0fc8@iav.lv>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=5418; i=iav@iav.lv;
 h=from:subject:message-id;
 bh=lAXIzRdZsICWVCPuak+CsO7I/rLdVHaqdO0DPNjaa0E=;
 b=owGbwMvMwCVmNH1q96v4SmbG02pJDNmcqkVOCfs3ZvxTVLq1/Er7Dc64Kb+bWrY/5wgz3sbO0
 3raQ7qxo5SFQYyLQVZMkWXCIY1bGUuu/vX3MH8AM4eVCWQIAxenAEykg53hnx0H28xWwZP31znm
 iiXPnXDssvqzuHWXUrh/POGftOmKxXRGhpbv00sPX3jsHGJe8GKN0JKVP/K6pFY/a2TzNXeMjpx
 3ix8A
X-Developer-Key: i=iav@iav.lv; a=openpgp;
 fpr=90C228DA68A4D5FD4F4837E03297958BEA5F7903
X-Endpoint-Received: by B4 Relay for iav@iav.lv/default with auth_id=1060
X-Original-From: Igor Velkov <iav@iav.lv>
Reply-To: iav@iav.lv
Content-Transfer-Encoding: 7bit

From: Igor Velkov <iav@iav.lv>

nmi_trigger_cpumask_backtrace() waits 10 seconds for the CPUs it asked
for a backtrace and then reports the ones that did not respond. A CPU
locked up with interrupts masked cannot take a request sent as a
regular IPI, so its stack cannot be had, but an external debug
interface may still be able to sample its program counter.

Add an atomic notifier chain that is called with the CPUs that did not
respond. idle_cpu() is not exported to modules, so pass the idle CPUs
as a second mask.

nmi_backtrace_stall_check() is called at the same point, but it is an
arch hook; the consumer here is a tristate driver bound to per-CPU
devices, so it takes a notifier.

Signed-off-by: Igor Velkov <iav@iav.lv>
---
 include/linux/nmi.h | 28 +++++++++++++++++++++++++++
 lib/nmi_backtrace.c | 56 +++++++++++++++++++++++++++++++++++++++++++++++++++++
 2 files changed, 84 insertions(+)

diff --git a/include/linux/nmi.h b/include/linux/nmi.h
index af69712df5f4..f2f8c9e42ff7 100644
--- a/include/linux/nmi.h
+++ b/include/linux/nmi.h
@@ -8,6 +8,8 @@
 #include <linux/sched.h>
 #include <asm/irq.h>
 
+struct notifier_block;
+
 /* Arch specific watchdogs might need to share extra watchdog-related APIs. */
 #if defined(CONFIG_HARDLOCKUP_DETECTOR_ARCH) || defined(CONFIG_HARDLOCKUP_DETECTOR_SPARC64)
 #include <asm/nmi.h>
@@ -151,6 +153,19 @@ static inline void touch_nmi_watchdog(void)
 	touch_softlockup_watchdog();
 }
 
+/**
+ * struct nmi_backtrace_stall - CPUs that ignored a backtrace request
+ * @cpus: CPUs that did not respond before the timeout; one that responds
+ *	  while the notifiers run is cleared from the mask
+ * @idle: the CPUs of @cpus that idle_cpu() reported as idle: they run their
+ *	  idle task and have nothing queued, so a CPU stuck in idle with a
+ *	  wakeup pending is not among them
+ */
+struct nmi_backtrace_stall {
+	const struct cpumask *cpus;
+	const struct cpumask *idle;
+};
+
 /*
  * Create trigger_all_cpu_backtrace() out of the arch-provided
  * base function. Return whether such support was available,
@@ -189,7 +204,20 @@ void nmi_trigger_cpumask_backtrace(const cpumask_t *mask,
 				   void (*raise)(cpumask_t *mask));
 bool nmi_cpu_backtrace(struct pt_regs *regs);
 
+int nmi_backtrace_stall_notifier_register(struct notifier_block *nb);
+int nmi_backtrace_stall_notifier_unregister(struct notifier_block *nb);
+
 #else
+static inline int nmi_backtrace_stall_notifier_register(struct notifier_block *nb)
+{
+	return 0;
+}
+
+static inline int nmi_backtrace_stall_notifier_unregister(struct notifier_block *nb)
+{
+	return 0;
+}
+
 static inline bool trigger_all_cpu_backtrace(void)
 {
 	return false;
diff --git a/lib/nmi_backtrace.c b/lib/nmi_backtrace.c
index f39c9eca8888..2b5a4e693599 100644
--- a/lib/nmi_backtrace.c
+++ b/lib/nmi_backtrace.c
@@ -18,6 +18,7 @@
 #include <linux/kprobes.h>
 #include <linux/stringify.h>
 #include <linux/nmi.h>
+#include <linux/notifier.h>
 #include <linux/cpu.h>
 #include <linux/export.h>
 #include <linux/sched/debug.h>
@@ -31,6 +32,60 @@ static unsigned long backtrace_flag;
 
 #define NMI_BT_TIMEOUT_SEC	10
 
+static ATOMIC_NOTIFIER_HEAD(backtrace_stall_chain);
+static DECLARE_BITMAP(backtrace_stall_idle_mask, NR_CPUS);
+
+/**
+ * nmi_backtrace_stall_notifier_register - watch for CPUs ignoring a backtrace
+ * @nb: notifier to call with a &struct nmi_backtrace_stall
+ *
+ * The notifier runs in the context of the backtrace request, which can be
+ * an NMI, and the masks it is passed are valid only until it returns. Only
+ * requests that go through nmi_trigger_cpumask_backtrace() are reported.
+ *
+ * Return: 0 on success, -EEXIST if @nb is already registered.
+ */
+int nmi_backtrace_stall_notifier_register(struct notifier_block *nb)
+{
+	return atomic_notifier_chain_register(&backtrace_stall_chain, nb);
+}
+EXPORT_SYMBOL_GPL(nmi_backtrace_stall_notifier_register);
+
+/**
+ * nmi_backtrace_stall_notifier_unregister - stop watching for such CPUs
+ * @nb: notifier to remove
+ *
+ * Waits for a running notifier to return, so it can sleep and must not be
+ * called from the notifier.
+ *
+ * Return: 0 on success, -ENOENT if @nb is not registered.
+ */
+int nmi_backtrace_stall_notifier_unregister(struct notifier_block *nb)
+{
+	return atomic_notifier_chain_unregister(&backtrace_stall_chain, nb);
+}
+EXPORT_SYMBOL_GPL(nmi_backtrace_stall_notifier_unregister);
+
+static void nmi_backtrace_stall_notify(void)
+{
+	struct nmi_backtrace_stall stall = {
+		.cpus = to_cpumask(backtrace_mask),
+		.idle = to_cpumask(backtrace_stall_idle_mask),
+	};
+	int cpu;
+
+	if (atomic_notifier_call_chain_is_empty(&backtrace_stall_chain))
+		return;
+
+	cpumask_clear(to_cpumask(backtrace_stall_idle_mask));
+	for_each_cpu(cpu, stall.cpus) {
+		if (idle_cpu(cpu))
+			__cpumask_set_cpu(cpu, to_cpumask(backtrace_stall_idle_mask));
+	}
+
+	atomic_notifier_call_chain(&backtrace_stall_chain, 0, &stall);
+}
+
 /*
  * When raise() is called it will be passed a pointer to the
  * backtrace_mask. Architectures that call nmi_cpu_backtrace()
@@ -85,6 +140,7 @@ void nmi_trigger_cpumask_backtrace(const cpumask_t *mask,
 			cpumask_pr_args(to_cpumask(backtrace_mask)));
 
 		nmi_backtrace_stall_check(to_cpumask(backtrace_mask));
+		nmi_backtrace_stall_notify();
 	}
 
 	/*

-- 
2.43.0


