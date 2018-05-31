Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 2C16C7D043
	for <lwn-linux-doc@archive.lwn.net>; Thu, 31 May 2018 13:54:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1755187AbeEaNyb convert rfc822-to-8bit (ORCPT
        <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 31 May 2018 09:54:31 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:33914 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1755155AbeEaNya (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 31 May 2018 09:54:30 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id DDBA8859A3;
        Thu, 31 May 2018 13:54:29 +0000 (UTC)
Received: from llong.remote.csb (dhcp-17-81.bos.redhat.com [10.18.17.81])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 1362A2166BB6;
        Thu, 31 May 2018 13:54:28 +0000 (UTC)
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
From:   Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <42cc1f44-2355-1c0c-b575-49c863303c42@redhat.com>
Date:   Thu, 31 May 2018 09:54:27 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <20180531122638.GJ12180@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]); Thu, 31 May 2018 13:54:29 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]); Thu, 31 May 2018 13:54:29 +0000 (UTC) for IP:'10.11.54.6' DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'longman@redhat.com' RCPT:''
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 05/31/2018 08:26 AM, Peter Zijlstra wrote:
> On Tue, May 29, 2018 at 09:41:30AM -0400, Waiman Long wrote:
>> The sched.load_balance flag is needed to enable CPU isolation similar to
>> what can be done with the "isolcpus" kernel boot parameter. Its value
>> can only be changed in a scheduling domain with no child cpusets. On
>> a non-scheduling domain cpuset, the value of sched.load_balance is
>> inherited from its parent. This is to make sure that all the cpusets
>> within the same scheduling domain or partition has the same load
>> balancing state.
>>
>> This flag is set by the parent and is not delegatable.
>> +  cpuset.sched.domain_root
>> +	A read-write single value file which exists on non-root
>> +	cpuset-enabled cgroups.  It is a binary value flag that accepts
>> +	either "0" (off) or "1" (on).  This flag is set by the parent
>> +	and is not delegatable.
>> +
>> +	If set, it indicates that the current cgroup is the root of a
>> +	new scheduling domain or partition that comprises itself and
>> +	all its descendants except those that are scheduling domain
>> +	roots themselves and their descendants.  The root cgroup is
>> +	always a scheduling domain root.
>> +
>> +	There are constraints on where this flag can be set.  It can
>> +	only be set in a cgroup if all the following conditions are true.
>> +
>> +	1) The "cpuset.cpus" is not empty and the list of CPUs are
>> +	   exclusive, i.e. they are not shared by any of its siblings.
>> +	2) The parent cgroup is also a scheduling domain root.
>> +	3) There is no child cgroups with cpuset enabled.  This is
>> +	   for eliminating corner cases that have to be handled if such
>> +	   a condition is allowed.
>> +
>> +	Setting this flag will take the CPUs away from the effective
>> +	CPUs of the parent cgroup.  Once it is set, this flag cannot
>> +	be cleared if there are any child cgroups with cpuset enabled.
>> +	Further changes made to "cpuset.cpus" is allowed as long as
>> +	the first condition above is still true.
>> +
>> +	A parent scheduling domain root cgroup cannot distribute all
>> +	its CPUs to its child scheduling domain root cgroups unless
>> +	its load balancing flag is turned off.
>> +
>> +  cpuset.sched.load_balance
>> +	A read-write single value file which exists on non-root
>> +	cpuset-enabled cgroups.  It is a binary value flag that accepts
>> +	either "0" (off) or "1" (on).  This flag is set by the parent
>> +	and is not delegatable.  It is on by default in the root cgroup.
>> +
>> +	When it is on, tasks within this cpuset will be load-balanced
>> +	by the kernel scheduler.  Tasks will be moved from CPUs with
>> +	high load to other CPUs within the same cpuset with less load
>> +	periodically.
>> +
>> +	When it is off, there will be no load balancing among CPUs on
>> +	this cgroup.  Tasks will stay in the CPUs they are running on
>> +	and will not be moved to other CPUs.
>> +
>> +	The load balancing state of a cgroup can only be changed on a
>> +	scheduling domain root cgroup with no cpuset-enabled children.
>> +	All cgroups within a scheduling domain or partition must have
>> +	the same load balancing state.	As descendant cgroups of a
>> +	scheduling domain root are created, they inherit the same load
>> +	balancing state of their root.
> I still find all that a bit weird.
>
> So load_balance=0 basically changes a partition into a
> 'fully-partitioned partition' with the seemingly random side-effect that
> now sub-partitions are allowed to consume all CPUs.

Are you suggesting that we should allow sub-partition to consume all the
CPUs no matter the load balance state? I can live with that if you think
it is more logical.

> The rationale, only given in the Changelog above, seems to be to allow
> 'easy' emulation of isolcpus.
>
> I'm still not convinced this is a useful knob to have. You can do
> fully-partitioned by simply creating a lot of 1 cpu parititions.

That is certainly true. However, I think there are some additional
overhead in the scheduler side in maintaining those 1-cpu partitions. Right?

> So this one knob does two separate things, both of which seem, to me,
> redundant.
>
> Can we please get better rationale for this?

I am fine getting rid of the load_balance flag if this is the consensus.
However, we do need to come up with a good migration story for those
users that need the isolcpus capability. I think Mike was the one asking
for supporting isolcpus. So Mike, what is your take on that.

Cheers,
Longman


--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
