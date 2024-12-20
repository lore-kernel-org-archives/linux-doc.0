Received: from mail-wm1-f74.google.com (mail-wm1-f74.google.com [209.85.128.74])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E2D6F2046A8
	for <linux-doc@vger.kernel.org>; Fri, 20 Dec 2024 15:18:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.74
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1734707923; cv=none; b=kGsFwfpbrZbg27q9aqGaJPySBrpl8seB5VBig8UmmSWLB9c0rvv/KoPbhln1eeO9daEnb95uFJV47Og97xMMZUMRQh3m5bjInEuyJYMWa1fXCt29LKNHoQFCg8uKBnxy++TyBqkdQZCHz6bFE0dEHxHafAzh9+X/Iq2E33SztvE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1734707923; c=relaxed/simple;
	bh=kT+0ZaFnzojzncwz83ZbSFndFMpHLGrjkc+LBrqGIwQ=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=cXwGMnuoCqp0JC7QwYT04l7wS98y10CclCBt2oXdwEpzVjAoAAvQORDWi3rLq+3AGUL+ryJQaRhN7fRddedMZ/z5I+3Uv6P2w67aYk0+cVJ2SHpbqOBj5IODv17OJEYPeqyzQDzY93kPBhBNZ4K+yHcQbbiJJQRqW+VrJQVykTk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=Z9grqQoH; arc=none smtp.client-ip=209.85.128.74
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--jackmanb.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="Z9grqQoH"
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-4361ac8b25fso11833335e9.2
        for <linux-doc@vger.kernel.org>; Fri, 20 Dec 2024 07:18:41 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1734707920; x=1735312720; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=Lt6MMM7vthZjz1QNsRCKcBXabbBVErsDVZyifD1EqTM=;
        b=Z9grqQoHYzPyZw5MBr3dMPOuWabmVZ9ifgJAZ+cDahPDJtwgp1P3YYKZSts2tr5NWb
         RECqr0JBtePrP4htTzA8Lk5eMJHHDq1hqFlIrpLgm6c77kJco1kR7a1zlZ5+y9YoPP44
         SQ0/Cg3IXU6xxCVveKe8oKiHyJUPHX71i7WI7/MQ2B0Sb1GLTqBFeedW7NbsvDtRWrUQ
         TuRkAn4B1viGjCh03t+fLnxgKG2xhzpsYIjWEwAMbTnWnf4BGdquQRc5xXCg9KYwxbNa
         DIhEaSuFJG7AO3mqw9z/5QgRHzHIW6WL8bQ3MvZYL8eBIPRdYJZQ+qZ62Fqvdps6S8c6
         WKpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1734707920; x=1735312720;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Lt6MMM7vthZjz1QNsRCKcBXabbBVErsDVZyifD1EqTM=;
        b=oya5USoKK0O25PI/MpYBYihqv0ugLrueUYAHTdOJEX5nfrJJa+yN3Ovt5l7n/9Im6S
         sHJV6+suPWR5bHk2JEMJRXd65+mfB0EiNKyLWQgDqT14+azFZTqZar/3j4B2559yARO/
         zLXR0vbd5G7ofwi19FhuqJr6rkA3AoFTfHeBXoPo3vGQq9ONNrqKdfE6Gd80cTB5pnZR
         nYAKiMC1Zxjd8zbHTEarks33R2uoUgHZHQm8uhTLA1KdVcIaXTmmkVm2ZlBMmvtRZ/tl
         3pXcxJIEhJHjTC7fJBDSkuKTAldkim1ccTlSP1UW36xiz+uDJKk7z6MQoa6S6Ml735nC
         /KNA==
X-Gm-Message-State: AOJu0YyZx8ouJ4fSUCDjm9zkMXTJxf1NUVPmZUSyQZ7GCRwUaHo3924/
	btKTpadbTwK3wRO9JRGQ6IjjbF5/J9Ii15i0gQeWRkJkU6CM75gg0EfKzet5tKbGFfVYRqxmTdT
	woludn2JXdw==
X-Google-Smtp-Source: AGHT+IFV3OVoNdqsH3clvEQkEUgwcnmbDXNLUOkyHvfQAIA/eCl+Qp9spc8gNimBTABhYAKQft/6hGTyksERvw==
X-Received: from wmqa10.prod.google.com ([2002:a05:600c:348a:b0:436:185e:c91d])
 (user=jackmanb job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:350b:b0:434:f8e5:1bb with SMTP id 5b1f17b1804b1-436686430a2mr30731005e9.12.1734707920401;
 Fri, 20 Dec 2024 07:18:40 -0800 (PST)
Date: Fri, 20 Dec 2024 15:18:30 +0000
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-B4-Tracking: v=1; b=H4sIAMaKZWcC/3XMQQrCMBCF4auUWTvSSYsYV95DukjHSRrQpiQ2K
 CV3N3bv8n/wvg2SRC8JLs0GUbJPPsw11KEBnszsBP29NqhW9USk0YbIgrysOK4OdW/asxlb1Wk L9bNEsf69e7eh9uTTK8TPzmf6rf+kTEiojOmIT0zM9upCcA85cnjCUEr5Agb5XZarAAAA
X-Change-Id: 20241119-force-cpu-bug-94a08ab0239f
X-Mailer: b4 0.15-dev
Message-ID: <20241220-force-cpu-bug-v2-0-7dc71bce742a@google.com>
Subject: [PATCH v2 0/3] x86/cpu: Add facility to force-enable CPU caps and bugs
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

