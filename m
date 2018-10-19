Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6DB6D7D082
	for <lwn-linux-doc@archive.lwn.net>; Fri, 19 Oct 2018 03:58:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726663AbeJSMDB (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 19 Oct 2018 08:03:01 -0400
Received: from mail-pg1-f195.google.com ([209.85.215.195]:44629 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726667AbeJSMDB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 19 Oct 2018 08:03:01 -0400
Received: by mail-pg1-f195.google.com with SMTP id g2-v6so15166871pgu.11
        for <linux-doc@vger.kernel.org>; Thu, 18 Oct 2018 20:58:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=joelfernandes.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=64vq2/B6XPZ3Ilprbin+GaWg1J+1g9ESsyUeba3mxT8=;
        b=vPqXPLiCetM6+kgQ2s1oZ9nC5PBskNAaUP2A3APwQma0gzsOwCeK/jyIjkFpwU7kcd
         c5k+Uz016IC9Vge7cT4TwFXstNUz8pblPuHLI9OR0r0nmVlkboS5WFmcagw1KTS55+gZ
         MVF7O361X01MbU9Uu5HwVMonPgmLD1ihAtJyI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=64vq2/B6XPZ3Ilprbin+GaWg1J+1g9ESsyUeba3mxT8=;
        b=fDCKCfgMkeHuogR+cmRQLZdNDfmRB71mEfUEy7o5bSWppqMC4+qFrVdnSFka+WLmgt
         Ud8kqRqHU73WnVZgxCJfkhPIyaY8v2zIakE90pzDLB+5JRTJku/tmzMpJ4x4biEraZA0
         u0SenlEN3U5i2yaNsb+ThTkWy99CV6EWilo0BPlDI0WwFkgreOkTHlJF9fHR1iZ6nDnE
         QWWS7FpazOrapbUoG8k4QwLFKYQmRwDGmOwjtArhgMe03E99KB2OmtDZaSCLK7Q4a3kx
         vP/LFOv/kcx1t5sBcJkULOboa8vJObHXDQ6xSskTDNunnsBegp2zsE6xV3+R9GYu88+N
         +egw==
X-Gm-Message-State: ABuFfohMJgMKqwOrybiCPVy181udxXrSObi6lpHlulBjtX1ZlAZjK630
        TfKfciq7nW7/0/gbYWXQLq7iww==
X-Google-Smtp-Source: ACcGV62VXaL1pPIWNSCeh22C5zdFdaZ9JZ7bBHB9w+ozT7fQXE7+pPm2Eh4H0/Q8RT9aHYNEyF8w1g==
X-Received: by 2002:a63:1919:: with SMTP id z25-v6mr30333822pgl.135.1539921527526;
        Thu, 18 Oct 2018 20:58:47 -0700 (PDT)
Received: from localhost ([2620:0:1000:1601:3aef:314f:b9ea:889f])
        by smtp.gmail.com with ESMTPSA id 84-v6sm36478634pfs.108.2018.10.18.20.58.45
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 18 Oct 2018 20:58:46 -0700 (PDT)
Date:   Thu, 18 Oct 2018 20:58:44 -0700
From:   Joel Fernandes <joel@joelfernandes.org>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     "Paul E. McKenney" <paulmck@linux.ibm.com>,
        Nikolay Borisov <nborisov@suse.com>,
        linux-kernel@vger.kernel.org, Jonathan Corbet <corbet@lwn.net>,
        Josh Triplett <josh@joshtriplett.org>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        linux-doc@vger.kernel.org,
        Mathieu Desnoyers <mathieu.desnoyers@efficios.com>
Subject: Re: [PATCH RFC] doc: rcu: remove obsolete (non-)requirement about
 disabling preemption
Message-ID: <20181019035844.GA141835@joelaf.mtv.corp.google.com>
References: <20181017181505.GC107185@joelaf.mtv.corp.google.com>
 <20181017203324.GS2674@linux.ibm.com>
 <20181018020751.GB99677@joelaf.mtv.corp.google.com>
 <20181018144637.GD2674@linux.ibm.com>
 <20181019000350.GB89903@joelaf.mtv.corp.google.com>
 <20181019001932.GR2674@linux.ibm.com>
 <20181019012645.GC89903@joelaf.mtv.corp.google.com>
 <20181018215035.5e8ff553@vmware.local.home>
 <20181019022529.GA155753@joelaf.mtv.corp.google.com>
 <20181018225223.42641c73@vmware.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181018225223.42641c73@vmware.local.home>
User-Agent: Mutt/1.10.1 (2018-07-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Oct 18, 2018 at 10:52:23PM -0400, Steven Rostedt wrote:
> On Thu, 18 Oct 2018 19:25:29 -0700
> Joel Fernandes <joel@joelfernandes.org> wrote:
> 
> > On Thu, Oct 18, 2018 at 09:50:35PM -0400, Steven Rostedt wrote:
> > > On Thu, 18 Oct 2018 18:26:45 -0700
> > > Joel Fernandes <joel@joelfernandes.org> wrote:
> > >   
> > > > Yes, local_irq_restore is light weight, and does not check for reschedules.
> > > > 
> > > > I was thinking of case where ksoftirqd is woken up, but does not run unless
> > > > we set the NEED_RESCHED flag. But that should get set anyway since probably
> > > > ksoftirqd is of high enough priority than the currently running task..
> > > > 
> > > > Roughly speaking the scenario could be something like:
> > > > 
> > > > rcu_read_lock();
> > > >                  <-- IPI comes in for the expedited GP, sets exp_hint
> > > > local_irq_disable();
> > > > // do a bunch of stuff
> > > > rcu_read_unlock();   <-- This calls the rcu_read_unlock_special which raises
> > > >                          the soft irq, and wakesup softirqd.  
> > > 
> > > If softirqd is of higher priority than the current running task, then
> > > the try_to_wake_up() will set NEED_RESCHED of the current task here.
> > >   
> > 
> > Yes, only *if*. On my system, ksoftirqd is CFS nice 0. I thought expedited
> > grace periods are quite important and they should complete quickly which is
> > the whole reason for interrupting rcu read sections with an IPI and stuff.
> > IMO there should be no harm in setting NEED_RESCHED unconditionally anyway
> > for possible benefit of systems where the ksoftirqd is not of higher priority
> > than the currently running task, and we need to run it soon on the CPU. But
> > I'm Ok with whatever Paul and you want to do here.
> 
> 
> Setting NEED_RESCHED unconditionally wont help. Because even if we call
> schedule() ksoftirqd will not be scheduled! If it's CFS nice 0, and the
> current task still has quota to run, if you call schedule, you'll just
> waste time calculating that the current task should still be running.
> It's equivalent to calling yield() (which is why we removed all yield()
> users in the kernel, because *all* of them were buggy!). This is *why*
> it only calls schedule *if* softirqd is of higher priority.

Yes, ok. you are right the TTWU path should handle setting the NEED_RESCHED
flag or not and unconditionally setting it does not get us anything. I had to
go through the code a bit since it has been a while since I explored it.

So Paul, I'm Ok with your latest patch for the issue we discussed and don't
think much more can be done barring raising of ksofitrqd priorities :-) So I
guess the synchronize_rcu_expedited will just cope with the deal between
local_irq_enable and the next scheduling point.. :-)

thanks,

- Joel

