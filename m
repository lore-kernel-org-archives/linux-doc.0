Received: from mail-qt1-f175.google.com (mail-qt1-f175.google.com [209.85.160.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 38657372076
	for <linux-doc@vger.kernel.org>; Sat,  4 Jul 2026 01:59:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.160.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783130356; cv=none; b=e4q+MazjNU/olKdzy/pwb8UbvcfXoeseP4lAmKhD0fioYyyAhJvD686OCjdBdCttWyszCaw7TD3YY9RNfE50ex2zfAx44S/YO9bvlpP+FG/gahpKl8OnnoxvX3X7XuUvDghg1Der44lO40p9jxQYC7taO3OaVZbUUm7kAiDlI7w=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783130356; c=relaxed/simple;
	bh=T0t5M/tb11Dl8w32HFMPoNKEsjuCn498IkXKnjv337I=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=uNT7gILpSz9Fa1QxrilslcbNqnZR8PpYdsvW/FvI8LbQ8/xOwduWa0XELBWHzFR2RfdQXH5iG7J8hex+ym9+wZpD8jxsRFuzMkjNU13RE7TnSWNE4Bvd2ycGBxzoo36mUxdeN1KKojEgbNvMm3zkpCPZnD2Dn/BXxHpy4w5emW8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net; spf=pass smtp.mailfrom=gourry.net; dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b=lfc57C4E; arc=none smtp.client-ip=209.85.160.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=gourry.net
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gourry.net
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gourry.net header.i=@gourry.net header.b="lfc57C4E"
Received: by mail-qt1-f175.google.com with SMTP id d75a77b69052e-51c29b46382so5679101cf.3
        for <linux-doc@vger.kernel.org>; Fri, 03 Jul 2026 18:59:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gourry.net; s=google; t=1783130354; x=1783735154; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1o1MWgoY6UQRPPZVOsNGZDHuSijtCgGTMT4PN0DmAqg=;
        b=lfc57C4ERGadzVOUYHgpkNqMYBCuzvtiN4pPIsyVl1pJjrhWNg0eUaRBS4TjanCgmj
         quEmaOj1gumKg9aBBKwieyT555aezSB+WgBP6ikQlHLg3YjGxLMa8DxKyyvbySUON6xj
         DwWj5fiTjd7hTfTjwiDCDrYRgzfKauNzWt1K1IOvd8e+b4WzmtpTJAUut3XlEO976q+E
         NNPm8kX+txjl96T6juH7sOK44mWZ6N2GCdStwMDFKnnXKZkejP0B3clKlz9jQmgSYXjp
         gviCMDMtCrjtf8K5xisX8RFwMkEg5KGHCsB5J/ULZo4n+0f1hWX6WjlBDT+I9SxnBThU
         RRmw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1783130354; x=1783735154;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1o1MWgoY6UQRPPZVOsNGZDHuSijtCgGTMT4PN0DmAqg=;
        b=desdiTStxoAdRYK/YRHTSs48MFJJyvCfen/1Ob/xbSSHsX7kxh/c8oq4q5xzyKU/ym
         c+z50vDilrBDtnuW3dkexqKTz52yIdeLTuqmIwDYN7bRlzFQF3KzWhL24nf1ZpVClueq
         doSrspwYaH3sY8LyLxXd1Bn4SRaB2j7QqbdAd9sljK8XD+nZypI6NBUlUNUBy8EIpYIP
         m06ajaLmtNckVs9t8Mvkzh4HZdHojLWPP7C/mK0RnI0mEdI4MOf/YiLFsUwUqt4qmHhB
         aMTEcaFyiMPfJMTVWUi8Gl7RLf2dDhU5PU1sJ6kaoSAP+gWBELeNhW/PMxaW6PaCJyvx
         sD2g==
X-Gm-Message-State: AOJu0Yx3illOEh6LfxQdfnBVVCbo7ZF8ROuXatSGXd41V+iGSq7V1nhb
	8ylBI6CSyURF8YCpQp+6WjWUmPQd1HF/Igh+w9b4fFyJqzEjBfOUBKaviTfK4GdGKCc=
X-Gm-Gg: AfdE7cmyzemIXSghK9GeQid/h5oDdl9piNCZix4dQ3evSGyRlzM4aqWbMPS+dAjvn3P
	LVAZrz8KkiJG6xc9mfIJ5joR904IV8aPkdjxjs0SiBZPQ3SsJ/SzJKI9DOSa1jggysUpI/BvHpO
	8UyV5a4UdDOy7Ij5SLbKETfbAxmWkR9Tf0JRtX2tebqBZNbt4h8zGB0NWW2E21CCX04qbPw4e1p
	eSFj5ZhEVRaHWm0WJC4Vvcysi3WPxSu6LvoJDBiwJLdSQK3KVvIYrLHoyXa9Aricf/s3rcRZ3qf
	FTWvxZS1z1l4iJ5nlEisIO1IVeQo/YsBT25xJodrPeiDysFPWQ4arS38+i9NqmFJ4LglT/Q1uDp
	5peTxePMxL/VoN1sy6DQwn0kxwsQ+h6NRIzQkf3yRO6jbcMhxgNhIT91nvgup+zNP/lS7xsaK9N
	SxojodJWv8M1X6cing6IeMn1nGH15mmkERxTVFI/yljxy9KRxtZD1Pbg==
X-Received: by 2002:a05:622a:5918:b0:51c:19d8:e30a with SMTP id d75a77b69052e-51c4c1e421fmr30575761cf.15.1783130354238;
        Fri, 03 Jul 2026 18:59:14 -0700 (PDT)
Received: from fedora (50-32-2-77.vng01.dlls.pa.frontiernet.net. [50.32.2.77])
        by smtp.gmail.com with ESMTPSA id d75a77b69052e-51c41e084e8sm28109311cf.28.2026.07.03.18.59.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Jul 2026 18:59:13 -0700 (PDT)
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
Subject: [PATCH v2 1/2] syscall_user_dispatch: Make it configurable in Kconfig
Date: Fri,  3 Jul 2026 21:58:58 -0400
Message-ID: <20260704015859.536580-2-gourry@gourry.net>
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

Syscall User Dispatch is presently built under CONFIG_GENERIC_SYSCALL
and cannot be disabled independently.

Add CONFIG_SYSCALL_USER_DISPATCH to make it an optional feature.

Signed-off-by: Gregory Price <gourry@gourry.net>
---
 arch/Kconfig                                | 11 ++++++++
 include/linux/entry-common.h                |  6 ++---
 include/linux/syscall_user_dispatch.h       | 28 +++++++++++++++++++--
 include/linux/syscall_user_dispatch_types.h |  2 +-
 kernel/entry/Makefile                       |  3 ++-
 5 files changed, 42 insertions(+), 8 deletions(-)

diff --git a/arch/Kconfig b/arch/Kconfig
index fa7507ac8e13..192b9d8abb5f 100644
--- a/arch/Kconfig
+++ b/arch/Kconfig
@@ -114,6 +114,17 @@ config GENERIC_ENTRY
 	select GENERIC_IRQ_ENTRY
 	select GENERIC_SYSCALL
 
+config SYSCALL_USER_DISPATCH
+	bool "Syscall User Dispatch"
+	depends on GENERIC_ENTRY
+	default y
+	help
+	  Syscall User Dispatch lets a thread have its own system calls outside
+          an allowed IP address range to be intercepted and redirected to a
+          userspace signal handler.
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
index 3858a6ffdd5c..c466af02da36 100644
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

