Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 711DD7D085
	for <lwn-linux-doc@archive.lwn.net>; Thu, 24 May 2018 15:11:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S970749AbeEXPJ1 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Thu, 24 May 2018 11:09:27 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:57140 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S967928AbeEXPJ0 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Thu, 24 May 2018 11:09:26 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id F1C97406E974;
        Thu, 24 May 2018 15:09:25 +0000 (UTC)
Received: from llong.remote.csb (dhcp-17-81.bos.redhat.com [10.18.17.81])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 976A7111762D;
        Thu, 24 May 2018 15:09:22 +0000 (UTC)
Subject: Re: [PATCH v8 3/6] cpuset: Add cpuset.sched.load_balance flag to v2
To:     Juri Lelli <juri.lelli@redhat.com>
Cc:     Tejun Heo <tj@kernel.org>, Li Zefan <lizefan@huawei.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, cgroups@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        kernel-team@fb.com, pjt@google.com, luto@amacapital.net,
        Mike Galbraith <efault@gmx.de>, torvalds@linux-foundation.org,
        Roman Gushchin <guro@fb.com>
References: <1526590545-3350-1-git-send-email-longman@redhat.com>
 <1526590545-3350-4-git-send-email-longman@redhat.com>
 <20180524143614.GC3948@localhost.localdomain>
From:   Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <4bd31510-4f73-e263-8dc1-5edb0fe63b59@redhat.com>
Date:   Thu, 24 May 2018 11:09:22 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <20180524143614.GC3948@localhost.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]); Thu, 24 May 2018 15:09:26 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]); Thu, 24 May 2018 15:09:26 +0000 (UTC) for IP:'10.11.54.3' DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'longman@redhat.com' RCPT:''
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 05/24/2018 10:36 AM, Juri Lelli wrote:
> On 17/05/18 16:55, Waiman Long wrote:
>
> [...]
>
>> +	A parent cgroup cannot distribute all its CPUs to child
>> +	scheduling domain cgroups unless its load balancing flag is
>> +	turned off.
>> +
>> +  cpuset.sched.load_balance
>> +	A read-write single value file which exists on non-root
>> +	cpuset-enabled cgroups.  It is a binary value flag that accepts
>> +	either "0" (off) or a non-zero value (on).  This flag is set
>> +	by the parent and is not delegatable.
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
>> +	The initial value of this flag is "1".	This flag is then
>> +	inherited by child cgroups with cpuset enabled.  Its state
>> +	can only be changed on a scheduling domain cgroup with no
>> +	cpuset-enabled children.
> [...]
>
>> +	/*
>> +	 * On default hierachy, a load balance flag change is only allowed
>> +	 * in a scheduling domain with no child cpuset.
>> +	 */
>> +	if (cgroup_subsys_on_dfl(cpuset_cgrp_subsys) && balance_flag_changed &&
>> +	   (!is_sched_domain(cs) || css_has_online_children(&cs->css))) {
>> +		err = -EINVAL;
>> +		goto out;
>> +	}
> The rule is actually
>
>  - no child cpuset
>  - and it must be a scheduling domain
>
> Right?

Yes, because it doesn't make sense to have a cpu in one cpuset that has
loading balance off while, at the same time, in another cpuset with load
balancing turned on. This restriction is there to make sure that the
above condition will not happen. I may be wrong if there is a realistic
use case where the above condition is desired.

-Longman


--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
