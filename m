Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795618377;
	b=uyNojphsaBb8qqjIGopAbOwf0oavmfn1a1aKqCs4Z819Cv04Tst9DjF2D7U5gNX0Asex
	 f/5S9KImG/jBvYLhrm+rWMPTNnxN7eWbFleXkBfulxH5/yV0Gr/GNu0v3SfrzRRH4JWdC
	 qn4auAP1OVIlnOWK9sSICnCYnKQy4MrLVe61ndSVavBw7N6YIP6fKn6C0zZRwSsmKDcUH
	 tDDFQ/byjQ/k1hP0qooOq4hxts2hk9QSIf1PRAWRTWHatIl/+uiK2jnfvZuVMhxOWigCM
	 FrAvF/2HKhG/bR/lgVpLykAo7OhmF1zz3iDesJhVEpEfvsZluqwlXgWBJ61UaHRsvZQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618377;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 Content-Transfer-Encoding:In-Reply-To;
	bh=ZWAKGYG4Z1IF5pQgZgTA9pPvQYi3Ny9K1VwNmhnSKGs=;
	b=YLjROBYo5mTVGHHg8n2m+vrcxol7v+7FMRdbKJ3Ji0JOxk6JC3M3jIvuQg/YxFT9J7Xm
	 pceCiRkyop0YU+fz7cDd3DbJjiZ8NYjhl+D992tt+6YYPLgpxgg1XThAeDE/s77j7vaKO
	 Wrrw4LULqk3SQw6RH35zCVx9l2xrM2nmIi0Cv9l4Y/BqaV44M/GGUM7UWlzlEcKWri7gf
	 oLHx4dC9juX3ZjyCTRshBI5IXGJDb9cXjq5rrtjJ9Lex3nVD1GJQKH/7iXgXM2e4Rumdl
	 mpfhF/CbAMnM30up197XW5mIbWxSud6gQ6BnJpcyMwPC9YSUFUGhLg3nN8CIQxtLw3w==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=n61Zo3Oq;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=ZWEzA1Sk;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 00D1C606A32D;
	Wed, 25 Nov 2026 14:52:56 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 00D1C606A32D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=n61Zo3Oq;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=ZWEzA1Sk
Date: Wed, 25 Nov 2026 15:52:53 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795618375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZWAKGYG4Z1IF5pQgZgTA9pPvQYi3Ny9K1VwNmhnSKGs=;
	b=n61Zo3Oq7lJu1Byb8ITxBeen+HqdPiVw+d6fYK/CdN0vBYC3tvCDR5aKPgsrYUwKwCajKn
	lnQ/7v2USObuKTY+07pqHb4K4yvqQpiwMm0f/E1kONNrMssm1iPR80nRVeWb4u/DuwVo25
	aEoPlBaIiqCibCKMHo9xb+6OQm7pZIxvEEKO0ZsZlutHmdWuoSWFmeNqlQimEXIVkAaX6B
	uqvWFvpqv9FXvp8rjX9hBgAoS767WiyWp4vxxdfTL4tevw1h0co/ylMmCj3EncfsxFkdTi
	xJtWHY4PWjVUaukDO/95wt7w/MO5zDN/Qxu0IT7xJwm8WLOR4FnKafh/5OiKsw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795618375;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZWAKGYG4Z1IF5pQgZgTA9pPvQYi3Ny9K1VwNmhnSKGs=;
	b=ZWEzA1Sksy7xECTxewVcqo69ohY7RXAIWHoryUAEXMKwGqBHrA+UKajrFt21oAy+9fPbSD
	k84jr29aVYjPSXBA==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: Zixin Wang <w1355457260@gmail.com>, linux-doc@vger.kernel.org,
	linux-rt-devel@lists.linux.dev, darwi@linutronix.de,
	john.ogness@linutronix.de, clrkwllms@kernel.org,
	rostedt@goodmis.org, corbet@lwn.net, wagi@monom.org,
	atomlin@atomlin.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] Documentation: real-time: Add runtime tuning guide
Message-ID: <20261125145253.iWfxNCmy@linutronix.de>
References: <20261125074658.33117-1-w1355457260@gmail.com>
 <awbgq0xQyJATel0_@localhost.localdomain>
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Post: <mailto:linux-doc@vger.kernel.org>
List-Help: <mailto:linux-doc+help@vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
List-Owner: <mailto:linux-doc+owner@vger.kernel.org>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <awbgq0xQyJATel0_@localhost.localdomain>

On 2026-11-25 14:20:43 [+0100], Frederic Weisbecker wrote:
> Le Wed, Nov 25, 2026 at 07:46:58AM +0000, Zixin Wang a =C3=A9crit :
> > +CPU isolation
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=20
> Isn't it kind of duplicating Documentation/admin-guide/cpu-isolation.rst ?

That is why you are here. I would suggest a minimum here to make sense
and point the details to that one.

> > +
> > +.. caution::
> > +
> > +  CPU isolation is best effort.  Work that is explicitly bound to an
> > +  isolated CPU, such as per-CPU kernel threads, bound workqueues, and
> > +  interrupts, may still run there unless it is steered away.  Measure
> > +  the resulting latency with tools such as ``osnoise``, ``timerlat``,
> > +  and ``rtla`` rather than assuming that an isolated CPU is free of
> > +  kernel noise.  See Documentation/timers/no_hz.rst and
>=20
> And cpunoise but that's all in Documentation/admin-guide/cpu-isolation.rst
>=20
> > +RCU callback offloading
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +``CONFIG_RCU_NOCB_CPU`` in
> > +Documentation/core-api/real-time/kernel-configuration.rst enables supp=
ort
> > +for offloading RCU callback invocation from selected CPUs to per-CPU
> > +``rcuo`` kthreads.  The offload is selected with ``rcu_nocbs=3D``, imp=
lied
> > +by ``nohz_full=3D``, or enabled for all CPUs by
> > +``CONFIG_RCU_NOCB_CPU_DEFAULT_ALL`` when neither parameter is given.
> > +
> > +``rcu_nocbs[=3Dcpu-list]``
> > +  Offload RCU callback invocation from the listed CPUs to the
> > +  corresponding ``rcuo`` kthread, which can run on a housekeeping CPU.
> > +  This reduces callback-processing jitter on the CPU that enqueued the=
m.
> > +  On a non-real-time kernel this also moves invocation out of softirq
> > +  context; with PREEMPT_RT, callbacks already run in kthread context
> > +  because ``rcutree.use_softirq`` is false, and the offload only chang=
es
> > +  where they run.  If the parameter is given without a CPU list, no CPU
> > +  is offloaded at boot; the mode can still be toggled at runtime throu=
gh
> > +  cpusets.  The parameter takes precedence over
> > +  ``CONFIG_RCU_NOCB_CPU_DEFAULT_ALL``.
> > +
> > +``rcu_nocb_poll``
> > +  Make the ``rcuo`` kthreads poll for callbacks instead of requiring t=
he
> > +  offloaded CPUs to wake them.  This improves the real-time response at
> > +  the cost of higher power consumption, because the kthreads wake up
> > +  periodically to do the polling.  Consider this option only when wake=
up
> > +  latency matters more than power.
>=20
> Does nocb polling really improve real time response?
> I have doubts.
>=20
> It checks callbacks and grace periods every jiffy instead of waiting
> for actual callbacks and grace period events.
>=20
> This means introducing jiffy worst case latencies.

The wording is the old "RCU documentation" and it is a bit strong. The
"power consumption" comes from the part that the RCU threads are woken
up to check for work. The better improved "real-time response" response
comes the fact things like call_rcu() do less work (in their IRQ-off
section, including waking a task) so the critical section is smaller.
I wouldn't expect a huge difference except on small HW where every
opcode becomes visible.

> Thanks.

Sebastian
