Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id ADA417D082
	for <lwn-linux-doc@archive.lwn.net>; Tue, 16 Oct 2018 20:41:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727053AbeJQEdf (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 17 Oct 2018 00:33:35 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:37448 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726048AbeJQEde (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 17 Oct 2018 00:33:34 -0400
Received: by mail-pg1-f195.google.com with SMTP id c10-v6so11403785pgq.4
        for <linux-doc@vger.kernel.org>; Tue, 16 Oct 2018 13:41:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=cDAz38rqSWZEMZJsggvonncLFKvAtEhJAuUaJpMxy74=;
        b=f8UEHrGyJpVqEfjGd92DNzTWyngG0PsMqmHuTU33P0HMwSw5+8gVwocR0AOynlbcE6
         zuu0q8nGDnBBtCR1fSFUc6Z39L0eVwZBl6oAewbzQljt4lPz1VgwbAv6MzO/AG+Y9oLV
         XlYt38KAKwPscpzb4yVsmKn/S8mo4ExBtbxdo=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=cDAz38rqSWZEMZJsggvonncLFKvAtEhJAuUaJpMxy74=;
        b=cpt0AUInz6uri1/Ram7ggvmyHDNx4Wd0BIbBXvjIyTWruVtPL0/KlRZzqNhhWUx/qJ
         Y4A9XebcBIaGsMB1FoULKxyl9hWULG2MZlLsiiUx3PrxqZ+LlsOMEaU85B+HP9zdMcOg
         TglOZ6i5yFGzycWGntjfthNmVzcryBYMYSn2CIOzE3L+NPGYP6/hl/rkb83Cifoy94jB
         wKOVpItW01dgs71E+1WGy94TN1mWusEh28rgnDfRuky+OtjX3ihatkGnXBZaNzxdFueB
         QXx5cmg09eqEsVIbFUd4d2xd/lQQpG1f9DaQxMl4nxv+qRq1zdzupl1EpDwccV9xRX+v
         +LvQ==
X-Gm-Message-State: ABuFfoh0sOHlV247Sys0eTd7HHGrkwv+mFqBGd9GaGOvj7m3u4c63H4t
        CmOLKJUCq7I9h5fNb1BXXaPD2A==
X-Google-Smtp-Source: ACcGV63G6A+Fj5JTMfhGalA1hvGtsBXUH4m+Qfp3J4VLM8FOVU/vplApu7Es6qbGCuy4EanIZM/KBw==
X-Received: by 2002:a63:d917:: with SMTP id r23-v6mr22018718pgg.0.1539722484850;
        Tue, 16 Oct 2018 13:41:24 -0700 (PDT)
Received: from localhost ([2620:0:1000:1601:3aef:314f:b9ea:889f])
        by smtp.gmail.com with ESMTPSA id c21-v6sm29034309pfe.93.2018.10.16.13.41.23
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Tue, 16 Oct 2018 13:41:23 -0700 (PDT)
Date:   Tue, 16 Oct 2018 13:41:22 -0700
From:   Joel Fernandes <joel@joelfernandes.org>
To:     "Paul E. McKenney" <paulmck@linux.ibm.com>
Cc:     Nikolay Borisov <nborisov@suse.com>, linux-kernel@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>,
        Josh Triplett <josh@joshtriplett.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        linux-doc@vger.kernel.org,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [PATCH RFC] doc: rcu: remove obsolete (non-)requirement about
 disabling preemption
Message-ID: <20181016204122.GA8176@joelaf.mtv.corp.google.com>
References: <20181015021349.GB217384@joelaf.mtv.corp.google.com>
 <20181015023328.GP2674@linux.ibm.com>
 <20181015024758.GA227989@joelaf.mtv.corp.google.com>
 <5151da01-343b-bb37-353e-b6652ae530f5@suse.com>
 <20181015112112.GT2674@linux.ibm.com>
 <20181015193951.GA33528@joelaf.mtv.corp.google.com>
 <20181015195426.GD2674@linux.ibm.com>
 <20181015201556.GA43575@joelaf.mtv.corp.google.com>
 <20181015210856.GE2674@linux.ibm.com>
 <20181016112611.GA27405@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181016112611.GA27405@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Oct 16, 2018 at 04:26:11AM -0700, Paul E. McKenney wrote:
> On Mon, Oct 15, 2018 at 02:08:56PM -0700, Paul E. McKenney wrote:
> > On Mon, Oct 15, 2018 at 01:15:56PM -0700, Joel Fernandes wrote:
> > > On Mon, Oct 15, 2018 at 12:54:26PM -0700, Paul E. McKenney wrote:
> > > [...]
> > > > > > In any case, please don't spin for milliseconds with preemption disabled.
> > > > > > The real-time guys are unlikely to be happy with you if you do this!
> > > > > 
> > > > > Well just to clarify, I was just running Oleg's test which did this. This
> > > > > test was mentioned in the original documentation that I deleted. Ofcourse I
> > > > > would not dare do such a thing in production code :-D. I guess to Oleg's
> > > > > defense, he did it to very that synchronize_rcu() was not blocked on
> > > > > preempt-disable sections which was a different test.
> > > > 
> > > > Understood!  Just pointing out that RCU's tolerating a given action does
> > > > not necessarily mean that it is a good idea to take that action.  ;-)
> > > 
> > > Makes sense :-) thanks.
> > 
> > Don't worry, that won't happen again.  ;-)
> > 
> > > > > > > > +		pr_crit("SPIN done!\n");
> > > > > > > > +		preempt_enable();
> > > > > > > > +		break;
> > > > > > > > +	case 777:
> > > > > > > > +		pr_crit("SYNC start\n");
> > > > > > > > +		synchronize_rcu();
> > > > > > > > +		pr_crit("SYNC done!\n");
> > > > > > > 
> > > > > > > But you are using the console printing infrastructure which is rather
> > > > > > > heavyweight. Try replacing pr_* calls with trace_printk so that you
> > > > > > > write to the lock-free ring buffer, this will reduce the noise from the
> > > > > > > heavy console printing infrastructure.
> > > > > > 
> > > > > > And this might be a problem as well.
> > > > > 
> > > > > This was not the issue (or atleast not fully the issue) since I saw the same
> > > > > thing with trace_printk. It was exactly what you said - which is the
> > > > > excessively long preempt disabled times.
> > > > 
> > > > One approach would be to apply this patch against (say) v4.18, which
> > > > does not have consolidated grace periods.  You might then be able to
> > > > tell if the pr_crit() calls make any difference.
> > > 
> > > I could do that, yeah. But since the original problem went away due to
> > > disabling preempts for a short while, I will move on and continue to focus on
> > > updating other parts of the documenation. Just to mention I
> > > brought this up because I thought its better to do that than not to, just
> > > incase there is any lurking issue with the consolidation. Sorry if that ended
> > > up with me being noisy.
> > 
> > Not a problem, no need to apologize!
> 
> Besides, digging through the code did point out a reasonable optimization.
> In the common case, this would buy 100s of microseconds rather than
> milliseconds, but it seems simple enough to be worthwhile.  Thoughts?

Cool, thanks. One comment below:

> ------------------------------------------------------------------------
> 
> commit 07921e8720907f58f82b142f2027fc56d5abdbfd
> Author: Paul E. McKenney <paulmck@linux.ibm.com>
> Date:   Tue Oct 16 04:12:58 2018 -0700
> 
>     rcu: Speed up expedited GPs when interrupting RCU reader
>     
>     In PREEMPT kernels, an expedited grace period might send an IPI to a
>     CPU that is executing an RCU read-side critical section.  In that case,
>     it would be nice if the rcu_read_unlock() directly interacted with the
>     RCU core code to immediately report the quiescent state.  And this does
>     happen in the case where the reader has been preempted.  But it would
>     also be a nice performance optimization if immediate reporting also
>     happened in the preemption-free case.
>     
>     This commit therefore adds an ->exp_hint field to the task_struct structure's
>     ->rcu_read_unlock_special field.  The IPI handler sets this hint when
>     it has interrupted an RCU read-side critical section, and this causes
>     the outermost rcu_read_unlock() call to invoke rcu_read_unlock_special(),
>     which, if preemption is enabled, reports the quiescent state immediately.
>     If preemption is disabled, then the report is required to be deferred
>     until preemption (or bottom halves or interrupts or whatever) is re-enabled.
>     
>     Because this is a hint, it does nothing for more complicated cases.  For
>     example, if the IPI interrupts an RCU reader, but interrupts are disabled
>     across the rcu_read_unlock(), but another rcu_read_lock() is executed
>     before interrupts are re-enabled, the hint will already have been cleared.
>     If you do crazy things like this, reporting will be deferred until some
>     later RCU_SOFTIRQ handler, context switch, cond_resched(), or similar.
>     
>     Reported-by: Joel Fernandes <joel@joelfernandes.org>
>     Signed-off-by: Paul E. McKenney <paulmck@linux.ibm.com>
> 
> diff --git a/include/linux/sched.h b/include/linux/sched.h
> index 004ca21f7e80..64ce751b5fe9 100644
> --- a/include/linux/sched.h
> +++ b/include/linux/sched.h
> @@ -571,8 +571,10 @@ union rcu_special {
>  	struct {
>  		u8			blocked;
>  		u8			need_qs;
> +		u8			exp_hint; /* Hint for performance. */
> +		u8			pad; /* No garbage from compiler! */
>  	} b; /* Bits. */
> -	u16 s; /* Set of bits. */
> +	u32 s; /* Set of bits. */
>  };
>  
>  enum perf_event_task_context {
> diff --git a/kernel/rcu/tree_exp.h b/kernel/rcu/tree_exp.h
> index e669ccf3751b..928fe5893a57 100644
> --- a/kernel/rcu/tree_exp.h
> +++ b/kernel/rcu/tree_exp.h
> @@ -692,8 +692,10 @@ static void sync_rcu_exp_handler(void *unused)
>  	 */
>  	if (t->rcu_read_lock_nesting > 0) {
>  		raw_spin_lock_irqsave_rcu_node(rnp, flags);
> -		if (rnp->expmask & rdp->grpmask)
> +		if (rnp->expmask & rdp->grpmask) {
>  			rdp->deferred_qs = true;
> +			WRITE_ONCE(t->rcu_read_unlock_special.b.exp_hint, true);
> +		}
>  		raw_spin_unlock_irqrestore_rcu_node(rnp, flags);
>  	}
>  
> diff --git a/kernel/rcu/tree_plugin.h b/kernel/rcu/tree_plugin.h
> index 8b48bb7c224c..d6286eb6e77e 100644
> --- a/kernel/rcu/tree_plugin.h
> +++ b/kernel/rcu/tree_plugin.h
> @@ -643,8 +643,9 @@ static void rcu_read_unlock_special(struct task_struct *t)
>  	local_irq_save(flags);
>  	irqs_were_disabled = irqs_disabled_flags(flags);
>  	if ((preempt_bh_were_disabled || irqs_were_disabled) &&
> -	    t->rcu_read_unlock_special.b.blocked) {
> +	    t->rcu_read_unlock_special.s) {
>  		/* Need to defer quiescent state until everything is enabled. */
> +		WRITE_ONCE(t->rcu_read_unlock_special.b.exp_hint, false);
>  		raise_softirq_irqoff(RCU_SOFTIRQ);

Still going through this patch, but it seems to me like the fact that
rcu_read_unlock_special is called means someone has requested for a grace
period. Then in that case, does it not make sense to raise the softirq
for processing anyway?

thanks,

- Joel

