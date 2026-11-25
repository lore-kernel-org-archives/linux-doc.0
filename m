Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=193.142.43.55
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795618878;
	b=dpfpqqCSP6PApt5xByfM2N6dtEXltESGlDbtvpIJ9PY4XZKY4PMRXrAi2gRfgTX+KqvZ
	 T0q6eoSUSQCMlfoLKZyLZk5ojH94oLEDfcNLdLwjW24MznX0mGm9o5Ky7RvfPZkQ9EwNs
	 bfvr6rjfVq31u5qNvDpwnusYhSXsc3TJT/Sxbi6GV4qXcLx5Mct/gbP/ONK7wVJyQkzvA
	 0krb0AyHpNA3nP1hsUTTIyRLIewaUqs977LorajCoMwiwbuf/CHpp8EV2Jzs3StVwb3PI
	 13UWfiU6hQGz/OMI5gOfk8CyrZKm/lepEpxycXWxeDdPvRGE/Pw4uWM54gLjefKvgtA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795618878;
	h=DMARC-Filter:Date:DKIM-Signature:DKIM-Signature:From:To:Cc:Subject:
	 Message-ID:References:MIME-Version:Content-Type:Content-Disposition:
	 In-Reply-To;
	bh=+t5bZojd5UJsQPHqfddJ5utxbqlk2yetMVjcrNjRxLU=;
	b=wB+TKr7AtGJ5fVezpkZlVh3NEIDZmUiIuSLe/QWqLy99YqnRM+elElEy7QphtXPRlWih
	 TrwzboYvoApCXsTP5sjW8pusbFlCuEAU8bujKPjwge2rnZ7JfndFEH4R6semUuyGooLgk
	 ueCaOjARMl6YRqO4xB6Wi6/BDfjbHM0rOzAh+VmYzTgW7so2S94o8ZXLvbWSM85JVqp4t
	 2iDNMhoUb0bbm22bAjcgzlZ8deaP/gP22IvqbaHQl6OFNTYrDm2hA3nxuZBf9Z3Ld03xC
	 z207En3Rbn8ViZo/w3CswZ0gGMthotaKbwvj7Q0Xwokhf5oWgmTnAN8cSMbiMjYXv7g==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=linutronix.de;
	spf=pass smtp.mailfrom=linutronix.de;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=xozZbKJA;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=OPzMdTid;
	arc=none smtp.remote-ip=193.142.43.55
Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD4A7606A321;
	Wed, 25 Nov 2026 15:01:17 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD4A7606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.a=rsa-sha256 header.s=2020 header.b=xozZbKJA;
	dkim=pass header.d=linutronix.de header.i=@linutronix.de header.a=ed25519-sha256 header.s=2020e header.b=OPzMdTid
Date: Wed, 25 Nov 2026 16:01:14 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1795618875;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+t5bZojd5UJsQPHqfddJ5utxbqlk2yetMVjcrNjRxLU=;
	b=xozZbKJAAno4j71wz3KbT/PF4G7T94+ujfpIHIKAdDC+yQpsVJeefyfsr+urhBXu5JoPVU
	bSj1XXI87sY5qOaRe15O/lAO4r0uW29aKA9NP6/bRtInoJtL6vAm11SDCq6NxlUGtnkgst
	EmCE6WOXYbgZ0JMLS9LkVTIZFNlwES2vCW5dWQGjgIZgu5Tc8Hy7Lzsnw5qhuYJIgwTWVO
	yKDipIRC6nGwT9tjS8oc/FwBskmDFlkiUCL65YjHOylSCH+AVh8i8DjUdZJAsD4XAeaWUU
	lC/6KAqGsxQbclsfOXXcNtdymM8O4tnR8CNNjOxbSyy/D+roCXQgI5vix9zhHA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1795618875;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=+t5bZojd5UJsQPHqfddJ5utxbqlk2yetMVjcrNjRxLU=;
	b=OPzMdTidqmWWBQFw0bzUi8m9wbkqGjW1iwf7tT36cZu7O5xf50/jAL2TeMrc4G5mKVKczl
	SsyOqcxK2LKMJlAg==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Zixin Wang <w1355457260@gmail.com>
Cc: frederic@kernel.org, "Ahmed S. Darwish" <darwi@linutronix.de>,
	John Ogness <john.ogness@linutronix.de>, linux-doc@vger.kernel.org,
	linux-rt-devel@lists.linux.dev, clrkwllms@kernel.org,
	rostedt@goodmis.org, corbet@lwn.net, wagi@monom.org,
	atomlin@atomlin.com, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v6] Documentation: real-time: Add runtime tuning guide
Message-ID: <20261125150114.eWhmDZrv@linutronix.de>
References: <20261125074658.33117-1-w1355457260@gmail.com>
 <awbgq0xQyJATel0_@localhost.localdomain>
 <20261125141409.330411-1-w1355457260@gmail.com>
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
In-Reply-To: <20261125141409.330411-1-w1355457260@gmail.com>

On 2026-11-25 14:14:09 [+0000], Zixin Wang wrote:
> On the second point, I ran a local QEMU test with the PREEMPT_RT kernel
> (7.3.5, HZ=1000).  The guest had 8 vCPUs; the test process was pinned to
> CPU 6 with:
> 
>   isolcpus=domain,nohz,6-7 nohz_full=6-7 rcu_nocbs=6-7 irqaffinity=0-5
> 
> The only difference between the two runs was the presence of
> rcu_nocb_poll.  The workload repeatedly created and closed perf events and
> epoll instances, which enqueued RCU callbacks on CPU 6; I traced
> rcu_callback, rcu_invoke_callback, and rcu_nocb_wake, and measured
> enqueue-to-invocation latency (including the grace period).  I ran three
> 80-iteration guest runs per mode, giving 480 callbacks per mode.
> 
>   without rcu_nocb_poll:
>     median 4.012 ms, p95 4.203 ms, max 7.040 ms
>   with rcu_nocb_poll:
>     median 7.003 ms, p95 9.971 ms, max 12.542 ms

This is pointless. The enqueue-to-invocation latency is meaningless. If
you have a RT task which preempts another task in its RCU-read section
then the grace period (and the invocation of all callbacks) will be
delayed until that RT task is done. Either way, even with things like
RCU-LAZY the callbacks can be delayed even further. That is fine.
Nothing really should rely on the callback execution.

The important part would be time spent in call_rcu(). And the latency
observed by an "real-time task" outside of RCU that is affected by this.
Also I prefer testing these things on bare metal so the host not pause
the guest for some reason.

> So far only you and Sebastian have replied to this patch.  I am waiting
> for more reviewer feedback before sending v7.

Yes, and if Frederick ask for different isolcpu handling then it needs
to be honoured ;)

> Thanks,
> Zixin

Sebastian
