Received: from mail-qk1-f175.google.com (mail-qk1-f175.google.com [209.85.222.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B4C1D27F728
	for <linux-doc@vger.kernel.org>; Mon,  6 Jul 2026 14:01:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783346463; cv=none; b=SePcm0c6JHOIFry7cDcgImw6DUWJWPHTsoZ/LEzaJYPVNrEyMnq/8S/cKxXJ6lOhf+zZyWW4DkNJNMSprE3H8qgzVTWtucVIZ0XpupfgXqYs/rHVYfH86I7nd5cg13Go7Mw2A5HwxjmXp02DFgRvBByiS3+JA88xJNqleGqQP7E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783346463; c=relaxed/simple;
	bh=EB9bl3+08DCr5hMRFP2x18GYsUrC/G2BROQXGL5I3fs=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=qT3OX3iNw+1HGRlOuneIcuHeH7aWEScpgSUGZBg/ylBLscEgNjhjNksyrV8LHQ48gdM7o56Ujn1/AuDyjyeNOcnMkQ7FcEyjZQArHYe+6jU79UlbHmsvm2LZBitm+yZp1xmlz9jYN9FnR2+ml6CABV8GYyc5hW9+DKQH8Uj9wlM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=Hj9BFTIG; arc=none smtp.client-ip=209.85.222.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="Hj9BFTIG"
Received: by mail-qk1-f175.google.com with SMTP id af79cd13be357-92e57a753f9so224407585a.2
        for <linux-doc@vger.kernel.org>; Mon, 06 Jul 2026 07:01:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1783346461; x=1783951261; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=EaKA4XfYRMSPlyfQmcR3Q5U3XM9OAtXE2SUzPnGXtCQ=;
        b=Hj9BFTIG+FcpOHC2MaDl6b9RzkHsb16JtMnXoOX2q+po2P+J9xBlYXQS87fnXfYYgj
         ZytbFWF+6XrNHTPxfN7JxwU4J43BFPQdeiVXtp+RMyS1Y0m7ivua53X+AHJFss4IsEKV
         l04YIbvWSSHtz6a2puRfIgxihIUSSRQ0vDQXqGzwGssp+SlRSbFPlGh6mcY/m12/PIk0
         OnS/TeeV9SCc2ibMU7PBq3uLEl6V9XVVXWD9yyQexGtFUpZP4SjbeTzngXjz6Rcm4TGu
         3QcOmsFkj+fburvkUQdM0bGM1AygRLZGSGJ93pqBHWVDYdgYvj6iIwPZJW7Xw44b0oT1
         LUJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783346461; x=1783951261;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=EaKA4XfYRMSPlyfQmcR3Q5U3XM9OAtXE2SUzPnGXtCQ=;
        b=tWCrM5yhzl9kFrKbatpux2w+L33e+zi8sFqIuMVeX/0qRMuQBuK0ujSCgFs/xIcRhg
         h/i1oXMcSG0prDBVjKHy4BSlp/nYc/+0CmeYosON2t5YI7nqlIYv6OPVXRC+gqDK1Oeh
         79rXPHjbLxNp/8OIjzG24fc/BFA8HwsY+o3v5tbY3WSuLJzhk7sdI9stFuqY5OIKS/xh
         M3qUcFtJCMK9rPDaExLs7oyXMDm1r3BO0Jg+YDa0lDv5QfhrFa8CFC7ZYsMQhQuv0hng
         Mzje3bhovd2JeyaGJFuTkiIoviSKGAQlIz9TOws1hYz8GKhd33oyyMo7qQtC1kPexE8X
         ebrw==
X-Gm-Message-State: AOJu0YxnY7bQSWnR5bj3pcNQVTN4C1W6d7JlF0JUZ4eUaQXlTNvnC+fB
	vj5kEt0lkmuZMbfQoGStNz9pLB6l54kOSptSpmZxsW3pv8/whMNiPZiP6pLFH6uivKw=
X-Gm-Gg: AfdE7cmBA+bl0WvWDgWn7S6EMLHv5zGvKOI7k9reGV7RCBgGodwb+vhKAdYyu6tRKTU
	BIcCmV9UrbP2DnSt3P+U8uhMI9m9r2jrrOw9OLFJcJYTjvL2g8OmjQWDiMQdEuoeOtQMY7aGhzV
	IwoJyanY6u9i+34NnfxaKXJn7JcbG8YJwebSMXjQ/fI85Jzt8tcV7ed8DU4c1GVmMDXHH4HTmOX
	/WYj/NHhLDZs8fzbwIGbN17JDjLPpV1VlKGbeuOSw3lM2c2py9Ion+TPxXfclA0fyw3jb3aKmX+
	VrsYQGh2agT6xtKQEsoaEaqgoMiItTPxvSpHAB/EROEjdrAliIUy3k7651wqqyw7dXJk77SBj16
	WHDXnQK2ZFhY/WzJJAQ7Dlj88QIEi3p5lc5TegMSYMYqz8MYA5zb1qh8baGb99DdqF3m9PZiD98
	65XBX9Rzs=
X-Received: by 2002:a05:620a:4014:b0:92e:5ef2:2c0d with SMTP id af79cd13be357-92ebb5af416mr91321085a.63.1783346436180;
        Mon, 06 Jul 2026 07:00:36 -0700 (PDT)
Received: from fedora ([172.56.218.236])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e90cce037sm918577385a.38.2026.07.06.07.00.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 07:00:35 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	tglx@kernel.org,
	peterz@infradead.org,
	luto@kernel.org,
	akpm@linux-foundation.org,
	feng.tang@linux.alibaba.com,
	pmladek@suse.com,
	lance.yang@linux.dev,
	marc.herbert@linux.intel.com,
	kees@kernel.org,
	leitao@debian.org,
	gourry@gourry.net,
	joel.granados@kernel.org,
	lirongqing@baidu.com,
	nathan@kernel.org,
	xur@google.com,
	lukas.bulwahn@redhat.com,
	ryan.roberts@arm.com
Subject: [PATCH v3 1/2] syscall_user_dispatch: Make it configurable in Kconfig
Date: Mon,  6 Jul 2026 10:00:18 -0400
Message-ID: <20260706140020.873735-2-gourry@gourry.net>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260706140020.873735-1-gourry@gourry.net>
References: <20260706140020.873735-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Syscall User Dispatch is presently built under CONFIG_GENERIC_SYSCALL
and cannot be disabled independently.

Add CONFIG_SYSCALL_USER_DISPATCH to make it an optional feature.

Signed-off-by: Gregory Price <gourry@gourry.net>
---
 arch/Kconfig                                  | 10 +++++++
 include/linux/entry-common.h                  | 11 +++-----
 include/linux/syscall_user_dispatch.h         | 28 +++++++++++++++++--
 include/linux/syscall_user_dispatch_types.h   |  2 +-
 kernel/entry/Makefile                         |  3 +-
 .../selftests/syscall_user_dispatch/config    |  2 +-
 6 files changed, 44 insertions(+), 12 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index fa7507ac8e13..0c01521c2f3f 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -114,6 +114,16 @@ config GENERIC_ENTRY
 	select GENERIC_IRQ_ENTRY
 	select GENERIC_SYSCALL
 
+config SYSCALL_USER_DISPATCH
+	bool "Syscall User Dispatch"
+	depends on GENERIC_ENTRY
+	default y
+	help
+	  Syscall User Dispatch lets a thread have its own system calls
+	  intercepted and redirected to a userspace signal handler based
+	  on a prctl() configured instruction pointer range.
+	  If unsure, say Y.
+
 config KPROBES
 	bool "Kprobes"
 	depends on HAVE_KPROBES
diff --git a/include/linux/entry-common.h b/include/linux/entry-common.h
index 416a3352261f..43afee3e1b29 100644
--- a/include/linux/entry-common.h
+++ b/include/linux/entry-common.h
@@ -2,6 +2,8 @@
 #ifndef __LINUX_ENTRYCOMMON_H
 #define __LINUX_ENTRYCOMMON_H
 
+#include <asm/entry-common.h>
+#include <asm/syscall.h>
 #include <linux/audit.h>
 #include <linux/irq-entry-common.h>
 #include <linux/livepatch.h>
@@ -9,9 +11,7 @@
 #include <linux/resume_user_mode.h>
 #include <linux/seccomp.h>
 #include <linux/sched.h>
-
-#include <asm/entry-common.h>
-#include <asm/syscall.h>
+#include <linux/syscall_user_dispatch.h>
 
 #ifndef _TIF_UPROBE
 # define _TIF_UPROBE			(0)
@@ -55,7 +55,6 @@ static __always_inline int arch_ptrace_report_syscall_entry(struct pt_regs *regs
 }
 #endif
 
-bool syscall_user_dispatch(struct pt_regs *regs);
 long trace_syscall_enter(struct pt_regs *regs, long syscall);
 void trace_syscall_exit(struct pt_regs *regs, long ret);
 
@@ -232,10 +231,8 @@ static __always_inline void syscall_exit_work(struct pt_regs *regs, unsigned lon
 	 * of these syscalls is unknown.
 	 */
 	if (work & SYSCALL_WORK_SYSCALL_USER_DISPATCH) {
-		if (unlikely(current->syscall_dispatch.on_dispatch)) {
-			current->syscall_dispatch.on_dispatch = false;
+		if (syscall_user_dispatch_clear_on_dispatch())
 			return;
-		}
 	}
 
 	audit_syscall_exit(regs);
diff --git a/include/linux/syscall_user_dispatch.h b/include/linux/syscall_user_dispatch.h
index 3858a6ffdd5c..3dd30f4b2799 100644
--- a/include/linux/syscall_user_dispatch.h
+++ b/include/linux/syscall_user_dispatch.h
@@ -6,9 +6,23 @@
 #define _SYSCALL_USER_DISPATCH_H
 
 #include <linux/thread_info.h>
+#include <linux/sched.h>
 #include <linux/syscall_user_dispatch_types.h>
 
-#ifdef CONFIG_GENERIC_ENTRY
+struct pt_regs;
+
+#ifdef CONFIG_SYSCALL_USER_DISPATCH
+
+bool syscall_user_dispatch(struct pt_regs *regs);
+
+static __always_inline bool syscall_user_dispatch_clear_on_dispatch(void)
+{
+	if (likely(!current->syscall_dispatch.on_dispatch))
+		return false;
+
+	current->syscall_dispatch.on_dispatch = false;
+	return true;
+}
 
 int set_syscall_user_dispatch(unsigned long mode, unsigned long offset,
 			      unsigned long len, char __user *selector);
@@ -24,6 +38,16 @@ int syscall_user_dispatch_set_config(struct task_struct *task, unsigned long siz
 
 #else
 
+static __always_inline bool syscall_user_dispatch(struct pt_regs *regs)
+{
+	return false;
+}
+
+static __always_inline bool syscall_user_dispatch_clear_on_dispatch(void)
+{
+	return false;
+}
+
 static inline int set_syscall_user_dispatch(unsigned long mode, unsigned long offset,
 					    unsigned long len, char __user *selector)
 {
@@ -46,6 +70,6 @@ static inline int syscall_user_dispatch_set_config(struct task_struct *task,
 	return -EINVAL;
 }
 
-#endif /* CONFIG_GENERIC_ENTRY */
+#endif /* CONFIG_SYSCALL_USER_DISPATCH */
 
 #endif /* _SYSCALL_USER_DISPATCH_H */
diff --git a/include/linux/syscall_user_dispatch_types.h b/include/linux/syscall_user_dispatch_types.h
index 3be36b06c7d7..c0bdd4f760d3 100644
--- a/include/linux/syscall_user_dispatch_types.h
+++ b/include/linux/syscall_user_dispatch_types.h
@@ -4,7 +4,7 @@
 
 #include <linux/types.h>
 
-#ifdef CONFIG_GENERIC_ENTRY
+#ifdef CONFIG_SYSCALL_USER_DISPATCH
 
 struct syscall_user_dispatch {
 	char __user	*selector;
diff --git a/kernel/entry/Makefile b/kernel/entry/Makefile
index 2333d70802e4..f220bae86b12 100644
--- a/kernel/entry/Makefile
+++ b/kernel/entry/Makefile
@@ -13,5 +13,6 @@ CFLAGS_REMOVE_common.o	 = -fstack-protector -fstack-protector-strong
 CFLAGS_common.o		+= -fno-stack-protector
 
 obj-$(CONFIG_GENERIC_IRQ_ENTRY) 	+= common.o
-obj-$(CONFIG_GENERIC_SYSCALL) 		+= syscall-common.o syscall_user_dispatch.o
+obj-$(CONFIG_GENERIC_SYSCALL) 		+= syscall-common.o
+obj-$(CONFIG_SYSCALL_USER_DISPATCH)	+= syscall_user_dispatch.o
 obj-$(CONFIG_VIRT_XFER_TO_GUEST_WORK)	+= virt.o
diff --git a/tools/testing/selftests/syscall_user_dispatch/config b/tools/testing/selftests/syscall_user_dispatch/config
index 039e303e59d7..22c4dfe167ca 100644
--- a/tools/testing/selftests/syscall_user_dispatch/config
+++ b/tools/testing/selftests/syscall_user_dispatch/config
@@ -1 +1 @@
-CONFIG_GENERIC_ENTRY=y
+CONFIG_SYSCALL_USER_DISPATCH=y
-- 
2.54.0

