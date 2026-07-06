Received: from mail-qv1-f48.google.com (mail-qv1-f48.google.com [209.85.219.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 221E627F728
	for <linux-doc@vger.kernel.org>; Mon,  6 Jul 2026 14:00:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783346447; cv=none; b=KFzMMPz0KoruHJmudgn+8IsYnM3pIzLRIXWfKcAzuwg69IkZIKPNRx26ifOyL8D45XiIRDhblX1dm5fgynVaq5XsUgzVFGwt9rYz2snslZVyMYPtvapeO/GsdKM+r2UX+ceA+IdYagnBr9KWZvn/OO7TCB1MiWLIjtoeKjBB8vI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783346447; c=relaxed/simple;
	bh=4IRDgwg2iBiG6MDag061l/nMr9fqUoFWDNfCXhd2m6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MMOXTj2B/yL2/WTyoeKkjU3aPR0lKPK2wNx05OM5u1SeK3+4vBmfoQsc+pOv0UAWCpVl+YtrAOnc2eYjh/foRqr2HbhegNEHvb7cwDWWySFR8Mpu3rV6i5s64qbZ/H6J3ID2unxkc9pUjyW6vNkSYBvgRjjvPNHDujiNhFNwhuE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=br0OcACH; arc=none smtp.client-ip=209.85.219.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="br0OcACH"
Received: by mail-qv1-f48.google.com with SMTP id 6a1803df08f44-8eeadbc5e21so21327076d6.3
        for <linux-doc@vger.kernel.org>; Mon, 06 Jul 2026 07:00:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1783346445; x=1783951245; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=AYoUTJE6BZs101tPJMFqBcaouNziXouVXgG/iQU0gts=;
        b=br0OcACHBjgLi8xR+Ko10YEALQ+v66oyy7pi5w6TgrQqcgIDuyGsqZqkHDEqZh5owj
         j3DJwasFU3M6OIkD5uIffDrMvrCRqiwz5IE86L6FTi9lKLVaO7NvUlSO8h/OIw7PUuHJ
         r7DojADf2iDzAbDFMPvmAkt1rNQd+nLG+raVjb3cUwWiQtnsK5rQunI2qOWwZPyohJOr
         8sxYC7ssS+vUPFQneSwaMkkR6GN2SFjjMKX43cyQl2RP3ZlnPe2Uo9hVXB1PhA1tBhmp
         MHzBYU/kR1UIj3fUMTaRnXs16OCXsXkFGagYF3F4N8Ac/Wm/u9j2SXQSj0onANiE6ev8
         Q4QA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783346445; x=1783951245;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=AYoUTJE6BZs101tPJMFqBcaouNziXouVXgG/iQU0gts=;
        b=TWE0idOGiRwu//qWAZTw1l7AyHbZDNYm3aOBk0Zyu8J3PW0+C1icLdhb/qp9yvpJ3m
         SCwP5YJS7lIbw7jflv4aF6GIRgZRJUc7E/7kBfgWDMCjj4/bJDmYO3iRf4tBWyRU9VQy
         zDurenELFyRlneGLwoRJA+1Jq3G32BhCgfS7kI7h7/vjJNQAI4RVERFOVwIEPabjCXXm
         9HXZsGDJjPMzLrZt6jhQVZ+bPWtwtpWPNpeGy+E2hT7iqDY1Ih7PdwhHqoRnUv4wSxRz
         cFaXTiDxkNRo+EGtPraVWb8uNAlKjfbqfphthMU76X3IjOps+MBw3zBJuxUJhkfQkizP
         zm0Q==
X-Gm-Message-State: AOJu0YzyQy8kfXNfJNiCDy+937my6gkXIGS74H3jThliayp7h82Q3HiU
	/H82F0/POO1M9fdSVcRQNafOxk9usj9vw9bh5bHmL9fVzLt5GVhvcyCzK09cbhMw2FtAn7F/FKO
	YMqlb
X-Gm-Gg: AfdE7ck+pSgyQLia8/MHzQx1KTnOnu2aZy8UH9esX8pW0FXrq8hidIHXnSdpVWezJFn
	Z1tquR+BZ0Vl0b0yTWdcBrirezRH2/skTbWp2URBokjLGLAskrnZ3aKhYL+dmFtvC9Cb43yYOfF
	DCWdHivhV1EZoWQnpObIjUHRHv4Tg8cgnKio/hi7aC8ZSXdd+wY98a1+GjIXlVpzS8+435MPFuY
	R0Pdy+kHKVgf0zG9I9T8mk5o/gCvtYSq0KOEBl2G6XZxtu9iT7hItqp9xgwqSOx4A9/PvJ1o5dM
	u/hroaTmUqgCpCZjdd5ZdUbv1zKOUwth2tVrsE+MDLlt8qKDmXRKes/jUP2suvmBVetA6WqNgH4
	rnzvxiRIq7YlotTbt+06INutujgEylHD2MaOVwXVvqViO0X1+ea0/CL0+Dy4/ZxpRY6D2AxxJU8
	1IAGg2Bd4=
X-Received: by 2002:a05:620a:4588:b0:915:fad5:90a5 with SMTP id af79cd13be357-92ebb60ca7dmr93463485a.54.1783346440130;
        Mon, 06 Jul 2026 07:00:40 -0700 (PDT)
Received: from fedora ([172.56.218.236])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-92e90cce037sm918577385a.38.2026.07.06.07.00.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 06 Jul 2026 07:00:39 -0700 (PDT)
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
Subject: [PATCH v3 2/2] syscall_user_dispatch: add kernel.syscall_user_dispatch sysctl
Date: Mon,  6 Jul 2026 10:00:19 -0400
Message-ID: <20260706140020.873735-3-gourry@gourry.net>
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

Add a matching sysctl to go with CONFIG_SYSCALL_USER_DISPATCH.

kernel.syscall_user_dispatch (default 1 - allow) controls whether
userspace may arm syscall user dispatch (both via prctl and ptrace).

Disarming is always permitted - same semantics as comparable knobs.

Disabling while a task has armed syscall user dispatch does not
cause it to become inactive - instead it remains active until the
user attempts to disable/re-enable via prctl or ptrace.  On the
next attempt to re-enable, the prctl/ptrace call fails gracefully.

The alternative would cause programs translating non-linux syscalls
to interpret those syscalls as linux syscalls, resulting in undefined
userland behavior.

Signed-off-by: Gregory Price <gourry@gourry.net>
---
 Documentation/admin-guide/sysctl/kernel.rst | 17 +++++++++
 kernel/entry/syscall_user_dispatch.c        | 38 +++++++++++++++++----
 2 files changed, 48 insertions(+), 7 deletions(-)

diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index c6994e55d141..b6328cd0f43e 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -1402,6 +1402,23 @@ Note that if you change this from 0 to 1, already created segments
 without users and with a dead originative process will be destroyed.
 
 
+syscall_user_dispatch
+=====================
+
+Controls whether userspace may arm Syscall User Dispatch via
+``prctl(PR_SET_SYSCALL_USER_DISPATCH, ...)`` or the
+``PTRACE_SET_SYSCALL_USER_DISPATCH_CONFIG`` ptrace request:
+
+  ==  ===================================================================
+  0   Arming syscall user dispatch is denied with ``-EPERM``.  Tasks that
+      already armed it keep it, and disabling it is always permitted.
+  1   (default) Arming syscall user dispatch is permitted.
+  ==  ===================================================================
+
+Only present when the kernel is built with ``CONFIG_SYSCALL_USER_DISPATCH``
+and ``CONFIG_PROC_SYSCTL``.
+
+
 sysctl_writes_strict
 ====================
 
diff --git a/kernel/entry/syscall_user_dispatch.c b/kernel/entry/syscall_user_dispatch.c
index d89dffcc2d64..310c72e6988d 100644
--- a/kernel/entry/syscall_user_dispatch.c
+++ b/kernel/entry/syscall_user_dispatch.c
@@ -3,19 +3,20 @@
  * Copyright (C) 2020 Collabora Ltd.
  */
 
+#include <asm/syscall.h>
+#include <linux/elf.h>
 #include <linux/entry-common.h>
-#include <linux/sched.h>
 #include <linux/prctl.h>
 #include <linux/ptrace.h>
-#include <linux/syscall_user_dispatch.h>
-#include <linux/uaccess.h>
-#include <linux/signal.h>
-#include <linux/elf.h>
-
+#include <linux/sched.h>
 #include <linux/sched/signal.h>
 #include <linux/sched/task_stack.h>
+#include <linux/signal.h>
+#include <linux/syscall_user_dispatch.h>
+#include <linux/sysctl.h>
+#include <linux/uaccess.h>
 
-#include <asm/syscall.h>
+static bool syscall_user_dispatch_allowed __read_mostly = true;
 
 static void trigger_sigsys(struct pt_regs *regs)
 {
@@ -102,6 +103,10 @@ static int task_set_syscall_user_dispatch(struct task_struct *task, unsigned lon
 		return -EINVAL;
 	}
 
+	/* Arming can be denied at runtime via sysctl, disarming is allowed */
+	if (mode != PR_SYS_DISPATCH_OFF && !syscall_user_dispatch_allowed)
+		return -EPERM;
+
 	/*
 	 * access_ok() will clear memory tags for tagged addresses
 	 * if current has memory tagging enabled.
@@ -172,3 +177,22 @@ int syscall_user_dispatch_set_config(struct task_struct *task, unsigned long siz
 	return task_set_syscall_user_dispatch(task, cfg.mode, cfg.offset, cfg.len,
 					      (char __user *)(uintptr_t)cfg.selector);
 }
+
+#ifdef CONFIG_PROC_SYSCTL
+static const struct ctl_table syscall_user_dispatch_sysctls[] = {
+	{
+		.procname	= "syscall_user_dispatch",
+		.data		= &syscall_user_dispatch_allowed,
+		.maxlen		= sizeof(syscall_user_dispatch_allowed),
+		.mode		= 0644,
+		.proc_handler	= proc_dobool,
+	},
+};
+
+static int __init syscall_user_dispatch_sysctl_init(void)
+{
+	register_sysctl_init("kernel", syscall_user_dispatch_sysctls);
+	return 0;
+}
+late_initcall(syscall_user_dispatch_sysctl_init);
+#endif /* CONFIG_PROC_SYSCTL */
-- 
2.54.0

