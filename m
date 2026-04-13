Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 07BC0397E6A
	for <linux-doc@vger.kernel.org>; Mon, 13 Apr 2026 07:44:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776066248; cv=none; b=jXvmVoTIOWtY6ju6w7H4ZT8qfuQPL0uF6XLJ91rGCb2MqeOm8GGVuxqFPR6zOfX/CmRF4faTus8UVgpgR4pBx53ydFh/zOjWcvyQ1238ZiY96j+s6SHEZQLmRVQo0il0cVwuI/WIhudvf/cuYMw5mu7Bd1k2XG0UmRIY86R0up4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776066248; c=relaxed/simple;
	bh=Y0xqgw/0a5rTkwx+KfPUGwTxkRJeNcj/lT+2uowTJCE=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Pt8aTjpjg3lfE72Tqu0Z2ZnOcj5qDNpQlmlO0wbTZGB0y84AS79TypF8TSkFiGh5vtegySTUtFvok+QNHzQSrjpzVQO5dZTo9W0Sy6IgJVFalabFcJEy3giv9pAEDu/HbSmuHG3VadfiLlPgaucVqAnmoyhOnGAHx6W13CwxNQE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=psy7Tq7A; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="psy7Tq7A"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-12c1a170a50so3667401c88.0
        for <linux-doc@vger.kernel.org>; Mon, 13 Apr 2026 00:44:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1776066245; x=1776671045; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=oFe08Ts/hypKtbjTki6Zi9pd0qwjzgX8Ya0BzZ0CJRU=;
        b=psy7Tq7ABGPF6GaU9/g4aAkV1a2pzB3ML+cSDy0yWSyCa5q2CQH9lKnLnunU8ppBa+
         KrWTifxQv7HReEaW+67JomhAJTqpAT02KfLrLMRRdpTr+olat2OAwUuTWOVjY+5Mxg8H
         kpZ/7+gEM+8jucV3ymXmy3emhPiSlamTYIYLSNV+nKIV2SpVZ2u4+iv/2aLoMgadGBLy
         U11ubO1qFK34y1T/GglNY/d36ZGGVs183ohh8EJ0NU1vVEzApFMlcCgsNjCnz2E0jg/9
         TAzidbBEVDaz48R8CZeG8tHfpSyo1hCtk6RN7GIObUCuYRTCvwC4GzlTtcbiMPi96qZD
         xbVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776066245; x=1776671045;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-gg:x-gm-message-state:from:to
         :cc:subject:date:message-id:reply-to;
        bh=oFe08Ts/hypKtbjTki6Zi9pd0qwjzgX8Ya0BzZ0CJRU=;
        b=fNDb1nqCQ0lGwKzc54VdYtc4fs/i4kncQgS/jFEiTn1KVEW7xiXh2ONRWYIm85/swA
         fXTqF1m17A9X+1/NvAZ9rST1xmcq++S4kQ8BEyQol3OTPbhvNgaZ+qNVqu4y56S1N5aJ
         onvI6zhSDhVy0O9+BUQbwBRa5gg3i2YSNiRkfGJjC4mj8wsc88HrQQKRVRhmo83zdSxT
         sE3H4xFVj7ldIkBZsEQ5ieu44bF+fVlPeoH+IF4PkUGoXCz5FCKwZbACIGhtPiy7hFf8
         Hv8eo3ZiRCGM7aCVqD1Q6FC5/O6PU2LimVijczsn9zhKy9+ThcpEeOrXwpYPW/g04TW+
         Unow==
X-Forwarded-Encrypted: i=1; AFNElJ8kvbFrWkLHXTOZyuIsFZ5xLn+sX8ocnjfMPbFk0gqB21D1AsZM+DAeo8D5P2BM5vnIvw7uKdpRvVs=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxxn4Lm0gMhMe4gSShx8+Sg0KC+7lPdJOvDrur4VeswtPuH72IB
	RbXL4slIyKq0OU+IOr4hrGX94EueNw0CqP+8U/y2uj0tQZECVPe55Rs6
X-Gm-Gg: AeBDievlFIRCpfyyy8lpbt02L8tBMT4QVEWjKxKoGWsKBDXggPjm6wRayM999MiTtBd
	wTVF4Fy9PYeaP3MbxwCZqPsq9weRqbP4EL9TCr12XHA3rHeoNPgwEovS6OdGaGpX/pYy39Vn3JT
	lsfUm/gDF3M7bpaBvt6wNI27ogmFY3QGSMOCXkVH2VHB0L9qF9rVt8Xb5jOFRVkXwv2+9bku0ma
	y6sU8iE87F4lUrtqdjNJ8BFqW3F73GYYHWyB+xHTSduG98iuhw1w0BSVsXE2t0cadzFS77B1EZ0
	SFDEZAQb323QS2gkrcUR/M5v+0c3VcdVprDBzbcqmUKorxLTEqIhKuAiD338y6Pwv4p6Bf1J34f
	xo9vK3ncjX4XoiuleTPSxeBpKYofmOd+kFjqlj1PpqxlwD6RAAJ+YlFzNCVjk0R2rnOR8WQ7K5C
	ih7B5Z0IFgDt949F8l
X-Received: by 2002:a05:7022:ec1:b0:127:5cd6:fa45 with SMTP id a92af1059eb24-12c34ea2415mr6243136c88.14.1776066245003;
        Mon, 13 Apr 2026 00:44:05 -0700 (PDT)
Received: from wujing. ([74.48.213.230])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-12c347fa2c9sm12884610c88.15.2026.04.13.00.43.54
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 13 Apr 2026 00:44:04 -0700 (PDT)
From: Qiliang Yuan <realwujing@gmail.com>
Date: Mon, 13 Apr 2026 15:43:10 +0800
Subject: [PATCH v2 04/12] tick/nohz: Transition to dynamic full dynticks
 state management
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260413-wujing-dhm-v2-4-06df21caba5d@gmail.com>
References: <20260413-wujing-dhm-v2-0-06df21caba5d@gmail.com>
In-Reply-To: <20260413-wujing-dhm-v2-0-06df21caba5d@gmail.com>
To: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>, 
 Juri Lelli <juri.lelli@redhat.com>, 
 Vincent Guittot <vincent.guittot@linaro.org>, 
 Dietmar Eggemann <dietmar.eggemann@arm.com>, 
 Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, 
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, 
 "Paul E. McKenney" <paulmck@kernel.org>, 
 Frederic Weisbecker <frederic@kernel.org>, 
 Neeraj Upadhyay <neeraj.upadhyay@kernel.org>, 
 Joel Fernandes <joelagnelf@nvidia.com>, 
 Josh Triplett <josh@joshtriplett.org>, Boqun Feng <boqun@kernel.org>, 
 Uladzislau Rezki <urezki@gmail.com>, 
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
 Lai Jiangshan <jiangshanlai@gmail.com>, Zqiang <qiang.zhang@linux.dev>, 
 Anna-Maria Behnsen <anna-maria@linutronix.de>, 
 Ingo Molnar <mingo@kernel.org>, Thomas Gleixner <tglx@kernel.org>, 
 Tejun Heo <tj@kernel.org>, Andrew Morton <akpm@linux-foundation.org>, 
 Vlastimil Babka <vbabka@kernel.org>, Suren Baghdasaryan <surenb@google.com>, 
 Michal Hocko <mhocko@suse.com>, Brendan Jackman <jackmanb@google.com>, 
 Johannes Weiner <hannes@cmpxchg.org>, Zi Yan <ziy@nvidia.com>, 
 Waiman Long <longman@redhat.com>, Chen Ridong <chenridong@huaweicloud.com>, 
 =?utf-8?q?Michal_Koutn=C3=BD?= <mkoutny@suse.com>, 
 Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
 Shuah Khan <shuah@kernel.org>
Cc: linux-kernel@vger.kernel.org, rcu@vger.kernel.org, linux-mm@kvack.org, 
 cgroups@vger.kernel.org, linux-doc@vger.kernel.org, 
 linux-kselftest@vger.kernel.org, Qiliang Yuan <realwujing@gmail.com>
X-Mailer: b4 0.13.0

Context:
Full dynticks (NOHZ_FULL) is typically a static configuration determined
at boot time. DHEI extends this to support runtime activation.

Problem:
Switching to NOHZ_FULL at runtime requires careful synchronization
of context tracking and housekeeping states. Re-invoking setup logic
multiple times could lead to inconsistencies or warnings, and RCU
dependency checks often prevented tick suppression in Zero-Conf setups.

Solution:
- Replace the static tick_nohz_full_enabled() checks with a dynamic
  tick_nohz_full_running state variable.
- Refactor tick_nohz_full_setup to be safe for runtime invocation,
  adding guards against re-initialization and ensuring IRQ work
  interrupt support.
- Implement boot-time pre-activation of context tracking (shadow
  init) for all possible CPUs to avoid instruction flow issues during
  dynamic transitions.
- Hook into housekeeping_notifier_list to update NO_HZ states dynamically.

This provides the core state machine for reliable, on-demand tick
suppression and high-performance isolation.

Signed-off-by: Qiliang Yuan <realwujing@gmail.com>
---
 kernel/time/tick-sched.c | 130 ++++++++++++++++++++++++++++++++++++++---------
 1 file changed, 105 insertions(+), 25 deletions(-)

diff --git a/kernel/time/tick-sched.c b/kernel/time/tick-sched.c
index f7907fadd63f2..23d69d7d44538 100644
--- a/kernel/time/tick-sched.c
+++ b/kernel/time/tick-sched.c
@@ -27,6 +27,7 @@
 #include <linux/posix-timers.h>
 #include <linux/context_tracking.h>
 #include <linux/mm.h>
+#include <linux/sched/isolation.h>
 
 #include <asm/irq_regs.h>
 
@@ -624,13 +625,25 @@ void __tick_nohz_task_switch(void)
 /* Get the boot-time nohz CPU list from the kernel parameters. */
 void __init tick_nohz_full_setup(cpumask_var_t cpumask)
 {
-	alloc_bootmem_cpumask_var(&tick_nohz_full_mask);
+	if (!tick_nohz_full_mask) {
+		if (!slab_is_available())
+			alloc_bootmem_cpumask_var(&tick_nohz_full_mask);
+		else
+			zalloc_cpumask_var(&tick_nohz_full_mask, GFP_KERNEL);
+	}
 	cpumask_copy(tick_nohz_full_mask, cpumask);
 	tick_nohz_full_running = true;
 }
 
 bool tick_nohz_cpu_hotpluggable(unsigned int cpu)
 {
+	/*
+	 * Allow all CPUs to go down during shutdown/reboot to avoid
+	 * interfering with the final power-off sequence.
+	 */
+	if (system_state > SYSTEM_RUNNING)
+		return true;
+
 	/*
 	 * The 'tick_do_timer_cpu' CPU handles housekeeping duty (unbound
 	 * timers, workqueues, timekeeping, ...) on behalf of full dynticks
@@ -646,45 +659,112 @@ static int tick_nohz_cpu_down(unsigned int cpu)
 	return tick_nohz_cpu_hotpluggable(cpu) ? 0 : -EBUSY;
 }
 
+static int tick_nohz_housekeeping_reconfigure(struct notifier_block *nb,
+					     unsigned long action, void *data)
+{
+	struct housekeeping_update *upd = data;
+	int cpu;
+
+	if (action == HK_UPDATE_MASK && upd->type == HK_TYPE_TICK) {
+		cpumask_var_t non_housekeeping_mask;
+
+		if (!alloc_cpumask_var(&non_housekeeping_mask, GFP_KERNEL))
+			return NOTIFY_BAD;
+
+		cpumask_andnot(non_housekeeping_mask, cpu_possible_mask, upd->new_mask);
+
+		if (!tick_nohz_full_mask) {
+			if (!zalloc_cpumask_var(&tick_nohz_full_mask, GFP_KERNEL)) {
+				free_cpumask_var(non_housekeeping_mask);
+				return NOTIFY_BAD;
+			}
+		}
+
+		/* Kick all CPUs to re-evaluate tick dependency before change */
+		for_each_online_cpu(cpu)
+			tick_nohz_full_kick_cpu(cpu);
+
+		cpumask_copy(tick_nohz_full_mask, non_housekeeping_mask);
+		tick_nohz_full_running = !cpumask_empty(tick_nohz_full_mask);
+
+		/*
+		 * If nohz_full is running, the timer duty must be on a housekeeper.
+		 * If the current timer CPU is not a housekeeper, or no duty is assigned,
+		 * pick the first housekeeper and assign it.
+		 */
+		if (tick_nohz_full_running) {
+			int timer_cpu = READ_ONCE(tick_do_timer_cpu);
+			if (timer_cpu == TICK_DO_TIMER_NONE ||
+			    !cpumask_test_cpu(timer_cpu, upd->new_mask)) {
+				int next_timer = cpumask_first(upd->new_mask);
+				if (next_timer < nr_cpu_ids)
+					WRITE_ONCE(tick_do_timer_cpu, next_timer);
+			}
+		}
+
+		/* Kick all CPUs again to apply new nohz full state */
+		for_each_online_cpu(cpu)
+			tick_nohz_full_kick_cpu(cpu);
+
+		free_cpumask_var(non_housekeeping_mask);
+	}
+
+	return NOTIFY_OK;
+}
+
+static struct notifier_block tick_nohz_housekeeping_nb = {
+	.notifier_call = tick_nohz_housekeeping_reconfigure,
+};
+
 void __init tick_nohz_init(void)
 {
 	int cpu, ret;
 
-	if (!tick_nohz_full_running)
-		return;
-
-	/*
-	 * Full dynticks uses IRQ work to drive the tick rescheduling on safe
-	 * locking contexts. But then we need IRQ work to raise its own
-	 * interrupts to avoid circular dependency on the tick.
-	 */
-	if (!arch_irq_work_has_interrupt()) {
-		pr_warn("NO_HZ: Can't run full dynticks because arch doesn't support IRQ work self-IPIs\n");
-		cpumask_clear(tick_nohz_full_mask);
-		tick_nohz_full_running = false;
-		return;
+	if (!tick_nohz_full_mask) {
+		if (!slab_is_available())
+			alloc_bootmem_cpumask_var(&tick_nohz_full_mask);
+		else
+			zalloc_cpumask_var(&tick_nohz_full_mask, GFP_KERNEL);
 	}
 
-	if (IS_ENABLED(CONFIG_PM_SLEEP_SMP) &&
-			!IS_ENABLED(CONFIG_PM_SLEEP_SMP_NONZERO_CPU)) {
-		cpu = smp_processor_id();
+	housekeeping_register_notifier(&tick_nohz_housekeeping_nb);
 
-		if (cpumask_test_cpu(cpu, tick_nohz_full_mask)) {
-			pr_warn("NO_HZ: Clearing %d from nohz_full range "
-				"for timekeeping\n", cpu);
-			cpumask_clear_cpu(cpu, tick_nohz_full_mask);
+	if (tick_nohz_full_running) {
+		/*
+		 * Full dynticks uses IRQ work to drive the tick rescheduling on safe
+		 * locking contexts. But then we need IRQ work to raise its own
+		 * interrupts to avoid circular dependency on the tick.
+		 */
+		if (!arch_irq_work_has_interrupt()) {
+			pr_warn("NO_HZ: Can't run full dynticks because arch doesn't support IRQ work self-IPIs\n");
+			cpumask_clear(tick_nohz_full_mask);
+			tick_nohz_full_running = false;
+			goto out;
 		}
+
+		if (IS_ENABLED(CONFIG_PM_SLEEP_SMP) &&
+				!IS_ENABLED(CONFIG_PM_SLEEP_SMP_NONZERO_CPU)) {
+			cpu = smp_processor_id();
+
+			if (cpumask_test_cpu(cpu, tick_nohz_full_mask)) {
+				pr_warn("NO_HZ: Clearing %d from nohz_full range "
+					"for timekeeping\n", cpu);
+				cpumask_clear_cpu(cpu, tick_nohz_full_mask);
+			}
+		}
+
+		pr_info("NO_HZ: Full dynticks CPUs: %*pbl.\n",
+			cpumask_pr_args(tick_nohz_full_mask));
 	}
 
-	for_each_cpu(cpu, tick_nohz_full_mask)
+out:
+	for_each_possible_cpu(cpu)
 		ct_cpu_track_user(cpu);
 
 	ret = cpuhp_setup_state_nocalls(CPUHP_AP_ONLINE_DYN,
 					"kernel/nohz:predown", NULL,
 					tick_nohz_cpu_down);
 	WARN_ON(ret < 0);
-	pr_info("NO_HZ: Full dynticks CPUs: %*pbl.\n",
-		cpumask_pr_args(tick_nohz_full_mask));
 }
 #endif /* #ifdef CONFIG_NO_HZ_FULL */
 
@@ -1209,7 +1289,7 @@ static bool can_stop_idle_tick(int cpu, struct tick_sched *ts)
 	if (unlikely(report_idle_softirq()))
 		return false;
 
-	if (tick_nohz_full_enabled()) {
+	if (tick_nohz_full_running) {
 		int tick_cpu = READ_ONCE(tick_do_timer_cpu);
 
 		/*

-- 
2.43.0

