Received: from mail-wr1-f74.google.com (mail-wr1-f74.google.com [209.85.221.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 311C32356C1
	for <linux-doc@vger.kernel.org>; Tue, 18 Feb 2025 18:59:57 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739905198; cv=none; b=LfQBmu/u07RWUIphyTTMVd8go999Jm8gkSnBhG1D3AM8mhLwqrlQgqMUZEmeB4kGebRN43azIMAfyeeWPni3BiQ6eZNbK1+CvIWUFKhWw/zROwJN35tlDKqgNs/+ralC5eWgovRE3BhW2p0LKuiRINk4FU7QqWjr6tB5KgoUtk0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739905198; c=relaxed/simple;
	bh=ZNsSiv9dPabSYV1NT5C7CVgd2F35GxWJcGw9kJ0uqVM=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Cc:Content-Type; b=tzbtkZJLO+AwoqP0QkOG8Nvvb0VFyd105Xi5tWx31fO05TFpE09kfw/JM2UxDd2fhlex20mLq8lCyPrQppRHy2zqyLP06jTVtPdGDJSvOW6iEmuMREq62CnE8YEYfhPR/981oTrT5+Le7Wl+N5S2Jqemj1lk28E34YZCahzaPN4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=bLEMJesN; arc=none smtp.client-ip=209.85.221.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="bLEMJesN"
Received: by mail-wr1-f74.google.com with SMTP id ffacd0b85a97d-38f4cce15c8so1094757f8f.2
        for <linux-doc@vger.kernel.org>; Tue, 18 Feb 2025 10:59:56 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739905195; x=1740509995; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=yZIMl22pvBjh9ukdMGMiL5tmUUXbduENJGKdJkiqkVE=;
        b=bLEMJesNLmtIC5xhJ0xY4I8UC1EnoyoO6S+ZJQ4OQGqYaLx2vml7rj45hSVNvntNDi
         ukAhUBImFp1Oi+RtBVrry5A+3TAb9kSO0cSsyBEkuoPXFnvbrBw4MSkH5xkEmdsWM5y7
         QQquzZRBmCQNz93ZcUQcxVcsuu6RLISALvJFTG29NiANRRZpIKtP/POiEue2KSz9TrJc
         aqosMKrsIDgKMwxC48ormPbaRZ+BocW1UhSAfqFE8FYguBimN1YoS/rG6Xm1XAKM+3ph
         3Wlkl6m6Qhfbctu0Buf0o0A/2AYwO4DdDVvRBo8lD24KYg6Arxxme/iahu6g9MlAPlCo
         Tx7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739905195; x=1740509995;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=yZIMl22pvBjh9ukdMGMiL5tmUUXbduENJGKdJkiqkVE=;
        b=MRpVfkfwaAPKhZU7EqhwNhkDWOzzN/QOMllAHlT6vEkyJCTeLb2QzU3lp9qpK9Fu1Y
         VRTJ4EBtv+sdDR4Kz2x4W/MW2FPxkbjsiV77D1paNHmufG3Xy2dn0iZrRo6aG3YpoQVO
         uusoCivJogPdCmXk6iUzrFiDQ7LZwczUEHUI1F1psUD4QWGx/8Ugxv4awrIxbXdMKaLF
         fRhxvR7aW3rtBQJRLJXCptB2e0UrCls0c71R90N35yPh2rgBawk2UinehhjnCDYEyUIq
         9gHfYrJyf/aVebRkJP/3x9gEbGVrEZ8gL0pfEJudMr5ShdUIuRBVpZBsfVI/LAeEXCWj
         3tiA==
X-Gm-Message-State: AOJu0YzbKH0s/qkJRx6gHkMar94x8ImOk7kUu6Dh5wZFGFs5iTlWoMrw
	ZeSNTeVaVH4waYM3QCcEUlFuMFjPl3jWgRPQj5EniMf/Ge5at7nApLT7v0ifQZqG82GIxNeQc6Y
	OqsbhnapOlw==
X-Google-Smtp-Source: AGHT+IG4rbFF33bwY+7Q4TkK+fVkXSPgIlC5voC/aq0j1grau+Zkp7FlsAMIN7T6jXyDoCITYekDLRF2fC5fMw==
X-Received: from wmbez7.prod.google.com ([2002:a05:600c:83c7:b0:439:98eb:28cd])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6000:1865:b0:38f:4d91:c123 with SMTP id ffacd0b85a97d-38f4d91c4abmr6491188f8f.32.1739905195685;
 Tue, 18 Feb 2025 10:59:55 -0800 (PST)
Date: Tue, 18 Feb 2025 18:59:42 +0000
In-Reply-To: <20250218-force-cpu-bug-v3-0-da3df43d1936@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20250218-force-cpu-bug-v3-0-da3df43d1936@google.com>
X-Mailer: b4 0.15-dev-42535
Message-ID: <20250218-force-cpu-bug-v3-4-da3df43d1936@google.com>
Subject: [PATCH v3 4/4] x86/cpu: Enable modifying bug flags with {clear,set}cpuid
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

Signed-off-by: Brendan Jackman <jackmanb@google.com>
---

Notes:
    With this patch and setcpuid=srso, a QEMU guest running
    on an Intel host will boot with Safe-RET enabled.

 arch/x86/include/asm/cpufeature.h |  1 +
 arch/x86/kernel/cpu/common.c      | 16 ++++++++++++----
 2 files changed, 13 insertions(+), 4 deletions(-)

diff --git a/arch/x86/include/asm/cpufeature.h b/arch/x86/include/asm/cpufeature.h
index f23942108b85..e955da397e0e 100644
--- a/arch/x86/include/asm/cpufeature.h
+++ b/arch/x86/include/asm/cpufeature.h
@@ -45,6 +45,7 @@ extern const char * const x86_power_flags[32];
  * X86_BUG_<name> - NCAPINTS*32.
  */
 extern const char * const x86_bug_flags[NBUGINTS*32];
+#define x86_bug_flag(flag) x86_bug_flags[flag]
 
 #define test_cpu_cap(c, bit)						\
 	 arch_test_bit(bit, (unsigned long *)((c)->x86_capability))
diff --git a/arch/x86/kernel/cpu/common.c b/arch/x86/kernel/cpu/common.c
index 245807f9351d..08d984ba0347 100644
--- a/arch/x86/kernel/cpu/common.c
+++ b/arch/x86/kernel/cpu/common.c
@@ -1494,7 +1494,8 @@ static inline void parse_set_clear_cpuid(char *arg, bool set)
 
 		/*
 		 * Handle naked numbers first for feature flags which don't
-		 * have names.
+		 * have names. It doesn't make sense for a bug not to have a
+		 * name so don't handle bug flags here.
 		 */
 		if (!kstrtouint(opt, 10, &bit)) {
 			if (bit < NCAPINTS * 32) {
@@ -1518,11 +1519,18 @@ static inline void parse_set_clear_cpuid(char *arg, bool set)
 			continue;
 		}
 
-		for (bit = 0; bit < 32 * NCAPINTS; bit++) {
-			if (!x86_cap_flags[bit])
+		for (bit = 0; bit < 32 * (NCAPINTS + NBUGINTS); bit++) {
+			const char *flag;
+
+			if (bit < 32 * NCAPINTS)
+				flag = x86_cap_flags[bit];
+			else
+				flag = x86_bug_flags[bit - (32 * NCAPINTS)];
+
+			if (!flag)
 				continue;
 
-			if (strcmp(x86_cap_flags[bit], opt))
+			if (strcmp(flag, opt))
 				continue;
 
 			pr_cont(" %s", opt);

-- 
2.48.1.601.g30ceb7b040-goog

