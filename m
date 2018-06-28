Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A92E87D043
	for <lwn-linux-doc@archive.lwn.net>; Thu, 28 Jun 2018 13:50:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S965772AbeF1NuA (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 28 Jun 2018 09:50:00 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:32802 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S965482AbeF1Nt7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 28 Jun 2018 09:49:59 -0400
Received: (qmail 2108 invoked by uid 2102); 28 Jun 2018 09:49:58 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 28 Jun 2018 09:49:58 -0400
Date:   Thu, 28 Jun 2018 09:49:58 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Andrea Parri <andrea.parri@amarulasolutions.com>
cc:     linux-kernel@vger.kernel.org, <linux-doc@vger.kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>,
        Will Deacon <will.deacon@arm.com>,
        Boqun Feng <boqun.feng@gmail.com>,
        Nicholas Piggin <npiggin@gmail.com>,
        David Howells <dhowells@redhat.com>,
        Jade Alglave <j.alglave@ucl.ac.uk>,
        Luc Maranget <luc.maranget@inria.fr>,
        "Paul E . McKenney" <paulmck@linux.vnet.ibm.com>,
        Akira Yokosawa <akiyks@gmail.com>,
        Daniel Lustig <dlustig@nvidia.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH 2/3] locking: Clarify requirements for smp_mb__after_spinlock()
In-Reply-To: <1530182480-13205-3-git-send-email-andrea.parri@amarulasolutions.com>
Message-ID: <Pine.LNX.4.44L0.1806280947080.1812-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, 28 Jun 2018, Andrea Parri wrote:

> --- a/include/linux/spinlock.h
> +++ b/include/linux/spinlock.h
> @@ -114,29 +114,8 @@ do {								\
>  #endif /*arch_spin_is_contended*/
>  
>  /*
> - * This barrier must provide two things:
> - *
> - *   - it must guarantee a STORE before the spin_lock() is ordered against a
> - *     LOAD after it, see the comments at its two usage sites.
> - *
> - *   - it must ensure the critical section is RCsc.
> - *
> - * The latter is important for cases where we observe values written by other
> - * CPUs in spin-loops, without barriers, while being subject to scheduling.
> - *
> - * CPU0			CPU1			CPU2
> - *
> - *			for (;;) {
> - *			  if (READ_ONCE(X))
> - *			    break;
> - *			}
> - * X=1
> - *			<sched-out>
> - *						<sched-in>
> - *						r = X;
> - *
> - * without transitivity it could be that CPU1 observes X!=0 breaks the loop,
> - * we get migrated and CPU2 sees X==0.
> + * smp_mb__after_spinlock() provides a full memory barrier between po-earlier
> + * lock acquisitions and po-later memory accesses.

How about saying "provides the equivalent of a full memory barrier"?

The point being that smp_mb__after_spinlock doesn't have to provide an
actual barrier; it just has to ensure the behavior is the same as if a
full barrier were present.

Alan

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
