Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792645663;
	b=A5/Tf751kuCd6tvRAAcbKgyAwfpFvleMkXLB6nbiom8NFbsIPqcUee5lti7PQlfQY1mi
	 KaOZsIkBKPEvjH4XlutR0ybc2uFVIvj0s1ZoO/nIgYQ8i1g4t7Cu1gYDzbMxpdsR6XxMz
	 soeeaJruFDRulqdo3AA36rSwT2gTvq8zI7ux1LR8GsngPyZpeGWqWcCbzUkPXMvP9/CRU
	 Hk8YWZspkwirOMkPtTZXxZ6rhYjx8SFO4NDFUgYx9RlI1Lqwe/nA2K93hvHXH9X4MTuv+
	 84pi22EMG84LWjbUkoqhtNeGcv9cnnqFoud0DZ1pA9wGDIFH5dC7H8Ayd3TrfZ4FQhw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792645663;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=Sgg+G8XeM2PfG9AtbRKOTPbh1eb2lzeKqqM4m/533Ag=;
	b=tr86YWFLUHy/1Uwei7ljv2E9KXI2Gxh9WZtSLtDjfNhmimzM6FAF0U4Ppx/y4jCL4yVB
	 WNEgdj6yF2AOfp9IJtR8jUhTtX8BJ9BkMopBC+r+T3nlXmN1VrUGhJzOmzMhGHPEwxNOy
	 gEd7CFjtzG3Kki3ZvDO0UMy6/YLCSnTfKmdCGezYIWcFoauI4+pBfdY5X5qxClKtYbfcw
	 uU9JMZv6hFwf84K3u6kISd1ZV+WOTa4TMSDpxBeWpvrWg4Ld8/yGo6pw3Bw8aauRaYBnP
	 624KgDySSQb5NiuxOXNoj7iTVHab/4LmsfXHVBJlN003KSoUuMS4FPehd+0uQY5R/CQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=l85Qwa9+;
	arc=none smtp.remote-ip=209.85.221.44
Received: from mail-wr1-f44.google.com (mail-wr1-f44.google.com [209.85.221.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EC05D606A322
	for <linux-doc@vger.kernel.org>; Thu, 22 Oct 2026 05:07:42 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EC05D606A322
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=l85Qwa9+
Received: by mail-wr1-f44.google.com with SMTP id ffacd0b85a97d-48b001cd92bso786551f8f.2
        for <linux-doc@vger.kernel.org>; Wed, 21 Oct 2026 22:07:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792645661; x=1793250461; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Sgg+G8XeM2PfG9AtbRKOTPbh1eb2lzeKqqM4m/533Ag=;
        b=l85Qwa9+spqQeCliClaktgAKW1w1lKYu+A5yFZL0kPGxM5s6EykghBPtvvF7/Obsd+
         67htLKDIG+NDMNT8zQRG5HOZUoAZrT8hkJln01n6gSkWqlOKbAD2/NHHy/dUWZE3+zoM
         AmxqW3xCu52Ojtzcs4o03ppsXejnWxq7An1iwXPMgi9sFvHEJarkXnpLVWaIhaR+Omt5
         T8jp49doQp3DLpzwQ+is1IOvsi6DvBVElHEcegz/8UWDiF2+2swUB0UNnm8S6Bw0/13y
         JAWK9blfIg3ZQozELksHwolu4reAjS4dtKCpb/MN+mVwMnysXuaEhyAFizOTPO/jn4ev
         rTHw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792645661; x=1793250461;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Sgg+G8XeM2PfG9AtbRKOTPbh1eb2lzeKqqM4m/533Ag=;
        b=Zv7TeyISFhsrgovIZ7V6GPPUQ7rzcWwerNNgj7MhRCqH39/N2fCI2gjOvl3u94bw8I
         /7hIVrwqfaW7B0QoK8hH6z8UEceK5haLRZ3YCn0nB3Kz34MpIkKnBXPHCyV9psOZ7NJn
         HUdG01574uGjA87qHC83xu8YuOa8PuNCNvcdVNfeOqhTyHt8R/fnnWEtoo7XwsqaXLgj
         67pmoWG8s6HaXYLuJydsF2j5NpafqS3cJPzO2Xpx+BIthQmdQGPe8TNVENDvnIGRKKBj
         yuykNU1mci5pN0IALRfBnt9KiJVj47wUGXZMyQ1omydgQCqugltG18pPt5pCdfvOddlN
         /odg==
X-Forwarded-Encrypted: i=1; AKwUvByzA2oQ//4D5NJOX9ok5oEpWToJN4PJKVM8Y6VLcuC2kXcd0mrH+QHqFhPq9vG3q89/B6V10O4cKkQ=@vger.kernel.org
X-Gm-Message-State: AFq9FYIreNCCafY/mLyhm57hlVaxGwrMHq9+/7zzQUEvPqhbAqTM964J
	/lFE1bhWa3Pt1yxaGChJHAO3vzGhHTk2idd6DQQPsywed5GBzc0F5+1m
X-Gm-Gg: AYBFou0U86y8zWa+d/sPodB7QMaUjnPFvBVydOMC8ueJZUXcZet6n+tGOsd+6sfyN2C
	OMc54PoQtc0CG4igYandxYYasVwOB+URFbpmSPWny6FOzYnrYytDs+I3Dw+Y81DqNOVjDyNI8EA
	gGE9WlpoAxLuLim20g37iUkkJ2f7EahNXZXi7xpK1FZTAIxccJJwqEQmd1bAgXnpqF5F50gqP2E
	cRDX2XNAp2LChBMAIbo5g4l5pOJsvQ5LzkTHmh/wylrj3kOITueymIw75PnCwrCzO1hwO1+lylg
	v5CipCyzR01GgcywF2VussHSHA0Fqw5BF7oCxLJ1xgJL8DiefYLSDDeWKAkXP7f+zOaLoUJgoab
	NZ1OOVvbq3wLxbyDZ7wNi0gEyeF58LLO5oQCgfGkddg5vY2VQd0600K0S2hSByeZNvYOFRrXoeA
	3tad0FCi9kH9Rk7G2jEVM9IcD8FaUmCnbRZxe8BmGynqnJTk3QAntWulje5R7ssMum7+6SR0OQC
	sWCY3UfigBy51DbReDdO26inS0dI6oanJ0bOrOyfQ8h0sHVCsY3OHwKbyIAxCeQ9349vlxgZ4in
	MUNLhO0sXlL5nwE4sadMnMZUZuhVXBU/4BbzD1wGF9GlQuPj+NWJz908vDahnuAbRb+CpkiDi9U
	lND6/Ok2Mju3YRnJ0sBpuGhT9YZWLiKRVwSG46yA+QY0MmA4e7Q8U/LxX6TY=
X-Received: by 2002:a05:6000:1801:b0:48c:7387:6b88 with SMTP id ffacd0b85a97d-48e264cb7abmr5434419f8f.37.1792645661144;
        Wed, 21 Oct 2026 22:07:41 -0700 (PDT)
Received: from localhost.localdomain (dynamic-2a02-3100-ad43-d501-2c28-bb72-120d-420e.310.pool.telefonica.de. [2a02:3100:ad43:d501:2c28:bb72:120d:420e])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e254eeef6sm9994979f8f.8.2026.10.21.22.07.38
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Wed, 21 Oct 2026 22:07:39 -0700 (PDT)
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
	linux-trace-kernel@vger.kernel.org,
	linux-rt-devel@lists.linux.dev,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [RFC PATCH 5/9] docs/rv: Document the IRQ-entry monitors
Date: Thu, 22 Oct 2026 07:07:08 +0200
Message-Id: <20261022050712.75035-6-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <20261022050712.75035-1-kmehltretter@gmail.com>
References: <20261022050712.75035-1-kmehltretter@gmail.com>
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

Document the irqstate and irqexit models, their synchronization rules,
PREEMPT_RT behavior, tracefs interface, and coverage limits.

irqstate observes hardirq contexts whose boundaries pass through
irq_enter() or irq_enter_rcu() and irq_exit() or irq_exit_rcu(). Direct
__irq_enter() and __irq_exit() users, raw-only paths, and
architecture-specific intervals before generic entry and after generic
exit remain outside its coverage.

Clarify that irqexit monitors preempt_schedule_irq(), not the complete
interrupt-return path.

Assisted-by: LLM
---
 Documentation/trace/rv/index.rst            |   1 +
 Documentation/trace/rv/monitor_irqentry.rst | 279 ++++++++++++++++++++
 2 files changed, 280 insertions(+)
 create mode 100644 Documentation/trace/rv/monitor_irqentry.rst

diff --git a/Documentation/trace/rv/index.rst b/Documentation/trace/rv/index.rst
index 29769f06bb0f0..6b0c7db790786 100644
--- a/Documentation/trace/rv/index.rst
+++ b/Documentation/trace/rv/index.rst
@@ -15,6 +15,7 @@ Runtime Verification
    monitor_wip.rst
    monitor_wwnr.rst
    monitor_sched.rst
+   monitor_irqentry.rst
    monitor_rtapp.rst
    monitor_stall.rst
    monitor_deadline.rst
diff --git a/Documentation/trace/rv/monitor_irqentry.rst b/Documentation/trace/rv/monitor_irqentry.rst
new file mode 100644
index 0000000000000..f2bb9ed2c0029
--- /dev/null
+++ b/Documentation/trace/rv/monitor_irqentry.rst
@@ -0,0 +1,279 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+IRQ-entry monitors
+==================
+
+- Name: irqentry
+- Type: container for IRQ-entry context monitors
+- Author: Karl Mehltretter <kmehltretter@gmail.com>
+
+Description
+-----------
+
+The ``irqentry`` container groups monitors which compare interrupt-related
+events with the execution context recorded by the kernel.  The monitors are
+architecture independent: they consume generic tracepoints and do not require
+an architecture assembly hook.
+
+The first monitor deliberately observes only safe, instrumentable events.  It
+does not cover the interval between physical interrupt entry and establishment
+of generic hardirq state.
+
+Monitor irqstate
+----------------
+
+The ``irqstate`` monitor checks the ordering of hardirq contexts whose entry
+and exit pass through ``irq_enter()``/``irq_exit()`` or
+``irq_enter_rcu()``/``irq_exit_rcu()``, and of complete serving-softirq
+contexts. Each boundary must agree with the corresponding preempt-count state:
+
+.. list-table:: Event and required context
+   :header-rows: 1
+
+   * - Kernel event
+     - Model event
+     - Required environment
+   * - ``hardirq_context_entry``
+     - ``hardirq_entry``
+     - ``hardirq > 0``; serving-softirq state selects the source state
+   * - ``hardirq_context_exit``
+     - ``hardirq_exit``
+     - ``hardirq > 0``; serving-softirq state selects the destination state
+   * - ``softirq_context_entry``
+     - ``softirq_entry`` or ``softirq_entry_from_hardirq``
+     - ``hardirq == 0 && serving_softirq == 1``
+   * - ``softirq_context_exit``
+     - ``softirq_exit`` or ``softirq_exit_to_hardirq``
+     - ``hardirq == 0 && serving_softirq == 1``
+   * - ``sched_switch`` from a serving-softirq task (PREEMPT_RT)
+     - ``softirq_suspend``
+     - ``hardirq == 0``
+   * - ``sched_switch`` to a serving-softirq task (PREEMPT_RT)
+     - ``softirq_resume``
+     - ``hardirq == 0``
+
+``serving_softirq`` uses ``in_serving_softirq()``.  It therefore distinguishes
+a serving-softirq interval from a task which merely disabled bottom halves.
+The hardirq condition uses the hardirq component of ``preempt_count``.
+Softirq events also report whether hardirq state was replaced for inline
+processing during interrupt return. The exit event reports whether hardirq
+state will be restored.
+
+On PREEMPT_RT the serving interval includes preparation before
+``handle_softirqs()`` and teardown after it, not just handler execution or
+CPU-time accounting. A worker can enter and leave this context even if its
+pending-work check finds nothing. The RT entry event follows the counter
+update that sets the serving bit, and the exit event precedes the update
+that clears it. Processing inline from ``local_bh_enable()`` has the same
+boundaries; ordinary BH-disable nesting does not emit context events.
+
+RT worker entry acquires any blocking BH lock before the counter update.
+When the entry tracepoint is enabled, the update and event execute together
+with local IRQs disabled, then restore the original IRQ state. No new IRQ
+disable/enable pair is introduced when that tracepoint is disabled. RT
+decrements already execute with IRQs disabled. Non-RT retains its existing
+IRQ-disabled processing-loop boundaries.
+
+The model has six states: ``idle``, ``in_hardirq``, ``in_softirq``,
+``hardirq_from_softirq``, ``softirq_from_hardirq``, and
+``hardirq_from_softirq_from_hardirq``. It accepts these outer-context
+sequences::
+
+  idle -> in_hardirq -> idle
+  idle -> in_softirq -> idle
+  in_softirq -> hardirq_from_softirq -> in_softirq
+  in_hardirq -> softirq_from_hardirq -> in_hardirq
+  softirq_from_hardirq -> hardirq_from_softirq_from_hardirq
+                        -> softirq_from_hardirq
+
+The fourth sequence represents non-RT softirq processing during interrupt
+return. The kernel replaces ``HARDIRQ_OFFSET`` with ``SOFTIRQ_OFFSET`` while
+the handlers run, then restores hardirq state before completing interrupt
+exit. The fifth sequence represents a nested hardirq during those handlers.
+
+On PREEMPT_RT, serving-softirq state is task-local and the serving interval is
+preemptible.  A switch away from that task suspends its CPU context
+(``in_softirq -> idle``); a switch back resumes it (``idle -> in_softirq``).
+The adapter reads the outgoing and incoming task's softirq count at
+``sched_switch``.  Interrupts are disabled there, so no hardirq boundary can
+occur between representing the incoming task and the actual context switch.
+A hardirq in a task which preempted a softirq therefore starts in ``idle``.
+
+Hardirq depth greater than one is collapsed into the surrounding hardirq
+state.  The depth comes from the existing hardirq component, so the monitor
+does not maintain a second counter which could wrap independently.
+
+The boundary events run after entry state has been established and before it
+is removed.  A false transition or guard invokes the selected RV reactor and
+emits the monitor's error trace event.
+
+On hardirq exit, ``hardirq_context_exit`` runs immediately before removal of
+``HARDIRQ_OFFSET``. Hardirq accounting ends earlier, before inline softirq and
+tick-exit work. ``irqstate`` returns to the outer model state at the final
+boundary event. The event does not represent return from ``irq_exit_rcu()``,
+the later reschedule check, or the architecture return tail.
+
+Hardirq accounting and lockdep hardirq state have separate lifetimes. Lockdep
+can also create a synthetic hardirq interval without changing
+``HARDIRQ_OFFSET``. ``irqstate`` models the preempt-count context and does not
+report those lockdep-only intervals.
+
+Synchronization
+---------------
+
+Enabling a per-CPU monitor does not imply that the CPU is in task context.
+An outer hardirq or softirq entry from a known idle context starts the model
+and consumes the event. An outer exit can instead establish the idle state
+without consuming an unmatched event when monitoring starts in the middle of
+that context. Provenance-marked softirq boundaries do not start monitoring:
+they belong to an enclosing hardirq. If attachment occurs during that
+sequence, its final hardirq exit establishes ``idle``. If monitoring starts
+while a hardirq interrupts an ordinary softirq, the hardirq pair is ignored
+until the enclosing softirq exit establishes the idle state. On PREEMPT_RT, a
+softirq suspension also establishes ``idle``, and a resumption can start
+monitoring directly in ``in_softirq``.
+
+On PREEMPT_RT, probe attachment waits for an RCU grace period before the
+monitor can become enabled. This drains BH preparations which sampled the
+entry tracepoint disabled before attachment. Otherwise an intervening IRQ
+could synchronize the model to idle before a preparation publishes its
+serving bit without an entry event. New preparations see the attached
+entry probe and serialize the bit update with their event.
+
+Monitor irqexit
+---------------
+
+The ``irqexit`` monitor follows each task's invocation of
+``preempt_schedule_irq()``. It consumes ``sched_irq_preempt_entry``,
+``sched_irq_preempt_exit``, and ``sched_switch``. Both boundary events must
+observe zero hardirq count and disabled local interrupts. The owner saved
+in the invocation's stack frame must match the current task at both
+boundaries.
+
+The boundary records carry preempt-count and interrupt-state snapshots
+taken at the scheduler call site, before tracepoint dispatch or ring-buffer
+reservation. Sampling in ``TP_fast_assign`` would instead include tracing's
+own context changes. Disabled hooks do not take these extra snapshots.
+The RV adapter still evaluates its original live-context guards; the raw
+record is an independent diagnostic channel, not a replacement verdict.
+
+The model has three states: ``idle``, ``rescheduling``, and ``suspended``.
+Entry changes ``idle`` to ``rescheduling``; return changes it back to
+``idle``. Switching out an active invocation changes ``rescheduling`` to
+``suspended``; switching that task in resumes ``rescheduling``. The
+incoming event cannot require its target to be current: ``sched_switch``
+still executes in the outgoing task. Local interrupts remain disabled
+until the incoming task runs.
+
+Instances belong to tasks, not CPUs. Two tasks may have independently
+suspended invocations, and resuming on another CPU must use the same task's
+instance. An interrupt or IRQ-exit schedule in another task cannot return
+on behalf of the suspended owner. Ordinary switches while ``idle`` do not
+change its state.
+
+An entry starts monitoring and consumes the event. If the monitor was
+enabled during an existing invocation, its first valid exit instead
+establishes ``idle`` without consuming an unmatched event. Switches alone
+do not synchronize a task. An exit with an invalid context or owner must
+not be skipped as a synchronization event.
+
+The helper can also run on a kernel exception return. Its events therefore
+do not prove that an invocation followed a physical interrupt, and they do
+not describe architecture register restoration or context tracking after
+the helper returns. The existing helper entry assertions can reject an
+invalid caller before the entry event; such a failure is not a violation
+detected by this monitor.
+
+``irqexit`` does not associate an invocation with a preceding hardirq. It
+cannot observe work between ``hardirq_context_exit`` and the helper entry or
+between the helper exit and return to the interrupted context.
+
+Relationship to sched/sts
+-------------------------
+
+The scheduler ``sts`` monitor models the ordering of IRQ disable/enable,
+scheduler entry/exit, and task switches.  It uses ``irq_handler_entry`` and
+selected x86 vector events to refine that scheduler model.
+
+``irqstate`` does not consume IRQ action or scheduler entry/exit events.  It
+observes generic context boundaries, so multiple actions in one interrupt and
+an action dispatched through ``generic_handle_irq_safe()`` do not change its
+state.  On PREEMPT_RT it uses task switches only to follow the active softirq
+context. ``irqexit`` observes the surrounding IRQ-preemption loop and its
+task owner, rather than inferring that protocol from individual scheduler
+entry/exit events used by ``sts``.
+
+.. list-table:: Monitor coverage
+   :header-rows: 1
+
+   * - Property or event
+     - ``sched/sts``
+     - ``irqentry/irqstate``
+   * - IRQ disable and enable ordering
+     - yes
+     - no
+   * - IRQ action entry
+     - yes
+     - no
+   * - scheduler entry and exit
+     - yes
+     - no
+   * - task switch
+     - yes
+     - PREEMPT_RT softirq context only
+   * - ``irq_enter[_rcu]()``/``irq_exit[_rcu]()`` hardirq context
+     - no
+     - yes
+   * - complete serving-softirq context
+     - no
+     - yes
+   * - hardirq interruption of a softirq
+     - no
+     - yes
+
+Coverage limits
+---------------
+
+The context tracepoints are emitted by ``irq_enter_rcu()`` and
+``irq_exit_rcu()``. Softirq boundaries come from the RT serving-bit updates
+or the non-RT generic processing loop. Consequently this monitor cannot
+observe:
+
+- the early architecture entry interval before ``irq_enter_rcu()``;
+- paths which directly use ``__irq_enter()`` and ``__irq_exit()``, such as
+  the arm64 APEI SEA irq-work interval;
+- architecture or special-vector paths which use only
+  ``__irq_enter_raw()`` and ``__irq_exit_raw()`` (including x86 simple system
+  vectors);
+- NMI entry and exit; or
+- work after hardirq-count removal, return from ``irq_exit_rcu()``, the
+  conditional reschedule check, and architecture-specific state restoration.
+
+``irqexit`` checks ``preempt_schedule_irq()`` separately. It does not join
+that helper to the preceding ``irqstate`` instance or model an architecture's
+entire exit.
+
+The standard hardirq tracepoints describe individual IRQ actions rather than
+physical interrupt boundaries.  They are deliberately not used: synthetic
+dispatch and software resend can execute an action outside hardirq context,
+and one interrupt can execute several actions.
+
+These limitations are intentional.  A later architecture hook may provide a
+deferred raw-entry marker for the very-early interval.  Such an addition needs
+a separate event contract and does not change the meaning of ``irqstate``.
+
+Enabling the monitor
+--------------------
+
+With tracefs mounted at ``/sys/kernel/tracing``::
+
+  # cd /sys/kernel/tracing/rv
+  # grep -x irqentry:irqstate available_monitors
+  # echo irqstate > enabled_monitors
+  # echo irqexit >> enabled_monitors
+  # echo nop > monitors/irqentry/irqstate/reactors
+  # echo nop > monitors/irqentry/irqexit/reactors
+
+Use the ``nop`` reactor during initial qualification.  Select the ``panic``
+reactor only after unexplained violations have been excluded on the target
+configuration.
-- 
2.39.5 (Apple Git-154)

