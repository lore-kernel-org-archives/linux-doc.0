Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 831433793D0;
	Thu,  2 Apr 2026 07:38:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775115497; cv=none; b=YKZi12yDlTUsL3Wq7CgIqBv4vOwEnd++sGrUoF5kKJ7kLJqVs1iCIgD0/X5kEy+EZp/f8iCTJP+1MIU6vH8PVbLfm5u2c6Ymhr5Os+UIlcwTD99ihmbwGnOPMuKpXJ9V6Z4aM1N4Aoap5nIat32HnVGhkpJpv2HjDl0ta8K4RXE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775115497; c=relaxed/simple;
	bh=KJk5DVapy8Usiho6W8B+lfNAEDDxkAhHWdAGw0jT0y0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UlekEno2ovaaixNJ6Hov/9qZ91aYp4/gsGl9xbIZxVWRrRhy1M1UuhkHYSlG6SLtSHprGbCGS6zw6r/zpz4NwH3uaFbYwZl6Tttm2Smkk0MAe/da3TmRzOPIlge52DZk1NpQ1KhKeWJ465GA6Mr85tAqpQVMWxPdX8Jtxr363Ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=2MuO0V0V; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=5E1LFbJo; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="2MuO0V0V";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="5E1LFbJo"
Date: Thu, 2 Apr 2026 09:38:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1775115495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hd7tEobHj6TgvtlevZYSAZcyjARg/iG/s/zBedKQrIs=;
	b=2MuO0V0VbheWRZOIcHv6aJNsqGABNh+IAYrXSjPAxZeWzWxPWupVrvIs9/4uTBYt/fKrCd
	I3D0ILnzhUFUAcmpES9lDnPqqu53GMqjTuA1ND7BjS5yIb+XMwsyQCU7v3ndsOYipnNjfv
	QppddQ3X5n4qBYGAYjc5VOAelxgMqFNANW0zyUsEQlMNHkg4Qm0CWsmJRaQLH9hACxgvdu
	iMxQII6PelJgzDjUB2rRZpQj/kDQ3VO1+fi9ZxVSjoKzKyiZbXdVG74pH38/4qOpgrXUkv
	GJHMDEuD1PXMcTncDlAS8NyhyVtpkQJLr/2ikas/7szHGFcBG84N+085rrHJag==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1775115495;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=hd7tEobHj6TgvtlevZYSAZcyjARg/iG/s/zBedKQrIs=;
	b=5E1LFbJoOgXGItVR7gxmwk5PNQqn6NJHYo9TKHlcOApYU5LtIDquhtM8rg4v3wKllNCwSQ
	AA5g2Y1WVlFzZZCQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Frederic Weisbecker <frederic@kernel.org>
Cc: LKML <linux-kernel@vger.kernel.org>,
	Anna-Maria Behnsen <anna-maria@linutronix.de>,
	Gabriele Monaco <gmonaco@redhat.com>,
	Ingo Molnar <mingo@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Marcelo Tosatti <mtosatti@redhat.com>,
	Marco Crivellari <marco.crivellari@suse.com>,
	Michal Hocko <mhocko@kernel.org>,
	"Paul E . McKenney" <paulmck@kernel.org>,
	Peter Zijlstra <peterz@infradead.org>, Phil Auld <pauld@redhat.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Thomas Gleixner <tglx@linutronix.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Vlastimil Babka <vbabka@suse.cz>, Waiman Long <longman@redhat.com>,
	linux-doc@vger.kernel.org, Bagas Sanjaya <bagasdotme@gmail.com>
Subject: Re: [PATCH v2] doc: Add CPU Isolation documentation
Message-ID: <20260402073813.-g348NLt@linutronix.de>
References: <20260326140055.41555-1-frederic@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260326140055.41555-1-frederic@kernel.org>

On 2026-03-26 15:00:55 [+0100], Frederic Weisbecker wrote:
> nohz_full was introduced in v3.10 in 2013, which means this
> documentation is overdue for 13 years.
> 
> Fortunately Paul wrote a part of the needed documentation a while ago,
> especially concerning nohz_full in Documentation/timers/no_hz.rst and
> also about per-CPU kthreads in
> Documentation/admin-guide/kernel-per-CPU-kthreads.rst
> 
> Introduce a new page that gives an overview of CPU isolation in general.
> 
> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>

Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

Sebastian
