Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.128.44
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795866904;
	b=QuPBzz4nt+ACXtenH34/4asmFU1/5Hvx5szRwzpZYQ18ZsXirduiAMdREmN4qIEpisJ5
	 jzlfrNwlj40UZCtGZ582iWrmFyl1G5TfWiH3DepyJLuh/mJiTU/8OsAk8KeCzxfv6f8jj
	 mJM7hneO6RU39lHMAQXEsJ94kQM/qn29Qv91w3noueW52bkejyVZk8jXmDDg/8mdRQlTD
	 fL6LfSitYTy0Q8Cd5XY1Gcpm225mb61VX2CSoInKzhstWjhFqTqkwm6H+egO6bGWv2PMO
	 DaFIjlUr7DSBxjRvFaToOrz7NmNi97XTmA4ULbM3GsBNG2fqpLT2FA1/yT1ILhplh0g==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795866904;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To;
	bh=aYcr/Vbck1ztUmS15ZTJlw73vVEYDKhMroKfUy1hlew=;
	b=bjfWobp60vbfFf11Lw9okci9m+OwnJCPtTk+BebBlW+nx72z8zHQAjeDpR/idBiY+Ff3
	 oc75I0FCP7jprziCU2xdu2nIsFPcJlCj6654HPWhKIbTXf8R+aj3VAMaI2wGXdDu4E3Dp
	 useQXcAl4pZPLIQfzodgo8jRRfL7o+xJQllKqTlHMISIs7n3Qq942qU7J4SMWuERYe/n1
	 1lsVtJaFSfzazz49aL9Mg06YlDPT/hf54p/ER/rTDSTqUfCsIG39DSHcXN/NvYQ5LzW/a
	 PYIRiUhE0mecucaNVaMYAnIJ+O4/+98JJQsNuyevqUswRiBf8RDcU/K0pIZUOvgqAWA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BmabmFsJ;
	arc=none smtp.remote-ip=209.85.128.44
Received: from mail-wm1-f44.google.com (mail-wm1-f44.google.com [209.85.128.44])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B515606A323
	for <linux-doc@vger.kernel.org>; Sat, 28 Nov 2026 11:55:04 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 8B515606A323
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=BmabmFsJ
Received: by mail-wm1-f44.google.com with SMTP id 5b1f17b1804b1-4a5177d78c7so91013095e9.2
        for <linux-doc@vger.kernel.org>; Sat, 28 Nov 2026 03:55:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1795866903; x=1796471703; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=aYcr/Vbck1ztUmS15ZTJlw73vVEYDKhMroKfUy1hlew=;
        b=BmabmFsJdICXPiXcElnIe1TFv/o26HwlXPW87Y3amLlU3xobT8vLUI0LHU0ruwO1fR
         cYJOtu9/Aw+LgWS6Gbue3B/Qep33qVgKS8Rw+3OFFPJ7V4MCx47Psgay3TJMIhhw3nin
         bmoAXRjBMLeQZNr+UjhI4DYYwUstfHd5b4OlWqM1nT6Qjo1r49lTSTW6i4jjxIGj7iDo
         2b0c14Ul4qIhk+Z9VlQ96cqjdKCHUEHY8L4wkQdhBWqpetzJN/hlKeMQlzqnEdtPokbX
         aqPdwKUX+D0wW23gg6jpFMM1QJTagyzW/Sl0bKjPNI9BVUzmyE0T4PvDNu0qrTRGdPM1
         ou6Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1795866903; x=1796471703;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=aYcr/Vbck1ztUmS15ZTJlw73vVEYDKhMroKfUy1hlew=;
        b=DTeGxgw83BgFz6TBaSGl9lB4Hcj6flTYFKobZ3n9VA5XeZewtT1b5JgpYobuK8QgaK
         7us64oI7m1g2SYHcoXPCvwApN+RARlzSO90ORCZncQBDKJGZBeh2N3M6Li9Yr2vadGjy
         5lWY9Wu1tWBFZOFKs+4RmIRBX0XNDRZuGuyD0OP0H6/sKYstcW7YidahgXl60RHqTaI+
         dkpIJEFd46rlVj2tEWCBB/jOezg7C+FU3qZ2Lp77K6VoNBmT8iIRb7De+ZwU4v2AFFhY
         soZu79a1vCWho+9d1t+Se3z/jQqPMRzd4RhXJipuZmgl517Te+51GG6+Ly2UGZqSUaP6
         H9ZA==
X-Forwarded-Encrypted: i=1; AL+hErEKjiSsLM1VEvu3ZEA5HylO2qiwyYqaMApVFjzOlcxu/UsAxdEq0owocY8KgAI7PlsduU8lvwlxNCg=@vger.kernel.org
X-Gm-Message-State: APuU4Z/x9kEEuB9pq/XkcJ7BNSgcCFEcRPaEBoeUcsvxBegGDJECgfg9
	v2HurIhtQkT8EqLD+Cjbde1qPLDtREYcN9gcj987KL9U13OXCgJBgBJf
X-Gm-Gg: AZFdTZeel1p7RY9Pzc+dP43pkwfJkdgV6beZlSWYF2kaUruITsYbin/wRCvhwem0Mo7
	GEUdCPb5jyl0lK9bmZ8PWJ8JY8bHX0bmp31Wk2PBDWMk8hV6Qw9aiCq6OkDtUUzoppsVEYHIw/8
	TWQviuAQ5GsY6CZiTclPSuaWxvqm4Mp0oLsoyoVDEWqHvXfJxH1KSzc6UhuGRF30NTL7q0KDB7F
	GbEPVZmjy4zOchzfFgnHsE5XWYEG7W+ySrWIhP1AyBdfL6B8ZdOYfddljUmuAsGZR1ECpmtGuOr
	Jc+e1ybjvlVnWR0DH+WuLCmmbxcIW2BHS5Rb1udxx/8BA+oBCbHtWStdUM9npFZ6WNupDq4cNta
	jCNNs0OnuWghPqeekDPVxIKg4ByWF5SxCsIqHksA7hFFapkKfmT4FG2azjGrg+SxDMKQZcATEPC
	3HaVM+WwOv49HOw0/1xsMWHGMMQ3kM2sPWxOxPIxpsJaORZ+n/BTRMt7OO748RvNZO1232woHHF
	HqJVk19XoSXnsPB017Hx90zECWMxScj0IcJcF+eNABhh3Bfg2Jw/+qKFYceBdL2q2fEJaQiBMkm
	5MI1VKzuzl6H1+TjRt9V7lgrjIww1kqKTu5t+ekIFPUX6ymzvd/vw5XN1NHGdPdpgDa+oyFJRYF
	7LnKVt9eAewZIQa9JONl2agE8YboV32Efqh+zcDOcW3qEbgTIDzUeYN/NRxUiAKGk
X-Received: by 2002:a05:600c:1da9:b0:4b1:2026:6b41 with SMTP id 5b1f17b1804b1-4bb88819294mr573223175e9.30.1795866902705;
        Sat, 28 Nov 2026 03:55:02 -0800 (PST)
Received: from unknown748F3CBA5068 (dynamic-095-117-034-170.95.117.pool.telefonica.de. [95.117.34.170])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4bb853a1e8bsm634936515e9.9.2026.11.28.03.55.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 28 Nov 2026 03:55:02 -0800 (PST)
Date: Sat, 28 Nov 2026 12:54:31 +0100
From: Karl Mehltretter <kmehltretter@gmail.com>
To: Gabriele Monaco <gmonaco@redhat.com>
Cc: Steven Rostedt <rostedt@goodmis.org>, 
	Masami Hiramatsu <mhiramat@kernel.org>, Mathieu Desnoyers <mathieu.desnoyers@efficios.com>, 
	Thomas Gleixner <tglx@kernel.org>, Sebastian Andrzej Siewior <bigeasy@linutronix.de>, 
	Clark Williams <clrkwllms@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Peter Zijlstra <peterz@infradead.org>, Andy Lutomirski <luto@kernel.org>, 
	Juri Lelli <juri.lelli@redhat.com>, Vincent Guittot <vincent.guittot@linaro.org>, 
	Dietmar Eggemann <dietmar.eggemann@arm.com>, Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>, 
	Valentin Schneider <vschneid@redhat.com>, K Prateek Nayak <kprateek.nayak@amd.com>, 
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <skhan@linuxfoundation.org>, 
	Randy Dunlap <rdunlap@infradead.org>, Wen Yang <wen.yang@linux.dev>, 
	linux-trace-kernel@vger.kernel.org, linux-rt-devel@lists.linux.dev, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [RFC PATCH v2 0/9] rv: Verify generic IRQ context transitions
Message-ID: <awq_lh1x7P6NQrx8@gmail.com>
References: <20261107171252.25090-1-kmehltretter@gmail.com>
 <9419fa94de8acc8f1ae445004b77d20d0be3e98e.camel@redhat.com>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9419fa94de8acc8f1ae445004b77d20d0be3e98e.camel@redhat.com>

On Sat, Nov 21, 2026 at 03:23:08PM +0100, Gabriele Monaco wrote:
> Maybe, you could somehow reuse the __schedule() tracepoints and understand you
> came from interrupt context, but that would obviously not match the
> interrupt/preemption counts, although they are (now) guarded by a BUG so you
> don't really need them.
> The loop should work fairly well anyway.
> 

Good point. With the BUG_ON() in preempt_schedule_irq(), every irqexit
check is already enforced elsewhere.

It seems dropping irqexit and its scheduler tracepoints is best.

For irqstate, I injected faults on arm64 and x86_64, with and without
lockdep, and went through past IRQ context fixes:

- Its only unique catch was an injected traced entry paired with a raw
  exit.
- A leaked PREEMPT_RT serving-softirq bit was reported first by RCU or
  lockdep, even with lockdep compiled out.
- It would not have caught any of the past bugs I looked at. Most were
  preempt_count disagreeing with lockdep, irqtime or nohz.
- On a Raspberry Pi 500+, it added about 73 ns to each
  irq_enter_rcu()/irq_exit_rcu() pair and had no measurable effect on
  hackbench or locktorture. PROVE_LOCKING added only 12 ns to the pair
  but made hackbench eight times slower.

How do you see it? The results above only measure detection beyond the
existing checks. Is irqstate worth a v3 for other reasons, such as
running a model of the IRQ context rules on production kernels, or is
there something you would like me to investigate first?

Thanks,
Karl
