Received: from mail-pj1-f100.google.com (mail-pj1-f100.google.com [209.85.216.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 16F734E3243
	for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 17:56:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.216.100
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790618188; cv=none; b=KQPtOYTWpBYbu1JvQHGJGGzoEmYkgJz8OitiNZlGyFfkB99bYGFSSAUEwO6x+FguGgRhGWSstNs7JW5+5hmtjGD9v/E1nW8MsGZdYH9CcyryhDayJziQKgzb2JSzflRfYeeCXXSVob5IirBVphNHi1u/2wGvdzBVBr3YyNvbxrY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790618188; c=relaxed/simple;
	bh=U7SrnQqd49BzbY2SHayUrqHOZ0gYhQLl4LJWEnU6rDo=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=Otw8GZc7oqD/A0Um6ZJes/H1Fh/151BPMRyrrM+bHYwuPziSq7DTYyKK4YJr71w7CLldt1aTcfajuCEIbIz/yZ4Et9RH8O9mbCJxisyi5JFd0B+KYYCO0UyCmPcMRV2zlFZx7vXKdLenu46PoW8XuTNLpLhY9EMxveQ8TuHBU3E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com; spf=fail smtp.mailfrom=broadcom.com; dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b=KTlaJJOw; arc=none smtp.client-ip=209.85.216.100
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=broadcom.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=broadcom.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=broadcom.com header.i=@broadcom.com header.b="KTlaJJOw"
Received: by mail-pj1-f100.google.com with SMTP id 98e67ed59e1d1-3a02b38210cso1789521a91.2
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 10:56:26 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790618186; x=1791222986;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:dkim-signature:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0N74TVpylEcqJv/7BbWevY9i5i91Vy455vcjAtMshTM=;
        b=FJ0pReW8Bf/ToeIfiV9I0v3e59yhyPNujw0428+pZLLm3pLBqqtZavu8OkuAMg/j8W
         SdMupug8aDIryjCJHiC9cDO2qPXOBygbJgRDRfXIk34d1vfZg3svUBstj4cVGg0IW7Qm
         uHHHwS2dZ5TGmDqL168hgZA8aAGNORDKqSBFLGFKVEeF43FkeXG2hTQUtkkeqOGz9ufH
         qhIE8JqW645Aw8oSgohtTjBHyuLKiMMSpCUrbcaiHh0VXS2cJ9GFRx2+9QWebfdloyI1
         kFrcSz8CIscByFUfn44hnRYqk+JjnbSWpbtoo1Mv3WNxhW8CiKI8KZpTutGXfUygpsX0
         C74Q==
X-Forwarded-Encrypted: i=1; AKwUvBw+eXP2YOFh/X9xrdZPS1b5/KtnhlW9uaVEVgapG3HQZgY7upEX0eSfjdzwsOb1M5CyAHDC0+TDDjg=@vger.kernel.org
X-Gm-Message-State: AFq9FYKoo93M17jRzDx/qkHI3hjs2ae/jnIJQqE2N0HWfFWtkqmM2lmT
	TPn7MjPARXZHFjOwX2/1he/K0k1//a9PCDvrLSI5Gy5CXLhDmZNGJufu8+WiRjEUdRSCc0i2f1s
	3Ymhn3FNrMq9fGB78OTMHKzyQxPgV1OBZy0M/W54wjLV1WYdhMStlp2AkWlpe7skURBuB7YmvdL
	ji794cTPckGKlb8PdILTpuuKHxSutMtdkiJoZxyAuQyltIFbS8D/BJPAWJ/tvE0gSkMOmQH6/iL
	GHAABY9i+NZ
X-Gm-Gg: AYBFou0vhiq8iYJfqWvBwriyy9YdgGfuweN1JMmox/YKOeuOfQiq0PkStgpMpfTVpyn
	uWaRhcQY50uhgpOErvq43iQs+GoJrfE+2otZtshNRH3qCFRmm+7Gq2dbHL5wCHHsmlnEL5NlELA
	T8pffQO542w5cA0HCAxrknEx9GritX8/t7vRPq54V5Kb9HnuR7pSt/AqymWfbXD21l2tWfoQ4Vs
	d7Q+nXBD8dQDCTB9+MebVxqJIF4UJk2F6EZMWD5ux/ZC+y88tl9UxoiAJsGEtVLEEiOxyJoBDxx
	cgJ0speFyTnCtVIjyFZqAa8R/NBMLG3fNcjjn/TRXaGK1mTxzYpRQ8SYhJ/kYsOE70ZctfYSPhv
	ejgTKwFmhwTdZVsJ6XkD9filQiNT3VLY+P0otTd5rwHGD2GDilYUX8+oMoz7Hl3DzwagH8BgbMg
	IR5qJ8FZY0RK6Y80ygP9LXk/uAG0V6jBnu6Pw=
X-Received: by 2002:a17:90b:2f0b:b0:39e:6c69:9b8f with SMTP id 98e67ed59e1d1-3a099231fa7mr11265424a91.52.1790618186310;
        Mon, 28 Sep 2026 10:56:26 -0700 (PDT)
Received: from smtp-us-east1-p01-i01-si01.dlp.protect.broadcom.com (address-144-49-247-120.dlp.protect.broadcom.com. [144.49.247.120])
        by smtp-relay.gmail.com with ESMTPS id 41be03b00d2f7-cc7877ddf15sm6709032a12.11.2026.09.28.10.56.25
        for <linux-doc@vger.kernel.org>
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 28 Sep 2026 10:56:26 -0700 (PDT)
X-Relaying-Domain: broadcom.com
X-CFilter-Loop: Reflected
Received: by mail-dy1-f200.google.com with SMTP id 5a478bee46e88-3437d0cc8c7so6737978eec.0
        for <linux-doc@vger.kernel.org>; Mon, 28 Sep 2026 10:56:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=broadcom.com; s=google; t=1790618184; x=1791222984; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0N74TVpylEcqJv/7BbWevY9i5i91Vy455vcjAtMshTM=;
        b=KTlaJJOwctxD0rueMqkkHvr9dEWfypMD4gsRgSA+HLN3EGKE17hzPm3jDQIffOmtDK
         yajEH2g1agisUfVKGbve638/UoPvTK6Hm+0MMfg6eKhIXO5s6ijMfHNqyqm3zXobEbsJ
         yhOzwOKnsV14XWd0fYGJH3GpkZUf9RBLk+eXA=
X-Forwarded-Encrypted: i=1; AKwUvBz6Mo8aP0IZ5C69gdmyvl26aGSbRoKBAUpIi0uKodQ0gXiKSw0kUErDvnjUBKqwRAigwoAOPRdxsIY=@vger.kernel.org
X-Received: by 2002:a05:7301:1501:b0:343:fdea:9a4 with SMTP id 5a478bee46e88-343fdea2578mr7436615eec.28.1790618184369;
        Mon, 28 Sep 2026 10:56:24 -0700 (PDT)
X-Received: by 2002:a05:7301:1501:b0:343:fdea:9a4 with SMTP id 5a478bee46e88-343fdea2578mr7436577eec.28.1790618183717;
        Mon, 28 Sep 2026 10:56:23 -0700 (PDT)
Received: from vertex.localdomain ([192.19.144.250])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-3421dbb2971sm26076069eec.10.2026.09.28.10.56.16
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 28 Sep 2026 10:56:19 -0700 (PDT)
From: Zack Rusin <zack.rusin@broadcom.com>
To: Andrew Morton <akpm@linux-foundation.org>,
	Petr Mladek <pmladek@suse.com>,
	Baoquan He <baoquan.he@linux.dev>,
	Mike Rapoport <rppt@kernel.org>,
	Pasha Tatashin <pasha.tatashin@soleen.com>,
	Pratyush Yadav <pratyush@kernel.org>,
	Dave Young <ruirui.yang@linux.dev>
Cc: Borislav Petkov <bp@alien8.de>,
	Ajay Kaher <ajay.kaher@broadcom.com>,
	Alexey Makhalov <alexey.makhalov@broadcom.com>,
	x86@kernel.org,
	Joel Granados <joel.granados@kernel.org>,
	Thomas Gleixner <tglx@kernel.org>,
	Ingo Molnar <mingo@redhat.com>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	virtualization@lists.linux.dev,
	bcm-kernel-feedback-list@broadcom.com,
	linux-kernel@vger.kernel.org,
	John Ogness <john.ogness@linutronix.de>,
	Steven Rostedt <rostedt@goodmis.org>,
	Sergey Senozhatsky <senozhatsky@chromium.org>,
	Kees Cook <kees@kernel.org>,
	Jonathan Corbet <corbet@lwn.net>,
	Bo Gan <bo.gan@broadcom.com>,
	Brennan Lamoreaux <brennan.lamoreaux@broadcom.com>,
	kexec@lists.infradead.org,
	linux-doc@vger.kernel.org,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Maaz Mombasawala <maaz.mombasawala@broadcom.com>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Randy Dunlap <rdunlap@infradead.org>,
	Stephen Brennan <stephen.s.brennan@oracle.com>,
	Michael Kelley <mhklinux@outlook.com>,
	Ian Forbes <ian.forbes@broadcom.com>
Subject: [PATCH v2 3/6] panic: Allow postponing pre-kdump notifiers
Date: Mon, 28 Sep 2026 13:55:37 -0400
Message-ID: <52183acf25209275a9a57fe5d746f82d3b7efc3c.1790014793.git.zack.rusin@broadcom.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <cover.1790014793.git.zack.rusin@broadcom.com>
References: <cover.1790014793.git.zack.rusin@broadcom.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-DetectorID-Processed: b00c1d49-9d2e-4205-b15f-d015386d3d5e

Provide an escape hatch for debugging kdump failures that may involve
pre-kdump callbacks. Add panic_pre_kdump_postpone to skip their early
invocation in crash core without consuming the once-only guard.

When enabled, the chain runs before kdump only when
crash_kexec_post_notifiers is also enabled. Leave the late panic call
unchanged so callbacks remain eligible if that path is reached.
Skipping the callbacks may prevent hypervisor crash handling.

Suggested-by: Guilherme G. Piccoli <gpiccoli@igalia.com>
Link: https://lore.kernel.org/r/bc0bdd14-5e6a-0676-cd04-14fb0bb93cd5@igalia.com
Signed-off-by: Zack Rusin <zack.rusin@broadcom.com>
---
New in v2: optional postponement policy suggested by Guilherme.

 Documentation/admin-guide/kernel-parameters.txt | 14 ++++++++++++++
 include/linux/panic_notifier.h                  |  1 +
 kernel/crash_core.c                             |  3 ++-
 kernel/panic.c                                  |  2 ++
 4 files changed, 19 insertions(+), 1 deletion(-)

diff --git a/Documentation/admin-guide/kernel-parameters.txt b/Documentation/admin-guide/kernel-parameters.txt
index 33cd30996e47..3d722df30838 100644
--- a/Documentation/admin-guide/kernel-parameters.txt
+++ b/Documentation/admin-guide/kernel-parameters.txt
@@ -4904,6 +4904,20 @@ Kernel parameters
 			This option should only be used for systems with the above
 			constraints as it might cause the panic operation to be less reliable.
 
+	panic_pre_kdump_postpone=
+			[KNL] Defer pre-kdump notifiers to the late panic path.
+			They run before kdump only when
+			crash_kexec_post_notifiers is also enabled. If panic
+			reaches the late path without entering kdump, they
+			can still run there.
+			Intended for debugging kexec/crash-dump failures.
+			Skipping these callbacks may prevent correct crash
+			handling by the hypervisor.
+			Format: <bool>
+			Default: 0
+			Writable at runtime via
+			/sys/module/kernel/parameters/panic_pre_kdump_postpone.
+
 	panic_print=	Bitmask for printing system info when panic happens.
 			User can chose combination of the following bits:
 
diff --git a/include/linux/panic_notifier.h b/include/linux/panic_notifier.h
index 3ad390764a41..655ee5c77181 100644
--- a/include/linux/panic_notifier.h
+++ b/include/linux/panic_notifier.h
@@ -11,5 +11,6 @@ extern struct atomic_notifier_head panic_pre_kdump_list;
 void panic_notify_pre_kdump(char *msg);
 
 extern bool crash_kexec_post_notifiers;
+extern bool panic_pre_kdump_postpone;
 
 #endif	/* _LINUX_PANIC_NOTIFIERS_H */
diff --git a/kernel/crash_core.c b/kernel/crash_core.c
index 5d9fe9e00f39..d6b2293dd0fe 100644
--- a/kernel/crash_core.c
+++ b/kernel/crash_core.c
@@ -140,7 +140,8 @@ void __noclone __crash_kexec(struct pt_regs *regs)
 			struct pt_regs fixed_regs;
 
 			crash_setup_regs(&fixed_regs, regs);
-			panic_notify_pre_kdump(NULL);
+			if (!READ_ONCE(panic_pre_kdump_postpone))
+				panic_notify_pre_kdump(NULL);
 			crash_save_vmcoreinfo();
 			machine_crash_shutdown(&fixed_regs);
 			crash_cma_clear_pending_dma();
diff --git a/kernel/panic.c b/kernel/panic.c
index d78e90abb192..65d86594e038 100644
--- a/kernel/panic.c
+++ b/kernel/panic.c
@@ -62,6 +62,7 @@ static int pause_on_oops;
 static int pause_on_oops_flag;
 static DEFINE_SPINLOCK(pause_on_oops_lock);
 bool crash_kexec_post_notifiers;
+bool panic_pre_kdump_postpone;
 int panic_on_warn __read_mostly;
 unsigned long panic_on_taint;
 bool panic_on_taint_nousertaint = false;
@@ -1243,6 +1244,7 @@ core_param(panic, panic_timeout, int, 0644);
 core_param(pause_on_oops, pause_on_oops, int, 0644);
 core_param(panic_on_warn, panic_on_warn, int, 0644);
 core_param(crash_kexec_post_notifiers, crash_kexec_post_notifiers, bool, 0644);
+core_param(panic_pre_kdump_postpone, panic_pre_kdump_postpone, bool, 0644);
 core_param(panic_console_replay, panic_console_replay, bool, 0644);
 
 static int panic_print_set(const char *val, const struct kernel_param *kp)
