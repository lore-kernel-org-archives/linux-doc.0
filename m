Received: from mail-pg1-f202.google.com (mail-pg1-f202.google.com [209.85.215.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 462B5142636
	for <linux-doc@vger.kernel.org>; Tue, 12 Mar 2024 19:39:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.215.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710272364; cv=none; b=hLtcbeNzl2e/eCN0ehd9lr7vxH2UQAu8ouZL6DPV0MhVf22DU4+Jly/ZVh/CFrq0CDLaAgM3FP/EbqjsOfAz2+wtVc6QZjiSqopy2JOW7fGnOPQTIuEFnxO2KL/lwdFO4QjcRBHM94/5LNNi14vfoPtjXTDWowItuoZhz/73oeY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710272364; c=relaxed/simple;
	bh=d/RZlh/p7Lw4UMD+yfh2uAYxD+niqCzu25XwxbYDRxM=;
	h=Date:Mime-Version:Message-ID:Subject:From:To:Cc:Content-Type; b=XMqXDbUpKoD/d+g6vb0hvzRozXTbJs7sj6qRLnqZn5lYuLNQbbkb+LxyYhqzVYSB+AFZcMYxKSgbwuYxfL+xLGiF8Um2a+75KANSSBYLKIXF1n86b195ru6zde9UbZmGxpOPeresEV8EpaWSqtJAMnE3jvHzCewEh99RcFu2xqY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=rS2iNbWW; arc=none smtp.client-ip=209.85.215.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="rS2iNbWW"
Received: by mail-pg1-f202.google.com with SMTP id 41be03b00d2f7-5ce63e72bc3so4017169a12.0
        for <linux-doc@vger.kernel.org>; Tue, 12 Mar 2024 12:39:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1710272362; x=1710877162; darn=vger.kernel.org;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to:from:to:cc
         :subject:date:message-id:reply-to;
        bh=PE0BxFsqijsc/DHiegQ2xZUP1/bLz9mg3FtR8FbWE88=;
        b=rS2iNbWWUB5iIS5vmLfYbH7UKHMJ7yP/jrXeaQHk8czSm5yHMnnr4Q6nP9UYQBBGmR
         m5FCBEvIiDcgeA3IeGDEjlg1ENIAy9ZIbkqg463yxCS7aszafwLHgLMiOBOeqkSbNduP
         rZO4S64DjewH89+yDHrTzKVbIkqU0Z0AzK0+9PPt+Xey0Nypc90oa8sVV4j1ENFz7DUe
         z5DF+DD0QC5410v8IPHEIsTrOOEwvpXHypSq5GZKz025ZfD/sTmrHPLk7X9zQJzi2jVh
         zVzmwel+FSnqDi5OqmpTv7pjsHja/w1HilhDjVMTbPknBZT3TgPrUqFSVnh6geEeXcwu
         fy+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710272362; x=1710877162;
        h=cc:to:from:subject:message-id:mime-version:date:reply-to
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=PE0BxFsqijsc/DHiegQ2xZUP1/bLz9mg3FtR8FbWE88=;
        b=Acpf/HAUmFzphmvNgH0f2YFoH/1oDQeHb/DFWCc/J6TqUjNyl8Ns65j6dAoN5rTU/F
         b9/RRedt+cyiosuSHQ7nXh+49KmdC0FESLheal55LgI4udMWZCvfwkBErZ5G9Ttn0RCr
         PpuxVYqoPEmDpsmnjpIOy4JNMkWOVKtaN4rxIhWbs5f5KKq72lAXCe5sb0Qg/crJ07XR
         e0iBI2mcmC+LfTDxbk6kBsqEcxdXx5DDV4e66ms+OBe8nXvIsanSQ8dQ8PqKk05L4Dwi
         XPNu5rs5YbEK2iUtksAr8g2QqLF9AD8/+LSthpZrz3DI6a5b3Uvky2EeIDh/xADRkAh9
         LnlQ==
X-Gm-Message-State: AOJu0Yxf6tfUZ5Qrz+gQ281ULfSOS+kYgA3AOWB/LELvSWQsOcaaltda
	VkPPjuEgPrqD3tPPuosOMZoTDxC1DOcCVa+NALLO9IvSiKJFq2rbe6Xnb+DmtCWPBnBx+xY0mb7
	+bA==
X-Google-Smtp-Source: AGHT+IEth0sXa+MFM8dDpSkPk3uejs2rY5crclViUXIf4or2VTiwZwVMTkFa4nNYO7yiMTConwvAiV2iT2g=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a65:6252:0:b0:5ca:43c7:a67 with SMTP id
 q18-20020a656252000000b005ca43c70a67mr24921pgv.9.1710272362441; Tue, 12 Mar
 2024 12:39:22 -0700 (PDT)
Reply-To: Sean Christopherson <seanjc@google.com>
Date: Tue, 12 Mar 2024 12:39:09 -0700
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
X-Mailer: git-send-email 2.44.0.278.ge034bb2e1d-goog
Message-ID: <20240312193911.1796717-1-seanjc@google.com>
Subject: [PATCH v2 0/2] sched/core: Fix spinlocks vs. PREEMPT_DYNAMIC=y
From: Sean Christopherson <seanjc@google.com>
To: Jonathan Corbet <corbet@lwn.net>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Will Deacon <will@kernel.org>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Sean Christopherson <seanjc@google.com>, Valentin Schneider <valentin.schneider@arm.com>, 
	Marco Elver <elver@google.com>, Frederic Weisbecker <frederic@kernel.org>, 
	David Matlack <dmatlack@google.com>, Friedrich Weber <f.weber@proxmox.com>, 
	Ankur Arora <ankur.a.arora@oracle.com>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="UTF-8"

Fix a bug in dynamic preemption where the kernel will yield contended
spinlocks (and rwlocks) even if the selected preemption model is "none" or
"voluntary".  I say "bug" because this divergence from PREEMPT_DYNAMIC=n
behavior effectively broke existing KVM configurations, e.g. vCPUs would
get stuck and become unresponsive for multiple seconds if there was heavy
KSM or NUMA balancing activity in the host.

This isn't super urgent, as 6.8 has a fix in KVM for the over-aggressive
yielding (commit d02c357e5bfa ("KVM: x86/mmu: Retry fault before acquiring
mmu_lock if mapping is changing"), but I wouldn't be surprised if the
behavior is causing other performance issues/regressions that are less
severe and/or less visible.

v2:
 - Rebase onto Linus' tree to deal with the code movement to spinlock.h.
 - Opportunistically document the behavior.
 - Add the PREEMPT_AUTO folks to Cc to get their eyeballs/input.

v1: https://lore.kernel.org/all/20240110214723.695930-1-seanjc@google.com

Sean Christopherson (2):
  sched/core: Move preempt_model_*() helpers from sched.h to preempt.h
  sched/core: Drop spinlocks on contention iff kernel is preemptible

 .../admin-guide/kernel-parameters.txt         |  4 +-
 include/linux/preempt.h                       | 41 +++++++++++++++++++
 include/linux/sched.h                         | 41 -------------------
 include/linux/spinlock.h                      | 14 +++----
 4 files changed, 50 insertions(+), 50 deletions(-)


base-commit: b29f377119f68b942369a9366bdcb1fec82b2cda
-- 
2.44.0.278.ge034bb2e1d-goog

