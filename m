Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=ham autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5C9BE7D048
	for <lwn-linux-doc@archive.lwn.net>; Thu, 31 May 2018 10:54:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754311AbeEaKy3 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 31 May 2018 06:54:29 -0400
Received: from bombadil.infradead.org ([198.137.202.133]:60784 "EHLO
        bombadil.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754346AbeEaKy2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 31 May 2018 06:54:28 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=bombadil.20170209; h=In-Reply-To:Content-Type:MIME-Version
        :References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=wK3gd8V16jU2PtUbyVoCdyUhgml9RJnpgQY+XVdFtWM=; b=VpQjVAYxsuWXgZhRWPlbQHNcL
        0yP5jZQwsIbD8KUhXKXT6GyiXpEGorCaa7LhJ5YBgCWbkgiDeG8lTEZy7fp9/DBYL8pKB4mlTDMQt
        pPn7tktKg3zAGgN76RL+g95GlHqeOlFdW4KtiT7w9er10M9sIm4p5Og8AOqMrUtPk2IPVVt42SntG
        /jxE5UFN83ASlV2/FrPfiMrlZBh4521lItKDkRTygnKp4aaXaaDZ54sbtH6h9LWgsEibgTEdTX2FD
        XXxhnoB7M2GqqbfMoUrcFfZbEhhzUODw4RyTu8EuAGEt+9qsVgV7XP7Vi0ghDJ+K20jNShst5/lcX
        OoeTQr+nQ==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=hirez.programming.kicks-ass.net)
        by bombadil.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fOLDm-0000h9-G1; Thu, 31 May 2018 10:54:18 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id 70D9A202ACE62; Thu, 31 May 2018 12:54:16 +0200 (CEST)
Date:   Thu, 31 May 2018 12:54:16 +0200
From:   Peter Zijlstra <peterz@infradead.org>
To:     Waiman Long <longman@redhat.com>
Cc:     Tejun Heo <tj@kernel.org>, Li Zefan <lizefan@huawei.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Ingo Molnar <mingo@redhat.com>, cgroups@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        kernel-team@fb.com, pjt@google.com, luto@amacapital.net,
        Mike Galbraith <efault@gmx.de>, torvalds@linux-foundation.org,
        Roman Gushchin <guro@fb.com>,
        Juri Lelli <juri.lelli@redhat.com>,
        Patrick Bellasi <patrick.bellasi@arm.com>
Subject: Re: [PATCH v9 3/7] cpuset: Add cpuset.sched.load_balance flag to v2
Message-ID: <20180531105416.GI12180@hirez.programming.kicks-ass.net>
References: <1527601294-3444-1-git-send-email-longman@redhat.com>
 <1527601294-3444-4-git-send-email-longman@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1527601294-3444-4-git-send-email-longman@redhat.com>
User-Agent: Mutt/1.9.5 (2018-04-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, May 29, 2018 at 09:41:30AM -0400, Waiman Long wrote:

> +  cpuset.sched.load_balance
> +	A read-write single value file which exists on non-root
> +	cpuset-enabled cgroups.  It is a binary value flag that accepts
> +	either "0" (off) or "1" (on).  This flag is set by the parent
> +	and is not delegatable.  It is on by default in the root cgroup.
> +
> +	When it is on, tasks within this cpuset will be load-balanced
> +	by the kernel scheduler.  Tasks will be moved from CPUs with
> +	high load to other CPUs within the same cpuset with less load
> +	periodically.
> +
> +	When it is off, there will be no load balancing among CPUs on
> +	this cgroup.  Tasks will stay in the CPUs they are running on
> +	and will not be moved to other CPUs.

That is not entirely accurate I'm afraid (unless the patch makes it so,
I've yet to check). When you disable load-balancing on a cgroup you'll
get whatever balancing is left for the partition you happen to end up
in.

Take for instance workqueue thingies, they use kthread_bind_mask()
(IIRC) and thus end up with PF_NO_SETAFFINITY so cpusets (or any other
cgroups really) do not have effect on them (long standing complaint).

So take for instance the unbound numa enabled workqueue threads, those
will land in whatever partition and get balanced there.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
