Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BE9D220B22
	for <linux-doc@vger.kernel.org>; Mon, 23 Feb 2026 07:12:09 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771830731; cv=none; b=PCkOHotJQ9iXN8/zCy6OWqzn3Yz/ItFFcIDL/xH6sf1EsZBQLXqF10ncVt0KCC3O1qKGmuu2T7gIAwUTVWG2aZyzO8QhCGVsLhe6cEu7oXcf0m+aRTTII5aFdrltE0UnxSyoUchZzKJKIw+0fdfl6vN+TSKiBMs00RZYJQUSu+Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771830731; c=relaxed/simple;
	bh=7SQ9yonpiZcgFQLFPU68ywSGnuSeEx/p6F++hd10coM=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HVDvnYrJuOFv98qOl2HqQouXd5qEE3MY9RtL03ejVMcCBXlMA23kq9USJ/o22VoLdxb/G/wyf8X8PHcnMs//BLThZWR34+xvTZ2EIZXSFFMIUI6XAREoOE8/O3Buj7z1skucgm5qBRecbJZNdaQl1KCzmpp81/zoPNfGqDqjQC0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JLNAz0wp; dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b=Wm57RSQY; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JLNAz0wp";
	dkim=pass (2048-bit key) header.d=redhat.com header.i=@redhat.com header.b="Wm57RSQY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1771830729;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=Oqkz0VXUiDb+za1KG2dUiDS07XLP1fxzKChYeZrP3xM=;
	b=JLNAz0wpBSyGqcSHFIAwhewDTnweuk3rPT+PCbV6xFcj484Pz2GYON2xE+bJmIfO+XJudT
	TlpqjLjW+7yCrqiJFMH5VFpTHE++bkQcO3N0AbnrS4L2s3pdWW0Y1IA/OupkBGvf9fefl5
	ERHC6rEpy3n2mHy3EMOoCpIMBY86l9g=
Received: from mail-wr1-f72.google.com (mail-wr1-f72.google.com
 [209.85.221.72]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-644-f_2oYGudOqWZIwOERASN5g-1; Mon, 23 Feb 2026 02:12:07 -0500
X-MC-Unique: f_2oYGudOqWZIwOERASN5g-1
X-Mimecast-MFC-AGG-ID: f_2oYGudOqWZIwOERASN5g_1771830726
Received: by mail-wr1-f72.google.com with SMTP id ffacd0b85a97d-435add03f12so697980f8f.3
        for <linux-doc@vger.kernel.org>; Sun, 22 Feb 2026 23:12:07 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=redhat.com; s=google; t=1771830725; x=1772435525; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Oqkz0VXUiDb+za1KG2dUiDS07XLP1fxzKChYeZrP3xM=;
        b=Wm57RSQYVFbxeJveQuwvG+2AXGmokaqUAv3vRG5B8nGXdyP5KJxL0KwTC2bsRzziNF
         NRAj9XAb4IodO4YhzXZDndaWJ1XOexL6pyi+rwtyhC8feOBPIj8uBFb4NJO4P2beAKNX
         +b8JeEZUVixJB4rqtXKcBiONQoIfn+xRvW7XijqXqm2LSgRPDhBE6LLMkMdapoISpcEY
         m9Q1+dkoXrpMgPS01XFxakUi4oQNxSieyGgy2bUkhK6AKWNiLCXmXzhSfricqJr3R6XM
         4vMzC81xomGnCjrIhz7QBhFuzjIMuFQ0kA+Qf8iqagZKuwGXVDu4JebzWNqXIKskj6SU
         CWXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1771830725; x=1772435525;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=Oqkz0VXUiDb+za1KG2dUiDS07XLP1fxzKChYeZrP3xM=;
        b=SrJFsmqr4fxOPQ00JM4OAH85Hmlf8v1VOAQcybxlyA3MpWjW9VC5dO7uNeR5BMImiv
         vN/kM4T3y5sORdx+ZhXq43G0Ey83eVW70PWzyYGpVVj14/by3L5M/W1i3uUYqLg1s77u
         INAYy/Fq4XWaFT7m6NvyZU2sSB7ql7Ew2+OED1f9SR6qQH/xr2niLSwo+bjY1T788Si/
         jqrCT+Ob2iMM4xvriLkZ9VM6JDuIJhJWy5EQT8Jz1CCI+stEIP+pmoFshl1rz315UOjX
         WAP83PobkIjjQNwvwNLAa3NyyH2wAIDGNpKsUoj6Em5UALN0grpt2oo6ddL2jP0LrNKj
         3a8Q==
X-Forwarded-Encrypted: i=1; AJvYcCXOd0ClSTyHsvxf8jeFbZRHQXIi8wjQILkr0+7V5iIYK4cWP0b52G1xZJCUx9xSzg/5POXLNJeXOV8=@vger.kernel.org
X-Gm-Message-State: AOJu0Yw2n9Ij0FtG+nipLpje992I1nV3EWYQ8nw50cGA+qKVzHLB4ynM
	ZRoy0UQNED6d2/zUBKUtsnPhMaG4GuEAthHHqxzs6Dd4Lv0OXsQ6IEpaffhWct5Jq0yZiLn/qGx
	n9VLgHgIdmTspeyij5RsgPW9aTLA/WWJKSunvxM2kTtfHdrMMeObMa92qXPYZ4WMh2g4M3w==
X-Gm-Gg: AZuq6aJUuNX/Z8ML+BnPXdtvWcmJw2VDZtLz4L26MzwKjL0vZ+/dgCOoAGIrJW/nBK9
	LpNyNjt8oeaYbZqbTqflqyTa+rDYZnUse/xxaFvfQhzo8+kHflXJTbQvJpXwnM4lA9B9EYINHJr
	jZB1plgB2byPLXVZu5mLDD1QrD5H06P60adPKEOJpzh0pdxMfADbMOmMN4PxIFAyFo+PhoGWyTV
	MFVnjcMFxL0WNRSrNE4ikQVpRNgn56G9hcwWmkRZCU1iSRy3/dVCG3UXyStM7UDkNvmzq689Kd2
	JL4fNCantyKgDdlp+g/Iw9yFmMp0mryxQc+wKQqW4tyc1Y0xz5QiNK3G1cbIr3TdqJbDfLzYEMT
	F7sEnQRExbePfvfbHxEs9DZl3qF9DB7xSvNw6Nwo9xffJ5l6gHSY=
X-Received: by 2002:a05:6000:2f83:b0:431:a0:7dea with SMTP id ffacd0b85a97d-4396f181aa5mr14389812f8f.40.1771830725425;
        Sun, 22 Feb 2026 23:12:05 -0800 (PST)
X-Received: by 2002:a05:6000:2f83:b0:431:a0:7dea with SMTP id ffacd0b85a97d-4396f181aa5mr14389774f8f.40.1771830725035;
        Sun, 22 Feb 2026 23:12:05 -0800 (PST)
Received: from jlelli-thinkpadt14gen4.remote.csb ([151.29.73.19])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-43970d4bf89sm16246902f8f.29.2026.02.22.23.12.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 22 Feb 2026 23:12:04 -0800 (PST)
Date: Mon, 23 Feb 2026 08:12:01 +0100
From: Juri Lelli <juri.lelli@redhat.com>
To: Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,
	Ben Segall <bsegall@google.com>, Mel Gorman <mgorman@suse.de>,
	Valentin Schneider <vschneid@redhat.com>,
	Jonathan Corbet <corbet@lwn.net>, Shuah Khan <shuah@kernel.org>,
	Qais Yousef <qyousef@google.com>,
	Clark Williams <williams@redhat.com>,
	Gabriele Monaco <gmonaco@redhat.com>,
	Tommaso Cucinotta <tommaso.cucinotta@santannapisa.it>,
	Luca Abeni <luca.abeni@santannapisa.it>,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH RFC 1/4] sched/deadline: Implement reclaim/soft mode
 through SCHED_OTHER demotion
Message-ID: <aZv9wQKrayi85wRm@jlelli-thinkpadt14gen4.remote.csb>
References: <20260219-upstream-deadline-demotion-v1-0-528b96e53d12@redhat.com>
 <20260219-upstream-deadline-demotion-v1-1-528b96e53d12@redhat.com>
 <20260220194702.GO1282955@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260220194702.GO1282955@noisy.programming.kicks-ass.net>

On 20/02/26 20:47, Peter Zijlstra wrote:
> On Thu, Feb 19, 2026 at 02:37:34PM +0100, Juri Lelli wrote:

...

> > @@ -1419,6 +1444,84 @@ s64 dl_scaled_delta_exec(struct rq *rq, struct sched_dl_entity *dl_se, s64 delta
> >  	return scaled_delta_exec;
> >  }
> >  
> > +/*
> > + * Check if a deadline task can be demoted when it exhausts its runtime.
> > + * dl-servers and boosted tasks cannot be demoted.
> > + *
> > + * Returns true if demotion should happen, false otherwise.
> > + */
> > +static inline bool dl_task_can_demote(struct sched_dl_entity *dl_se)
> > +{
> > +	if (dl_server(dl_se))
> > +		return false;
> > +
> > +	if (is_dl_boosted(dl_se))
> > +		return false;
> > +
> > +	return !!(dl_se->flags & SCHED_FLAG_DL_DEMOTION);
> 
> It is already implicitly cast to bool by virtue of the return value, no
> need for that explicit !!.

Indeed.

...

> > +/*
> > + * Demote a deadline task to SCHED_OTHER when it exhausts its runtime.
> > + * The task will be promoted back to SCHED_DEADLINE at replenish.
> > + */
> > +static void dl_task_demote(struct rq *rq, struct task_struct *p)
> > +{
> > +	struct sched_dl_entity *dl_se = &p->dl;
> > +	int queue_flags = DEQUEUE_MOVE | DEQUEUE_NOCLOCK | DEQUEUE_CLASS;
> > +
> > +	lockdep_assert_rq_held(rq);
> > +
> > +	if (dl_se->dl_demotion_state != DL_NOT_DEMOTED || !dl_task_can_demote(dl_se))
> > +		return;
> > +
> > +	dl_se->dl_demotion_state = DL_DEMOTING;
> > +
> > +	scoped_guard (sched_change, p, queue_flags) {
> > +		/*
> > +		 * The task's static_prio is already set from the sched_nice
> > +		 * value in sched_attr.
> > +		 */
> > +		p->policy = SCHED_NORMAL;
> > +		p->sched_class = &fair_sched_class;
> > +		p->prio = p->static_prio;
> > +		p->normal_prio = p->static_prio;
> > +	}
> > +
> > +	dl_se->dl_demotion_state = DL_DEMOTED;
> > +
> > +	__balance_callbacks(rq, NULL);
> > +	resched_curr(rq);
> 
> Doesn't sched_change already force resched on class degradation?

It does. Will remove.

> Anyway, I love how simple this has become ;-)

Yes! Quite handy. :)

...

> > diff --git a/kernel/sched/fair.c b/kernel/sched/fair.c
> > index c16b5fd71b2d5..59e5459a75492 100644
> > --- a/kernel/sched/fair.c
> > +++ b/kernel/sched/fair.c
> > @@ -9415,6 +9415,14 @@ int can_migrate_task(struct task_struct *p, struct lb_env *env)
> >  	if (p->sched_task_hot)
> >  		p->sched_task_hot = 0;
> >  
> > +	/*
> > +	 * Demoted DEADLINE tasks cannot migrate. Their bandwidth reservation
> > +	 * is tied to the demotion CPU and will be released when the task is
> > +	 * promoted back to DEADLINE or explicitly switched to another policy.
> > +	 */
> > +	if (!dl_task_can_migrate(p))
> > +		return 0;
> 
> I suppose this works, the alternative is doing migrate_disable() in
> demote and migrate_enable() in promote. Not quite sure which is the
> least horrible in this case :-)

Yeah, I was undecided between the two. Can switch to migrate_disable().

I actually spent some time trying to figure out how to actually allow
migration while demoted w/o breaking things, but the attempts so far
ended up with not really pretty locking and retries. So, I decided to
leave this 'for later' and check first for interest on the feature.

Thanks for taking a look!

Juri

