Received: from mail-dy1-f182.google.com (mail-dy1-f182.google.com [74.125.82.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 741D83EFFC8
	for <linux-doc@vger.kernel.org>; Fri, 26 Jun 2026 12:40:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=74.125.82.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1782477641; cv=none; b=iFa8FR0gPbc5MBAWFK5X1CkTTA+vB7uBQQnWGs7M68vQPm3MSxa4fEeAShPAfIOcpEwKVm346UYm59S6v2RlSm7MT8Vb6yHUXm5i28kgDpAEsk4kXCni2VkpSy4gNW2ua1UW+wplLZdBlMZdzrTa8ZMn6OFY3eYOH0Nj/TUA2BY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1782477641; c=relaxed/simple;
	bh=D6TPjVX4PIXvoryU3WbNOaDZGZXFmhDa1A2Z9sWegms=;
	h=From:Date:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=lqntgs+7+uBfgvPsgnqaCi4B4vJ3AFnuw0zCEF4BdLgrxaLtM/yXg2ufpWsCZPfT0wLlfIJRPtyLIbfN4qHctuqROLKjzV3zuBVgaayiNXlVz9XzG2166UJcKaFA2b7QxFCsn3KbO/s5rovrTcC9iWCTxPFGFE6oHZnrUnG3tck=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=IJNqNbHn; arc=none smtp.client-ip=74.125.82.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IJNqNbHn"
Received: by mail-dy1-f182.google.com with SMTP id 5a478bee46e88-30c03b09e02so1640794eec.1
        for <linux-doc@vger.kernel.org>; Fri, 26 Jun 2026 05:40:39 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1782477639; x=1783082439; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=/5kU5fjHQx+bqaeethf58z/XHlPAmzHNymozmWSY1+Q=;
        b=IJNqNbHnFctly0zwOcLuP27Yf6ISBUBMkRm0ycHRWUnXt7JAS7St/5Eh9fau0y+HAf
         kb7SoGcDqZanR3zga4WHd5TD1XpQRCA5ba0LMYomX0RT825PpFHftF0imFGNXlWFZYIf
         i132YMmIvu14rn9TWfEq2iJeUK190BFM0E4yLmDl+xth3QuFC29uyp4QBty2vlNUINom
         kGs6sWi5MX5cwAcsVx8gYHNPpPH1m7HKlcnZiBdsSRWswFqhu0MFcqGCcclpGhct93YF
         LCyOY0oTy9vSMoMp7g/ULzN0qhWRs2+LWyVYuLjWw2TthoW14qfyiS2byuEsvE+fOQEu
         YnkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1782477639; x=1783082439;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/5kU5fjHQx+bqaeethf58z/XHlPAmzHNymozmWSY1+Q=;
        b=Xuj2St7cSdMfn0mxbkMGJjLRAlNaRNfCqGL/Jz4dKBRUFonTCCcZfGVdq/f9sA9PwC
         8qZy6sj4ybolnKxl4IHn/90k7sFt2bs6P5ooGq4cwChpBVuImhI1d0wT7WJhDjJwlUnt
         yG0pSuy88kF+rubu+GJxCt0hzx5xxUwSg2heShBxgbmswzQlSLQmFdvVRng5WPLsfQ7Y
         MlfebkpON/BH3U0vBCvzwxv1wlixzGiSE5SgOyKR5LT6PI1hOV6cRowKBb+zz9QJYoKL
         KvH17pIL0qOtRhMVI2zvZn4ZgFDQAaTfZTzKZLoXckxtMrPKK35rA3TQD6QIsl+kNP0y
         jDBg==
X-Forwarded-Encrypted: i=1; AHgh+Rr/PIlE9nn9jZDnwUtCQUPM9+j0FMP5m7YBftCUU4HvzpkyUzlTzVx7OXvsVEK41Q5k5xCJ7bKdMiE=@vger.kernel.org
X-Gm-Message-State: AOJu0YzRwIZtFdT0hILirMe8kv7faNz5mWb6yyS9d3Tw//7BgGlEwbkH
	tL0Cfoyw90Wq+ivl3zXNtTxoWyh61t5hQgY9NvpBnjnXaZVu7uwGwwml
X-Gm-Gg: AfdE7cntcz2Wg3y3kPfT1XjTsWKy9a+kUupqw+1Yj8NjTO6gMDWhXUsFP/YxYp+vgP9
	HjJy3K/ipay7kXiRhHXVvXv2oL5LCozMIUzhZ1Gm9JL1Mg751RAyqOyUj24ctQRWhWeJ5dt85lN
	pLgAvh6cYySC04iPvcdf6yBWT9lw91wlyrNqjACKfUK+M0biwq5kWTbpYgI+41cjBknT8mYPhXO
	1rERHiDgh9jiQqzGm4t2ArAdYKPgnrLap8yu4i8CWW1P0gs+QI0OuKaHWC7FkppI7sL7dDz3cln
	vgl1l6jti7+X+7eVpVsTo+51HFReYs5WRIIGx22FhkjP793XyTYvpQmUvQ5R676Gvq38YakxLKP
	5HDXl72dqrj9ZAL+YJjP0BlP293iArgJ8HAyrnYW6M/9u+LujpqR+0aHmqGdpSzj/lDvoCNrfhT
	IKxD2MS/7z
X-Received: by 2002:a05:693c:62cc:b0:30c:6690:53a1 with SMTP id 5a478bee46e88-30c84d10a64mr4844029eec.16.1782477638454;
        Fri, 26 Jun 2026 05:40:38 -0700 (PDT)
Received: from localhost ([216.228.127.129])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-30c7c9e220bsm18411512eec.21.2026.06.26.05.40.37
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 26 Jun 2026 05:40:37 -0700 (PDT)
From: Yury Norov <yury.norov@gmail.com>
X-Google-Original-From: Yury Norov <ynorov@nvidia.com>
Date: Fri, 26 Jun 2026 08:40:36 -0400
To: Peter Zijlstra <peterz@infradead.org>
Cc: Shrikanth Hegde <sshegde@linux.ibm.com>, linux-kernel@vger.kernel.org,
	mingo@kernel.org, juri.lelli@redhat.com, vincent.guittot@linaro.org,
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
Subject: Re: [PATCH v5 04/24] cpumask: Introduce cpu_preferred_mask
Message-ID: <aj5zRBrQJG-cxs0_@yury>
References: <20260625124648.802832-1-sshegde@linux.ibm.com>
 <20260625124648.802832-5-sshegde@linux.ibm.com>
 <20260626093901.GN1181229@noisy.programming.kicks-ass.net>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260626093901.GN1181229@noisy.programming.kicks-ass.net>

On Fri, Jun 26, 2026 at 11:39:01AM +0200, Peter Zijlstra wrote:
> On Thu, Jun 25, 2026 at 06:16:28PM +0530, Shrikanth Hegde wrote:
> 
> > diff --git a/include/linux/cpumask.h b/include/linux/cpumask.h
> > index 80211900f373..5a643d608ea6 100644
> > --- a/include/linux/cpumask.h
> > +++ b/include/linux/cpumask.h
> > @@ -120,12 +120,20 @@ extern struct cpumask __cpu_enabled_mask;
> >  extern struct cpumask __cpu_present_mask;
> >  extern struct cpumask __cpu_active_mask;
> >  extern struct cpumask __cpu_dying_mask;
> > +
> > +#ifdef CONFIG_PREFERRED_CPU
> > +extern struct cpumask __cpu_preferred_mask;
> > +#else
> > +#define __cpu_preferred_mask __cpu_active_mask
> > +#endif
> 
> This is cure, but does it not result in set_cpu_preferred() changing
> active mask, and it that not somewhat unexpected behaviour?

I agree, and I think I already commented on it on previous round.
set_cpu_preferred() should be protected the same way as the
corresponding mask, and should be a NOP when CONFIG_PREFERRED_CPU
is disabled.

> >  #define cpu_possible_mask ((const struct cpumask *)&__cpu_possible_mask)
> >  #define cpu_online_mask   ((const struct cpumask *)&__cpu_online_mask)
> >  #define cpu_enabled_mask   ((const struct cpumask *)&__cpu_enabled_mask)
> >  #define cpu_present_mask  ((const struct cpumask *)&__cpu_present_mask)
> >  #define cpu_active_mask   ((const struct cpumask *)&__cpu_active_mask)
> >  #define cpu_dying_mask    ((const struct cpumask *)&__cpu_dying_mask)
> > +#define cpu_preferred_mask ((const struct cpumask *)&__cpu_preferred_mask)
> >  
> >  extern atomic_t __num_online_cpus;
> >  extern unsigned int __num_possible_cpus;
> 
> > diff --git a/kernel/cpu.c b/kernel/cpu.c
> > index bc4f7a9ba64e..d623a9c5554a 100644
> > --- a/kernel/cpu.c
> > +++ b/kernel/cpu.c
> > @@ -3107,6 +3107,11 @@ EXPORT_SYMBOL(__cpu_dying_mask);
> >  atomic_t __num_online_cpus __read_mostly;
> >  EXPORT_SYMBOL(__num_online_cpus);
> >  
> > +#ifdef CONFIG_PREFERRED_CPU
> > +struct cpumask __cpu_preferred_mask __read_mostly;
> > +EXPORT_SYMBOL(__cpu_preferred_mask);
> > +#endif
> 
> Precedent is definitely towards !GPL exports for this, but could we get
> away with making this one GPL?
> 
> 
> > @@ -3164,6 +3169,7 @@ void __init boot_cpu_init(void)
> >  	/* Mark the boot cpu "present", "online" etc for SMP and UP case */
> >  	set_cpu_online(cpu, true);
> >  	set_cpu_active(cpu, true);
> > +	set_cpu_preferred(cpu, true);
> 
> This sets active twice, which is harmless, but wasteful...

I think, the good criteria for correctness of this series would be the
identical binaries before the series, and when CONFIG_PREFERRED_CPU is
off. At least, as a mental model. This double-set chunk breaks that
model. 

Thanks,
Yury
 
> >  	set_cpu_present(cpu, true);
> >  	set_cpu_possible(cpu, true);
> >  
> > diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> > index 2f4530eb543f..9e16946c9d62 100644
> > --- a/kernel/sched/core.c
> > +++ b/kernel/sched/core.c
> > @@ -8685,6 +8685,9 @@ int sched_cpu_activate(unsigned int cpu)
> >  	 */
> >  	sched_set_rq_online(rq, cpu);
> >  
> > +	/* preferred is subset of active and follows its state */
> > +	set_cpu_preferred(cpu, true);
> > +
> >  	return 0;
> >  }
> >  
> > @@ -8698,6 +8701,8 @@ int sched_cpu_deactivate(unsigned int cpu)
> >  	if (ret)
> >  		return ret;
> >  
> > +	set_cpu_preferred(cpu, false);
> > +
> >  	/*
> >  	 * Remove CPU from nohz.idle_cpus_mask to prevent participating in
> >  	 * load balancing when not active
> 
> But this one clears active earlier, is that not a problem?
> 
> Perhaps it is best if the modifier is a no-op when preferred mask does
> not exist?
