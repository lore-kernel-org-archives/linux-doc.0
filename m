Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=170.10.129.124
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792844015;
	b=Q4nhQ8BJBmbZit4I50rABVvPFZiXxKftzNksfUs1GyxM0ipGKtkQXpVwQQdPJtUQ30NV
	 EUAQHnFhwRK+GTgV0ZZzmoCEJiiB00hQU3VFn0M2pLYBNVr26Yl1yJAyO2DjlYVMC6PBd
	 EA0APvtX8IRljiI8xirBBbqwBV5VcCRDGTns1HV0vCp25DuguZhTCYWPaLGTtZOONQ+me
	 ru15IDU/foFBzuxhmJ3X6aolx/MnUM96NaygtYmvY1dJmZG+jvFFK97563CkeK7B/JSJf
	 H5pmpI+gMDyhfKSTqwTsvZJoQQUPXH2Ps4Dan9+8eLEdgaiXXc6IrlRq/3XEE5tu64A==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792844015;
	h=DMARC-Filter:DKIM-Signature:Received:X-MC-Unique:
	 X-Mimecast-MFC-AGG-ID:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:
	 X-Received:Received:Date:From:To:CC:Subject:In-Reply-To:References:
	 Message-ID:MIME-Version:Content-Type:Content-Transfer-Encoding;
	bh=c4C00/XzUMl81Cb9nPtDyYxb7VozrfQ6cNr56bWwPUU=;
	b=fDuhjB3A1ukpx7VYKV0Qwr9mHfmd1ncCyHFQV6LDECFV01tLwYZQ2HEmXb7/11wmTyfA
	 NX7Y1WCMbkQdp67YtqqSseCcTRWKcx+9xaTDJofZC+5reusiwKFPRXJqIarFSHbaj8sXf
	 H42r+i7zuypt9ejLpRrUJlMuC3FlLwq2wOBlqZdL2J8/WWG4m6ZXfJuXhelnzGQ5ulZXg
	 PhJ6QXkYxc44FJ4sRj44pAfPRasehLNdRucbL5NMDmuK+TJ96+xLjwjXvZDK8tthcWtRu
	 bTG/EFLXdOUBprFG1qxEhM5qiPDBMPYNMBKVAKF1BpUpmdr5HS/RYZfgUlHd98QkSsQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=redhat.com;
	spf=pass smtp.mailfrom=redhat.com;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=f3utQIMW;
	dkim=pass header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=WBWKD0AE;
	arc=none smtp.remote-ip=170.10.129.124
Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04FB3606A31A
	for <linux-doc@vger.kernel.org>; Sat, 24 Oct 2026 12:13:34 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 04FB3606A31A
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=f3utQIMW;
	dkim=pass (2048-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=google header.b=WBWKD0AE
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792844013;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=c4C00/XzUMl81Cb9nPtDyYxb7VozrfQ6cNr56bWwPUU=;
	b=f3utQIMWLHLjpbX5nOjgWSn+cXimlbHwlaWomtX1SoudbPm5IuJ1NvAKWqaaSVRN1yR2gD
	hHebrZzyzdWZD4Vzqyz7uP+8tRrI7blsSkcF4JcAaBa7z1osPRFKlPAmbCCf2SjrEFePG9
	HtEvoEQe7//mDLG5hCunmlJWrvAj+r8=
Received: from mail-ej1-f70.google.com (mail-ej1-f70.google.com
 [209.85.218.70]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-91-tOyOR9oxP5mFYCDjXkgJ9w-1; Sat, 24 Oct 2026 08:13:32 -0400
X-MC-Unique: tOyOR9oxP5mFYCDjXkgJ9w-1
X-Mimecast-MFC-AGG-ID: tOyOR9oxP5mFYCDjXkgJ9w_1792844011
Received: by mail-ej1-f70.google.com with SMTP id a640c23a62f3a-c4108bfb63dso89444066b.0
        for <linux-doc@vger.kernel.org>; Sat, 24 Oct 2026 05:13:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1792844011; x=1793448811; darn=vger.kernel.org;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=c4C00/XzUMl81Cb9nPtDyYxb7VozrfQ6cNr56bWwPUU=;
        b=WBWKD0AEX6gwKYvAKNlxLEnY6kVWbT74w/LRvMAKqPc9GNfSf0Qsfr8UAWMVqFPBJW
         iDRNPnZwRS5/JfJhetAr/Fb1So4pDmHLbwHp8OGipCzBYuU/R+RMWyKWIHRmwd1aIaeN
         5u3ki/VjRJ06aJCi/y+RLrId2bYldaLU+EV7vdPwdoRSdNwAZy1h5Js1Hy8AQ4T44y5L
         wDfyUpHTps6rsiiHb7isRdvmuIlSvOFTZC94M8SfrzF5v/KuxNY+eGG/Ttjm3Cf1MJMA
         rhhdDPmVd+QJELkX/1BqpqUUNsjklaWi9TlbpdYpaq7OmBcYt0+3rNd/h3/C1P2zLrcG
         FIXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792844011; x=1793448811;
        h=content-transfer-encoding:content-type:mime-version:message-id
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=c4C00/XzUMl81Cb9nPtDyYxb7VozrfQ6cNr56bWwPUU=;
        b=Xoxunm5Mlj2LG4KfV054XPOkwedYlmlzIyqo0618Ur8hHuhXXtsSQPGRVVVp2P+VbT
         iCA+fR1VnolylML3DcIAIevwNf2pU79i43xV4oXMJJ4JYM3nuXHnZKeAzhn8eBOzUoPk
         uTU1ci0V/watxFE3Vmx7okEPQfz5uP66C/s/g1r2hixOuxUrJznT1h2LD9fnjVnf01/w
         Fa5SrWXKCPUgXFFnkzec8Ws+rLpAfuBEiksWzNA8BZ2rOkoYsHY5jnT46HuiUmqToMeJ
         lC095k5K/bzMQjPxVx53o57QMk+cD0pbDXEXNtJrHVLmPaNm75qi9gKg5LgZfDxWr1tH
         rMpg==
X-Forwarded-Encrypted: i=1; AKwUvBxUaSZjuuQ8vPMY+7NktPQ5AloVbAzkViHbNYZ0UxJC13tPPeNxPSsKZZHC0WKforw4muhnm0NbFEY=@vger.kernel.org
X-Gm-Message-State: AFq9FYJ9LYRYpPRH4XFydQ1HXQ6bfNi1SHspDGtc2+ugUfWnic/CYwlQ
	xY/vqrkElfH+9at1wpFD89HT94mXhmksuvPZwmmlZRwN67orfLOkdlP6nP173QF33q+9eHxrapT
	MMD68zvZa6SEVmbrs/H0PeAAOqtD/7N2BetgKWbGKS9aGcyalu66yaHI0KpP8sA==
X-Gm-Gg: AYBFou2k2bbfWZlfvVijcOew6IbXzgWeYzZm5v2urUNiumc6THEt4VP36O+K5XzaixQ
	Rw9/7m+NRJsJo8p1Qm3xOxPwfLBaeK2cbOp2fFhlG/f+MYBDjRwUjHoqc+Z5gLk8YBI0ZBrjgDo
	giGdKGK1Kxh5JTQQ7hWCS2p8kaykug8t6bIzxvON2aJoWdzEfJgnHzouXPwGfIey3McR9EFP4bF
	T8vWnegafckT67F+1c6f+vgtaUuJATp1Jgavu4zgPQ80pb6IcfOuwVIek6NEpcl7EZGW72RcSOt
	7D5USwA/O5gGzBSLBkVzk6Td3L91Lntl/ugBZqxyYoY+YuyznqeGsllIPKM4xzg=
X-Received: by 2002:a17:907:803:b0:c45:60ec:32c8 with SMTP id a640c23a62f3a-c46bde93f0amr177897266b.38.1792844010991;
        Sat, 24 Oct 2026 05:13:30 -0700 (PDT)
X-Received: by 2002:a17:907:803:b0:c45:60ec:32c8 with SMTP id a640c23a62f3a-c46bde93f0amr177894266b.38.1792844010612;
        Sat, 24 Oct 2026 05:13:30 -0700 (PDT)
Received: from ehlo.thunderbird.net ([2a00:7c80:0:3a4::13])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c46bd4ea39fsm83877966b.29.2026.10.24.05.13.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 24 Oct 2026 05:13:30 -0700 (PDT)
Date: Sat, 24 Oct 2026 12:13:26 +0000
From: Gabriele Monaco <gmonaco@redhat.com>
To: Karl Mehltretter <kmehltretter@gmail.com>,
 Steven Rostedt <rostedt@goodmis.org>
CC: Masami Hiramatsu <mhiramat@kernel.org>,
 Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
 Thomas Gleixner <tglx@kernel.org>,
 Sebastian Andrzej Siewior <bigeasy@linutronix.de>,
 Clark Williams <clrkwllms@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>,
 Juri Lelli <juri.lelli@redhat.com>,
 Vincent Guittot <vincent.guittot@linaro.org>,
 Dietmar Eggemann <dietmar.eggemann@arm.com>, Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>,
 K Prateek Nayak <kprateek.nayak@amd.com>, Jonathan Corbet <corbet@lwn.net>,
 Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>,
 linux-trace-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH 0/9] rv: Verify generic IRQ context transitions
In-Reply-To: <20261022050712.75035-1-kmehltretter@gmail.com>
References: <20261022050712.75035-1-kmehltretter@gmail.com>
Message-ID: <FACA54EC-F846-4051-9ADD-DB46E7665FAD@redhat.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain;
 charset=utf-8
Content-Transfer-Encoding: quoted-printable



Il 22 ottobre 2026 05:07:03 UTC, Karl Mehltretter <kmehltretter@gmail=2Eco=
m> ha scritto:
>I would especially appreciate feedback on:
>
>  1=2E Should the context boundaries be trace events or private RV
>     instrumentation?

There aren't any RV-specific instrumentation sites=2E Now you used trace e=
vents, for these you usually need a broad acceptance because they are visib=
le to user space=2E Have a look at tracepoints (the last ones added to even=
ts/sched=2Eh are good examples)=2E

Otherwise you may have a look at my BPF series and use other BPF-specific =
probes (fentry/fexit), these won't need any kernel addition=2E Just mind th=
at the series in an early stage=2E [1]

>  2=2E Are dedicated scheduler events the right way to follow
>     preempt_schedule_irq() across task switches and migration?
>  3=2E Should irqstate and irqexit remain separate monitors?

Feel free to merge them unless you see a use case where one would launch t=
hem separately and allow violations from one but not the other=2E

Also the irqentry collection with an irqexit monitor is mildly confusing n=
ame-wise=2E

Gabriele

[1] - https://lore=2Ekernel=2Eorg/lkml/20261001152042=2E124445-1-gmonaco@r=
edhat=2Ecom



>  4=2E Is the KUnit-only hook for an empty ksoftirqd invocation acceptabl=
e?
>     Outside a KUnit run, its worker checks take a disabled static-key
>     path=2E
>
>Patches 1-5 add the events, monitors, and documentation=2E Patches 6-9 ad=
d
>KUnit coverage=2E
>
>This series is based on v7=2E3 (c03c1a14507d) and depends on the followin=
g
>accepted change, which is not included:
>
>  softirq: Preserve interrupt context on return from interrupt
>  https://lore=2Ekernel=2Eorg/r/20261011060742=2E30584-1-kmehltretter@gma=
il=2Ecom
>
>A pre-existing issue can make rv_test_dummy intermittently report a
>false-positive invalid-wait-context warning under lockdep=2E Wen Yang has
>posted a fix:
>
>  https://lore=2Ekernel=2Eorg/lkml/5586dd00789a0f904cc299cd8889744b8c6f8d=
c9=2E1789412799=2Egit=2Ewen=2Eyang@linux=2Edev/
>
>This series does not include that fix=2E
>
>Karl Mehltretter (9):
>  tracing/irq: Add generic IRQ context boundary events
>  tracing/sched: Add IRQ preemption lifecycle events
>  rv: Add a monitor for generic IRQ context transitions
>  rv: Add a monitor for IRQ-exit scheduling ownership
>  docs/rv: Document the IRQ-entry monitors
>  rv: Add KUnit coverage for IRQ context transitions
>  rv: Add KUnit coverage for IRQ-exit scheduling
>  rv: Test empty PREEMPT_RT softirq worker intervals
>  rv: Test IRQ-exit softirq provenance and handoff
>
> Documentation/trace/rv/index=2Erst              |    1 +
> Documentation/trace/rv/monitor_irqentry=2Erst   |  398 ++++
> include/linux/interrupt=2Eh                     |    7 +
> include/rv/kunit=2Eh                            |   34 +-
> include/trace/events/irq=2Eh                    |   70 +
> include/trace/events/sched=2Eh                  |   51 +
> kernel/sched/core=2Ec                           |    6 +
> kernel/softirq=2Ec                              |  308 ++-
> kernel/trace/rv/Kconfig                       |    5 +
> kernel/trace/rv/Makefile                      |    3 +
> kernel/trace/rv/monitors/irqentry/Kconfig     |   13 +
> kernel/trace/rv/monitors/irqentry/irqentry=2Ec  |   35 +
> kernel/trace/rv/monitors/irqentry/irqentry=2Eh  |    3 +
> kernel/trace/rv/monitors/irqexit/Kconfig      |   14 +
> kernel/trace/rv/monitors/irqexit/irqexit=2Ec    |  172 ++
> kernel/trace/rv/monitors/irqexit/irqexit=2Eh    |   85 +
> =2E=2E=2E/trace/rv/monitors/irqexit/irqexit_kunit=2Ec |  537 +++++
> =2E=2E=2E/trace/rv/monitors/irqexit/irqexit_kunit=2Eh |   21 +
> =2E=2E=2E/trace/rv/monitors/irqexit/irqexit_trace=2Eh |   19 +
> kernel/trace/rv/monitors/irqstate/Kconfig     |   14 +
> kernel/trace/rv/monitors/irqstate/irqstate=2Ec  |  289 +++
> kernel/trace/rv/monitors/irqstate/irqstate=2Eh  |  139 ++
> =2E=2E=2E/rv/monitors/irqstate/irqstate_kunit=2Ec     | 2062 +++++++++++=
++++++
> =2E=2E=2E/rv/monitors/irqstate/irqstate_kunit=2Eh     |   25 +
> =2E=2E=2E/rv/monitors/irqstate/irqstate_trace=2Eh     |   15 +
> kernel/trace/rv/rv_monitors_test=2Ec            |   29 +
> kernel/trace/rv/rv_trace=2Eh                    |    2 +
> =2E=2E=2E/verification/models/irqentry/irqexit=2Edot  |   21 +
> =2E=2E=2E/verification/models/irqentry/irqstate=2Edot |   32 +
> 29 files changed, 4397 insertions(+), 13 deletions(-)
> create mode 100644 Documentation/trace/rv/monitor_irqentry=2Erst
> create mode 100644 kernel/trace/rv/monitors/irqentry/Kconfig
> create mode 100644 kernel/trace/rv/monitors/irqentry/irqentry=2Ec
> create mode 100644 kernel/trace/rv/monitors/irqentry/irqentry=2Eh
> create mode 100644 kernel/trace/rv/monitors/irqexit/Kconfig
> create mode 100644 kernel/trace/rv/monitors/irqexit/irqexit=2Ec
> create mode 100644 kernel/trace/rv/monitors/irqexit/irqexit=2Eh
> create mode 100644 kernel/trace/rv/monitors/irqexit/irqexit_kunit=2Ec
> create mode 100644 kernel/trace/rv/monitors/irqexit/irqexit_kunit=2Eh
> create mode 100644 kernel/trace/rv/monitors/irqexit/irqexit_trace=2Eh
> create mode 100644 kernel/trace/rv/monitors/irqstate/Kconfig
> create mode 100644 kernel/trace/rv/monitors/irqstate/irqstate=2Ec
> create mode 100644 kernel/trace/rv/monitors/irqstate/irqstate=2Eh
> create mode 100644 kernel/trace/rv/monitors/irqstate/irqstate_kunit=2Ec
> create mode 100644 kernel/trace/rv/monitors/irqstate/irqstate_kunit=2Eh
> create mode 100644 kernel/trace/rv/monitors/irqstate/irqstate_trace=2Eh
> create mode 100644 tools/verification/models/irqentry/irqexit=2Edot
> create mode 100644 tools/verification/models/irqentry/irqstate=2Edot
>
>base-commit: c03c1a14507dfaf8b856c2608f9ac216021fc222
>prerequisite-patch-id: 6ac7167f0aa7c5319dac78bf5b06a989fd7dfac5

