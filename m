Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EEA7B399368;
	Thu, 12 Mar 2026 23:22:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=10.30.226.201
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773357754; cv=none; b=d2EiKgooqLQrDr37pFIdTx6xfAfDYPonC5ewszKOXwa3kR1XHeYHiqpxsqie9mRxfy1nrP1Xqh1U77yFT6/4XFNX2Rco8yOYusx/Uk9ExSJrELb/u3EMNYyBK21qswz5OEo7dXkhQ/Jys14tU/DE8pT90icIUUlLdVcwCnC+WjA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773357754; c=relaxed/simple;
	bh=ZvdhkjPc20Ylp1M7TIY3QZ3BSppLWF2s98ZTCW2gE34=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=hVdxjaBkk/vR5nC3NiUIxNsqkpX7ViLsWG1e4Xfr+69iuEycdjEOL2HVzYnyxyylu80d6DkjjtOXUIcOMKxiyjoXesOnGV7a5ieYc6aSwI8gWi0KcFqRc5ItXldZfyTkkC3zp+1TdMcDW90ZVu9gwNp54r/qeC9qS2PfG2HjZMY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=sHUNbtCZ; arc=none smtp.client-ip=10.30.226.201
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="sHUNbtCZ"
Received: by smtp.kernel.org (Postfix) with ESMTPS id AB441C2BC86;
	Thu, 12 Mar 2026 23:22:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773357753;
	bh=ZvdhkjPc20Ylp1M7TIY3QZ3BSppLWF2s98ZTCW2gE34=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=sHUNbtCZ9/+RUnbBi8m1Kd4o05tOrLQvFeFZW/7FjQ8FAdd8ueHeoZYBX6puIC7sS
	 ufkH+3EcKi3cFua8PSDqXvv68nDVBuCZBtQhsCJNlBQNtJQNCGrSKf7FCVwvLDcU4Y
	 qwDBgqEhTWYEAv506l7f7abt5edExtzAIQQSdoXFAUErA0/Nnzrw82Hz6Yl6NkjChS
	 SgK5wrEtDdP18ucTJZrAZTJO0KeSAtJlZGAsNPlvvd6k9/nvFR+DWDQ/x1X5TgCq8g
	 Ud8kg0HM5dUgcvCFXHDl30BE5nXygl+e97ZCkc5rWiAeCAMTm9Y/SbA2BCAanadqx3
	 fe8+qBmkP9PWg==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93FA6106ACF9;
	Thu, 12 Mar 2026 23:22:33 +0000 (UTC)
From: Mayank Rungta via B4 Relay <devnull+mrungta.google.com@kernel.org>
Date: Thu, 12 Mar 2026 16:22:02 -0700
Subject: [PATCH v2 1/5] watchdog: Return early in
 watchdog_hardlockup_check()
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260312-hardlockup-watchdog-fixes-v2-1-45bd8a0cc7ed@google.com>
References: <20260312-hardlockup-watchdog-fixes-v2-0-45bd8a0cc7ed@google.com>
In-Reply-To: <20260312-hardlockup-watchdog-fixes-v2-0-45bd8a0cc7ed@google.com>
To: Petr Mladek <pmladek@suse.com>, Jinchao Wang <wangjinchao600@gmail.com>, 
 Yunhui Cui <cuiyunhui@bytedance.com>, Stephane Eranian <eranian@google.com>, 
 Ian Rogers <irogers@google.com>, Li Huafei <lihuafei1@huawei.com>, 
 Feng Tang <feng.tang@linux.alibaba.com>, 
 Max Kellermann <max.kellermann@ionos.com>, Jonathan Corbet <corbet@lwn.net>, 
 Douglas Anderson <dianders@chromium.org>, 
 Andrew Morton <akpm@linux-foundation.org>, 
 Florian Delizy <fdelizy@google.com>, Shuah Khan <skhan@linuxfoundation.org>
Cc: linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
 Mayank Rungta <mrungta@google.com>
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=ed25519-sha256; t=1773357752; l=5437;
 i=mrungta@google.com; s=20260212; h=from:subject:message-id;
 bh=/gmGbSYfq0uL3jFNpI3ejNjGlNROGDfe6h8BWDUCdcs=;
 b=HQzF2MlIsRSuZGZCoBBHHUHE0LnOCFLTKwDzHh7aXPJMLq192jyuitITA7uKVL+uLOB7DMUHR
 xkMy50bkDXSB0PzgpgywZ8SeScifNZ4R3sKJqyvZctb9P4s0AQEspxX
X-Developer-Key: i=mrungta@google.com; a=ed25519;
 pk=2Bjwbv/ibL10QnyvK9G7DoKpffXy7z6+M4NawEYgYDI=
X-Endpoint-Received: by B4 Relay for mrungta@google.com/20260212 with
 auth_id=634
X-Original-From: Mayank Rungta <mrungta@google.com>
Reply-To: mrungta@google.com

From: Mayank Rungta <mrungta@google.com>

Invert the `is_hardlockup(cpu)` check in `watchdog_hardlockup_check()`
to return early when a hardlockup is not detected. This flattens the
main logic block, reducing the indentation level and making the code
easier to read and maintain.

This refactoring serves as a preparation patch for future hardlockup
changes.

Signed-off-by: Mayank Rungta <mrungta@google.com>
---
 kernel/watchdog.c | 117 +++++++++++++++++++++++++++---------------------------
 1 file changed, 59 insertions(+), 58 deletions(-)

diff --git a/kernel/watchdog.c b/kernel/watchdog.c
index 7d675781bc91..4c5b47495745 100644
--- a/kernel/watchdog.c
+++ b/kernel/watchdog.c
@@ -187,6 +187,8 @@ static void watchdog_hardlockup_kick(void)
 void watchdog_hardlockup_check(unsigned int cpu, struct pt_regs *regs)
 {
 	int hardlockup_all_cpu_backtrace;
+	unsigned int this_cpu;
+	unsigned long flags;
 
 	if (per_cpu(watchdog_hardlockup_touched, cpu)) {
 		per_cpu(watchdog_hardlockup_touched, cpu) = false;
@@ -201,74 +203,73 @@ void watchdog_hardlockup_check(unsigned int cpu, struct pt_regs *regs)
 	 * fired multiple times before we overflow'd. If it hasn't
 	 * then this is a good indication the cpu is stuck
 	 */
-	if (is_hardlockup(cpu)) {
-		unsigned int this_cpu = smp_processor_id();
-		unsigned long flags;
+	if (!is_hardlockup(cpu)) {
+		per_cpu(watchdog_hardlockup_warned, cpu) = false;
+		return;
+	}
 
 #ifdef CONFIG_SYSFS
-		++hardlockup_count;
+	++hardlockup_count;
 #endif
-		/*
-		 * A poorly behaving BPF scheduler can trigger hard lockup by
-		 * e.g. putting numerous affinitized tasks in a single queue and
-		 * directing all CPUs at it. The following call can return true
-		 * only once when sched_ext is enabled and will immediately
-		 * abort the BPF scheduler and print out a warning message.
-		 */
-		if (scx_hardlockup(cpu))
-			return;
+	/*
+	 * A poorly behaving BPF scheduler can trigger hard lockup by
+	 * e.g. putting numerous affinitized tasks in a single queue and
+	 * directing all CPUs at it. The following call can return true
+	 * only once when sched_ext is enabled and will immediately
+	 * abort the BPF scheduler and print out a warning message.
+	 */
+	if (scx_hardlockup(cpu))
+		return;
 
-		/* Only print hardlockups once. */
-		if (per_cpu(watchdog_hardlockup_warned, cpu))
-			return;
+	/* Only print hardlockups once. */
+	if (per_cpu(watchdog_hardlockup_warned, cpu))
+		return;
 
-		/*
-		 * Prevent multiple hard-lockup reports if one cpu is already
-		 * engaged in dumping all cpu back traces.
-		 */
-		if (hardlockup_all_cpu_backtrace) {
-			if (test_and_set_bit_lock(0, &hard_lockup_nmi_warn))
-				return;
-		}
+	/*
+	 * Prevent multiple hard-lockup reports if one cpu is already
+	 * engaged in dumping all cpu back traces.
+	 */
+	if (hardlockup_all_cpu_backtrace) {
+		if (test_and_set_bit_lock(0, &hard_lockup_nmi_warn))
+			return;
+	}
 
-		/*
-		 * NOTE: we call printk_cpu_sync_get_irqsave() after printing
-		 * the lockup message. While it would be nice to serialize
-		 * that printout, we really want to make sure that if some
-		 * other CPU somehow locked up while holding the lock associated
-		 * with printk_cpu_sync_get_irqsave() that we can still at least
-		 * get the message about the lockup out.
-		 */
-		pr_emerg("CPU%u: Watchdog detected hard LOCKUP on cpu %u\n", this_cpu, cpu);
-		printk_cpu_sync_get_irqsave(flags);
+	/*
+	 * NOTE: we call printk_cpu_sync_get_irqsave() after printing
+	 * the lockup message. While it would be nice to serialize
+	 * that printout, we really want to make sure that if some
+	 * other CPU somehow locked up while holding the lock associated
+	 * with printk_cpu_sync_get_irqsave() that we can still at least
+	 * get the message about the lockup out.
+	 */
+	this_cpu = smp_processor_id();
+	pr_emerg("CPU%u: Watchdog detected hard LOCKUP on cpu %u\n", this_cpu, cpu);
+	printk_cpu_sync_get_irqsave(flags);
 
-		print_modules();
-		print_irqtrace_events(current);
-		if (cpu == this_cpu) {
-			if (regs)
-				show_regs(regs);
-			else
-				dump_stack();
-			printk_cpu_sync_put_irqrestore(flags);
-		} else {
-			printk_cpu_sync_put_irqrestore(flags);
-			trigger_single_cpu_backtrace(cpu);
-		}
+	print_modules();
+	print_irqtrace_events(current);
+	if (cpu == this_cpu) {
+		if (regs)
+			show_regs(regs);
+		else
+			dump_stack();
+		printk_cpu_sync_put_irqrestore(flags);
+	} else {
+		printk_cpu_sync_put_irqrestore(flags);
+		trigger_single_cpu_backtrace(cpu);
+	}
 
-		if (hardlockup_all_cpu_backtrace) {
-			trigger_allbutcpu_cpu_backtrace(cpu);
-			if (!hardlockup_panic)
-				clear_bit_unlock(0, &hard_lockup_nmi_warn);
-		}
+	if (hardlockup_all_cpu_backtrace) {
+		trigger_allbutcpu_cpu_backtrace(cpu);
+		if (!hardlockup_panic)
+			clear_bit_unlock(0, &hard_lockup_nmi_warn);
+	}
 
-		sys_info(hardlockup_si_mask & ~SYS_INFO_ALL_BT);
-		if (hardlockup_panic)
-			nmi_panic(regs, "Hard LOCKUP");
+	sys_info(hardlockup_si_mask & ~SYS_INFO_ALL_BT);
+	if (hardlockup_panic)
+		nmi_panic(regs, "Hard LOCKUP");
 
-		per_cpu(watchdog_hardlockup_warned, cpu) = true;
-	} else {
-		per_cpu(watchdog_hardlockup_warned, cpu) = false;
-	}
+	per_cpu(watchdog_hardlockup_warned, cpu) = true;
 }
 
 #else /* CONFIG_HARDLOCKUP_DETECTOR_COUNTS_HRTIMER */

-- 
2.53.0.851.ga537e3e6e9-goog


