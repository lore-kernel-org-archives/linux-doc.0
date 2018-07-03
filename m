Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 68D957DE6E
	for <lwn-linux-doc@archive.lwn.net>; Tue,  3 Jul 2018 08:49:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932263AbeGCItk (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 3 Jul 2018 04:49:40 -0400
Received: from mail-wm0-f68.google.com ([74.125.82.68]:50690 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933223AbeGCIth (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 3 Jul 2018 04:49:37 -0400
Received: by mail-wm0-f68.google.com with SMTP id v25-v6so1420156wmc.0
        for <linux-doc@vger.kernel.org>; Tue, 03 Jul 2018 01:49:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=rLJYWlZ5v4zMqbTtnYjx/oxAiTiQ9m+4N8+QtCaHfC8=;
        b=BaxFcCjOPzuDdRmfEtbH5z7cu+Ose35A/ZAjr0Ghi1Ymqp3vjWvgRDpS0kYOAbBP1Y
         DQot4St4K9KjWXUlDMfyP8ImdtN0w0fcyx/v5Hef5NLrsglyPCv30ogdZuGrjrMhE+JI
         PIen/iw+gxsR+FxCwl8mI24JubqdVlJzCdBSQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=rLJYWlZ5v4zMqbTtnYjx/oxAiTiQ9m+4N8+QtCaHfC8=;
        b=FMLTyjBa6mdFnB7AeN9Xha7YNL10gkruxxxAEfIEmkhGcR5a9og74O0Mv9F/yrIGGS
         0i3ni4xRoNytbDX1+TFIDAPPw1NaisetwI80LiaJS5Zei9l+n6/32qqdLyOA90mDc+BS
         /nwjtRK69SiDZNzVadm0lE4DCuuYR5E2nxXBhvrWniUDw4BGBRPrucTVO8jebQxhA8wU
         l+ZpFzhtVnHDWl9ANlNFbDn33+g3LOaBvv14D6mAPXxUA4ls0BCYSesXhVCRRkkmrZsX
         pBddvf5uPY8kYu6WYfNQgX+tq0vmcfgFK6gR+ZcWjtXC5pCMAoky/OMLv6EmsvHrrKL5
         k3+Q==
X-Gm-Message-State: APt69E3B38pFId36qERP6UZD+noW8c7G7phB3nQfg+u8hPmMytOB3g4+
        zkJvJe3zI05lsT9bDE1n9/0/hg==
X-Google-Smtp-Source: AAOMgpcaXYUeTShYywn2Sowz/57d4T2yJMkIS4Gb0Okbk+YGUBZOTt9QjS2mvrVttsqYlFttge5TIQ==
X-Received: by 2002:a1c:b004:: with SMTP id z4-v6mr10682872wme.70.1530607775760;
        Tue, 03 Jul 2018 01:49:35 -0700 (PDT)
Received: from andrea (85.100.broadband17.iol.cz. [109.80.100.85])
        by smtp.gmail.com with ESMTPSA id 72-v6sm1036123wmo.26.2018.07.03.01.49.34
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 03 Jul 2018 01:49:34 -0700 (PDT)
Date:   Tue, 3 Jul 2018 10:49:21 +0200
From:   Andrea Parri <andrea.parri@amarulasolutions.com>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Ingo Molnar <mingo@redhat.com>,
        Will Deacon <will.deacon@arm.com>,
        Alan Stern <stern@rowland.harvard.edu>,
        Boqun Feng <boqun.feng@gmail.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        David Howells <dhowells@redhat.com>,
        Jade Alglave <j.alglave@ucl.ac.uk>,
        Luc Maranget <luc.maranget@inria.fr>,
        "Paul E . McKenney" <paulmck@linux.vnet.ibm.com>,
        Akira Yokosawa <akiyks@gmail.com>,
        Daniel Lustig <dlustig@nvidia.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Randy Dunlap <rdunlap@infradead.org>,
        Matthew Wilcox <willy@infradead.org>
Subject: Re: [PATCH v2 2/3] locking: Clarify requirements for
 smp_mb__after_spinlock()
Message-ID: <20180703084921.GA28324@andrea>
References: <1530182480-13205-3-git-send-email-andrea.parri@amarulasolutions.com>
 <1530544315-14614-1-git-send-email-andrea.parri@amarulasolutions.com>
 <20180702153735.GQ2494@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180702153735.GQ2494@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jul 02, 2018 at 05:37:35PM +0200, Peter Zijlstra wrote:
> On Mon, Jul 02, 2018 at 05:11:55PM +0200, Andrea Parri wrote:
> >  /*
> > + * smp_mb__after_spinlock() provides the equivalent of a full memory barrier
> > + * between program-order earlier lock acquisitions and program-order later
> > + * memory accesses.
> >   *
> > + * This guarantees that the following two properties hold:
> >   *
> > + *   1) Given the snippet:
> >   *
> > + *	  { X = 0;  Y = 0; }
> >   *
> > + *	  CPU0				CPU1
> >   *
> > + *	  WRITE_ONCE(X, 1);		WRITE_ONCE(Y, 1);
> > + *	  spin_lock(S);			smp_mb();
> > + *	  smp_mb__after_spinlock();	r1 = READ_ONCE(X);
> > + *	  r0 = READ_ONCE(Y);
> > + *	  spin_unlock(S);
> >   *
> > + *      it is forbidden that CPU0 does not observe CPU1's store to Y (r0 = 0)
> > + *      and CPU1 does not observe CPU0's store to X (r1 = 0); see the comments
> > + *      preceding the call to smp_mb__after_spinlock() in __schedule() and in
> > + *      try_to_wake_up().
> > + *
> > + *   2) Given the snippet:
> > + *
> > + *  { X = 0;  Y = 0; }
> > + *
> > + *  CPU0		CPU1				CPU2
> > + *
> > + *  spin_lock(S);	spin_lock(S);			r1 = READ_ONCE(Y);
> > + *  WRITE_ONCE(X, 1);	smp_mb__after_spinlock();	smp_rmb();
> > + *  spin_unlock(S);	r0 = READ_ONCE(X);		r2 = READ_ONCE(X);
> > + *			WRITE_ONCE(Y, 1);
> > + *			spin_unlock(S);
> > + *
> > + *      it is forbidden that CPU0's critical section executes before CPU1's
> > + *      critical section (r0 = 1), CPU2 observes CPU1's store to Y (r1 = 1)
> > + *      and CPU2 does not observe CPU0's store to X (r2 = 0); see the comments
> > + *      preceding the calls to smp_rmb() in try_to_wake_up() for similar
> > + *      snippets but "projected" onto two CPUs.
> 
> Maybe explicitly note that 2) is the RCsc lock upgrade.

Yes, I'll do a respin to add this note and the below Ack shortly.

Thanks,
  Andrea


> 
> 
> >   * Since most load-store architectures implement ACQUIRE with an smp_mb() after
> >   * the LL/SC loop, they need no further barriers. Similarly all our TSO
> > diff --git a/kernel/sched/core.c b/kernel/sched/core.c
> > index da8f12119a127..ec9ef0aec71ac 100644
> > +++ b/kernel/sched/core.c
> > @@ -1999,21 +1999,20 @@ try_to_wake_up(struct task_struct *p, unsigned int state, int wake_flags)
> >  	 * be possible to, falsely, observe p->on_rq == 0 and get stuck
> >  	 * in smp_cond_load_acquire() below.
> >  	 *
> > +	 * sched_ttwu_pending()			try_to_wake_up()
> > +	 *   STORE p->on_rq = 1			  LOAD p->state
> > +	 *   UNLOCK rq->lock
> > +	 *
> > +	 * __schedule() (switch to task 'p')
> > +	 *   LOCK rq->lock			  smp_rmb();
> > +	 *   smp_mb__after_spinlock();
> > +	 *   UNLOCK rq->lock
> >  	 *
> >  	 * [task p]
> > +	 *   STORE p->state = UNINTERRUPTIBLE	  LOAD p->on_rq
> >  	 *
> > +	 * Pairs with the LOCK+smp_mb__after_spinlock() on rq->lock in
> > +	 * __schedule().  See the comment for smp_mb__after_spinlock().
> >  	 */
> >  	smp_rmb();
> >  	if (p->on_rq && ttwu_remote(p, wake_flags))
> > @@ -2027,15 +2026,17 @@ try_to_wake_up(struct task_struct *p, unsigned int state, int wake_flags)
> >  	 * One must be running (->on_cpu == 1) in order to remove oneself
> >  	 * from the runqueue.
> >  	 *
> > +	 * __schedule() (switch to task 'p')	try_to_wake_up()
> > +	 *   STORE p->on_cpu = 1		  LOAD p->on_rq
> > +	 *   UNLOCK rq->lock
> > +	 *
> > +	 * __schedule() (put 'p' to sleep)
> > +	 *   LOCK rq->lock			  smp_rmb();
> > +	 *   smp_mb__after_spinlock();
> > +	 *   STORE p->on_rq = 0			  LOAD p->on_cpu
> >  	 *
> > +	 * Pairs with the LOCK+smp_mb__after_spinlock() on rq->lock in
> > +	 * __schedule().  See the comment for smp_mb__after_spinlock().
> >  	 */
> >  	smp_rmb();
> 
> Ah yes, good.
> 
> Ack!
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
