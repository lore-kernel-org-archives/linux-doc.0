Received: from mail-wr1-f73.google.com (mail-wr1-f73.google.com [209.85.221.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EDBA9218EB8
	for <linux-doc@vger.kernel.org>; Fri, 20 Dec 2024 15:18:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734707928; cv=none; b=I9BKn/qHMc6uWp9J+XeX+zmohVR2VIqsaomLFQSf0lvLNBMQbU7sYJUXIsQaxxc26lMO/pGW/37IACqKMhL8T31gD1zPHUtfTwE8YX5jX4W81/jCHci9fC3ibHsHVYRYfwwD6pC5SNr17CfT6NqmzWIVnjvwj73TgmkO1Od+pew=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734707928; c=relaxed/simple;
	bh=AWK+7iN53OVaeFVDPrERdrguHzQlAh78pqE6/4zjd60=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=gi4NW4IxC7Wk6Q7gxenNbtjwt7YhcuCJYxYWtG/aZWRvelNP+mauC3zbPRA+JxX8jfhmpiH4BpeaLCoRnFI4uyzS5rnagy/NX6R50pdZQsMn4tKZGy7xtb8fQ8uOFuSf02SE4EfXZEyuodRKBXash8pA1jX+TS52+1qmTz1wgXY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=azLkLT+B; arc=none smtp.client-ip=209.85.221.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="azLkLT+B"
Received: by mail-wr1-f73.google.com with SMTP id ffacd0b85a97d-388d1f6f3b2so1029616f8f.0
        for <linux-doc@vger.kernel.org>; Fri, 20 Dec 2024 07:18:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734707924; x=1735312724; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=qWPOc7xIhFDGLEtk8GLKpv1buFdXWfkpopummLRHjqA=;
        b=azLkLT+B8yNqTR6x59xcmOxjU5aFGs5yF8onyY8auLI9iIpsjTKgdxHT8vzjO0Vtpe
         Yqcf2G42yx0tUbrII4KkBmpxY2/+9urQlgbHQt+D4JW5vFDKprnHwiGxZsdnnv3XjGw/
         gkfWUXskGfGmUDV6WB4Dy3avF0678BD1+iYwDm7PMsU/443H30llyD8wsijmvqfMKYCj
         akqdYFFEmTko2m2aDZ8ROUlEu6mjQVLls8nEQ/gDS7UqUyHVWDSKltSVFmSPiYWIlOFd
         QX+Ea1c1H9QLr0WKlGyuaypZkyp36SayuZIHouZCd6j0Ugdw2HqN2MapFsqRUJbET5LF
         /UXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734707924; x=1735312724;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=qWPOc7xIhFDGLEtk8GLKpv1buFdXWfkpopummLRHjqA=;
        b=tuGUOvuxeqBqAGZrfBI24ZJUEpPaDuHJU6MisLGe6HWG/1UjQlDwUDmioIpuoKe7gX
         HuovB5eC5r9qppxcArDebThtkbo1Sbzu1nrxkzTzZZ7ECdHlqBo5+74XtZuPO/Tt/rHv
         cuNVGcANDaczBmXWHM5psyaqpcsks3YOOoLi37mqxCQc5aM9mWm3wmW8F+6/mBit7DrQ
         sU93M+x44DGNdjpNFL6c/lCRbbwvAT4eXxnFUq2CRAyg5RoHi2dS1cAoci0golbqEHsc
         BbH+7AeAUMSAxqyIFuUObi89u0ddfnEliYReiCU79CGy02V/CLqVI9R+DC7+hIo7Wwje
         JCeA==
X-Gm-Message-State: AOJu0Yyv06bB+a852ixCd+mUYdoyLfLbeyh/5ANi9xiW98D783HjLVtk
	R3HdD+BrTXt59abfCP1tGm1uAORuq44a8wEYOntuzwI/ZKx9sa+68jSakgz1r1k9MYtezU9A1JH
	JmxK+lYatLA==
X-Google-Smtp-Source: AGHT+IHnM4cjBLpNbxQ4rYKl46Annm92PyUUmtYKAGk/2xW5saX0wCnE+zSeqfN9yYDNkWVjwMa9sQrNHEDx7w==
X-Received: from wrbgx10.prod.google.com ([2002:a05:6000:470a:b0:382:2090:8340])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:70a:b0:385:e0d6:fb48 with SMTP id ffacd0b85a97d-38a221f109amr3277616f8f.7.1734707924367;
 Fri, 20 Dec 2024 07:18:44 -0800 (PST)
Date: Fri, 20 Dec 2024 15:18:32 +0000
In-Reply-To: <20241220-force-cpu-bug-v2-0-7dc71bce742a@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241220-force-cpu-bug-v2-0-7dc71bce742a@google.com>
X-Mailer: b4 0.15-dev
Message-ID: <20241220-force-cpu-bug-v2-2-7dc71bce742a@google.com>
Subject: [PATCH v2 2/3] x86/cpu: Add setcpuid cmdline param
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
2.47.1.613.gc27f4b7a9f-goog

