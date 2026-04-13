Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AFA91137750;
	Mon, 13 Apr 2026 15:57:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776095850; cv=none; b=UJVams0be274X5ojd1FLeRXvAdJBwqnQjapcNKOF1vGV18vPsWjfa7oqxS+H+l+TXcRiumztkkh/gayAlEnBeLbHvn5JX7bLSX6VvZDC720Vm8ER20phjIN8JW4EOV0txkGBeb/0B9BYqJ4ZBJrC90SYCvN/CfB/TZmure6trmI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776095850; c=relaxed/simple;
	bh=rGSNq5VArAsp1Wib2Fo335lQXUyQw/eKNvF0wj3DBv8=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ssyvCFe/UHabTV0a5YqUHtfuovuKGToZ6BcCfhCTwQ9onEnXTmgTNw4XbH8SXZghJvkXsIzQ5DMh45miMBYcMTQGDMKigt7Lap4ku9Fqp3mX0P4ZX5y7jngwsCqGsAsLBndh14rY50nDzhBo2Zg8jjfM8kd10NI1KweksRk1ff0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=nCDxQXzD; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=wVfkDlGK; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="nCDxQXzD";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="wVfkDlGK"
Date: Mon, 13 Apr 2026 17:57:26 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1776095848;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TiJnbA5G1xCsPZTpDxI68a2BB+sjEaS3L1SLn0OUpVs=;
	b=nCDxQXzDxSmdRNkmZ5G5aWAw0rWw7FS72vmwcnAclBZyG0A43ZdDO0R8teCjn8v+EBHMCV
	ovG+feSex2fCMsRj6N57b2cXfL8c/bHGMdQjQqiqhmDSxKfSmyHcd5uu9p6o6Z5QA/NTXw
	dWpcmNteFC8apnFU4SwH6WpSjjh7zV7kWkgXgY97mfDZOQarTuTPQGmXb4tuUa/x7hKVqN
	mguSUUgJf+zX9vg8Dy24FrmAAm2FdCIbyKT/vM68xWbzFTsaSxyfuotoLGRIUwTERU0oa3
	CP4I/Kk67cV8hymkYk5IqhFNwwIds9cNL050zyjESRBi0pJVnxpY8rmBLDVDbg==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1776095848;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=TiJnbA5G1xCsPZTpDxI68a2BB+sjEaS3L1SLn0OUpVs=;
	b=wVfkDlGKADM+++bW4tRhPum6XiPNzwknDvLO6kx9LUB3I/hC99zbsMzc0GjKGn5S7aIEyX
	FXSJubwEZ3LaGeDQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Valentin Schneider <vschneid@redhat.com>
Cc: linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
	Aaron Tomlin <atomlin@atomlin.com>, Christoph Hellwig <hch@lst.de>,
	Frederic Weisbecker <frederic@kernel.org>,
	Jens Axboe <axboe@fb.com>, Jonathan Corbet <corbet@lwn.net>,
	Ming Lei <ming.lei@redhat.com>, Thomas Gleixner <tglx@kernel.org>,
	Waiman Long <longman@redhat.com>,
	Peter Zijlstra <peterz@infradead.org>,
	John Ogness <john.ogness@linutronix.de>
Subject: Re: [RFC PATCH] Documentation: Add managed interrupts
Message-ID: <20260413155726.BpD5Eh0T@linutronix.de>
References: <20260401110232.ET5RxZfl@linutronix.de>
 <xhsmhlderi1f6.mognet@vschneid-thinkpadt14sgen2i.remote.csb>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <xhsmhlderi1f6.mognet@vschneid-thinkpadt14sgen2i.remote.csb>

On 2026-04-13 11:45:33 [+0100], Valentin Schneider wrote:
> On 01/04/26 13:02, Sebastian Andrzej Siewior wrote:
> > One more point: Given that isolcpus= is marked deprecated as of commit
> >    b0d40d2b22fe4 ("sched/isolation: Document isolcpus= boot parameter flags, mark it deprecated")
> >
> > and the 'managed_irq' is evaluated at device's probe time it would
> > require additional callbacks to re-evaluate the situation. Probably for
> > 'io_queue', too. Does is make sense or should we simply drop the
> > "deprecation" notice and allowing using it long term?
> 
> AIUI the deprecation notice is more for isolcpus=domain, i.e. the scheduler
> part, but it's still relevant for e.g. managed_irq. FWIW Openshift uses:
> 
>   isolcpus=managed_irq,<cpulist>
>   nohz_full=<cpulist>
> 
> and cpusets for dynamically isolating CPUs from the scheduler.

For the managed_irq you could argue that this could also use some
runtime configuration at which point isolcpus= would have a runtime
counterpart and could be removed.
After going through all this I concluded that it makes hardly sense
since you would require callbacks in every driver using it or other
magic "to reconfigure" but it already makes little sense using it.

Either way, I don't see anything wrong with using isolcpus=domain if you
have a static setup and need/ want reconfigure at runtime.

Sebastian
