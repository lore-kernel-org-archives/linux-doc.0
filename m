Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E48867D043
	for <lwn-linux-doc@archive.lwn.net>; Thu, 31 May 2018 08:26:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754018AbeEaI0h (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 31 May 2018 04:26:37 -0400
Received: from merlin.infradead.org ([205.233.59.134]:36412 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753957AbeEaI0f (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 31 May 2018 04:26:35 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=g8oZOuCKEcfcRxMjUHBZ+tzdwA0tlNGQQV0/o6Azeqw=; b=VZoVb2Db1S8y5usO+5eKyNhLt
        ORfC3m65/B1fQHORo5DXii2VpyrqZWmcjuO8JxcNjZZILpvjlBounbkJYI7RzwJe4v7iWrA34+Lxh
        aumZ6VhoBx/ZPIca9uuoAd1X7njLhw3Cds1oOUej8xJTxSPT4KAmCRz54WragemTCAi6TA4mOXHuf
        lfBQclwS/LeP5Ke4SXc4ss44tw8ES3A3ucIVse/p0WfIIZ8hidZX9UpyJYRmXhfxs/gv0NIWMkyTi
        8PuPMR/jLEOeVeFw2s++Pe8wSJEUBxcL0h9d1htf/0TP/p4kuOzyJ2Z99edJV2p9DXOAi4SbdyZoD
        K1XHpRz3g==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=hirez.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fOIuU-0002nF-Sd; Thu, 31 May 2018 08:26:15 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 3F5DD201EA7A4; Thu, 31 May 2018 10:26:13 +0200 (CEST)
Date:   Thu, 31 May 2018 10:26:13 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Zefan Li <lizefan@huawei.com>
Cc:     Waiman Long <longman@redhat.com>, Tejun Heo <tj@kernel.org>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Ingo Molnar <mingo@redhat.com>, cgroups@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        kernel-team@fb.com, pjt@google.com, luto@amacapital.net,
        Mike Galbraith <efault@gmx.de>, torvalds@linux-foundation.org,
        Roman Gushchin <guro@fb.com>,
        Juri Lelli <juri.lelli@redhat.com>,
        Patrick Bellasi <patrick.bellasi@arm.com>
Subject: Re: [PATCH] cpuset: Enforce that a child's cpus must be a subset of
 the parent
Message-ID: <20180531082613.GF12180@hirez.programming.kicks-ass.net>
References: <1527687991-1431-1-git-send-email-longman@redhat.com>
 <5B0F4F09.9050100@huawei.com>
 <5B0FAE72.1090204@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5B0FAE72.1090204@huawei.com>
User-Agent: Mutt/1.9.5 (2018-04-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, May 31, 2018 at 04:12:34PM +0800, Zefan Li wrote:
> On 2018/5/31 9:25, Zefan Li wrote:
> > Hi Waiman,
> > 
> > On 2018/5/30 21:46, Waiman Long wrote:
> >> It was found that the cpuset.cpus could contain CPUs that are not listed
> >> in their parent's cpu list as shown by the command sequence below:
> >>
> >>   # echo "+cpuset" >cgroup.subtree_control
> >>   # mkdir g1
> >>   # echo 0-5 >g1/cpuset.cpus
> >>   # mkdir g1/g11
> >>   # echo "+cpuset" > g1/cgroup.subtree_control
> >>   # echo 6-11 >g1/g11/cpuset.cpus
> >>   # grep -R . g1 | grep "\.cpus"
> >>   g1/cpuset.cpus:0-5
> >>   g1/cpuset.cpus.effective:0-5
> >>   g1/g11/cpuset.cpus:6-11
> >>   g1/g11/cpuset.cpus.effective:0-5
> >>
> >> As the intersection of g11's cpus and that of g1 is empty, the effective
> >> cpus of g11 is just that of g1. The check in update_cpumask() is now
> >> corrected to make sure that cpus in a child cpus must be a subset of
> >> its parent's cpus. The error "write error: Invalid argument" will now
> >> be reported in the above case.
> >>
> > 
> > We made the distinction between user-configured CPUs and effective CPUs
> > in commit 7e88291beefbb758, so actually it's not a bug.
> > 
> 
> I remember the original reason is to support restoration of the original
> cpu after cpu offline->online. We use user-configured CPUs to remember
> if the cpu should be restored in the cpuset after it's onlined.

AFAICT you can do that and still have the child a subset of the parent,
no?
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
