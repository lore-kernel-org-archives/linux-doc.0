Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B611487D5
	for <linux-doc@vger.kernel.org>; Wed, 29 Jan 2025 15:37:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1738165058; cv=none; b=rkia53Y3eAL3VN+wu0TtzN8qsm7IyCQbIm6c7rk7j9UHdRS7whlWAATSFxfsVwnRqtfmBqds8gJVZTZsrH0bfC6pa6rWVurZMx+77+DUM3SFeaL/Ey8LV5gKmStDfc5nisb13phiyd4xb1ESm9vPke8Uj/3WmU/2qB9gB3NYG1Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1738165058; c=relaxed/simple;
	bh=kT+0ZaFnzojzncwz83ZbSFndFMpHLGrjkc+LBrqGIwQ=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=ujyiC1K077eD4Wnspv8DCqITUZ33fmOQo8XQQGT0BY/kpF+mVoyMzwaplhNkpX/npM+TvqhLPPrReZ3pYIfTokrAdQ/I4dd8Ja7mUcC6olDNe3J45+IJqJI56kzgBdGCAhI1x/pAMqMt74hVjp17/PvQceryVqYYcLETNx6I/ps=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=AIyeORkS; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="AIyeORkS"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43631d8d9c7so4654705e9.1
        for <linux-doc@vger.kernel.org>; Wed, 29 Jan 2025 07:37:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1738165055; x=1738769855; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Lt6MMM7vthZjz1QNsRCKcBXabbBVErsDVZyifD1EqTM=;
        b=AIyeORkS+lC7Nl/oegh79yF2v3O46Fw1dKT5mTQaqEWyQsowBX117ARVDZgTWmIe84
         ZwjPnDik60U2AU0w2bo6jefrkxxC/0Fd0RHeYYL8gkiTzvtToqyxnciJ+e9+O0WA9isp
         jgbQhRp7piVt3sXPF+0yrSHxsIwo+lQoLO7HcyPxwUkPvRm7IQME+3JeSPjN0wdEnucp
         0Yqq/gScYfakj0hYRuoUOWTwQOGJaJS/pfAHmyMHuvXCBKHWrP/gnsPgjwp2VUOLFBVf
         RSJ1yx1D+ckf/264fZuZSb7ZElNxDykB75QtxJk1IljE57k0YioH/jWQ8a+GWRdtjEcw
         PIRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1738165055; x=1738769855;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lt6MMM7vthZjz1QNsRCKcBXabbBVErsDVZyifD1EqTM=;
        b=b27Z5q7/0g95u5MBofW4ZZ7y5eneU7tOQ+1Sz5W4P2ogsit+lpLdS/fqA29fn6/1QK
         mn+plHEfQwtwAULledqXPo9Z3OkR1iLfmnB75OcYFuSrFqC82KJcay/KtsSbOBvj+td6
         bMwPwZTUUtoqHZGl5rGDULatk3UQvVahDwm0CVn6VVALN9GwE3w4QAjgwNjWsJdNgqqY
         xAF09e9Gj3jAi9URMAyt91HtoGDls4vhWN5Ao4XI3IKz++0OCku36lLSgfXYZa8KCNwZ
         1cKuiUOImTN/gUnX6+ULbzzyiPO5qtBc4C4amCLYrDmP96z57E0DIwFudIFFXUdBkyKf
         5NtA==
X-Gm-Message-State: AOJu0Yxo2kyn4B+IhdaYKcr+CBOtts856HVVSiPkOWrmVvDHlm9RLaDP
	LLamgb/UZx9ieq5Bs2jBdbn3k36HeOJmpIDd0K059DV8oxllX5C7STakeIljvoUfpYTOIfCsu9T
	JjLm0uFJeiQ==
X-Google-Smtp-Source: AGHT+IEK9zY4V3xSywXIG+0GpovPa1OiGoyTT8PEhTBIxicJqNGO5Q5P6xI4RQ1OsQhNbOzjUxF2tCfksJbwzA==
X-Received: from wmhp6.prod.google.com ([2002:a05:600c:4186:b0:435:4bd2:1dcd])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:4917:b0:435:edb0:5d27 with SMTP id 5b1f17b1804b1-438d5967d97mr73958475e9.9.1738165055016;
 Wed, 29 Jan 2025 07:37:35 -0800 (PST)
Date: Wed, 29 Jan 2025 15:35:38 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: b4 0.15-dev
Message-ID: <20250129-force-cpu-bug-v2-0-5637b337b443@google.com>
Subject: [PATCH RESEND v2 0/3] x86/cpu: Add facility to force-enable CPU caps
 and bugs
From: Brendan Jackman <jackmanb@google.com>
To: Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H. Peter Anvin" <hpa@zytor.com>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Brendan Jackman <jackmanb@google.com>
Content-Type: text/plain; charset="utf-8"

For testing, development, and experimentation, add the ability to force
the kernel to behave as if the CPU has a bug, even if it doesn't, using
a command-line param.

Also do this in general for CPU flags, since:

 - The infrastructure is the same so there is almost no extra
   implementation complexity.

 - While setting random CPU flags is certain to break the kernel in
   mysterious and horrifying ways, this is not dramatically worse than
   setting CPU bugs. Although CPU bug mitigations don't have any very
   obvious ways to break the system if run on the wrong hardware, it's
   still very much an unsupported configuration, even beyond the
   security concern implied breaking mitigation logic.

   Since a taint and scary docs are necessary regardless, supporting
   arbitrary CPU flags doesn't add significant maintenance/support
   burden either.

Signed-off-by: Brendan Jackman <jackmanb@google.com>
---
Changes in v2:
- Switched from a bugs-only force_cpu_bug= to a more general setcpuid=.
- Made it taint the kernel.
- Made docs sound scarier.
- Spellchecked and avoided new usage of personal pronouns.
- Link to v1: https://lore.kernel.org/r/20241119-force-cpu-bug-v1-1-2aa31c6c1ccf@google.com

---
Brendan Jackman (3):
      x86/cpu: Create helper to parse clearcpuid param
      x86/cpu: Add setcpuid cmdline param
      x86/cpu: Enable modifying bug flags with {clear,set}puid

 arch/x86/include/asm/cpufeature.h |   1 +
 arch/x86/kernel/cpu/common.c      | 139 +++++++++++++++++++++++---------------
 2 files changed, 87 insertions(+), 53 deletions(-)
---
base-commit: eabcdba3ad4098460a376538df2ae36500223c1e
change-id: 20241119-force-cpu-bug-94a08ab0239f

Best regards,
-- 
Brendan Jackman <jackmanb@google.com>

