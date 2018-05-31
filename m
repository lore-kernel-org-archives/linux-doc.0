Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.6 required=5.0 tests=DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,
	T_DKIM_INVALID autolearn=unavailable autolearn_force=no version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 702D27D08C
	for <lwn-linux-doc@archive.lwn.net>; Thu, 31 May 2018 15:21:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1755441AbeEaPVS (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 31 May 2018 11:21:18 -0400
Received: from merlin.infradead.org ([205.233.59.134]:42482 "EHLO
        merlin.infradead.org" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755423AbeEaPVR (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 31 May 2018 11:21:17 -0400
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=merlin.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
        Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Id:
        List-Help:List-Unsubscribe:List-Subscribe:List-Post:List-Owner:List-Archive;
         bh=jXCVriBrw+jgBebtJ3nvyzGSmm5H9oe+RRwRKNOGFCM=; b=quzLe2oaV41JQ4YrGn9qNZKSA
        8bwthqtWAUYuvlmF7OolCvxzntqF9qhnFO8Xhw2vkW/JIzga+WoUwN9j6XdVJzZmVmUfCqkDnq02P
        xkMf93IDbC5cn/LboGYrZAtMJYSfaGzMDUHtb8cqQV/QS29nbwzAFuvIpVyD9ZD9aqeJmzPYxoS1n
        ScNSEvW6PXulwtLR8XoJROmn94wmNjzpQDwAWpBBOFL7U0ujOTzfospeGxn/bzx3s0cYkFtM5WoNg
        Yvdkxw4e1kjJSFg5IWseS9mDAUFHPhoA7EWX6fPmk6hDaogI9h7avyPbiUKOaRuOa6iXqZgdi+jrB
        2PjE1g9xg==;
Received: from j217100.upc-j.chello.nl ([24.132.217.100] helo=hirez.programming.kicks-ass.net)
        by merlin.infradead.org with esmtpsa (Exim 4.90_1 #2 (Red Hat Linux))
        id 1fOPNl-0006yk-U3; Thu, 31 May 2018 15:20:54 +0000
Received: by hirez.programming.kicks-ass.net (Postfix, from userid 1000)
        id DCA7C201EA7A1; Thu, 31 May 2018 17:20:50 +0200 (CEST)
Date:   Thu, 31 May 2018 17:20:50 +0200
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
        Patrick Bellasi <patrick.bellasi@arm.com>,
        Thomas Gleixner <tglx@linutronix.de>
Subject: Re: [PATCH v9 3/7] cpuset: Add cpuset.sched.load_balance flag to v2
Message-ID: <20180531152050.GK12180@hirez.programming.kicks-ass.net>
References: <1527601294-3444-1-git-send-email-longman@redhat.com>
 <1527601294-3444-4-git-send-email-longman@redhat.com>
 <20180531122638.GJ12180@hirez.programming.kicks-ass.net>
 <42cc1f44-2355-1c0c-b575-49c863303c42@redhat.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <42cc1f44-2355-1c0c-b575-49c863303c42@redhat.com>
User-Agent: Mutt/1.9.5 (2018-04-13)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, May 31, 2018 at 09:54:27AM -0400, Waiman Long wrote:
> On 05/31/2018 08:26 AM, Peter Zijlstra wrote:

> > I still find all that a bit weird.
> >
> > So load_balance=0 basically changes a partition into a
> > 'fully-partitioned partition' with the seemingly random side-effect that
> > now sub-partitions are allowed to consume all CPUs.
> 
> Are you suggesting that we should allow sub-partition to consume all the
> CPUs no matter the load balance state? I can live with that if you think
> it is more logical.

I'm on the fence myself; the only thing I'm fairly sure of is that tying
this particular behaviour to the load-balance knob seems off.

> > The rationale, only given in the Changelog above, seems to be to allow
> > 'easy' emulation of isolcpus.
> >
> > I'm still not convinced this is a useful knob to have. You can do
> > fully-partitioned by simply creating a lot of 1 cpu parititions.
> 
> That is certainly true. However, I think there are some additional
> overhead in the scheduler side in maintaining those 1-cpu partitions. Right?

cpuset-controller as such doesn't have much overhead scheduler wise,
cpu-controller OTOH does, and there depth is the predominant factor, so
many sibling groups should not matter there either.

> > So this one knob does two separate things, both of which seem, to me,
> > redundant.
> >
> > Can we please get better rationale for this?
> 
> I am fine getting rid of the load_balance flag if this is the consensus.
> However, we do need to come up with a good migration story for those
> users that need the isolcpus capability. I think Mike was the one asking
> for supporting isolcpus. So Mike, what is your take on that.

So I don't strictly mind having a knob that does the 'fully-partitioned
partition' thing -- however odd that sounds -- but I feel we should have
a solid use-case for it.

I also think we should not mix the 'consume all' thing with the
'fully-partitioned' thing, as they are otherwise unrelated.
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
