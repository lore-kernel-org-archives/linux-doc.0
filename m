Received: from mail-qt1-f177.google.com (mail-qt1-f177.google.com [209.85.160.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61F463749E2
	for <linux-doc@vger.kernel.org>; Sat,  4 Jul 2026 01:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.177
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783130360; cv=none; b=YkT3P8du65FFEqjTzGGeSGOZ5c84LRRp9I2KgWEgDLOYHyU2Y+ZF3KLy3jU8SLIh2uXFv81zgK0AoOO6o1OpHVXKjovv2lGulUYpBN5R0BRpoBU1dZ/4v8UZTeuQIC6NMFCyOu9Zrz3vrpurF5DrdJYs8IkcQasDA4hMrZURAog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783130360; c=relaxed/simple;
	bh=BwQmx6CoiHuwnmZ+mhMBtmicX8Fogd6hre8OiRCSIcw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=DcnnD85eEFg3Xh83C0lglp1KsiexVGg5LXPTQ2GFv9mIwqwFSVfRFsO+f1sIuf86Zoej5V8hRKNFDbPM8CqcbxRb3D7oCKS88VdTVnBcLeBlzK7tI7LaqKu2WAsIcorWZKZXzm19CHdJHbceLruMDkxdPWPSb/21cViyTp3R2RE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=uiK0WMgm; arc=none smtp.client-ip=209.85.160.177
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="uiK0WMgm"
Received: by mail-qt1-f177.google.com with SMTP id d75a77b69052e-51bfb91795eso6283071cf.1
        for <linux-doc@vger.kernel.org>; Fri, 03 Jul 2026 18:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1783130357; x=1783735157; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=F7z8ZPd7LjzSSsP2/vMsYWIUJXhBId8FemA5cFDWEsQ=;
        b=uiK0WMgmlyN9pOeIaAUQbBEpHRxiLGLqL7JOOofRDGs8EL/EwGQcJ5774YmqWmwBTO
         GdzFvIveE1ucDwTfTFkThD6tXkEmXHkI+XeS5OKzjfLpzMiyklVhCwPC+BnV8H5LO2dG
         GygrYKs51mecniP4AE78TZ6ne7j3W0XfBDDqrJaWqCI2fvLX6sCu3hTJ7frBVW2pAkLr
         y2fQmYLBh32rJzEymhn7UQfshz6BnsbXP44P1aP/cBtt6+EG0z52YBASKplmOqHFIMAD
         KXajiHZA/HQ+kNkIMY3FxgvXf7oGAuhvyLLylkWAUP0BjFdditD0shq8rOBssbFNFWbx
         h5rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783130357; x=1783735157;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=F7z8ZPd7LjzSSsP2/vMsYWIUJXhBId8FemA5cFDWEsQ=;
        b=EE8YdUAsnHIi/uJWelAiCk/PG4IfTKraEs+SseV9dS0p19y73Zcuu60e2mjzpuRCMC
         AdWcMiir8gWtIHmPj8yXzp9xv9gjnqbwm1d5EIM938fYJMyHFQvThIC+N8cozBDxmaoS
         3EVFbwfnahqyZbfntKTVTl7Hh2rBIzKV0F8DAyP6EILF6tjsIf3lrCqBR9B6MJ9cxOEh
         BYX09QEtasG0lOkeiRjgrJPkY7S1fUkl8wr/hErgWY2rl+TxsX/NlNFnuCcElhholBGg
         +HBrGdUb+W3KPtb07TUWz4E3i2DmyoGSHmqr7VoWUVzs04687BBT9np/NkrFlF0D2ZVL
         dnKA==
X-Gm-Message-State: AOJu0YwzGWbJbMPXjOOqmAl3OD0tALxfbtrfvX2HokkTIlj4h7S6C4+b
	oRSSNCaejMnYwx1iTc91CCvSEl/+FTeANTfnRCtKmUEeaiOBbZEnt1wZANWEROajILw=
X-Gm-Gg: AfdE7clhyzIGg/rk6wHOugy+am+7ZZVjlS80vTGSpgRFYVCK5gdaC9uVDJS/2ES8hfY
	cO+rPXOHoKCkfb4eXsRamRWyXa9vnHmWcO4HWQapPQac1S81+b03Cnf51XmAh1eF/TAmjHXjL68
	IM88FmPpWK8PPVEDLcSRR3YmrGj77uBd4YpnC+qNO/kHYot2zzIALE2P00uwjitO3VE3ya5jwMy
	ijPS1uGhZiq2k/EqVi69Iz9JfPfgZXOb01mxbHTKhOX26hT5Ow6O+ioGxJTuVTkb+A4Fdpff3od
	O8RdNqYiHKnw/Nldqn/+0DzfeRpmfJsRkSaTPqRBsntrIUqJe3LIWDsjZXjwniYdQT4pnL2U8pC
	ALTyLRVa0PejueD11ACj77WHv/llTQW60PrDrYHNzvv355rpIzyaWBDrgvSQ4/saUtck8OMd/xA
	pK3fp0NoqRoVBdSkhDFnHvBtEN9ms8uIABlImgD4Tt1lM=
X-Received: by 2002:ac8:5f89:0:b0:51c:25da:903e with SMTP id d75a77b69052e-51c4c2f6132mr25525331cf.58.1783130357348;
        Fri, 03 Jul 2026 18:59:17 -0700 (PDT)
Received: from fedora (50-32-2-77.vng01.dlls.pa.frontiernet.net. [50.32.2.77])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51c41e084e8sm28109311cf.28.2026.07.03.18.59.15
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 18:59:17 -0700 (PDT)
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
Subject: [PATCH v2 2/2] syscall_user_dispatch: add kernel.syscall_user_dispatch sysctl
Date: Fri,  3 Jul 2026 21:58:59 -0400
Message-ID: <20260704015859.536580-3-gourry@gourry.net>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260704015859.536580-1-gourry@gourry.net>
References: <20260704015859.536580-1-gourry@gourry.net>
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
 Documentation/admin-guide/sysctl/kernel.rst | 16 ++++++++++++
 kernel/entry/syscall_user_dispatch.c        | 28 +++++++++++++++++++++
 2 files changed, 44 insertions(+)

diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index c6994e55d141..46e418e686c2 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -1402,6 +1402,22 @@ Note that if you change this from 0 to 1, already created segments
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
+Only present when the kernel is built with ``CONFIG_SYSCALL_USER_DISPATCH``.
+
+
 sysctl_writes_strict
 ====================
 
diff --git a/kernel/entry/syscall_user_dispatch.c b/kernel/entry/syscall_user_dispatch.c
index d89dffcc2d64..1c39ccd733f5 100644
--- a/kernel/entry/syscall_user_dispatch.c
+++ b/kernel/entry/syscall_user_dispatch.c
@@ -11,12 +11,15 @@
 #include <linux/uaccess.h>
 #include <linux/signal.h>
 #include <linux/elf.h>
+#include <linux/sysctl.h>
 
 #include <linux/sched/signal.h>
 #include <linux/sched/task_stack.h>
 
 #include <asm/syscall.h>
 
+static int syscall_user_dispatch_allowed __read_mostly = 1;
+
 static void trigger_sigsys(struct pt_regs *regs)
 {
 	struct kernel_siginfo info;
@@ -102,6 +105,10 @@ static int task_set_syscall_user_dispatch(struct task_struct *task, unsigned lon
 		return -EINVAL;
 	}
 
+	/* Arming can be denied at runtime via sysctl, disarming is allowed */
+	if (mode != PR_SYS_DISPATCH_OFF && !syscall_user_dispatch_allowed)
+		return -EPERM;
+
 	/*
 	 * access_ok() will clear memory tags for tagged addresses
 	 * if current has memory tagging enabled.
@@ -172,3 +179,24 @@ int syscall_user_dispatch_set_config(struct task_struct *task, unsigned long siz
 	return task_set_syscall_user_dispatch(task, cfg.mode, cfg.offset, cfg.len,
 					      (char __user *)(uintptr_t)cfg.selector);
 }
+
+#ifdef CONFIG_SYSCTL
+static const struct ctl_table syscall_user_dispatch_sysctls[] = {
+	{
+		.procname	= "syscall_user_dispatch",
+		.data		= &syscall_user_dispatch_allowed,
+		.maxlen		= sizeof(syscall_user_dispatch_allowed),
+		.mode		= 0644,
+		.proc_handler	= proc_dointvec_minmax,
+		.extra1		= SYSCTL_ZERO,
+		.extra2		= SYSCTL_ONE,
+	},
+};
+
+static int __init syscall_user_dispatch_sysctl_init(void)
+{
+	register_sysctl_init("kernel", syscall_user_dispatch_sysctls);
+	return 0;
+}
+late_initcall(syscall_user_dispatch_sysctl_init);
+#endif /* CONFIG_SYSCTL */
-- 
2.54.0

