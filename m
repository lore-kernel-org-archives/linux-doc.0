Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C53BF1DDC3A
	for <linux-doc@vger.kernel.org>; Wed, 29 Jan 2025 15:37:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738165060; cv=none; b=XflTSETCQ8Pdwp+bfz+SAr7NsUHuCIKs0xzCM5/NzEflPRieP+sYRyC340FnRtn2Ml4WvUUQovqnGActR7PJ1tHshNlGJhdtFG3rpKaSVfCeecGd7MV0Njd+fanHo9W8D6VJmA7Pp7k6SykUkq3D8l5hIa4pLIjycgbeU0Fe0iY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738165060; c=relaxed/simple;
	bh=BZmxAaQXahWMAGEvFWqzbRoDmU6I6Ho2pJOhoYWv8jw=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=X7bL9G+dzA2RdR6icPct7OMPGW0EJBMjeuO8AjsLLKdqjUq4NU/pDz20xQE/1XLQp1UP03US7gkZ+4N1UgZPzurM5mPDUQFQSb/uNieCKxXJrD+48qVYxWdlGUqBmHilrQDRJKhc+1QcySk5ZJuc4M26s9aj0w2iFu3Px2ksTuc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=OPhcWeDi; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="OPhcWeDi"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4361b090d23so35875565e9.0
        for <linux-doc@vger.kernel.org>; Wed, 29 Jan 2025 07:37:38 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738165057; x=1738769857; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=bNRDH65U+KPIQ2Ea8tJsCM/hD7W8WaedlyBZuv1YzAc=;
        b=OPhcWeDizaAy8jq43Vi0DgfqqNOh3kTw0OPVY4249892n0YelLTPP4Zs5LwLAEbgLC
         7r6kRSos/ugYeWJKRFTs8GUrFF1EmsA/yQ8MPpev/17Rj5oMlJzXFtzh4J6V0ETtHDuR
         GdGPgzvesc3t1x5kRXKMFx/jQTB9Up8D5SjbmCKmx7S5mwUG4XL028LJgsa4HRRm1DiV
         7DXRq/JqUoGnerF1RsfRbTeCV+fixz05rDaQZDE6rFrrQ/T5+mDAeE+d18YGYye+Jfdv
         /nTwaCRi9bYVhvZhUVxF4Y0s7bV3rw8wIp2AJ79UWMnw+6giqAsh8mzwrNR5GlN0V8KJ
         yBHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738165057; x=1738769857;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=bNRDH65U+KPIQ2Ea8tJsCM/hD7W8WaedlyBZuv1YzAc=;
        b=dnvaZvcFVPJjYbqJBdlGgOOrU0I282rhBu08H4tk4oi5btweasXVsl0xepczEFP04x
         UHMJGcBBKtcxOGx0uIqDvG2iOPEaT/5qQ5EbaMYKT30kSdDhaBau3KtC0yiAaJVPjk5r
         p7zE5kK8ODNA7cS6cx8STfGs83RFqr/3AUONy+e/NpnA0M2Qwgm6kGDwJcjPpF4su6cv
         iNP9FNwReig3K5q666BgS7VYLXNzAXibdEid8uJKf0R0p5T5W0wwQmIcb5NW+bYdMZOk
         PvcRXD/D28EpJklh+bXR+sGvIulfUqS5jHiNqW26UiExmqxaFV/XTNDJ6x4v1tOtiBar
         rUGg==
X-Gm-Message-State: AOJu0YxoT41HwOkPfmuAMBSiOd5qxLeTgZDMQuTXbZnLKh1GPaY4w9cG
	X0eRacLIk1WdxueU/ACjZjbU0/xZDVt/vEoVj63sDM1XdDLKGz9Xq/akO6XoicdQS1ulqorHwgg
	7aehKzPDb+A==
X-Google-Smtp-Source: AGHT+IFOBmyOvb/DVGP1bzZYJVAn3Is2fDXC6A7dftPCqfzjxfVXdcMqq6KkQMUUFTs4gxZRfXSgae81Otqh6Q==
X-Received: from wmqd1.prod.google.com ([2002:a05:600c:34c1:b0:434:f1d0:7dc9])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:468e:b0:436:fb02:e68 with SMTP id 5b1f17b1804b1-438dc3a81ecmr33349965e9.2.1738165057049;
 Wed, 29 Jan 2025 07:37:37 -0800 (PST)
Date: Wed, 29 Jan 2025 15:35:39 +0000
In-Reply-To: <20250129-force-cpu-bug-v2-0-5637b337b443@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250129-force-cpu-bug-v2-0-5637b337b443@google.com>
X-Mailer: b4 0.15-dev
Message-ID: <20250129-force-cpu-bug-v2-1-5637b337b443@google.com>
Subject: [PATCH RESEND v2 1/3] x86/cpu: Create helper to parse clearcpuid param
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
2.48.1.262.g85cc9f2d1e-goog

