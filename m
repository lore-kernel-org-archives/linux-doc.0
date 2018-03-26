Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6BBE77D0F4
	for <lwn-linux-doc@archive.lwn.net>; Mon, 26 Mar 2018 12:47:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1752008AbeCZMrR (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 26 Mar 2018 08:47:17 -0400
Received: from mail-wr0-f171.google.com ([209.85.128.171]:45990 "EHLO
        mail-wr0-f171.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751932AbeCZMrQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 26 Mar 2018 08:47:16 -0400
Received: by mail-wr0-f171.google.com with SMTP id u11so6475762wri.12
        for <linux-doc@vger.kernel.org>; Mon, 26 Mar 2018 05:47:15 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=GTIIrFa9VHUvRKxn9UJTpWIXRekxbhKgPtIsMTohlNg=;
        b=ommGLQq/AvudWli3OyzfZ2zw9tmGr15nJZfFGHbZx5cy/C4q7XsMZ2EyMe5y43VNFg
         HTbh+qhl1uL3IZ219c+kSiHfkNHwV+shTzUQ560Ns6H3fA29gIMsjQIeAiHiBaekNU+A
         +PE7bo083zWCStFKvInvdiwUscLG/IbO91q7xJHwoFRWY3p3ZtgYl03lBBWM6+b2xK+Q
         k35ji7+EJG2R+lVnYG2fZZRp//MiBNy7GvsjKeuPOgLfRAah2AdkviB6+8ef2d8dLlAR
         6pWZxJh7mOxEzp19kHqZ/WbFjU8vVAwlEQwPAA2qcz5nWetiyadqRtHaixWulcgTrO75
         uIYA==
X-Gm-Message-State: AElRT7F1O8MAl3uXLlEZWpqyCD7JPOmilkzU0/yUMTk09KzEJMjQbN5x
        lWwT+1agRmlJ6+nrzxXLWQUAtw==
X-Google-Smtp-Source: AG47ELvG96FwykJEChpQ2TuGku3O63z3EqbhmVd2JWWaKcP0fDpUZ9ayvdk2GvNmq2lfGLaZGbC+Xw==
X-Received: by 10.223.184.109 with SMTP id u42mr28241667wrf.3.1522068434830;
        Mon, 26 Mar 2018 05:47:14 -0700 (PDT)
Received: from localhost.localdomain ([151.15.243.46])
        by smtp.gmail.com with ESMTPSA id p19sm26736949wrb.75.2018.03.26.05.47.13
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Mon, 26 Mar 2018 05:47:14 -0700 (PDT)
Date:   Mon, 26 Mar 2018 14:47:11 +0200
From:   Juri Lelli <juri.lelli@redhat.com>
To:     Waiman Long <longman@redhat.com>
Cc:     Tejun Heo <tj@kernel.org>, Li Zefan <lizefan@huawei.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, cgroups@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        kernel-team@fb.com, pjt@google.com, luto@amacapital.net,
        efault@gmx.de, torvalds@linux-foundation.org,
        Roman Gushchin <guro@fb.com>
Subject: Re: [PATCH v6 2/2] cpuset: Add cpuset.sched_load_balance to v2
Message-ID: <20180326124711.GE5942@localhost.localdomain>
References: <1521649309-26690-1-git-send-email-longman@redhat.com>
 <1521649309-26690-3-git-send-email-longman@redhat.com>
 <20180322084120.GE7231@localhost.localdomain>
 <e754e128-0a93-800e-e71b-2c8dc316ba8a@redhat.com>
 <20180323075952.GA4763@localhost.localdomain>
 <a8860a42-31b5-4620-7b23-b7515ee11d7d@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <a8860a42-31b5-4620-7b23-b7515ee11d7d@redhat.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 23/03/18 14:44, Waiman Long wrote:
> On 03/23/2018 03:59 AM, Juri Lelli wrote:

[...]

> > OK, thanks for confirming. Can you tell again however why do you think
> > we need to remove sched_load_balance from root level? Won't we end up
> > having tasks put on isolated sets?
> 
> The root cgroup is special that it owns all the resources in the system.
> We generally don't want restriction be put on the root cgroup. A child
> cgroup has to be created to have constraints put on it. In fact, most of
> the controller files don't show up in the v2 cgroup root at all.
> 
> An isolated cgroup has to be put under root, e.g.
> 
>       Root
>      /    \
> isolated  balanced
> 
> >
> > Also, I guess children groups with more than one CPU will need to be
> > able to load balance across their CPUs, no matter what their parent
> > group does?
> 
> The purpose of an isolated cpuset is to have a dedicated set of CPUs to
> be used by a certain application that makes its own scheduling decision
> by placing tasks explicitly on specific CPUs. It just doesn't make sense
> to have a CPU in an isolated cpuset to participated in load balancing in
> another cpuset. If one want load balancing in a child cpuset, the parent
> cpuset should have load balancing turned on as well.

Isolated with CPUs overlapping some other cpuset makes little sense, I
agree. What I have in mind however is an isolated set of CPUs that don't
overlap with any other cpuset (as your balanced set above). In this case
I think it makes sense to let the sys admin decide if "automatic" load
balancing has to be performed (by the scheduler) or no load balacing at
all has to take place?

Further extending your example:

             Root [0-3]
	     /        \
        group1 [0-1] group2[2-3]

Why should we prevent load balancing to be disabled at root level (so
that for example tasks still residing in root group are not freely
migrated around, potentially disturbing both sub-groups)?

Then one can decide that group1 is a "userspace managed" group (no load
balancing takes place) and group2 is balanced by the scheduler.

And this is not DEADLINE specific, IMHO.

> As I look into the code, it seems like root domain is probably somewhat
> associated with cpu_exclusive only. Whether sched_load_balance is set
> doesn't really matter.  I will need to look further on the conditions
> where a new root domain is created.

I checked again myself (sched domains code is always a maze :) and I
believe that sched_load_balance flag indeed controls domains (sched and
root) creation and configuration . Changing the flag triggers potential
rebuild and separed sched/root domains are generated if subgroups have
non overlapping cpumasks.  cpu_exclusive only enforces this latter
condition.

Best,

- Juri
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
