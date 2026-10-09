Received: from mail-wr1-f51.google.com (mail-wr1-f51.google.com [209.85.221.51])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5B6FB3B27F3
	for <linux-doc@vger.kernel.org>; Fri,  9 Oct 2026 10:04:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.51
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791540281; cv=none; b=jahcgBsslNtPLaBfxhHYqauZHJEb4bznozQzSmS40+ciSDg9Xdpz5w1HveVoTGRrz7X9mrP6XEytGUZDoWeY0x8BRqLoQDyHkTFH5V4hQkf3YV1FCWEo9Pu4I6EiPGJSSix8OJujF5MHBhMn6pFVs6ElXg4WTvzU18v409hJZrw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791540281; c=relaxed/simple;
	bh=5yLkz2OZBQ4ipEjXEN7/lCEXtkQpCiwl45030Q1M6lA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=K21634kKaJZyZiQOoGd25UMC6Xq+7XIrsNnp87y0YfmfGi/W+3/Lr1kMgHWIkVYMnxJeBBTEEiyMVvBwGWlZiGks15f5OqJmuSw6HmLlFcvCiRPaEkLi0j/7+pxkHkRQQcNA+oij9MRO+/bGG/XIjyECs31IbWv6kCIiuem1ZDA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=Mv0bXuY/; arc=none smtp.client-ip=209.85.221.51
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="Mv0bXuY/"
Received: by mail-wr1-f51.google.com with SMTP id ffacd0b85a97d-48afe75f055so5582803f8f.2
        for <linux-doc@vger.kernel.org>; Fri, 09 Oct 2026 03:04:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791540276; x=1792145076; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=WCfrYFQWaB6ljrpcA5mB+GvPCr6ztXX1INv06kJj6BA=;
        b=Mv0bXuY/dbslJrVlIeMtcxPdMhLIu3/yZLmI50/So5GHoEeQlXlcQKfT0SUHwVk5Kx
         R+6aWsPXaKh/7fFnAtl0/YG7zxU8j2j3kckVubW399a9rtWIpvskoUxAs+X9xngQygCx
         a87s25iG26dO4mAjyHuF+kQ5cJQzgxTIO5J10VcL44URFMev9rQ5ejJNZmdKtmIVQS79
         ueEOTvGWtd0OeaYefX23YBmg4pzUxHliPw8wAeyYfjXk9OmTmGyJvy41qBBG1HPkACTt
         q1rc+IgaRF5GB88OVPs2YFDDbyW2l/GfwVAgW5E6rPwMieA0a+R+g2K8thOHn0su1y/G
         YWOg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791540276; x=1792145076;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=WCfrYFQWaB6ljrpcA5mB+GvPCr6ztXX1INv06kJj6BA=;
        b=KAEbMvEky987Bk24fUnzgE2rxdfrp/ykWgCUfXYQrfOzdttL9/syydiWMlRnrdHPLk
         oqFPodRiW9Hct5ReZLuboEdVeTinJoSj7llBxd2Nk4buN8GW5QIrLqgZ1+zkYxOWcAsE
         tfuAHNkDuV1PeWIFxni4lFVaO4LX6HsHMh/LG5vhWh4QuZbxsZ415CcbVoNE5bL1HgKB
         KNrRGv5PFBd4RCgNdWMKCtpRx3AnJsCzmZQJa8ba3FvT38JXPse9/VaMWzPCJkdiFuP7
         aS3e8xAr1JW8p5daAUUaUVs68fPVoSfCEMYvwoPJywGVrZlp3k02/qwK1/6MbGysg1v6
         vClQ==
X-Forwarded-Encrypted: i=1; AKwUvBy/NoJc0TTHzKLxitqPezaCbus3GHdwPiMQ3lXw6JFIAP3ggKz42wmkFt98wjz9c6lI6I5GQhUoPrY=@vger.kernel.org
X-Gm-Message-State: AFuF++kN8Lbjbm7U6Hh72lTQ6M3h5RS2P167sAP99BUQDJo9XUkIKsvK
	jj4KeIkMVVyaskuyErqgrokmJfAFRfEAgzNe/J1gvJILgO/a7eEQd4Xz
X-Gm-Gg: AYBFou2UikWDOyS+3g1Yj2eeI+FvzKRzqR0Ive286Pc4ys0s2rWkqgLkA5P27LN5lqg
	JWyPZp9yXx5GZtIhLd9WuLcmwgLc0Pt2ksGUgbECYU42GlqI2rqiRs53LIu64p6SwJxsqdJrndJ
	KmmXNq3HdOZtqJRF93TYD+g5CqNjJOnItnu4u7xbwT3gavqo1ceQ9XAcidOFF03Rl/RARaKfCBL
	Ig4RrzpcXerQG3J2jkN1MQl+ytGlpJ6RSYdH3DVoozyzbxsj54CRTk9DNVKMjobqgMGKh3G/lf4
	6R9gTlFf3D3TzFRkU35ZVzpJ99EjQOMLNodam+CxNW3lutgrpcHsREBbZ8/Fmbeklvn2pvmBjeQ
	pCLMMoFo77P+9xkLNQKx1SR3e+4ZsR72QvrIKYTyoSs3Ephr2dV6ElmX9DDnIaVYZNkCyRIzE1i
	g70WSh3g7yHmh/ed28DfRMRYNOLkV52qxdLwJGXSlvDnGLqQK+8+5DxxJeXa+30eIOSuU+4zt1m
	q3AHpRbqc4HbidLTDs/JEMCFXIZkCYsZKipf632ucNrCwc/ZxU7TpmTLb1gvBek8BceomdTz+BG
	B8jQZlwATJ3Xa0J17/UIUqSYA/yC+VYcNGHW6lJKi2wgtlcmXHtkce1pozHfCv1bpBUGTVn5MSL
	reEsXxjeZzqtOdu4=
X-Received: by 2002:a05:600c:3f16:b0:4a0:2150:55fb with SMTP id 5b1f17b1804b1-4a18e44395bmr24842945e9.4.1791540276044;
        Fri, 09 Oct 2026 03:04:36 -0700 (PDT)
Received: from unknown748F3CBA5068 (dynamic-2a02-3100-a128-aa01-297a-7094-853e-a20c.310.pool.telefonica.de. [2a02:3100:a128:aa01:297a:7094:853e:a20c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a18bf2caf4sm53382635e9.10.2026.10.09.03.04.34
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 09 Oct 2026 03:04:35 -0700 (PDT)
Date: Fri, 9 Oct 2026 12:04:33 +0200
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Harry Yoo <harry@kernel.org>
Cc: Peter Zijlstra <peterz@infradead.org>, 
	Thomas Gleixner <tglx@linutronix.de>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Andrew Morton <akpm@linux-foundation.org>, Vlastimil Babka <vbabka@kernel.org>, 
	Alexei Starovoitov <ast@kernel.org>, Ingo Molnar <mingo@redhat.com>, Will Deacon <will@kernel.org>, 
	Boqun Feng <boqun@kernel.org>, Waiman Long <longman@redhat.com>, 
	Jonathan Corbet <corbet@lwn.net>, David Hildenbrand <david@kernel.org>, 
	Johannes Weiner <hannes@cmpxchg.org>, Shakeel Butt <shakeel.butt@linux.dev>, 
	David Stevens <stevensd@google.com>, Daniel Borkmann <daniel@iogearbox.net>, 
	Andrii Nakryiko <andrii@kernel.org>, Martin KaFai Lau <martin.lau@linux.dev>, 
	Shuah Khan <shuah@kernel.org>, Amery Hung <ameryhung@gmail.com>, 
	Swaraj Gaikwad <swarajgaikwad1925@gmail.com>, Clark Williams <clrkwllms@kernel.org>, 
	Steven Rostedt <rostedt@goodmis.org>, linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-mm@kvack.org, linux-rt-devel@lists.linux.dev, bpf@vger.kernel.org, 
	linux-kselftest@vger.kernel.org, cgroups@vger.kernel.org
Subject: Re: [RFC PATCH v2 0/3] locking, mm: Add atomic allocator trylocks on
 RT
Message-ID: <asi6Kj3TcCd6HAM5@gmail.com>
References: <20261005070625.8871-1-kmehltretter@gmail.com>
 <asZ8jmWNoGk5tYce@thinkpad>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <asZ8jmWNoGk5tYce@thinkpad>

On Wed, Oct 07, 2026 at 07:15:29PM +0100, Harry Yoo wrote:
> > This RFC instead adds an atomic owner state for bounded PREEMPT_RT spinlock
> > trylocks. Atomic acquisition succeeds only from the completely free state.
> 
> Please don't skip discussion stage and jump into submitting a very
> intrusive change across locking and mm, assisted by LLM? :/
> 
> I don't think attempts to tackle this problem will make progress without
> discussing and getting buy-in from (PREEMPT_RT) locking folks.
> 

Sorry, I should have followed up on the additional v1 replies before
posting this v2.

On the alternatives in [1], Alexei [2] preferred detecting
scheduler-lock contexts and returning NULL. He confirmed that NULL
returns are allowed, rejected restoring the local-storage allocator, and
raised the RT unlock/wakeup objection.

I initially tried that detection, tracking pi_lock, rtmutex wait_lock
and rq locks. With RT, lockdep and slab_debug enabled, task-storage
allocation under an independently held hrtimer base lock reported this
cycle:

  hrtimer_bases.lock -> rtmutex wait_lock -> pi_lock -> rq->__lock
    -> hrtimer_bases.lock

I don't know whether my changes introduced or exposed the dependency.
The timer lock was not covered by that guard. This was a lockdep warning
and the workload completed.

I then tried atomic ownership in v2 to avoid that unlock path, at
the cost of IRQ-disabled spinning without PI boosting of the owner.

One possible interpretation of "raw_local_trylock_t" would be preserving
the non-RT local_trylock semantics on RT for short per-CPU cache
operations, with allocation failing when it needs an rtmutex-backed
fallback.

Would that be worth exploring? Sebastian suggested
consolidating the existing local-lock variants first. What should that
cover?

For arena user faults, backing-page allocation failure returns
VM_FAULT_SIGSEGV on the RFC base. next-20261007 preallocates outside the
raw lock. Failed fallback allocation returns VM_FAULT_SIGBUS. If
restricting that fallback increases fault failures, is that acceptable?

Thanks,
Karl

[1] https://lore.kernel.org/r/arIY0wMQjCCsqidI@gmail.com
[2] https://lore.kernel.org/r/DLO3RV3IQUOV.21BNLF4QS9T4W@gmail.com
