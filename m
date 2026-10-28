Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793158333;
	b=FslKZqtsQFSnUwJWfOjJQrMuvrQYqJGzLZnPJH0pYaqi1XYA5imVRG6pvw75RjKN4xqn
	 PudyOrBzjSjeDMOiCeD1/HcypaQwD+v+OsNz16riokvYBZI9Ynm/HR9OUOfa6MHn5uyou
	 eLud5A8T8zfTavdSAhdlgfcohVEb9pry44CTFOfGq/Li6tWgABYd6CHID+QMvK2Ll2RpT
	 hE3EY5EjI7kDPuwbOzPsktS9zh5f8oDW+jaFi79yUzBl0AZl8XmNG6Vt9lUsyDFVRDs58
	 MQp3bCq3OCmuWfi2A8aidGRyeOBmkigPe38vnowPEJIIm8kDoIhJbinA/D0oL74QhMQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793158333;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=LRZZVIsO7LFDD1RZgHRl4aFmxArltI3DGnWuMP6gavM=;
	b=W3lfXRSv5s4W5ADh2sCihRu8Kv4m/KW9mtonmTX8t9ik19TxHOR7PFawdo6oEnCt4K0f
	 jjJ6y6u4Ie5i9JJXdERH3ayjPDdpDAk889/wyVxcc2xJwJmiQ7E42HQX197eeclINluVM
	 4iQiug2Z7D1LMOlSmY4qVGeZ9hidu+zI+w+g0w11CuojaLoZVqUOoQW2N7rr35O8SkjJ1
	 lTxxy+myznb8r6+NxHp2ld2lQAHXaMknBETfwlKTRqIVPG1iD8KFuq4bJI5VKAoRkAAAC
	 2Ig0QijbPuQuRr8x+QBhTPDp0IGkWyDJC6YFdiOr1bJn9TEmcElF/LDCaiBvi0Ycv0A==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LOb+Y0j7;
	arc=none smtp.remote-ip=209.85.221.41
Received: from mail-wr1-f41.google.com (mail-wr1-f41.google.com [209.85.221.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 92691606A33B
	for <linux-doc@vger.kernel.org>; Wed, 28 Oct 2026 03:32:12 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 92691606A33B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LOb+Y0j7
Received: by mail-wr1-f41.google.com with SMTP id ffacd0b85a97d-48af4d4e61fso287590f8f.2
        for <linux-doc@vger.kernel.org>; Tue, 27 Oct 2026 20:32:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793158331; x=1793763131; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=LRZZVIsO7LFDD1RZgHRl4aFmxArltI3DGnWuMP6gavM=;
        b=LOb+Y0j7c5va+16vINQoubMdS6RUn/ZyKDxF4hKCL33TSG64UK8Ax/AvoJFfgyVlUF
         sJ4ge6TeZLKzAAaEKBk9z7wZfU6yk6lKUBYU4Qam+g9B1Lp3URqgIqs5AF8heOc6nlvl
         gZBXx+KunEWVLudA+0Fx2z7i/HXTAufUezXfvttW62bvEdt/oInIVmcAQVlz/I61/uOP
         n2z8X/bpMCH9w6OdQ5a3vU+DJj3y8EVaskAyZL58FdA6AOIlRzkCbwr4QM3AP0ASMfzS
         DuFyYgHUe9XWCw9Ggi+cAGViXOSvvmExOwaMcjTZOfsLMcsNwEnzjOnd3UALIV289Srm
         wlrg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793158331; x=1793763131;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=LRZZVIsO7LFDD1RZgHRl4aFmxArltI3DGnWuMP6gavM=;
        b=dkzHypjeXLqkNTZf4A4QBmJIef1newQxZukhsGLKrVon7OWuyOu5wh2MNejBd/2t6m
         lL/9bwCHQESutcGwTpkQqO6gtZgE9Fw7cYZwDbu2hBxvkGep3F+jHazZPOrjWgVrDxx4
         R2ELFwn7SasbvbNyXYx08f/yMCS6MKb+YcSUeS7JtxgQPpT53iLbUKD0UVh4k3OhobWb
         knV7OdJQn5kqh+JLyBlxSjRTS/FDr9oeGGg5LLkzpYBjKLMIk3FWB4LYvOceqlPEHGLG
         HRB+dehM5ztq5pLAsRzQhPE/DBH3NnUN7xnMIBUUITteshgBP4778RYP+h34g0d9B/r+
         U8sg==
X-Forwarded-Encrypted: i=1; AKwUvBz7G8GLma4UNYMWsCWxPgYUkWmktPAAE6hQP6XUlfyZWEOvyIPkjU/vsr9/k4/jSRhA9HZyRQqqbRk=@vger.kernel.org
X-Gm-Message-State: AFq9FYLjRL/z90SEEKlXnryPO1sQfDPnMGUL/goBmNvF/D1sSWjJmzUC
	n6uREJRZdU4YqciCM5JIlPAh0kEKIe6/tHeSTBwJwyAk4KIyg5VfCdn+
X-Gm-Gg: AYBFou1HHBJUE7p2uKDiuN3aiuBClwJPRnQFXPIHsSFkOQl3Y1jH6u1ue4eea5C7jhI
	oCYNEbFm/yiyWaW3uTbCD0edepHxM2hL2YTrw4UbVgJ/cb3VLCaJd1XxnPbruRMyD6a3PT2vrub
	OjRnQoGY9tuEtIAg790HVycp+dDxVK+hGe/k6SnSBjj4ccwQrbEW2kzXj/SfaT7cgmmSqpRbQgM
	zDUeVxCkISlLi5/orzCpZ39Ymt8sQhCnHGnJmWmIhq1Ro8OvpbhCqnf/LH7z2hTYH6HSXHs9bgd
	DkfjY75zO/6eWDIDabH6ew+raaO5oHwv2E5zRGiDp6oF3oK9+Iod0zT67bulqcreZREkIihoNzU
	pGYPsgKb/SbxltIN4/flIJkxVLOe0nxhyVQOEldHM83vJ3Li1XFGDFY1k7WKrT+BcWbfiweBpzw
	Wp0JH77LaolPI0LZPi6t3b4u+xfsHyyHi9nmof48Rwl/qyrVmPY4QF0oVlcoJ8SCpL2ZHhkBnsv
	s9ZlPdym8+UVvqV06tJfx20KG7rFLmorvg9zIgUnk9xZzUzlvW90xHYaqSi0azsM+sYpqV6LelT
	YpAeX1I/S9R7rqVjvJxtLzk6FOiPBq6+Lc0h5sJM6MgEsxhMxTrZqgzR79/6TrJlwk2pL+T3p5N
	iuL4vFGeeZ8H5mfLpfOKyCzxvgKrdSO+SDsuTiJYxJybbCbgjl92MxNPFGBna8iKfLWyo//H/qs
	U1DIMI/DwGA9BM8RMgJrahCGH8G9LejckB
X-Received: by 2002:a05:6000:2089:b0:48c:4444:f0a2 with SMTP id ffacd0b85a97d-48e5d58cb94mr2760059f8f.7.1793158330919;
        Tue, 27 Oct 2026 20:32:10 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-a45b-7d01-5035-b393-698f-53f0.310.pool.telefonica.de. [2a02:3100:a45b:7d01:5035:b393:698f:53f0])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e3ecdfd8dsm24290569f8f.56.2026.10.27.20.32.07
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 27 Oct 2026 20:32:09 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Steven Rostedt <rostedt@goodmis.org>,
	Peter Zijlstra <peterz@infradead.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Sebastian Andrzej Siewior <bigeasy@linutronix.de>
Cc: Karl Mehltretter <kmehltretter@gmail.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Ingo Molnar <mingo@redhat.com>,
	Andy Lutomirski <luto@kernel.org>,
	Frederic Weisbecker <frederic@kernel.org>,
	"Paul E. McKenney" <paulmck@kernel.org>,
	Boqun Feng <boqun@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Ben Segall <bsegall@google.com>,
	Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	K Prateek Nayak <kprateek.nayak@amd.com>,
	Hongyan Xia <hongyan.xia@transsion.com>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-trace-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	linux-doc@vger.kernel.org,
	llvm@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH v2 10/13] entry: Classify ordinary hardirq return-tail work as hardirq context
Date: Wed, 28 Oct 2026 04:31:24 +0100
Message-Id: <20261028033127.82193-11-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261028033127.82193-1-kmehltretter@gmail.com>
References: <20261028033127.82193-1-kmehltretter@gmail.com>
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

An ordinary hardirq removes its original count and lockdep state before the
return path may preempt. Traceable return-tail callbacks then appear to run
in the interrupted task or softirq context and can collide with recursion
state owned by that context.

Use the saved ordinary-hardirq provenance to stage a fresh hardirq-count
attempt and restore lockdep classification after the preemption decision.
Keep it across traceable return-tail work, deferred hrtimer rearming,
IRQ-on preparation, and context-tracking preparation.

Before removing the raw tail state, prepare the conditional count and
lockdep teardown and close late regular or forced-thread softirq work.
Complete any pending RCU quiescent-state transition only after that raw
teardown.

Do not repeat interrupt accounting, RCU or tick entry. Existing non-hardirq
return paths remain unchanged.

Assisted-by: LLM
---
 include/linux/hardirq.h          |  1 +
 include/linux/irq-entry-common.h | 64 ++++++++++++++++++++++++++++++--
 kernel/softirq.c                 | 21 +++++++++++
 3 files changed, 83 insertions(+), 3 deletions(-)

diff --git a/include/linux/hardirq.h b/include/linux/hardirq.h
index d4b2754468c09..22b312e674579 100644
--- a/include/linux/hardirq.h
+++ b/include/linux/hardirq.h
@@ -28,6 +28,7 @@ static __always_inline void rcu_irq_enter_check_tick(void)
 
 void irq_enter_rcu_preempt_counted(struct irqentry_hardirq_cookie cookie);
 bool irq_exit_rcu_preempt_counted_prepare(struct irqentry_hardirq_cookie cookie);
+void noinstr irqentry_hardirq_tail_exit(struct irqentry_hardirq_cookie cookie);
 
 /*
  * Prepare every potentially instrumentable part of hardirq teardown before
diff --git a/include/linux/irq-entry-common.h b/include/linux/irq-entry-common.h
index 6f649f6613312..f51aafc1b49fd 100644
--- a/include/linux/irq-entry-common.h
+++ b/include/linux/irq-entry-common.h
@@ -383,6 +383,32 @@ irqentry_hardirq_count_state_set(irqentry_state_t *state,
 		IRQENTRY_HARDIRQ_APPLIED : IRQENTRY_HARDIRQ_REJECTED;
 }
 
+/**
+ * irqentry_hardirq_tail_enter - Stage ordinary-hardirq return-tail state
+ * @state: Pointer to state returned by the matching irqentry_hardirq_enter()
+ *
+ * Make a fresh staged hardirq-count attempt and establish the lockdep
+ * classification which traceable return-tail work needs. Accounting, RCU and
+ * tick handling belong to the completed interrupt and must not be repeated
+ * here.
+ */
+static __always_inline void
+irqentry_hardirq_tail_enter(irqentry_state_t *state)
+{
+	struct irqentry_hardirq_cookie cookie;
+
+	if (!state->hardirq)
+		return;
+
+	cookie = irqentry_hardirq_count_start();
+	lockdep_hardirq_enter();
+
+	instrumentation_begin();
+	irqentry_hardirq_count_finish(cookie);
+	instrumentation_end();
+	irqentry_hardirq_count_state_set(state, cookie);
+}
+
 /**
  * irqentry_exit_cond_resched - Conditionally reschedule on return from interrupt
  *
@@ -519,7 +545,10 @@ static inline void irqentry_exit_to_kernel_mode_preempt(struct pt_regs *regs,
  *
  * The rearm on return to user mode needs no such annotation: no locks are
  * held there, so it uses the same lock chains as the rearm in hardirq
- * context.
+ * context. Ordinary-hardirq return paths do not use this wrapper: their saved
+ * provenance makes a fresh hardirq-count attempt and establishes lockdep
+ * nesting across the whole traceable tail. They call
+ * hrtimer_rearm_deferred() directly.
  */
 static __always_inline void irqentry_hrtimer_rearm_deferred(void)
 {
@@ -534,7 +563,9 @@ static __always_inline void irqentry_hrtimer_rearm_deferred(void)
  * @state:	Return value from matching call to irqentry_enter_from_kernel_mode()
  *
  * This is to be invoked after irqentry_exit_to_kernel_mode_preempt() and before
- * actually returning to the interrupted context.
+ * actually returning to the interrupted context. If @state records ordinary
+ * hardirq provenance, the caller must first invoke
+ * irqentry_hardirq_tail_enter() exactly once.
  *
  * There are no requirements for the CPU state other than being able to complete
  * the tracing, lockdep and RCU state transitions. After this function returns
@@ -543,6 +574,31 @@ static __always_inline void irqentry_hrtimer_rearm_deferred(void)
 static __always_inline void
 irqentry_exit_to_kernel_mode_after_preempt(struct pt_regs *regs, irqentry_state_t state)
 {
+	struct ct_irq_exit_state ct_state = { };
+
+	if (state.hardirq) {
+		if (!regs_irqs_disabled(regs)) {
+			instrumentation_begin();
+			hrtimer_rearm_deferred();
+			/* Tell the tracer that the return will enable IRQs. */
+			trace_hardirqs_on_prepare();
+			lockdep_hardirqs_on_prepare_irqtail();
+			instrumentation_end();
+		}
+
+		if (state.exit_rcu)
+			ct_state = ct_irq_exit_prepare();
+
+		irqentry_hardirq_tail_exit(irqentry_hardirq_count_state(state));
+
+		if (state.exit_rcu)
+			ct_irq_exit_finish(ct_state);
+
+		if (!regs_irqs_disabled(regs))
+			lockdep_hardirqs_on(CALLER_ADDR0);
+		return;
+	}
+
 	if (!regs_irqs_disabled(regs)) {
 		/*
 		 * If RCU was not watching on entry this needs to be done
@@ -584,7 +640,8 @@ irqentry_exit_to_kernel_mode_after_preempt(struct pt_regs *regs, irqentry_state_
  *
  * This is the counterpart of irqentry_enter_from_kernel_mode() and combines
  * the calls to irqentry_exit_to_kernel_mode_preempt() and
- * irqentry_exit_to_kernel_mode_after_preempt().
+ * irqentry_exit_to_kernel_mode_after_preempt(). It also establishes the
+ * conditional hardirq return tail between those calls.
  *
  * The requirement for the CPU state is that it can schedule. After the function
  * returns the tracing, lockdep and RCU state transitions are completed and the
@@ -599,6 +656,7 @@ static __always_inline void irqentry_exit_to_kernel_mode(struct pt_regs *regs,
 	irqentry_exit_to_kernel_mode_preempt(regs, state);
 	instrumentation_end();
 
+	irqentry_hardirq_tail_enter(&state);
 	irqentry_exit_to_kernel_mode_after_preempt(regs, state);
 }
 
diff --git a/kernel/softirq.c b/kernel/softirq.c
index 169c559832501..85b167db37c29 100644
--- a/kernel/softirq.c
+++ b/kernel/softirq.c
@@ -837,6 +837,27 @@ irq_exit_wake_late_softirqs(unsigned int wake_flags)
 		irq_exit_wake_ksoftirqd();
 }
 
+/**
+ * irqentry_hardirq_tail_exit - Close work and remove return-tail state
+ * @cookie: Staged hardirq-count cookie from irqentry_hardirq_tail_enter()
+ *
+ * Run every instrumentable teardown operation, including the final worker
+ * closure, before conditionally removing any applied raw hardirq count and
+ * ending lockdep nesting.
+ */
+void noinstr
+irqentry_hardirq_tail_exit(struct irqentry_hardirq_cookie cookie)
+{
+	bool do_sub;
+
+	instrumentation_begin();
+	do_sub = irqentry_hardirq_exit_prepare(cookie);
+	irq_exit_wake_late_softirqs(0);
+	instrumentation_end();
+
+	irqentry_hardirq_exit_finish(do_sub);
+}
+
 static __always_inline unsigned int __irq_exit_rcu(bool keep_hardirq_count)
 {
 	unsigned int wake_flags = 0;
-- 
2.39.5 (Apple Git-154)

