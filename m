Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFAD31DE2DF
	for <linux-doc@vger.kernel.org>; Wed, 29 Jan 2025 15:37:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738165062; cv=none; b=K3mwjxbxslaGXEuGMTaZPAjCdwSjhf6jxhkOMZ7Mx23C38kKVDJJfV39H2Cl+QSCdQNOVv1K8GVYOo/4NdRvi48bE+zI4ivoayzZVHTMT5OzuzLKsxSGE1X4Aa9mUdDzbb3wdiVjeTY0AeEcfyNBVfl4LHPjZCPW0CDaltcNHzs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738165062; c=relaxed/simple;
	bh=gdBovry03gRQ2jo/pwWR/ZzpkMVUfuNAHxGPvhrwrUc=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=c9P9XnFwfhWIOQy3rQ1iQbh3qV2+ugIy5yr/FGqjTIzLreQiTAD8TU9SrEAdRWJVhSqgzpyQ/zFzWgpYjqjiSDPqaBh84a7HRCgDtettuKZ1PqBMER3Dpl2OjBxRtw3VdgsVUuWj05RD2Ho+umBBpA8JO4IqcPL3pnPQ46HqWmg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AoL1TxE2; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AoL1TxE2"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-385f0829430so4534663f8f.1
        for <linux-doc@vger.kernel.org>; Wed, 29 Jan 2025 07:37:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738165059; x=1738769859; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=L+s1KHHREFY8ZoAqR1zvTdRFPoZXeYCIfHHlwzj8F0s=;
        b=AoL1TxE2MPYL58bOUTAO4HI8a6+tJDi6c/pEa4KL4gyW+Lk8VQActDqLfgzSvOMsnw
         qNLoSSWRNkAj1c0QOgVqotUwbW7Yq3sMblS/ssur9M7pMHgJdPhgNrot7LN/iksXbsFB
         J4VmYpEn+a3jdXsKmOkHDe0xI58HsTiHi6+DBUEOAQKZlYJAhO0i/ZaLRv9lBxRSQq3d
         Avnv+3w5lVTMjGWOfEC+xh5ennG+2bZgEbpsWDGbimahHi9N0ZdosMuTbDNSOqAwTjnc
         aJSwGY66BDxl6iznz+WQ5F0BcELEelqz6x/Eak79XXMkYFvQM3feDYsq90pwRh3rE62Y
         Fhrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738165059; x=1738769859;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=L+s1KHHREFY8ZoAqR1zvTdRFPoZXeYCIfHHlwzj8F0s=;
        b=Y0GQp1ISRqEsYeCoPfqu7Dkx+0dzMakkYAlEU95X6SElA9ExaV6LPRhNqhnC83GFXZ
         zJGAvQpil0xs9/Isotx75q/F7BhCKfmMT1+lU/wZ/tBujEoHttkqf7rkMZy86gjS7YYH
         9IpuqTopvJVF9NjPGK4qzx1b/ZO+pGAZNLL+2ILsyTfBpQveDkLbioear5TOdiXTQT1t
         tjS2qKwNC3PQZsrPOUmMCopZErpC8eU8wbmje+ru1BO9fofDTIJu2xUUStMcjhXKVZ7d
         zK8LgoZh3hzO4cb320zqx4+Ci3Hyr49W4WVnH61acE5dDp7GwShIC2m6tTvk2UEtSdsV
         FW4g==
X-Gm-Message-State: AOJu0Yzu5dGxoeh+LJvwN9Tv7PSrJpz4F2vBBEmhmW5kPgDpaQGXN1Lz
	M9gW7cT2Lm9dUJsI7uR+LtGxqnR1XdnA0xkmCylj6I/yOPYRLc7eBzZ7DIERmNhvUEcWBo9Bwu3
	YgZgVN2WFCQ==
X-Google-Smtp-Source: AGHT+IFnOSpb3+XAj1dKbSXxUUhTZpVJoK3dKLgr7uSGWR6MrWg71j1v/OVyr1KYDAVEk3F87iiQlDJ7b/Y1qg==
X-Received: from wmrn40.prod.google.com ([2002:a05:600c:5028:b0:438:da36:ed35])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a5d:56d0:0:b0:38b:5e14:23e7 with SMTP id ffacd0b85a97d-38c519698a1mr2951136f8f.23.1738165059058;
 Wed, 29 Jan 2025 07:37:39 -0800 (PST)
Date: Wed, 29 Jan 2025 15:35:40 +0000
In-Reply-To: <20250129-force-cpu-bug-v2-0-5637b337b443@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250129-force-cpu-bug-v2-0-5637b337b443@google.com>
X-Mailer: b4 0.15-dev
Message-ID: <20250129-force-cpu-bug-v2-2-5637b337b443@google.com>
Subject: [PATCH RESEND v2 2/3] x86/cpu: Add setcpuid cmdline param
From: Brendan Jackman <jackmanb@google.com>
To: Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Brendan Jackman <jackmanb@google.com>
Content-Type: text/plain; charset="utf-8"

In preparation for adding support to fake out CPU bugs, add a general
facility to force enablement of CPU flags.

The flag taints the kernel and the documentation attempts to be clear
that this is highly unsuitable for uses outside of kernel development
and platform experimentation.

The new arg is parsed just like clearcpuid, but instead of leading to
setup_clear_cpu_cap() it leads to setup_force_cpu_cap().

I've tested this by booting a nested QEMU guest on an Intel host, which
with setcpuid=svm will claim that it supports AMD virtualization.

Signed-off-by: Brendan Jackman <jackmanb@google.com>
---
 arch/x86/kernel/cpu/common.c | 35 ++++++++++++++++++++++++++---------
 1 file changed, 26 insertions(+), 9 deletions(-)

diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 87ea1a6f7835592e560aae3442bbea881123ac64..e26cf8789f0e1a27ad126f531e05afee0fdebbb8 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -1477,12 +1477,12 @@ static void detect_nopl(void)
 #endif
 }
 
-static inline void parse_clearcpuid(char *arg)
+static inline void parse_set_clear_cpuid(char *arg, bool set)
 {
 	char *opt;
 	int taint = 0;
 
-	pr_info("Clearing CPUID bits:");
+	pr_info("%s CPUID bits:", set ? "Force-enabling" : "Clearing");
 
 	while (arg) {
 		bool found __maybe_unused = false;
@@ -1503,7 +1503,10 @@ static inline void parse_clearcpuid(char *arg)
 				else
 					pr_cont(" " X86_CAP_FMT, x86_cap_flag(bit));
 
-				setup_clear_cpu_cap(bit);
+				if (set)
+					setup_force_cpu_cap(bit);
+				else
+					setup_clear_cpu_cap(bit);
 				taint++;
 			}
 			/*
@@ -1521,7 +1524,10 @@ static inline void parse_clearcpuid(char *arg)
 				continue;
 
 			pr_cont(" %s", opt);
-			setup_clear_cpu_cap(bit);
+			if (set)
+				setup_force_cpu_cap(bit);
+			else
+				setup_clear_cpu_cap(bit);
 			taint++;
 			found = true;
 			break;
@@ -1577,9 +1583,12 @@ static void __init cpu_parse_early_param(void)
 		setup_clear_cpu_cap(X86_FEATURE_FRED);
 
 	arglen = cmdline_find_option(boot_command_line, "clearcpuid", arg, sizeof(arg));
-	if (arglen <= 0)
-		return;
-	parse_clearcpuid(arg);
+	if (arglen > 0)
+		parse_set_clear_cpuid(arg, false);
+
+	arglen = cmdline_find_option(boot_command_line, "setcpuid", arg, sizeof(arg));
+	if (arglen > 0)
+		parse_set_clear_cpuid(arg, true);
 }
 
 /*
@@ -2011,15 +2020,23 @@ void print_cpu_info(struct cpuinfo_x86 *c)
 }
 
 /*
- * clearcpuid= was already parsed in cpu_parse_early_param().  This dummy
- * function prevents it from becoming an environment variable for init.
+ * clearcpuid= and setcpuid= were already parsed in cpu_parse_early_param().
+ * These dummy functions prevent them from becoming an environment variable for
+ * init.
  */
+
 static __init int setup_clearcpuid(char *arg)
 {
 	return 1;
 }
 __setup("clearcpuid=", setup_clearcpuid);
 
+static __init int setup_setcpuid(char *arg)
+{
+	return 1;
+}
+__setup("setcpuid=", setup_setcpuid);
+
 DEFINE_PER_CPU_ALIGNED(struct pcpu_hot, pcpu_hot) = {
 	.current_task	= &init_task,
 	.preempt_count	= INIT_PREEMPT_COUNT,

-- 
2.48.1.262.g85cc9f2d1e-goog

