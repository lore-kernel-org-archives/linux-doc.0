Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=128.30.2.78
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795764457;
	b=hK5FM6vUNeVZfgYznrDVI1SgIjrEd4hGyVG/fJ8vLlLzdMaG+IvlCtTV2G6dZPSompn2
	 auTtdRbCFOSA4GaHE23MluNx20xWj5O+6JTiQtjDFS/IsFl3QZi/FXzIC7XTR/6QGnxfp
	 C0Jz51Om/DuzoBzEBIngnbc0d4XiFLDqhJKFq6vSeYZcToC2qzGuoUCODEO2WRz7vXcKA
	 pZ3v8VGzLnBoFaC1OC0UxFmaHd1nDZqJjqh1/xTWfp2qU6vXflmMYSbBwfFrI7DIoJpQY
	 rQY9DwEyZh9HtdEbwzYpHv4jeT/ajXpasN3vS4LmUaaoWvsR2YTFxhZEfUslimD7r0A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795764457;
	h=DMARC-Filter:DKIM-Signature:Received:From:Date:Subject:MIME-Version:
	 Content-Type:Content-Transfer-Encoding:Message-Id:References:
	 In-Reply-To:To:Cc:X-Mailer;
	bh=yjkiIfcK17h7/KZ1jSzRKzUWbT4AiibgXykROeTE90Q=;
	b=n/tDyXNu78u+ovXCRzNcvmGS+XlnhSwMwP+g/TG6Bz9i5C/adHQhEcDPKSAdzFhd3lbn
	 6OgYM8U4xgxhW8meuHXK8q2YtaHCkv1ajzj6gpCiEoQxvYbUI+DfB6L82zTSm201TGwpC
	 BUUhlV9iZzbuIs0euzkr2+geKfS2aI6RIq/8CRS1VDRxL/Vdusi2X5ymZe6PpRCIxccG7
	 f4nflR7sX3WIgLRpbRi4Wv5n0w7vY59T8aLlHk7v7t/YLrrdDk1meRad8eN8tso36O3lM
	 CBr3RGzeEAe1vH6F9dWa9lWzTZ2caHHdkt1D+kfO4MDQMpvdngRVMiv2mrJo6dOJSyA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=csail.mit.edu;
	spf=pass smtp.mailfrom=csail.mit.edu;
	dkim=pass header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.a=rsa-sha256 header.s=test20231205 header.b=JhJHh2BY;
	arc=none smtp.remote-ip=128.30.2.78
Received: from outgoing2021.csail.mit.edu (outgoing2021.csail.mit.edu [128.30.2.78])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B02AA606A337;
	Fri, 27 Nov 2026 07:27:36 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org B02AA606A337
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=csail.mit.edu
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=outgoing.csail.mit.edu header.i=@outgoing.csail.mit.edu header.a=rsa-sha256 header.s=test20231205 header.b=JhJHh2BY
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=outgoing.csail.mit.edu; s=test20231205; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:
	List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=yjkiIfcK17h7/KZ1jSzRKzUWbT4AiibgXykROeTE90Q=; t=1795764456; x=1796628456; 
	b=JhJHh2BY8Gvv24/XD94CG85N4wp8g3KnTH3Pij+roHdFvpLaLsuyjsk9H0oR0NL9+Isg6wY1W4V
	TIPf4lbX6YDaKwg5LKerBzA3I0MTYvADBPWNPN4UEnH1Oss+RfsFGNqdvpwquFGDM+XOYC6QP724J
	kMvAMR3+lIPiEE4uZ/wKGwMBRmaquZtkebdS14GS17tQU/8hTG+yHoJprZ2LZJ3kbhpaLnqv4fS0q
	3bTtPqILOVz9VukIeC2udGw1E4ymZ+2izAQCnKw+IyNB/hj8cjfrCy5i/IZ5rE/IK+0TOt5EU6Ms0
	B19zWRoA69crA/REbRSJPUjIE+g3KKa7oB2Q==;
Received: from [167.220.238.14] (helo=[127.0.1.1])
	by outgoing2021.csail.mit.edu with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.95)
	(envelope-from <srivatsa@csail.mit.edu>)
	id 1xWqMk-006vml-1F;
	Fri, 27 Nov 2026 02:27:30 -0500
From: "Srivatsa S. Bhat (Microsoft)" <srivatsa@csail.mit.edu>
Date: Fri, 27 Nov 2026 12:56:58 +0530
Subject: [PATCH 1/4] Documentation: core-api/cpuhotplug: Fix a few minor
 inconsistencies
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
Content-Transfer-Encoding: 7bit
Message-Id: <20261127-docs-cpuhp-v1-1-a34a2c9f66fa@csail.mit.edu>
References: <20261127-docs-cpuhp-v1-0-a34a2c9f66fa@csail.mit.edu>
In-Reply-To: <20261127-docs-cpuhp-v1-0-a34a2c9f66fa@csail.mit.edu>
To: Jonathan Corbet <corbet@lwn.net>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>, Thomas Gleixner <tglx@kernel.org>, 
 Peter Zijlstra <peterz@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 "Srivatsa S. Bhat" <srivatsa@csail.mit.edu>, 
 Prasanna Kumar T S M <ptsm@linux.microsoft.com>, 
 Saurabh Sengar <ssengar@linux.microsoft.com>
X-Mailer: b4 0.13.0

Update the documentation to fix inconsistencies with the code and to
also improve readability.

Highlights:

- STARTUP section -> STARTING section
- "perf/online" -> "perf:online" (in examples)
- Fix missing mention of cpuhp_state_add_instance_nocalls_cpuslocked()
- Minor readability improvements and grammatical fixes throughout.

Signed-off-by: Srivatsa S. Bhat (Microsoft) <srivatsa@csail.mit.edu>
---
 Documentation/core-api/cpu_hotplug.rst | 143 +++++++++++++++++----------------
 1 file changed, 73 insertions(+), 70 deletions(-)

diff --git a/Documentation/core-api/cpu_hotplug.rst b/Documentation/core-api/cpu_hotplug.rst
index f8b3f59a3d5f..4e228fc00624 100644
--- a/Documentation/core-api/cpu_hotplug.rst
+++ b/Documentation/core-api/cpu_hotplug.rst
@@ -13,9 +13,9 @@ CPU hotplug in the Kernel
 Introduction
 ============
 
-Modern advances in system architectures have introduced advanced error
-reporting and correction capabilities in processors. There are couple OEMS that
-support NUMA hardware which are hot pluggable as well, where physical node
+Modern advances in system architectures have introduced advanced error reporting
+and correction capabilities in processors. There are a couple of OEMS that
+support NUMA hardware which are hot-pluggable as well, where physical node
 insertion and removal require support for CPU hotplug.
 
 Such advances require CPUs available to a kernel to be removed either for
@@ -33,7 +33,7 @@ Command Line Switches
 ``maxcpus=n``
   Restrict boot time CPUs to *n*. Say if you have four CPUs, using
   ``maxcpus=2`` will only boot two. You can choose to bring the
-  other CPUs later online.
+  other CPUs online later.
 
 ``nr_cpus=n``
   Restrict the total amount of CPUs the kernel will support. If the number
@@ -57,23 +57,23 @@ CPU maps
   upfront can save some boot time memory.
 
 ``cpu_online_mask``
-  Bitmap of all CPUs currently online. Its set in ``__cpu_up()``
+  Bitmap of all CPUs currently online. It is set in ``__cpu_up()``
   after a CPU is available for kernel scheduling and ready to receive
-  interrupts from devices. Its cleared when a CPU is brought down using
+  interrupts from devices. It is cleared when a CPU is brought down using
   ``__cpu_disable()``, before which all OS services including interrupts are
   migrated to another target CPU.
 
 ``cpu_present_mask``
-  Bitmap of CPUs currently present in the system. Not all
-  of them may be online. When physical hotplug is processed by the relevant
-  subsystem (e.g ACPI) can change and new bit either be added or removed
-  from the map depending on the event is hot-add/hot-remove. There are currently
-  no locking rules as of now. Typical usage is to init topology during boot,
-  at which time hotplug is disabled.
-
-You really don't need to manipulate any of the system CPU maps. They should
-be read-only for most use. When setting up per-cpu resources almost always use
-``cpu_possible_mask`` or ``for_each_possible_cpu()`` to iterate. To macro
+  Bitmap of CPUs currently present in the system. Not all of them may be online.
+  The time at which the physical hotplug is processed by the relevant subsystem
+  (e.g ACPI) can change and the new bit can either be added or removed from the
+  map depending on whether the event is a hot-add or a hot-remove, respectively.
+  There are currently no locking rules as of now. Typical usage is to init
+  topology during boot, at which time hotplug is disabled.
+
+You really don't need to manipulate any of the system CPU maps. They should be
+read-only for most purposes. When setting up per-cpu resources, almost always
+use ``cpu_possible_mask`` or ``for_each_possible_cpu()`` to iterate. The macro
 ``for_each_cpu()`` can be used to iterate over a custom CPU mask.
 
 Never use anything other than ``cpumask_t`` to represent bitmap of CPUs.
@@ -134,9 +134,9 @@ at state ``CPUHP_OFFLINE``. This includes:
 * All processes are migrated away from this outgoing CPU to new CPUs.
   The new CPU is chosen from each process' current cpuset, which may be
   a subset of all online CPUs.
-* All interrupts targeted to this CPU are migrated to a new CPU
-* timers are also migrated to a new CPU
-* Once all services are migrated, kernel calls an arch specific routine
+* All interrupts targeted to this CPU are migrated to a new CPU.
+* Timers are also migrated to a new CPU.
+* Once all services are migrated, the kernel calls an arch specific routine
   ``__cpu_disable()`` to perform arch specific cleanup.
 
 
@@ -155,14 +155,14 @@ the state CPUHP_ONLINE is reached. They can also be invoked when the
 callbacks of a state are set up or an instance is added to a multi-instance
 state.
 
-When a CPU is offlined the teardown callbacks are invoked in the reverse
+When a CPU is offlined, the teardown callbacks are invoked in the reverse
 order sequentially until the state CPUHP_OFFLINE is reached. They can also
 be invoked when the callbacks of a state are removed or an instance is
 removed from a multi-instance state.
 
 If a usage site requires only a callback in one direction of the hotplug
-operations (CPU online or CPU offline) then the other not-required callback
-can be set to NULL when the state is set up.
+operation (CPU online or CPU offline), then the other unnecessary callback
+pointer can be set to NULL when the state is set up.
 
 The state space is divided into three sections:
 
@@ -237,7 +237,7 @@ A successful online operation looks like this::
   [CPUHP_BRINGUP_CPU + 1]->startup()   -> success
   ...
   [CPUHP_AP_ONLINE]->startup()         -> success
-  === End of STARTUP section
+  === End of STARTING section
   [CPUHP_AP_ONLINE + 1]->startup()     -> success
   ...
   [CPUHP_ONLINE - 1]->startup()        -> success
@@ -249,7 +249,7 @@ A successful offline operation looks like this::
   [CPUHP_ONLINE - 1]->teardown()       -> success
   ...
   [CPUHP_AP_ONLINE + 1]->teardown()    -> success
-  === Start of STARTUP section
+  === Start of STARTING section
   [CPUHP_AP_ONLINE]->teardown()        -> success
   ...
   [CPUHP_BRINGUP_ONLINE - 1]->teardown()
@@ -273,14 +273,14 @@ A failed online operation looks like this::
   [CPUHP_BRINGUP_CPU + 1]->startup()   -> success
   ...
   [CPUHP_AP_ONLINE]->startup()         -> success
-  === End of STARTUP section
+  === End of STARTING section
   [CPUHP_AP_ONLINE + 1]->startup()     -> success
   ---
   [CPUHP_AP_ONLINE + N]->startup()     -> fail
   [CPUHP_AP_ONLINE + (N - 1)]->teardown()
   ...
   [CPUHP_AP_ONLINE + 1]->teardown()
-  === Start of STARTUP section
+  === Start of STARTING section
   [CPUHP_AP_ONLINE]->teardown()
   ...
   [CPUHP_BRINGUP_ONLINE - 1]->teardown()
@@ -323,7 +323,7 @@ down again because that would likely result in an endless loop::
   [CPUHP_ONLINE - (N - 1)]->teardown() -> success
   [CPUHP_ONLINE - N]->teardown()       -> fail
 
-Lather, rinse and repeat. In this case the CPU left in state::
+Lather, rinse and repeat. In this case the CPU was left in state::
 
   [CPUHP_ONLINE - (N - 1)]
 
@@ -345,7 +345,7 @@ There are two ways to allocate a CPU hotplug state:
   callback. The statically allocated states are described by constants in
   the cpuhp_state enum which can be found in include/linux/cpuhotplug.h.
 
-  Insert the state into the enum at the proper place so the ordering
+  Insert the state into the enum at the proper place so that the ordering
   requirements are fulfilled. The state constant has to be used for state
   setup and removal.
 
@@ -355,7 +355,7 @@ There are two ways to allocate a CPU hotplug state:
 
 * Dynamic allocation
 
-  When there are no ordering requirements for the state callbacks then
+  When there are no ordering requirements for the state callbacks, then
   dynamic allocation is the preferred method. The state number is allocated
   by the setup function and returned to the caller on success.
 
@@ -409,37 +409,37 @@ offline  For states in the ONLINE section which do not provide
          a startup callback
 ======== =======================================================
 
-As the @name argument is only used for sysfs and instrumentation other mode
-descriptors can be used as well if they describe the nature of the state
-better than the common ones.
+As the @name argument is only used for sysfs and instrumentation,
+other mode descriptors can be used as well if they describe the nature
+of the state better than the common ones.
 
-Examples for @name arguments: "perf/online", "perf/x86:prepare",
-"RCU/tree:dying", "sched/waitempty"
+Examples for @name arguments: "perf:online", "perf/x86:prepare",
+"RCU/tree:dying", "sched:waitempty"
 
 The @startup argument is a function pointer to the callback which should be
 invoked during a CPU online operation. If the usage site does not require a
-startup callback set the pointer to NULL.
+startup callback, set the pointer to NULL.
 
 The @teardown argument is a function pointer to the callback which should
 be invoked during a CPU offline operation. If the usage site does not
-require a teardown callback set the pointer to NULL.
+require a teardown callback, set the pointer to NULL.
 
 The functions differ in the way how the installed callbacks are treated:
 
   * cpuhp_setup_state_nocalls(), cpuhp_setup_state_nocalls_cpuslocked()
-    and cpuhp_setup_state_multi() only install the callbacks
+    and cpuhp_setup_state_multi() only install the callbacks.
 
   * cpuhp_setup_state() and cpuhp_setup_state_cpuslocked() install the
     callbacks and invoke the @startup callback (if not NULL) for all online
-    CPUs which have currently a state greater than the newly installed
-    state. Depending on the state section the callback is either invoked on
-    the current CPU (PREPARE section) or on each online CPU (ONLINE
-    section) in the context of the CPU's hotplug thread.
+    CPUs which currently have a state greater than the newly installed
+    state. Depending on the state section, the callback is either
+    invoked on the current CPU (PREPARE section) or on each online CPU
+    (ONLINE section) in the context of the CPU's hotplug thread.
 
-    If a callback fails for CPU N then the teardown callback for CPU
+    If a callback fails for CPU N, then the teardown callback for CPU
     0 .. N-1 is invoked to rollback the operation. The state setup fails,
     the callbacks for the state are not installed and in case of dynamic
-    allocation the allocated state is freed.
+    allocation, the allocated state is freed.
 
 The state setup and the callback invocations are serialized against CPU
 hotplug operations. If the setup function has to be called from a CPU
@@ -484,8 +484,8 @@ The functions differ in the way how the installed callbacks are treated:
     and cpuhp_remove_multi_state() only remove the callbacks.
 
   * cpuhp_remove_state() removes the callbacks and invokes the teardown
-    callback (if not NULL) for all online CPUs which have currently a state
-    greater than the removed state. Depending on the state section the
+    callback (if not NULL) for all online CPUs which currently have a state
+    greater than the removed state. Depending on the state section, the
     callback is either invoked on the current CPU (PREPARE section) or on
     each online CPU (ONLINE section) in the context of the CPU's hotplug
     thread.
@@ -497,7 +497,7 @@ hotplug operations. If the remove function has to be called from a CPU
 hotplug read locked region, then the _cpuslocked() variants have to be
 used. These functions cannot be used from within CPU hotplug callbacks.
 
-If a multi-instance state is removed then the caller has to remove all
+If a multi-instance state is removed, then the caller has to remove all
 instances first.
 
 Multi-Instance state instance management
@@ -508,6 +508,7 @@ state:
 
   * cpuhp_state_add_instance(state, node)
   * cpuhp_state_add_instance_nocalls(state, node)
+  * cpuhp_state_add_instance_nocalls_cpuslocked(state, node)
 
 The @state argument is either a statically allocated state or the state
 number which was allocated in the dynamic range by cpuhp_setup_state_multi().
@@ -519,22 +520,23 @@ via container_of().
 
 The functions differ in the way how the installed callbacks are treated:
 
-  * cpuhp_state_add_instance_nocalls() and only adds the instance to the
-    multi-instance state's node list.
+  * cpuhp_state_add_instance_nocalls() and
+    cpuhp_state_add_instance_nocalls_cpuslocked() only adds the
+    instance to the multi-instance state's node list.
 
   * cpuhp_state_add_instance() adds the instance and invokes the startup
     callback (if not NULL) associated with @state for all online CPUs which
-    have currently a state greater than @state. The callback is only
-    invoked for the to be added instance. Depending on the state section
+    currently have a state greater than @state. The callback is only
+    invoked for the instance to be added. Depending on the state section,
     the callback is either invoked on the current CPU (PREPARE section) or
     on each online CPU (ONLINE section) in the context of the CPU's hotplug
     thread.
 
-    If a callback fails for CPU N then the teardown callback for CPU
+    If a callback fails for CPU N, then the teardown callback for CPU
     0 .. N-1 is invoked to rollback the operation, the function fails and
     the instance is not added to the node list of the multi-instance state.
 
-To remove an instance from the state's node list these functions are
+To remove an instance from the state's node list, these functions are
 available:
 
   * cpuhp_state_remove_instance(state, node)
@@ -550,9 +552,9 @@ The functions differ in the way how the installed callbacks are treated:
 
   * cpuhp_state_remove_instance() removes the instance and invokes the
     teardown callback (if not NULL) associated with @state for all online
-    CPUs which have currently a state greater than @state.  The callback is
-    only invoked for the to be removed instance.  Depending on the state
-    section the callback is either invoked on the current CPU (PREPARE
+    CPUs which currently have a state greater than @state. The callback is
+    only invoked for the instance to be removed. Depending on the state
+    section, the callback is either invoked on the current CPU (PREPARE
     section) or on each online CPU (ONLINE section) in the context of the
     CPU's hotplug thread.
 
@@ -618,8 +620,8 @@ Testing of hotplug states
 =========================
 
 One way to verify whether a custom state is working as expected or not is to
-shutdown a CPU and then put it online again. It is also possible to put the CPU
-to certain state (for instance *CPUHP_AP_ONLINE*) and then go back to
+offline a CPU and then get it online again. It is also possible to put the CPU
+to a certain state (for instance *CPUHP_AP_ONLINE*) and then go back to
 *CPUHP_ONLINE*. This would simulate an error one state after *CPUHP_AP_ONLINE*
 which would lead to rollback to the online state.
 
@@ -645,14 +647,14 @@ To rollback CPU4 to ``lib/percpu_cnt:online`` and back online just issue::
   $ cat /sys/devices/system/cpu/cpu4/hotplug/state
   140
 
-It is important to note that the teardown callback of state 140 have been
+It is important to note that the teardown callback of state 140 has been
 invoked. And now get back online::
 
   $ echo 169 > /sys/devices/system/cpu/cpu4/hotplug/target
   $ cat /sys/devices/system/cpu/cpu4/hotplug/state
   169
 
-With trace events enabled, the individual steps are visible, too::
+With trace events enabled, the individual steps are visible too::
 
   #  TASK-PID   CPU#    TIMESTAMP  FUNCTION
   #     | |       |        |         |
@@ -681,7 +683,7 @@ With trace events enabled, the individual steps are visible, too::
    cpuhp/4-31   [004]  95.552: cpuhp_exit:  cpu: 0004  state: 168 step: 168 ret: 0
       bash-394  [005]  95.553: cpuhp_exit:  cpu: 0004  state: 169 step: 140 ret: 0
 
-As it an be seen, CPU4 went down until timestamp 22.996 and then back up until
+As it can be seen, CPU4 went down until timestamp 22.996 and then back up until
 95.552. All invoked callbacks including their return codes are visible in the
 trace.
 
@@ -701,16 +703,17 @@ The following functions and configurations are required:
   kernel after the routine returns. This includes the shutdown of the timer.
 
 ``__cpu_die()``
-  This actually supposed to ensure death of the CPU. Actually look at some
-  example code in other arch that implement CPU hotplug. The processor is taken
-  down from the ``idle()`` loop for that specific architecture. ``__cpu_die()``
-  typically waits for some per_cpu state to be set, to ensure the processor dead
-  routine is called to be sure positively.
+  This is actually supposed to ensure the death of the CPU. Look at some example
+  code in other archs that implement CPU hotplug. The processor is taken down
+  from the ``idle()`` loop for that specific architecture. ``__cpu_die()``
+  typically waits for some per_cpu state to be set, to be absolutely sure that
+  the processor's dead routine has been called.
 
 User Space Notification
 =======================
 
-After CPU successfully onlined or offline udev events are sent. A udev rule like::
+After a CPU is successfully onlined or offlined, udev events are sent.
+A udev rule like::
 
   SUBSYSTEM=="cpu", DRIVERS=="processor", DEVPATH=="/devices/system/cpu/*", RUN+="the_hotplug_receiver.sh"
 
@@ -730,11 +733,11 @@ will receive all events. A script like::
 
 can process the event further.
 
-When changes to the CPUs in the system occur, the sysfs file
+When changes occur to the CPUs in the system, the sysfs file
 /sys/devices/system/cpu/crash_hotplug contains '1' if the kernel
-updates the kdump capture kernel list of CPUs itself (via elfcorehdr and
+updates the kdump capture kernel's list of CPUs itself (via elfcorehdr and
 other relevant kexec segment), or '0' if userspace must update the kdump
-capture kernel list of CPUs.
+capture kernel's list of CPUs.
 
 The availability depends on the CONFIG_HOTPLUG_CPU kernel configuration
 option.
@@ -750,7 +753,7 @@ of the elfcorehdr (which contains the list of CPUs) and other relevant
 kexec segments, then the rule skips the unload-then-reload of the kdump
 capture kernel.
 
-Kernel Inline Documentations Reference
+Kernel Inline Documentation References
 ======================================
 
 .. kernel-doc:: include/linux/cpuhotplug.h

-- 
2.43.0

