Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9C8CE7D09D
	for <lwn-linux-doc@archive.lwn.net>; Thu, 28 Jun 2018 17:30:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S934931AbeF1Ra4 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 28 Jun 2018 13:30:56 -0400
Received: from mail-wm0-f68.google.com ([74.125.82.68]:54889 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933596AbeF1Ray (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 28 Jun 2018 13:30:54 -0400
Received: by mail-wm0-f68.google.com with SMTP id i139-v6so10546043wmf.4
        for <linux-doc@vger.kernel.org>; Thu, 28 Jun 2018 10:30:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=A0QHU8mL+6CDYRZhCz74GYSF4Kf0iPJGJzoqxFNfZlw=;
        b=BDjiTO1b2tBcu4jRtIm4VSmC817Y24sAlw1sNJYeV6hmm1wMHuS3QAKD2prIayS9VF
         xfcQn30TnJR8xvCc9eHLZzZ2QaYw/fDH0uXq5S8CPevH1UP1Jlk2d/reV6qt0VwHZGGF
         Ck3aUnliC6nytjxNDL9MCZJf6/VUHxpPy6EMU=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=A0QHU8mL+6CDYRZhCz74GYSF4Kf0iPJGJzoqxFNfZlw=;
        b=rDjIouIVLDhFKIwETG8dlui12Leqjn+8GVoTWCPOpIF0Mm7fKzHKu6+HozLlIpIMSO
         /ppRkH1dltNYtBvT7vU1RxSWqq+twoR3guB7g9pqFT+I14pDhm73AncFmV++aM800Qyt
         MlfthwEPgooE3Nj1oJiOFrCtyENAslnKKm89eIfodpTJRE7167ggCRqK6A5AGaT7wxJp
         jTNNbSErGKHP+6JjHgFeN8N0CAqKhQyZOwl8cfHUpeSwHqYif2XDg2aBoiktEW6HLO9Z
         2vu3yWzavAMHovKEUaTaU4lAzOlGbvovn8e8DNRQJ+6kMIjSSAepS9sB5h+ZmFHIudyE
         NgrA==
X-Gm-Message-State: APt69E3MiTKxw13g/jn1xX+wzFHUbPv2EygMZTEX5HHQ9zgkpBd5OTpU
        vS/KhcII8VbMW+m/pt0kjeS8MQ==
X-Google-Smtp-Source: AAOMgpc0RiyUfXMmQSBttFY3RRx79fGE5aFCTRShoXgxnxH6gtalxH/jNOk3SZDYBtMGF10gVJ15ig==
X-Received: by 2002:a7b:c058:: with SMTP id u24-v6mr9036613wmc.136.1530207052957;
        Thu, 28 Jun 2018 10:30:52 -0700 (PDT)
Received: from andrea ([94.230.152.15])
        by smtp.gmail.com with ESMTPSA id h3-v6sm5335306wro.87.2018.06.28.10.30.51
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 28 Jun 2018 10:30:52 -0700 (PDT)
Date:   Thu, 28 Jun 2018 19:30:45 +0200
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
        Randy Dunlap <rdunlap@infradead.org>
Subject: Re: [PATCH 2/3] locking: Clarify requirements for
 smp_mb__after_spinlock()
Message-ID: <20180628173045.GA4975@andrea>
References: <1530182480-13205-1-git-send-email-andrea.parri@amarulasolutions.com>
 <1530182480-13205-3-git-send-email-andrea.parri@amarulasolutions.com>
 <20180628150550.GI2494@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180628150550.GI2494@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jun 28, 2018 at 05:05:50PM +0200, Peter Zijlstra wrote:
> On Thu, Jun 28, 2018 at 12:41:19PM +0200, Andrea Parri wrote:
> > - * This barrier must provide two things:
> > - *
> > - *   - it must guarantee a STORE before the spin_lock() is ordered against a
> > - *     LOAD after it, see the comments at its two usage sites.
> > - *
> > - *   - it must ensure the critical section is RCsc.
> > - *
> > - * The latter is important for cases where we observe values written by other
> > - * CPUs in spin-loops, without barriers, while being subject to scheduling.
> > - *
> > - * CPU0			CPU1			CPU2
> > - *
> > - *			for (;;) {
> > - *			  if (READ_ONCE(X))
> > - *			    break;
> > - *			}
> > - * X=1
> > - *			<sched-out>
> > - *						<sched-in>
> > - *						r = X;
> > - *
> > - * without transitivity it could be that CPU1 observes X!=0 breaks the loop,
> > - * we get migrated and CPU2 sees X==0.
> 
> Please don't remove that; that explains _why_ we need a full memory
> barrier here.

Peter:

Both you and Boqun stated that the above snippet is "bad":

  http://lkml.kernel.org/r/20180312085646.GE4064@hirez.programming.kicks-ass.net

and I do agree with your assessment! ;-)

I've no objection to keep that comment (together with the
"clarification" suggested in this patch) _once_ replaced
that snippet with something else (say, with the snippet
Boqun suggested in:

  http://lkml.kernel.org/r/20180312085600.aczjkpn73axzs2sb@tardis ):

is this what you mean?

  Andrea
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
