Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8763C39B95B;
	Wed, 25 Mar 2026 09:56:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1774432596; cv=none; b=nB5oLS5Jozi9KqwGmQ3iAgWyS0o7evtn3tT+3GMFf4xxUMsqlqRpcA2QP7v90VQaP8bdvP++V6xfOl7AILM3EOQcBC3TLeNT5v49ZZI4+7/v7V+7X+9DBkrqXvq/xhKFxKAz7dCgEuiOZNOC1GGWqwUrsmMmSTiNWKfRKToxbfo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1774432596; c=relaxed/simple;
	bh=lzJB7EbrHC2KlsN4ad0AIXE/JqPFffVa4MuVG4nprqg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=raTjEddeQBovwkbFUEEiKFkLoQvedeuOaQHOsI2Vmh6yYDzTA4GLn9GxJB/FiBy4xO1NQ1ZTbp7mwtHRQdAbYk3M3U+d2+1mezHUUA4uN9zUpGr4y71q4L4ribTipnnMqWNf+uAtB6pQsFzHhwk2WgKcSYdVTTAPIuoYj0P1Tng=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=dyZRqhwm; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=j67m7QkG; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="dyZRqhwm";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="j67m7QkG"
Date: Wed, 25 Mar 2026 10:56:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1774432587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yo43Mk65qIi3fVAhr90NoZvnNv04dJVqhDfc2jkLXUQ=;
	b=dyZRqhwmGHRDBqNCP852OEwrrmdokd34RZ/dh8iqvruAekLf8RyRGlDLGQv+eTIismmwBj
	Wsz4q+/tf7RMcexbIk/sVSloNGDErormvM6oPtoTYRs21dU4vGJz0OICF1KE2mFSKSp2g9
	s/26/SVQrgsNMuqEKAoE5QPs+KqYkTmSNSxHoEyrG4DlyktJ/HFheZh2H8FKk5gj8HVEk7
	mryOkXOczNrmtI9yjk4cgAyizmOTH1YjJqJM10IypzIcHXVmhG/X8XjAqpJhp6sLMURRSO
	GJWdeeTFzV1dtEV4XZp3tEyvdkkUmVsnwFoG9tNejcsSQyES3XiYjPSLjNNDJQ==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1774432587;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=yo43Mk65qIi3fVAhr90NoZvnNv04dJVqhDfc2jkLXUQ=;
	b=j67m7QkG/T09g7TX1updhEyOfg/iinv6Be6bYTMWphS/myAxELmqHSaQmKRY0fHCEn+qF8
	aqN+p9bt5i8aOtBQ==
From: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
To: Waiman Long <longman@redhat.com>
Cc: Frederic Weisbecker <frederic@kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
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
	Vlastimil Babka <vbabka@suse.cz>, linux-doc@vger.kernel.org
Subject: Re: [PATCH] doc: Add CPU Isolation documentation
Message-ID: <20260325095625.dFHbtoPr@linutronix.de>
References: <20250809094247.8384-1-frederic@kernel.org>
 <20260324153823.VKwebBuG@linutronix.de>
 <579827ac-a933-45ec-b396-01656c30c9e4@redhat.com>
 <20260324164005.eBNX2ppQ@linutronix.de>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260324164005.eBNX2ppQ@linutronix.de>

On 2026-03-24 17:40:07 [+0100], To Waiman Long wrote:
> On 2026-03-24 12:00:17 [-0400], Waiman Long wrote:
> > > while looking at this again, shouldn't you also do
> > > 	echo 7 > cpuset.cpus.exclusive
> > > 
> > > to ensure the CPU isn't used somewhere else?
> > 
> > For backport compatibility, the use of cpuset.cpus.exclusive is optional for
> > creating a local partition underneath the cgroup root. The example should
> > still work without setting cpuset.cpus.exclusive.
> 
> I would have to double check but I think only after the
> cpuset.cpus.exclusive the CPU vanished from the cpumask of my current
> task.

Let me take that back. After setting cpuset.cpus.partition the CPU mask
of the remaining tasks gets updated. All good.

> > Cheers,
> > Longman
> 
Sebastian
