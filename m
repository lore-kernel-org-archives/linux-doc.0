Return-Path: <SRS0=92oT=43=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_GIT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 54601C3F2D0
	for <linux-doc@archiver.kernel.org>; Tue, 10 Mar 2020 16:37:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 283B7222C4
	for <linux-doc@archiver.kernel.org>; Tue, 10 Mar 2020 16:37:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726442AbgCJQhc (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 10 Mar 2020 12:37:32 -0400
Received: from youngberry.canonical.com ([91.189.89.112]:49529 "EHLO
        youngberry.canonical.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726307AbgCJQhb (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 10 Mar 2020 12:37:31 -0400
Received: from mail-wr1-f70.google.com ([209.85.221.70])
        by youngberry.canonical.com with esmtps (TLS1.2:ECDHE_RSA_AES_128_GCM_SHA256:128)
        (Exim 4.86_2)
        (envelope-from <gpiccoli@canonical.com>)
        id 1jBhsn-0005o3-1Q
        for linux-doc@vger.kernel.org; Tue, 10 Mar 2020 16:37:29 +0000
Received: by mail-wr1-f70.google.com with SMTP id o9so7042988wrw.14
        for <linux-doc@vger.kernel.org>; Tue, 10 Mar 2020 09:37:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=4/1vSfCnxZe+ZRJl0Ahymr08X57sUM0OfEyVYbuW7lY=;
        b=KK3SGOWEo+Hf7snJ1J515VFvB1mwFVjLof2DP49ozdFHw472Ygfk2rAFD0+LGpOOHu
         PeRAqjX1etujNIJEZuK/I4nSt+WQ4a5+6sbZr19YywXyMDvdhvUCiwbiDI4PLHcfK/6+
         hrR+PnDqpBwo3HVDE3G3hvCOyYhQSK6255qawyj0LwL0N2If0OD/LmNh4aZxEUdJ7LUT
         VOLBxuWlV0QRL55q+GSe7tUHbj9buL9Rk+knRe90IynHbrRlNvTbW8GERAHN/m+JULQF
         QPX2tvKatGeAYubyFUZ3Qp1E3aSHEA5qwISzxWUrhwPH9g3aSUWqT3BNTA99hG7C5NmE
         TFcw==
X-Gm-Message-State: ANhLgQ3EaHJZdy9otxlchnm0/l44BysCJcDXAbaPMN5iNFq2dkGapxNX
        FT77uL71TGv38dVkowIuAaXAdNzlScFdt2Tneqxx2DpIhxGMWLFdccX3819kIktnc1Nnwc7R7sq
        iwQW2DP6jE+JJX7SeJ2XtJADSEPyzTsN1mpEzUQ==
X-Received: by 2002:adf:f7c9:: with SMTP id a9mr28531578wrq.225.1583858248027;
        Tue, 10 Mar 2020 09:37:28 -0700 (PDT)
X-Google-Smtp-Source: ADFU+vsenMx5R3gesM6WKVR+3LK//AB0rndmi/X6XKcabuYn6bg5a7aa2J/R87Bl3uSkvuxOM29O6w==
X-Received: by 2002:adf:f7c9:: with SMTP id a9mr28531555wrq.225.1583858247642;
        Tue, 10 Mar 2020 09:37:27 -0700 (PDT)
Received: from localhost (189-47-87-73.dsl.telesp.net.br. [189.47.87.73])
        by smtp.gmail.com with ESMTPSA id v20sm15458777wrv.17.2020.03.10.09.37.26
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 10 Mar 2020 09:37:26 -0700 (PDT)
From:   "Guilherme G. Piccoli" <gpiccoli@canonical.com>
To:     linux-kernel@vger.kernel.org
Cc:     linux-doc@vger.kernel.org, mcgrof@kernel.org,
        keescook@chromium.org, yzaikin@google.com, tglx@linutronix.de,
        akpm@linux-foundation.org, gpiccoli@canonical.com,
        kernel@gpiccoli.net
Subject: [PATCH] panic: Add sysctl/cmdline to dump all CPUs backtraces on oops event
Date:   Tue, 10 Mar 2020 13:37:00 -0300
Message-Id: <20200310163700.19186-1-gpiccoli@canonical.com>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Usually when kernel reach an oops condition, it's a point of no return;
in case not enough debug information is available in the kernel splat,
one of the last resorts would be to collect a kernel crash dump and
analyze it. The problem with this approach is that in order to collect
the dump, a panic is required (to kexec-load the crash kernel). When
in an environment of multiple virtual machines, users may prefer to
try living with the oops, at least until being able to properly
shutdown their VMs / finish their important tasks.

This patch implements a way to collect a bit more debug details when an
oops event is reached, by printing all the CPUs backtraces through the
usage of NMIs (on architectures that support that). The sysctl/kernel
parameter added (and documented) here was called "oops_all_cpu_backtrace"
and when set will (as the name suggests) dump all CPUs backtraces.

Far from ideal, this may be the last option though for users that for
some reason cannot panic on oops. Most of times oopses are clear enough
to indicate the kernel portion that must be investigated, but in virtual
environments it's possible to observe hypervisor/KVM issues that could
lead to oopses shown in other guests CPUs (like virtual APIC crashes).
This patch hence aims to help debug such complex issues without
resorting to kdump.

Signed-off-by: Guilherme G. Piccoli <gpiccoli@canonical.com>
---


As a P.S. note, my choice to put the backtrace dump in the end of
oops_enter() was from previous experience (in which I used this
approach in a kprobes to collect more data on oops), but I'd
gladly accept suggestion in case there's a better place to dump
this. Thanks in advance for the reviews!
Cheers,

Guilherme


 .../admin-guide/kernel-parameters.txt         |  8 +++++++
 Documentation/admin-guide/sysctl/kernel.rst   | 15 +++++++++++++
 include/linux/kernel.h                        |  6 ++++++
 kernel/panic.c                                | 21 +++++++++++++++++++
 kernel/sysctl.c                               | 11 ++++++++++
 5 files changed, 61 insertions(+)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 4c6595b5f6c8..888b1fab3f6e 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -3333,6 +3333,14 @@
 			This will also cause panics on machine check exceptions.
 			Useful together with panic=30 to trigger a reboot.
 
+	oops_all_cpu_backtrace=
+			[KNL] Should kernel generates backtraces on all cpus
+			when oops occurs - this should be a last measure resort
+			in case	a kdump cannot be collected, for example.
+			Defaults to 0 and can be controlled by the sysctl
+			kernel.oops_all_cpu_backtrace.
+			Format: <integer>
+
 	page_alloc.shuffle=
 			[KNL] Boolean flag to control whether the page allocator
 			should randomize its free lists. The randomization may
diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index 218c717c1354..460112c3f656 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -57,6 +57,7 @@ show up in /proc/sys/kernel:
 - msgmnb
 - msgmni
 - nmi_watchdog
+- oops_all_cpu_backtrace
 - osrelease
 - ostype
 - overflowgid
@@ -573,6 +574,20 @@ numa_balancing_scan_size_mb is how many megabytes worth of pages are
 scanned for a given scan.
 
 
+oops_all_cpu_backtrace:
+================
+
+Determines if kernel should NMI all CPUs to dump their backtraces when
+an oops event occurs. It should be used as a last resort in case a panic
+cannot be triggered (to protect VMs running, for example) or kdump can't
+be collected. This file shows up if CONFIG_SMP is enabled.
+
+0: Won't show all CPUs backtraces when an oops is detected.
+This is the default behavior.
+
+1: Will NMI all CPUs and dump their backtraces when an oops is detected.
+
+
 osrelease, ostype & version:
 ============================
 
diff --git a/include/linux/kernel.h b/include/linux/kernel.h
index 0d9db2a14f44..6cd00257b572 100644
--- a/include/linux/kernel.h
+++ b/include/linux/kernel.h
@@ -513,6 +513,12 @@ static inline u32 int_sqrt64(u64 x)
 }
 #endif
 
+#ifdef CONFIG_SMP
+extern unsigned int sysctl_oops_all_cpu_backtrace;
+#else
+#define sysctl_oops_all_cpu_backtrace 0
+#endif /* CONFIG_SMP */
+
 extern void bust_spinlocks(int yes);
 extern int oops_in_progress;		/* If set, an oops, panic(), BUG() or die() is in progress */
 extern int panic_timeout;
diff --git a/kernel/panic.c b/kernel/panic.c
index b69ee9e76cb2..73c340418575 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -36,6 +36,24 @@
 #define PANIC_TIMER_STEP 100
 #define PANIC_BLINK_SPD 18
 
+#ifdef CONFIG_SMP
+/*
+ * Should we dump all CPUs backtraces in an oops event?
+ * Defaults to 0, can be changed either via cmdline or sysctl.
+ */
+unsigned int __read_mostly sysctl_oops_all_cpu_backtrace;
+
+static int __init oops_backtrace_setup(char *str)
+{
+	int rc = kstrtouint(str, 0, &sysctl_oops_all_cpu_backtrace);
+
+	if (rc)
+		return rc;
+	return 1;
+}
+__setup("oops_all_cpu_backtrace=", oops_backtrace_setup);
+#endif /* CONFIG_SMP */
+
 int panic_on_oops = CONFIG_PANIC_ON_OOPS_VALUE;
 static unsigned long tainted_mask =
 	IS_ENABLED(CONFIG_GCC_PLUGIN_RANDSTRUCT) ? (1 << TAINT_RANDSTRUCT) : 0;
@@ -515,6 +533,9 @@ void oops_enter(void)
 	/* can't trust the integrity of the kernel anymore: */
 	debug_locks_off();
 	do_oops_enter_exit();
+
+	if (sysctl_oops_all_cpu_backtrace)
+		trigger_all_cpu_backtrace();
 }
 
 /*
diff --git a/kernel/sysctl.c b/kernel/sysctl.c
index 238f268de486..1ac31d9d5b7e 100644
--- a/kernel/sysctl.c
+++ b/kernel/sysctl.c
@@ -813,6 +813,17 @@ static struct ctl_table kern_table[] = {
 		.proc_handler	= proc_dointvec,
 	},
 #endif
+#ifdef CONFIG_SMP
+	{
+		.procname	= "oops_all_cpu_backtrace",
+		.data		= &sysctl_oops_all_cpu_backtrace,
+		.maxlen		= sizeof(int),
+		.mode		= 0644,
+		.proc_handler	= proc_dointvec_minmax,
+		.extra1		= SYSCTL_ZERO,
+		.extra2		= SYSCTL_ONE,
+	},
+#endif /* CONFIG_SMP */
 	{
 		.procname	= "pid_max",
 		.data		= &pid_max,
-- 
2.25.1

