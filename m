Received: from mail-wm1-f45.google.com (mail-wm1-f45.google.com [209.85.128.45])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A76714746BB
	for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 09:55:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.128.45
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1787306137; cv=pass; b=dU8PL2QJ1CvspNxaOLtIEpyG86uN7FpuIAd4Zjvp1Bh1RbvgvqpGgJF8WsBRG39MQ8xhIM95ippRXmNof1YGkeoSkak7qQtoiwnrANNcIEoMMybCb/2t/SVzkkufy5QQMgvKxvvJHwa57oLsksNJtdxtRcjoa5/7tyxDm+OiBec=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1787306137; c=relaxed/simple;
	bh=XyIuSqWOzg847lGxsHuF4rkjnY+0QJdXhS5NihM+L/U=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=rLRWHrBaVDqAdgVNJUlUXl28DvgSSTm/rjzySgXlDuB1wFwulkD7GzWEL6mfOEQJtJlxas5SseBHjpVF+ayCdUmF93tN2lCfvEki6fQ2Bh9+X6lvBeoe/9OBPRE/3WOcHf+Fswg2npO+MZD6Np8DHKXrsfgpEYaXjD9mAa6wtEg=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=bPJnchbz; arc=pass smtp.client-ip=209.85.128.45
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="bPJnchbz"
Received: by mail-wm1-f45.google.com with SMTP id 5b1f17b1804b1-495437bb891so4103085e9.1
        for <linux-doc@vger.kernel.org>; Fri, 21 Aug 2026 02:55:29 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1787306125; cv=none;
        d=google.com; s=arc-20260327;
        b=RoidzqgdprcR2sDAPB0TCfARGyCSkXiJF6O/ehi8h6loXoh1oQzf7U9l80Jp1h2AoP
         5DEEHgQ/BgmFxLQUEvsxpDjf3UH2Is3QCYVEoo4TG1t0DwupSvxLcjg7bFbf06fYBgH4
         wPHSwYR7CS9GaIgRcVgNuMOiuV4MPI0dm5AUiKrgDs4UXN5cA95WvzbEULaveqCQCAnz
         l0HOv1zEk0pFqkfAblutt6c5CH4osugOccSgnS/j5rCpZLYDVQNYpf8CaCifeEqnNWoa
         Bau4BgDjFJzas/zmtIvkcpXZWcHl2xrRrUEg9Vv6MC3Wjn8Q3TlaHGCDAO8zmKxT4SHJ
         MnSA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=BebempJ9dvkwz+WZ53hR+1ZE+ffzaH6TRYMnpDAc13M=;
        fh=y5gDEcdnjCtLeAYrAJGx5GKuJWsN1hPyG4pAhLkfHx8=;
        b=mutPgVuxhIcgwXXoAFya6KItT/P6hYYZ6vLak0TwYC2QOU8+r8Q4jaaZV/u+1pC/xH
         2O57lyCWpOjp5jKYFMlkYAcd2XzZDza9/tSgrQ/A4T/+mEKDuznVKokDH6cGs2bZkRfQ
         nyYb1en3F/D1p/HZnkfBADulZk6fgh9AraODqB+tZmBeIAm0HO4tcE5yIiS1Bz6WxNwY
         s/W4+qGGOxZx9ercIwBPCk0QZfHHBqGf/4QI6Zo2BpgFAjss6MhSrnS9pWztUZC9FXMe
         EpvaO86WceKzwiN6UtKLsOnK8YsbS6pSt8x27bRFC4a4FyDL6qnessH50GB4shYOfMuZ
         MWBQ==;
        darn=vger.kernel.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1787306125; x=1787910925; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=BebempJ9dvkwz+WZ53hR+1ZE+ffzaH6TRYMnpDAc13M=;
        b=bPJnchbzuSOsBQ6twubiMhT/NaIJZOyEKXlr4J68Yd45RHQPx215RA/PmCBF7Dq0hm
         xZLjjjSTm6LWXchjg5e90KaoSZGKOur+FjWt1Bpd0+HPH0eenzdKcAlyavI4+Q9MHnZr
         aWO/P+fxp3R95LHkfEvcmSzXxzMW/h8IjzWtCDnst23SxNhQ+D+nVwPuIbwb/nSXkD9w
         cg/kAAvH5OPraqjFQ/y39RSPwBwN6ctYOTr9IseFj6HHoRoZPtYgZUBCpL+ewUmxkLtZ
         xjKRpXTRrhwocQUiIm3ZQE3d9X5TEoKMbBPn301YgpzdJhnTUjwazspiuXhK6rmiA5Pa
         mkHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1787306125; x=1787910925;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=BebempJ9dvkwz+WZ53hR+1ZE+ffzaH6TRYMnpDAc13M=;
        b=Rj4Tm2eG1bLIQaKbRUKAzA9/P7rzS7txDzhRyR8aZ8pc9HgY9eYxqpmRJ0+cT7owT9
         gUsFGZCj1G/CkcANom8dLclErQWMGzzpmXzzG5WIWkuSoxtlvAuf78i5JXy+J9IVOCNT
         8Hh84LWrMHSjNUZpn+1O8vACIsN30UQA88AbUZzxBgOnCAalD1+/xsWmKh8v3aR+5OiP
         /G5PBRM5sDCxekMSSeyfGlBvSmdQdxNu92Z/NbIr4tNTrpqdFNAr/rDNivuSc4rARwps
         03ZZ5mcAXkkjuvAm+XzZqKdMJP/Z1wzg3kJHuVPyWuBNzOHusaeV0fCajACmiK94EySO
         stOA==
X-Forwarded-Encrypted: i=1; AHgh+Rq/6y5RhUD+Erqk9yaGLfQilf5E8/axA71pqLDfbzMw/JwruMjbC3vfqCyjWWfj6hxBGY667wYXIIk=@vger.kernel.org
X-Gm-Message-State: AOJu0YwQ2kEWsiVR5Rcgdjl1QHpnUegPvZOALEc3j5TAHsqrtfBjNLpM
	5MALwAsUwaF8near/cw8To74DbC7Ra9uKM+3diibYkXOV/jI8kp3GQpOXniHf+q45cjc+V8RdYW
	vG6DIXCW62FCr+tPkgww2Mcl/na2S0X4=
X-Gm-Gg: AR+sD11FISWaAErrJ6Py4q8KS7+WfILFXVtJtEwwPEJkHsaLkz+uEEoId17ArgR904q
	fGiOodBVE87aSn5tR7gbm4oAyQ3QzMUC1J/Gnw2l6Sa9Zdb+ks/C7+rpjeeFnvgSADFwuL3O8bB
	sDsEw3g84bUS9a+prznIMW+t2Nb3Owgq0kTEDdUscgHv5Q1zEVnN6ybIjdcSIqxO/iG8cuu3dfr
	NLcDSnSKxxCbIluL5bpNKAO84VPIXQhY1iJv9qGqbGmouGzU4Z7fgcboAcecUV7DAgjrUX4j359
	4XZZ8lKCMBMVKB8upmGseL4Z1a7Fx7l3tT9AF7ZpyUedCLY4Ql0xbNCDOyI5ueQ6/XN4esPekEX
	5TQ==
X-Received: by 2002:a05:600c:4688:b0:499:5f80:83ac with SMTP id
 5b1f17b1804b1-499b91ad940mr38916495e9.7.1787306124204; Fri, 21 Aug 2026
 02:55:24 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20260529165640.820-1-ravis.opensrc@gmail.com> <20260818073546.832476-1-kunwu.chan@linux.dev>
 <CALa+Y16xODsaFZDfh7ZeP3gWbycK92gvP5N8_NFpOvW=R2BWbg@mail.gmail.com>
In-Reply-To: <CALa+Y16xODsaFZDfh7ZeP3gWbycK92gvP5N8_NFpOvW=R2BWbg@mail.gmail.com>
From: KunWu Chan <kunwu.chan@gmail.com>
Date: Fri, 21 Aug 2026 17:55:12 +0800
X-Gm-Features: AcwNN1XF81EEMAI-2sCN9DpjO0D8fvVc3wuFNPsACQIR2_DkOmL8KEG1jq8ABI0
Message-ID: <CAN_Opa_h2W1hRimy2YXPC4EgueCi2UNwnZ5gSYV=cr8M7yfCmA@mail.gmail.com>
Subject: Re: [RFC PATCH 0/6] mm/damon: hardware-sampled access reports
To: Ravi Jonnalagadda <ravis.opensrc@gmail.com>
Cc: Kunwu Chan <kunwu.chan@linux.dev>, sj@kernel.org, akinobu.mita@gmail.com, 
	damon@lists.linux.dev, linux-mm@kvack.org, linux-kernel@vger.kernel.org, 
	linux-doc@vger.kernel.org, akpm@linux-foundation.org, corbet@lwn.net, 
	bijan311@gmail.com, ajayjoshi@micron.com, honggyu.kim@sk.com, 
	yunjeong.mun@sk.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi Ravi,

Thanks for the detailed reply.  The fan-in diagnosis makes perfect sense.

> Your series is based on the v1 substrate, and the way an event is
> configured is the part that moves most.
>
> [...]

Glad to hear v2 is on the way.  The probe-based model is actually
something I encountered while building the AUX backend. When multiple
sources can feed the same region (e.g. PTE scanning + SPE/IBS), the
question of how to combine their reports becomes interesting.

For example, CXL tiering may care about physical-address locality, while
per-process monitoring may need virtual-address attribution.  How do you
see probe weights being determined =E2=80=94 is that expected to be
scenario-specific, or is there a more general principle behind the
weighting?

> 2. The 67.9% drop rate is fan-in, not sizing
>
> ---
>
> [...]

I completely missed this.  The observability framework showed the
symptom (67.9% drop) but got the root cause wrong =E2=80=94 it's not a ring
sizing issue, it's a fan-in problem.  With a single kdamond thread
draining the per-CPU sources, the samples effectively get funneled
into a single ring, which explains the numbers.

The per-CPU drain approach using `system_percpu_wq` and `queue_work_on()`
looks like the right fix.  Our AUX backend already carries a CPU argument
through the ops, so adapting it should be straightforward.  I'll take a
look at your v2 branch and re-test with the per-CPU drain.

Two questions:
1. Is `damon/perf-rfc-v2-08-20-26` ready for me to rebase the
   AUX backend and observability framework on top of it?  I'd like to
   validate the per-CPU drain fix with real SPE hardware.

2. For the probe-based configuration, does the `prep_action =3D "perf_event=
"`
   model preserve the same event lifecycle?  Our AUX path needs to create
   and bind the event during apply, keep it disabled initially, and enable
   it when kdamond starts.

Thanks,
KunWu
