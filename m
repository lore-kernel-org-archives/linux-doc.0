Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0C2503563EB
	for <linux-doc@vger.kernel.org>; Mon, 29 Jun 2026 04:09:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782706180; cv=none; b=kXPDi5pruXilYsBcNNy2L56JsuAdKbbG/lMQprdIkJVdIFciioy18ga9erccIij+Qwk+erGp7d5+CVv7p/lRNbAZs++iCWAMymaOj/8nfAcSHqeRwGsv3ZueBrN45nT06wLYU5SlwFXoOMm9X00nY8FDU0c3b9zVG7zGTyePxVM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782706180; c=relaxed/simple;
	bh=a/HlhKvevif2+5h4sdtDLWYxnmEizjgtUeL7dKbl4Bg=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=S+nHGTCe4jMPBU0yQwyNBUOkt/gPQjSIZ7Vnk3ev5tpB29geVgD4hV0P9mlDVjUd2ZBmmjKn+JSL39RIjmwFYO9gA9mVOeOPhIMJliMptcJK17qv+AoVKklyLt3SwTfdshmsHlDdWE+labVg9ZgAgWxBOkP7pOsRNkSIX/PpXjk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=j5nuNb2A; arc=none smtp.client-ip=74.125.224.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="j5nuNb2A"
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-664ce3000e6so896019d50.0
        for <linux-doc@vger.kernel.org>; Sun, 28 Jun 2026 21:09:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782706177; x=1783310977; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=cd8jl1sdBjxLdJlWfwnOo73B82wf74k6SP/YBf0uBLI=;
        b=j5nuNb2Ac0j8rurj9Fuel/Uw1PCvq2wiXmw9mxr53feKdOjT+rZyplbVssK0n1e5OU
         sk1ThJP0M+9BSUkvWgSsFA3m0w81OevNZ1bCEzwLLgD07738P/WsPLCSi6rTvQqOfegw
         kbpOx49GJ7FuUx0aXYXBN7hiVXZm5+qBC/rYasFCPd/1wFWm5cHSyxka8eoy1su3NhuY
         XX5UvTSXWK8S9F/X0yDi1nQXWi1gVCdruA9ouNBBRJVBbzFeXDamhWq4ZWWMXZ5+R09f
         Kd4qhF0uIgEVKYcwVXAcmfqeTS5MMPGA8SzZ26gQUn1bGGEQygRbGdZyNQJDO9q4hkID
         0ukw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782706177; x=1783310977;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=cd8jl1sdBjxLdJlWfwnOo73B82wf74k6SP/YBf0uBLI=;
        b=I02H2Puya5Kkb+mfNFs4egspm5idaHb9HFAPQSoSY5vXs34GMzaAWasqcfG80/8IwL
         VOUr2Clf5F410X5O3shMoHuhb2FXwLWynqsBFKSBcSI2n9gnq6aAXgnhuoiWqaAPlVVX
         Y7gm1Q8iOvok+G/+wo6HBA1nN72F/LO+7P5JK46YI/DmH+ARN/13vWJoiz9FO5/VG8X4
         7tC5uhUKlyzHXecz2plIqRCLi0lxDwBjhYQ3WQE4fYWBU8rrnL5E47Nk9PAXGs8NNIq0
         d+l+DsY1qZ5W8TS6j6LvE6A5IeOFCZfp/oQOs12kxyw4VUkLbpHNOiuj6d59MF6c3ASA
         GxKw==
X-Forwarded-Encrypted: i=1; AHgh+RpnH9xiuFiJlHFfuy1iaNNvcpCDfoD5Ju93Ys8pq1JefpRL/rx3CBPn8Zo5E0OFV2DiFXL2swEnqcM=@vger.kernel.org
X-Gm-Message-State: AOJu0YwTDFrtcjNWvt2FNbqsoa2H2SD4biXKydmydB5Bm8n0qF9EA2ZN
	7HgIbfPyiBlp4xTFoidpKMjQ43NTCU21QURNY6jIQ01Nnkhas2CgP8aI
X-Gm-Gg: AfdE7ckcHrM6fD7IqxkyIXT0Hv7hZjW7sVe3+vw2k2n8JmoJ0eIyh5nIiQknAOE8Qg/
	0czB1u8pE5AMIxTTXSHp5BfRk+d87GbDYtJXTeSScj7uW8It7X1leE8aUd7CcbGwKVBiXEfuFae
	gp/+9LLO91O9YypcTyLwd0r+A1Me2i7BSW4MIWlZiejiQRSq7IijAeKCR4KEwE+J98CIshkfFOJ
	y84gnLnyzM4aQFEYVC5igfIpSyRsVNS/fZ8Kaxkev6F3WEI/Bf0oHY2PBoocBPSp7wS/cLsQcY7
	n/NWkX8kRgS2AI8BwqsCEg8nc7WMmJ7g0wN3HphTxDNiXLfaC1vngj1tRIxCAxR7b5MmMerT426
	eX93nW+XqmOGV1Ih3hxLeqIqhl/M49NGpt3X3aG8jpo9I0rw7TMeN4tAVIvLXep689H5gxH2Etd
	7zWVIBVQ==
X-Received: by 2002:a05:690c:c533:b0:80c:85b6:764f with SMTP id 00721157ae682-80c85b68569mr93373357b3.68.1782706176920;
        Sun, 28 Jun 2026 21:09:36 -0700 (PDT)
Received: from localhost ([50.240.115.24])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-80b5c8b1c03sm40251957b3.4.2026.06.28.21.09.36
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 28 Jun 2026 21:09:36 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
X-Google-Original-From: Yury Norov <ynorov@nvidia.com>
Date: Mon, 29 Jun 2026 00:09:35 -0400
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: Yury Norov <yury.norov@gmail.com>, linux-kernel@vger.kernel.org,
	mingo@kernel.org, peterz@infradead.org, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, kprateek.nayak@amd.com,
	iii@linux.ibm.com, corbet@lwn.net, tglx@kernel.org,
	gregkh@linuxfoundation.org, pbonzini@redhat.com, seanjc@google.com,
	vschneid@redhat.com, huschle@linux.ibm.com, rostedt@goodmis.org,
	dietmar.eggemann@arm.com, maddy@linux.ibm.com, srikar@linux.ibm.com,
	hdanton@sina.com, chleroy@kernel.org, vineeth@bitbyteword.org,
	frederic@kernel.org, arighi@nvidia.com, pauld@redhat.com,
	christian.loehle@arm.com, tj@kernel.org,
	tommaso.cucinotta@gmail.com, maz@kernel.org, rafael@kernel.org,
	rdunlap@infradead.org, kernellwp@gmail.com,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 06/24] sched/core: allow only preferred CPUs in
 is_cpu_allowed
Message-ID: <akHv_4l0izJb6TgZ@yury>
References: <20260625124648.802832-1-sshegde@linux.ibm.com>
 <20260625124648.802832-7-sshegde@linux.ibm.com>
 <aj55TIWls4HKYj5b@yury>
 <0a223931-5172-4ed5-a9f8-c2b316a0f6cc@linux.ibm.com>
 <1ace8847-db42-49a8-8d0f-6eeead1c360f@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1ace8847-db42-49a8-8d0f-6eeead1c360f@linux.ibm.com>

On Sat, Jun 27, 2026 at 12:13:49AM +0530, Shrikanth Hegde wrote:
> Hi Yury.
> 
> On 6/26/26 6:55 PM, Shrikanth Hegde wrote:
> > Hi Yury. Thanks for going through the patches.
> > 
> 
> [...]
> 
> > > So, you've got 3 options to declare the status: self-explaining enum,
> > > self-explaining #defines, and this random numbers explained in
> > > comment. The latter option is the worst to me.
> > 
> > ok. I will define the enums.
> > 
> > > 
> > > And you didn't provide any benchmark advocating this caching
> > > optimization.
> 
> 
> I did below to see. Made interval as 100ms.
> Ran ./hackbench 30 process 30000 loops in both the VM at the same time.
> Values are average of 5 runs.
> 
> With optimization:
> 13.6 seconds
> 
> Without optimization:
> 13.8 seconds

And what's the p-value for them?

...
 
> > If we move to local variable then this won;t be necessary,
> > just enum's would be enough (I think). Let me go stare at it.
> 
> I have made it use the local variable instead. There maybe better names
> for variable, put something quickly to check the idea.
> Effectively this PATCH 6 becomes:
> 
> Does this seems better?
> Please let me know your comments.

I think, the below is too massive change for optimization of an
optimization for a particular, not too common config. And the whole
improvement is ~1%, assuming it's statistically important...

Just as said on previous round. Please order your series such that the
core logic goes first, and all sorts of complications, like this
optimization, are appended at the end.

> ---
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 9e16946c9d62..fafedd52611f 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -2498,8 +2498,10 @@ static inline bool rq_has_pinned_tasks(struct rq *rq)
>   * Per-CPU kthreads are allowed to run on !active && online CPUs, see
>   * __set_cpus_allowed_ptr() and select_fallback_rq().
>   */
> -static inline bool is_cpu_allowed(struct task_struct *p, int cpu)
> +static inline bool is_cpu_allowed(struct task_struct *p, int cpu, int cached)
>  {
> +       bool task_check_preferred_cpu;
> +
>         /* When not in the task's cpumask, no point in looking further. */
>         if (!task_allowed_on_cpu(p, cpu))
>                 return false;
> @@ -2508,9 +2510,24 @@ static inline bool is_cpu_allowed(struct task_struct *p, int cpu)
>         if (is_migration_disabled(p))
>                 return cpu_online(cpu);
> +       /*
> +        * This is essential to maintain user affinities when preferred
> +        * CPUs change. A task pinned on non-preferred CPU should continue
> +        * to run there, since this is non-user triggered.
> +        *
> +        * If CPU is non-preferred and task can run on other CPUs which are
> +        * currently preferred, then choose those other CPUs instead.
> +        * Overhead is minimal when CPU is preferred.
> +        */
> +       task_check_preferred_cpu = !cpu_preferred(cpu) &&
> +                                  task_has_preferred_cpus(p, cached);
> +
>         /* Non kernel threads are not allowed during either online or offline. */
> -       if (!(p->flags & PF_KTHREAD))
> +       if (!(p->flags & PF_KTHREAD)) {
> +               if (task_check_preferred_cpu)
> +                       return false;
>                 return cpu_active(cpu);
> +       }
>         /* KTHREAD_IS_PER_CPU is always allowed. */
>         if (kthread_is_per_cpu(p))
> @@ -2520,6 +2537,10 @@ static inline bool is_cpu_allowed(struct task_struct *p, int cpu)
>         if (cpu_dying(cpu))
>                 return false;
> +       /* Try on preferred CPU first if possible*/
> +       if (task_check_preferred_cpu)
> +               return false;
> +
>         /* But are allowed during online. */
>         return cpu_online(cpu);
>  }
> @@ -2595,7 +2616,7 @@ static struct rq *__migrate_task(struct rq *rq, struct rq_flags *rf,
>         __must_hold(__rq_lockp(rq))
>  {
>         /* Affinity changed (again). */
> -       if (!is_cpu_allowed(p, dest_cpu))
> +       if (!is_cpu_allowed(p, dest_cpu, NO_CACHED_VAL))
>                 return rq;

This thing I really dislike. The unrelated code should not be
affected. You can make it less visually invasive with:
        
        #define is_cpu_allowed(p, cpu) __is_cpu_allowed(p, cpu, NO_CACHED_VAL)

Please reconsider your code to have the changes better localized.

Thanks,
Yury

>         rq = move_queued_task(rq, rf, p, dest_cpu);
> @@ -3547,7 +3568,15 @@ static int select_fallback_rq(int cpu, struct task_struct *p)
>         int nid = cpu_to_node(cpu);
>         const struct cpumask *nodemask = NULL;
>         enum { cpuset, possible, fail } state = cpuset;
> -       int dest_cpu;
> +       int dest_cpu, has_preferred_cpu;
> +
> +       /*
> +        * Cache the value whether task's affinity spans preferred CPUs.
> +        * This helps to avoid repeating the same for each CPU
> +        * later in the loop.
> +        */
> +       has_preferred_cpu = task_has_preferred_cpus(p, NO_CACHED_VAL) ?
> +                           TASK_HAS_PREFERRED_CPUS : TASK_NO_PREFERRED_CPUS;
>         /*
>          * If the node that the CPU is on has been offlined, cpu_to_node()
> @@ -3559,7 +3588,7 @@ static int select_fallback_rq(int cpu, struct task_struct *p)
>                 /* Look for allowed, online CPU in same node. */
>                 for_each_cpu(dest_cpu, nodemask) {
> -                       if (is_cpu_allowed(p, dest_cpu))
> +                       if (is_cpu_allowed(p, dest_cpu, has_preferred_cpu))
>                                 return dest_cpu;
>                 }
>         }
> @@ -3567,7 +3596,7 @@ static int select_fallback_rq(int cpu, struct task_struct *p)
>         for (;;) {
>                 /* Any allowed, online CPU? */
>                 for_each_cpu(dest_cpu, p->cpus_ptr) {
> -                       if (!is_cpu_allowed(p, dest_cpu))
> +                       if (!is_cpu_allowed(p, dest_cpu, has_preferred_cpu))
>                                 continue;
>                         goto out;
> @@ -3632,7 +3661,7 @@ int select_task_rq(struct task_struct *p, int cpu, int *wake_flags)
>          * [ this allows ->select_task() to simply return task_cpu(p) and
>          *   not worry about this generic constraint ]
>          */
> -       if (unlikely(!is_cpu_allowed(p, cpu)))
> +       if (unlikely(!is_cpu_allowed(p, cpu, NO_CACHED_VAL)))
>                 cpu = select_fallback_rq(task_cpu(p), p);
>         return cpu;
> @@ -6467,7 +6496,7 @@ static bool try_steal_cookie(int this, int that)
>                 if (p == src->core_pick || p == src->curr)
>                         goto next;
> -               if (!is_cpu_allowed(p, this))
> +               if (!is_cpu_allowed(p, this, NO_CACHED_VAL))
>                         goto next;
>                 if (p->core_occupation > dst->idle->core_occupation)
> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index c7c2dea65edd..949c044702c1 100644
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -4213,4 +4213,32 @@ DEFINE_CLASS_IS_UNCONDITIONAL(sched_change)
>  #include "ext.h"
> +enum task_preferred_cached {
> +       TASK_NO_PREFERRED_CPUS = -1,
> +       NO_CACHED_VAL,
> +       TASK_HAS_PREFERRED_CPUS,
> +};
> +
> +/*
> + * Value is cached when called via select_fallback_rq().
> + *
> + * TASK_NO_PREFERRED_CPUS : Cached and preferred CPUs exists in task's
> + *                          affinity.
> + * NO_CACHED_VAL:           Not cached and need to evaluate.
> + * TASK_HAS_PREFERRED_CPUS: Cached and preferred CPU doesn't exits
> + *                          task's affinity
> + *
> + * Only affects FAIR task.
> + */
> +static inline bool task_has_preferred_cpus(struct task_struct *p, int cached)
> +{
> +       /* Only FAIR tasks honor preferred CPU state */
> +       if (unlikely(p->sched_class != &fair_sched_class))
> +               return false;
> +
> +       if (cached)
> +               return cached > 0;
> +       else
> +               return cpumask_intersects(p->cpus_ptr, cpu_preferred_mask);
> +}
>  #endif /* _KERNEL_SCHED_SCHED_H */
