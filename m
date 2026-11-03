Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.160.41
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793718542;
	b=eit0eBh+LHoxVF48seq3FzzdEh9XiJsiLOdCnyY4+m1WfLpea3r5uv+dhl9dH6iXRq07
	 d0nUEfvx7OV/yJ14MuE+nzKoBOCQ+DYA0veE9VLCqhb0awEoZo4JxWsxVm8gfyVpcVqj+
	 ImS++KY57UqOV+0PY/z3Tn2zA9/MfzJZ+jT/u+kW531TIOKHSDBRx4ufnrWZ7tLmsDkxx
	 smxScjPUGOqWurNiGRyd0aVDJDGcVQQAJCxi1ENVIBG2qAF7S0J0nXLWpcwBRj32Bk3sq
	 wx8BPlxNNNc+EvIJZeBgPwiODxiQbBAM46cIb+to/Qf33cxpv1n9PwCckj8Uffz+q8g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793718542;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:Received:From:To:Cc:Subject:
	 Date:Message-Id:X-Mailer:In-Reply-To:References:MIME-Version:
	 Content-Transfer-Encoding;
	bh=bsKbfazNgKL/WfwH3AsYRbzEAQO1BlTse7QOEomIcp8=;
	b=tBQkWBHsnHyua6ClaFb0zDbV2MYRyq2p0Hq1P5JzrFJbJ4N7sYyp9sNCkegM8JdhDDPv
	 31+W3d9yTMF5nGhML1fFi05eHTpNn1pTg1GiLB/npt7CiG0Td6100sGvvG6YhV+L+8YxV
	 ySGgR+x9OSU1C2VzWL0KeliJCsxqlBxNRwy1JV/OTRrGu6u45Pd33WPyZWrW+7q1cPkeE
	 fUNAcuXdWNr2S8QJD7qJgZwdHkgiAZYhXtpXHDqZGhiWqHpUESiNSKarXadUGIpovR8X7
	 +s4Tfvk45i9Wm42gEwHtTRtknT9dxK0SD7FvtWoiCjteGmjdWdHUAWBEwTpymBS+EvQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R1Qafmbe;
	arc=none smtp.remote-ip=209.85.160.41
Received: from mail-oa1-f41.google.com (mail-oa1-f41.google.com [209.85.160.41])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A8E9A606EEB4
	for <linux-doc@vger.kernel.org>; Tue,  3 Nov 2026 15:09:01 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A8E9A606EEB4
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=R1Qafmbe
Received: by mail-oa1-f41.google.com with SMTP id 586e51a60fabf-475920b9ca2so1154348fac.1
        for <linux-doc@vger.kernel.org>; Tue, 03 Nov 2026 07:09:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793718540; x=1794323340; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=bsKbfazNgKL/WfwH3AsYRbzEAQO1BlTse7QOEomIcp8=;
        b=R1Qafmbe5aIW9A4v7whY+iU0qpiskIWxanXp7cmWk9ebmB0IUK5Dge9P4WLl5fwDiM
         QPnmFHStjbUYBAV8aIg3YY+yjUojBSarvUifG6y0+dJLxJYbd7o4rqSn6lLC5r1gu6Cs
         +KaZ7GHnF1TZ/CQn8ccI/kYQiVDFHJ917GEJQJ+REaDELvDfdEdki4bS4VT76EcW8zD1
         mc8gWYsOXi0vDnfCFI17GHh8UyeIyobtxiHvHzq9pGyjPztCQFAKBd8lgUgWJpyQzdc7
         r2IS5UHZgb7QxLDf/FOzEiQcSZMISre1SSJxwnIzrTuC5Q9t0KjPFYYOWf1eNkgXMVwG
         amTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793718540; x=1794323340;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=bsKbfazNgKL/WfwH3AsYRbzEAQO1BlTse7QOEomIcp8=;
        b=KIpoACnSfONj3WhTJiEVdu9+4ohU57Rq3XRcdpFMGZRPXoIvT0R2Nkuoe2nbVQpLIo
         042CVPBcdaUuqwC2ela8R9NSHlxchcUO8EzC4GrpwlOyTSMX6NitWjsafwb46Ye0OOsz
         uY6SavBxRA9gFJ4cNR9BSm+fXBLt2wNarY0meOzd65s6KWKE2vpjJ45eVdqTKpCEm24K
         PnThqUmxqlpZsMDjE/f6aLm/LS6zXh3uEZLghYBOaFhpupKX+XAi46JPTcAm7qlJzKd4
         zP6EquCvkKauVb0LiUA53+aFd+A/xkNbojjve8g0Crxw5878xpoR/NWqqWDsGrBS8Jbm
         r3AQ==
X-Gm-Message-State: APuU4Z8aKHE2vLoaXDqgoPa33ZtqiI1iMrfqy5sFjnoThjItgQXFF+iq
	vaIROen3tO/BdEazOo74RUdzipVZWusGFkHFjYfPSJb48tFI8DQ4WH/p
X-Gm-Gg: AYBFou2MAfnGj4qZRsCHxCVWpyI7bp7uG81XaGNUlnYywNtEsTHMIKDSXFvzzIPHNZd
	AdwFQ/yYhpAnCdiEN8NxZOuFR+4bJjYqqOaj0ltN9oX8Y0av6z8snv+qLzKO92UlLMFhKq8OD6k
	387f8HG1QsWG1am7YO3clP7BvfXj+zq7YypJoRu2Tc0wdPQDbwES2wh3nYtmbiFA4BrOuTaRDHb
	mTxavrRxD9eF+WuQ47oeISAEw3TuJiGWHG4FA07vGJC6te1hWkbDYKIEWHTjd+qWUcJF8pNkQ0/
	3txVKdyiIL8ngQkiku8RO92sbXKpxKZQZzBHTUb8IWkeOkShgghXWbHYUqyjxxcVm+PM99UoJeV
	jS776mwK6B2bkQbQB8I+YnNRRjWKaxaAmQjmJYT+/YaMVzNzhMfmi3Wq2FBZ5wp9sCpZ2MpIZR2
	SJ5sSweeXHNtUnClSV965kj3b5KlCVjPzPtLktoanCHr5wvrFWvx8I6MrOAbpMYv+3X5hDD3ONt
	WN4ekB+kOKwlQ3zedS4ODyQnJi23pVZbSGrhOhrlNHVO8CtPKDuDnJSPZ+/jU3928QjJYfGX5ND
	cAM+Ptckm1QRg0Z6ViDvj6QfbzTzAB+mrLNJmg==
X-Received: by 2002:a05:6870:35d4:b0:48f:e24e:6b6b with SMTP id 586e51a60fabf-4a9078091d9mr8423766fac.62.1793718540455;
        Tue, 03 Nov 2026 07:09:00 -0800 (PST)
Received: from penguin.lxd ([2605:3f84:842:3300:216:3eff:fe58:9322])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-4a95d970b9bsm4730448fac.8.2026.11.03.07.08.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 07:08:59 -0800 (PST)
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
Subject: [PATCH] Documentation: admin-guide: Update workload tracing guide
Date: Tue,  3 Nov 2026 09:08:45 -0600
Message-Id: <20261103150845.13008-5-matthew.l.weber@gmail.com>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20261103150845.13008-1-matthew.l.weber@gmail.com>
References: <20261103150845.13008-1-matthew.l.weber@gmail.com>
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

Add the file to the Workload analysis MAINTAINERS entry.

Signed-off-by: Matthew Weber <matthew.l.weber@gmail.com>
---
 .../admin-guide/workload-tracing.rst          | 139 +++++++++++++++++-
 MAINTAINERS                                   |   1 +
 2 files changed, 133 insertions(+), 7 deletions(-)

diff --git a/Documentation/admin-guide/workload-tracing.rst b/Documentation/admin-guide/workload-tracing.rst
index 35963491b..241ee2258 100644
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
+:doc:`kernel-minimization` ("Counting kernel SLOC") for setup and scope. The
+reports list compiled files and DWARF-resolved functions/source lines, not
+execution. Compare full source paths as well as function names; repeated
+static names and inlining make names alone insufficient. An unobserved entry
+is a review candidate, not proof that its configuration can be removed.
+
 Conclusion
 ==========
 
@@ -597,10 +721,11 @@ information on the resources in use by workloads using strace.
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
+ * :doc:`Kernel minimization <kernel-minimization>`
diff --git a/MAINTAINERS b/MAINTAINERS
index 5beb8c43f..dc3d7e9a6 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -28159,6 +28159,7 @@ M:	Matthew Weber <matthew.l.weber@gmail.com>
 L:	linux-doc@vger.kernel.org
 S:	Maintained
 F:	Documentation/admin-guide/kernel-minimization.rst
+F:	Documentation/admin-guide/workload-tracing.rst
 
 WORKQUEUE
 M:	Tejun Heo <tj@kernel.org>
-- 
2.39.5

