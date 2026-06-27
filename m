Received: from mail-qv1-f51.google.com (mail-qv1-f51.google.com [209.85.219.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B7B2C1C860A
	for <linux-doc@vger.kernel.org>; Sat, 27 Jun 2026 20:56:05 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782593768; cv=none; b=R8h0oeHV9XoSFLtB9iYi0O9v03H3W890bJOOBgcFKc/v3ZFaZ7Y88oS86/BfFeob0kwhdaLlACEMEkP6oikx7NSqh2Qh/ZGfwyZmOtWVcC7nBrOgZXsORNdgZjuW3ueJx2/bz5CSafxfDGN4iY2AcCozDHlnSXMrsiHSiVIUWhM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782593768; c=relaxed/simple;
	bh=8G9FTDLCdDxMM5W0HpwbCdM6xzK8nY/RwixUATVbMl0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=BLUjgkyR27fmdLrTQzbPHHKGlkPkPNMjHESEbSsid6SrYJhQobV0Cb6AVX+60NxQoKFUp962Y5MHSqN0DP/PBjKOZvnkUmvBv8It3QkSdetEdG3yawkytao/pVgkSXOKGebg6OoCcAH3Y+3xOjzFf5rnjpLhoMw0+hDlqFtE9wM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=qKy7Kuyj; arc=none smtp.client-ip=209.85.219.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="qKy7Kuyj"
Received: by mail-qv1-f51.google.com with SMTP id 6a1803df08f44-8eefd0c5f59so1367746d6.3
        for <linux-doc@vger.kernel.org>; Sat, 27 Jun 2026 13:56:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1782593765; x=1783198565; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=LJmiPaWE1oBb3px3lgYj/2H7Qq4DS6Rodsmex8FgQuw=;
        b=qKy7KuyjZ3FOq8Uj6wGfDw45ar0YEkM5neZtUttNRvR09xCEMZ5ahSSC3JcMR4bd+K
         j9l35OMRC8tb1Cw5WwMQ8WrK3yMXM/0kwgXm3Tf3bnUEbkZ4sK2Ox0+QqWjb62MpQTgS
         lnVc64Nt9iE1vz4LfmxqlTogM19Ne+KG4cuVnvSCNEx0/bepBCeo2AGJ54fKs8DMF1Qq
         TvoPANBFSn7z8rAzy/3T1w+fy9cB6AalgxWGmbBNgYtrYKkpV1bop1rOTHJHgDo30vZI
         xjFNqvyberQVJ4fsHdcYhYQiE+tuDnbydO++XEkhioOv++yORx7zVm3NB5TptK3LBTlc
         YzFA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782593765; x=1783198565;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=LJmiPaWE1oBb3px3lgYj/2H7Qq4DS6Rodsmex8FgQuw=;
        b=F4jxM9/nj/iEqXmzs6XXG/6pDgwgyKq48B/VsZPaDPy/oSzyg7Udz8TBGSZb2KxM9T
         b+u9H7H/aJAMJZfo86KT/AiUBVH1EBZvtp27aVX3gN9g+lZbjgSDTKQJ+PmzB6djRrdE
         P11QXZoe0hWvOfvOPIeqPiGc/oo7FQA9xmsM+S2fdPCtpBReU53raEGqx4WmHY2935we
         tHVOFW66MsMTH9M7G2KVLS22kKgSTCjxiGSmYnm+lyRl2Hp+jbVE8cMpRTSz7hsjt/9S
         A3fmkX5oZEJg7eh5IkvPmq9Z4O5LV1d+twiBuQeLndOc4UlBTO+wsbAvxROhmYmlKsZ8
         L0BA==
X-Gm-Message-State: AOJu0Yw8HtMXBFX6BeZRKA4oszb0mq6eZbcWsfklVniZa4ZDyes4f0FE
	W50asW1Q6c8rEUEq0/mpmhgJUkKG62zk+Mrw8dfU9SnDnBJCaCWJGyBHADrSQnwyUsc=
X-Gm-Gg: AfdE7cnFdkMUarxT7+R8v6cLijvuwB6ZTJz06jkBftbKyyMsOmQGsImCBKQk07JcXcA
	i/r7/DBoVDQYyaRkBPQBJ4SmCqcBkPS9kJZKqQ2/fnwwA3VJkxubPhQonNne7YEUoYAoIdjU+ok
	WL1oTduc508y0Cpu0KjX39/8bgQ1wlYcTqtq0AN9g7ItkRjmblvZafKTtt/aJHCW+5Rs74A4uu1
	k11arWMsW3+hK4mxA+2pjGchcFyChQnesVH1ToRXu27WApwHYZlI1Ot6I2XFJ/k5KMyT1VP4r2q
	QUuG0u96xIyqumriE6gC2J304YZW5ptM2smjadmxHM/pT7HzJS2nLvzNE40gupNz7VTOc+dS8jj
	YeRrzu0amTQjP3d4DAXjcNcQ1epclXBo0d4CsrsOTrA0NYd9nJrdsdy2MWO34tnmtTR0/X+fmoL
	D63NHxijZ0kTsPAuENi3cYtBJW8fHto4EmOSLaMBtdXXH+8ncBRxVe/8HHolFWyJ7JA8XFSWjjw
	+Ycq2gjCSBx
X-Received: by 2002:a05:6214:21eb:b0:8ce:a005:3ea6 with SMTP id 6a1803df08f44-8e6da33b970mr200983256d6.22.1782593764787;
        Sat, 27 Jun 2026 13:56:04 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8df81cdec56sm265460836d6.32.2026.06.27.13.56.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 13:56:04 -0700 (PDT)
From: Gregory Price <gourry@gourry.net>
To: linux-kernel@vger.kernel.org
Cc: linux-doc@vger.kernel.org,
	kernel-team@meta.com,
	corbet@lwn.net,
	skhan@linuxfoundation.org,
	tglx@kernel.org,
	peterz@infradead.org,
	luto@kernel.org,
	akpm@linux-foundation.org,
	feng.tang@linux.alibaba.com,
	pmladek@suse.com,
	mhiramat@kernel.org,
	marc.herbert@linux.intel.com,
	joel.granados@kernel.org,
	gourry@gourry.net,
	lirongqing@baidu.com,
	kees@kernel.org,
	nathan@kernel.org,
	linusw@kernel.org,
	arnd@arndb.de,
	deller@gmx.de,
	jpoimboe@kernel.org,
	ruanjinjie@huawei.com,
	lukas.bulwahn@redhat.com,
	ryan.roberts@arm.com,
	ojeda@kernel.org
Subject: [PATCH 2/2] kernel/entry: add kernel.syscall_user_dispatch sysctl
Date: Sat, 27 Jun 2026 16:55:51 -0400
Message-ID: <20260627205551.769684-2-gourry@gourry.net>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260627205551.769684-1-gourry@gourry.net>
References: <20260627205551.769684-1-gourry@gourry.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a matching sysctl to go with CONFIG_SYSCALL_USER_DISPATCH.

kernel.syscall_user_dispatch (default 1) controls whether userspace
may arm SUD (both via prctl and ptrace).

Disarming is always permitted - same semantics as comparable knobs

Signed-off-by: Gregory Price <gourry@gourry.net>
---
 Documentation/admin-guide/sysctl/kernel.rst | 17 +++++++++++++
 kernel/entry/syscall_user_dispatch.c        | 28 +++++++++++++++++++++
 2 files changed, 45 insertions(+)

diff --git a/Documentation/admin-guide/sysctl/kernel.rst b/Documentation/admin-guide/sysctl/kernel.rst
index c6994e55d141..4c90caaf1e21 100644
--- a/Documentation/admin-guide/sysctl/kernel.rst
+++ b/Documentation/admin-guide/sysctl/kernel.rst
@@ -1402,6 +1402,23 @@ Note that if you change this from 0 to 1, already created segments
 without users and with a dead originative process will be destroyed.
 
 
+syscall_user_dispatch
+=====================
+
+Controls whether userspace may arm Syscall User Dispatch (SUD) via
+``prctl(PR_SET_SYSCALL_USER_DISPATCH, ...)`` or the
+``PTRACE_SET_SYSCALL_USER_DISPATCH_CONFIG`` ptrace request:
+
+  ==  ===================================================================
+  0   Arming SUD is denied with ``-EPERM``.  Tasks that already armed it
+      keep it, and disabling SUD (``PR_SYS_DISPATCH_OFF``) is always
+      permitted.
+  1   (default) Arming SUD is permitted.
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

