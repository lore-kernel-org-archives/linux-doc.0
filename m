Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 909DE7D071
	for <lwn-linux-doc@archive.lwn.net>; Thu,  5 Jul 2018 22:28:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753782AbeGEW2U (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 5 Jul 2018 18:28:20 -0400
Received: from mail-wm0-f66.google.com ([74.125.82.66]:50589 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753499AbeGEW2U (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 5 Jul 2018 18:28:20 -0400
Received: by mail-wm0-f66.google.com with SMTP id v25-v6so13080040wmc.0
        for <linux-doc@vger.kernel.org>; Thu, 05 Jul 2018 15:28:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=Sz/E/5Vi8EWs9Y8JR8aevvawtocAftgETp4BcNHPDMQ=;
        b=kfIPJNrkkpcHgDS8hfbx7RmBTTR585mdzTQyFP+uzMhTy7J7lGw6ClAI4psbXjI9Q6
         QGe9lSvQbMEt8KeeQIKBLsedt8jyAJ3SCYJdVJaHeYrQCKuI17OA0eyajGJ/KVLk33YZ
         ISM2Mp0emxnQQy3o6mclQMi9enCpp7bUXOPVk=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=Sz/E/5Vi8EWs9Y8JR8aevvawtocAftgETp4BcNHPDMQ=;
        b=H1lNJsMmbWRp/q5+7Mqv+5uG+4sqJ8u9IegbwCzdrQp1Nzl/HPoBrgBmu2Z7CDTJPA
         TnH9BjXYqu6uWwxxstDDcTA5NfsFeomET8sCoDzucQzhoirK1Kqq5aMa1rSQdBiHHFsY
         iD3ZXJz6fxpgu59Qj3MgSMjoHpReoeQI3lf1433H7VeSVJJ3dI4fPkytxraNgX0v6mmR
         puvWlOeJyGMUo/Ds6/EPCxEO3zUzGjNg/1PutsMgA9cLWlb3lw90V8hoeL4Q/ute/bt4
         41/FLoVnslc0t9iCuZu/cpukosNHc0b5JFMOVYC6dP5HO7bEHlqt5nuondwnEOcT4gcw
         FgiA==
X-Gm-Message-State: APt69E3nsNhynH4bk37mo0CnGxug9EMao5xG6pBsLd9rGSXXr7tRTXoj
        l5x0KqNzXLHZks0zFEeqAT/9qA==
X-Google-Smtp-Source: AAOMgpexfDNaoIzwaw1mg9VQ4vau7yJvA3Ag++NirrMtM5mk/JbLgaNp/DK/R+GFmJ3eH9Zax6pBOg==
X-Received: by 2002:a1c:7506:: with SMTP id o6-v6mr5215581wmc.60.1530829698767;
        Thu, 05 Jul 2018 15:28:18 -0700 (PDT)
Received: from andrea ([94.230.152.15])
        by smtp.gmail.com with ESMTPSA id a203-v6sm9444427wme.46.2018.07.05.15.28.17
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Thu, 05 Jul 2018 15:28:18 -0700 (PDT)
Date:   Fri, 6 Jul 2018 00:28:12 +0200
From:   Andrea Parri <andrea.parri@amarulasolutions.com>
To:     linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org
Cc:     Peter Zijlstra <peterz@infradead.org>,
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
Subject: Re: [PATCH 0/3] sched/locking/doc: Miscellaneous fixes
Message-ID: <20180705222812.GA4582@andrea>
References: <1530182480-13205-1-git-send-email-andrea.parri@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1530182480-13205-1-git-send-email-andrea.parri@amarulasolutions.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jun 28, 2018 at 12:41:17PM +0200, Andrea Parri wrote:
> Hi,
> 
> This is a follow-up on the discussion started in [1].
> 
> Applies on -rcu/dev.
> 
> Cheers,
>   Andrea
> 
> [1] http://lkml.kernel.org/r/1529918258-7295-1-git-send-email-andrea.parri@amarulasolutions.com
> 
> Andrea Parri (3):
>   sched: Use smp_mb() in wake_woken_function()
>   locking: Clarify requirements for smp_mb__after_spinlock()
>   doc: Update wake_up() & co. memory-barrier guarantees

What is the plan for this series?

We are currently discussing locking changes that might affect 2/3, but
I'd still consider this patch and the overall series as an improvement
over the current status (1/3 is a fix to the code) and I'd really like
future changes to be based on this series...

I expected this series to go via "-rcu -> tip -> ..."; 2/3 had Peter's
Ack, but 1/3 and 3/3 are missing any comments (or tags): please let me
know if any action on the series is required from me (the series still
applies on the latest "dev" branch of -rcu).

  Andrea


> 
>  Documentation/memory-barriers.txt | 43 ++++++++++++++++++------------
>  include/linux/sched.h             |  4 +--
>  include/linux/spinlock.h          | 25 ++----------------
>  kernel/sched/completion.c         |  8 +++---
>  kernel/sched/core.c               | 30 +++++++++------------
>  kernel/sched/wait.c               | 55 ++++++++++++++++++---------------------
>  6 files changed, 72 insertions(+), 93 deletions(-)
> 
> -- 
> 2.7.4
> 
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
