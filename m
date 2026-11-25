Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=74.125.227.130
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795592837;
	b=VonjqPJtQB5lAtzQsDywBhIKkWelQBVpwi9Qty5b+mrhWTZqkRgCmqZb1WWS7c9eoW1r
	 OmBqRg9ntq0Hni+Gp9E7Mdtpkh5fuSTg+e2ODChQwUcUM0dLfQ948ZPRWUY0zMjX8TAwd
	 /TH/Tf09kpWdoiz4V3qhS40e10WbYb68hdn/UqAUSwOBW2xZ2vwMikn6mtZAfqxjEBAuW
	 p3lyIFvu6yJxwCWX8IKkbYLa3U3y4UTd9wXCTcIrsC4Z1+MxH+7xKzarKhC09Gue75u4j
	 DdqIBXb2fKclt5/uowbfO1HwBg6OGQRGIfgIiRpcoHfOW059EFWvRfJTUqrserVQPDA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795592837;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-ID:X-Mailer:MIME-Version:Content-Transfer-Encoding;
	bh=S8JFtPhVHKQuar4pffNcnJJaMHb/vNAIOX4ig9umNdo=;
	b=md4mofKHKY+sBdbR2uLGMRgRiqr6km6TkbYvsFLV8Bw6r+T7P4CxddV8KQ6+H1H9Io4M
	 63l5ecjoXCr/F1JXrhmhe4alu6oSlArzJVt7gzeYMV4iPFi/Cln0GAtpWpjnkOaZqPplr
	 Z6P9RMn/iy+fGgxR4ZsIO92/Nwecbe6uCtYFKPQjW8wAx5RfSCXB7yyHVDh1Ag3n29+Uk
	 uKg73HFOpPb3SqCHxrBjpiz1YVP7SwYqtBSrGTRhPOYOprxGLVsPA2sEdNEJC71PwRuFS
	 n0imH4HHzRtRskyaLAbw2/b4RN63Xh5Gs8SE3LfKusmIJSWwh46bjsxo17T3BtckNeg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nSKxy83c;
	arc=none smtp.remote-ip=74.125.227.130
Received: from mail-pj2-f2.google.com (mail-pj2-f2.google.com [74.125.227.130])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBAF8606A32D
	for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2026 07:47:16 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org EBAF8606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=nSKxy83c
Received: by mail-pj2-f2.google.com with SMTP id 98e67ed59e1d1-3b14c80b210so1224724a91.0
        for <linux-doc@vger.kernel.org>; Tue, 24 Nov 2026 23:47:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795592836; x=1796197636; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=S8JFtPhVHKQuar4pffNcnJJaMHb/vNAIOX4ig9umNdo=;
        b=nSKxy83cMdW+aVg0j9sMEn98p/G41G5UIjCIY8qAsPvi5W8tJcKpe3Uweo7MOhQJca
         curjQ+u82pRCYFthw+9NMraNqEWmAa4juS7RFJVrSXnHZEK/dfO3WREhFZEr1Un6m3+Z
         JIQ5Q5UGezPuguNvZ5xqCOu20xzqI0qCN/J4UuqLxyYIE2SpjLMeOSHzFaMWe2RqLXFk
         7meq/qDlbnWRku45TOHk8GgWUa2zS/khk89OgNn2IEJh0xbeyoo0+TTbXgStpJ19pWqx
         C0JIk8Z/q/DnOWeeFfDcObd0DBaUeIupvlL/IsnW5LWMKjO2bl2HCm+X+t9jzlMLQxO+
         glKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795592836; x=1796197636;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=S8JFtPhVHKQuar4pffNcnJJaMHb/vNAIOX4ig9umNdo=;
        b=qCFQf1tBagRxc1DB7hEM7YSIJ8oo7k3wX7O5dc45fDrGvt4L19poewnIeh0L/RrcDo
         ocypyMz+KLnylIuvjMEr7XNaYLsAsfVSh4wdxNzwFLVGZ8MT8pZJPK7c66OhhuPTR6Qi
         OfnWIZELT5gWWc73Q/VxlDcjdyD+eDbEI3B3xW/JwcvoXTidsDAz6CkQJkgJbWKO0NTK
         05YKJvVzjgk8y3B+9wCwMM803pARacAj21zC83KzrKtEI+9XyF6DbtXPoQAqpIAVGD88
         XR3XSfKUo0CjW69hjhkG5LQgEbmRy2GCp8goLPmFNsW3IXgN/0v97OyvW2n5DblJ/O/t
         rKxg==
X-Gm-Message-State: APuU4Z8gqEitrTMWIMWUmneMqMWjAiGaL6trjgklVdVyJJfZzgrcVrVd
	9CO0VKh0XmE0jN3CeG0elLOA0FVN1VhP5d7qVQ5Mmy6hO1qB2fRKwRytMqhiU1lXCTm1Yw==
X-Gm-Gg: AZFdTZf51mc05AhjZTKBJBdfFQLJQ2oSo9k/XcWJYCdFz5NXvw+WSo+TBNw+X2Q5xHo
	DRMgBtnAryK7CbHE/4/KdSTc1DYBx0oJvg7ycRYtEWVM7T3oPGDwsNs9jNjwggZwIcbYKr0EPNY
	Em9GJp3wzSaxcmd38sySK6qij5mjRuLLgzTJS9zsQfhjx2VA7sKCGcZqJL0g0sxn+6ebVT09zPF
	giQF0xUt3aO2bqFSt/ZwcCdvZ+dGyrz/O6pWmGn+Qb7FRsl1M1PdSJEArCNYXM9EVSKJJOyc5UO
	pj6H1Aef1HwbIAb+UQTB4bx9xqiDot4P7GKOohdXtYy01NPWXys8/97+uhmBxsTozQtZqoKr2Ha
	NB+4hy6/tGUXOhEBul/SrBQiQeF/4tMMqNlkGI+FO6WV4VTtb/77Pt8utp1yNBDWh3Or2Gn++tY
	qEaTw9qPRfmSWaCs8u0M15x2y2bZ6NjO1wtcAk2xnUhCLMtqN9nFvlN7vJ8t1vdzrd3EbRx1x/f
	jrVpbELKMffy30LeAtimg20U8BVoqPXxuQCM2/o5rosD0NJmL5Ae/62d1xO93nf9wG7cQFIByf6
	m8QNYUCOfIj9ZQTi5BGpUvd3yg==
X-Received: by 2002:a17:90b:5350:b0:3a4:b0a1:c7ed with SMTP id 98e67ed59e1d1-3b41c98bcf9mr14329274a91.13.1795592835859;
        Tue, 24 Nov 2026 23:47:15 -0800 (PST)
Received: from nixos ([2409:8a28:ae4:7f20:3645:b698:a929:4bcd])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b40578dca0sm29737125a91.2.2026.11.24.23.47.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 24 Nov 2026 23:47:15 -0800 (PST)
From: Zixin Wang <w1355457260@gmail.com>
To: linux-doc@vger.kernel.org
Cc: linux-rt-devel@lists.linux.dev,
	bigeasy@linutronix.de,
	frederic@kernel.org,
	darwi@linutronix.de,
	john.ogness@linutronix.de,
	clrkwllms@kernel.org,
	rostedt@goodmis.org,
	corbet@lwn.net,
	wagi@monom.org,
	atomlin@atomlin.com,
	linux-kernel@vger.kernel.org,
	Zixin Wang <w1355457260@gmail.com>
Subject: [PATCH v6] Documentation: real-time: Add runtime tuning guide
Date: Wed, 25 Nov 2026 07:46:58 +0000
Message-ID: <20261125074658.33117-1-w1355457260@gmail.com>
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

Runtime tuning options such as C-state limits, EFI runtime services,
CPU isolation, RCU callback offloading, and interrupt affinity are not
kernel configuration options.  Move them out of the configuration guide
into a separate real-time runtime tuning guide, so the configuration
guide stays focused on Kconfig options.

Keep the existing configuration section anchors in place and link to the
new guide from the relevant configuration options.  This preserves the
documentation links generated by kconfig-checker.

Link: https://bugzilla.kernel.org/show_bug.cgi?id=220633
Link: https://github.com/elisa-tech/wg-aerospace/issues/222
Signed-off-by: Zixin Wang <w1355457260@gmail.com>
---
v5 -> v6:
  - Split runtime tuning out of kernel-configuration.rst into
    runtime-tuning.rst, following Ahmed's review.
  - Keep the CONFIG_* section anchors so kconfig-checker links stay
    valid, and link to the new guide from the related options.
  - Add the new guide to the real-time documentation index.

Testing:
  make SPHINXDIRS="core-api" htmldocs and checkpatch.pl pass.

  kconfig-checker preempt_rt rules: all generated documentation links
  resolve to anchors in the built HTML.
---
 Documentation/core-api/real-time/index.rst    |   8 +-
 .../real-time/kernel-configuration.rst        |  44 ++--
 .../core-api/real-time/runtime-tuning.rst     | 203 ++++++++++++++++++
 3 files changed, 230 insertions(+), 25 deletions(-)
 create mode 100644 Documentation/core-api/real-time/runtime-tuning.rst

diff --git a/Documentation/core-api/real-time/index.rst b/Documentation/core-api/real-time/index.rst
index a17a3de..28b65cf 100644
--- a/Documentation/core-api/real-time/index.rst
+++ b/Documentation/core-api/real-time/index.rst
@@ -4,9 +4,10 @@
 Real-time preemption
 =====================
 
-This documentation is intended for Linux kernel developers and contributors
-interested in the inner workings of PREEMPT_RT. It explains key concepts and
-the required changes compared to a non-PREEMPT_RT configuration.
+This documentation is intended for Linux kernel developers, contributors, and
+system integrators interested in the inner workings of PREEMPT_RT. It explains
+key concepts and the required changes compared to a non-PREEMPT_RT
+configuration.
 
 .. toctree::
    :maxdepth: 2
@@ -16,3 +17,4 @@ the required changes compared to a non-PREEMPT_RT configuration.
    hardware
    architecture-porting
    kernel-configuration
+   runtime-tuning
diff --git a/Documentation/core-api/real-time/kernel-configuration.rst b/Documentation/core-api/real-time/kernel-configuration.rst
index d7f08e7..f26bd5a 100644
--- a/Documentation/core-api/real-time/kernel-configuration.rst
+++ b/Documentation/core-api/real-time/kernel-configuration.rst
@@ -13,6 +13,8 @@ Introduction
 
 This document lists the kernel configuration options that might affect a
 real-time kernel's worst-case latency.  It is intended for system integrators.
+Runtime tuning options are covered in
+Documentation/core-api/real-time/runtime-tuning.rst.
 
 Configuration options
 =====================
@@ -93,14 +95,9 @@ states.
 
 While disabling this option eliminates cpuidle-related latencies, doing so can
 significantly impact hardware longevity, warranty, and thermal behavior.
-Users should cap the maximum C-state to C1 instead.  For ACPI platforms, this
-can be achieved by using the boot parameter [1]_::
-
-  processor.max_cstate=1
-
-Higher C-states can be acceptable depending on the user workload's latency
-requirements.  For ACPI-based platforms, use the ``cpupower idle-info``
-command to inspect the available idle states.
+Users should cap the maximum C-state instead.  See
+:ref:`real_time_cpu_idle_limits` for the boot parameters that limit C-state
+depth.
 
 For more information, please see:
 
@@ -151,15 +148,8 @@ to perform a context switch.  This can cause significant latency spikes for
 the real-time system.
 
 ``CONFIG_PREEMPT_RT`` enables this option by default.  If this option is
-manually disabled at build time, the following boot parameter [1]_ may be used
-to disable EFI runtime at boot up::
-
-  efi=noruntime
-
-Alternatively, confine EFI runtime service calls to a housekeeping CPU by
-restricting the ``efi_runtime`` workqueue CPU affinity.  For example, set that
-workqueue's affinity to CPU #0 and pin your RT tasks to a different CPU range.
-See Documentation/core-api/workqueue.rst
+disabled at build time, EFI runtime services can still be disabled or confined
+at boot.  See :ref:`real_time_efi_runtime` for the runtime options.
 
 ``CONFIG_NO_HZ`` / ``CONFIG_NO_HZ_FULL``
 ----------------------------------------
@@ -179,6 +169,9 @@ the extra accounting and state book-keeping.
   ``NO_HZ_FULL`` may be beneficial.  In such cases, users should offload the
   kernel housekeeping to dedicated CPUs and isolate compute cores.
 
+See :ref:`real_time_cpu_isolation` for the boot parameters that control
+tickless operation and CPU isolation.
+
 See also Documentation/timers/no_hz.rst
 
 ``CONFIG_PREEMPT_RT``
@@ -190,6 +183,18 @@ See also Documentation/timers/no_hz.rst
 This option must be enabled, or the resulting kernel will not be fully
 preemptible and real-time capable.
 
+``CONFIG_RCU_NOCB_CPU``
+-------------------------
+
+:Expectation: allowed
+:Severity: *info*
+
+Enable support for offloading RCU callback invocation from selected CPUs
+to per-CPU ``rcuo`` kthreads.  Use it when RCU callback processing causes
+jitter on CPUs dedicated to latency-sensitive tasks.  See
+:ref:`real_time_rcu_offload` for the runtime parameters and
+Documentation/admin-guide/cpu-isolation.rst for the isolation model.
+
 ``CONFIG_TRACING`` (and tracing options)
 ----------------------------------------
 
@@ -300,8 +305,3 @@ establish and constrain the system's maximum latency.
 With that in mind, any incorrect real-time kernel configuration could cause a
 new maximum latency that shows up at the wrong time and is catastrophic for
 the real-time system's latency.
-
-References
-==========
-
-.. [1] See Documentation/admin-guide/kernel-parameters.rst
diff --git a/Documentation/core-api/real-time/runtime-tuning.rst b/Documentation/core-api/real-time/runtime-tuning.rst
new file mode 100644
index 0000000..155e1e5
--- /dev/null
+++ b/Documentation/core-api/real-time/runtime-tuning.rst
@@ -0,0 +1,203 @@
+.. SPDX-License-Identifier: GPL-2.0
+
+.. _real_time_runtime_tuning:
+
+==============================
+Real-time runtime tuning
+==============================
+
+.. contents:: Table of Contents
+   :depth: 2
+   :local:
+
+Introduction
+============
+
+Kernel configuration options alone do not determine a real-time system's
+worst-case latency.  Integrators commonly rely on boot parameters and
+runtime tunables as well, to keep kernel housekeeping work away from
+latency-sensitive tasks.  This document describes those runtime options;
+the build-time options are covered in
+Documentation/core-api/real-time/kernel-configuration.rst.
+
+The parameters below complement the configuration options described in
+that document.  Some of them correspond to a configuration option; the
+configuration guide links to the relevant section here when necessary.
+Each parameter is documented in detail in
+Documentation/admin-guide/kernel-parameters.rst; the notes here focus on
+the aspects that matter for real-time latency.  Consider these options
+only when the workload suffers from the corresponding interference;
+leave them disabled otherwise, as each of them trades flexibility or
+power for a lower worst-case latency.
+
+The notes below follow the decisions an integrator has to make: whether
+to limit CPU idle states, whether to keep tasks off a CPU, whether to
+stop its tick, and where interrupts should run.  For the full CPU
+isolation model and its limitations, see
+Documentation/admin-guide/cpu-isolation.rst.
+
+.. _real_time_cpu_idle_limits:
+
+CPU idle state limits
+=====================
+
+CPU idle states (C-states) allow the processor to enter low-power modes
+during periods of inactivity.  Very-low CPU idle states may require
+flushing the CPU caches and lowering or disabling the clocking.  This can
+lower power consumption, but it also increases the entry and exit latency
+from such states.
+
+While disabling ``CONFIG_CPU_IDLE`` eliminates cpuidle-related latencies,
+doing so can significantly impact hardware longevity, warranty, and
+thermal behavior.  Users should cap the maximum C-state to C1 instead.
+For ACPI platforms, this can be achieved by using the boot parameter::
+
+  processor.max_cstate=1
+
+On x86 systems using ``intel_idle``, the ``intel_idle.max_cstate=`` boot
+parameter sets the maximum C-state depth.  A value of 0 disables
+``intel_idle`` and falls back to ``acpi_idle``; it does not disable
+C-states.
+
+Higher C-states can be acceptable depending on the user workload's latency
+requirements.  For ACPI-based platforms, use the ``cpupower idle-info``
+command to inspect the available idle states.
+
+For more information, please see:
+
+- ``linux/tools/power/cpupower``
+- Documentation/admin-guide/pm/cpuidle.rst
+- Documentation/admin-guide/pm/index.rst
+
+.. _real_time_efi_runtime:
+
+EFI runtime services
+====================
+
+EFI is the standard boot and firmware interface for multiple architectures.
+EFI runtime services provide callback functions to be called from the kernel;
+e.g., as utilized by (``CONFIG_EFI_VARS*``) or (``CONFIG_RTC_DRV_EFI``).  For
+the former, the kernel calls into EFI to update the EFI variables.
+
+Calling into EFI means invoking firmware callbacks.  During such invocations,
+the system might not be able to react to interrupts and will thus not be able
+to perform a context switch.  This can cause significant latency spikes for
+the real-time system.
+
+``CONFIG_PREEMPT_RT`` enables ``CONFIG_EFI_DISABLE_RUNTIME`` by default.
+If that option is disabled at build time, the following boot parameter may
+be used to disable EFI runtime at boot up::
+
+  efi=noruntime
+
+Alternatively, confine EFI runtime service calls to a housekeeping CPU by
+restricting the ``efi_runtime`` workqueue CPU affinity.  For example, set that
+workqueue's affinity to CPU #0 and pin your RT tasks to a different CPU range.
+See Documentation/core-api/workqueue.rst.
+
+.. _real_time_cpu_isolation:
+
+CPU isolation
+=============
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
+    Equivalent to ``nohz_full=``; see below.  The residual 1 Hz tick is
+    offloaded to workqueues, which must be affine to the housekeeping
+    CPUs through the global workqueue ``cpumask``
+    (/sys/devices/virtual/workqueue/cpumask).  By default the global
+    workqueue runs on all CPUs; configure this cpumask manually after
+    boot, or use the ``domain`` flag to confine unbound workqueues.
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
+  passed to ``rcu_nocbs=``; see the RCU callback offloading section
+  below.  This parameter takes precedence over
+  ``CONFIG_RCU_NOCB_CPU_DEFAULT_ALL``.
+
+  The trade-off between tickless operation and the kernel-to-userspace
+  transition latency is described in the ``CONFIG_NO_HZ`` /
+  ``CONFIG_NO_HZ_FULL`` section in
+  Documentation/core-api/real-time/kernel-configuration.rst.
+
+``CONFIG_NO_HZ`` and ``CONFIG_NO_HZ_FULL`` in
+Documentation/core-api/real-time/kernel-configuration.rst control the
+build-time support for these parameters.
+
+.. _real_time_rcu_offload:
+
+RCU callback offloading
+=======================
+
+``CONFIG_RCU_NOCB_CPU`` in
+Documentation/core-api/real-time/kernel-configuration.rst enables support
+for offloading RCU callback invocation from selected CPUs to per-CPU
+``rcuo`` kthreads.  The offload is selected with ``rcu_nocbs=``, implied
+by ``nohz_full=``, or enabled for all CPUs by
+``CONFIG_RCU_NOCB_CPU_DEFAULT_ALL`` when neither parameter is given.
+
+``rcu_nocbs[=cpu-list]``
+  Offload RCU callback invocation from the listed CPUs to the
+  corresponding ``rcuo`` kthread, which can run on a housekeeping CPU.
+  This reduces callback-processing jitter on the CPU that enqueued them.
+  On a non-real-time kernel this also moves invocation out of softirq
+  context; with PREEMPT_RT, callbacks already run in kthread context
+  because ``rcutree.use_softirq`` is false, and the offload only changes
+  where they run.  If the parameter is given without a CPU list, no CPU
+  is offloaded at boot; the mode can still be toggled at runtime through
+  cpusets.  The parameter takes precedence over
+  ``CONFIG_RCU_NOCB_CPU_DEFAULT_ALL``.
+
+``rcu_nocb_poll``
+  Make the ``rcuo`` kthreads poll for callbacks instead of requiring the
+  offloaded CPUs to wake them.  This improves the real-time response at
+  the cost of higher power consumption, because the kthreads wake up
+  periodically to do the polling.  Consider this option only when wakeup
+  latency matters more than power.
+
+.. _real_time_irq_affinity:
+
+Interrupt affinity
+==================
+
+``irqaffinity=``
+  Format: ``<cpu-list>``.  Sets the default affinity mask for
+  interrupts that do not have an explicit affinity, steering them to
+  the housekeeping CPUs.  Managed interrupts are not affected by this
+  setting and cannot be redirected through ``/proc/irq/*``.  Verify
+  the resulting placement in ``/proc/interrupts``.  See
+  Documentation/core-api/irq/managed_irq.rst.
-- 
2.54.0

