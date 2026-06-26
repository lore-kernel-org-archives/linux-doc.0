Received: from mail-dl1-f52.google.com (mail-dl1-f52.google.com [74.125.82.52])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B41D535A398
	for <linux-doc@vger.kernel.org>; Fri, 26 Jun 2026 13:06:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.52
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782479186; cv=none; b=tgJF5ERrA+puUC24b/mE+kuId8a1TJ+TYeyODcANXQ8NApLXAI/3xY5ousRn5p7Jnasfzix1kEMF3FucuB35n9A5xI1UA46S/n5dTOOvHpKmxAWQRCAWDCWBAi87E3dDPbDSO9TPQTr1vO66VUS9nH8YucOFbseK/TR8iYq4zl8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782479186; c=relaxed/simple;
	bh=EEGgXKjv971W3z7xTumPvQh0D489ebQqp300TDcI6KE=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=BJ98SKNOlVabo9uKyQA5w1lNRz892U+kl7GtLE2vAMfUIZNFPX67y0/kNL6wFl2EnLA9Jip6OmYE1RFHAC/morsLQcqvGr+PWw27GmgLk7a9Hh0FyL1ae+mV3GN7PiVukd+ZGMgdHc55Ayf23fG0umRY/uym28XicxeKjSluNow=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=cKhnSkrp; arc=none smtp.client-ip=74.125.82.52
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="cKhnSkrp"
Received: by mail-dl1-f52.google.com with SMTP id a92af1059eb24-137335bc3caso1838627c88.0
        for <linux-doc@vger.kernel.org>; Fri, 26 Jun 2026 06:06:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782479183; x=1783083983; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/UVVlLPQVbAKeQuTjfC3G00OJhplPmT756NdnsfiCSs=;
        b=cKhnSkrp9+4GjK5s2El+TsHpZAciWPL+Oq2KjqojOK1KhHkqMy0hlMh2w47GSe57HO
         L6dfAYb89yuhOdqqQlao0WugtAXfOfVlfZyZxLMLjaY8SUlAd4qS7I4RJVupto6EyU7r
         ZjDSrdAelyFzG3v6XR/RoNwWKhecxd90GPq55+IbdXZSdvdhJpJfYQpuxQ+unGsYYO6o
         8dviW4qJNRgbVqaR5O8MR56m85wzG6ZwaF7ijJ8wSRDYlImTYTy9I4ERi4DNWxjilvkc
         TwDZYMiD5gFJOF0vnkQ436B6fUsUaolY8W289PiVceGikq4koqX6rvq+2vXaaAjKETlR
         krUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782479183; x=1783083983;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/UVVlLPQVbAKeQuTjfC3G00OJhplPmT756NdnsfiCSs=;
        b=fkFn3RZKk/usBev2fuP2Zexv2MC1nucIrm2NBHnyxdFdq1qM5m1Gv/qqCEzrzV4D8L
         gM8Tgsj/fsG/yMn+mPLJrBtp3gufMqt2fYtNAaeO0sStRoNhwI3czuTqO5Bvc8tW8864
         H07pDcyswStQhNmVXZW62BG6+VUU9O4ykDjLggyy7h3pg6iWk4aLSdVBgltcMvTIHNBy
         42VNv+uc5CKpV52hi9OARF2+HTvomul0HOceni6axQeyLsqjbl0ouh0jSUsbeCXeoUmn
         k4k6AYrQw+8ldWdyxxStK8h2mdmV9iBFjJIYbMIvtPQYoTIl6cEUhMrVVnxFleA9FRsC
         YUlA==
X-Forwarded-Encrypted: i=1; AFNElJ99xrEE9MAKbs45e2gOGs5RBkIOV6idlWYqRhcFJDa0GZvIjqAnmCj3KsEjIjWDSf8NPMA13qMfnUI=@vger.kernel.org
X-Gm-Message-State: AOJu0YyW2gJdmEFWK6738wx/njkxSK3k2X5xejxkjg1vwBel/y4lyrRA
	3P7uNerEBJbi43m+VT+a/ZtNH5ZFV7cU6WcES524sa9Gz9lsoj4bMKKM
X-Gm-Gg: AfdE7clGIuYn5idUydDrwescM28VBBafR7XHv2ncQnhzTG3VbUW+MRCinJ6IpiQ0Ks7
	yX1AGPX9G1TIqlklFw+0D4ozPOEabyDrQeJzs4ZaeZI7H/+fvxH7ZbHYp9sbv26o+5y4VXSGzfg
	CuG/izNUDY6GAoDgHUEeimCDxFVpjQesdxYhhTVGSjuybqQm+SiNkAhRGFCHp+SfskSpVrqC/ng
	ZvUV5LmU8xeqN0UGWyEY70AqfA0po1IcwzXESWjnepC7xzvlNqQjbG6TZkJhHCgKcZcCHoBX0ZU
	8l+d3l60GlWqefYqi+lD+gXQL1o8nh3V2v9rjuNyjq/jywV0QWk7JMRQIrHCteQyPwbWfWmkMH3
	MA6joNofladMW3FWH2fc4jHcH+FlXNjBPyZfKckSqTbmzYNWEr4P7evRcO7gZscKWcQPJsHNUdm
	ORYJj6yz02
X-Received: by 2002:a05:7022:6098:b0:136:959a:abe9 with SMTP id a92af1059eb24-139db9f687dmr5446959c88.5.1782479182499;
        Fri, 26 Jun 2026 06:06:22 -0700 (PDT)
Received: from localhost ([216.228.127.129])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-139d91006afsm21791594c88.12.2026.06.26.06.06.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 06:06:21 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
X-Google-Original-From: Yury Norov <ynorov@nvidia.com>
Date: Fri, 26 Jun 2026 09:06:20 -0400
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
Subject: Re: [PATCH v5 06/24] sched/core: allow only preferred CPUs in
 is_cpu_allowed
Message-ID: <aj55TIWls4HKYj5b@yury>
References: <20260625124648.802832-1-sshegde@linux.ibm.com>
 <20260625124648.802832-7-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260625124648.802832-7-sshegde@linux.ibm.com>

On Thu, Jun 25, 2026 at 06:16:30PM +0530, Shrikanth Hegde wrote:
> When possible, choose a preferred CPUs to pick.
> 
> Push task mechanism uses stopper thread which going to call
> select_fallback_rq and use this mechanism to pick only a preferred CPU.
> 
> When task is affined only to non-preferred CPUs it should continue to
> run there. Detect that by checking if cpus_ptr and cpu_preferred_mask
> intersect or not.
> 
> Since is_cpu_allowed can be called directly or repeatedly in
> select_fallback_rq, encode the info in task_struct->has_preferred_cpu_state
> if the path is via select_fallback_rq or not.
> This helps to avoid N**2 complexity for the rare cases.
> 
> Additional overhead of O(N) comes to is_cpu_allowed only when cpu is not
> preferred. So in normal scenarios overhead is only a bit check.
> 
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> ---
> v4->v5:
> - Do simple encoding of -1,0,1 instead (K Prateek Nayak)
> - Make it s8 (K Prateek Nayak)
> - Update changelog to address sashiko concerns of overhead.
> 
>  include/linux/sched.h |  1 +
>  kernel/sched/core.c   | 35 +++++++++++++++++++++++++++++++++--
>  kernel/sched/sched.h  | 25 +++++++++++++++++++++++++
>  3 files changed, 59 insertions(+), 2 deletions(-)
> 
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index fc6ecb3869dd..27dbf676113e 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -1657,6 +1657,7 @@ struct task_struct {
>  #ifdef CONFIG_UNWIND_USER
>  	struct unwind_task_info		unwind_info;
>  #endif
> +	s8				has_preferred_cpu_state;

Why not protected with the config?

It looks like you didn't ever ran pahole on it. Maybe it's worth to
try now?

>  	/* CPU-specific state of this task: */
>  	struct thread_struct		thread;
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 9e16946c9d62..281715a6e88f 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -2500,6 +2500,8 @@ static inline bool rq_has_pinned_tasks(struct rq *rq)
>   */
>  static inline bool is_cpu_allowed(struct task_struct *p, int cpu)
>  {
> +	bool task_check_preferred_cpu;
> +
>  	/* When not in the task's cpumask, no point in looking further. */
>  	if (!task_allowed_on_cpu(p, cpu))
>  		return false;
> @@ -2508,9 +2510,23 @@ static inline bool is_cpu_allowed(struct task_struct *p, int cpu)
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
> +	 */
> +	task_check_preferred_cpu = !cpu_preferred(cpu) && task_has_preferred_cpus(p);
> +
>  	/* Non kernel threads are not allowed during either online or offline. */
> -	if (!(p->flags & PF_KTHREAD))
> +	if (!(p->flags & PF_KTHREAD)) {
> +		if (task_check_preferred_cpu)
> +			return false;
>  		return cpu_active(cpu);
> +	}
>  
>  	/* KTHREAD_IS_PER_CPU is always allowed. */
>  	if (kthread_is_per_cpu(p))
> @@ -2520,6 +2536,10 @@ static inline bool is_cpu_allowed(struct task_struct *p, int cpu)
>  	if (cpu_dying(cpu))
>  		return false;
>  
> +	/* Try on preferred CPU first if possible*/
> +	if (task_check_preferred_cpu)
> +		return false;
> +
>  	/* But are allowed during online. */
>  	return cpu_online(cpu);
>  }
> @@ -3549,6 +3569,14 @@ static int select_fallback_rq(int cpu, struct task_struct *p)
>  	enum { cpuset, possible, fail } state = cpuset;
>  	int dest_cpu;
>  
> +	/*
> +	 * Cache the value whether task's affinity spans preferred CPUs.
> +	 * This helps to avoid repeating the same for each CPU
> +	 * later in the loop. Encode call to is_cpu_allowed coming
> +	 * via select_fallback_rq.
> +	 */
> +	p->has_preferred_cpu_state = task_has_preferred_cpus(p) ? 1 : -1;
> +
>  	/*
>  	 * If the node that the CPU is on has been offlined, cpu_to_node()
>  	 * will return -1. There is no CPU on the node, and we should
> @@ -3560,7 +3588,7 @@ static int select_fallback_rq(int cpu, struct task_struct *p)
>  		/* Look for allowed, online CPU in same node. */
>  		for_each_cpu(dest_cpu, nodemask) {
>  			if (is_cpu_allowed(p, dest_cpu))
> -				return dest_cpu;
> +				goto clear_and_return;
>  		}
>  	}
>  
> @@ -3604,6 +3632,8 @@ static int select_fallback_rq(int cpu, struct task_struct *p)
>  		}
>  	}
>  
> +clear_and_return:
> +	p->has_preferred_cpu_state = 0;

Sadly, you've ignored my comments from the previous round. Let me repeat
it once again:

This ->has_preferred_cpu_state is always zero out of the scope of the
function. It means, it's a local variable, and should not belong to
the task_struct.

>  	return dest_cpu;
>  }
>  
> @@ -4612,6 +4642,7 @@ static void __sched_fork(u64 clone_flags, struct task_struct *p)
>  	init_numa_balancing(clone_flags, p);
>  	p->wake_entry.u_flags = CSD_TYPE_TTWU;
>  	p->migration_pending = NULL;
> +	p->has_preferred_cpu_state = 0;
>  	init_sched_mm(p);
>  }
>  
> diff --git a/kernel/sched/sched.h b/kernel/sched/sched.h
> index c7c2dea65edd..5d009c2529b2 100644
> --- a/kernel/sched/sched.h
> +++ b/kernel/sched/sched.h
> @@ -4213,4 +4213,29 @@ DEFINE_CLASS_IS_UNCONDITIONAL(sched_change)
>  
>  #include "ext.h"
>  
> +/*
> + * has_preferred_cpu_state could have the value cached from
> + * select_fallback_rq. It is set/cleared while holding pi_lock
> + * and irq disabled.
> + *
> + *  1: Cached and preferred CPUs exists in task's affinity.
> + *  0: Not cached and need to evaluate.
> + * -1: Cached and preferred CPU doesn't exits task's affinity

So, you've got 3 options to declare the status: self-explaining enum,
self-explaining #defines, and this random numbers explained in
comment. The latter option is the worst to me.

And you didn't provide any benchmark advocating this caching
optimization.

Sorry, but NAK.

> + *
> + * Only affects FAIR task.
> + */
> +static inline bool task_has_preferred_cpus(struct task_struct *p)
> +{
> +	int cached;
> +
> +	/* Only FAIR tasks honor preferred CPU state */
> +	if (unlikely(p->sched_class != &fair_sched_class))
> +		return false;
> +
> +	cached = READ_ONCE(p->has_preferred_cpu_state);
> +	if (cached)
> +		return cached > 0;
> +	else
> +		return cpumask_intersects(p->cpus_ptr, cpu_preferred_mask);
> +}
>  #endif /* _KERNEL_SCHED_SCHED_H */
> -- 
> 2.47.3
