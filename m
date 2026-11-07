Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.48
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794071600;
	b=Xfap/C0bYX9ZQH/7reuNwh851l3BJJSw3CwoH0g6DiRQLikat+O6ToiWJWgGA7cVBbE5
	 NOeyGTg67dv0+H91ssv1+MkOaB3Diu04Cdpdw1PSbVWeRGNRKI5Uwc3R4PNDfC/tMY0fC
	 4G5tWtieeeaHXuGYbQrazH7DVcrrdozlSpLsc5DJ+e+az6Rb7vu3EtaJSersQRCJhz2EJ
	 woahNxtQ3W2IeE1s5qz74ZqCNc9HEtWri8y8O67nhHwme5jagfvkqHVOqXyJtsObMArBD
	 r29V5+uvDib9fR5rhZ8AG07HTHTJJ9ebJVjVgS5r1NdI/CP68xbbtcjgdEbi62y67dA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794071600;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 From:To:Cc:Subject:Date:Message-Id:X-Mailer:In-Reply-To:References:
	 MIME-Version:Content-Transfer-Encoding;
	bh=eWNSEsSwVt5YTKCfi1st6fCrwdvuoSW1sFyhHtvjjtQ=;
	b=xw00jdIhFGYqtmtZmXTJ2T6ehN+Ex1hDQk3GENtPmS1BK/NDWhX2E2xc3J0J5XPCXE7n
	 rcvQC243FDDv+kgAFYns1zHloI/O6ivTKTn2kbjHgSA6gHTvflmoAO2WMR19KaYielyAL
	 HpN7uYNOasM56g1PZ0g7ySrKl0ecAjJfB8OkV/lKMygDXIYZURQCO+ojKkOC1vwKqwdmO
	 VWwWy9Sq62Gn4rbpAlFz9ljxTaRAaQEMcb322TedSuhUF1f7i4/yzCqanGAcf2tyQDY+R
	 4UaWXrTJiAH1txsTAe9kBzQOhIyABGQMp9eW1gT4hGMWsT+064xgOxb/KY7pBqRVWjg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b="nqX/zXsW";
	arc=none smtp.remote-ip=209.85.128.48
Received: from mail-wm1-f48.google.com (mail-wm1-f48.google.com [209.85.128.48])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C015E606EE88
	for <linux-doc@vger.kernel.org>; Sat,  7 Nov 2026 17:13:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org C015E606EE88
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nqX/zXsW
Received: by mail-wm1-f48.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso15943935e9.3
        for <linux-doc@vger.kernel.org>; Sat, 07 Nov 2026 09:13:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794071598; x=1794676398; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=eWNSEsSwVt5YTKCfi1st6fCrwdvuoSW1sFyhHtvjjtQ=;
        b=nqX/zXsWEPl7tDD4P+GbmQS7Lkhv5wPx80HSIeZRk+eh5lxkui6Qvlqo55RCxTls+e
         MNQmGV1TII5aM95KrbbC68/kuK1U4qQhzbN6udX6wL6K1wYiRvbAXbuP0aPaPAACZazM
         3d5Ye4rrspLIDcKOWiX+zBSiZ9PGUdS0+kAflMFmcvKGdJfAu4UjY4NPLiQ1ngxajVW/
         ZxN7ho/JVO4MUWk7CmqZ1B9hr92xHd4VVjAeUnVXL3oxCkjHOGxYuA9vHY5f5E3Qnl/4
         Yg0gePj9UELngniLGZPk2Ml//BQ3N18RLOmNtmOGLuw98IkJA7D0uKVPyTgUvOD+hT5Y
         aHdw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794071598; x=1794676398;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=eWNSEsSwVt5YTKCfi1st6fCrwdvuoSW1sFyhHtvjjtQ=;
        b=DktfeCZI0YTP1SjATuapuDCnN9dAWGK/Ggz9OA5n/5sd2FysxNwNjxP1bnA/LECJn2
         29tbe+hUAvDAOrKlhkNFgmqMwrFzDevuO3bhgAxA54GYWOITVdcFYBVIkLoCkqQU75dh
         tyWD/2L3t0CYm9q2etbpBO+XslGN2x8dDo+Q4EOsngjSK32CTtVi69h0O5KncAjQERBs
         kiBWJep+K/L5t0CxuMpIeCR692XrjYgfN92glejZnh5NUmCaAJ0kX+ulVpWMvnMNBYcX
         g/vc64WHzc4l7TzbSQ3os9XaFbwpAsft/qwnKOCd8aIQ+Tm6+2n22OeNzqk+B2ocYmdS
         aynw==
X-Forwarded-Encrypted: i=1; AKwUvBwGMOWVcVwfdBRVPWMLWnbmfvUnAxFQD5scKBQ/x9gYNe2Q/girXs8+FCKhiuc+UZ/lqAAsOa1on8c=@vger.kernel.org
X-Gm-Message-State: APuU4Z9JR1G2I4vIndRK/rEPikMjDTtQ1fr0VCRLiIdHxbYlIEiitc2L
	P1jtt9JmCvpAujGQdnPg0RhvsgS1ohLgadcLjSkJZ6yRGC4gSrhyKHinAzvxRuFmDIQ=
X-Gm-Gg: AYBFou2wuszlZMwCjhi33KqhfBNkDIZapNIyahr4zy1INhJVTz4zNBQSGiGHTr7Be6I
	mAKbmI8n+Tk6LdwOXXwAqKBFvyV3zKGCPynTs/2wB5IAGOWuurUPe1ZCOtICKrtpzm7xGOVtZTf
	lu9Oa14o8dmHbARsc6pLRLa30MXnnAFJO5zTdhzUUzBFPg2i0BNj5/41fY3ezboPQHxveR7X3F/
	vyOus0to7GnjttGYPo+FQxLxagldF4SM9cf9tUcogwrPhWH61lWXer5GIoTBHzPoKU4PSvJoQ5b
	u9qw1N2P04ZqMqOWJ+jLIIpM2T6VxYNmaxy97BUezEVy/gfWD4UtKOO9KAGrw9b9qVLdXfFyovc
	NiDkzYNP6sQHDKg1S4fD44thirUYXDMM91OdzaGJh9ZjQt/6Y3J79Gj2VtlT7gXYxejdrS48oau
	X1YI1djbET2wx/zwVM2E3DIOFbs+bfAF6YAZv7cIhSgnwwsc+1F8ke11DKUVFGMeDdK8CRByUFk
	S39BOiBGbbwHLQh+WzueAu2sat5JYh0zzz576JUdTTXIAtKhL1jTKGw+ccAIsiiQpSi6ldANbwe
	F7yaOpS2cUOVDJsh8t6IehphBOhiD7qE5ht37+Xmk0590u8o7cdvqevm0gyyGyzKdYBZSRNr1is
	SgJFNLrpgk2Cmt5vt/5TiU485OsVrCGWb9bSTY7cezj+i2eyOzMry7eulUpg24fHHZxC1qRz6p2
	DNmeIOVSmMqF2194MTTIo62iMAXfvRo5M=
X-Received: by 2002:a05:600c:4f4a:b0:4a2:1196:db0e with SMTP id 5b1f17b1804b1-4b6e017248dmr113719735e9.30.1794071597881;
        Sat, 07 Nov 2026 09:13:17 -0800 (PST)
Received: from localhost.localdomain (dynamic-2a02-3100-b149-1401-90c6-65b4-035d-1e3d.310.pool.telefonica.de. [2a02:3100:b149:1401:90c6:65b4:35d:1e3d])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-492d723222fsm10627105f8f.21.2026.11.07.09.13.16
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sat, 07 Nov 2026 09:13:17 -0800 (PST)
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
Subject: [RFC PATCH v2 5/9] docs/rv: Document the IRQ monitors
Date: Sat,  7 Nov 2026 18:12:48 +0100
Message-Id: <20261107171252.25090-6-kmehltretter@gmail.com>
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

Document the irqstate and irqexit models, including their text
schematics, synchronization rules, PREEMPT_RT behavior, bare-tracepoint
boundaries, per-CPU vs per-task automaton separation, tracefs interface,
and coverage limits.

irqstate observes hardirq contexts whose boundaries pass through
irq_enter() or irq_enter_rcu() and irq_exit() or irq_exit_rcu(). Direct
__irq_enter() and __irq_exit() users, raw-only paths, and
architecture-specific intervals before generic entry and after generic
exit remain outside its coverage.

Clarify that irqexit monitors preempt_schedule_irq() as a per-task
automaton rather than treating it as the complete interrupt-return path.

Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
 Documentation/trace/rv/index.rst       |   1 +
 Documentation/trace/rv/monitor_irq.rst | 350 +++++++++++++++++++++++++
 2 files changed, 351 insertions(+)
 create mode 100644 Documentation/trace/rv/monitor_irq.rst

diff --git a/Documentation/trace/rv/index.rst b/Documentation/trace/rv/index.rst
index 29769f06bb0f0..8dd4041e1a0eb 100644
--- a/Documentation/trace/rv/index.rst
+++ b/Documentation/trace/rv/index.rst
@@ -15,6 +15,7 @@ Runtime Verification
    monitor_wip.rst
    monitor_wwnr.rst
    monitor_sched.rst
+   monitor_irq.rst
    monitor_rtapp.rst
    monitor_stall.rst
    monitor_deadline.rst
diff --git a/Documentation/trace/rv/monitor_irq.rst b/Documentation/trace/rv/monitor_irq.rst
new file mode 100644
index 0000000000000..3e4aa819fcbbc
--- /dev/null
+++ b/Documentation/trace/rv/monitor_irq.rst
@@ -0,0 +1,350 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+IRQ monitors
+============
+
+- Name: irq
+- Type: container for IRQ context monitors
+- Author: Karl Mehltretter <kmehltretter@gmail.com>
+
+Description
+-----------
+
+The ``irq`` container groups monitors which compare interrupt-related
+events with the execution context recorded by the kernel.  The monitors are
+architecture independent: they consume generic tracepoints and do not require
+an architecture assembly hook.
+
+The first monitor deliberately observes only safe, instrumentable events.  It
+does not cover the interval between physical interrupt entry and establishment
+of generic hardirq state.  The boundary hooks are bare tracepoints declared
+with ``DECLARE_TRACE()`` rather than user-space tracefs events.
+
+The two specifications use distinct automaton instances because they track
+different objects.  ``irqstate`` is a per-CPU automaton: a hardirq interrupts
+whichever task happens to be running on that CPU, and non-RT softirq
+execution is CPU-local.  ``irqexit`` is a per-task automaton: an invocation
+of ``preempt_schedule_irq()`` belongs to the interrupted task's stack frame,
+multiple tasks may be suspended inside the helper at the same time, and a
+suspended invocation can migrate to another CPU before returning.  The
+container enables and disables both automata together by default while
+keeping per-CPU and per-task state independent.
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
+``hardirq_from_softirq_from_hardirq``. The initial and accepting state is
+``idle``. The following schematics omit the guards listed above. To keep the
+state names short, ``A > B`` denotes the state reached when context ``B`` is
+entered from context ``A``; it does not imply that both context-count
+components remain set::
+
+              hardirq_exit
+    +----------------------------+
+    |                            v
+  +---------+  hardirq_entry   #=================================#
+  | hardirq | <--------------- H              idle               H <+
+  +---------+                  #=================================#  |
+                                 |                                  |
+                                 | softirq_entry                    | softirq_exit
+                                 | softirq_resume                   | softirq_suspend
+                                 v                                  |
+                               +---------------------------------+  |
+               +-------------> |             softirq             | -+
+               |               +---------------------------------+
+               |                 |
+               | hardirq_exit    | hardirq_entry
+               |                 v
+               |               +---------------------------------+
+               +-------------- |        softirq > hardirq        |
+                               +---------------------------------+
+
+The softirq interval during hardirq return and a hardirq nested within that
+interval form the remaining part of the model::
+
+                   +-----------------------------+
+                   |           hardirq           | <+
+                   +-----------------------------+  |
+                     |                              |
+                     | softirq_entry_from_hardirq   | softirq_exit_to_hardirq
+                     v                              |
+                   +-----------------------------+  |
+    +------------> |      hardirq > softirq      | -+
+    |              +-----------------------------+
+    |                |
+    | hardirq_exit   | hardirq_entry
+    |                v
+    |              +-----------------------------+
+    +------------- | hardirq > softirq > hardirq |
+                   +-----------------------------+
+
+The ``softirq_from_hardirq`` state represents non-RT softirq processing
+during interrupt return. The kernel replaces ``HARDIRQ_OFFSET`` with
+``SOFTIRQ_OFFSET`` while the handlers run, then restores hardirq state before
+completing interrupt exit. The ``hardirq_from_softirq_from_hardirq`` state
+represents a nested hardirq during those handlers.
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
+On hardirq exit, ``hardirq_context_exit`` runs near the end of the generic
+exit path, after tick-exit work and before removal of ``HARDIRQ_OFFSET``.
+Hardirq accounting ends earlier, before inline softirq and tick-exit work.
+``irqstate`` returns to the outer model state at this boundary. When the event
+is enabled, the outermost-exit handoff passes pending timer work to ktimerd
+with forced IRQ threading. It also passes pending softirq work to ksoftirqd
+when no enclosing softirq or bottom-half-disabled state suppresses the wake.
+These handoffs catch work raised by tick-exit and event callbacks. The event
+does not represent return from ``irq_exit_rcu()``, the later reschedule check,
+or the architecture return tail.
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
+The boundary tracepoints pass preempt-count and interrupt-state snapshots
+taken at the scheduler call site, before tracepoint dispatch can change the
+observed context. Disabled hooks do not take these extra snapshots. The RV
+adapter still evaluates its original live-context guards; the snapshot
+arguments provide an independent check for direct tracepoint probes.
+
+The model has three states: ``idle``, ``rescheduling``, and ``suspended``.
+The initial and accepting state is ``idle``. The schematic omits the guards
+described above::
+
+      switch_in / switch_out   #================#
+    +------------------------- H                H
+    |                          H      idle      H
+    +------------------------> H                H <+
+                               #================#  |
+                                 |                 |
+                                 | resched_entry   | resched_exit
+                                 v                 |
+                               +----------------+  |
+    +------------------------> |  rescheduling  | -+
+    |                          +----------------+
+    |                            |
+    | switch_in                  | switch_out
+    |                            v
+    |                          +----------------+
+    +------------------------- |   suspended    |
+                               +----------------+
+
+The incoming event cannot require its target to be current: ``sched_switch``
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
+     - ``irq/irqstate``
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
+- instrumentation reached while removing hardirq-count or non-RT
+  serving-softirq state, work after those removals, return from
+  ``irq_exit_rcu()``, the conditional reschedule check, and
+  architecture-specific state restoration.
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
+  # grep -x irq:irqstate available_monitors
+  # echo irqstate > enabled_monitors
+  # echo irqexit >> enabled_monitors
+  # echo nop > monitors/irq/irqstate/reactors
+  # echo nop > monitors/irq/irqexit/reactors
+
+Use the ``nop`` reactor during initial qualification.  Select the ``panic``
+reactor only after unexplained violations have been excluded on the target
+configuration.
-- 
2.39.5 (Apple Git-154)

