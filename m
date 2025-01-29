Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7CE8B1DE883
	for <linux-doc@vger.kernel.org>; Wed, 29 Jan 2025 15:37:42 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738165064; cv=none; b=MGdKOZ8d0yaDJEF2Xs0SZfAuZ4PQ+F4HxDJ+0JznkEDmrwmzDdp0RJZXuLH+vY6EWwt0f/ij1DuJzfR2i4rajCpmncgaU97puZCAVn9+292AHHMtlk/82i3fah28qLPSO9qzjWFmZUnRGQC7D+Gedc3Jiy+xXEVzzHk8chr8DkQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738165064; c=relaxed/simple;
	bh=shB99yKi5vWEH+8+OXtdyhEm1G9t9Sk17HD6+WU+oX8=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=TQNCDpr6eMrDahS2oXBf7MWLpNdPPsVBAXzL6iUuZggsJhD0eOQl10AMnD17aRPvTK+2jB4VpINnCNeQdt5hsW45Ibd7Xb1OuH1cI6jpMH4rD2RTkkFrvr0SdmGlauncY9wTtLeNIakOc3TUqL6Zr3yhNH9RwNvrrjh83XzO/aA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=FU/ATliR; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="FU/ATliR"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4361efc9d1fso54014665e9.2
        for <linux-doc@vger.kernel.org>; Wed, 29 Jan 2025 07:37:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738165061; x=1738769861; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=0WkGn8BdmJiDbCxxoZ+/ZnfVoLZzk2No95ZbwF5AtQQ=;
        b=FU/ATliRO8lj+QyF3blotutTgcLDW3QGgECYL3jjMvMHwbFWqJ5NFp8lOdUW22K/bi
         iOtTxWpeKgonMwqIhXk1cAFIf+wfwr0U70687a6kzppVpM6H6b5hOBKKurtYDyo2z1Rx
         5pBjQ7yDenwFmlatQxO0M4gsi9jGDLRbWt0NIVzT368dkf0WgdXDdE9cyVi3h64m0FkF
         ZxcgH+5IWcYRLVcvGbbBaEFiHg7L5QYNnk1RuNDhZU4kL9xsTT4tGGCxFjOt6Nr8cQG5
         77zY6mp2RAYqCrDEpjX1l5QDskitzAtmap5tIWVMOpnP4WyBP1c5w8HOTlPpXO7KaraN
         2KYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738165061; x=1738769861;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0WkGn8BdmJiDbCxxoZ+/ZnfVoLZzk2No95ZbwF5AtQQ=;
        b=e49UF9cynzMebava5q89MDA2DN17vwV8KOAAD7Ixhk4HWP3lAwMIV/SbB2WaY+Y3Nm
         TwsyCKvEEy+1b/XMFwY0Y1k9qcfohhYo29iE1TDTT63GMogWlBddOl8iTwfLmhWAgkuF
         fQnRDWlk8zFzxQOtayTBWHB6nxCbnz5xgFheNP34QHS1pgg05Qpw9AsafGRjv9g+a+2N
         /5dUHZNmwDi5OGfB5CjTWy1l9zpbqBqxcH9byq/yUk7nQk9VBb6FzHzZomzJtjEOerPH
         QZQHEJycK9EYMto5vLxA8Hg0GCQwJKE7BDw+ReyRHfO48UBxDGFif2tpr2IoUq1LuIYE
         KNqg==
X-Gm-Message-State: AOJu0Yxy/BH82bH+EQ5XM/hjuIo/kPmkJk59dqdSMSsofjwoD5flTLT+
	udcGlgnbjFEnjILCLMi+wS3w15Auk9VG7eDgAMvrdbcJRzARNSuuBFuu7yBVaplePdNa4TBkRqJ
	dMS4XgnwMmQ==
X-Google-Smtp-Source: AGHT+IFK6Tt+YJvPuuRl3HlxobT9+iPyETyzyxGNBZNhBzoy5JLYkUOI7BUveErMjhcLXbOkzUc46yGIxkQArg==
X-Received: from wmbay29.prod.google.com ([2002:a05:600c:1e1d:b0:434:f018:dd30])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4f15:b0:434:a30b:5455 with SMTP id 5b1f17b1804b1-438dc41db3dmr27860695e9.27.1738165061056;
 Wed, 29 Jan 2025 07:37:41 -0800 (PST)
Date: Wed, 29 Jan 2025 15:35:41 +0000
In-Reply-To: <20250129-force-cpu-bug-v2-0-5637b337b443@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250129-force-cpu-bug-v2-0-5637b337b443@google.com>
X-Mailer: b4 0.15-dev
Message-ID: <20250129-force-cpu-bug-v2-3-5637b337b443@google.com>
Subject: [PATCH RESEND v2 3/3] x86/cpu: Enable modifying bug flags with {clear,set}puid
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
2.48.1.262.g85cc9f2d1e-goog

