Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.216.49
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793842722;
	b=fVk7VLorJtNLy/ZOpSMaVaVju2PlhENVzHBRWlZcDKSRSS8i6tVAPIyrl6dFVI4PzOxj
	 LT3u8/uUj0lHPGsyd/eetrOusfwFNvp+0VJ+HYaIKPnwacXnwf3HZwIRAOTH99PRSfsuA
	 DN9+Owm5Vi8cP2EvLs2p4wtdN2KfZ6g4ZcNyKKO87Bl6/IoVb1UG+d9Ve3nbsKL+bpge0
	 8JYamXIhuFyC9ZDPKDtyuTdch3GHSE2PwtuMZAzKEYnjraWYEbQX27NMFNOBPoM/dpWga
	 ZEvTPr/ZKmzSjXuffnHVAs7ZVLkC+lbACr2npiR6m7eSSYeNLYxUOeptSMDS64Z1CPw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793842722;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=2zkGy3jMwTd8Db60GjN+O0HgdYthyoK9NJw8yGoQ+Bk=;
	b=SzjFSXNTN2sXcno1XHAl6Hn186zoNG3gqIoclG83vLvsE5fVJAFOANAfcDdMSQBEdqwX
	 GX+JL226MCFuuHhJvAK++nUAXNcMzLHq+d6oLEjtztjb/OemYFLdmoabhtv1MorMj3ELy
	 wMyjglD2LrvQOtTykCJG8vgiryjVmcRBi8Y39X850ATm4igEccdj/EteS/QQkoBlmjW/u
	 7zN+TLj3ZQ+lBoZjr+qKwPwPcle72g77DenqnAmf6/tPhy5IDRzpEDOVxGs+O9coQx8hV
	 6yRWbSGrwd/KGrOkLsnkPQl2BqP1jc+XxtLXp1BTaUurWzymEAC1GiJyZBIw7bGwRfw==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BeDR02ZV;
	arc=none smtp.remote-ip=209.85.216.49
Received: from mail-pj1-f49.google.com (mail-pj1-f49.google.com [209.85.216.49])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 817CE606A31B
	for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2026 01:38:41 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 817CE606A31B
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BeDR02ZV
Received: by mail-pj1-f49.google.com with SMTP id 98e67ed59e1d1-3ada8bc2380so698282a91.3
        for <linux-doc@vger.kernel.org>; Wed, 04 Nov 2026 17:38:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793842721; x=1794447521; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=2zkGy3jMwTd8Db60GjN+O0HgdYthyoK9NJw8yGoQ+Bk=;
        b=BeDR02ZVlas7a5NRAjNR1MYaizQj7iqYAauRzdBiXL2GaEk/fzkHOYdaZ0HxZlnfhs
         +Ay12tt80dEt2FiNBafNJ9U0aGXWDH5Npl8IND70o/Fj+CJcObcomNrZ75ZH280APaSw
         HfzSAk+g2NBr2grIhULDYLL+OwSUTSIC7ff/uEexlclPL/g0roOlm3NYtH+nuH3MlC6l
         yaW84NicJDOqHSsW23V9Tnd7+aRrx0tDhINTlBQTy2ROZ6q/kzYoqxhb/epVTWyf8JO0
         S7mqD0a2D7YZ32anPR8Sc4jN1RZiNo8KMvEwyHYGOrbjkak0vf0UumviYP9WoCSEs9f0
         rZDg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793842721; x=1794447521;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=2zkGy3jMwTd8Db60GjN+O0HgdYthyoK9NJw8yGoQ+Bk=;
        b=k3yDHSe0p+WS4LjEh64ZwsEUqcdfZ6rp8VXrsqggSZQj36ea3DF49caTIGHkS0eY5q
         8Pu1dchApNY51vo2GYtnbyeUxbQ5gdSUlkS8jdlOvSMrFo0Dou2TMwpz17syTwG7Qwc8
         QJ0DRbIJDoyQ4iCYB32rMHsuRBLGCRJNP1nlq4NUr7c8s1lvpShhWQAA0nxKopaHHhjG
         cMonjhSoxO7mF453pg2pVMvbwFKZqj/J5GzM7hlhuIfXjfIA8wkmjaAn9ZHzSa9fvu/x
         Dm2vmbbdvWsAu7HoyoK6aB+6DFkUmImUULn0BDbIsoc5etPynLHdt5V+QX4MVLmD7Hms
         vrxw==
X-Gm-Message-State: APuU4Z+3IkKynIcVtpXZD+JPmqK3yeIemXseHpTDjXPH511RPaEMCMS5
	Oz5nifRnsvx81yX5pfAhLP4tORVb3/SVfh73Yr6l2pSqZ2DhWMfUHxJG
X-Gm-Gg: AYBFou0lf9q7bY0gdmvQZtdA795rn6zU+YjT2uM4W4ZcFZi6CX2knElqXmV3ZbBXlCS
	snBjnvK2qn8Z0AGxGeyPtWo5qpV8spTVP0PVd73C3h4uYeVzvtj10c+jIvKXtLR5wxFkQGeiNy9
	3AmvWYYlQv0wDMWHL/e1gzbYez3QhFRzDg/7jjic4BD4UDkKRquKfrX0X8ytyt5eRgo+x9s8x6E
	VM9pwrKDDGLvmnOgOJOrpw5oj6KGZn5u6/SMJWxudo5KMvX9DMjerMc//6sFBKIrTFDx4lN4WOC
	gROqqzqwWmSrIIrGhGIm8tLnnS5ObpwA3qgYPCK35dk+80krTmUEOg5MxZXCMvOK5uhNR9mQ7pG
	TZ2UrLUdi0rV+B5OucgStJODjvxFWwiJf2ojiRpX3pGHvDXvMkfyAMHYXlzjANrYe9p8MQAaCF0
	WHuKiUMmcjxyLf9XB1Vc2ThtRjIdbhAeYzvYc1pc9LFPaWuQn+inQYGcPeEv4edJt8TSpLS6liZ
	dsD9R+1pQvw+JJqw33v+us14GeXnN2NEkj+6R9aRrx3pfQODRp12QQt7kUd/zfDJCsxgOGafWSO
	G4oK09UOLjBs2bfH17aaOZlVMi2lEdkPL85T
X-Received: by 2002:a17:90b:4f42:b0:3ac:a521:953 with SMTP id 98e67ed59e1d1-3ae897c777fmr14458589a91.46.1793842720674;
        Wed, 04 Nov 2026 17:38:40 -0800 (PST)
Received: from penguin.lxd ([67.223.127.112])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-3b0b31d2b5esm1164975a91.15.2026.11.04.17.38.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Nov 2026 17:38:39 -0800 (PST)
From: Matthew Weber <matthew.l.weber@gmail.com>
To: Jonathan Corbet <corbet@lwn.net>
Cc: linux-doc@vger.kernel.org,
	Shuah Khan <skhan@linuxfoundation.org>,
	Thorsten Leemhuis <linux@leemhuis.info>,
	Nathan Chancellor <nathan@kernel.org>,
	Nicolas Schier <nsc@kernel.org>,
	linux-kbuild@vger.kernel.org,
	Dmitry Vyukov <dvyukov@google.com>,
	Andrey Konovalov <andreyknvl@gmail.com>,
	kasan-dev@googlegroups.com,
	Matthew Weber <matthew.l.weber@gmail.com>
Subject: [PATCH v2 3/4] Documentation: admin-guide: Update workload tracing guide
Date: Wed,  4 Nov 2026 19:38:22 -0600
Message-Id: <20261105013823.29741-4-matthew.l.weber@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261105013823.29741-1-matthew.l.weber@gmail.com>
References: <20261105013823.29741-1-matthew.l.weber@gmail.com>
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

Expand workload-tracing.rst, which is aimed at application developers
and system integrators analyzing which kernel code a workload relies on,
with guidance on ftrace function graph tracing for target binaries,
syscall trapping under QEMU with the GDB stub, and mapping workload
observations to kernel configuration symbols.

Add a MAINTAINERS entry for the Workload analysis documents.

Signed-off-by: Matthew Weber <matthew.l.weber@gmail.com>
---
Changes in v2:
 - Now precedes the kernel minimization guide.
 - Creates the Workload analysis MAINTAINERS entry.
 - Refers to "scripts/kernel-sloc --help" instead of the minimization guide,
   which is added later in the series.

 .../admin-guide/workload-tracing.rst          | 138 +++++++++++++++++-
 MAINTAINERS                                   |   6 +
 2 files changed, 137 insertions(+), 7 deletions(-)

diff --git a/Documentation/admin-guide/workload-tracing.rst b/Documentation/admin-guide/workload-tracing.rst
index 35963491b..550653147 100644
--- a/Documentation/admin-guide/workload-tracing.rst
+++ b/Documentation/admin-guide/workload-tracing.rst
@@ -176,6 +176,20 @@ by three workloads we have chose for this analysis.
  * stress-ng
  * paxtest
 
+To retain arguments, results, and calls from child processes, run the
+application with its normal inputs and environment::
+
+    strace -f -o syscalls.log ./app
+    strace -f -c -o syscall-summary.txt ./app
+
+These are separate runs. ``-f`` follows children and threads; ``-c`` produces
+a summary rather than the chronological trace. For a narrower investigation,
+add ``-e trace=%file`` to the first command to select file-related calls.
+``-k`` can add user-space stack traces when strace supports unwinding; it
+does not expose the kernel call stack. For an application that does not exit,
+stop the tracing session after a defined observation interval. Include
+startup and representative error inputs, not just a successful steady state.
+
 What is cscope and how do we use it?
 ====================================
 
@@ -588,6 +602,116 @@ times each system call is invoked, and the corresponding Linux subsystem.
 | arch_prctl        | 2         | Process Mgmt.   | sys_arch_prctl()     |
 +-------------------+-----------+-----------------+----------------------+
 
+Kernel paths reached by the workload
+====================================
+
+To go beyond the syscall boundary, use the function graph tracer described
+in :doc:`/trace/ftrace`. In a tracing-capable test system or QEMU guest,
+install ``trace-cmd`` and check that the running kernel provides
+``CONFIG_FTRACE``, ``CONFIG_FUNCTION_TRACER``, and
+``CONFIG_FUNCTION_GRAPH_TRACER``. Enabling ``FTRACE`` alone is not sufficient.
+Check availability and collect a task-filtered graph::
+
+    sudo trace-cmd list -t
+    sudo trace-cmd record -p function_graph -F -c -O nofuncgraph-irqs \
+        --user "$USER" -o functions.dat ./app
+    trace-cmd report -i functions.dat > functions.txt
+
+Use an isolated measurement system: these commands change its tracing state.
+``-F`` filters to the launched application, ``-c`` follows its children, and
+``--user`` avoids running the workload as root just because the recorder needs
+privileges. Preserve the workload's original user and environment. The option
+``nofuncgraph-irqs`` excludes interrupt execution from the graph; asynchronous
+work in other tasks is outside this task filter too. Check the report for lost
+events before treating missing functions as unobserved. The perf examples
+above provide sampled profiles, not an exhaustive list of executed functions.
+
+Tracing a minimal user space
+============================
+
+A single-binary initramfs has no shell or guest tracing tools. Initial discovery
+can use the same application and libc in a full guest for the target
+architecture, but that does not reproduce its launch as PID 1. The following
+inspects the actual boot with QEMU's host-side GDB stub without adding tools to
+the archive.
+
+Follow :doc:`/process/debugging/gdb-kernel-debugging` for the debug build and
+matching ``vmlinux`` setup. Add ``nokaslr`` to the guest kernel command line
+and ``-S -gdb tcp:127.0.0.1:1234`` to the QEMU boot command. ``-S`` pauses the
+guest before boot, allowing breakpoints to be installed. Connect host GDB::
+
+    gdb-multiarch /path/to/build/vmlinux
+    (gdb) target remote localhost:1234
+    (gdb) tbreak kernel_init
+    (gdb) continue
+
+For a native 64-bit arm64 workload, the following records syscall entry numbers
+and the first argument from the saved user registers. It starts after PID 1's
+kernel initialization, before the application executes::
+
+    (gdb) set pagination off
+    (gdb) set logging file pid1-syscalls.log
+    (gdb) set logging enabled on
+    (gdb) break do_el0_svc
+    (gdb) commands
+    > silent
+    > printf "syscall=%lu arg0=%#lx\n", regs->regs[8], regs->regs[0]
+    > continue
+    > end
+    (gdb) continue
+
+Interrupt GDB with Ctrl-C after the observation interval, then disable logging.
+Resolve the numbers using the matching target build's syscall-number definitions.
+These are entry observations, not decoded arguments or syscall results. To
+inspect a particular kernel path, disable the logging breakpoint, set a
+breakpoint on its implementation, and use ``bt`` or ``step`` at the hit.
+Entry functions and register layouts are architecture- and revision-specific;
+check them against the matching source. Once other processes exist, an entry
+breakpoint can also capture their calls; GDB threads in QEMU represent vCPUs,
+not Linux tasks. This is not a task-filtered whole-kernel coverage collector.
+
+QEMU also offers low-level logging with ``-d`` (list options with ``-d help``)
+and ``-D qemu.log``. For example, ``-d in_asm`` logs translated instruction
+blocks, not every execution or a workload-specific call trace. A block that is
+not logged again may still have executed again from the translation cache, so
+the log cannot show that a block did not run.
+
+Mapping observations to configuration
+-------------------------------------
+
+Use the source revision and architecture matching the measured kernel, rather
+than assuming the syscall tables above describe every build. Locate each
+syscall implementation with cscope or its ``SYSCALL_DEFINE`` declaration,
+follow calls into the relevant subsystem, and inspect its Makefile and Kconfig.
+For example, ``eventfd2`` is implemented in ``fs/eventfd.c``;
+``fs/Makefile`` builds ``eventfd.o`` under ``CONFIG_EVENTFD``. Use the
+configuration help to review its dependencies before changing the option.
+Other paths, such as the core ``write`` syscall, are built unconditionally
+and may reach different drivers depending on the file descriptor. A syscall
+does not necessarily map to one removable option.
+
+Retain results as well as names: a libc may probe an optional syscall, tolerate
+``ENOSYS``, and take a fallback path. Observing the call alone does not prove
+that the feature must remain enabled. Conversely, boot and recovery dependencies
+may be absent from an application's syscall trace. Record the observed path,
+source/configuration mapping, and result of re-testing after the change.
+
+For the distinction between built code and observed execution, use
+:doc:`/dev-tools/gcov` for execution counts and :doc:`/dev-tools/kcov` for
+task-scoped kernel PCs. Follow their collection and symbolization instructions
+in a separate measurement build; neither strace nor a sampled perf profile
+supplies those coverage results. Unobserved code remains a candidate for
+investigation, not proof of an unnecessary feature.
+
+Keep the built-code inventory alongside the runtime observations using
+``scripts/kernel-sloc --report compiled.json kernel .`` and, for the matching
+debug ELF, ``scripts/kernel-sloc --report linked.json dwarf vmlinux``. See
+``scripts/kernel-sloc --help`` for its modes and requirements. The
+reports list compiled files and DWARF-resolved functions/source lines, not
+execution. Compare full source paths as well as function names; repeated
+static names and inlining make names alone insufficient. An unobserved entry
+is a review candidate, not proof that its configuration can be removed.
+
 Conclusion
 ==========
 
@@ -597,10 +721,10 @@ information on the resources in use by workloads using strace.
 References
 ==========
 
- * `Discovery Linux Kernel Subsystems used by OpenAPS <https://elisa.tech/blog/2022/02/02/discovery-linux-kernel-subsystems-used-by-openaps>`_
- * `ELISA-White-Papers-Discovering Linux kernel subsystems used by a workload <https://github.com/elisa-tech/ELISA-White-Papers/blob/master/Processes/Discovering_Linux_kernel_subsystems_used_by_a_workload.md>`_
- * `strace <https://man7.org/linux/man-pages/man1/strace.1.html>`_
- * `perf <https://man7.org/linux/man-pages/man1/perf.1.html>`_
- * `paxtest README <https://github.com/opntr/paxtest-freebsd/blob/hardenedbsd/0.9.14-hbsd/README>`_
- * `stress-ng <https://www.mankier.com/1/stress-ng>`_
- * `Monitoring and managing system status and performance <https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/monitoring_and_managing_system_status_and_performance/index>`_
+ * `Discovery Linux Kernel Subsystems used by OpenAPS <https://elisa.tech/blog/2022/02/02/discovery-linux-kernel-subsystems-used-by-openaps>`__
+ * `ELISA-White-Papers-Discovering Linux kernel subsystems used by a workload <https://github.com/elisa-tech/ELISA-White-Papers/blob/master/Processes/Discovering_Linux_kernel_subsystems_used_by_a_workload.md>`__
+ * `strace <https://man7.org/linux/man-pages/man1/strace.1.html>`__
+ * `perf <https://man7.org/linux/man-pages/man1/perf.1.html>`__
+ * `paxtest README <https://github.com/opntr/paxtest-freebsd/blob/hardenedbsd/0.9.14-hbsd/README>`__
+ * `stress-ng <https://www.mankier.com/1/stress-ng>`__
+ * `Monitoring and managing system status and performance <https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/8/html/monitoring_and_managing_system_status_and_performance/index>`__
diff --git a/MAINTAINERS b/MAINTAINERS
index d83f37c3a..d92d5eff0 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28154,6 +28154,12 @@ F:	sound/soc/codecs/arizona*
 F:	sound/soc/codecs/cs47l24*
 F:	sound/soc/codecs/wm*
 
+WORKLOAD ANALYSIS DOCUMENTATION
+M:	Matthew Weber <matthew.l.weber@gmail.com>
+L:	linux-doc@vger.kernel.org
+S:	Maintained
+F:	Documentation/admin-guide/workload-tracing.rst
+
 WORKQUEUE
 M:	Tejun Heo <tj@kernel.org>
 R:	Lai Jiangshan <jiangshanlai@gmail.com>
-- 
2.39.5

