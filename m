Received: from casper.infradead.org (casper.infradead.org [90.155.50.34])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 065953A9872;
	Fri, 26 Jun 2026 09:39:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=90.155.50.34
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782466759; cv=none; b=i7jYtssxJOKTJ+9yVYyu8XL+U++4n2yfToiKz695MQu8uFtD4xkG7cXP1NkYxd20b5LfRoD/ZzLtAnPcjkmg6cvN3yWf0b4lfuwaiY7d+eWN4zNG7HQ/r+hWKZiDJQRKr3TL7zUwQkB364zLaaMsgGzeAy9olRueft2JZMfcxyY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782466759; c=relaxed/simple;
	bh=MVv+iCa4DBRsLJNBDeEMlWYjqTSYoIKGZ6gHkBcfAnE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=ONP5OzoP1Enk5SVzrUG7BQxW9QXPU44PI5WarJrcqMI+S9193jwLiq1ZaWLjs5geXtOVJ5YcnG1IwDucAcvqBnhQu9D6RrGaOhIKVZ0nwoCXH/ri5Diz+MLIL5n5TMtR2tZsLISK384n5JxOzQ1Aut5TVRU85NXgesZB7ZqD10Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org; spf=pass smtp.mailfrom=infradead.org; dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b=OuesBLEf; arc=none smtp.client-ip=90.155.50.34
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=infradead.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=infradead.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="OuesBLEf"
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=WT94vYaHeEbsEBUlGOO/VYmwk3VsxtB3iYeNZFFk0mc=; b=OuesBLEfmzhH1fQzOI9reG5awB
	uZPhVpVR+mVXZmEJeJaxBQVTkOdI71ZZc0s+FFE1jrEFJzYGzjkzMbspeeOoICWUJQdN0JWwy28fy
	JXX1S1Hy9OSctCjWFP5kgf5PtFgA5MrOOyzr0gUK80EkFayeBXL3fTSZRVJQUMXGK4m8aZYC1x8q8
	fTIe0sQQLX/hGoByrn7eodl7uUXPhEm2kqa4PulSUG3KGnzDCcpreH6Ae52+bJNizTsQtAOpTyRq6
	K+pH0+DjvrmCd9aaYcqMFspvGWRWuBwuqX628nFtEQs6QQDpuJDQEQWAe9vVncrHN3UCjZta9XZ2l
	6unb19kQ==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wd31Z-0000000BaW5-3PJZ;
	Fri, 26 Jun 2026 09:39:02 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id C4740301574; Fri, 26 Jun 2026 11:39:01 +0200 (CEST)
Date: Fri, 26 Jun 2026 11:39:01 +0200
From: Peter Zijlstra <peterz@infradead.org>
To: Shrikanth Hegde <sshegde@linux.ibm.com>
Cc: linux-kernel@vger.kernel.org, mingo@kernel.org, juri.lelli@redhat.com,
	vincent.guittot@linaro.org, yury.norov@gmail.com,
	kprateek.nayak@amd.com, iii@linux.ibm.com, corbet@lwn.net,
	tglx@kernel.org, gregkh@linuxfoundation.org, pbonzini@redhat.com,
	seanjc@google.com, vschneid@redhat.com, huschle@linux.ibm.com,
	rostedt@goodmis.org, dietmar.eggemann@arm.com, maddy@linux.ibm.com,
	srikar@linux.ibm.com, hdanton@sina.com, chleroy@kernel.org,
	vineeth@bitbyteword.org, frederic@kernel.org, arighi@nvidia.com,
	pauld@redhat.com, christian.loehle@arm.com, tj@kernel.org,
	tommaso.cucinotta@gmail.com, maz@kernel.org, rafael@kernel.org,
	rdunlap@infradead.org, kernellwp@gmail.com,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v5 04/24] cpumask: Introduce cpu_preferred_mask
Message-ID: <20260626093901.GN1181229@noisy.programming.kicks-ass.net>
References: <20260625124648.802832-1-sshegde@linux.ibm.com>
 <20260625124648.802832-5-sshegde@linux.ibm.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260625124648.802832-5-sshegde@linux.ibm.com>

On Thu, Jun 25, 2026 at 06:16:28PM +0530, Shrikanth Hegde wrote:

> diff --git a/include/linux/cpumask.h b/include/linux/cpumask.h
> index 80211900f373..5a643d608ea6 100644
> --- a/include/linux/cpumask.h
> +++ b/include/linux/cpumask.h
> @@ -120,12 +120,20 @@ extern struct cpumask __cpu_enabled_mask;
>  extern struct cpumask __cpu_present_mask;
>  extern struct cpumask __cpu_active_mask;
>  extern struct cpumask __cpu_dying_mask;
> +
> +#ifdef CONFIG_PREFERRED_CPU
> +extern struct cpumask __cpu_preferred_mask;
> +#else
> +#define __cpu_preferred_mask __cpu_active_mask
> +#endif

This is cure, but does it not result in set_cpu_preferred() changing
active mask, and it that not somewhat unexpected behaviour?

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

> diff --git a/kernel/cpu.c b/kernel/cpu.c
> index bc4f7a9ba64e..d623a9c5554a 100644
> --- a/kernel/cpu.c
> +++ b/kernel/cpu.c
> @@ -3107,6 +3107,11 @@ EXPORT_SYMBOL(__cpu_dying_mask);
>  atomic_t __num_online_cpus __read_mostly;
>  EXPORT_SYMBOL(__num_online_cpus);
>  
> +#ifdef CONFIG_PREFERRED_CPU
> +struct cpumask __cpu_preferred_mask __read_mostly;
> +EXPORT_SYMBOL(__cpu_preferred_mask);
> +#endif

Precedent is definitely towards !GPL exports for this, but could we get
away with making this one GPL?


> @@ -3164,6 +3169,7 @@ void __init boot_cpu_init(void)
>  	/* Mark the boot cpu "present", "online" etc for SMP and UP case */
>  	set_cpu_online(cpu, true);
>  	set_cpu_active(cpu, true);
> +	set_cpu_preferred(cpu, true);

This sets active twice, which is harmless, but wasteful...

>  	set_cpu_present(cpu, true);
>  	set_cpu_possible(cpu, true);
>  
> diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> index 2f4530eb543f..9e16946c9d62 100644
> --- a/kernel/sched/core.c
> +++ b/kernel/sched/core.c
> @@ -8685,6 +8685,9 @@ int sched_cpu_activate(unsigned int cpu)
>  	 */
>  	sched_set_rq_online(rq, cpu);
>  
> +	/* preferred is subset of active and follows its state */
> +	set_cpu_preferred(cpu, true);
> +
>  	return 0;
>  }
>  
> @@ -8698,6 +8701,8 @@ int sched_cpu_deactivate(unsigned int cpu)
>  	if (ret)
>  		return ret;
>  
> +	set_cpu_preferred(cpu, false);
> +
>  	/*
>  	 * Remove CPU from nohz.idle_cpus_mask to prevent participating in
>  	 * load balancing when not active

But this one clears active earlier, is that not a problem?

Perhaps it is best if the modifier is a no-op when preferred mask does
not exist?
