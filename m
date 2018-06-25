Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E86867D043
	for <lwn-linux-doc@archive.lwn.net>; Mon, 25 Jun 2018 14:56:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S934465AbeFYO4V (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 25 Jun 2018 10:56:21 -0400
Received: from mail-wm0-f67.google.com ([74.125.82.67]:36070 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934437AbeFYO4U (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 25 Jun 2018 10:56:20 -0400
Received: by mail-wm0-f67.google.com with SMTP id u18-v6so5892862wmc.1
        for <linux-doc@vger.kernel.org>; Mon, 25 Jun 2018 07:56:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=QRF3hsFyk03+7AIE+Pgk7LC9U43tJCS3EBr6KTpXqV8=;
        b=jKT3RTlV/gDejpWLJhttbqSXdSNo7TO16OM2lNOMBfhNdFmUMsdeEHwTXXRx+WM71d
         HtHZRE0/9P11HjcJRab3aUExx4LmJ2/ZexmRMEp6QpLmCnnMIRD4gwMkipt1q1Vk0wvD
         P81dc9M13Fv5o6YfkNqL5yUTnpg41xo0Snkf8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=QRF3hsFyk03+7AIE+Pgk7LC9U43tJCS3EBr6KTpXqV8=;
        b=riSVDT8msA6jzebDieVOEWpE7xxbfbWaxn+5xtpgc124ByXQY/23SvrDUnTlvHn6ja
         QvbxE+hZZEuMcqO0m11ahTe4xf0JVvh6ZDkDQHZfI2UA2jbZSfqi01sXbHteX69+5c16
         cuv2f5fhOrl1bT2W3Gb6g424YSVqJNj/ikVc/aigKK0RLQh5HR8iunQd4PM/NwjvJ2HL
         xYwpkREEiVVQ69Z8aFAw8TTZ4O3wTY43EfZ7E2nrdV5aD7OsRf0ml54QJFUra3bLmuER
         Ge+5R2OdjPRoBDqqtdhNfwyljaa1Eo9YsWzVc76sMvCuvocm1/MOYuSFxp1i0jnl2p1B
         SJVA==
X-Gm-Message-State: APt69E25j0zfaAaeXzLlfISfckCfwiePrOj72dJH5pIC2GE4xPGKS4Pq
        atlNNFgG3e82OAcvRwkiL4dP1A==
X-Google-Smtp-Source: ADUXVKKWGnQFG9U2mXXct11uPV1B2sKQ4bmSGqVKS8bvJLMTYwxBW5U5ytYEZzIvXAgDBRT65UqrdQ==
X-Received: by 2002:a1c:6c09:: with SMTP id h9-v6mr1362282wmc.138.1529938578700;
        Mon, 25 Jun 2018 07:56:18 -0700 (PDT)
Received: from andrea (85.100.broadband17.iol.cz. [109.80.100.85])
        by smtp.gmail.com with ESMTPSA id v15-v6sm14455130wrq.37.2018.06.25.07.56.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 25 Jun 2018 07:56:17 -0700 (PDT)
Date:   Mon, 25 Jun 2018 16:56:11 +0200
From:   Andrea Parri <andrea.parri@amarulasolutions.com>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Alan Stern <stern@rowland.harvard.edu>,
        Will Deacon <will.deacon@arm.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        David Howells <dhowells@redhat.com>,
        Jade Alglave <j.alglave@ucl.ac.uk>,
        Luc Maranget <luc.maranget@inria.fr>,
        "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>,
        Akira Yokosawa <akiyks@gmail.com>,
        Daniel Lustig <dlustig@nvidia.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Ingo Molnar <mingo@redhat.com>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH] doc: Update wake_up() & co. memory-barrier guarantees
Message-ID: <20180625145611.GA16333@andrea>
References: <1529918258-7295-1-git-send-email-andrea.parri@amarulasolutions.com>
 <20180625095031.GX2494@hirez.programming.kicks-ass.net>
 <20180625105618.GA12676@andrea>
 <20180625123121.GY2494@hirez.programming.kicks-ass.net>
 <20180625131643.GA15126@andrea>
 <20180625141830.GC2494@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180625141830.GC2494@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jun 25, 2018 at 04:18:30PM +0200, Peter Zijlstra wrote:
> On Mon, Jun 25, 2018 at 03:16:43PM +0200, Andrea Parri wrote:
> > > > A concrete example being the store-buffering pattern reported in [1].
> > > 
> > > Well, that example only needs a store->load barrier. It so happens
> > > smp_mb() is the only one actually doing that, but imagine we had a
> > > weaker barrier that did just that, one that did not imply the full
> > > transitivity smp_mb() does.
> > > 
> > > Then the example from [1] could use that weaker thing.
> > 
> > Absolutely (and that would be "fence w,r" on RISC-V, IIUC).
> 
> Ah cute. What is the transitivity model of those "fence" instructions? I
> see their smp_mb() is "fence rw,rw" and smp_mb() must be RSsc. Otoh
> their smp_wmb() is "fence w,w" which is only only required to be RCpc.
> 
> So what does RISC-V do for "w,w" and "w,r" like things?

I'd defer to Daniel (in Cc:) for this ;-)  I simply checked the SB pattern
plus w,r fences against the following models:

  http://www.cl.cam.ac.uk/~sf502/regressions/rmem/
  http://moscova.inria.fr/~maranget/cats7/riscv/ 


> 
> > > diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> > > index a98d54cd5535..8374d01b2820 100644
> > > --- a/kernel/sched/core.c
> > > +++ b/kernel/sched/core.c
> > > @@ -1879,7 +1879,9 @@ static void ttwu_queue(struct task_struct *p, int cpu, int wake_flags)
> > >   *  C) LOCK of the rq(c1)->lock scheduling in task
> > >   *
> > >   * Transitivity guarantees that B happens after A and C after B.
> > > - * Note: we only require RCpc transitivity.
> > > + * Note: we only require RCpc transitivity for these cases,
> > > + *       but see smp_mb__after_spinlock() for why rq->lock is required
> > > + *       to be RCsc.
> > >   * Note: the CPU doing B need not be c0 or c1
> > 
> > FWIW, we discussed this pattern here:
> > 
> >   http://lkml.kernel.org/r/20171018010748.GA4017@andrea
> 
> That's not the patter from smp_mb__after_spinlock(), right? But the
> other two from this comment.

Indeed.


> 
> > > @@ -1966,6 +1969,10 @@ static void ttwu_queue(struct task_struct *p, int cpu, int wake_flags)
> > >   * Atomic against schedule() which would dequeue a task, also see
> > >   * set_current_state().
> > >   *
> > > + * Implies at least a RELEASE such that the waking task is guaranteed to
> > > + * observe the stores to the wait-condition; see set_task_state() and the
> > > + * Program-Order constraints.
> > 
> > [s/set_task_task/set_current_state ?]
> 
> Yes, we got rid of set_task_state(), someone forgot to tell my fingers
> :-)
> 
> > I'd stick to "Implies/Executes at least a full barrier"; this is in fact
> > already documented in the function body:
> > 
> > 	/*
> > 	 * If we are going to wake up a thread waiting for CONDITION we
> > 	 * need to ensure that CONDITION=1 done by the caller can not be
> > 	 * reordered with p->state check below. This pairs with mb() in
> > 	 * set_current_state() the waiting thread does.
> > 	 */
> > 
> > (this is, again, that "store->load barrier"/SB).
> > 
> > I'll try to integrate these changes in v2, if there is no objection.
> 
> Thanks!

Ah, before sending v2, I'd really appreciate some comments on the XXXs
I've added to wait_woken() as I'm not sure I understand the pattern in
questions. For example, the second comment says:

  /*
   * The below implies an smp_mb(), it too pairs with the smp_wmb() from
   * woken_wake_function() such that we must either observe the wait
   * condition being true _OR_ WQ_FLAG_WOKEN such that we will not miss
   * an event.
   */

From this I understand:

   wq_entry->flags &= ~WQ_FLAG_WOKEN;      condition = true;
   smp_mb() // B                           smp_wmb(); // C
   [next iteration of the loop]            wq_entry->flags |= WQ_FLAG_WOKEN;
   if (condition)
      break;

   BUG_ON(!condition && !(wq_entry->flags & WQ_FLAG_WOKEN))

IOW, this is an R-like pattern: if this is the case, the smp_wmb() does
_not_ prevent the BUG_ON() from firing; according to LKMM (and powerpc)
a full barrier would be needed.

Same RFC for the first comment:

  /*
   * The above implies an smp_mb(), which matches with the smp_wmb() from
   * woken_wake_function() such that if we observe WQ_FLAG_WOKEN we must
   * also observe all state before the wakeup.
   */

What is the corresponding snippet & BUG_ON()?

  Andrea
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
