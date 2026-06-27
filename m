Received: from mail-qv1-f49.google.com (mail-qv1-f49.google.com [209.85.219.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C16891C860A
	for <linux-doc@vger.kernel.org>; Sat, 27 Jun 2026 20:56:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782593765; cv=none; b=n/qt1QpW0ff934t+VrIr0+3SKHlixTYJslq4A7B4DtjDAKVTuvVSVu202r2WUW/f4QDrviKCcAd7Ecw2RzHiKFUY4Hs4gsfmNYptfX1qBRPwErz1+RuyyJTRb2wd98626Or3z2YkGrGHu+AyDa34RAzQhYwMFxiWRoRnLHtp6qM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782593765; c=relaxed/simple;
	bh=9i425v2OLf77/7490P0ZuAEgbCG/7SCUKbPj/W+6wOg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=AdOqxm8LG2ePo22lTU1S6HIDPQbSrwqu8q7kOvZ9Yk5mS8NFELtDNYQdI1VExdeblGAlLQxV1fYz1CRiMTuLdH/0RbpzaNF52+kxNRrgYmyvIeHSOq6phyNJUEsBCL1G618GBcLLrHUpAhzjHsvNj2qjWhSbCPKzIjEVFLNKqoE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=R+DB8i/y; arc=none smtp.client-ip=209.85.219.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="R+DB8i/y"
Received: by mail-qv1-f49.google.com with SMTP id 6a1803df08f44-8eaa7b5e31eso6016886d6.0
        for <linux-doc@vger.kernel.org>; Sat, 27 Jun 2026 13:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1782593763; x=1783198563; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=nhsbipjzA5I+UfoW44RlcJRMPkJBr0UMfZzbOwMhg+U=;
        b=R+DB8i/yJbRBPA+kv7KrYOzmQTIRcRRO2CdA9hTJ1UHqahvnO4fvurJk7lSRWjYznp
         8EXa6+HkPJ28YmN9JCrREVRXsYc/0zX766OpWw1x4vAhkJk6fZdM7DctT7Mj6nGvmLzJ
         r0hG6lAuEyu99JV8q4BdxLq29zx8FV4yOg3EIzB/EDfp6cwXz5oP3ObvA1oaPtIGd/5k
         LPxdGk0zL0d6UufxEjC4IliWkMO8LjhqtYq9YHoHu0VBvC6sJHsN4x6WdvjTKbKeeDV1
         3BTYIuN9nTy+dKi769q8tN5P3de2g5hcwz2rvjGEheiMPWg3olVIzsc9cO/wrval/yjH
         VOjw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782593763; x=1783198563;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=nhsbipjzA5I+UfoW44RlcJRMPkJBr0UMfZzbOwMhg+U=;
        b=Tcol5DxZcrL4YyASRdprRY9Xc86NynvTf2pYle3+CUcYjtwCDB48dvZfLTy5MSfYch
         ZD+VwWIxALJZLpSGKV2FhWkvv0kkitdqlDJro+KenCELI54Bzy5uQGno3zL+3NW8QCeJ
         LJ9P5wkdx4IL9zY4Bb/iyjXG4fzSKyjVN7zIoQjQTMYk+pXgRHk8Yvsu8FMw6+Aj84J9
         PPESKotvZA9iEww6sLFHp+heN9hnEstab+mCKOyvvqX7gzZrrRmehTKnYRfwZhUAKpnn
         MSoUZ5opVwni9MmYvXvJn8KOCFRr1kkx7Gd5fZuANlIKNZw0q12z0ZznhrXs+FMBxCxl
         OBAQ==
X-Gm-Message-State: AOJu0YyadGw3XSKcvDKmyh8Hq9kZbsR4fiNdMCTEmWvuWFsX1mmebO9d
	jNudSudAy3macP4x+SiBoae2pwurYcelt5ocgRn8dCGZ12qkKlbGO9d4M+g+vHhfivQ=
X-Gm-Gg: AfdE7cmf7wggEObtrtrWLhs1ah0m+/b1mgpQS73a2g/ObCzVMnz03k2fGcu7WZgt76V
	mWA6J+voAYNeut4ixtc62rsKcejLCtmuOcpME3gJpDWgzMTd6j0t/Eb00iyvDPSsfWH3ne+kY7l
	VlffQNlR7tVbwCTNEtK4SGbihvvoVxJOr2SNFqM9X6VlEJ9/BCBwS2mzCXgT08pqBUO5w+EyMZp
	amofh3DW2c5VvfNAqcobePY3MKZiIQZnJ6NSQtYH8t9aqgPeACoriID+prTP6gd2RB+rR/8U2Jx
	8FfqYmjt0j6qfu/u23VIo3LWLRfr357KyTqkk+m58vIXZVHNytr/RwOI45LbdqaI/PmESTl5vr5
	JgSpXX2gXr7cQ86e0hqcG64wyva/4OUGohcrZaWSVbm75jXbSqHbSciOwdDqW+o9cAODua7xeYh
	396XKNJgu0LTRgVeuwc3Aajr8bDd6G8qUkXY0/CFvJ3gVeBI5NEwk+UPqIHd57QdP9NDHjbHprV
	g==
X-Received: by 2002:a05:6214:4983:b0:8de:1754:f793 with SMTP id 6a1803df08f44-8e6df1da882mr171865996d6.20.1782593762480;
        Sat, 27 Jun 2026 13:56:02 -0700 (PDT)
Received: from gourry-fedora-PF4VCD3F.lan (pool-173-79-60-52.washdc.fios.verizon.net. [173.79.60.52])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-8df81cdec56sm265460836d6.32.2026.06.27.13.56.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 27 Jun 2026 13:56:01 -0700 (PDT)
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
Subject: [PATCH 1/2] kernel/entry: add CONFIG_SYSCALL_USER_DISPATCH to compile SUD out
Date: Sat, 27 Jun 2026 16:55:50 -0400
Message-ID: <20260627205551.769684-1-gourry@gourry.net>
X-Mailer: git-send-email 2.54.0
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Syscall User Dispatch is built under CONFIG_GENERIC_SYSCALL and cannot
be disabled independent of the core syscall-entry machinery.

Native foreign-binary emulators (Wine/Proton) need it, but it should
be an optional for minimal/high security systems.

Add CONFIG_SYSCALL_USER_DISPATCH to make it optional.

Signed-off-by: Gregory Price <gourry@gourry.net>
---
 arch/Kconfig                                | 11 ++++++++
 include/linux/entry-common.h                |  6 ++---
 include/linux/syscall_user_dispatch.h       | 28 +++++++++++++++++++--
 include/linux/syscall_user_dispatch_types.h |  2 +-
 kernel/entry/Makefile                       |  3 ++-
 5 files changed, 42 insertions(+), 8 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index e86880045158..a40686e2ad5b 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -114,6 +114,17 @@ config GENERIC_ENTRY
 	select GENERIC_IRQ_ENTRY
 	select GENERIC_SYSCALL
 
+config SYSCALL_USER_DISPATCH
+	bool "Syscall User Dispatch (SUD)"
+	depends on GENERIC_ENTRY
+	default y
+	help
+	  Syscall User Dispatch (SUD) lets a thread have its own system calls
+	  redirected to a userspace handler.  It is used by emulators that run
+	  foreign binaries which issue system calls directly.
+
+	  If unsure, say Y.
+
 config KPROBES
 	bool "Kprobes"
 	depends on HAVE_KPROBES
diff --git a/include/linux/entry-common.h b/include/linux/entry-common.h
index 416a3352261f..9336516430a1 100644
--- a/include/linux/entry-common.h
+++ b/include/linux/entry-common.h
@@ -9,6 +9,7 @@
 #include <linux/resume_user_mode.h>
 #include <linux/seccomp.h>
 #include <linux/sched.h>
+#include <linux/syscall_user_dispatch.h>
 
 #include <asm/entry-common.h>
 #include <asm/syscall.h>
@@ -55,7 +56,6 @@ static __always_inline int arch_ptrace_report_syscall_entry(struct pt_regs *regs
 }
 #endif
 
-bool syscall_user_dispatch(struct pt_regs *regs);
 long trace_syscall_enter(struct pt_regs *regs, long syscall);
 void trace_syscall_exit(struct pt_regs *regs, long ret);
 
@@ -232,10 +232,8 @@ static __always_inline void syscall_exit_work(struct pt_regs *regs, unsigned lon
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
index 3858a6ffdd5c..3dcb4c2dc544 100644
--- a/include/linux/syscall_user_dispatch.h
+++ b/include/linux/syscall_user_dispatch.h
@@ -7,8 +7,22 @@
 
 #include <linux/thread_info.h>
 #include <linux/syscall_user_dispatch_types.h>
+#include <linux/sched.h>
 
-#ifdef CONFIG_GENERIC_ENTRY
+struct pt_regs;
+
+#ifdef CONFIG_SYSCALL_USER_DISPATCH
+
+bool syscall_user_dispatch(struct pt_regs *regs);
+
+static inline bool syscall_user_dispatch_clear_on_dispatch(void)
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
 
+static inline bool syscall_user_dispatch(struct pt_regs *regs)
+{
+	return false;
+}
+
+static inline bool syscall_user_dispatch_clear_on_dispatch(void)
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
-- 
2.54.0

