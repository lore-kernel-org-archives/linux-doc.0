Received: from mail-ed1-f48.google.com (mail-ed1-f48.google.com [209.85.208.48])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 36E711A6831
	for <linux-doc@vger.kernel.org>; Sun, 19 Apr 2026 20:58:50 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.48
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1776632331; cv=none; b=IGKHa22ukR2ZTUUele21TWqz3Qev5ofZ3pVZnZeauDAVUKHJ9FpRGF2Lv4/DOkY5AVvKglIYiazdI1txPUNn7dxtMSdILkKZZHR4giQ0969cH9WqUOmIBG17bVJgZz0zuFys8+9P9Nc29fM6Osblxig6sZkIO8SnF8QdQoXioP0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1776632331; c=relaxed/simple;
	bh=pYvmXJK7ShyAWrktEqqDf1tPWzEOyHMDPfk9MXaez1I=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=marGPiWvbbIkkr84atsb8GyO5hPTk57ZzSGG91dMbJhZz+H9Vat8RaDitNqz+mQdf/wH18+o6KBTDKU9nYQn8H7YofAaEkwVxrWbnwRMfYcN2KC7QosoDRfdrEQYdKl3qGQ8ic4jGq+o7j2KnJsm3pGRGxgfNlrpFBmItXP5Glk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io; spf=pass smtp.mailfrom=layalina.io; dkim=pass (2048-bit key) header.d=layalina-io.20251104.gappssmtp.com header.i=@layalina-io.20251104.gappssmtp.com header.b=irGx09Zc; arc=none smtp.client-ip=209.85.208.48
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=layalina.io
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=layalina.io
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=layalina-io.20251104.gappssmtp.com header.i=@layalina-io.20251104.gappssmtp.com header.b="irGx09Zc"
Received: by mail-ed1-f48.google.com with SMTP id 4fb4d7f45d1cf-6715006f4f7so3637031a12.2
        for <linux-doc@vger.kernel.org>; Sun, 19 Apr 2026 13:58:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=layalina-io.20251104.gappssmtp.com; s=20251104; t=1776632328; x=1777237128; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=xCNzisutGUqqxIciIB6xqQwTkTHvKFiC4Ptsq6txWYA=;
        b=irGx09ZctFZKGiPjq4hZTKKo5Kc+84vRyjC54bQKYAXPzzOhjfoXcWUDsNSUzJU1+Q
         l8S7JfZU8trC8n7OnBIoc1Ghprb31reKfy1JDP6iYVsk0SKUDHEBbu47hvLsvqHXPbGf
         5WnXVBDfOS4DURgFNP7E73h4SvFHOJwLx/hFt++5I0jq02n0EjP8N0JYezdeSh1bqotv
         2n+qALcYyaDxIZuCPduwEXH51YIKixLHirUGuMVAPh+IDV35vP8m+kHjxZ1hvwzVJxkt
         d7sdpyBD8CeT6xW51vjKrKO4c+6gmNfcUXsppgXJKyTr57W4xJUIFXAYJEfaXvVyG054
         ZjWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1776632328; x=1777237128;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=xCNzisutGUqqxIciIB6xqQwTkTHvKFiC4Ptsq6txWYA=;
        b=KQaYG8pC75zdoZyJHJvjz0m5ulSyt9g2LO3Vh7glr204q9BCZg7TAi5/EZMnLQduaG
         Oakn03X7HKcRAenGNCQk+L5rns0X45vvN+H7S475lJ/wzLQ/Mk/ggaLuPoClf0Lwie/q
         wynILUDAXQVcjztCcfqHIF5gOWNqSQsmFj/LB+2ljaILdyt4ziTyQO+XIkQMozD7wMs7
         G3fcdsEa/qWOCKnpSTT2KXS62xaw1YFllXyfkXzpAPeLm//722crM0Rjdzdc9E+2bDwC
         MKJYjGf07DuA8gRs1FmIFJlmIwnFBI8s8sa++hxgRCIscDH8wQkgs49aDpIeJ4PmvL19
         xbiQ==
X-Forwarded-Encrypted: i=1; AFNElJ8qxc4YUt88BZl8ks+jxZ4gulBXapVM2LMWcWNTbCkCUcHl33v0RUjhdjqZ+Cm+ZWyKb+rv7pPWpss=@vger.kernel.org
X-Gm-Message-State: AOJu0Ywe5Mos424hg55Uak87oTt2lnLYONxNY5995fLCC8N/K8O+0frR
	46M8GYt+FNxdYX2IEy6HeusbG/fjqO1aivNGCd6x10Zz36StNzO9Jdu3gXfq9dvLzKw=
X-Gm-Gg: AeBDietSauGRWiTIXSGz49G9qWKYJC/GTdBAwZF38AADIjZz4u0DpLl3Xfk67IFAMTT
	m0PQUVsn6VP4uX078lnxBAjGH18LxalBrFn98k95NwiW6GYTrLv+HK3hAVq7qrcv9Jbw85KVvBg
	JXIMqdU8yImivg/lmy4Gza3sa3KW5X22NgQtZKsb4UUsUJ7MoJreFh8c6+mWdeIYbSZ/htMGdlL
	I4B4fiwDlyFzOtP+XZ1tJcOZZsSPPvh7gt3Tp95FinukOcGupISs485VMbm1JBOZ3ruxrw+pgO6
	3cm54jzi54X7VTY77twdgYIUro19VzqCcuUq2G0NaunKsoFaW+1UNe5YUg/h8R4N57p9gpp0wnR
	OJ3kbu3H3Iq9zDOcAFCDjIrCcZjAlYwAx98Qgi7/fQvP6yl851evls7uG/X/IR7eBpak6pFy57e
	f32NK0DHRGkLYa0gjLdQsTUhW3O1Ba
X-Received: by 2002:a17:907:72d3:b0:b97:1d24:c004 with SMTP id a640c23a62f3a-ba419a54651mr494153366b.21.1776632328475;
        Sun, 19 Apr 2026 13:58:48 -0700 (PDT)
Received: from airbuntu ([146.70.179.102])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-ba45121109csm284759166b.6.2026.04.19.13.58.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 19 Apr 2026 13:58:48 -0700 (PDT)
Date: Sun, 19 Apr 2026 21:58:45 +0100
From: Qais Yousef <qyousef@layalina.io>
To: Juri Lelli <juri.lelli@redhat.com>
Cc: Ingo Molnar <mingo@redhat.com>, Peter Zijlstra <peterz@infradead.org>,
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
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	Carlos Llamas <cmllamas@google.com>,
	Alice Ryhl <aliceryhl@google.com>
Subject: Re: [PATCH RFC 0/4] sched/deadline: Add soft/reclaim mode via
 SCHED_OTHER demotion
Message-ID: <20260419205845.3off5qfgzcfwrznj@airbuntu>
References: <20260219-upstream-deadline-demotion-v1-0-528b96e53d12@redhat.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260219-upstream-deadline-demotion-v1-0-528b96e53d12@redhat.com>

On 02/19/26 14:37, Juri Lelli wrote:
> Hi All,
> 
> This RFC introduces a bandwidth reclaiming mechanism for SCHED_DEADLINE
> tasks through temporary demotion to SCHED_NORMAL when runtime is
> exhausted. This resurrects and refines the demotion concept from the
> original SCHED_DEADLINE development circa 2010, focusing exclusively on
> SCHED_NORMAL demotion.
> 
> Discussions about the feature have been resurfacing over the years and I
> wanted to check for feasibility and real interest. Found a little time
> to play around with the idea and this is the result of that.
> 
> When a DEADLINE task with SCHED_FLAG_DL_DEMOTION exhausts its runtime
> budget, the scheduler demotes it to SCHED_NORMAL rather than throttling
> it until the next period. The task continues execution competing fairly
> with other normal tasks, using the nice value specified in
> sched_attr.sched_nice. At the next period boundary, the replenishment
> timer automatically promotes the task back to SCHED_DEADLINE with a
> fresh runtime budget.
> 
> This provides a "soft(er) real-time" mode where tasks get timing
> guarantees when within budget but gracefully degrade to best-effort
> execution during overruns rather than being suspended. The bandwidth
> reservation remains in place during demotion, making the mechanism
> transparent from an admission control perspective similar to throttling.

I think this can be useful for IPC like binder. Sadly binder can be used
excessively even when not necessary, which can easily add more overhead.

If we can use DL to give them 0.25-0.5ms chance to finish quickly otherwise
demote them to fair, that might be an interesting experiment.

Adding Carlos and Alice in case they're interested in looking at this ;-)

If the patches can be merged, it'd be easier to backport and construct an
experiment in general.

(once globbing is available constructing such experiments with schedqos would
be easy)


Thanks

--
Qais Yousef

> 
> Key design aspects:
> 
> The implementation focuses solely on SCHED_NORMAL demotion, unlike
> earlier proposals that suggested multiple demotion targets including RT
> and DL postponement. Simpler and maybe enough?
> 
> The feature reuses the existing sched_attr.sched_nice field to specify
> the nice value during demotion, avoiding new UAPI additions while
> maintaining ABI compatibility. This is orthogonal to GRUB
> (SCHED_FLAG_RECLAIM) - tasks can combine both mechanisms for
> opportunistic reclaiming through accounting and continued execution
> through demotion (at least in principle, didn't actually test it yet :).
> 
> Demoted tasks cannot migrate between CPUs. This simplification keeps
> bandwidth accounting straightforward by ensuring the reservation stays
> on the original CPU throughout demotion. Migration is re-enabled after
> promotion or explicit parameter changes via sched_setattr().
> 
> The bandwidth accounting follows the throttling model rather than full
> class switching. Dequeue operations omit DEQUEUE_SAVE to keep the
> reservation in this_bw (admission control bandwidth). Running bandwidth
> (enforcement) is handled at 0-lag time for tasks that sleep while
> demoted, maintaining correct GRUB accounting.
> 
> Explicit sched_setattr() calls on demoted tasks cancel the demotion
> state and perform full bandwidth cleanup including inactive timer
> handling and cpuset tracking. The replenishment timer remains armed but
> fires harmlessly when it detects the task is no longer DEADLINE.
> 
> This posting is very much experimental. I added AI generated tests
> (included here just for reference) that helped checking a few cases
> during implementation. However, I am quite sure I'm missing several
> additional cases that can cause breakage. Test it at your own risk! :P
> 
> Based on original work by Dario Faggioli:
> https://lore.kernel.org/lkml/1288334546.8661.161.camel@Palantir/
> 
> As always comments and questions are more than welcome.
> 
> Series also available at
> 
> git@github.com:jlelli/linux.git upstream/deadline-demotion
> 
> Signed-off-by: Juri Lelli <juri.lelli@redhat.com>
> ---
> Juri Lelli (4):
>       sched/deadline: Implement reclaim/soft mode through SCHED_OTHER demotion
>       sched/doc: Document SCHED_DEADLINE demotion feature
>       DEBUG selftests/sched: Add tests for SCHED_DEADLINE demotion feature
>       DEBUG selftests/sched: Add simple demonstration of SCHED_DEADLINE demotion
> 
>  Documentation/scheduler/sched-deadline.rst         |  54 +++
>  include/linux/sched.h                              |  10 +
>  include/uapi/linux/sched.h                         |   4 +-
>  include/uapi/linux/sched/types.h                   |   8 +
>  kernel/sched/deadline.c                            | 213 +++++++++-
>  kernel/sched/fair.c                                |   8 +
>  kernel/sched/sched.h                               |  15 +-
>  kernel/sched/syscalls.c                            |   8 +
>  tools/testing/selftests/sched/.gitignore           |   3 +
>  tools/testing/selftests/sched/Makefile             |   4 +-
>  tools/testing/selftests/sched/README_dl_demotion   |  83 ++++
>  tools/testing/selftests/sched/dl_demotion_demo.c   | 239 +++++++++++
>  tools/testing/selftests/sched/dl_demotion_stress.c | 208 ++++++++++
>  tools/testing/selftests/sched/dl_demotion_test.c   | 460 +++++++++++++++++++++
>  .../selftests/sched/run_dl_demotion_with_trace.sh  |  71 ++++
>  15 files changed, 1382 insertions(+), 6 deletions(-)
> ---
> base-commit: e34881c84c255bc300f24d9fe685324be20da3d1
> change-id: 20260218-upstream-deadline-demotion-19511e741055
> 
> Best regards,
> --  
> Juri Lelli <juri.lelli@redhat.com>
> 
