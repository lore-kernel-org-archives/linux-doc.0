Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D366B218E8B
	for <linux-doc@vger.kernel.org>; Fri, 20 Dec 2024 15:18:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734707925; cv=none; b=b0UsWxtRopOC7n0LYZQchYkKCFJpDDLHw97g9cY9uBUQkUC6m0/pfmp+K4PpUV7MOV1YAOp4Pz9UBFwWTtzD2p2UhRD/V2Kin3t2rvDik9tIKUJ1O0id5+EgxmlIiv+Slw3wrQGb65Wq8jivwmzAt3a9Yd3QeAQd9BOC0ESsFv8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734707925; c=relaxed/simple;
	bh=Rgam4aIj/iyJnWb3M3aIcnUTrrMUTjRHc3xReXaArS8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=egxf1C8Ouuwl7Bo1PYVHD9eUZmNzsgtCjGaCDEX+GDcTNR8psb9Xs920FFJzGWjPrgF1YxAYpurDoBk7dl77Thb2bfPFKdUW8BvpLlfurEiJeT3HUURvOHviKQV1EK3NRbtd3uh7FC53bGD5rEiA6JgUqSf64yLISNCp4OfhcPY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=pz+A4Hn5; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="pz+A4Hn5"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-385d7611ad3so1208379f8f.2
        for <linux-doc@vger.kernel.org>; Fri, 20 Dec 2024 07:18:43 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734707922; x=1735312722; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=lHK3n7motfVsk2sPpow6ifPryE0nazMyoiE01W835zQ=;
        b=pz+A4Hn5fWDW0wJn9XIfFHqc9s/phXxXBTWIgMOp7qsOu0xeLQyaIBDyj7rjSX02Uh
         lQkWwFvJlk2xrHh2cjWwcanmt/7HKdAGs96xHXIRrANtO5OvsNuakz50Ew9DqbewPZh4
         rcCbksq8pfIfpZIhB3qmRMWHPHtk8cR2lLJswIsUo12Y/W2IWqiUqbEcObkjpssPG6eh
         XodJuvc/RNikaqxyaaWA/sVxdDmhJlQLniUJeDZuTEWp2mP4KJ9pf7aLT/SFJczDi+rD
         kHOPPXRli4yB9Buh7fx+bMv/opef59q5X43+LEsrLxR8nloKJS09vUU0Fuzt6tL+ChCi
         8okA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734707922; x=1735312722;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=lHK3n7motfVsk2sPpow6ifPryE0nazMyoiE01W835zQ=;
        b=v+0ZKPcAJ6dw93aL5IRkm+2xEtM/jpPSvTUJSwTD2Bfd4EJL7m1SIbSfYQj2lhQgmZ
         B4wsN0PKqYtth+VA18qh/l+KbXiy+QvfP6UPn+4jP/u7+FCHFkmc4wQMtcpY+4JB6XkE
         hlYE2DmIWilBFh+L/+eveQaJ5PJdazs4p0AEJLrAKe3enUOMfdtBgqq2tCdKTUo6XYj9
         lznLoTZAagAJB7/UXaAIYu2tgmaLfllYJqRNPUULwmY8GnjVuYgCBy1nWCu7IeVROfHp
         BU7kXxomahIqDNFFhTI+rJqoiP3L0gWframijNKpkepkwpHZPzhJs+jTl+AHdalluUFD
         t9xA==
X-Gm-Message-State: AOJu0YzGXsaUncUWMPP8Y6kDI8kLbr/KYsaU9RdcfX1WMbTvXOM0Fjjh
	EpHjhJsfsp6LOCZjjTtUgfvCSQb29nBeMBAmr37Ix2HlxOvSKsSU0iuI4pn7RZeyq7JIFE/Vwg+
	S3a+1vrjPog==
X-Google-Smtp-Source: AGHT+IF2n3gk1JJb4op4k4ElYoC+EAd3ufs4GsI81wLCGV2SJvMVSrNHU6tMvyO4o+LxscVQSV1OEtrbXvua5g==
X-Received: from wmdd20.prod.google.com ([2002:a05:600c:a214:b0:434:fd41:173c])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1882:b0:385:e9de:d52a with SMTP id ffacd0b85a97d-38a2240838dmr3509054f8f.48.1734707922320;
 Fri, 20 Dec 2024 07:18:42 -0800 (PST)
Date: Fri, 20 Dec 2024 15:18:31 +0000
In-Reply-To: <20241220-force-cpu-bug-v2-0-7dc71bce742a@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241220-force-cpu-bug-v2-0-7dc71bce742a@google.com>
X-Mailer: b4 0.15-dev
Message-ID: <20241220-force-cpu-bug-v2-1-7dc71bce742a@google.com>
Subject: [PATCH v2 1/3] x86/cpu: Create helper to parse clearcpuid param
From: Brendan Jackman <jackmanb@google.com>
To: Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Brendan Jackman <jackmanb@google.com>
Content-Type: text/plain; charset="utf-8"

This is in preparation for a later commit that will reuse this code, to
make review convenient.

Factor out a helper function which does the full handling for this arg
including printing info to the console.

No functional change intended.

Signed-off-by: Brendan Jackman <jackmanb@google.com>
---
 arch/x86/kernel/cpu/common.c | 96 ++++++++++++++++++++++++--------------------
 1 file changed, 52 insertions(+), 44 deletions(-)

diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 3e9037690814b331b3433a4abdecc25368c2a662..87ea1a6f7835592e560aae3442bbea881123ac64 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -1477,56 +1477,18 @@ static void detect_nopl(void)
 #endif
 }
 
-/*
- * We parse cpu parameters early because fpu__init_system() is executed
- * before parse_early_param().
- */
-static void __init cpu_parse_early_param(void)
+static inline void parse_clearcpuid(char *arg)
 {
-	char arg[128];
-	char *argptr = arg, *opt;
-	int arglen, taint = 0;
-
-#ifdef CONFIG_X86_32
-	if (cmdline_find_option_bool(boot_command_line, "no387"))
-#ifdef CONFIG_MATH_EMULATION
-		setup_clear_cpu_cap(X86_FEATURE_FPU);
-#else
-		pr_err("Option 'no387' required CONFIG_MATH_EMULATION enabled.\n");
-#endif
-
-	if (cmdline_find_option_bool(boot_command_line, "nofxsr"))
-		setup_clear_cpu_cap(X86_FEATURE_FXSR);
-#endif
-
-	if (cmdline_find_option_bool(boot_command_line, "noxsave"))
-		setup_clear_cpu_cap(X86_FEATURE_XSAVE);
-
-	if (cmdline_find_option_bool(boot_command_line, "noxsaveopt"))
-		setup_clear_cpu_cap(X86_FEATURE_XSAVEOPT);
-
-	if (cmdline_find_option_bool(boot_command_line, "noxsaves"))
-		setup_clear_cpu_cap(X86_FEATURE_XSAVES);
-
-	if (cmdline_find_option_bool(boot_command_line, "nousershstk"))
-		setup_clear_cpu_cap(X86_FEATURE_USER_SHSTK);
-
-	/* Minimize the gap between FRED is available and available but disabled. */
-	arglen = cmdline_find_option(boot_command_line, "fred", arg, sizeof(arg));
-	if (arglen != 2 || strncmp(arg, "on", 2))
-		setup_clear_cpu_cap(X86_FEATURE_FRED);
-
-	arglen = cmdline_find_option(boot_command_line, "clearcpuid", arg, sizeof(arg));
-	if (arglen <= 0)
-		return;
+	char *opt;
+	int taint = 0;
 
 	pr_info("Clearing CPUID bits:");
 
-	while (argptr) {
+	while (arg) {
 		bool found __maybe_unused = false;
 		unsigned int bit;
 
-		opt = strsep(&argptr, ",");
+		opt = strsep(&arg, ",");
 
 		/*
 		 * Handle naked numbers first for feature flags which don't
@@ -1568,10 +1530,56 @@ static void __init cpu_parse_early_param(void)
 		if (!found)
 			pr_cont(" (unknown: %s)", opt);
 	}
-	pr_cont("\n");
 
 	if (taint)
 		add_taint(TAINT_CPU_OUT_OF_SPEC, LOCKDEP_STILL_OK);
+
+	pr_cont("\n");
+}
+
+
+/*
+ * We parse cpu parameters early because fpu__init_system() is executed
+ * before parse_early_param().
+ */
+static void __init cpu_parse_early_param(void)
+{
+	char arg[128];
+	int arglen;
+
+#ifdef CONFIG_X86_32
+	if (cmdline_find_option_bool(boot_command_line, "no387"))
+#ifdef CONFIG_MATH_EMULATION
+		setup_clear_cpu_cap(X86_FEATURE_FPU);
+#else
+		pr_err("Option 'no387' required CONFIG_MATH_EMULATION enabled.\n");
+#endif
+
+	if (cmdline_find_option_bool(boot_command_line, "nofxsr"))
+		setup_clear_cpu_cap(X86_FEATURE_FXSR);
+#endif
+
+	if (cmdline_find_option_bool(boot_command_line, "noxsave"))
+		setup_clear_cpu_cap(X86_FEATURE_XSAVE);
+
+	if (cmdline_find_option_bool(boot_command_line, "noxsaveopt"))
+		setup_clear_cpu_cap(X86_FEATURE_XSAVEOPT);
+
+	if (cmdline_find_option_bool(boot_command_line, "noxsaves"))
+		setup_clear_cpu_cap(X86_FEATURE_XSAVES);
+
+	if (cmdline_find_option_bool(boot_command_line, "nousershstk"))
+		setup_clear_cpu_cap(X86_FEATURE_USER_SHSTK);
+
+	/* Minimize the gap between FRED is available and available but disabled. */
+	arglen = cmdline_find_option(boot_command_line, "fred", arg, sizeof(arg));
+	if (arglen != 2 || strncmp(arg, "on", 2))
+		setup_clear_cpu_cap(X86_FEATURE_FRED);
+
+	arglen = cmdline_find_option(boot_command_line, "clearcpuid", arg, sizeof(arg));
+	if (arglen <= 0)
+		return;
+	parse_clearcpuid(arg);
 }
 
 /*

-- 
2.47.1.613.gc27f4b7a9f-goog

