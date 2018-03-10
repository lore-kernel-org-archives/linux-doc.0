Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.7 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,RCVD_IN_DNSWL_HI,T_DKIM_INVALID,
	T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E6B157E6B5
	for <lwn-linux-doc@archive.lwn.net>; Sat, 10 Mar 2018 13:20:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932858AbeCJNRA (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Sat, 10 Mar 2018 08:17:00 -0500
Received: from bombadil.infradead.org ([198.137.202.133]:39844 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932130AbeCJNQ7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 10 Mar 2018 08:16:59 -0500
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=yD3G8mTXjU0b7ycsLVYnXALPUmH4/XVvwugFZ6Ka4CA=; b=Xm5mbCmhuJ0JZmJYyE3TGxHGN
        ZuOnRbgemhy6gMshHekJ1zEKA5wYOh2UmaY/ZQKcTUjM3nsAeE0mT03cWAnQ8SduEUnsk2KqaZaYK
        bx0vXlz8FO85h0fvfZ9/s+cl7BQH58Bv0tFvD93Qk/eHBp4mknpiunIrTFu9gUr2bSZ6ts9JjSzSC
        R/d7yIzsW0ajdQ60faBXRtc/rrNXIAByxtQXDM2QpmgF0dc6jIpVXkieor5ccdufhVNLi7wgq03xK
        7oIfvthSXfp0++3F/INfOL08uBF45tFOW0PgeKSR+yCB1+bzh/sPP0l+6LlbP/wvTyk66D14gzK1U
        TfaBdUG6A==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=hirez.programming.kicks-ass.net)
        by bombadil.infradead.org with esmtpsa (Exim 4.89 #1 (Red Hat Linux))
        id 1eueMk-0001h7-7y; Sat, 10 Mar 2018 13:16:50 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 3A2A42029FA14; Sat, 10 Mar 2018 14:16:47 +0100 (CET)
Date:   Sat, 10 Mar 2018 14:16:47 +0100
From:   Peter Zijlstra <peterz@infradead.org>
To:     Waiman Long <longman@redhat.com>
Cc:     Mike Galbraith <efault@gmx.de>, Tejun Heo <tj@kernel.org>,
        Li Zefan <lizefan@huawei.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Ingo Molnar <mingo@redhat.com>, cgroups@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        kernel-team@fb.com, pjt@google.com, luto@amacapital.net,
        torvalds@linux-foundation.org, Roman Gushchin <guro@fb.com>
Subject: Re: [PATCH v4] cpuset: Enable cpuset controller in default hierarchy
Message-ID: <20180310131647.GB4043@hirez.programming.kicks-ass.net>
References: <1520609707-16582-1-git-send-email-longman@redhat.com>
 <1520613285.12489.36.camel@gmx.de>
 <1c3fe7b0-2600-c46d-1527-d3aaf024bb91@redhat.com>
 <1520619426.27998.18.camel@gmx.de>
 <55809fe4-98ba-5566-86ed-457acfef0e1c@redhat.com>
 <1520624424.27998.76.camel@gmx.de>
 <53de9683-01b7-bac4-8b70-dc1f93ede600@redhat.com>
 <20180309221736.GB5926@hirez.programming.kicks-ass.net>
 <f0fca497-e4e7-3dbd-1e5c-a7f502c05dcb@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <f0fca497-e4e7-3dbd-1e5c-a7f502c05dcb@redhat.com>
User-Agent: Mutt/1.9.3 (2018-01-21)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Mar 09, 2018 at 06:06:29PM -0500, Waiman Long wrote:
> So you are talking about sched_relax_domain_level and

That one I wouldn't be sad to see the back of.

> sched_load_balance.

This one, that's critical. And this is the perfect time to try and fix
the whole isolcpus issue.

The primary issue is that to make equivalent functionality available
through cpuset, we need to basically start all tasks outside the root
group.

The equivalent of isolcpus=xxx is a cgroup setup like:

        root
	/  \
  system    other

Where other has the @xxx cpus and system the remainder and
root.sched_load_balance = 0.

Back before cgroups (and the new workqueue stuff), we could've started
everything in the !root group, no worry. But now that doesn't work,
because a bunch of controllers can't deal with that and everything
cgroup expects the cgroupfs to be empty on boot.

It's one of my biggest regrets that I didn't 'fix' this before cgroups
came along.

> I have not removed any bits. I just haven't exposed
> them yet. It does seem like these 2 control knobs are useful from the
> scheduling perspective. Do we also need cpu_exclusive or just the two
> sched control knobs are enough?

I always forget if we need exclusive for load_balance to work; I'll
peruse the document/code.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
