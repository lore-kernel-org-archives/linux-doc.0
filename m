Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 635387D0DA
	for <lwn-linux-doc@archive.lwn.net>; Fri, 23 Mar 2018 08:00:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751551AbeCWH75 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 23 Mar 2018 03:59:57 -0400
Received: from mail-wm0-f65.google.com ([74.125.82.65]:33449 "EHLO
        mail-wm0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751479AbeCWH74 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 23 Mar 2018 03:59:56 -0400
Received: by mail-wm0-f65.google.com with SMTP id i189so5712539wmf.0
        for <linux-doc@vger.kernel.org>; Fri, 23 Mar 2018 00:59:56 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=bGfL7EwK02WqdXgmAhwk3wlFS3jUXikDvChEg2+xPZo=;
        b=dWyw/CmZPy1vMsTCHYrHfKlVfwt4TZ+zx4O5YWQhySxs8ScH92xAzWxCvkb0BxR1d7
         t6YTk8vunCTcPJdquOMZuW9kd+oEifHmp03Nt8lfxh4jyMOY8mwTRah6gk/lduQtJjfb
         Y0xHfPcnq7tMfjYbrej8eHDARZpwEc8//1pJ4Evj8VF0qVmS8iZD8YSamt3iUvlcjkmq
         t25WOuPktzbeGjAaO55Ip7PCTNtUeOASCrMYkGPDaR2b0PzJNqG4FRJGesSQdU0nsq8N
         +Cf/Q223Ol299fgTMRBnvaUDm4+/T3oHR+cpUV4TZHB757aY+H+rX6jgPUIHGKIP405h
         RFlQ==
X-Gm-Message-State: AElRT7EkfvFne9I/FvUeG/hSfKAbpMUje9LKlDSxSArl5+ugUXwNL0Ld
        W3YPcnHmIjpldx/Qpxuac4YGxg==
X-Google-Smtp-Source: AG47ELtfV1QRgiWdzJfoaELolBI0rfMIbq7eLYft0xy3rBmBAVT1NQzNJgKPmFj+n5FshGjlghfX2g==
X-Received: by 10.28.170.205 with SMTP id t196mr8035765wme.42.1521791995213;
        Fri, 23 Mar 2018 00:59:55 -0700 (PDT)
Received: from localhost.localdomain ([151.15.243.46])
        by smtp.gmail.com with ESMTPSA id a63sm10411199wrc.22.2018.03.23.00.59.53
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Fri, 23 Mar 2018 00:59:54 -0700 (PDT)
Date:   Fri, 23 Mar 2018 08:59:52 +0100
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
Message-ID: <20180323075952.GA4763@localhost.localdomain>
References: <1521649309-26690-1-git-send-email-longman@redhat.com>
 <1521649309-26690-3-git-send-email-longman@redhat.com>
 <20180322084120.GE7231@localhost.localdomain>
 <e754e128-0a93-800e-e71b-2c8dc316ba8a@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <e754e128-0a93-800e-e71b-2c8dc316ba8a@redhat.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 22/03/18 17:50, Waiman Long wrote:
> On 03/22/2018 04:41 AM, Juri Lelli wrote:
> > On 21/03/18 12:21, Waiman Long wrote:

[...]

> >> +  cpuset.sched_load_balance
> >> +	A read-write single value file which exists on non-root cgroups.
> >> +	The default is "1" (on), and the other possible value is "0"
> >> +	(off).
> >> +
> >> +	When it is on, tasks within this cpuset will be load-balanced
> >> +	by the kernel scheduler.  Tasks will be moved from CPUs with
> >> +	high load to other CPUs within the same cpuset with less load
> >> +	periodically.
> >> +
> >> +	When it is off, there will be no load balancing among CPUs on
> >> +	this cgroup.  Tasks will stay in the CPUs they are running on
> >> +	and will not be moved to other CPUs.
> >> +
> >> +	This flag is hierarchical and is inherited by child cpusets. It
> >> +	can be turned off only when the CPUs in this cpuset aren't
> >> +	listed in the cpuset.cpus of other sibling cgroups, and all
> >> +	the child cpusets, if present, have this flag turned off.
> >> +
> >> +	Once it is off, it cannot be turned back on as long as the
> >> +	parent cgroup still has this flag in the off state.
> >> +
> > I'm afraid that this will not work for SCHED_DEADLINE (at least for how
> > it is implemented today). As you can see in Documentation [1] the only
> > way a user has to perform partitioned/clustered scheduling is to create
> > subset of exclusive cpusets and then assign deadline tasks to them. The
> > other thing to take into account here is that a root_domain is created
> > for each exclusive set and we use such root_domain to keep information
> > about admitted bandwidth and speed up load balancing decisions (there is
> > a max heap tracking deadlines of active tasks on each root_domain).
> > Now, AFAIR distinct root_domain(s) are created when parent group has
> > sched_load_balance disabled and cpus_exclusive set (in cgroup v1 that
> > is). So, what we normally do is create, say, cpus_exclusive groups for
> > the different clusters and then disable sched_load_balance at root level
> > (so that each cluster gets its own root_domain). Also,
> > sched_load_balance is enabled in children groups (as load balancing
> > inside clusters is what we actually needed :).
> 
> That looks like an undocumented side effect to me. I would rather see an
> explicit control file that enable root_domain and break it free from
> cpu_exclusive && !sched_load_balance, e.g. sched_root_domain(?).

Mmm, it actually makes some sort of sense to me that as long as parent
groups can't load balance (because !sched_load_balance) and this group
can't have CPUs overlapping with some other group (because
cpu_exclusive) a data structure (root_domain) is created to handle load
balancing for this isolated subsystem. I agree that it should be better
documented, though.

> > IIUC your proposal this will not be permitted with cgroup v2 because
> > sched_load_balance won't be present at root level and children groups
> > won't be able to set sched_load_balance back to 1 if that was set to 0
> > in some parent. Is that true?
> 
> Yes, that is the current plan.

OK, thanks for confirming. Can you tell again however why do you think
we need to remove sched_load_balance from root level? Won't we end up
having tasks put on isolated sets?

Also, I guess children groups with more than one CPU will need to be
able to load balance across their CPUs, no matter what their parent
group does?

Thanks,

- Juri
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
