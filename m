Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794071591;
	b=lrhkEOhf19re1jsXDjw5W6FZOK+kPb/sLuO0sajjggXu9ppWDUIiH+g3zHLA9YpAS/0g
	 jj6TlOdXjWwl0hWEmWUgn3qGIPMKjZMt2A1kevZxXsOpCZoplf0uTXmO//+FQfqyxMvwL
	 3IGiw74jzDSdfGRlacMmeaE1TZw2151cv5MeiZgha9EqpbeStW80Buu+P54PjMVy6X58m
	 eVGndWji6W/d/PEEPW+Wd8dGCXMHZPPoOU7H/PE2hVjq3xMfs1ilw9ZEVXr4AJypK1Hww
	 hH9uCgMs1LY4GsSouU2CKPyPeIzEnTzpKnrleYqR0pg/SEoEpYUYCvVPh1zPWA4UTEA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794071591;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=mynYKR1ZAkpBPyX1Y39GAIXi0uQVHkLOFJGn8mGHCF8=;
	b=nuH/MJ1S99Cpe7Mgc8ZlNQAM51+PdhmN0XjpBG9E4zLXZ+cZObSFewYcPKue5/9Q/lqj
	 4NmaUZ2GfO+vAAVZ3ejvLRUp5NuugqabRoMvl2Csyobuzxgmc7R+VBLoMupp9+OLO7cK3
	 DD6WWGfkTnrHxMk18TN8LWFTt1uCwgs3BvF4YwYsQPzOCQkF3CqI6zjCOQZPHUGggI4XP
	 CDzbi3W3mQ0VY62uJkWlxnRUxamGazYJp2qOxb0iU0ryB5W7nBpKCyo1wRVs6IhJi1rMq
	 eyWcl3GsJuSOkmm7eBy+YX1DCFsztQ2tSR7T12xpucFglb9nxDYrfBM5TIAAU2HJ5FQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AlVGkqZf;
	arc=none smtp.remote-ip=209.85.221.48
Received: from mail-wr1-f48.google.com (mail-wr1-f48.google.com [209.85.221.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 81D50606D82A
	for <linux-doc@vger.kernel.org>; Sat,  7 Nov 2026 17:13:11 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 81D50606D82A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=AlVGkqZf
Received: by mail-wr1-f48.google.com with SMTP id ffacd0b85a97d-48e20ed3b9dso1431715f8f.2
        for <linux-doc@vger.kernel.org>; Sat, 07 Nov 2026 09:13:11 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794071590; x=1794676390; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=mynYKR1ZAkpBPyX1Y39GAIXi0uQVHkLOFJGn8mGHCF8=;
        b=AlVGkqZfi0ocabBbxkt2TvF5QtI39r3zXqB4qI3AH1FllhWANSWuGEqNJv5LOzmuxa
         9ccpc/FYIqJMUn3gf7pEUnbdTJAGORDj3s/IqFYmC/ADcn1e0eYzqGCKU12Z2riCt4A0
         mFraTB9qHtBpwxehnrJaooQE3e3KJ0i1Xv4Q75KnZuTew6xTXlaK2TNPLf3S9fr2OE5f
         WBw8pxOlCFMaTwgGnNByzPQD05IrFWHGccXNS0hZm7QLT9Ri83BrYeI/4c127U8ZbwCU
         J+ySr+wQ1tXiMVAbI343gkpyG8GstjI3kbT/OVmTmfbm9CFFrM2h6mJ+5RbpMRiDOISH
         /6Qw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794071590; x=1794676390;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=mynYKR1ZAkpBPyX1Y39GAIXi0uQVHkLOFJGn8mGHCF8=;
        b=nuY4ZG7g4hnRMhmGDUCq6EeU/KXywQkMIn3mYci3nFEuZU8yae6CoFX/997plL6uln
         WzBuEyfa2oRfN2leYHAeD9QCfQ0tUWdW70OFUe6GmF9CaIqgRVKsDXy0aTkxqaiBKobc
         Z9zyWIKBRQDQFMF+RRmA8dBG8H0TITBjNjGV7GF+wD8cIkimyJXsKIi92yOrVds+AlnH
         N/kt7mhGKsmKVElK5krbohyphmydO7r7zaxPgHnsauU02ReWFSIS8rGmEP6SDhvCc453
         b3RVP/Q0iAmV0LUZWdC1JWl/+eQSEy/fQ+wRW1oDeu7dVxCFWGcfs8noCybhMHmElWj+
         elPg==
X-Forwarded-Encrypted: i=1; AL+hErHyFJPblMBhxvHq0Jdbv8Ss1LSkfebDbFAELvvoW54+N63rncHu2J/AmssB1xSgIm0G96MuHSV76tQ=@vger.kernel.org
X-Gm-Message-State: APuU4Z+puPfNYHwzJbBgJZAwsAHeBCCOgw5mz5TEIQAFh0BJilkxgbH8
	B0C0GMQ8ZJ1U1PcuQYdCN9fip1+CPuF0LS0NFjoptXi6Js0Muqpe6C1q
X-Gm-Gg: AYBFou2sdLZsI+LbVALULk5ayvQeTcM6x0W8bZOA5BMxAl69Hxo+Ftyc5UN5s3TBu26
	tC7wb/KNnJ8rtA1uU+q1p91j/0vXzEPgQoc1lOi0b9f/+n2XHnLVvxrtXk20723BQ2YWx9fNZuf
	r0Qk08oknI5nXcysY3s0Sq6CvVwqwMbc2bcBQRpaFAIVF6ESfSKaUNal3+HsyU31bTLZ5VQvFxm
	oVd9+XWClOq1FTuGcQO1ELTDWalvYOsQLfiLMCJhXkGkln0Zm4IWmRtdogm9DrglxFE89XP+WBD
	sCL/SPRWWptT8qzLAeWB7/r2/+WSrbqPWfPrcWAzovAe7ULySl/X0fU4WkrVqNbHcVf0CawcTYW
	HBHzDtFcaOtJPqvp1WU2qcsMeBfww2QCChnfK6hiMxp8uECGFRzZesztT0mE7vTJsJi5sCHc/Zq
	uBdPbixtAzIEi94ErBmLRJHTkF6ZLjXK7H5ule31ofZYnfVMScAONB1eSqeTTl4joqh3j/te5k0
	2NltyT5u2INXtBHI0fM/sFhnMzpTfelWm3UN/+gYqFMHFI3C5rSy/4FRBzL728EC5sCY0GgEHIl
	fs/7DU5CP2LqpGkfz2QfmmYaFV26c/yTKO5VmIbDoGol6ZnaQGvWcUPTsL/X9Cy0h7uY5tpebLN
	aNkU+5CYLzCaslNuKb5iGyuIV7P4c3KXE06BcSLYv0fiwe039LU9IDk3Ba8+zjyh1cAmzOKsPiP
	KVRyIMSq70Otrx97gWz8akog5vm2QVz+A=
X-Received: by 2002:a05:6000:2689:b0:48b:e50:714e with SMTP id ffacd0b85a97d-493aa8d24d2mr7126885f8f.36.1794071589545;
        Sat, 07 Nov 2026 09:13:09 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-b149-1401-90c6-65b4-035d-1e3d.310.pool.telefonica.de. [2a02:3100:b149:1401:90c6:65b4:35d:1e3d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d723222fsm10627105f8f.21.2026.11.07.09.13.08
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 07 Nov 2026 09:13:09 -0800 (PST)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Gabriele Monaco <gmonaco@redhat.com>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Masami Hiramatsu <mhiramat@kernel.org>,
	Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
	Thomas Gleixner <tglx@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
	Clark Williams <clrkwllms@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	Andy Lutomirski <luto@kernel.org>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Wen Yang <wen.yang@linux.dev>,
	linux-trace-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 1/9] tracing/irq: Add generic IRQ context boundary tracepoints
Date: Sat,  7 Nov 2026 18:12:44 +0100
Message-Id: <20261107171252.25090-2-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261107171252.25090-1-kmehltretter@gmail.com>
References: <20261107171252.25090-1-kmehltretter@gmail.com>
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

IRQ action tracepoints describe handlers, not the enclosing interrupt
context. One hardirq context may run several actions, while synthetic
dispatch can invoke an action outside hardirq context.

Add bare tracepoints at the generic hardirq and serving-softirq
boundaries using DECLARE_TRACE() so they can be hooked by in-kernel
verifiers and tests without exposing a new user-space tracefs ABI.
Record hardirq depth and whether serving-softirq state temporarily
replaces hardirq state during interrupt return.

A boundary callback can raise work after the normal pending-work
decision. Include work raised at softirq entry in the initial pending
snapshot, and hand work raised at a final boundary to the appropriate
worker.

The tracepoints cover irq_enter() or irq_enter_rcu() and their matching
exits. Raw and direct low-level entry users remain outside their scope.

Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 include/trace/events/irq.h | 56 +++++++++++++++++++++++++
 kernel/softirq.c           | 83 +++++++++++++++++++++++++++++++++++++-
 2 files changed, 137 insertions(+), 2 deletions(-)

diff --git a/include/trace/events/irq.h b/include/trace/events/irq.h
index 837c1740d0d07..1b2e05aaf7763 100644
--- a/include/trace/events/irq.h
+++ b/include/trace/events/irq.h
@@ -207,6 +207,62 @@ DEFINE_EVENT(tasklet, tasklet_exit,
 	TP_ARGS(t, func)
 );
 
+/*
+ * Following tracepoints are not exported in tracefs and provide hooking
+ * mechanisms only for testing and debugging purposes.
+ */
+
+/*
+ * hardirq_context_entry - generic hardirq state has been established
+ * @depth: hardirq nesting depth, including the context being entered
+ *
+ * This tracepoint is emitted after generic hardirq preempt-count, lockdep,
+ * timer, and accounting state has been established. It does not describe the
+ * architecture-specific interval before irq_enter() or irq_enter_rcu().
+ */
+DECLARE_TRACE(hardirq_context_entry,
+	      TP_PROTO(unsigned int depth),
+	      TP_ARGS(depth));
+
+/*
+ * hardirq_context_exit - generic hardirq state is about to be removed
+ * @depth: hardirq nesting depth, including the context being exited
+ *
+ * This tracepoint is emitted with interrupts disabled near the end of generic
+ * hardirq exit, after tick-exit work and before hardirq preempt-count state is
+ * removed. A late-work handoff may run after callbacks return. Hardirq
+ * accounting ends earlier.
+ */
+DECLARE_TRACE(hardirq_context_exit,
+	      TP_PROTO(unsigned int depth),
+	      TP_ARGS(depth));
+
+/*
+ * softirq_context_entry - serving-softirq state has been established
+ * @serving: whether the current task is serving a softirq
+ * @from_hardirq: whether hardirq state was replaced by serving-softirq state
+ *
+ * This tracepoint runs with local interrupts disabled after the serving bit is
+ * set. On PREEMPT_RT it includes preparation before handle_softirqs(), even
+ * if the pending-work check finds nothing. It does not mark an individual
+ * action or the start of CPU-time accounting.
+ */
+DECLARE_TRACE(softirq_context_entry,
+	      TP_PROTO(bool serving, bool from_hardirq),
+	      TP_ARGS(serving, from_hardirq));
+
+/*
+ * softirq_context_exit - serving-softirq state is about to be removed
+ * @serving: whether the current task is serving a softirq
+ * @from_hardirq: whether hardirq state will replace serving-softirq state
+ *
+ * This tracepoint runs with local interrupts disabled before the serving bit is
+ * cleared. On PREEMPT_RT this includes teardown after handle_softirqs().
+ */
+DECLARE_TRACE(softirq_context_exit,
+	      TP_PROTO(bool serving, bool from_hardirq),
+	      TP_ARGS(serving, from_hardirq));
+
 #endif /*  _TRACE_IRQ_H */
 
 /* This part must be outside protection */
diff --git a/kernel/softirq.c b/kernel/softirq.c
index 7fc2200392cdf..0d5fe265e354b 100644
--- a/kernel/softirq.c
+++ b/kernel/softirq.c
@@ -178,7 +178,9 @@ bool local_bh_blocked(void)
 
 void __local_bh_disable_ip(unsigned long ip, unsigned int cnt)
 {
+	unsigned long trace_flags = 0;
 	unsigned long flags;
+	bool trace_serving;
 	int newcnt;
 
 	WARN_ON_ONCE(in_hardirq());
@@ -200,6 +202,16 @@ void __local_bh_disable_ip(unsigned long ip, unsigned int cnt)
 		}
 	}
 
+	/*
+	 * A serving interval starts here, before handle_softirqs(). When its
+	 * entry is traced, keep IRQs and task switches from observing the bit
+	 * before the event. Any blocking BH lock was acquired above.
+	 */
+	trace_serving = (cnt & SOFTIRQ_OFFSET) &&
+			trace_softirq_context_entry_tp_enabled();
+	if (trace_serving)
+		local_irq_save(trace_flags);
+
 	/*
 	 * Track the per CPU softirq disabled state. On RT this is per CPU
 	 * state to allow preemption of bottom half disabled sections.
@@ -233,15 +245,27 @@ void __local_bh_disable_ip(unsigned long ip, unsigned int cnt)
 			raw_local_irq_restore(flags);
 		}
 	}
+
+	if (trace_serving) {
+		trace_softirq_context_entry_tp(!!in_serving_softirq(), false);
+		local_irq_restore(trace_flags);
+	}
 }
 EXPORT_SYMBOL(__local_bh_disable_ip);
 
 static void __local_bh_enable(unsigned int cnt, bool unlock)
 {
+	bool entering = (cnt & SOFTIRQ_OFFSET) && !in_serving_softirq();
+	bool trace_exiting = (cnt & SOFTIRQ_OFFSET) && !entering &&
+			     trace_softirq_context_exit_tp_enabled();
 	unsigned long flags;
 	bool sirq_en = false;
 	int newcnt;
 
+	/* Callers already disabled IRQs around the counter and its events. */
+	if (trace_exiting)
+		trace_softirq_context_exit_tp(!!in_serving_softirq(), false);
+
 	if (IS_ENABLED(CONFIG_PREEMPT_RT_NEEDS_BH_LOCK)) {
 		DEBUG_LOCKS_WARN_ON(current->softirq_disable_cnt !=
 				    this_cpu_read(softirq_ctrl.cnt));
@@ -276,6 +300,18 @@ static void __local_bh_enable(unsigned int cnt, bool unlock)
 			WARN_ON_ONCE(current->softirq_disable_cnt < 0);
 		}
 	}
+
+	/*
+	 * An exit probe can raise a softirq while serving state still suppresses
+	 * the normal ksoftirqd wakeup. Hand it off once no outer BH-disable
+	 * reference remains.
+	 */
+	if (trace_exiting && sirq_en && unlikely(local_softirq_pending()))
+		wakeup_softirqd();
+
+	/* local_bh_enable() can turn BH-disabled state into serving state. */
+	if (entering)
+		trace_softirq_context_entry_tp(!!in_serving_softirq(), false);
 }
 
 void __local_bh_enable_ip(unsigned long ip, unsigned int cnt)
@@ -640,11 +676,15 @@ static void handle_softirqs(bool ksirqd)
 	 */
 	current->flags &= ~PF_MEMALLOC;
 
-	pending = local_softirq_pending();
-
 	from_irq_exit = softirq_handle_begin();
 	in_hardirq = lockdep_softirq_start();
 	account_softirq_enter(current);
+	if (!IS_ENABLED(CONFIG_PREEMPT_RT))
+		trace_softirq_context_entry_tp(!!in_serving_softirq(),
+					       from_irq_exit);
+
+	/* Include work raised by the context-entry event. */
+	pending = local_softirq_pending();
 
 restart:
 	/* Reset the pending bitmask before enabling irqs */
@@ -692,6 +732,14 @@ static void handle_softirqs(bool ksirqd)
 		wakeup_softirqd();
 	}
 
+	if (!IS_ENABLED(CONFIG_PREEMPT_RT) &&
+	    trace_softirq_context_exit_tp_enabled()) {
+		trace_softirq_context_exit_tp(!!in_serving_softirq(),
+					      from_irq_exit);
+		/* The final pending-work decision above has already completed. */
+		if (unlikely(local_softirq_pending()))
+			wakeup_softirqd();
+	}
 	account_softirq_exit(current);
 	lockdep_softirq_end(in_hardirq);
 	softirq_handle_end(from_irq_exit);
@@ -722,6 +770,7 @@ void irq_enter_rcu(void)
 		tick_irq_enter();
 
 	account_hardirq_enter(current);
+	trace_hardirq_context_entry_tp(hardirq_count() >> HARDIRQ_SHIFT);
 }
 
 /**
@@ -796,6 +845,36 @@ static inline void __irq_exit_rcu(void)
 		wake_timersd();
 
 	tick_irq_exit();
+	if (trace_hardirq_context_exit_tp_enabled()) {
+		bool ksoftirqd_wake_requested = false;
+		bool timersd_wake_requested = false;
+
+		trace_hardirq_context_exit_tp(hardirq_count() >> HARDIRQ_SHIFT);
+
+		/* Hand work raised by the final boundary event to its worker. */
+		if (hardirq_count() == HARDIRQ_OFFSET) {
+			if (irq_count() == HARDIRQ_OFFSET &&
+			    unlikely(local_softirq_pending()) &&
+			    should_wake_ksoftirqd()) {
+				wakeup_softirqd();
+				ksoftirqd_wake_requested = true;
+			}
+
+			if (IS_ENABLED(CONFIG_IRQ_FORCED_THREADING) &&
+			    force_irqthreads() && local_timers_pending_force_th()) {
+				wake_timersd();
+				timersd_wake_requested = true;
+			}
+
+			/* The timersd wakeup can itself raise a softirq. */
+			if (timersd_wake_requested &&
+			    !ksoftirqd_wake_requested &&
+			    irq_count() == HARDIRQ_OFFSET &&
+			    unlikely(local_softirq_pending()) &&
+			    should_wake_ksoftirqd())
+				wakeup_softirqd();
+		}
+	}
 	preempt_count_sub(HARDIRQ_OFFSET);
 }
 
-- 
2.39.5 (Apple Git-154)

