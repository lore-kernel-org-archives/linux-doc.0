Received: from mail-yw1-f182.google.com (mail-yw1-f182.google.com [209.85.128.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D80C54968F7
	for <linux-doc@vger.kernel.org>; Wed,  1 Jul 2026 16:09:49 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782922191; cv=none; b=TxMCH8V3uAlLaPQunQcuIU+XRvuZ+qMCRaMkfbI3vHuPASGIHbrsA20m8gS5dJVaRKFvKcP3TXteDRAubJycJandvhNN2aS/oFJOIaKMb1ObW2in2k4u+u5v5hEaaKXiEBfR9P8+4+fP9TvCCHk+GBQ9EcOByJnMrvEli2aNT1g=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782922191; c=relaxed/simple;
	bh=Q8NctNHCWHgMfQRRPwxgFNy5pIUTiEo4cnvVEY3nEJU=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=HO2uG16aIGFcg6JpQ01FuCmMsgWS7dLULLXS8wss8MkqUBPbhAoySbSr+64dLEIIKJUtPCeYWhXQfDjEPZgBG5eilcNP2oMOET6CnBe6c3nmaynVTQIDHf5DGJcj+JJgpoBLKYAEQfVOqTTB/Kaomd/KwlWIhwKrgpSufhY4l0Q=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lklj0t/j; arc=none smtp.client-ip=209.85.128.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lklj0t/j"
Received: by mail-yw1-f182.google.com with SMTP id 00721157ae682-80cbb0688c8so11118137b3.1
        for <linux-doc@vger.kernel.org>; Wed, 01 Jul 2026 09:09:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782922189; x=1783526989; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=eVLgjlMFQC8bVztKmUV81rU16MTZpAgPa05gOyYSeoM=;
        b=lklj0t/j913fPSwB0t7M3r9jXbzn2vF+2TfhCGTEcNBt1oaK8iyiqSMC5t46wZJ3tg
         8UvhyboImxlLSKzSeuFUmKkuKhJvwG/QfnrMLZfkjDaH9vhBgbrOUy79spotVaSNjDak
         OLl0FcAjRnYCILAndtK+kGPk8Ne224gw+Gm+UM2TwhnrQndN8SuuioJgrrvAyB27G1P/
         HytneKRQSZTlXdC+oFaq2OklYJF/A0iUydi2op6uzgLbFMIEIG64PZbj9gu36LeGCIpm
         w1BfyOTGdd9Qs5cVgJScePGvw91N4iahP8SrOGjajQheWXMiLjJuGfk0pWhfWpOWtsmg
         OTmA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782922189; x=1783526989;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eVLgjlMFQC8bVztKmUV81rU16MTZpAgPa05gOyYSeoM=;
        b=IzRkx247liwuvC8v8iZCCiHMvBkM0dcJniuiDq2NkxpEuM3IbsAXBDTFBbKT8Z1eVv
         KNPXvP0mddGBCZCtaRAOojxQe3WpgRRxrGIa1VUwQDhqUUE8dEY1CFAAFEkgVsN0tWi9
         FM4xpQugct1LcvVkFbDOilfx03u5ZxbiQkVO1MDeLA1hGgcTBUs3R8sfc0O+eUD4k3Uc
         84HLnvjjb06gZxVyvxxwyfQoCan4f3y1h6xztEsjLqx/6dIxZmPMV9JbonbHm/ZwyHf+
         mInZVUzVIabqNRSDOPF5VsQz1+zFVGZOFKeH1/REvR+BjYsNcvyv4AVLfdLp+mFOZsgB
         jBgw==
X-Forwarded-Encrypted: i=1; AHgh+RpYxHsWq2sXtTZD3Fk91E6CBSJ+zGzRJzWNWgdcpXDxsrPfbLGLqCrw5A1R5r5sNzJnI8PsFSLNQjQ=@vger.kernel.org
X-Gm-Message-State: AOJu0YwoIdc5f6Tstf1QFAobjw1I1pp7MAmqqRyfSJnI8mClDMfaWnn0
	yg0nU5TmXxcFZzydj7BKRUT6LgPDczzHdEmR5KqLEQD/tEkJX0tOM+Ma
X-Gm-Gg: AfdE7cmv4jp4toNMk9A7gzAhEJ+gzVfyuHM3IOq470jxEvKbasSvUfNYLaHRTXyoYNK
	giHVH/xjrBwxO9vZVQOnB2HJHeceB7KSdinT7JdNoAo4YV7ER3Mq7mR+mNSrQLU++tIH6NECZsK
	xUZwRW0uIoKK7tngyMmk7WN0PnIALB7D6wHo7cZvHTwVM46/MygTh07zWQw3Lsgf2m1JCvULSsw
	TTcF5L1y+Z1s2V629mbdXYEoiVnTFsPD/7sP15iQuhF1g3Ud/nz0W7LZ+yqZgP5RDrk1tMm5kq9
	Q2u5EYClB8cKxl5WWHiPmhbR9vgEpKtS/bpsjBffY9+Ve9aVWUxAymXCXUJ7M8QfQZvfCAyfxOe
	zQrE4yrhy9fsSAcd+EZaMKfAVvPhRoJUOqmpY7gOCghvi4RUfHQrQv1PEMx9lEXweV6hHfniTRI
	rVnCGAou4=
X-Received: by 2002:a05:690c:600f:b0:7dd:16e2:7291 with SMTP id 00721157ae682-812eb172cf4mr22984087b3.39.1782922188805;
        Wed, 01 Jul 2026 09:09:48 -0700 (PDT)
Received: from localhost ([107.87.138.219])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8144b52da92sm1753217b3.33.2026.07.01.09.09.48
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 09:09:48 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
X-Google-Original-From: Yury Norov <ynorov@nvidia.com>
Date: Wed, 1 Jul 2026 12:09:47 -0400
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, mingo@kernel.org, peterz@infradead.org,
	juri.lelli@redhat.com, vincent.guittot@linaro.org,
	yury.norov@gmail.com, kprateek.nayak@amd.com, iii@linux.ibm.com,
	corbet@lwn.net, tglx@kernel.org, gregkh@linuxfoundation.org,
	pbonzini@redhat.com, seanjc@google.com, vschneid@redhat.com,
	huschle@linux.ibm.com, rostedt@goodmis.org,
	dietmar.eggemann@arm.com, maddy@linux.ibm.com, srikar@linux.ibm.com,
	hdanton@sina.com, chleroy@kernel.org, vineeth@bitbyteword.org,
	frederic@kernel.org, arighi@nvidia.com, pauld@redhat.com,
	christian.loehle@arm.com, tj@kernel.org,
	tommaso.cucinotta@gmail.com, maz@kernel.org, rafael@kernel.org,
	rdunlap@infradead.org, kernellwp@gmail.com,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v6 05/23] sched/core: Try to use a preferred CPU in
 is_cpu_allowed
Message-ID: <akU7vr4cpAhPRFeL@yury>
References: <20260701141654.500125-1-sshegde@linux.ibm.com>
 <20260701141654.500125-6-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701141654.500125-6-sshegde@linux.ibm.com>

On Wed, Jul 01, 2026 at 07:46:36PM +0530, Shrikanth Hegde wrote:
> When possible, choose a preferred CPUs to pick.
> 
> Push task mechanism uses stopper thread which going to call
> select_fallback_rq and use this mechanism to pick only a preferred CPU.
> 
> When task is affined only to non-preferred CPUs it should continue to
> run there. Detect that by checking if cpus_ptr and cpu_preferred_mask
> intersect or not.
> 
> This takes care of wakeup path optimization for FAIR tasks.
> is_cpu_allowed is called to ensure wakeup happens on preferred CPUs.
> With that, additional checks in available_idle_cpu is not necessary.
> 
> Add a comment on rare case of O(N**2) in select_fallback_rq.
> 
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> ---
> v5->v6:
> - Drop optimization for select_fallback_rq
> - Keep comment on N**2
> 
>  kernel/sched/core.c  | 29 ++++++++++++++++++++++++++++-
>  kernel/sched/sched.h |  9 +++++++++
>  2 files changed, 37 insertions(+), 1 deletion(-)
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index a45f7c308329..1fb1c17e8387 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -2500,6 +2500,8 @@ static inline bool rq_has_pinned_tasks(struct rq *rq)
>   */
>  static inline bool is_cpu_allowed(struct task_struct *p, int cpu)
>  {
> +	bool task_has_preferred_cpu;
> +
>  	/* When not in the task's cpumask, no point in looking further. */
>  	if (!task_allowed_on_cpu(p, cpu))
>  		return false;
> @@ -2508,9 +2510,30 @@ static inline bool is_cpu_allowed(struct task_struct *p, int cpu)
>  	if (is_migration_disabled(p))
>  		return cpu_online(cpu);
>  
> +	/*
> +	 * This is essential to maintain user affinities when preferred
> +	 * CPUs change. A task pinned on non-preferred CPU should continue
> +	 * to run there, since this is non-user triggered.
> +	 *
> +	 * If CPU is non-preferred and task can run on other CPUs which are
> +	 * currently preferred, then choose those other CPUs instead.
> +	 * Overhead is minimal when CPU is preferred.
> +	 *
> +	 * For majority of the cases this would still keep select_fallback_rq
> +	 * as O(N). task_has_preferred_cpus which is O(N) is called only if
> +	 * !cpu_preferred. Then task running there is expected to move out.
> +	 * So subsequent it should run on preferred CPU. This becomes O(N**2)
> +	 * only for tasks pinned only non preferred CPUs. That is rare case.
> +	 */

The is_cpu_allowed() is ~20 lines now, and your patch doubles that count.
Can you keep this type of thoughts in commit message? 90% of setups
will disable preferred CPUs, and I guess 99% of developers don't care.

This is the code, not a scientific paper, after all.

> +	task_has_preferred_cpu = !cpu_preferred(cpu) &&
> +				 task_has_preferred_cpus(p);

Maybe it's just me, but the name looks illogical. Because if
'cpu' is preferred, the task indeed has some preferred CPUs.

Maybe 'can_sched_on_preferred' or something like that?

> +
>  	/* Non kernel threads are not allowed during either online or offline. */
> -	if (!(p->flags & PF_KTHREAD))
> +	if (!(p->flags & PF_KTHREAD)) {
> +		if (task_has_preferred_cpu)
> +			return false;
>  		return cpu_active(cpu);
> +	}

The comment on top of the block seems to be applicable to the 2nd
return only, right?

>  
>  	/* KTHREAD_IS_PER_CPU is always allowed. */
>  	if (kthread_is_per_cpu(p))
> @@ -2520,6 +2543,10 @@ static inline bool is_cpu_allowed(struct task_struct *p, int cpu)
>  	if (cpu_dying(cpu))
>  		return false;
>  
> +	/* Try on preferred CPU first if possible*/
> +	if (task_has_preferred_cpu)
> +		return false;

Would it look better if you drop the comment and:
        
        if (need_sched_on_preferred)
                return false;

> +
>  	/* But are allowed during online. */

This comment is the continuation of the cpu_dying() case. With your
change it's not anymore, and it needs to be reworded.

>  	return cpu_online(cpu);
>  }
> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index 26ae13c86b69..36ae20310891 100644
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -4230,4 +4230,13 @@ DEFINE_CLASS_IS_UNCONDITIONAL(sched_change)
>  
>  #include "ext/ext.h"
>  
> +static inline bool task_has_preferred_cpus(struct task_struct *p)
> +{
> +	/* Only FAIR tasks honor preferred CPU state */
> +	if (unlikely(p->sched_class != &fair_sched_class))
> +		return false;
> +
> +	return cpumask_intersects(p->cpus_ptr, cpu_preferred_mask);
> +}
> +
>  #endif /* _KERNEL_SCHED_SCHED_H */
> -- 
> 2.47.3
