Received: from mail-yx1-f42.google.com (mail-yx1-f42.google.com [74.125.224.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F3308262FD0
	for <linux-doc@vger.kernel.org>; Wed,  1 Jul 2026 16:50:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.224.42
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782924628; cv=none; b=N/M8tGJTS0XrqgLVTNWR4Xzh8WMzL57i5sNgdrLWDV8j932iiG8BH1SiffuBYOxVIJ6KcZPcTLQFhnHOxXNmGGMr3KK+w+yUTN9ytzyC/KgFjuR+bbfU+sAz5BZy8/5JIAIkLW764CKTajtjVn8re0Fcj0Aaf1DRKDEFddefQu4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782924628; c=relaxed/simple;
	bh=09HS8lyN13KQlLKIZ6ncHOBX6ivzk1EYRrfPdUFLHGc=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jgk4ZvZtGRIL0WZKcDd9W2icFkQDsASNpCBcw2rLAKsy90pa2dhBaKZxs6KzwfJpB6XmBg/jn6gU5YaQHc7TK1AAhlGpj0epOet03WUjU25hY+wpc3dzDpRA6g4Lkgx/NhpEezs2eX3Ze2IelUHGItXdLhKx/8WLrnqG5//OSew=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=lU8GDwPb; arc=none smtp.client-ip=74.125.224.42
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lU8GDwPb"
Received: by mail-yx1-f42.google.com with SMTP id 956f58d0204a3-6626b5ace23so2134003d50.0
        for <linux-doc@vger.kernel.org>; Wed, 01 Jul 2026 09:50:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782924626; x=1783529426; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=YyDFYMVFanlLOtM66Vof6yYAS25wK6bFjDnPECv+0bg=;
        b=lU8GDwPbBUjd5eSHaeTflDlGlXhck53HO1IavAqZPdaydNj9ZrcsohMG/v5YCbCzMq
         vmjIduBVZiUXOpJpB9n+I968tjS7c+Sqnsopd5KwGzB3a55FfGYM1uKlKG+zrzQA3UxS
         6DfCY+LG8Pf23WXs3BHJnlnSgNCr11AIFnKbkbJ/EJw1d9ixtsqouQS3vONbNwDuHXLv
         mOa8KpW/q5ILWpEkL38/5FwxD7m02CsIUoqrzU7XZ9J+NqzxckJP87iyOoVq5yz4SsIy
         BhoQW+kWrP7SCQrIDfFSrjgMnmpCkr6zLWqqotct+8uPOMXpNBJNj/K2JnI3xW9b+yOe
         MrxQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782924626; x=1783529426;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=YyDFYMVFanlLOtM66Vof6yYAS25wK6bFjDnPECv+0bg=;
        b=hk6rW79CKsxaHDmoivoTrpZKPtKpfNaTwZrjbtLZdqxvmo6xuvp2vmgV4y+Gv6dwH/
         Qj0CXB3AD2T41Rwi8JO4d4zF0V/zLTIuAIix1f/v59OdcREvgbuVDaeAc6y7c3bEaigt
         Ld5b3WhTlFpCRLQKESJHA1/OG1u81ErOKI6T5Pl55pOieoBiqOUpDA9DNTYMyoCzjpPO
         H1cbkS6Z/PFtVWzXe1Kr5+Jv7QkIOVPby5+/iscxVLJHB0WaHSuJH+wOQmqnxWo8A0ph
         vn4oRrK3cFXeMOwJynOXB8o628jzbPBmS0Fa7zdgv1MAdTYhAeXnGz4SdLaKH1mGJV+U
         iWKQ==
X-Forwarded-Encrypted: i=1; AHgh+Rpd6kmNC/c7bXdCz24r0QDb3d8GYZgvmJY562t3JkvpC9NC0IW8zgkpVYQCE28dEqmCPdEgqpsdhbM=@vger.kernel.org
X-Gm-Message-State: AOJu0YyjZsmohs/OA/O4EE0evyjVNNO56xn2oLSlQYuSuBn3Nz3qvHrW
	VaBWh+5Jl2eWtE4fb69kSgxzQxhb2EOTFx8rrjWeJGQLzX4O2fCHDr/9
X-Gm-Gg: AfdE7ckE521yJYtLTs9OLGh8A1j9WR2lvEUwCJglpEUr7NV2ifrJjpNSl1+2iEN+b4j
	XyNNcfyjjVDn13SWifiLthjfFDR9qGrzj2hvsCj3Wg3sPWF6ANjt2Ea2sxa0gk3X6Isk31YYyA+
	Oldz4oySPIs3tgjvHgquTlb3wEBOR3NExKf8+BymNP89rC8ipPe5RYMl6HtMVaelLteoP8y7svn
	ObvPOsnCSVffVT7D77N9tGG2UPqKbYyQooi2zHjIRaneMlnTlF19pRFFdJnGIGauXjb2+erTyr5
	72Tr+/QGsCD0uaW3idMWfNrBFft1duWB/LYSQk+M8iXzCyn2zFi2ZIyu4SKLgGcXoquJPxUc+NO
	namZQdwTcIL36dx/c4+lDmZ4GWcAnm8HupeTfoO5IK/8mpROd3Y5HDnNNgcTyNhiGtzV+1GKrxD
	MLG9J0
X-Received: by 2002:a05:690e:450d:20b0:666:1ff5:fbf5 with SMTP id 956f58d0204a3-6661ff61996mr565918d50.13.1782924625901;
        Wed, 01 Jul 2026 09:50:25 -0700 (PDT)
Received: from localhost ([24.129.38.94])
        by smtp.gmail.com with ESMTPSA id 956f58d0204a3-6650053f901sm2552638d50.1.2026.07.01.09.50.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 09:50:25 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
X-Google-Original-From: Yury Norov <ynorov@nvidia.com>
Date: Wed, 1 Jul 2026 12:50:24 -0400
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
Subject: Re: [PATCH v6 09/23] sched/core: Push current task from non
 preferred CPU
Message-ID: <akVFULP9qV2NPy3k@yury>
References: <20260701141654.500125-1-sshegde@linux.ibm.com>
 <20260701141654.500125-10-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260701141654.500125-10-sshegde@linux.ibm.com>

On Wed, Jul 01, 2026 at 07:46:40PM +0530, Shrikanth Hegde wrote:
> Actively push out task running on a non-preferred CPU. Since the task is
> running on the CPU, need to stop the cpu and push the task out.
> However, if the task is pinned only to non-preferred CPUs, it will continue
> running there. This will help in maintaining the userspace affinities
> unlike CPU hotplug or isolated cpusets.
> 
> Though code is similar to  __balance_push_cpu_stop and quite close to
> push_cpu_stop, it is being kept separate as it provides a cleaner
> implementation with CONFIG_PREFERRED_CPU.
> 
> Add push_task_work_done flag to protect work buffer.
> Works only with FAIR class.
> 
> For now, only current running task is pushed out. This keeps the code
> simpler. In future optimization maybe done to move all the queued
> task on the rq.
> 
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> ---
>  kernel/sched/core.c  | 87 ++++++++++++++++++++++++++++++++++++++++++++
>  kernel/sched/sched.h |  8 ++++
>  2 files changed, 95 insertions(+)
> 
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index aa4201bb8082..56905bac9525 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -5797,6 +5797,9 @@ void sched_tick(void)
>  	unsigned long hw_pressure;
>  	u64 resched_latency;
>  
> +	if (!cpu_preferred(cpu))
> +		sched_push_current_non_preferred_cpu(rq);
> +
>  	if (housekeeping_cpu(cpu, HK_TYPE_KERNEL_NOISE))
>  		arch_scale_freq_tick();
>  
> @@ -11315,3 +11318,87 @@ void sched_change_end(struct sched_change_ctx *ctx)
>  		p->sched_class->prio_changed(rq, p, ctx->prio);
>  	}
>  }
> +
> +#ifdef CONFIG_PREFERRED_CPU
> +/* npc - non preferred CPU */
> +static DEFINE_PER_CPU(struct cpu_stop_work, npc_push_task_work);
> +
> +static int sched_non_preferred_cpu_push_stop(void *arg)
> +{
> +	struct task_struct *p = arg;
> +	struct rq *rq = this_rq();
> +	struct rq_flags rf;
> +	int cpu;
> +
> +	/* sanity check and clear */
> +	if (cpu_preferred(rq->cpu)) {
> +		scoped_guard (rq_lock, rq)

No whitespace please:

$ git grep "scoped_guard" | wc -l
2153
$ git grep "scoped_guard (" | wc -l
84

> +			rq->push_task_work_done = 0;
> +		put_task_struct(p);
> +		return 0;
> +	}
> +
> +	raw_spin_lock_irq(&p->pi_lock);
> +
> +	/* This could take rq lock. So call it before rq lock is taken */
> +	cpu = select_fallback_rq(rq->cpu, p);
> +	rq_lock(rq, &rf);
> +	rq->push_task_work_done = 0;
> +	update_rq_clock(rq);
> +
> +	context_unsafe_alias(rq);
> +
> +	if (task_rq(p) == rq && task_on_rq_queued(p))
> +		rq = __migrate_task(rq, &rf, p, cpu);
> +
> +	rq_unlock(rq, &rf);
> +	raw_spin_unlock_irq(&p->pi_lock);
> +	put_task_struct(p);
> +
> +	return 0;
> +}
> +
> +/*
> + * Push the current task running on non-preferred CPU.
> + * Using this non preferred CPU will lead to more vCPU preemptions
> + * in the host. So it is better not to use this CPU.
> + *
> + * Since task is running, call a stopper to push the task out. This is
> + * similar to how task moves during hotplug. In select_fallback_rq a
> + * preferred CPU will be chosen and henceforth task shouldn't come back to
> + * this CPU again.
> + *
> + * Works for FAIR class only
> + *
> + * If task is affined only non-preferred CPUs, it can't be moved out
> + */
> +void sched_push_current_non_preferred_cpu(struct rq *rq)
> +{
> +	struct task_struct *push_task = rq->curr;
> +
> +	/* Preferred feature works only for FAIR class */
> +	if (push_task->sched_class != &fair_sched_class)
> +		return;

This is useless - task_has_preferred_cpus() checks that already.

> +
> +	if (kthread_is_per_cpu(push_task) ||
> +	    is_migration_disabled(push_task))
> +		return;
> +
> +	/* Don't push the task if it is affined only on non preferred CPUs */
> +	if (!task_has_preferred_cpus(push_task))
> +		return;
> +
> +	/* There is already a stopper thread for this. Dont race with it. */
> +	if (rq->push_task_work_done == 1)
> +		return;
> +
> +	/* sched_tick runs with interrupts disabled. */
> +	get_task_struct(push_task);
> +
> +	scoped_guard (rq_lock, rq)
> +		rq->push_task_work_done = 1;
> +
> +	stop_one_cpu_nowait(rq->cpu, sched_non_preferred_cpu_push_stop,
> +			    push_task, this_cpu_ptr(&npc_push_task_work));
> +}
> +#endif
> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index 36ae20310891..711fc8bd7ebc 100644
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -1277,6 +1277,8 @@ struct rq {
>  
>  	struct list_head cfs_tasks;
>  
> +	bool			push_task_work_done;
> +
>  	struct sched_avg	avg_rt;
>  	struct sched_avg	avg_dl;
>  #ifdef CONFIG_HAVE_SCHED_AVG_IRQ
> @@ -4239,4 +4241,10 @@ static inline bool task_has_preferred_cpus(struct task_struct *p)
>  	return cpumask_intersects(p->cpus_ptr, cpu_preferred_mask);
>  }
>  
> +#ifdef CONFIG_PREFERRED_CPU
> +void sched_push_current_non_preferred_cpu(struct rq *rq);
> +#else	/* !CONFIG_PREFERRED_CPU */
> +static inline void sched_push_current_non_preferred_cpu(struct rq *rq) { }
> +#endif
> +
>  #endif /* _KERNEL_SCHED_SCHED_H */
> -- 
> 2.47.3
