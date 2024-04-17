Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 149E3364
	for <linux-doc@vger.kernel.org>; Wed, 17 Apr 2024 00:15:10 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713312912; cv=none; b=AvfuAQwGcZLdDERC0IjRcYs7Dhz156TDvFxD44pjlbIS3QkRLTESQXpvAowak4eZu4wOLkqymPzp7QJ3y8wbz2c6syoR2V0HNcrA1S5brfCu/G/1eok8C74p3DF+IwFLgm9jzWNYF7LL/+tyUjjanRaDYDqJucFnva6NGfz9AEM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713312912; c=relaxed/simple;
	bh=yXOznEMjUaHsSz2UyCDB+IdA+tJMf00GLmlQT2osTQc=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=M9DFkpRLmHoKFjZuKYV2ly5qcMznMImrizqvic0nIqofFegaphJHHp7a8hRXH12J1fFFfQv/UOuPwVUf0MAtkwDlTetQYGCvWP+5xgxNYW79ZDt9rSCn39Mj+1Fm2qjtd0mSxzmykyrK7JCndPyeJC7A1D7nWCea+kPsTX7Zj0s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=1TMTNnk9; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="1TMTNnk9"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-dcc0bcf9256so7009286276.3
        for <linux-doc@vger.kernel.org>; Tue, 16 Apr 2024 17:15:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713312910; x=1713917710; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=GlkW+nIwVSw4BTVsNXamCh2hwkYNTyK7FnVS567kQj4=;
        b=1TMTNnk9rAGlnCV5sBLcVdkj3DKZye7ISyq64C3HQv5idgSuUyf4gmIvcqovTmoYMj
         /lxxLxf69XKJl3TWaBoI2mv7ePH1SVlqzFkgjC8adsIlCqEaUCu0bKTx3fajvP1zKog+
         hMnoKgcXk4GUIDGqSHCfEZxHNqqize+p3raApoaGe4WyUcmB6le1icu4V3QgyzgGyVUi
         c+WB5eWje8MhImx934DXtWcAukBmM/oG5399eTe3NvbmhO4uTMnNOVw94y4849GfmycK
         cj7Y0cOxwVsY5SUi2JtVE1KZ8MO2bW3YBN4inOqG6j1sv2E3NJmakTrcNwR93wudpqLf
         kxvw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713312910; x=1713917710;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GlkW+nIwVSw4BTVsNXamCh2hwkYNTyK7FnVS567kQj4=;
        b=PQGnex8k4jD3IcnCxpykjlWfOA3+1TPxxhCYiqXYuhOYyebzePtvQ7SVtQ67cKGGBs
         tHmg6b89FLtfCFrppI8vL0Wg5C8PzZMLA6LhYJxnqWsysS9kGzul/1FQqt4osriWBcOI
         2601kBefifCBYO+27BcTPYf9hpI+0CwJEbC3OEAP3LedXoXnrMnIB8wyX9w3s0/5xaeB
         7a00Xdwe14oKhzktYrwd6ib2wr4WpIOIh+xoi9Ye38Tw+l3gcgQ+iPRNmEJdek3kKAK6
         fP59x/U2lPxm6i6DaCvAkS476ZR7q/umQtGkexg51bo++UYfpNYg1H0CCR7yD0dsOEzG
         2d0w==
X-Gm-Message-State: AOJu0YzM1PaEXDJaLXiNtHziDyAmhe5BaA4tS5gLZhgIebhBQ8Pj5ptw
	00RIQxIa72dxAEc5R2gOOddPy2+xU+21DCkAT0C5NCTiL7rbtJdWx1cYN5Zfhx236DQ8Uq+JZSZ
	Bwg==
X-Google-Smtp-Source: AGHT+IEdmf1SGIjHtSCIoaLgYkiimkweLFjtKb7IDa4/RKIuG/9GEHrLiSYMXrVfP+zURKA6f1KCN9rfg1U=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:c13:b0:dbe:30cd:8fcb with SMTP id
 fs19-20020a0569020c1300b00dbe30cd8fcbmr953201ybb.0.1713312909965; Tue, 16 Apr
 2024 17:15:09 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 16 Apr 2024 17:15:05 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.44.0.683.g7961c838ac-goog
Message-ID: <20240417001507.2264512-1-seanjc@google.com>
Subject: [PATCH 0/2] cpu: Fix default mitigation behavior
From: Sean Christopherson <seanjc@google.com>
To: Jonathan Corbet <corbet@lwn.net>, Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, 
	Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Peter Zijlstra <peterz@infradead.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Stephen Rothwell <sfr@canb.auug.org.au>, Michael Ellerman <mpe@ellerman.id.au>, 
	Geert Uytterhoeven <geert@linux-m68k.org>, Sean Christopherson <seanjc@google.com>
Content-Type: text/plain; charset="UTF-8"

This is effectively v2 of a previous series[*] that was intended to be
x86-only, but accidentally disabled CPU mitigations by default for every
other architectures.  Unfortunately, the buggy code has already made it's
way to Linus' tree.

Patch 1 fixes that goof by adding a generic Kconfig to control the
default behavior.

Patch 2 disallows retroactively enabling mitigations via command line if
the kernel was built with CPU_MITIGATIONS=n, i.e. with
SPECULATION_MITIGATIONS=n on x86, as it's infeasible for the kernel to
provide sane, predictable behavior for this scenario.

[*] https://lore.kernel.org/all/20240409175108.1512861-1-seanjc@google.com

Sean Christopherson (2):
  cpu: Re-enable CPU mitigations by default for !X86 architectures
  cpu: Ignore "mitigations" kernel parameter if CPU_MITIGATIONS=n

 Documentation/admin-guide/kernel-parameters.txt |  3 +++
 arch/x86/Kconfig                                | 11 ++++++++---
 drivers/base/Kconfig                            |  3 +++
 kernel/cpu.c                                    |  6 ++++--
 4 files changed, 18 insertions(+), 5 deletions(-)


base-commit: 96fca68c4fbf77a8185eb10f7557e23352732ea2
-- 
2.44.0.683.g7961c838ac-goog

