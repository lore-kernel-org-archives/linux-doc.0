Received: from mail-pf1-f176.google.com (mail-pf1-f176.google.com [209.85.210.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 88C7D23959A
	for <linux-doc@vger.kernel.org>; Wed,  2 Apr 2025 12:56:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743598584; cv=none; b=WO0/P1dI9H27XnQP85YNFTkzgc72iUIFH7KRvfXu8fV8+2U6WAz0vw1/2ivm1S4YFMij7+TnlaPszhmd7dJvbxBcxEUJOlk4z3MR5TknZaAXeVKSJnWYp8fQlDJ5UtFEk2BH9wCY5qJbMtVJKccZ/EZFGNSCdds4A9KLOSvZ2Ac=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743598584; c=relaxed/simple;
	bh=BitbmQ18PBYQ2MRM1Bk4u8+FdoDVYIT+fgKGpO5bnF0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=JaeQZXwfYRZonyytkZtvX4I3RxJoq+7V3QK/OYlnqvoHNGfDOvAqMI4a9/K6g2AUNlYfqzpYG+S5y+7Plv1AWYAb9nyNdqyIfTArFwgzNfYe3lR5E1rXX5Fmh7oIo4xgnQXrOSwAq9pycFI9YdFQt6Mh3vGSQI3YUAhdUfbkOJQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=yeV1KMUW; arc=none smtp.client-ip=209.85.210.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="yeV1KMUW"
Received: by mail-pf1-f176.google.com with SMTP id d2e1a72fcca58-7398d65476eso64795b3a.1
        for <linux-doc@vger.kernel.org>; Wed, 02 Apr 2025 05:56:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743598582; x=1744203382; darn=vger.kernel.org;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=6aj9wnMpg3IXwhlTHrLN8H+JvJCrmipv0ibRpD0sCnA=;
        b=yeV1KMUWZn8Rfqk9kjTzU9H2I1OFh8hOAHAU19p68FCA7LrVPxqfIV+naQkHC4g5yn
         d8la0o8F5245r/Lk/zcuxRqOfAypm/Pp79JfcqsxTzbEvdvarJrjytWzGuV4z/78cg9R
         IUBz4IaN0gXDAk96tblxz4hfEzw/usa9ltKoMu8itNVkvUMfPQk47SlFVjN9wDFDHmbD
         SA7SWjIsfte5aGgWwxgRoZgnI9D0ufgTdqtvCB0ON0PHmqCVtoxst6DmlyAoBxCrXsRj
         CMGNa7r0i1+cgCAVXVPL9pNfnk6WoKbCkKYGVI0kHm+vYEPbdH9VnKSw8WugsFwJyAZA
         NxLw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743598582; x=1744203382;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=6aj9wnMpg3IXwhlTHrLN8H+JvJCrmipv0ibRpD0sCnA=;
        b=aj7StgUJkfvRl7LbBM0VPz1W2dCyqWq0NfrNJdgvvI5nR/vXggjdKiizBBtUum9+Yf
         IHLFdYbmHDP7/PNlJQXGPDMS8S3WGnkO4C8NPKVGP1BVrCpHpF9T/24iBJXfblNbTIty
         FUYvjCAhNXZISLw6gtmbMb/zA6MBDBPaDfUlimsj5g0OFvbb8k7SqP/ZAvSD1ozKSoYD
         iq3cIpgoAqyOENfH2187xIAiMYwM0NJ7F22EvAQaxWiPFRuT2bJl90+GxXktWzb1tr/w
         1+GN9xXVY4FqtQQPNjCfxeDx5Idh/4gxaCeIUz+8QbGKB/3s51tCN9w/eoZkyhBKJK2h
         fOJA==
X-Forwarded-Encrypted: i=1; AJvYcCVWRAqLaRruvBObQcZtMcV57O6dinv+BGZ6UqOQB4h0qgSktpsU4Y7Fq60wBCYTiB/R0yMozF+v1GI=@vger.kernel.org
X-Gm-Message-State: AOJu0YwGXrN2Eb0SQeEhx/akdf8lP6wIDlsHsPJSEct9U8puHJXacjHA
	z+tk9r2Z9jZrMxdkIXrJl6NANQwJeynUpzXwhyX65CRg9D79/NEWBQo7LHCYn58hEX05Q+zXB4z
	/OA4ZMm++fKB/8n0ByJH0bfZY607iEfcJJemxIQ==
X-Gm-Gg: ASbGncuz9czM+JSDCS8eYmPfth6ufpd0JaQoZyQkpYb+S/V4h89OkxRt1NV5sgSnAXb
	4aWtBrBTmBqpaI0Wq3cXSsnbOGG9PJ/QSOpiKluqFJWcWsGGpsnqCSL9XiuQ270bm6vQOrF97Gb
	ztsykQqNC1+SKsEiZ7cCcX9TK6LKE=
X-Google-Smtp-Source: AGHT+IGMlc1egG12E4QIlDCeUIjS3K9est1MsL2qfp4chiKw3Ryx9LvLDjekChsuHSuaM4TLSX5zggbZyYhlR3rxBS8=
X-Received: by 2002:aa7:888d:0:b0:736:4d05:2e35 with SMTP id
 d2e1a72fcca58-739cb071691mr2504206b3a.3.1743598581694; Wed, 02 Apr 2025
 05:56:21 -0700 (PDT)
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
References: <20250311170451.611389-1-leo.yan@arm.com> <20250311170451.611389-5-leo.yan@arm.com>
 <CAJ9a7VjqGbpPPeR3-PH5vYHNMwqnPLJ+Ouik017Qh717wFOJ0g@mail.gmail.com>
 <20250401150019.GC115840@e132581.arm.com> <CAJ9a7ViKeqNp_c0+w2mkdujLvzs0UA=Xbm5bG7K-kA86AjJ=eA@mail.gmail.com>
 <20250402123151.GH115840@e132581.arm.com>
In-Reply-To: <20250402123151.GH115840@e132581.arm.com>
From: Mike Leach <mike.leach@linaro.org>
Date: Wed, 2 Apr 2025 13:56:10 +0100
X-Gm-Features: AQ5f1JrKB1QjXuLoaBevwrVx7VtVcaXa0uY21BBclnMTNdvjzqyebSyzIueWZrE
Message-ID: <CAJ9a7VhOg6emwDMa+rZM4TqZcMPY=fYSxzb4EQVxOhY0T-tg_Q@mail.gmail.com>
Subject: Re: [PATCH v3 4/6] coresight: perf: Support AUX trace pause and resume
To: Leo Yan <leo.yan@arm.com>
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>, James Clark <james.clark@linaro.org>, 
	Jonathan Corbet <corbet@lwn.net>, Alexander Shishkin <alexander.shishkin@linux.intel.com>, 
	coresight@lists.linaro.org, linux-arm-kernel@lists.infradead.org, 
	linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

Hi Leo

On Wed, 2 Apr 2025 at 13:31, Leo Yan <leo.yan@arm.com> wrote:
>
> Hi Mike,
>
> On Wed, Apr 02, 2025 at 09:45:20AM +0100, Mike Leach wrote:
>
> [...]
>
> > > > >  static void etm_event_start(struct perf_event *event, int flags)
> > > > >  {
> > > > >         int cpu = smp_processor_id();
> > > > > @@ -463,6 +484,14 @@ static void etm_event_start(struct perf_event *event, int flags)
> > > > >         if (!csdev)
> > > > >                 goto fail;
> > > > >
> > > >
> > > > Is it possible here that the first call to etm_event_start() also has
> > > > the PERF_EF_RESUME flag set?
> > >
> > > The first call has a flow below, using flag 0 but not PERF_EF_RESUME.
> > >
> > >   etm_event_add()
> > >     `>  etm_event_start(event, 0);
> > >
> >
> > When I looked at the vague comments in the perf source - it seemed to
> > imply that ->start() calls could overlap - so the associated event
> > that resumes trace could occur at the same time as the initialising
> > start from paused for the trace operations.
>
> Good point.  A subtle but important thing is the 'cs_etm' event must be
> an event group leader, otherwise, the tool reports error:
>
>   # perf record -m,64M -e cycles/aux-action=pause,period=10000000/ \
>       -e cycles/aux-action=resume,period=10/ \
>       -e cs_etm/aux-action=start-paused/u -- /mnt/sort
>   Events with aux-action must have AUX area event group leader
>
> If the 'cs_etm' event is the event group leader, it will be always
> enabled ahead other PMU events.  So etm_event_start(event, 0) is
> invoked prior to PMU events enabling.  As a result, this can avoid the
> race condition you mentioned.
>
> I confirmed with ftrace log:
>
>   sort-901     [005] d..3.  1033.827186: etm_event_add <-event_sched_in
>   sort-901     [005] d..3.  1033.827187: etm_event_start <-etm_event_add
>   sort-901     [005] d..3.  1033.827283: armpmu_add <-event_sched_in
>   sort-901     [005] d..3.  1033.827287: armpmu_start <-armpmu_add
>   sort-901     [005] d..3.  1033.827288: armpmu_event_set_period <-armpmu_start
>   sort-901     [005] d..3.  1033.827292: armpmu_add <-event_sched_in
>   sort-901     [005] d..3.  1033.827293: armpmu_start <-armpmu_add
>   sort-901     [005] d..3.  1033.827294: armpmu_event_set_period <-armpmu_start
>   sort-901     [005] d..3.  1033.827298: armpmu_filter <-visit_groups_merge.constprop.0.isra.0
>   sort-901     [005] d..3.  1033.827298: armpmu_enable <-perf_pmu_enable
>   sort-901     [005] d..3.  1033.827301: armpmu_enable <-perf_pmu_enable
>   sort-901     [005] d.h1.  1033.827304: armpmu_dispatch_irq <-__handle_irq_event_percpu
>   sort-901     [005] d.h1.  1033.827306: armpmu_event_update <-armv8pmu_handle_irq
>   sort-901     [005] d.h1.  1033.827308: armpmu_event_set_period <-armv8pmu_handle_irq
>   sort-901     [005] d.h..  1033.827322: perf_event_aux_pause: event=ffff000207503e40 pause=0
>
> > If we are guaranteed this cannot happen then we are good to go!
>
> Now I think we are safe, right?  ;)
>
> Thanks,
> Leo

I'd agree with that!

Mike

-- 
Mike Leach
Principal Engineer, ARM Ltd.
Manchester Design Centre. UK
