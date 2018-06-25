Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 053A07DF86
	for <lwn-linux-doc@archive.lwn.net>; Mon, 25 Jun 2018 16:56:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S933432AbeFYQ4Q (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 25 Jun 2018 12:56:16 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:37338 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S933424AbeFYQ4P (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 25 Jun 2018 12:56:15 -0400
Received: (qmail 5020 invoked by uid 2102); 25 Jun 2018 12:56:14 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 25 Jun 2018 12:56:14 -0400
Date:   Mon, 25 Jun 2018 12:56:14 -0400 (EDT)
From:   Alan Stern <stern@rowland.harvard.edu>
X-X-Sender: stern@iolanthe.rowland.org
To:     Andrea Parri <andrea.parri@amarulasolutions.com>
cc:     linux-kernel@vger.kernel.org, <linux-doc@vger.kernel.org>,
        Will Deacon <will.deacon@arm.com>,
        Peter Zijlstra <peterz@infradead.org>,
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
In-Reply-To: <1529918258-7295-1-git-send-email-andrea.parri@amarulasolutions.com>
Message-ID: <Pine.LNX.4.44L0.1806251253380.1779-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, 25 Jun 2018, Andrea Parri wrote:

> Both the implementation and the users' expectation [1] for the various
> wakeup primitives have evolved over time, but the documentation has not
> kept up with these changes: brings it into 2018.
> 
> [1] http://lkml.kernel.org/r/20180424091510.GB4064@hirez.programming.kicks-ass.net
> 
> Suggested-by: Peter Zijlstra <peterz@infradead.org>
> Signed-off-by: Andrea Parri <andrea.parri@amarulasolutions.com>
> [ aparri: Apply feedback from Alan Stern. ]
> Cc: Alan Stern <stern@rowland.harvard.edu>
> Cc: Will Deacon <will.deacon@arm.com>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Cc: Boqun Feng <boqun.feng@gmail.com>
> Cc: Nicholas Piggin <npiggin@gmail.com>
> Cc: David Howells <dhowells@redhat.com>
> Cc: Jade Alglave <j.alglave@ucl.ac.uk>
> Cc: Luc Maranget <luc.maranget@inria.fr>
> Cc: "Paul E. McKenney" <paulmck@linux.vnet.ibm.com>
> Cc: Akira Yokosawa <akiyks@gmail.com>
> Cc: Daniel Lustig <dlustig@nvidia.com>
> Cc: Jonathan Corbet <corbet@lwn.net>
> Cc: Ingo Molnar <mingo@redhat.com>
> Cc: Randy Dunlap <rdunlap@infradead.org>
> ---
>  Documentation/memory-barriers.txt | 43 ++++++++++++++++++++++++---------------
>  kernel/sched/completion.c         |  8 ++++----
>  kernel/sched/core.c               | 11 +++++-----
>  kernel/sched/wait.c               | 24 ++++++++++------------
>  4 files changed, 47 insertions(+), 39 deletions(-)
> 
> diff --git a/Documentation/memory-barriers.txt b/Documentation/memory-barriers.txt
> index a02d6bbfc9d0a..bf58fa1671b62 100644
> --- a/Documentation/memory-barriers.txt
> +++ b/Documentation/memory-barriers.txt
> @@ -2179,32 +2179,41 @@ or:
>  	event_indicated = 1;
>  	wake_up_process(event_daemon);
>  
> -A write memory barrier is implied by wake_up() and co.  if and only if they
> -wake something up.  The barrier occurs before the task state is cleared, and so
> -sits between the STORE to indicate the event and the STORE to set TASK_RUNNING:
> +A general memory barrier is executed by wake_up() if it wakes something up.
> +If it doesn't wake anything up then a memory barrier may or may not be
> +executed; you must not rely on it.  The barrier occurs before the task state
> +is accessed, in part., it sits between the STORE to indicate the event and
> +the STORE to set TASK_RUNNING:

Minor suggestion: Instead of "in part.", how about "that is"?

(I generally find "in part." to be at least a little confusing,
probably because "part" is itself a word and "in part" is a 
reasonably common phrase in English.)

>  
> -	CPU 1				CPU 2
> +	CPU 1 (Sleeper)			CPU 2 (Waker)
>  	===============================	===============================
>  	set_current_state();		STORE event_indicated
>  	  smp_store_mb();		wake_up();
> -	    STORE current->state	  <write barrier>
> -	    <general barrier>		  STORE current->state
> -	LOAD event_indicated
> +	    STORE current->state	  ...
> +	    <general barrier>		  <general barrier>
> +	LOAD event_indicated		  if ((LOAD task->state) & TASK_NORMAL)
> +					    STORE task->state
>  
> -To repeat, this write memory barrier is present if and only if something
> -is actually awakened.  To see this, consider the following sequence of
> -events, where X and Y are both initially zero:
> +where "task" is the thread being woken up and it equals CPU 1's current.

Since "task" is in quotation marks, "current" should also be in
quotation marks.

Alan

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
