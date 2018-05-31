Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 947947D043
	for <lwn-linux-doc@archive.lwn.net>; Thu, 31 May 2018 08:43:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754072AbeEaInG (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 31 May 2018 04:43:06 -0400
Received: from szxga06-in.huawei.com ([45.249.212.32]:42762 "EHLO huawei.com"
        rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S1754023AbeEaInF (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 31 May 2018 04:43:05 -0400
Received: from DGGEMS409-HUB.china.huawei.com (unknown [172.30.72.58])
        by Forcepoint Email with ESMTP id 367384F07F3BD;
        Thu, 31 May 2018 16:43:01 +0800 (CST)
Received: from [10.177.19.236] (10.177.19.236) by smtp.huawei.com
 (10.3.19.209) with Microsoft SMTP Server (TLS) id 14.3.382.0; Thu, 31 May
 2018 16:42:59 +0800
Subject: Re: [PATCH] cpuset: Enforce that a child's cpus must be a subset of
 the parent
To:     Peter Zijlstra <peterz@infradead.org>
References: <1527687991-1431-1-git-send-email-longman@redhat.com>
 <5B0F4F09.9050100@huawei.com> <5B0FAE72.1090204@huawei.com>
 <20180531082613.GF12180@hirez.programming.kicks-ass.net>
CC:     Waiman Long <longman@redhat.com>, Tejun Heo <tj@kernel.org>,
        "Johannes Weiner" <hannes@cmpxchg.org>,
        Ingo Molnar <mingo@redhat.com>, <cgroups@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, <linux-doc@vger.kernel.org>,
        <kernel-team@fb.com>, <pjt@google.com>, <luto@amacapital.net>,
        Mike Galbraith <efault@gmx.de>,
        <torvalds@linux-foundation.org>, Roman Gushchin <guro@fb.com>,
        Juri Lelli <juri.lelli@redhat.com>,
        Patrick Bellasi <patrick.bellasi@arm.com>
From:   Zefan Li <lizefan@huawei.com>
Message-ID: <5B0FB58C.9030705@huawei.com>
Date:   Thu, 31 May 2018 16:42:52 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
 Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <20180531082613.GF12180@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.19.236]
X-CFilter-Loop: Reflected
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 2018/5/31 16:26, Peter Zijlstra wrote:
> On Thu, May 31, 2018 at 04:12:34PM +0800, Zefan Li wrote:
>> On 2018/5/31 9:25, Zefan Li wrote:
>>> Hi Waiman,
>>>
>>> On 2018/5/30 21:46, Waiman Long wrote:
>>>> It was found that the cpuset.cpus could contain CPUs that are not listed
>>>> in their parent's cpu list as shown by the command sequence below:
>>>>
>>>>   # echo "+cpuset" >cgroup.subtree_control
>>>>   # mkdir g1
>>>>   # echo 0-5 >g1/cpuset.cpus
>>>>   # mkdir g1/g11
>>>>   # echo "+cpuset" > g1/cgroup.subtree_control
>>>>   # echo 6-11 >g1/g11/cpuset.cpus
>>>>   # grep -R . g1 | grep "\.cpus"
>>>>   g1/cpuset.cpus:0-5
>>>>   g1/cpuset.cpus.effective:0-5
>>>>   g1/g11/cpuset.cpus:6-11
>>>>   g1/g11/cpuset.cpus.effective:0-5
>>>>
>>>> As the intersection of g11's cpus and that of g1 is empty, the effective
>>>> cpus of g11 is just that of g1. The check in update_cpumask() is now
>>>> corrected to make sure that cpus in a child cpus must be a subset of
>>>> its parent's cpus. The error "write error: Invalid argument" will now
>>>> be reported in the above case.
>>>>
>>>
>>> We made the distinction between user-configured CPUs and effective CPUs
>>> in commit 7e88291beefbb758, so actually it's not a bug.
>>>
>>
>> I remember the original reason is to support restoration of the original
>> cpu after cpu offline->online. We use user-configured CPUs to remember
>> if the cpu should be restored in the cpuset after it's onlined.
> 
> AFAICT you can do that and still have the child a subset of the parent,
> no?
> .

Sure. IIRC this was suggested by Tejun as he had done something similar to devcgroup.

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
