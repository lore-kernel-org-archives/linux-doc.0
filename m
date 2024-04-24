Received: from mail-yb1-f202.google.com (mail-yb1-f202.google.com [209.85.219.202])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2AAA3134A8
	for <linux-doc@vger.kernel.org>; Wed, 24 Apr 2024 20:08:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.202
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713989309; cv=none; b=ZAy9fdiALIKMqXQWxOgf8P36cqqjj9JbKlcDeSKJ4rQ//DjmrUTPSsm3XsIIbjmaxsQ+J1ahlG1ohQspfRTANSR6gj722WBnhWWzONgIiwfP09CziXP7QfA8Hdxd7XD6KN+qiG8iAcPFCXe9EzfaXyKmIfgmF8cJ7YXzZNNVjCk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713989309; c=relaxed/simple;
	bh=ZXA05vWwppvfKGmWl6KvLrJGCoXq08GYIIth6Ksq5AA=;
	h=Date:In-Reply-To:Mime-Version:References:Message-ID:Subject:From:
	 To:Content-Type; b=enDVI9aCojdN7b5ATkr4knuHO+pYh4HLX+fWfl0hPdIiPpDxMGib5DoiCfH7kkXQnK6Fmb8fAqCNKR/0i1kwN4Jw4K8Np9UF78I73WvlBNvTph4YQtH7TJeAQd7O3IpApXff+XIsLr3/TJLxs+Ns1YOOiZ2nsSuBJoBauSGt8to=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=0/YClhcK; arc=none smtp.client-ip=209.85.219.202
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=flex--seanjc.bounces.google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="0/YClhcK"
Received: by mail-yb1-f202.google.com with SMTP id 3f1490d57ef6-de468af2b73so587919276.0
        for <linux-doc@vger.kernel.org>; Wed, 24 Apr 2024 13:08:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1713989307; x=1714594107; darn=vger.kernel.org;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=HGZlLLr8BqiEcqBx2odquSEZ1yv8/L1paDfyotkaF1c=;
        b=0/YClhcKnsTNO639LjiqgFcYPDCIG5cmK9+bqvrq3jAxz8XqPEkXiU91xX+Be2n4I3
         fhVyvMwROMEfWBipxSUZD6SBQNDvwESevhXuXiKqkQf+z7Jcro3r14QJiKF4MAR70T+Q
         PN8ZqaGGfObS/KVEFia3+I14ldCXmTlf4fsO7OfJjqTx1czmQaNDsr9MHQQiDInY2GBD
         EnMTbaNIE0QHt4DaM3cKXkoBGNW2W0tRS8X83v5kRsdiQSBAjjwCHwoy2hZMBy15d/a2
         MGlnEyAkEryx0R858NBk8EpXH97XF2cYpJ+vHxUj/JsE0EQT4OC4thzQOEXWPYaipYIE
         VKNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713989307; x=1714594107;
        h=to:from:subject:message-id:references:mime-version:in-reply-to:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=HGZlLLr8BqiEcqBx2odquSEZ1yv8/L1paDfyotkaF1c=;
        b=VcIh3uU0EJlmBzKWiiX34tnL3X4WaSiUhwEK5Kvr22PIpMOq6uHPzcnfQRybu43gx0
         +Mdh00bzUvwSeUnogqIyD1Dr+uALvpq/oL11jxg6VrbmCe9rR5hm27EzA9KHapbzE61s
         wmrpyCzaWlR3n2YNmE3GEOkYiT9KjtGdZnkyC5gq2ZVSO4266UTTIHh8UznbhIVEoLgA
         a6UQLpaRBI3BTXkaJQk8P0rZalQ2ee699YjheHurzyktEr35Th41adnNoaZK1WFL+8Tk
         0r/NWsLDv5pqjQ4U6uErQjnd7HrG5RjvV/Qfr3ekskHqkzZWGUDKgQs4u+UamPlyU/ZT
         vNPw==
X-Forwarded-Encrypted: i=1; AJvYcCW+gAsCnpvo/rdWtyJ7JdRDlYPm4L1oKjEtiCD2ne0nSBJBZwnc0nfKN0es2gpNOUm7dMhbpHd9KlgJ5H3rfNZLH+ql5U7ODKCb
X-Gm-Message-State: AOJu0Yy0YCoK79Q5/FoWwY5W8mbLxLndLlN9yaswzO2IvL69ySKPRRm0
	1oaoG7UJCUjN7vyNrBrMZbcWs8dfBWyEtUiV/ppla5WiZPgf7Ni+HqZviXgrQuLBheOtfTcgsAu
	qyw==
X-Google-Smtp-Source: AGHT+IFoezGpyMjORI1buq2R3SY9XC35A/qnSW6PxgRRW8wGtbpVu0TKFwDZi+EFNNGWn5X1AMfkiXqVd8Q=
X-Received: from zagreus.c.googlers.com ([fda3:e722:ac3:cc00:7f:e700:c0a8:5c37])
 (user=seanjc job=sendgmr) by 2002:a05:6902:150d:b0:de4:77ab:5fea with SMTP id
 q13-20020a056902150d00b00de477ab5feamr1090278ybu.2.1713989307164; Wed, 24 Apr
 2024 13:08:27 -0700 (PDT)
Date: Wed, 24 Apr 2024 13:08:25 -0700
In-Reply-To: <20240312193911.1796717-1-seanjc@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
Mime-Version: 1.0
References: <20240312193911.1796717-1-seanjc@google.com>
Message-ID: <ZilmuTJzyk7U-Kul@google.com>
Subject: Re: [PATCH v2 0/2] sched/core: Fix spinlocks vs. PREEMPT_DYNAMIC=y
From: Sean Christopherson <seanjc@google.com>
To: Jonathan Corbet <corbet@lwn.net>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Juri Lelli <juri.lelli@redhat.com>, 
	Vincent Guittot <vincent.guittot@linaro.org>, Will Deacon <will@kernel.org>, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, Valentin Schneider <valentin.schneider@arm.com>, 
	Marco Elver <elver@google.com>, Frederic Weisbecker <frederic@kernel.org>, 
	David Matlack <dmatlack@google.com>, Friedrich Weber <f.weber@proxmox.com>, 
	Ankur Arora <ankur.a.arora@oracle.com>, Thomas Gleixner <tglx@linutronix.de>
Content-Type: text/plain; charset="us-ascii"

On Tue, Mar 12, 2024, Sean Christopherson wrote:
> Fix a bug in dynamic preemption where the kernel will yield contended
> spinlocks (and rwlocks) even if the selected preemption model is "none" or
> "voluntary".  I say "bug" because this divergence from PREEMPT_DYNAMIC=n
> behavior effectively broke existing KVM configurations, e.g. vCPUs would
> get stuck and become unresponsive for multiple seconds if there was heavy
> KSM or NUMA balancing activity in the host.
> 
> This isn't super urgent, as 6.8 has a fix in KVM for the over-aggressive
> yielding (commit d02c357e5bfa ("KVM: x86/mmu: Retry fault before acquiring
> mmu_lock if mapping is changing"), but I wouldn't be surprised if the
> behavior is causing other performance issues/regressions that are less
> severe and/or less visible.

Anyone have any thoughts on how to move this forward?  I have a hard time
believing no one has opinions on this code :-)

> v2:
>  - Rebase onto Linus' tree to deal with the code movement to spinlock.h.
>  - Opportunistically document the behavior.
>  - Add the PREEMPT_AUTO folks to Cc to get their eyeballs/input.
> 
> v1: https://lore.kernel.org/all/20240110214723.695930-1-seanjc@google.com
> 
> Sean Christopherson (2):
>   sched/core: Move preempt_model_*() helpers from sched.h to preempt.h
>   sched/core: Drop spinlocks on contention iff kernel is preemptible
> 
>  .../admin-guide/kernel-parameters.txt         |  4 +-
>  include/linux/preempt.h                       | 41 +++++++++++++++++++
>  include/linux/sched.h                         | 41 -------------------
>  include/linux/spinlock.h                      | 14 +++----
>  4 files changed, 50 insertions(+), 50 deletions(-)
> 
> 
> base-commit: b29f377119f68b942369a9366bdcb1fec82b2cda
> -- 
> 2.44.0.278.ge034bb2e1d-goog
> 
