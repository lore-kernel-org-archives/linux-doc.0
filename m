Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6024A7D062
	for <lwn-linux-doc@archive.lwn.net>; Tue, 26 Jun 2018 13:49:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S935443AbeFZNt6 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 26 Jun 2018 09:49:58 -0400
Received: from iolanthe.rowland.org ([192.131.102.54]:53014 "HELO
        iolanthe.rowland.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with SMTP id S935278AbeFZNt6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 26 Jun 2018 09:49:58 -0400
Received: (qmail 1716 invoked by uid 2102); 26 Jun 2018 09:49:57 -0400
Received: from localhost (sendmail-bs@127.0.0.1)
  by localhost with SMTP; 26 Jun 2018 09:49:57 -0400
Date:   Tue, 26 Jun 2018 09:49:57 -0400 (EDT)
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
In-Reply-To: <20180626101127.GB8295@andrea>
Message-ID: <Pine.LNX.4.44L0.1806260949130.1589-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 26 Jun 2018, Andrea Parri wrote:

> > > -A write memory barrier is implied by wake_up() and co.  if and only if they
> > > -wake something up.  The barrier occurs before the task state is cleared, and so
> > > -sits between the STORE to indicate the event and the STORE to set TASK_RUNNING:
> > > +A general memory barrier is executed by wake_up() if it wakes something up.
> > > +If it doesn't wake anything up then a memory barrier may or may not be
> > > +executed; you must not rely on it.  The barrier occurs before the task state
> > > +is accessed, in part., it sits between the STORE to indicate the event and
> > > +the STORE to set TASK_RUNNING:
> > 
> > Minor suggestion: Instead of "in part.", how about "that is"?
> > 
> > (I generally find "in part." to be at least a little confusing,
> > probably because "part" is itself a word and "in part" is a 
> > reasonably common phrase in English.)
> 
> Mmh, the fact is that that "before the task state is accessed" does want
> to include the LOAD from ->state to check for the task state (recall the
> pattern in [1])...; how about if I expand "in part." to "in particular"?

That would be acceptable.

Alan

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
