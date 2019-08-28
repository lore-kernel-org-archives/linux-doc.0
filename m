Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=unavailable
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4B6C07D2F0
	for <lwn-linux-doc@archive.lwn.net>; Wed, 28 Aug 2019 21:57:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726961AbfH1V5A (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 28 Aug 2019 17:57:00 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:38301 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726658AbfH1V5A (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 28 Aug 2019 17:57:00 -0400
Received: by mail-pg1-f195.google.com with SMTP id e11so424648pga.5
        for <linux-doc@vger.kernel.org>; Wed, 28 Aug 2019 14:56:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Nd+bPWlCXNocXiigb90jYgWHpu3MGjlLHt1H4GIPKsk=;
        b=n+Iz3RNKIv2G78ZVZ1TXSEKF9j9dLXkEdNpnMNVoicyXdstnIuPLFqkCjqyGSH9iJY
         o8gawdyeaRKIA7HYM9GwBrmZEUjqEqoQzGDPL6Qjj+hPvALZQLVeqdqiODiTzfmDwDgB
         jXgqJyq703XAb4M2dMxq/L+kBPkok4Gcf/Gco=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Nd+bPWlCXNocXiigb90jYgWHpu3MGjlLHt1H4GIPKsk=;
        b=U2ak62HT1krLyESL0feLjrBMha8SuyoQqqsGToseSeLJle3l3yoCUGK6Z9PE5ra5QA
         UOaLSZC5rkdCWtfAJd4nvybuHpYGwFK4XeONCvEQw+mE5kBLgJhw86xTd1p0fNhq7iTY
         ei2onm6xwB49jGiGJDgOXLxMu9HIZaVDr4+Gwyi7xMiWZX9+HyDFA69lTne4lr9+Yfg9
         f3TEhDERUVrL9lTjbmTqxxPTOiYhocFJb2adjXO3TG0lsqN4UPeK8Xg1CjdZTrUDCjZh
         r/V0uNpsyGVYuDhyO+bCz5iqcmk+sSubSQiGqfx90kU0X4/Zv5BQjpge2cpn7tiV3ik/
         MT4Q==
X-Gm-Message-State: APjAAAXIPUD0YXxZ0NL2hXxKGPisg1rxG35k4rZg1idSXOoSAQz4v1AE
        8pvSiyOwQI/qYoON1a0d69Cwfw==
X-Google-Smtp-Source: APXvYqxBWzjFcxT5J+UW/brCQQfj77xr5PR8jRpUK60AFtolo6N4nAisXuYYuZDv08g7jCpB0ygItg==
X-Received: by 2002:a17:90a:bb91:: with SMTP id v17mr6143826pjr.84.1567029418977;
        Wed, 28 Aug 2019 14:56:58 -0700 (PDT)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
        by smtp.gmail.com with ESMTPSA id p20sm144125pgj.47.2019.08.28.14.56.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 28 Aug 2019 14:56:58 -0700 (PDT)
Date:   Wed, 28 Aug 2019 17:56:57 -0400
From:   Joel Fernandes <joel@joelfernandes.org>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     linux-kernel@vger.kernel.org,
        Frederic Weisbecker <fweisbec@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Josh Triplett <josh@joshtriplett.org>, kernel-team@android.com,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        linux-doc@vger.kernel.org,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        rcu@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [RFC v1 1/2] rcu/tree: Clean up dynticks counter usage
Message-ID: <20190828215657.GA71365@google.com>
References: <5d648895.1c69fb81.5e60a.fc6f@mx.google.com>
 <20190828201344.GR26530@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190828201344.GR26530@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Aug 28, 2019 at 01:13:44PM -0700, Paul E. McKenney wrote:
> On Mon, Aug 26, 2019 at 09:33:53PM -0400, Joel Fernandes (Google) wrote:
> > The dynticks counter are confusing due to crowbar writes of
> > DYNTICK_IRQ_NONIDLE whose purpose is to detect half-interrupts (i.e. we
> > see rcu_irq_enter() but not rcu_irq_exit() due to a usermode upcall) and
> > if so then do a reset of the dyntick_nmi_nesting counters. This patch
> > tries to get rid of DYNTICK_IRQ_NONIDLE while still keeping the code
> > working, fully functional, and less confusing. The confusion recently
> > has even led to patches forgetting that DYNTICK_IRQ_NONIDLE was written
> > to which wasted lots of time.
> > 
> > The patch has the following changes:
[snip]
> >  /*
> >   * Grace-period counter management.
> >   */
> > diff --git a/kernel/rcu/tree.c b/kernel/rcu/tree.c
> > index 68ebf0eb64c8..255cd6835526 100644
> > --- a/kernel/rcu/tree.c
> > +++ b/kernel/rcu/tree.c
> > @@ -81,7 +81,7 @@
> >  
> >  static DEFINE_PER_CPU_SHARED_ALIGNED(struct rcu_data, rcu_data) = {
> >  	.dynticks_nesting = 1,
> > -	.dynticks_nmi_nesting = DYNTICK_IRQ_NONIDLE,
> > +	.dynticks_nmi_nesting = 0,
> 
> C initializes to zero by default, so this can simply be deleted.

Fixed.

> >  	.dynticks = ATOMIC_INIT(RCU_DYNTICK_CTRL_CTR),
> >  };
> >  struct rcu_state rcu_state = {
> > @@ -558,17 +558,18 @@ EXPORT_SYMBOL_GPL(rcutorture_get_gp_data);
> >  /*
> >   * Enter an RCU extended quiescent state, which can be either the
> >   * idle loop or adaptive-tickless usermode execution.
> > - *
> > - * We crowbar the ->dynticks_nmi_nesting field to zero to allow for
> > - * the possibility of usermode upcalls having messed up our count
> > - * of interrupt nesting level during the prior busy period.
> >   */
> >  static void rcu_eqs_enter(bool user)
> >  {
> >  	struct rcu_data *rdp = this_cpu_ptr(&rcu_data);
> >  
> > -	WARN_ON_ONCE(rdp->dynticks_nmi_nesting != DYNTICK_IRQ_NONIDLE);
> > -	WRITE_ONCE(rdp->dynticks_nmi_nesting, 0);
> > +	/* Entering usermode/idle from interrupt is not handled. These would
> > +	 * mean usermode upcalls or idle entry happened from interrupts. But,
> > +	 * reset the counter if we warn.
> > +	 */
> 
> Please either put the "/*" on its own line or use "//"-style comments.

I'll put "/*" on its own line.

> >  	WARN_ON_ONCE(rdp->dynticks_nmi_nesting <= 0);
> >  	WARN_ON_ONCE(rcu_dynticks_curr_cpu_in_eqs());
> >  
> > +	WRITE_ONCE(rdp->dynticks_nmi_nesting, /* No store tearing. */
> > +		   rdp->dynticks_nmi_nesting - 1);
> 
> This is problematic.  The +/-1 and +/-2 dance is specifically for NMIs, so...

This counter is deleted in the following patch so I hope its Ok to leave it
here for this one. I just kept it split into different patch to make
testing/review/development easier.

> >  	if (irq)
> >  		rcu_prepare_for_idle();
> > @@ -723,10 +728,6 @@ void rcu_irq_exit_irqson(void)
> >  /*
> >   * Exit an RCU extended quiescent state, which can be either the
> >   * idle loop or adaptive-tickless usermode execution.
> > - *
> > - * We crowbar the ->dynticks_nmi_nesting field to DYNTICK_IRQ_NONIDLE to
> > - * allow for the possibility of usermode upcalls messing up our count of
> > - * interrupt nesting level during the busy period that is just now starting.
> >   */
> >  static void rcu_eqs_exit(bool user)
> >  {
> > @@ -747,8 +748,13 @@ static void rcu_eqs_exit(bool user)
> >  	trace_rcu_dyntick(TPS("End"), rdp->dynticks_nesting, 1, rdp->dynticks);
> >  	WARN_ON_ONCE(IS_ENABLED(CONFIG_RCU_EQS_DEBUG) && !user && !is_idle_task(current));
> >  	WRITE_ONCE(rdp->dynticks_nesting, 1);
> > -	WARN_ON_ONCE(rdp->dynticks_nmi_nesting);
> > -	WRITE_ONCE(rdp->dynticks_nmi_nesting, DYNTICK_IRQ_NONIDLE);
> > +
> > +	/* Exiting usermode/idle from interrupt is not handled. These would
> > +	 * mean usermode upcalls or idle exit happened from interrupts. But,
> > +	 * reset the counter if we warn.
> > +	 */
> > +	if (WARN_ON_ONCE(rdp->dynticks_nmi_nesting != 0))
> > +		WRITE_ONCE(rdp->dynticks_nmi_nesting, 0);
> 
> And here.  Plus this is adding a test and branch in the common case.
> Given that the location being written to should be hot in the cache,
> it is not clear that this is a win.

The next patch removes the branch itself and just has the warning.

> >  	WARN_ON_ONCE(rdp->dynticks_nmi_nesting < 0);
> >  
> >  	/*
> > @@ -826,16 +833,21 @@ static __always_inline void rcu_nmi_enter_common(bool irq)
> >  
> >  		incby = 1;
> >  	} else if (tick_nohz_full_cpu(rdp->cpu) &&
> > -		   rdp->dynticks_nmi_nesting == DYNTICK_IRQ_NONIDLE &&
> > -		   rdp->rcu_urgent_qs && !rdp->rcu_forced_tick) {
> > +		   !rdp->dynticks_nmi_nesting && rdp->rcu_urgent_qs &&
> > +		   !rdp->rcu_forced_tick) {
> 
> OK.  Though you should be able to save a line by pulling the
> "rdp->rcu_urgent_qs &&" onto the first line.

Fixed.

> >  		rdp->rcu_forced_tick = true;
> >  		tick_dep_set_cpu(rdp->cpu, TICK_DEP_BIT_RCU);
> >  	}
> > +
> 
> Not clear that the added blank line is a win, here or below.

Fixed,

thanks!

 - Joel

[snip]
