Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5E6A87E69D
	for <lwn-linux-doc@archive.lwn.net>; Wed,  2 May 2018 13:36:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751503AbeEBN35 convert rfc822-to-8bit (ORCPT
        <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 2 May 2018 09:29:57 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:39842 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1750930AbeEBN34 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 2 May 2018 09:29:56 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id A9F58EFDFA;
        Wed,  2 May 2018 13:29:55 +0000 (UTC)
Received: from llong.remote.csb (dhcp-17-164.bos.redhat.com [10.18.17.164])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 50C6B2024CA1;
        Wed,  2 May 2018 13:29:54 +0000 (UTC)
Subject: Re: [PATCH v7 2/5] cpuset: Add cpuset.sched_load_balance to v2
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Tejun Heo <tj@kernel.org>, Li Zefan <lizefan@huawei.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Ingo Molnar <mingo@redhat.com>, cgroups@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        kernel-team@fb.com, pjt@google.com, luto@amacapital.net,
        Mike Galbraith <efault@gmx.de>, torvalds@linux-foundation.org,
        Roman Gushchin <guro@fb.com>,
        Juri Lelli <juri.lelli@redhat.com>
References: <1524145624-23655-1-git-send-email-longman@redhat.com>
 <1524145624-23655-3-git-send-email-longman@redhat.com>
 <20180502102416.GJ12180@hirez.programming.kicks-ass.net>
From:   Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <14d7604c-1254-1146-e2b6-23f4cc020b34@redhat.com>
Date:   Wed, 2 May 2018 09:29:54 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <20180502102416.GJ12180@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]); Wed, 02 May 2018 13:29:55 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]); Wed, 02 May 2018 13:29:55 +0000 (UTC) for IP:'10.11.54.4' DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'longman@redhat.com' RCPT:''
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 05/02/2018 06:24 AM, Peter Zijlstra wrote:
> On Thu, Apr 19, 2018 at 09:47:01AM -0400, Waiman Long wrote:
>> +  cpuset.sched_load_balance
>> +	A read-write single value file which exists on non-root cgroups.
> Uhhm.. it should very much exist in the root group too. Otherwise you
> cannot disable it there, which is required to allow smaller groups to
> load-balance between themselves.
>
>> +	The default is "1" (on), and the other possible value is "0"
>> +	(off).
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
>> +	This flag is hierarchical and is inherited by child cpusets. It
>> +	can be turned off only when the CPUs in this cpuset aren't
>> +	listed in the cpuset.cpus of other sibling cgroups, and all
>> +	the child cpusets, if present, have this flag turned off.
>> +
>> +	Once it is off, it cannot be turned back on as long as the
>> +	parent cgroup still has this flag in the off state.
> That too is wrong and broken. You explicitly want to turn it on for
> children.
>
> So the idea is that you can have:
>
> 		R
> 	      /   \
>             A       B
>
> With:
>
> 	R cpus=0-3, load_balance=0
> 	A cpus=0-1, load_balance=1
> 	B cpus=2-3, load_balance=1
>
> Which will allow all tasks in A,B (and its children) to load-balance
> across 0-1 or 2-3 resp.
>
> If you don't allow the root group to disable load_balance, it will
> always be the largest group and load-balancing will always happen system
> wide.

If you look at the remaining patches in the series, I was proposing a
different way to support isolcpus and separate sched domains with
turning off load balancing in the root cgroup.

For me, it doesn't feel right to have load balancing disabled in the
root cgroup as we probably cannot move all the tasks away from the root
cgroup anyway. I am going to update the current patchset to incorporate
suggestion from Tejun. It will probably be ready sometime next week.

Cheers,
Longman


--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
