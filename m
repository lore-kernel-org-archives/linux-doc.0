Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 108827D043
	for <lwn-linux-doc@archive.lwn.net>; Thu, 31 May 2018 08:41:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754061AbeEaIll (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 31 May 2018 04:41:41 -0400
Received: from mail-wr0-f194.google.com ([209.85.128.194]:37103 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754028AbeEaIlj (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 31 May 2018 04:41:39 -0400
Received: by mail-wr0-f194.google.com with SMTP id d8-v6so925009wro.4
        for <linux-doc@vger.kernel.org>; Thu, 31 May 2018 01:41:38 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=UKvWDWHgVQ2AfQOJHBwGA0BOP/lGvXy7MSRlSb+NqFg=;
        b=Q8hxFi5fckhA+UKYMJNtbXPrI3G7lWimge1TicZCwA7WUQlVl+M5aYazqBroTCof9O
         9B2cVRJtf4VNuTBPbb8IJfXV13FJ/v8StA0QcUamzafQVUgM4tTn93dOhpe8ei/SS2Fh
         sXRLk3sFgNUbnCBxzGzjzM/gvu6caWirmq4s0l4QzoHVP7m8ZtCp5+EoAd/RI8xxTMae
         +VAm4mUUOjok6tsVdNFZuiiuRGFfsVk/RsZ45TaKfMFZk8L5qmwWeW+uD82RJ6iyRorS
         Dg54l9ktiGPP7T/VtWjCYedaAsI+Wiaa6mTc5wyvTMDUW88jTKPENCYgipsqZ5PFtw7Z
         CVmQ==
X-Gm-Message-State: ALKqPwfbiX5kMQQIHRwM0TpgBW5k5j1jSFCkrHnWvtFSkniBbLZ2v6A2
        Bgvfy0jn345boRNB4fi2B7gq/Q==
X-Google-Smtp-Source: ADUXVKI3xYUetrHjfusQDohYG0knYSgHy9zXELSZy2xDyO/phYZP2uYsiyXHdbJgYNlD+294i8iPrg==
X-Received: by 2002:adf:a690:: with SMTP id t16-v6mr4712589wrc.1.1527756098064;
        Thu, 31 May 2018 01:41:38 -0700 (PDT)
Received: from localhost.localdomain ([151.15.207.242])
        by smtp.gmail.com with ESMTPSA id v15-v6sm564039wmf.47.2018.05.31.01.41.36
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Thu, 31 May 2018 01:41:37 -0700 (PDT)
Date:   Thu, 31 May 2018 10:41:34 +0200
From:   Juri Lelli <juri.lelli@redhat.com>
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Zefan Li <lizefan@huawei.com>, Waiman Long <longman@redhat.com>,
        Tejun Heo <tj@kernel.org>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Ingo Molnar <mingo@redhat.com>, cgroups@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        kernel-team@fb.com, pjt@google.com, luto@amacapital.net,
        Mike Galbraith <efault@gmx.de>, torvalds@linux-foundation.org,
        Roman Gushchin <guro@fb.com>,
        Patrick Bellasi <patrick.bellasi@arm.com>
Subject: Re: [PATCH] cpuset: Enforce that a child's cpus must be a subset of
 the parent
Message-ID: <20180531084134.GA17937@localhost.localdomain>
References: <1527687991-1431-1-git-send-email-longman@redhat.com>
 <5B0F4F09.9050100@huawei.com>
 <5B0FAE72.1090204@huawei.com>
 <20180531082613.GF12180@hirez.programming.kicks-ass.net>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180531082613.GF12180@hirez.programming.kicks-ass.net>
User-Agent: Mutt/1.9.2 (2017-12-15)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 31/05/18 10:26, Peter Zijlstra wrote:
> On Thu, May 31, 2018 at 04:12:34PM +0800, Zefan Li wrote:
> > On 2018/5/31 9:25, Zefan Li wrote:
> > > Hi Waiman,
> > > 
> > > On 2018/5/30 21:46, Waiman Long wrote:
> > >> It was found that the cpuset.cpus could contain CPUs that are not listed
> > >> in their parent's cpu list as shown by the command sequence below:
> > >>
> > >>   # echo "+cpuset" >cgroup.subtree_control
> > >>   # mkdir g1
> > >>   # echo 0-5 >g1/cpuset.cpus
> > >>   # mkdir g1/g11
> > >>   # echo "+cpuset" > g1/cgroup.subtree_control
> > >>   # echo 6-11 >g1/g11/cpuset.cpus
> > >>   # grep -R . g1 | grep "\.cpus"
> > >>   g1/cpuset.cpus:0-5
> > >>   g1/cpuset.cpus.effective:0-5
> > >>   g1/g11/cpuset.cpus:6-11
> > >>   g1/g11/cpuset.cpus.effective:0-5
> > >>
> > >> As the intersection of g11's cpus and that of g1 is empty, the effective
> > >> cpus of g11 is just that of g1. The check in update_cpumask() is now
> > >> corrected to make sure that cpus in a child cpus must be a subset of
> > >> its parent's cpus. The error "write error: Invalid argument" will now
> > >> be reported in the above case.
> > >>
> > > 
> > > We made the distinction between user-configured CPUs and effective CPUs
> > > in commit 7e88291beefbb758, so actually it's not a bug.
> > > 
> > 
> > I remember the original reason is to support restoration of the original
> > cpu after cpu offline->online. We use user-configured CPUs to remember
> > if the cpu should be restored in the cpuset after it's onlined.
> 
> AFAICT you can do that and still have the child a subset of the parent,
> no?

Plus this is not hotplug, but a user decision. It could make sense to
keep .cpus unmodified after hotplug events, but does it make sense to
let the user be able to choose cpus outside the parent domain?
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
