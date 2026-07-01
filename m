Received: from mail-yw1-f170.google.com (mail-yw1-f170.google.com [209.85.128.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4C9E348C75
	for <linux-doc@vger.kernel.org>; Wed,  1 Jul 2026 15:35:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.170
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782920160; cv=none; b=o+GMDugAP2XcT2L6J7DSo0BBmlg8K/4dqPszrSouR9o0zNyPp8s2n3tVTnk2a63e6JD9/bH0FwJQZCmBHZKft3bpyzrBtBMIQuVWxtyUa/iEGDBAqq7eXHiA5ydnvpSlUdr+xw2EAbpaNCkmm1vMHw0VqUBJ0NbrRi2EuJJuzGA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782920160; c=relaxed/simple;
	bh=3R05u4YHDQ4KbnN/MSes9bHjtHg38wtiXjdSeaB5Dlc=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=LLS3AVHNqh6jIpVZQMjJLDuS/jnhtn8jgIXWXFs0IOvWqhjtIaRDOM+P9bOYBglcREbqYUMXv47bqcUMpr/hxa6A+jFqZqYtWxqYKBIpsu0GQB/uK8Wc0SAWYyeWRiZ2O37Pb12mJpRZVk4ccmF+RsTZCiusdTh+ZFXHeR9xXcU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=AY7/ypBx; arc=none smtp.client-ip=209.85.128.170
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AY7/ypBx"
Received: by mail-yw1-f170.google.com with SMTP id 00721157ae682-7fe36f1be74so11798617b3.2
        for <linux-doc@vger.kernel.org>; Wed, 01 Jul 2026 08:35:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782920158; x=1783524958; darn=vger.kernel.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:from:to
         :cc:subject:date:message-id:reply-to;
        bh=uTRG7Pajwv3HZZVoro8AGOA4aqnFDn9VcJTzwsbcBv4=;
        b=AY7/ypBxHX4JIYGDtAVH0yyDSfd9bVBFpjNNTe6VdnQRJswW1ieHq/V87t8oY5Ollp
         t/Ni6HhH4aGUHWsdiYzq7LcbOdqOQEi92DO2+Jz4lmrxxsOQTXqPH/W3IEZRdAemPb3R
         4lM80NbwKch1xMjFeY0YAWLcPJi6c4SGI/ZK93hlKC/6sC4+HBQOU4/u9b7QrGHwhOJF
         l83FnuGkH8sFIGvmqLYlY1vb9GbImPuFUHdfYit0ZZmW5TvCZeiv7YlzPMidOfVgNBXO
         59wkDzfDfCuTVfXFOZpefX/l9NM/Oa4yErwDs2yg3pVuHRxN4FVCO/xuUDZPtHnGdUnq
         HwKg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782920158; x=1783524958;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=uTRG7Pajwv3HZZVoro8AGOA4aqnFDn9VcJTzwsbcBv4=;
        b=EsFIIAxg8xo2cCoOv1Rn1l+PDdfccKSXJVpDtX3wkAXZMrJozp7kY3Mnn2GMhFx5g9
         zZ8pfEqKxaCr0FSZrAEQ0l1NuWVINQU+uwWM7lzXz1yv3Ub4NQ+K3aMUtx8kWy4hSEEF
         PIVmzheNLb2eEmVVrxm4/G9uWHhT4g8/NaN8SrWIhhyA7ZisDWoMKDpPL3tPq/Xm6s29
         PHOpyS9gBEqzi/TghTcbBHvHrVLf/X0fYISnOSPY0758Cw2iYNQ60UhVoCBf+RAAuuFE
         vLSwwzBRRljAJLSetgcRwfVWYN0EP9R8yvZuOJt9pidc18WdTiv3mBShudNUR3t64ORP
         WxYw==
X-Forwarded-Encrypted: i=1; AHgh+Ro0ulWUOIprF5EjRAFHMQgJhbu16dBfmc29+uVosbY9PLG6iY1pbCaRfYDnoB1XVszdBQg8kVy1gb0=@vger.kernel.org
X-Gm-Message-State: AOJu0YySqf9rwMe0jj2oC+MhtF/i5knkKruoSHGiir6z3+qryxJuWTcR
	jrNZHvcE5qw4eqrYseAY6jJJ33O1al8rwVyg5TXV6NDeXHBWDDqce5XJ
X-Gm-Gg: AfdE7cmN+Io57dmuBDk0IOnE6VlxauoY+2wfB3R4zbQh5KhIY0gi3mw91JJOyJN0VMD
	fhkAGRvKDClkfS1llXGlSzX9dz5YYBv/fdtvHL7CNk5WNVpUDiaSV+WaYnhtNkNd29t2pSSa1R0
	7X8cw0Rz8f3i4L48RcO6FiUbjKWk7kbdYdFBx4olLiBuyUTZfCT/+t+CJ9QuGwO93tsH9eVAakf
	rrQF/oOi1VY2/o/OE0w9/QmTAs5JZ8BYOdZylG+iqT1CwZx/93ewxNt/oXCOxGI9O390nYnRySd
	KBTbgUcL0ZC3/8TaVtGK4wb40dlLze74JmzauLkdxi/jZa7lBY5GRyFCKiKtzMhDlz33H/91z93
	gaR7uuOVf+VlzAqydTvLKSA4hyCmqE9pVfbQ6Uq0ReREibHXUm8lx/XmKlq+J+uIxK5F/Aakai3
	kReyiFz2w/v2Sy9eE=
X-Received: by 2002:a05:690c:630b:b0:80c:90ed:c79f with SMTP id 00721157ae682-812eb86989amr22063147b3.52.1782920157510;
        Wed, 01 Jul 2026 08:35:57 -0700 (PDT)
Received: from localhost ([24.129.38.94])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-8144783efacsm1543497b3.8.2026.07.01.08.35.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 01 Jul 2026 08:35:57 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
X-Google-Original-From: Yury Norov <ynorov@nvidia.com>
Date: Wed, 1 Jul 2026 11:35:56 -0400
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
Subject: Re: [PATCH v6 03/23] cpumask: Introduce cpu_preferred_mask
Message-ID: <akUz3GlKrWQTZIWK@yury>
References: <20260701141654.500125-1-sshegde@linux.ibm.com>
 <20260701141654.500125-4-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260701141654.500125-4-sshegde@linux.ibm.com>

On Wed, Jul 01, 2026 at 07:46:34PM +0530, Shrikanth Hegde wrote:
> Provide cpu_preferred_mask infrastructure. Define get/set macros
> which could be used to get/set CPU state as preferred.
> 
> Values are set/clear by the new driver called steal_monitor.
> It periodically samples the steal time and decides preferred CPU state.
> 
> A CPU is set to preferred when it becomes active. Later it may be
> marked as non-preferred depending on steal time values with
> steal_monitor being enabled.
> 
> Always maintain design construct of preferred is subset of active.
> i.e. preferred ⊆ active ⊆ online ⊆ present ⊆ possible
> 
> With PREFERRED_CPU=n, set is nop and get returns active state.
> 
> Signed-off-by: Shrikanth Hegde <sshegde@linux.ibm.com>
> ---
> v5->v6:
> - Make it nop for PREFERRED_CPU=n
> - Make it EXPORT_SYMBOL_GPL
> 
>  include/linux/cpumask.h | 27 ++++++++++++++++++++++++++-
>  kernel/cpu.c            |  6 ++++++
>  kernel/sched/core.c     |  5 +++++
>  3 files changed, 37 insertions(+), 1 deletion(-)
> 
> diff --git a/include/linux/cpumask.h b/include/linux/cpumask.h
> index d3cda0544954..c97271c063ce 100644
> --- a/include/linux/cpumask.h
> +++ b/include/linux/cpumask.h
> @@ -122,12 +122,20 @@ extern struct cpumask __cpu_enabled_mask;
>  extern struct cpumask __cpu_present_mask;
>  extern struct cpumask __cpu_active_mask;
>  extern struct cpumask __cpu_dying_mask;
> +
> +#ifdef CONFIG_PREFERRED_CPU
> +extern struct cpumask __cpu_preferred_mask;
> +#else
> +#define __cpu_preferred_mask __cpu_active_mask
> +#endif
> +
>  #define cpu_possible_mask ((const struct cpumask *)&__cpu_possible_mask)
>  #define cpu_online_mask   ((const struct cpumask *)&__cpu_online_mask)
>  #define cpu_enabled_mask   ((const struct cpumask *)&__cpu_enabled_mask)
>  #define cpu_present_mask  ((const struct cpumask *)&__cpu_present_mask)
>  #define cpu_active_mask   ((const struct cpumask *)&__cpu_active_mask)
>  #define cpu_dying_mask    ((const struct cpumask *)&__cpu_dying_mask)
> +#define cpu_preferred_mask ((const struct cpumask *)&__cpu_preferred_mask)
>  
>  extern atomic_t __num_online_cpus;
>  extern unsigned int __num_possible_cpus;
> @@ -1164,6 +1172,13 @@ void init_cpu_possible(const struct cpumask *src);
>  #define set_cpu_active(cpu, active)	assign_cpu((cpu), &__cpu_active_mask, (active))
>  #define set_cpu_dying(cpu, dying)	assign_cpu((cpu), &__cpu_dying_mask, (dying))
>  
> +#ifdef CONFIG_PREFERRED_CPU
> +#define set_cpu_preferred(cpu, preferred) assign_cpu((cpu), &__cpu_preferred_mask, (preferred))
> +#else
> +/* Don't edit active state when the feature is off */

And that makes a random reader thinking like why in the world he mentions
active state here?

Can you move this in commit message, or drop entirely?

> +#define set_cpu_preferred(cpu, preferred) {}
> +#endif
> +
>  void set_cpu_online(unsigned int cpu, bool online);
>  void set_cpu_possible(unsigned int cpu, bool possible);
>  
> @@ -1258,7 +1273,12 @@ static __always_inline bool cpu_dying(unsigned int cpu)
>  	return cpumask_test_cpu(cpu, cpu_dying_mask);
>  }
>  
> -#else
> +static __always_inline bool cpu_preferred(unsigned int cpu)
> +{
> +	return cpumask_test_cpu(cpu, cpu_preferred_mask);
> +}
> +
> +#else	/* NR_CPUS <= 1 */

NR_CPUS can't be less than 1, I guess.

>  
>  #define num_online_cpus()	1U
>  #define num_possible_cpus()	1U
> @@ -1296,6 +1316,11 @@ static __always_inline bool cpu_dying(unsigned int cpu)
>  	return false;
>  }
>  
> +static __always_inline bool cpu_preferred(unsigned int cpu)
> +{
> +	return cpu == 0;
> +}
> +
>  #endif /* NR_CPUS > 1 */
>  
>  #define cpu_is_offline(cpu)	unlikely(!cpu_online(cpu))
> diff --git a/kernel/cpu.c b/kernel/cpu.c
> index b3c8553d7bd6..376d297a6292 100644
> --- a/kernel/cpu.c
> +++ b/kernel/cpu.c
> @@ -3103,6 +3103,11 @@ EXPORT_SYMBOL(__cpu_dying_mask);
>  atomic_t __num_online_cpus __read_mostly;
>  EXPORT_SYMBOL(__num_online_cpus);
>  
> +#ifdef CONFIG_PREFERRED_CPU
> +struct cpumask __cpu_preferred_mask __read_mostly;
> +EXPORT_SYMBOL_GPL(__cpu_preferred_mask);
> +#endif
> +
>  void init_cpu_present(const struct cpumask *src)
>  {
>  	cpumask_copy(&__cpu_present_mask, src);
> @@ -3160,6 +3165,7 @@ void __init boot_cpu_init(void)
>  	/* Mark the boot cpu "present", "online" etc for SMP and UP case */
>  	set_cpu_online(cpu, true);
>  	set_cpu_active(cpu, true);
> +	set_cpu_preferred(cpu, true);
>  	set_cpu_present(cpu, true);
>  	set_cpu_possible(cpu, true);
>  
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 2e7cde033a31..a45f7c308329 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -8690,6 +8690,9 @@ int sched_cpu_activate(unsigned int cpu)
>  	 */
>  	sched_set_rq_online(rq, cpu);
>  
> +	/* preferred is subset of active and follows its state */
> +	set_cpu_preferred(cpu, true);
> +
>  	return 0;
>  }
>  
> @@ -8703,6 +8706,8 @@ int sched_cpu_deactivate(unsigned int cpu)
>  	if (ret)
>  		return ret;
>  
> +	set_cpu_preferred(cpu, false);
> +
>  	/*
>  	 * Remove CPU from nohz.idle_cpus_mask to prevent participating in
>  	 * load balancing when not active
> -- 
> 2.47.3
