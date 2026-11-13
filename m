Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.214.175
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794559052;
	b=HtLmGEWE8Gs4wa463/j+ZptPA/6+2ugIXA7Lag2f9ABlS0il5bDdtZVpFDWKtHXp6elB
	 FoDptqknUpRQL1PpujeJB05Zd1t+L4aIXWWmoNKo25aSdSGKsy5WiKJw8CnibY/N3i/Ev
	 mXw1/Y0fHZLrbhFXUyi/rzmz98cGq39u2hwfdqmMFlvkYtQBDKvtqnZuYWei+Cn3T4AuH
	 1/nFXBHiBC3FWjq+baLCfcHv+f9Gt2yJVmGvDcQsiA+6IfVvzp9lDhfL4SEap097OApUn
	 K59yUaDoCdcay+ZGE6LuUqq1L42VCUc3nZ5cOABeY6CcxPW3CsnG6BhMkR3Xijl82bA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794559052;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:In-Reply-To:References:MIME-Version:
	 Content-Type:Content-Disposition:Message-ID:User-Agent;
	bh=sJIOxVLfQnp7+n8nARFfMr89PNvEkzC0ewnXg1DK67c=;
	b=yS0I4IDcZfqGPrFR7Frziy7RgQrizPmq0hqr0lGCkW5VpRpGo8j9/Ry4UpP08/ud+tjL
	 nXMB5bac5ql0WJ5rID1ye1jNiVD516fk6gkhSGg325KH54XrNvOscMWrT/eTWONtj6Rgm
	 getgocy+zVybYX0Vemj8bfMv2tK4F7nuU3nxQCsfz0W0jA5TGI+uWnFEedg9yU0ne5igL
	 qYVC7zBF0rS3wqhccgebI8R2UZhKhYUFeMN59K7HtHFClZVksWgm0OKyZZ7WQMuXXSdpx
	 C9VN/enzJEutKtnSdXT1ED97xH2KvldmVjIPjcew1RsgZh699EJF2r5bJiTord6srXA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=chrisdown.name;
	spf=pass smtp.mailfrom=chrisdown.name;
	dkim=pass header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=kqvuemHk;
	arc=none smtp.remote-ip=209.85.214.175
Received: from mail-pl1-f175.google.com (mail-pl1-f175.google.com [209.85.214.175])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A08E606B1EA
	for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 08:37:31 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 0A08E606B1EA
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=chrisdown.name
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=chrisdown.name header.i=@chrisdown.name header.a=rsa-sha256 header.s=google header.b=kqvuemHk
Received: by mail-pl1-f175.google.com with SMTP id d9443c01a7336-2e98798cbddso5642245ad.0
        for <linux-doc@vger.kernel.org>; Fri, 13 Nov 2026 00:37:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chrisdown.name; s=google; t=1794559051; x=1795163851; darn=vger.kernel.org;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=sJIOxVLfQnp7+n8nARFfMr89PNvEkzC0ewnXg1DK67c=;
        b=kqvuemHk79RFnSsKnGqcfaCFlZsslhnlt13wX/OUB5ofsLkrIWggKEmEwHtZeYNUed
         cHUXB7/QF/2P3xKfMCBKIikUlfB4RfHXhRcgJQHQjdOKGwTRFlMN+nvnkolIcdTpEHZX
         2Ne3YX9PJzZJDR4Z6rIiPDlegs0QpGRkNB87Y=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794559051; x=1795163851;
        h=user-agent:message-id:content-disposition:content-type:mime-version
         :references:in-reply-to:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=sJIOxVLfQnp7+n8nARFfMr89PNvEkzC0ewnXg1DK67c=;
        b=ijTTeI3QsWJRJ6fvtN4lcKmaZNQIh04dLE4feK0+KcEo7QlUfydhT2e0fCRmrEYb8Q
         aEeuJ0WM2KyOGVQMv5Hue3rTsKKZLupT+7FWXXA3qAQonfNHd/2CWYl6HBEfdFnQTH9b
         uaoMnYRK/Djmk+2u9bRwNVavXuDAcYoOii5Qeuln0g155F0fXrcBIV4CJjwyAdCAJEoC
         WkCndMG9uvVtvBVjE0aFRvHJO/ktDniHzlTslJGLAL+Yk/B1eMbtXZIXAVX0DTBrgzIW
         EIVwaUs58dFhjEc1sMp2rWpoQb0/hp+focsIq7UOo5ZTZMoUZ+Sa0vazD+WnqzDUp1SQ
         E0GQ==
X-Forwarded-Encrypted: i=1; AL+hErEotJ7L4X5AUnqnSI65TUtYLq2J1eW9KbWqW4gMSjVO5B5iXPkPmNRY2CYJpy6t1Q3YT4KcuItngoM=@vger.kernel.org
X-Gm-Message-State: APuU4Z9uf5oU8OiHsDyI47+nUdcQZfem3Bb744BLHZlA6/EVLrBMrPIG
	OEzezlR2PDNgGYJEC8vFwiS0KErjlN+rEq4yfT2v2uXvqb4U81aFSU36AdVB+L7U93w=
X-Gm-Gg: AYBFou17IHNMebD6Nx71VhruHaAs1Xtjahc7oqrqtz0oaL2qns12tiuhwTURCBKmCt1
	cJe99dmidb5ERQLVzGCmUOLqknHeizQ/XTm12yMdGf1dyS1xJJdjN7kTYhwxdp6Z6mrR3UWDIL/
	uJ3RB0kf1DjKeTlQ3q544xRzl0RqfYVS3Zt+CodDWhMpHU8iWQFgOLyyE0OFngKACgIHiKKN25Q
	d+jEuygzaHvh5prXple/zbgTWZOVqBj6AyBuObc+J0gMFIw3ROLdYImPsWvQLQ8oGKcBJKmq+bP
	iHWuR6X+zPC6qzOM5AA1blkzxnRtlyRVfkkKIPtmZC2fTe07PBGh6vCQrF6JNkmQP3taa0utKvh
	MXH0I2QrArIgUM3c10T/WYHIFzcrhx2Ld/aEUkHTqovKVf6TCP28PhDPnmuFfPiyw61Svg46JjH
	RG/jYDPYgwjZxkZ71TowBtLWrSeQOALFeG5g82ZdF2P1BFawRq/rR2W5mAFbTRXQH0EVbq1DMCS
	5xBdMkJHDrIuEqlpU/jVganzQy3qmy64zT/LVxd3huOt9KsWbl2p6pwxWR8JByOmTBxqikvVHhx
	4OD5lhMHQllDZGFKTQFT9dogZndr8HJ8dETXI0o5ioPAbwxXcaxkrbjv1YqGECPs6UKXEK52bQW
	4xPkaO1KDIWytWBHd39yKaACs0L5rJj5LjagkFMkWMk6a5ZgeW2fZYAvHcLsoItghG1ymgmJPiW
	Ok4MNLcvfWcBRLgrQvqYBbI5dmxU8GiwOyFnK19D+wSumGPUK8miY89VtgCaM=
X-Received: by 2002:a17:903:2b07:b0:2ed:3057:4f79 with SMTP id d9443c01a7336-2ee0de41b68mr16715855ad.20.1794559051439;
        Fri, 13 Nov 2026 00:37:31 -0800 (PST)
Received: from [172.22.0.2] ([50.175.87.158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ee0f75dde9sm6785655ad.22.2026.11.13.00.37.30
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 Nov 2026 00:37:30 -0800 (PST)
Date: Fri, 13 Nov 2026 00:37:29 -0800
From: Chris Down <chris@chrisdown.name>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>, Kees Cook <kees@kernel.org>, Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, Dietmar Eggemann <dietmar.eggemann@arm.com>, Steven Rostedt <rostedt@goodmis.org>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, Ard Biesheuvel <ardb@kernel.org>, Will Deacon <will@kernel.org>, Sami Tolvanen <samitolvanen@google.com>, Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, Randy Dunlap <rdunlap@infradead.org>, Arnd Bergmann <arnd@arndb.de>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, linux-arm-kernel@lists.infradead.org, linux-riscv@lists.infradead.org, linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org, kernel-team@meta.com
Subject: Re: [PATCH 2/3] sched/core: Add sched_stack_end_check= boot parameter
In-Reply-To: <20261027101703.GB2668564@noisy.programming.kicks-ass.net>
References: <cover.1793082868.git.chris@chrisdown.name> <3d2bb6a8508b9d801878bb82c88165a1b1ff5f40.1793082868.git.chris@chrisdown.name> <20261027101703.GB2668564@noisy.programming.kicks-ass.net>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Disposition: inline
Message-ID: <20261113003729.4a4222d8270db2bd@chrisdown.name>
User-Agent: Mutt/2.4.3 (cc9e3943) (2026-10-09)

Hi Peter,

Peter Zijlstra writes:
>I just noticed that there's a number of task_stack_end_corrupted()
>checks that:
>
> - do not also do task_scs_end_corrupted(); should
>   task_scs_end_corrupted() be put inside task_stack_end_corrupted() to
>   make sure they're always done in tandem and the shadow stack check
>   isn't lost?

I had a look at the other callers, and I don't think the shadow stack
check is being lost in any of them. Two are the oops paths in the x86 and
powerpc fault handlers, and neither architecture has
CONFIG_SHADOW_CALL_STACK. So putting it inside task_stack_end_corrupted()
would only change __might_resched() and the stack tracer, and only on
arm64 and riscv.

Both of those are about the task stack in particular. __might_resched()
got its hint in
a8b686b3af44 ("sched/debug: Check for stack overflow in ___might_sleep()")
because at the time a stack overrun could corrupt thread_info and trigger
the warning on its own. The stack tracer checks right after it has
recorded a new maximum depth for the task stack. Neither has anything to
do with the shadow stack as far as I can see.

schedule_debug() would also still want to check the two separately, so
that the panic message keeps saying which stack it was.

> - should these other sites also respect this switch? It seems weird to
>   only have this one site affected.

It is a bit odd, but I think only this one should follow it. None of the
others depend on CONFIG_SCHED_STACK_END_CHECK today, and the switch is
only meant to be the boot time version of that option. They also only
look at the magic once something has already gone wrong and we're
printing a report about it. The stack tracer is the exception, but it
only looks when it's enabled and sees a new maximum. So there's no cost
to avoid by turning them off.

If they did follow the switch, anyone who leaves it off would lose the
"Thread overran stack" hint from their oopses.

So I've left both as they are in v2, and the changelog now says why the
other callers don't follow the switch. Let me know if you'd still rather
have them folded together, though.

Thanks!

Chris
