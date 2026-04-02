Received: from galois.linutronix.de (Galois.linutronix.de [193.142.43.55])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1372D225413;
	Thu,  2 Apr 2026 11:01:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=193.142.43.55
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1775127687; cv=none; b=lc4xwsBnWhg+m/ZfdyS4Effdn1p9Fc9drR/4EMMGVjNnWUZFhhzPh4hweEKrRzGf+Ma1AabOvBVwlzvEBRc/Tc1oDbCvw2I7pFXJ6qgjWdwQPTReKcyQ7RGp8nm9Hsh0djRj3l/rWSfO60N0Wq7u0snfvx9jBGRH265/mVqdsFs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1775127687; c=relaxed/simple;
	bh=HvAxyVhIvidbpz1DZpxYIyrajxwZXuMExHUXv2//F84=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=fNt67bgWoqXIdcHELfPxrH9PWktKqAL9JuKVBdG5UoxiFmhBoNgBmSsW8tLmTA0oANfI9krWGDhrA82iEN45XPtSbGCACUBeBcDBamt0kSJCAmQim0SGroz/rMIN49tbcKo84L36xtYf6lTJ1f2xMoHKVetD7W8qI49RUyw8iRI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de; spf=pass smtp.mailfrom=linutronix.de; dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=MCkmaW2U; dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b=thLQLC72; arc=none smtp.client-ip=193.142.43.55
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linutronix.de
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="MCkmaW2U";
	dkim=permerror (0-bit key) header.d=linutronix.de header.i=@linutronix.de header.b="thLQLC72"
Date: Thu, 2 Apr 2026 13:01:22 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1775127684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Sz3xn2ZQPBg6wB2h32kjahJcwI3MOeKGZsVG6dFHxSs=;
	b=MCkmaW2U9bW5lLBv/lqWiyoCJw2Bs1kTNKnNmA8MlE1qjydCIFi+mEukbUcLPMGqTab53V
	EIMeIa/nBYSwegG/4ekZayurXqXKPC23FZsWmZWbnbZ3rCktc8IWmjqUyzl9O/4FHQ9smD
	YGTEliWXdopxz7seeWZz4wu3znZA1219sDZdmHOveimkAueaksjOtw2OrcU/D8pb3CjWcK
	3qb0q8XtVfTKYmZ36ypjhX9jEPMfSUXCJIApKqAIjcWbv10dvuhRWTGnVbxY8J+Qn34FWy
	xqeoUMx8mZ+O52tBKvo0wu87v8qUYikDDfDM0qryXjfE7oBQQqvygbFFT4HfQw==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1775127684;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Sz3xn2ZQPBg6wB2h32kjahJcwI3MOeKGZsVG6dFHxSs=;
	b=thLQLC72ksq7W8WOmvKwUomGrYFsWm8p37bHWwl1fnKLIa6Txfm0iWG3jAEGEfFZfBu6R2
	WGbvk4J/QL37dqCA==
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
Subject: Re: [PATCH v3] doc: Add CPU Isolation documentation
Message-ID: <20260402110122.2gkDqQ7Q@linutronix.de>
References: <20260402094749.18879-1-frederic@kernel.org>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260402094749.18879-1-frederic@kernel.org>

On 2026-04-02 11:47:49 [+0200], Frederic Weisbecker wrote:
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
> Acked-by: Waiman Long <longman@redhat.com>
> Reviewed-by: Valentin Schneider <vschneid@redhat.com>
> Reviewed-by: Sebastian Andrzej Siewior <bigeasy@linutronix.de>
> Signed-off-by: Frederic Weisbecker <frederic@kernel.org>

This documents also isolcpus= boot argument. The only thing that this
argument does and runtime can not do is the managed_irq sub argument.
This sub argument is a story of its own and it is of quite limited for
me taste.

However, isolcpus= is marked as deprecated. I suggest to remove the
"Deprecated - use cpusets instead" note as the static configuration is
fine if the system is partitioned once never changed within its
lifetime.
Are there any objections and if so why needs this boot argument be
removed (assuming we have a runtime equivalent knob for managed_irq)?

Sebastian
