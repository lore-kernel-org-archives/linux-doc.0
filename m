Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE autolearn=ham
	autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id C85D67D910
	for <lwn-linux-doc@archive.lwn.net>; Thu, 29 Aug 2019 19:00:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728408AbfH2TAt (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 29 Aug 2019 15:00:49 -0400
Received: from mail-pf1-f193.google.com ([209.85.210.193]:43937 "EHLO
        mail-pf1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727959AbfH2TAt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 29 Aug 2019 15:00:49 -0400
Received: by mail-pf1-f193.google.com with SMTP id v12so2678504pfn.10
        for <linux-doc@vger.kernel.org>; Thu, 29 Aug 2019 12:00:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=YFO4ToJTqzSQELe3odwwkEfeFs84ACj71p8BdwBVqGc=;
        b=d0VFIDowYpvAl/u3SmvC0to24Kdmxtpz2/UnnHd8VZyq1Od8buoXAZgDmyshy3xKpv
         E4JQSe8CmUGbPMBhy30yzfA9+zY3kE2Oveu4m/7CuPoW/IOsvPx2E/fQ8csrW2zCDVFZ
         YCaTL8mvBoul3+p5hEYzMhXdMc/Th4xD/Oc+c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=YFO4ToJTqzSQELe3odwwkEfeFs84ACj71p8BdwBVqGc=;
        b=B8z6pYIp8e7OyDBzqXhTeDG+NEmCghFOC1DHyxmOKejmd9ch+eh9crSrz9AUXIbvQf
         535bTE6OEsVvkxmAaPbnhIAD/KlonXxWLFGx1RNUOML8iIHYCKxMGfDpp+UzqX4AIrVH
         jYKGZ2ZLFnY4XjhUuDktYx+XkROgsVDY9supu4O2z31IGrESydBpxutLLbNtLjp/XhhO
         sM8vLzuJswYTUoofTmf53CjkZPYpR10K3cnjn15qa2SMqsMp40tbWkEaGqPjrCX66Whm
         m5pVTaotyiscQhRxZZ6a6kjs7I3jeDZOgI5SnniSxzPi56UmuTGcNRjMbetxpbDP0s1N
         /j3w==
X-Gm-Message-State: APjAAAXf3M6jd3TBnn9mmQ3UrFA4Dcb756B6vfACzMtmsrZMnPI+/0pS
        3fm4NoO39nNcirW7Jm1BEmCnhw==
X-Google-Smtp-Source: APXvYqw8LkU0kSGTofdVPMh2aqBnJCfeAMn73MuHa4izANAy35sEF6IaMEn0o0lntDwre+4hF5klZA==
X-Received: by 2002:a17:90a:d345:: with SMTP id i5mr11528135pjx.16.1567105248246;
        Thu, 29 Aug 2019 12:00:48 -0700 (PDT)
Received: from localhost ([2620:15c:6:12:9c46:e0da:efbf:69cc])
        by smtp.gmail.com with ESMTPSA id 5sm2846842pgh.93.2019.08.29.12.00.46
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 29 Aug 2019 12:00:47 -0700 (PDT)
Date:   Thu, 29 Aug 2019 15:00:46 -0400
From:   Joel Fernandes <joel@joelfernandes.org>
To:     "Paul E. McKenney" <paulmck@kernel.org>
Cc:     Andy Lutomirski <luto@kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Frederic Weisbecker <fweisbec@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Josh Triplett <josh@joshtriplett.org>,
        Android Kernel Team <kernel-team@android.com>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>,
        Mauro Carvalho Chehab <mchehab+samsung@kernel.org>,
        rcu@vger.kernel.org, Steven Rostedt <rostedt@goodmis.org>
Subject: Re: [RFC v1 2/2] rcu/tree: Remove dynticks_nmi_nesting counter
Message-ID: <20190829190046.GB115245@google.com>
References: <20190828214241.GD75931@google.com>
 <20190828220108.GC26530@linux.ibm.com>
 <20190828221444.GA100789@google.com>
 <20190828231247.GE26530@linux.ibm.com>
 <20190829015155.GB100789@google.com>
 <20190829034336.GD4125@linux.ibm.com>
 <20190829144355.GE63638@google.com>
 <20190829160946.GP4125@linux.ibm.com>
 <CALCETrWNPOOdTrFabTDd=H7+wc6xJ9rJceg6OL1S0rTV5pfSsA@mail.gmail.com>
 <20190829165407.GT4125@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190829165407.GT4125@linux.ibm.com>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Paul,

On Thu, Aug 29, 2019 at 09:54:07AM -0700, Paul E. McKenney wrote:
> On Thu, Aug 29, 2019 at 09:21:46AM -0700, Andy Lutomirski wrote:
> > On Thu, Aug 29, 2019 at 9:10 AM Paul E. McKenney <paulmck@kernel.org> wrote:
> > >
> > > On Thu, Aug 29, 2019 at 10:43:55AM -0400, Joel Fernandes wrote:
> > >
> > > [ . . . ]
> > >
> > > > Paul, do we also nuke rcu_eqs_special_set()?  Currently I don't see anyone
> > > > using it. And also remove the bottom most bit of dynticks?
> > > >
> > > > Also what happens if a TLB flush broadcast is needed? Do we IPI nohz or idle
> > > > CPUs are the moment?
> > > >
> > > > All of this was introduced in:
> > > > b8c17e6664c4 ("rcu: Maintain special bits at bottom of ->dynticks counter")
> > >
> > > Adding Andy Lutomirski on CC.
> > >
> > > Andy, is this going to be used in the near term, or should we just get
> > > rid of it?
> > 
> > Let's get rid of it.  I'm not actually convinced it *can* be used as designed.
> > 
> > For those who forgot the history or weren't cc'd on all of it: I had
> > this clever idea about how we could reduce TLB flushes.  I implemented
> > some of it (but not the part that would have used this RCU feature),
> > and it exploded in nasty and subtle ways.  This caused me to learn
> > that speculative TLB fills were a problem that I had entirely failed
> > to account for.  Then PTI happened and thoroughly muddied the water.
> 
> Yeah, PTI was quite annoying.  Still is, from what I can see.  :-/
> 
> > So I think we should just drop this :(
> 
> OK, thank you!  I will put a tag into -rcu marking its removal in case
> it should prove useful whenever for whatever.
> 
> Joel, would you like to remove this, or would you rather that I did?
> It is in code you are working with right now, so if I do it, I need to
> wait until yours is finalized.  Which wouldn't be a problem.

I can remove it in my series, made a note to do so.

thanks,

 - Joel

