Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 18AC0219A98
	for <linux-doc@vger.kernel.org>; Fri, 20 Dec 2024 15:18:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734707929; cv=none; b=SOD6xawlRQ3TOAlbY8ducJfCsIibVnNovsotAZ+BSFGYOu0EqUyilGluH3sSY7F+d+q5oGAoQJsNjC2monfRPd1S+boBwQqJJpkMTT/CzXp30b3CVB74d4h/41COoWBT7NUFhKVBPk0smYNbO8N3+ZzhXJ/OEwILVUymCARr2nI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734707929; c=relaxed/simple;
	bh=oThVPD2dCz6FEITp98z0p5bIvKwL+bLy4ZZKbY4UMpE=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=E33lpop9EhyUiijm+4s7UoY0/zHEMjbV6QyHWsidoiiBvg4SzBPyORwH4zlk87U9zf1rlaRlOiNTZhlvzRo7F+o52EQvTb2j+8p7keBjIZgW2APftqWuZ0VkePCRMJLc6qmHb5PhDgUXtZXOgNsei9F0cFOPo83nO48BSOP11qI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=TJnHjL0M; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="TJnHjL0M"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-436248d1240so11231805e9.0
        for <linux-doc@vger.kernel.org>; Fri, 20 Dec 2024 07:18:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734707926; x=1735312726; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=TQYPwEi1P8zD0KN4PVlV8UdloBYMnQ3bYGd5a7zJTWk=;
        b=TJnHjL0MiF5hPCoTav/4ZLvVTHucKc1W/cIjVbULFvY3Xtva4p/L7TFpOR6bpd9QU/
         sRd1CeyUnwLxNV9tUMBg6JGlbKwXlx3lSbJbnl1fpUr2D34pugLrJ8O7xXEz8ay2ueU8
         npD8r5Hs5gQGURUpMhakqn3HY+im+hD5Kg9VeL0j1aMO7Y/hGetOLQpa5x5bzoG1o1RD
         eSfghjUo6nerCsVnb6wPiZuKO1Yd6vU+IkWRS2jPZJCwDDRicXVoy0ekDGp0xhtD5nPc
         M+bbJbn58IyWkZ3QSrQhJJRgH4X8Z12QCo3Do5pVsD/kxznuyEVw/MtG9wRflWQRgo40
         XLuQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734707926; x=1735312726;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=TQYPwEi1P8zD0KN4PVlV8UdloBYMnQ3bYGd5a7zJTWk=;
        b=Y43pO+7oA9Sfu8IrzCYp4RZwtQ8Zw1WIKWQy33JqWITLHV4OnNpvuAaJyvotaKHksh
         0voJ/XcHSADKHro5NO6kcwG+2B83dMxWdkc/WLE90qrsxCcWNM1UCo1/b3eee1xnPXkx
         0ydBgacL8CfICZ3ZCE8YglIUPT6htVOX24UzxocHgQuYnlqHoqlFBqXlIywzX9DLm3yz
         LDlh1qj0NusPHQiJKQihEF8p3XQV4NUAMMtYvTUgAY1rb89U2Z0ag+dzbgJYL9uyqbt3
         NmX2b2txhENvDKP1rHmkTFjBYe5VhcCaxDjIEKR8JGH1lXiSwUgcTg4e1T8RTnvZNxMe
         wM1A==
X-Gm-Message-State: AOJu0Yz5xsZQb/9uRlytT0Av2ejoSxc/8D2gLAQHEHWvpwbg1+T60W9l
	n1P451S63corvd4BTqbFFYBpWIaiFkKl0eYJVusXzvlGxxaltbbUdSBHk1NuP133Y44Q5MrXlYF
	GfP4FsfVpJw==
X-Google-Smtp-Source: AGHT+IGJG4Q/geQKLzHCTaktxXnVc3JQRg8i+PPz0xETEOleL/U8DPQLi8R1VX2hC7vhEotKe/pSmReOmJuiTA==
X-Received: from wmbjg21.prod.google.com ([2002:a05:600c:a015:b0:434:f1d0:7dc9])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1c1a:b0:434:f0df:a14 with SMTP id 5b1f17b1804b1-43668548500mr27493685e9.2.1734707926615;
 Fri, 20 Dec 2024 07:18:46 -0800 (PST)
Date: Fri, 20 Dec 2024 15:18:33 +0000
In-Reply-To: <20241220-force-cpu-bug-v2-0-7dc71bce742a@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20241220-force-cpu-bug-v2-0-7dc71bce742a@google.com>
X-Mailer: b4 0.15-dev
Message-ID: <20241220-force-cpu-bug-v2-3-7dc71bce742a@google.com>
Subject: [PATCH v2 3/3] x86/cpu: Enable modifying bug flags with {clear,set}puid
From: Brendan Jackman <jackmanb@google.com>
To: Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Brendan Jackman <jackmanb@google.com>
Content-Type: text/plain; charset="utf-8"

Sometimes it can be very useful to run CPU vulnerability mitigations on
systems where they aren't known to mitigate any real-world
vulnerabilities. This can be handy for mundane reasons like debugging
HW-agnostic logic on whatever machine is to hand, but also for research
reasons: while some mitigations are focused on individual vulns and
uarches, others are fairly general, and it's strategically useful to
have an idea how they'd perform on systems where they aren't currently
needed.

As evidence for this being useful, a flag specifically for Retbleed was
added in commit 5c9a92dec323 ("x86/bugs: Add retbleed=force").

Since CPU bugs are tracked using the same basic mechanism as features,
and there are already parameters for manipulating them by hand, extend
that mechanism to support bug as well as capabilities.

With this patch and setcpuid=srso, a QEMU guest running on an Intel host
will boot with Safe-RET enabled.

Signed-off-by: Brendan Jackman <jackmanb@google.com>
---
 arch/x86/include/asm/cpufeature.h |  1 +
 arch/x86/kernel/cpu/common.c      | 16 ++++++++++++----
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/arch/x86/include/asm/cpufeature.h b/arch/x86/include/asm/cpufeature.h
index 0b9611da6c53f19ae6c45d85d1ee191118ad1895..6e17f47ab0521acadb7db38ce5934c4717d457ba 100644
--- a/arch/x86/include/asm/cpufeature.h
+++ b/arch/x86/include/asm/cpufeature.h
@@ -50,6 +50,7 @@ extern const char * const x86_power_flags[32];
  * X86_BUG_<name> - NCAPINTS*32.
  */
 extern const char * const x86_bug_flags[NBUGINTS*32];
+#define x86_bug_flag(flag) x86_bug_flags[flag]
 
 #define test_cpu_cap(c, bit)						\
 	 arch_test_bit(bit, (unsigned long *)((c)->x86_capability))
diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index e26cf8789f0e1a27ad126f531e05afee0fdebbb8..d94d7ebff42dadae30f77af1ef675d1a83ba6c3f 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -1492,7 +1492,8 @@ static inline void parse_set_clear_cpuid(char *arg, bool set)
 
 		/*
 		 * Handle naked numbers first for feature flags which don't
-		 * have names.
+		 * have names. It doesn't make sense for a bug not to have a
+		 * name so don't handle bug flags here.
 		 */
 		if (!kstrtouint(opt, 10, &bit)) {
 			if (bit < NCAPINTS * 32) {
@@ -1516,11 +1517,18 @@ static inline void parse_set_clear_cpuid(char *arg, bool set)
 			continue;
 		}
 
-		for (bit = 0; bit < 32 * NCAPINTS; bit++) {
-			if (!x86_cap_flag(bit))
+		for (bit = 0; bit < 32 * (NCAPINTS + NBUGINTS); bit++) {
+			const char *flag;
+
+			if (bit < 32 * NCAPINTS)
+				flag = x86_cap_flag(bit);
+			else
+				flag = x86_bug_flag(bit - (32 * NCAPINTS));
+
+			if (!flag)
 				continue;
 
-			if (strcmp(x86_cap_flag(bit), opt))
+			if (strcmp(flag, opt))
 				continue;
 
 			pr_cont(" %s", opt);

-- 
2.47.1.613.gc27f4b7a9f-goog

