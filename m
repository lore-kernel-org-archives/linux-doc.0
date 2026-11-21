Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.136
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795253900;
	b=TqnOsekbc4t6IAb95AfBh5wr1ct3aJd4sm1FhuX0+RGCCupVL5v2blZSjSbAwbU1CzLe
	 NwgvUHEItIb++4nQammd0+Ij0R/SXE9lUVSMmJZBKFDpavBrrjD3n6mOZNxaz5n9BAnBi
	 8+IxFXZCLueslIc7iUUZckXtfFmqYF8cyASxpb+ho2aGnBUJFtdwqIONbbwX3DDdGig0U
	 xYXcb4C3mc7x8Jvvni+n1zyRcdOlGqmnKc00i4urUrFMEjLZMh/i3Drj5iBwvxOYnYRLp
	 aLmOGhlQ/G5mPCXwI+G2i5ka+glpFYbf7p0oIymNC0cGVYoLZRSbBQ0fLZ19QyYwH1A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795253900;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=owmJEqX91uhoT5D2QMak8ejphZ4BbnGR8Yefzo8bEBA=;
	b=Q2BlVOOIWB/p5p7cgTBmSdbXCwHrQWHfncGkB9GQux3+MczW03as9mRyOn51czPEOQfz
	 ix3c+z7YdbgT2uGriJDUR4spSiBQbkcNsdH+K7XCC2q+GGThFQI4ILpZ3lxtNX8rYYU/S
	 5ebwFoYwCtMBFBV/PVBzyEx8kEBLytL0VI0nKSTRXa4kgOjxj7u44NI2OgzwZrE+t0DE2
	 qH5XgkExt0uSFFADptGDa3drcl4/hoBxvHMRB9koIVvrP3C9AwdQdQ1wXkTKFQozl3z0w
	 u/opZCypaiEjR4UznHogNUKuI934M52zdjSwHWd1uqWHyLzqiQobQqv0VfuPBEILhSA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DgZShVE3;
	arc=none smtp.remote-ip=74.125.227.136
Received: from mail-pj2-f8.google.com (mail-pj2-f8.google.com [74.125.227.136])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6C06B606A320
	for <linux-doc@vger.kernel.org>; Sat, 21 Nov 2026 09:38:19 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 6C06B606A320
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=DgZShVE3
Received: by mail-pj2-f8.google.com with SMTP id 98e67ed59e1d1-3b40283c001so385491a91.0
        for <linux-doc@vger.kernel.org>; Sat, 21 Nov 2026 01:38:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795253899; x=1795858699; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=owmJEqX91uhoT5D2QMak8ejphZ4BbnGR8Yefzo8bEBA=;
        b=DgZShVE37kx91BCmEV6XHQ/+OVJVQDBfiZUIw3HvBSnVhSg3fTrW2ruWbSW0EYYvJo
         Ucbvk+dv/FOYiDQ5bNTPdx2y0inFzHWNUoiwLcT9DUb5UESg2RB4emD3iDTDtkEwU0Yn
         Wtfls6DpA73Mj/oIHllfsG+aL7JAjRkaLYo4z97p92BS1w4VB8NiZY138skw0Q5eOB2G
         OenM63f7cVmR0DrBuKbygpDNPw3ssj3zKdhvY6fTNVM33am5hLmJE37J1Wwbu7BOnHIo
         /dSd6iB2pVbx463ZEGDs6He0WdWOeBHaslNIjCx5nz6VcfIAjguPh6EYoRaj1ssmjbf8
         alIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795253899; x=1795858699;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=owmJEqX91uhoT5D2QMak8ejphZ4BbnGR8Yefzo8bEBA=;
        b=TwWgvXZFaqbtMbtAGTLNHgddMqYmCCn6pxF9nFqfiKBdRF4I4Mbi5jb8Az9AV/blwZ
         /h1WBsyPporgGcrPu7nTWoPR9FvrT3eQwz+6/cu6lTUZgpnM/Pp/FjyONKbWeVYZFTLU
         zUPSlYyFFT6GagecVZJXFuNhtIVtq8ePul6W4bYtOP3riuTi9tbSA/cFrXrDuNC3cNn0
         yJowbgeXA8S2ehO0VnTwM2uH5cykGV2UtUWVA2RU+iUv1rWyJ5JQRyZd/aBWHc2yvAN8
         zfyry5WqzZnTXIhPhBgmNIDxBah7Mur/7oFlOnumH1ppCFjaFGsJPr78Tz+6S2oo7a4j
         +KDA==
X-Gm-Message-State: APuU4Z+8Nu806uhZAPPMIHJgjbJFLr0A3pP+xyFZfwMhKYlfUbulQ85c
	stPdVrjzIJwZ3Yh2q+8lxcxPLL2h8E3/ZRxL3UAGSbJryiHZ49JKbCJnMnRpNyQDDzUs3g==
X-Gm-Gg: AZFdTZf2AaNVU1/huqVS7LQ7xHXvB8NDgbk6SJaBXohQzgKljdaKce9eGv0A373pknU
	v4zFivEdZ5hWSfqkBON9aClWuMB0/PVyXUzHciXKQtc5lZhnHTDBJNLomGjliNkrRElafM4aIW0
	tQ9uYAs1IrShOs6HKBEeuGLHhg/OVTKdmyOstzFLGuWH41jNUHqP0Z5Nv8w7jKPeUGnO0DQmrBV
	d+D/1p8/nJpDedZSR7BQkrinaEDkGVtJ0FMYTLq7DdtQDFQ5rblSLn/FcLyGLwp9HrBI/arisGr
	MSzJONBR89PlOafOjFnSDmlqXysSMiCRuXWx4rj9lsGLr3lNkc5mT/jpS4hBrsjyE1jT1sY1ZUv
	4J+2nfEKvYkPVfhPcMTUKK8RNx9FtB70DcLl4Bm62E2JwHsjr2ripmW44JqF5umgbbnX1Zh1Zpm
	8B7xNN21YRP0ao/WN6cbFnVnMiwUSuYTsMdoPGmd4MStX+DASkOptztycjKdRrwrNw481vfzpeY
	YADz7cU6q3OkauLvE7CSzjLEAVw0Z8jXSqg8JByR7lnKF+i75ir7RBKLJY+98OtL3tiDtGqjmJS
	KEI5rs80C3N8QJrakBp/71AEWQ==
X-Received: by 2002:a17:90b:2e8c:b0:3b3:b36e:8c40 with SMTP id 98e67ed59e1d1-3b41c97872bmr5640628a91.62.1795253898635;
        Sat, 21 Nov 2026 01:38:18 -0800 (PST)
Received: from nixos ([2409:8a28:ae4:7f20:1906:8e4e:fd1e:3daf])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b44b8733e6sm1366552a91.3.2026.11.21.01.38.10
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 21 Nov 2026 01:38:18 -0800 (PST)
From: Zixin Wang <w1355457260@gmail.com>
To: linux-doc@vger.kernel.org
Cc: linux-rt-devel@lists.linux.dev,
	bigeasy@linutronix.de,
	clrkwllms@kernel.org,
	rostedt@goodmis.org,
	corbet@lwn.net,
	frederic@kernel.org,
	wagi@monom.org,
	atomlin@atomlin.com,
	linux-kernel@vger.kernel.org,
	Zixin Wang <w1355457260@gmail.com>
Subject: [PATCH v4] Documentation: real-time: Add boot parameters and task isolation section
Date: Sat, 21 Nov 2026 17:37:40 +0800
Message-ID: <20261121093740.4133-1-w1355457260@gmail.com>
X-Mailer: git-send-email 2.54.0
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

Document the boot parameters and runtime tunables that affect the
worst-case latency of a real-time system, alongside the existing
kernel configuration guidance.

Cover CPU isolation, nohz_full, RCU callback offloading, interrupt
affinity, and C-state limits, with references to the relevant
documentation.  Keep the C-state parameters next to CONFIG_CPU_IDLE
and the tickless trade-off next to CONFIG_NO_HZ, so each option stays
with its configuration guidance.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=220633
Link: https://github.com/elisa-tech/wg-aerospace/issues/222
Signed-off-by: Zixin Wang <w1355457260@gmail.com>
---
Thanks Sebastian for the review.

v3 -> v4:
  - Fold the C-state parameters into the CONFIG_CPU_IDLE section,
    which already documents processor.max_cstate=1 and cpupower, and
    drop the separate "Idle state limits" subsection.
  - Point CONFIG_NO_HZ/CONFIG_NO_HZ_FULL at nohz_full= and avoid
    repeating the tickless-transition explanation in the isolation
    section.
  - Add a CONFIG_RCU_NOCB_CPU section for rcu_nocbs= and rcu_nocb_poll,
    and reference it from the isolation section.
  - Remove repeated statements within the isolation section: the
    domain side effect, the duplicate isolcpus=nohz/nohz_full=
    description, and the nohz_full/rcu_nocbs cross-statement.
  - Keep the boot parameter section focused on the cross-cutting
    isolation parameters and their interactions.

Testing:
  make SPHINXDIRS="core-api" htmldocs and checkpatch.pl pass.

  Host boot test (AMD Ryzen 5 5600H, acpi_idle): with
  processor.max_cstate=1, /sys/module/processor/parameters/max_cstate
  is 1 and cpupower idle-info reports only POLL/C1; without the
  parameter the host reports POLL/C1/C2/C3.  intel_idle.max_cstate was
  not tested because the host uses acpi_idle.

  Host latency comparison (cyclictest, CPU 2 isolated, performance
  governor): the idle-phase average latency was 15 us with
  processor.max_cstate=1, 32 us with processor.max_cstate=2, and
  248 us without a limit; the corresponding maxima were 879 us,
  2407 us, and 3336 us.  The tight-phase maxima were dominated by a
  device IRQ (about 3.2 ms), so the idle phase is the relevant
  comparison.  C2 and C3 usage was confirmed by the cpuidle usage
  counters.

  QEMU test: the default ACPI tables have no _CST; with a small _CST
  SSDT loaded via -acpitable, the guest registers POLL/C1/C2/C3, and
  processor.max_cstate=1 limits them to POLL/C1.  This verifies the
  parameter behavior; the QEMU setup does not measure real host
  C-state latency.

 .../real-time/kernel-configuration.rst        | 128 ++++++++++++++++++
 1 file changed, 128 insertions(+)

diff --git a/Documentation/core-api/real-time/kernel-configuration.rst b/Documentation/core-api/real-time/kernel-configuration.rst
index d7f08e7b..315960cf 100644
--- a/Documentation/core-api/real-time/kernel-configuration.rst
+++ b/Documentation/core-api/real-time/kernel-configuration.rst
@@ -98,6 +98,11 @@ can be achieved by using the boot parameter [1]_::
 
   processor.max_cstate=1
 
+On x86 systems using ``intel_idle``, the ``intel_idle.max_cstate=`` boot
+parameter sets the maximum C-state depth (1-9).  A value of 0 disables
+``intel_idle`` and falls back to ``acpi_idle``; it does not disable
+C-states.
+
 Higher C-states can be acceptable depending on the user workload's latency
 requirements.  For ACPI-based platforms, use the ``cpupower idle-info``
 command to inspect the available idle states.
@@ -179,6 +184,9 @@ the extra accounting and state book-keeping.
   ``NO_HZ_FULL`` may be beneficial.  In such cases, users should offload the
   kernel housekeeping to dedicated CPUs and isolate compute cores.
 
+``nohz_full=`` enables tickless operation for a set of CPUs; see
+:ref:`real_time_boot_parameters` for its interaction with ``isolcpus=``.
+
 See also Documentation/timers/no_hz.rst
 
 ``CONFIG_PREEMPT_RT``
@@ -190,6 +198,36 @@ See also Documentation/timers/no_hz.rst
 This option must be enabled, or the resulting kernel will not be fully
 preemptible and real-time capable.
 
+``CONFIG_RCU_NOCB_CPU``
+-------------------------
+
+:Expectation: allowed
+:Severity: *info*
+
+Enable support for offloading RCU callback invocation from selected CPUs
+to per-CPU ``rcuo`` kthreads.  The offload is selected with ``rcu_nocbs=``
+or implied by ``nohz_full=``; enabling this option alone does not change
+callback placement.  Use it when RCU callback processing causes jitter on
+CPUs dedicated to latency-sensitive tasks.  See
+Documentation/admin-guide/cpu-isolation.rst.
+
+``rcu_nocbs[=cpu-list]``
+  Offload RCU callback invocation from the listed CPUs to the
+  corresponding ``rcuo`` kthread, which can run on a housekeeping CPU.
+  This keeps callbacks from being invoked on the CPU that enqueued them.
+  On a non-real-time kernel this also moves invocation out of softirq
+  context; with PREEMPT_RT, callbacks already run in kthread context
+  because ``rcutree.use_softirq`` is false, and the offload only changes
+  the CPU they run on.  If omitted, no CPU is offloaded at boot; the mode
+  can still be toggled at runtime through cpusets.
+
+``rcu_nocb_poll``
+  Make the ``rcuo`` kthreads poll for callbacks instead of requiring the
+  offloaded CPUs to wake them.  This improves the real-time response at
+  the cost of higher power consumption, because the kthreads wake up
+  periodically to do the polling.  Consider this option only when wakeup
+  latency matters more than power.
+
 ``CONFIG_TRACING`` (and tracing options)
 ----------------------------------------
 
@@ -216,6 +254,96 @@ just by being enabled.
 These tracers do incur measurable latency overhead even when tracing is not
 currently active.
 
+.. _real_time_boot_parameters:
+
+Boot parameters and task isolation
+==================================
+
+Kernel configuration options alone do not determine a real-time system's
+worst-case latency.  Integrators commonly rely on boot parameters and
+runtime tunables as well, to keep kernel housekeeping work away from
+latency-sensitive tasks.  The parameters below complement the options
+described above.  Some of them correspond to a configuration option and
+are referenced from that option's section, so the configuration and
+runtime guidance stay together.  Each one is documented in detail in
+Documentation/admin-guide/kernel-parameters.rst; the notes here focus on
+the aspects that matter for real-time latency.  Consider these options
+only when the workload suffers from the corresponding interference;
+leave them disabled otherwise, as each of them trades flexibility or
+power for a lower worst-case latency.  The notes below follow the
+decisions an integrator has to make: whether to keep tasks off a CPU,
+whether to stop its tick, and where interrupts should run.  Idle state
+limits are discussed with ``CONFIG_CPU_IDLE`` above, and RCU callback
+offloading with ``CONFIG_RCU_NOCB_CPU`` above.
+For the full CPU isolation model and its limitations, see
+Documentation/admin-guide/cpu-isolation.rst.
+
+.. caution::
+
+  CPU isolation is best effort.  Work that is explicitly bound to an
+  isolated CPU, such as per-CPU kernel threads, bound workqueues, and
+  interrupts, may still run there unless it is steered away.  Measure
+  the resulting latency with tools such as ``osnoise``, ``timerlat``,
+  and ``rtla`` rather than assuming that an isolated CPU is free of
+  kernel noise.  See Documentation/timers/no_hz.rst and
+  Documentation/tools/rtla/index.rst.
+
+CPU isolation
+-------------
+
+``isolcpus=``
+  Format: ``[flag-list,]<cpu-list>``.  Isolates the listed CPUs from the
+  disturbances selected by the flag list (default: ``domain``):
+
+  ``domain``
+    Remove the CPUs from the scheduler domains.  This is the default
+    when no flag is given.  Domain isolation cannot be undone at
+    runtime; use cpusets when the isolated CPU set must change
+    dynamically.  Isolated CPUs remain usable through CPU affinity or
+    cpusets.  Unbound workqueues and unbound kernel threads are
+    confined to the housekeeping CPUs as a side effect.  Consider it
+    for CPUs dedicated to a latency-sensitive workload.
+
+  ``nohz``
+    Equivalent to ``nohz_full=``; see below.
+
+  A practical configuration therefore combines ``isolcpus=`` with
+  ``nohz_full=``, ``rcu_nocbs=``, an interrupt affinity mask, and, on
+  x86 systems, a C-state limit.
+
+  Timer placement follows the same choice.  By default a migratable
+  timer expires on the CPU that armed it; with ``nohz`` (or
+  ``nohz_full=``), timers and hrtimers armed on the isolated CPUs are
+  migrated to housekeeping CPUs.
+
+``nohz_full=``
+  Format: ``<cpu-list>``.  Requires ``CONFIG_NO_HZ_FULL=y``.  Stops the
+  scheduler tick on the listed CPUs whenever possible.  The boot CPU is
+  forced outside the range to maintain timekeeping, and the RCU
+  callbacks of the listed CPUs are offloaded as if they had been
+  passed to ``rcu_nocbs=``; see the ``CONFIG_RCU_NOCB_CPU`` section
+  above.  This parameter takes precedence over
+  ``CONFIG_RCU_NOCB_CPU_DEFAULT_ALL``.
+
+  The residual 1 Hz tick is offloaded to workqueues; the global
+  workqueue ``cpumask`` (/sys/devices/virtual/workqueue/cpumask) can
+  further restrict where unbound work runs.
+
+  The trade-off between tickless operation and the kernel-to-userspace
+  transition latency is described in the ``CONFIG_NO_HZ`` /
+  ``CONFIG_NO_HZ_FULL`` section above.
+
+Interrupt affinity
+------------------
+
+``irqaffinity=``
+  Format: ``<cpu-list>``.  Sets the default affinity mask for
+  interrupts that do not have an explicit affinity, steering them to
+  the housekeeping CPUs.  Managed interrupts are not affected by this
+  setting and cannot be redirected through ``/proc/irq/*``.  Verify
+  the resulting placement in ``/proc/interrupts``.  See
+  Documentation/core-api/irq/managed_irq.rst.
+
 Kernel Debug Options
 ====================
 
-- 
2.54.0

