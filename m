Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2D3AE7D043
	for <lwn-linux-doc@archive.lwn.net>; Thu, 31 May 2018 16:17:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1755555AbeEaQRH (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 31 May 2018 12:17:07 -0400
Received: from merlin.infradead.org ([205.233.59.134]:43122 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755456AbeEaQRG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 31 May 2018 12:17:06 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=cdKVbvwESEXqP4Z0cikNCkhJRxALessOYY6fqwrdu2o=; b=Sv9E44yIj2uMOYQFtr/xm4YST
        /ErnlDx/I4MwIBL+C8g5boMAVuP0z5wsvrmcoONjM8ZxuuBLJvuwjwavAfJaUDosrqQWqLSjNXt5T
        6LbJUHWTEbUxBqNMJNAtx9qtNoReys8L9YuY7e2av9WJP4nZpYf+p6PjclZwKiAxD91cqliUiDo8m
        v2100NTvStt1k1svewEGPhwu0dSimuTNEjKB8orR2wZI3SMAsc743zDVk8BEKjb5j1CPdub+1BBC0
        VjfH/FuuZZJxeCNle2Wd2hLQptSC5e0p1SJRtSG3xG7OIvx8TL2m8TQqS/kJufXSb9Z7qaX+nWzyM
        tsOkMw0VA==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=hirez.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fOQFr-0007EO-GZ; Thu, 31 May 2018 16:16:47 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id C232B2029F86E; Thu, 31 May 2018 18:16:45 +0200 (CEST)
Date:   Thu, 31 May 2018 18:16:45 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Tejun Heo <tj@kernel.org>
Cc:     Waiman Long <longman@redhat.com>, Zefan Li <lizefan@huawei.com>,
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
Message-ID: <20180531161645.GN12180@hirez.programming.kicks-ass.net>
References: <1527687991-1431-1-git-send-email-longman@redhat.com>
 <5B0F4F09.9050100@huawei.com>
 <5B0FAE72.1090204@huawei.com>
 <20180531082613.GF12180@hirez.programming.kicks-ass.net>
 <5B0FB58C.9030705@huawei.com>
 <4dc718bc-4bd5-4998-853b-9c6ba67b89a0@redhat.com>
 <20180531155807.GU1351649@devbig577.frc2.facebook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180531155807.GU1351649@devbig577.frc2.facebook.com>
User-Agent: Mutt/1.9.5 (2018-04-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, May 31, 2018 at 08:58:07AM -0700, Tejun Heo wrote:
> Tying together what's configured and what's applied may feel
> attractive on the surface but it's a long term headache.
> 
> * It's inconsistent with what other controllers are doing.  All the
>   limit resource configs declare the upper bound the specific cgroup
>   can consume regardless of what's actually available to it.  They
>   limit but don't guarantee access.
> 
> * Which decouples a given cgroup's configurations from its ancestors',
>   which allows an ancestor to take away resources that it granted
>   before and then also giving it back later.  No matter what you do,
>   if you couple configs of cgroup hierarchy, you end up restricting
>   what an ancestor can do to its sub-hierarchy, which can quickly
>   become a difficult operational headache.
> 
> So, let's please stay away from it even if that means a bit of
> overhead in terms of interface.

Urgh, that again :/

I'm still not convinced by your arguments though. The root container can
access all the sub-groups anyway and can grub around in them to take
away resources if it really wants to.

For cpuset in particular randomly restricting on the ancestor level can
create an unrecoverable trainwreck inside a container. Affinities are
not recoverable. Once a runnable task ends up with an empty set, its
affinities are reset and the smaller (empty) set is lost.


--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
