Received: from mail-wm1-f73.google.com (mail-wm1-f73.google.com [209.85.128.73])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 89F851E520A
	for <linux-doc@vger.kernel.org>; Tue, 18 Feb 2025 18:59:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.73
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739905191; cv=none; b=JfZt48fVrCv/yTxKR60VKxBu/i+qhWfLDrC+uGupcKzy6F5kEoi4yEdUDo5GbgS5ySHdW7f+xyAYhXoEUnUF5Ivionrqrate+fWSbkRqWrvarSTscC1VND9V04TmpC1bBeCnSRp9Z/flNhIPkTW8PitqaNvi5ReW7zTxX4G3srg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739905191; c=relaxed/simple;
	bh=sgcMCXHcqmLD2fAN4moy0mYEbl/nVo/5UuzQ5yvUtoE=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=VrFuqlMb83Fi5SYaOCQJr3jVPA70y6ne2Ff80Ke6+K9Wo1UFi1pFL/Zh5THHk569nWeUCSzpeJ0juJhCgLwmekh5F46JbUlur8oEnOK4lndvFK3r2PoQrqda9JttYULDiLri9dHqiSakarSUY8mKuKsowPjMqlJWQCpbE1qLMB0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ZgA3qEvQ; arc=none smtp.client-ip=209.85.128.73
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ZgA3qEvQ"
Received: by mail-wm1-f73.google.com with SMTP id 5b1f17b1804b1-43995bff469so5940875e9.2
        for <linux-doc@vger.kernel.org>; Tue, 18 Feb 2025 10:59:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1739905188; x=1740509988; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=uLokahsRp/1HhhIeL1ZdoIvCr2+1AW9MZ/zEnvPpzB0=;
        b=ZgA3qEvQsc/IqTB9qmckEKwZBrimrQqNVCszrAtvZuU/eVE6A83EpHQWBc3Ci2r0+0
         SRysxNK2fAD8Ff9D9ow2UytiYw+lIzQTACOmD0GsTNi4T9j/yxrWAgrjBkfUrO34eWLG
         lXiKrf0oC9p3+KM3p1QqqV2tdQv4S9dlzm2xUESjXY8Gf+gOenH3/0YssnyYWQf9enAP
         L6U+V78r23Gtz93AnAREcAcMZgOQDrPa7tzBsu+CVXIG600X4q12tGpbNW6Gs8W0b/Qy
         JMs4BNTUx7n6JpDLuwLsQADUr4/WezEtp9gRhOP2RALaZ6tXgUlN28Uihd6xLobNuUde
         Pubg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739905188; x=1740509988;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=uLokahsRp/1HhhIeL1ZdoIvCr2+1AW9MZ/zEnvPpzB0=;
        b=nSVAVV87/iLhNuOrawJTogHQSMxM3lXj0mFqIqKmYMqHK5qPjBnPMSsFT6adAfLmT3
         Gy9NrHCa4lKZ1RkWgg9oxoRz7xXQkoTY2ogoUDjq19LcgN2E02HSKMEE6llJEPNgDxUc
         gsjDWzIKEjyF6A1dGH8UhWcYs09uXPQSiZwip74036ZacOspVAwrh9QBODpD03ikBEXB
         QjrBta74+KZaQ8fzIc5ybPbK9J1M3ZbS2eex3IAHVrcrMZPA8aL2zLG8tZgMYqQUoeWU
         tmr5xztg4/VBv6IOQRHtahvd5YKzZHk5dPUQIJg7Js3hAgQMZo81+3GYQLd07Yj2pTTS
         /juQ==
X-Gm-Message-State: AOJu0YyJKRsiGX0ZTdL+wUPzx8YwDKPDn3zQp4Ms0A0bhMbNQ7oirmK1
	MBGRA/jY8H6dB2X0wXz6CssLkmvRbBFKTnObZ95OnU3RsTots8D3DDbHfFEdI5C0LrFgqkcy4CQ
	hTzOEU9UVtQ==
X-Google-Smtp-Source: AGHT+IEdNjds1zwEO5M8N/CATJUdsJrMJ0qVNyBBx+DQb42yFggeDOcnhYT/2H2JfwJy3O1KbANvYtULINPbQA==
X-Received: from wmqe5.prod.google.com ([2002:a05:600c:4e45:b0:439:8333:1efb])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:3b1b:b0:439:9595:c8e7 with SMTP id 5b1f17b1804b1-4399595cbb1mr41194365e9.0.1739905187848;
 Tue, 18 Feb 2025 10:59:47 -0800 (PST)
Date: Tue, 18 Feb 2025 18:59:38 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAJrYtGcC/3WMQQ6CMBAAv0J6dk13ISKe/IfxUJa2NFFKWmk0h
 L9buBhNPM4kM7OIOjgdxamYRdDJReeHDOWuENyrwWpwXWZBkipEbMD4wBp4nKCdLDSVkkfVSio
 bI3IzBm3cc/tdrpl7Fx8+vLZ9wtX+OyUEBFKqRD4wMpuz9d7e9J79XayrRJ+cSP7mBBLqjmtsW dcVqa98WZY33aEwQeoAAAA=
X-Change-Id: 20241119-force-cpu-bug-94a08ab0239f
X-Mailer: b4 0.15-dev-42535
Message-ID: <20250218-force-cpu-bug-v3-0-da3df43d1936@google.com>
Subject: [PATCH v3 0/4] x86/cpu: Add facility to force-enable CPU caps and bugs
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
Changes in v3:
- Added pre-patch to cleanup some unnecessary macro usage.
- More cleanups to commentary & commit messages.
- Link to v2: https://lore.kernel.org/r/20241220-force-cpu-bug-v2-0-7dc71bce742a@google.com

Changes in v2:
- Switched from a bugs-only force_cpu_bug= to a more general setcpuid=.
- Made it taint the kernel.
- Made docs sound scarier.
- Spellchecked and avoided new usage of personal pronouns.
- Link to v1: https://lore.kernel.org/r/20241119-force-cpu-bug-v1-1-2aa31c6c1ccf@google.com

---
Brendan Jackman (4):
      x86/cpu: Remove some macros about feature names
      x86/cpu: Create helper to parse clearcpuid param
      x86/cpu: Add setcpuid cmdline param
      x86/cpu: Enable modifying bug flags with {clear,set}cpuid

 arch/x86/include/asm/cpufeature.h |   6 +-
 arch/x86/kernel/cpu/common.c      | 147 +++++++++++++++++++++++---------------
 2 files changed, 91 insertions(+), 62 deletions(-)
---
base-commit: 83f8eec51fc484fe20f8d20171f6d450080c04ea
change-id: 20241119-force-cpu-bug-94a08ab0239f

Best regards,
-- 
Brendan Jackman <jackmanb@google.com>

