Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 1C7A27D048
	for <lwn-linux-doc@archive.lwn.net>; Thu, 31 May 2018 15:36:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1755459AbeEaPgr convert rfc822-to-8bit (ORCPT
        <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 31 May 2018 11:36:47 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:50264 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1755421AbeEaPgq (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 31 May 2018 11:36:46 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id A025C805A530;
        Thu, 31 May 2018 15:36:45 +0000 (UTC)
Received: from llong.remote.csb (dhcp-17-81.bos.redhat.com [10.18.17.81])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E127E100295E;
        Thu, 31 May 2018 15:36:39 +0000 (UTC)
Subject: Re: [PATCH v9 3/7] cpuset: Add cpuset.sched.load_balance flag to v2
To:     Peter Zijlstra <peterz@infradead.org>
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
References: <1527601294-3444-1-git-send-email-longman@redhat.com>
 <1527601294-3444-4-git-send-email-longman@redhat.com>
 <20180531122638.GJ12180@hirez.programming.kicks-ass.net>
 <42cc1f44-2355-1c0c-b575-49c863303c42@redhat.com>
 <20180531152050.GK12180@hirez.programming.kicks-ass.net>
From:   Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <ebe7f0c1-b2dc-57ad-e5cb-7edf0fee4626@redhat.com>
Date:   Thu, 31 May 2018 11:36:39 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <20180531152050.GK12180@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]); Thu, 31 May 2018 15:36:45 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.8]); Thu, 31 May 2018 15:36:45 +0000 (UTC) for IP:'10.11.54.3' DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'longman@redhat.com' RCPT:''
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 05/31/2018 11:20 AM, Peter Zijlstra wrote:
> On Thu, May 31, 2018 at 09:54:27AM -0400, Waiman Long wrote:
>> On 05/31/2018 08:26 AM, Peter Zijlstra wrote:
>>> I still find all that a bit weird.
>>>
>>> So load_balance=0 basically changes a partition into a
>>> 'fully-partitioned partition' with the seemingly random side-effect that
>>> now sub-partitions are allowed to consume all CPUs.
>> Are you suggesting that we should allow sub-partition to consume all the
>> CPUs no matter the load balance state? I can live with that if you think
>> it is more logical.
> I'm on the fence myself; the only thing I'm fairly sure of is that tying
> this particular behaviour to the load-balance knob seems off.

The main reason for doing it this way is that I don't want to have
load-balanced partition with no cpu in it. How about we just don't allow
consume-all at all. Each partition must have at least 1 cpu.

>
>>> The rationale, only given in the Changelog above, seems to be to allow
>>> 'easy' emulation of isolcpus.
>>>
>>> I'm still not convinced this is a useful knob to have. You can do
>>> fully-partitioned by simply creating a lot of 1 cpu parititions.
>> That is certainly true. However, I think there are some additional
>> overhead in the scheduler side in maintaining those 1-cpu partitions. Right?
> cpuset-controller as such doesn't have much overhead scheduler wise,
> cpu-controller OTOH does, and there depth is the predominant factor, so
> many sibling groups should not matter there either.
>
>>> So this one knob does two separate things, both of which seem, to me,
>>> redundant.
>>>
>>> Can we please get better rationale for this?
>> I am fine getting rid of the load_balance flag if this is the consensus.
>> However, we do need to come up with a good migration story for those
>> users that need the isolcpus capability. I think Mike was the one asking
>> for supporting isolcpus. So Mike, what is your take on that.
> So I don't strictly mind having a knob that does the 'fully-partitioned
> partition' thing -- however odd that sounds -- but I feel we should have
> a solid use-case for it.
>
> I also think we should not mix the 'consume all' thing with the
> 'fully-partitioned' thing, as they are otherwise unrelated.

The "consume all" and "fully-partitioned" look the same to me. Are you
talking about allocating all the CPUs in a partition to sub-partitions
so that there is no CPU left in the parent partition?

Cheers,
Longman


--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
