Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C91693AEF4E
	for <linux-doc@vger.kernel.org>; Wed,  4 Mar 2026 14:44:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.221.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772635465; cv=none; b=QZY7A/l4190EkY0GlDzxHty3Xsp3a4BiYqtrdxOXJI4O0wqUDAzcnRzQzX2yNhIe2GlRiO3Ll+pff6XND+tqip2U7YMH1JCaBCY2UpNQTABhxi0M2yrE95/k3WgIt6G30fpTsqvW8SAaCyqWaTp3DbtoTFPwlYFW4Zs74IPpoA8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772635465; c=relaxed/simple;
	bh=zeEPSdifryNCdt7mG0efeA3hUcDDas4ApF+c2Ka13M0=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=PnVtE5Zd3JOenJROsseLyIMev0cW0BnaQOr9WV19x9TXbLVP852y8LN3M6EPh3vc1P16aPlOsB+7ARVZDknLsq1lBh/nCxFzvArVqAVdMtiqU/ETA9Nwm8rnQwreG1ScmN8NQGZf5/ZGSccjme0/BW1gLxL/KOO1UdUVXOqnYiM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com; spf=pass smtp.mailfrom=suse.com; dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b=RQIL25Al; arc=none smtp.client-ip=209.85.221.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=suse.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=suse.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=suse.com header.i=@suse.com header.b="RQIL25Al"
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-439c9bdc241so490041f8f.0
        for <linux-doc@vger.kernel.org>; Wed, 04 Mar 2026 06:44:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=suse.com; s=google; t=1772635461; x=1773240261; darn=vger.kernel.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=IYe6tJ7LJWIqKKbqFtGxbwp/3x9oEmWkumHTuHKs8eE=;
        b=RQIL25Al1MwUqzce4YM6lx0dZ5ukWelJO8jEQiHhfYkDEW8Og0XQunA1DV6BflElQv
         fkBSfjZs3z0hV9Cg2Uf5aq6htPJ9gl0/WDNZB9GPUMVmLJUhflxQR0KaXgN4jTcDZTsm
         cg4fOGWfNwQggb60Ld5/XWbWd8tXOZ8G0auWMeD6bm5s7qMfKBGbrFjvLnm4Adt5Xj+E
         u6MCFIxtgdi7gWWkgvhJ/TmbDfY7/47iHShM8DObiQ+W57di71mf7XphyvMO2itehR65
         uW/R5lRn+4i2z2JgX/84nUyCh1ewOA4lnuLbJ339lpx2bNBuDNUftlvnmuMAvTjWxjkq
         bEzw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772635461; x=1773240261;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=IYe6tJ7LJWIqKKbqFtGxbwp/3x9oEmWkumHTuHKs8eE=;
        b=wRWSgV7uvYXskFyXV9EQg+9rplhhBsHLoKFw2XyvgynJHQJF9BpHWJue0mzDghoDi2
         /SW8bc85aLusRZyVWUaHWZa54rn4udhs+e/wbYjeU4c73aKqf08F/Lsfv3g7K7TEYEMJ
         crpZKoI1rZXRJ5JwjPHGvudeoFE8PGI273pEIPwa+h+MaOJZmiVGx8PHEUshz6gyJIF4
         cwYXAbPNDRyIUUSWig/ZEnBADOEtZwJD9CgFY2HVAcTBkMMUHw5qBhB1RCrOxVwDV+R9
         e/dsMUjlzEZwKYcKcw1/ocUk1q2mMC2BLGNHemEpVSVOJK/wbBTHw34pzdlGN72rfjdW
         OjFg==
X-Forwarded-Encrypted: i=1; AJvYcCXN0d0Nf4pWWgV+gQC3VEF4JGl9AtSorFUhyKGrLiPzRbW3tbFxZM5IAJScNbK58qUeit9DkQaB07o=@vger.kernel.org
X-Gm-Message-State: AOJu0Yxy8hpf7lNMQMXLYDrVEU5y876W5Q3RPiGGK2JthqwHyP5PhboH
	JyhWgoYbl5X6N13YopD4s8eyb+Xs85YSPXSxiftwrO8cUeT1+JwRA5vV5mBJf2lv3oo=
X-Gm-Gg: ATEYQzwvNiP3FScb8j6uuS5BPaGA7D7UZwUTAmllJrqOwQzsd2aGJHl6guPtabrleek
	TuFLaamx/h084qlTFlcdJOjCbu+JvOxjtVDyMDwku+OZx/Nfzn7RjeG0Y19vry26GxXKsEGgfrr
	0DAOkDLidO4hOBRNDdYVdfIhNlejAgx7eo4X9lbJhUaLH/m6PC7/pJldGrGkDlyRsX5MsNMoTCn
	+nB+ZXMfbN+CHnFFD0wBrrrxzZtmryibnMlW5HLg7dhMwasHAPosBtvypdml/vG8c3Bd9tvsRim
	o5oz12SVr8hVFgR5AsMewjet8Kv4UCNuqhwRWBkTgwzjHX+0teE3SYDf16gxLEnczXqal84Kz81
	eTXVu6+gOs/1ff9/UxOV0rJfr9UJYGDWelvOH/k1RIdOjuAB6i7RiPk8tqHIwoHBOUrit+TwrWg
	2G1B+UdGAhyACpWnjWs4kn1dCUvIvasZQYbHcp
X-Received: by 2002:a05:6000:2311:b0:439:b3a3:7239 with SMTP id ffacd0b85a97d-439c7f8f502mr4382639f8f.5.1772635460499;
        Wed, 04 Mar 2026 06:44:20 -0800 (PST)
Received: from pathway.suse.cz ([176.114.240.130])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-439ba2a5970sm20179055f8f.33.2026.03.04.06.44.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 06:44:20 -0800 (PST)
Date: Wed, 4 Mar 2026 15:44:17 +0100
From: Petr Mladek <pmladek@suse.com>
To: mrungta@google.com
Cc: Jonathan Corbet <corbet@lwn.net>,
	Jinchao Wang <wangjinchao600@gmail.com>,
	Yunhui Cui <cuiyunhui@bytedance.com>,
	Stephane Eranian <eranian@google.com>,
	Ian Rogers <irogers@google.com>, Li Huafei <lihuafei1@huawei.com>,
	Feng Tang <feng.tang@linux.alibaba.com>,
	Max Kellermann <max.kellermann@ionos.com>,
	Douglas Anderson <dianders@chromium.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Subject: Re: [PATCH 1/4] watchdog/hardlockup: Always update saved interrupts
 during check
Message-ID: <aahFQaHxNFsoaxEb@pathway.suse.cz>
References: <20260212-hardlockup-watchdog-fixes-v1-0-745f1dce04c3@google.com>
 <20260212-hardlockup-watchdog-fixes-v1-1-745f1dce04c3@google.com>
Precedence: bulk
X-Mailing-List: linux-doc@vger.kernel.org
List-Id: <linux-doc.vger.kernel.org>
List-Subscribe: <mailto:linux-doc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-doc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260212-hardlockup-watchdog-fixes-v1-1-745f1dce04c3@google.com>

On Thu 2026-02-12 14:12:10, Mayank Rungta via B4 Relay wrote:
> From: Mayank Rungta <mrungta@google.com>
> 
> Currently, arch_touch_nmi_watchdog() causes an early return that
> skips updating hrtimer_interrupts_saved. This leads to stale
> comparisons and delayed lockup detection.
> 
> Update the saved interrupt count before checking the touched flag
> to ensure detection timeliness.

IMHO, it is not that easy, see below.

So I am curious. Have you found this when debugging a particular
problem or just by reading the code, please?

> --- a/kernel/watchdog.c
> +++ b/kernel/watchdog.c
> @@ -186,7 +186,21 @@ static void watchdog_hardlockup_kick(void)
>  
>  void watchdog_hardlockup_check(unsigned int cpu, struct pt_regs *regs)
>  {
> +	bool is_hl;
>  	int hardlockup_all_cpu_backtrace;
> +	/*
> +	 * Check for a hardlockup by making sure the CPU's timer
> +	 * interrupt is incrementing. The timer interrupt should have
> +	 * fired multiple times before we overflow'd. If it hasn't
> +	 * then this is a good indication the cpu is stuck
> +	 *
> +	 * Purposely check this _before_ checking watchdog_hardlockup_touched
> +	 * so we make sure we still update the saved value of the interrupts.
> +	 * Without that we'll take an extra round through this function before
> +	 * we can detect a lockup.
> +	 */
> +
> +	is_hl = is_hardlockup(cpu);
>  
>  	if (per_cpu(watchdog_hardlockup_touched, cpu)) {
>  		per_cpu(watchdog_hardlockup_touched, cpu) = false;

Hmm, this does not look correct to me.

1. First, let's agree on the meaning of "watchdog_hardlockup_touched".

   My understanding is that arch_touch_nmi_watchdog() is called by code
   which might block interrupts (timers) for a long time and wants to
   hide it.

   Blocking interrupts for too long is _bad_. In the ideal word,
   nobody should call arch_touch_nmi_watchdog() because we want
   to know about all sinners.

   In the real world, we allow to hide some sinners because
   they might produce "false" positives, see touch_nmi_watchdog()
   callers:

     + Most callers are printk() related.

       We might argue whether it is a false positive or not.

       The argument for "touching the watchdog" is that slow serial
       consoles might block IRQs for a long time. But they work as
       expected and can't do better.

       Also the stall is kind of expected in this case. We could
       confuse users and/or hide the original problem if the stall
       was reported.

       Note that there is a bigger problem with the legacy console
       drivers. printk() tries to emit them immediately. And the
       current console_lock() owner become responsible for flushing
       new messages added by other CPUs in parallel.

       It is better with the new NBCON console drivers which are
       offloaded to a kthread. Here, printk() tries to flush them directly
       only when called in an emergency mode (WARN, stall report)
       or in panic().

     + There are some other callers, for example, multi_stop_cpu(),
       or hv_do_rep_hypercall_ex(). IMHO, they create stalls on
       purpose.


2. Let's look at is_hardlockup() in detail:

    static bool is_hardlockup(unsigned int cpu)
    {
    	int hrint = atomic_read(&per_cpu(hrtimer_interrupts, cpu));
    
    	if (per_cpu(hrtimer_interrupts_saved, cpu) == hrint) {
    		per_cpu(hrtimer_interrupts_missed, cpu)++;
    		if (per_cpu(hrtimer_interrupts_missed, cpu) >= watchdog_hardlockup_miss_thresh)
    			return true;
    
    		return false;
    	}
    
    	per_cpu(hrtimer_interrupts_saved, cpu) = hrint;
    	per_cpu(hrtimer_interrupts_missed, cpu) = 0;
    
    	return false;
    }

    If we call it when the watchdog was touched then
    (per_cpu(hrtimer_interrupts_saved, cpu) == hrint)

        =>  per_cpu(hrtimer_interrupts_missed, cpu)++;

    is called even when watchdog was touched.

    As a result, we might report stall which should have been hidden,
    for example:

CPU0				   CPU1

 <NMI>
   watchdog_hardlockup_check() # passes
     is_hardlockup() # no
       hr_int_saved = hr_int;
       hr_int_missed = 0;
 </NMI>

  local_irq_save()
    printk()
      console_trylock()
      console_unlock()
        console_flush_all()

           touch_nmi_watchdog()

				   // Other CPUs print many messages,
				   // e.g. during boot when initializing a lot of HW
				   for (i=0; i<1000; i++) do
				       printk();

      <NMI>
        watchdog_hardlockup_check()
	  is_hardlockup() # yes
	    hr_int_missed++  # 1

          # skip because touched
      </NMI>

         touch_nmi_watchdog()

      <NMI>
        watchdog_hardlockup_check()
	  is_hardlockup() # yes
	    hr_int_missed++  # 2

          # skip because touched
      </NMI>

    ... repeat many times ...

  local_irq_restore()

    # this might normally trigger handling of pending IRQs
    # including the timers. But IMHO, it can be offloaded
    # to a kthread (at least on RT)

      <NMI>
        watchdog_hardlockup_check()
	  is_hardlockup() # yes
	    hr_int_missed++  # might be already 3, 4,...

          Report hardlockup even when all the "hr_int_missed"
	  values should have been ignored because of
	  touch_watchdog.

      </NMI>


A solution might be clearing "hrtimer_interrupts_missed"
when the watchdog was touched.

But honestly, I am not sure if this is worth the complexity.


Higher level look:
------------------

My understanding is that this patch has an effect only when
touch_nmi_watchdog() is called as frequently as
watchdog_hardlockup_check().

The original code gives the system more time to recover after
a known stall (touch_nmi_watchdog() called).

The new code is more eager to report a stall. It might be more prone
to report "false" positives.

IMHO, the root of the problem is that touch_nmi_watchdog() is
called too frequently. And this patch is rather dancing around
then fixing it.


Alternative:
------------

An alternative solution might to detect and report when too many
watchdog_hardlockup_check() calls are ignored because of
touch_nmi_watchdog().

It might help to find a mis-use of touch_nmi_watchdog(). The question
is what details should be reported in this case.

It should be optional because touch_nmi_watchdog() is supposed
to hide "well-known" sinners after all.



> @@ -195,13 +209,8 @@ void watchdog_hardlockup_check(unsigned int cpu, struct pt_regs *regs)
>  
>  	hardlockup_all_cpu_backtrace = (hardlockup_si_mask & SYS_INFO_ALL_BT) ?
>  					1 : sysctl_hardlockup_all_cpu_backtrace;
> -	/*
> -	 * Check for a hardlockup by making sure the CPU's timer
> -	 * interrupt is incrementing. The timer interrupt should have
> -	 * fired multiple times before we overflow'd. If it hasn't
> -	 * then this is a good indication the cpu is stuck
> -	 */
> -	if (is_hardlockup(cpu)) {
> +
> +	if (is_hl) {
>  		unsigned int this_cpu = smp_processor_id();
>  		unsigned long flags;
>  

Best Regards,
Petr
