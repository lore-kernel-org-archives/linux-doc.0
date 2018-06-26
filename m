Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A193C7D072
	for <lwn-linux-doc@archive.lwn.net>; Tue, 26 Jun 2018 10:11:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S933509AbeFZKLd (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 26 Jun 2018 06:11:33 -0400
Received: from mail-wm0-f46.google.com ([74.125.82.46]:38682 "EHLO
        mail-wm0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933291AbeFZKLc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 26 Jun 2018 06:11:32 -0400
Received: by mail-wm0-f46.google.com with SMTP id 69-v6so1167790wmf.3
        for <linux-doc@vger.kernel.org>; Tue, 26 Jun 2018 03:11:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=9uBAwt5ccH1b2VM5tLOVDm7/pd6zQQ7fljz8UI9gqEM=;
        b=pZEBtGdEuu/cCRxG4gQkQyLBELLSHygN+m3TAY0vV4Yveh+2KhHo7qVrFG4NcsUOTD
         PZ50NQUpToh4T03vlB4Xe+EPcZtGi6newCZWS37E5wI907XZOivYFlcfVaIWuuJ+Tyyd
         VDOEl0QzEaLD96MaNK6NlmkfiJrl0Axot3FrM=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=9uBAwt5ccH1b2VM5tLOVDm7/pd6zQQ7fljz8UI9gqEM=;
        b=qUMK1T3l/O+dQX6tcWuXnlaOyy13QlIwQLOoLzrlvKIH4OhzStNSE84lM/EmXoUpBD
         W8elxTn7si4nA+i59CwEXvOu4Us19ONgteR1YPkLk3nce9wajuHA2V0AmvMQqznOWHud
         pmfCkypDIa0p+gxYQpicgccoi5bLfmvw71E2PbsH5aiD4A/DYL2AWOoKz0NEAVCy5e3W
         CeCUOa57lXGVmHYxPP1SxDPKfnrHLOtxc5QMKPM6vz9eqFH3VdR0+YDZkJleBNqVXyBx
         VAFia/k1ovueZ+5XYz+VJaOhDqgFJxLLtMvH8tbZlnW++nE6zFANvxkaVJEk38ogqKk4
         aUfQ==
X-Gm-Message-State: APt69E1OHXi9o5aaMXggaUihHRWGwBbBTMh3678+dXNF9ANERajpTFb/
        z0AILizIvFDcCRQ+Iz+5qTOblw==
X-Google-Smtp-Source: AAOMgpc1195H1PUzHe/UtQe8xHRq48N4fhg7RtuY3vg7b/12ryjV0b01O1rxvf9cC3k/0BFRaXskPg==
X-Received: by 2002:a1c:f106:: with SMTP id p6-v6mr1075882wmh.68.1530007890973;
        Tue, 26 Jun 2018 03:11:30 -0700 (PDT)
Received: from andrea (85.100.broadband17.iol.cz. [109.80.100.85])
        by smtp.gmail.com with ESMTPSA id a12-v6sm1159680wrs.26.2018.06.26.03.11.29
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 26 Jun 2018 03:11:30 -0700 (PDT)
Date:   Tue, 26 Jun 2018 12:11:28 +0200
From:   Andrea Parri <andrea.parri@amarulasolutions.com>
To:     Alan Stern <stern@rowland.harvard.edu>
Cc:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
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
Message-ID: <20180626101127.GB8295@andrea>
References: <1529918258-7295-1-git-send-email-andrea.parri@amarulasolutions.com>
 <Pine.LNX.4.44L0.1806251253380.1779-100000@iolanthe.rowland.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <Pine.LNX.4.44L0.1806251253380.1779-100000@iolanthe.rowland.org>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> > -A write memory barrier is implied by wake_up() and co.  if and only if they
> > -wake something up.  The barrier occurs before the task state is cleared, and so
> > -sits between the STORE to indicate the event and the STORE to set TASK_RUNNING:
> > +A general memory barrier is executed by wake_up() if it wakes something up.
> > +If it doesn't wake anything up then a memory barrier may or may not be
> > +executed; you must not rely on it.  The barrier occurs before the task state
> > +is accessed, in part., it sits between the STORE to indicate the event and
> > +the STORE to set TASK_RUNNING:
> 
> Minor suggestion: Instead of "in part.", how about "that is"?
> 
> (I generally find "in part." to be at least a little confusing,
> probably because "part" is itself a word and "in part" is a 
> reasonably common phrase in English.)

Mmh, the fact is that that "before the task state is accessed" does want
to include the LOAD from ->state to check for the task state (recall the
pattern in [1])...; how about if I expand "in part." to "in particular"?


> 
> >  
> > -	CPU 1				CPU 2
> > +	CPU 1 (Sleeper)			CPU 2 (Waker)
> >  	===============================	===============================
> >  	set_current_state();		STORE event_indicated
> >  	  smp_store_mb();		wake_up();
> > -	    STORE current->state	  <write barrier>
> > -	    <general barrier>		  STORE current->state
> > -	LOAD event_indicated
> > +	    STORE current->state	  ...
> > +	    <general barrier>		  <general barrier>
> > +	LOAD event_indicated		  if ((LOAD task->state) & TASK_NORMAL)
> > +					    STORE task->state
> >  
> > -To repeat, this write memory barrier is present if and only if something
> > -is actually awakened.  To see this, consider the following sequence of
> > -events, where X and Y are both initially zero:
> > +where "task" is the thread being woken up and it equals CPU 1's current.
> 
> Since "task" is in quotation marks, "current" should also be in
> quotation marks.

Sure, will fix in v2.

Thanks,
  Andrea


> 
> Alan
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
