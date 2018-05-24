Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id BC9FD7D085
	for <lwn-linux-doc@archive.lwn.net>; Thu, 24 May 2018 15:18:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S966273AbeEXPRC (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 24 May 2018 11:17:02 -0400
Received: from mail-wm0-f68.google.com ([74.125.82.68]:53926 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S966229AbeEXPRB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 24 May 2018 11:17:01 -0400
Received: by mail-wm0-f68.google.com with SMTP id a67-v6so6145917wmf.3
        for <linux-doc@vger.kernel.org>; Thu, 24 May 2018 08:17:00 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=mTS5DTHWm3Ox3YE3ihPYoxRrj9q83FTQbPJoKoZTDyM=;
        b=dkYzy6gRMNi38G1bSB7iwDf6Qhj/+IYNlAYftQJZGJ/2xif8heyvoAxNcBOT9O7ZAf
         6TnVEgJFSFDYYFpzh1smsAU9ltUynCfpHnDGsPaAn5i9SktWqBnlwRqLVZw/WPKTFycO
         FiEFBzC0tIH4oNhGdPCB0OieaVsTb6T9FtLRKjz5RIFceXlNxj8V7mLF7UxqLvu1SJ1u
         a/T+Q4c5RhP5kIb04vsKKzOzlIrV4XWSrrc7RLKCNk/IBfScn3n4Wl7Bfunz97Wf9JtR
         TZhPdvkA+e55ku9NUnfGWuf88BvzA9dzmGVl8W+i1bY1B6BXf+o74eSB9vtAQmduzaFd
         mQsw==
X-Gm-Message-State: ALKqPwd4PHKz4IiIQQDe3csZSNS5Wpori3uhpGAZBAKtbXLWxwgvC16b
        hK/FL+CjUoCJVNIqJN40BFWmGw==
X-Google-Smtp-Source: AB8JxZrc/RP/+OVSz8XnpEBM5HOnYpzC9KL5xypbJYAa6HFyY3EzPr5G1h4N1P07g/q20HoU9QRRuw==
X-Received: by 2002:a1c:904b:: with SMTP id s72-v6mr7512185wmd.85.1527175019727;
        Thu, 24 May 2018 08:16:59 -0700 (PDT)
Received: from localhost.localdomain ([151.15.207.242])
        by smtp.gmail.com with ESMTPSA id m134-v6sm5851099wmg.13.2018.05.24.08.16.58
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 24 May 2018 08:16:58 -0700 (PDT)
Date:   Thu, 24 May 2018 17:16:56 +0200
From:   Juri Lelli <juri.lelli@redhat.com>
To:     Waiman Long <longman@redhat.com>
Cc:     Tejun Heo <tj@kernel.org>, Li Zefan <lizefan@huawei.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, cgroups@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        kernel-team@fb.com, pjt@google.com, luto@amacapital.net,
        Mike Galbraith <efault@gmx.de>, torvalds@linux-foundation.org,
        Roman Gushchin <guro@fb.com>
Subject: Re: [PATCH v8 3/6] cpuset: Add cpuset.sched.load_balance flag to v2
Message-ID: <20180524151656.GD3948@localhost.localdomain>
References: <1526590545-3350-1-git-send-email-longman@redhat.com>
 <1526590545-3350-4-git-send-email-longman@redhat.com>
 <20180524143614.GC3948@localhost.localdomain>
 <4bd31510-4f73-e263-8dc1-5edb0fe63b59@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4bd31510-4f73-e263-8dc1-5edb0fe63b59@redhat.com>
User-Agent: Mutt/1.9.2 (2017-12-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 24/05/18 11:09, Waiman Long wrote:
> On 05/24/2018 10:36 AM, Juri Lelli wrote:
> > On 17/05/18 16:55, Waiman Long wrote:
> >
> > [...]
> >
> >> +	A parent cgroup cannot distribute all its CPUs to child
> >> +	scheduling domain cgroups unless its load balancing flag is
> >> +	turned off.
> >> +
> >> +  cpuset.sched.load_balance
> >> +	A read-write single value file which exists on non-root
> >> +	cpuset-enabled cgroups.  It is a binary value flag that accepts
> >> +	either "0" (off) or a non-zero value (on).  This flag is set
> >> +	by the parent and is not delegatable.
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
> >> +	The initial value of this flag is "1".	This flag is then
> >> +	inherited by child cgroups with cpuset enabled.  Its state
> >> +	can only be changed on a scheduling domain cgroup with no
> >> +	cpuset-enabled children.
> > [...]
> >
> >> +	/*
> >> +	 * On default hierachy, a load balance flag change is only allowed
> >> +	 * in a scheduling domain with no child cpuset.
> >> +	 */
> >> +	if (cgroup_subsys_on_dfl(cpuset_cgrp_subsys) && balance_flag_changed &&
> >> +	   (!is_sched_domain(cs) || css_has_online_children(&cs->css))) {
> >> +		err = -EINVAL;
> >> +		goto out;
> >> +	}
> > The rule is actually
> >
> >  - no child cpuset
> >  - and it must be a scheduling domain
> >
> > Right?
> 
> Yes, because it doesn't make sense to have a cpu in one cpuset that has
> loading balance off while, at the same time, in another cpuset with load
> balancing turned on. This restriction is there to make sure that the
> above condition will not happen. I may be wrong if there is a realistic
> use case where the above condition is desired.

Yep, makes sense to me.

Maybe add the second condition to the comment and documentation.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
