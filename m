Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5C0F97D048
	for <lwn-linux-doc@archive.lwn.net>; Thu, 31 May 2018 16:42:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1755866AbeEaQm2 convert rfc822-to-8bit (ORCPT
        <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 31 May 2018 12:42:28 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:59190 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1755806AbeEaQmZ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 31 May 2018 12:42:25 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 387EB76F91;
        Thu, 31 May 2018 16:42:24 +0000 (UTC)
Received: from llong.remote.csb (dhcp-17-81.bos.redhat.com [10.18.17.81])
        by smtp.corp.redhat.com (Postfix) with ESMTP id A14B163AF9;
        Thu, 31 May 2018 16:42:20 +0000 (UTC)
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
 <ebe7f0c1-b2dc-57ad-e5cb-7edf0fee4626@redhat.com>
 <20180531160857.GM12180@hirez.programming.kicks-ass.net>
From:   Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <54c607c3-e742-4da9-c89a-4ed54146e3bd@redhat.com>
Date:   Thu, 31 May 2018 12:42:20 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <20180531160857.GM12180@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]); Thu, 31 May 2018 16:42:24 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]); Thu, 31 May 2018 16:42:24 +0000 (UTC) for IP:'10.11.54.5' DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'longman@redhat.com' RCPT:''
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 05/31/2018 12:08 PM, Peter Zijlstra wrote:
> On Thu, May 31, 2018 at 11:36:39AM -0400, Waiman Long wrote:
>>> I'm on the fence myself; the only thing I'm fairly sure of is that tying
>>> this particular behaviour to the load-balance knob seems off.
>> The main reason for doing it this way is that I don't want to have
>> load-balanced partition with no cpu in it. How about we just don't allow
>> consume-all at all. Each partition must have at least 1 cpu.
> I suspect that might be sufficient. It certainly is for the use-cases
> I'm aware of. You always want a system/control set which runs the
> regular busy work of running a system.
>
> Then you have one (or more) partitions to run your 'important' work.

Good. I will make the change in the next version.

>
>>> I also think we should not mix the 'consume all' thing with the
>>> 'fully-partitioned' thing, as they are otherwise unrelated.
>> The "consume all" and "fully-partitioned" look the same to me. Are you
>> talking about allocating all the CPUs in a partition to sub-partitions
>> so that there is no CPU left in the parent partition?
> Not sure what you're asking. "consume all" is allowing sub-partitions to
> allocate all CPUs of the parent, such that there are none left.
>
> "fully-partitioned" is N cpus but no load-balancing, also equivalent to
> N 1 CPU parititions.

Thanks for the clarification.

> They are distinct things. Disabling load-balancing should not affect how
> many CPUs can be allocated to sub-partitions, the moment you hit 1 CPU
> the load balancing is effectively off already. Going down to 0 CPUs
> isn't a problem for the load-balancer, it wasn't doing anything anyway.
>
> So the question is if someone really needs the one partition without
> balancing over N separate paritions.

Thinking about isolcpus emulation, I now realize that it is more than
just disabling load balancing. it also disables some kernel threads like
kworker from running so that an userspace application can monopolize as
much of a cpu as possible. Disabling kernel threads from running isn't
that hard if it is only done once at boot time. it is trickier if we
have to do it at run time.

Without good isolcpus emulation, disabling load balance kind of loses
its usefulness. So I am going to take out the load_balance flag for now
unless I hear objection otherwise.

Cheers,
Longman



--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
