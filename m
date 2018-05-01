Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id A4E817E27B
	for <lwn-linux-doc@archive.lwn.net>; Tue,  1 May 2018 20:34:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751055AbeEAUdt convert rfc822-to-8bit (ORCPT
        <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 1 May 2018 16:33:49 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:51014 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751027AbeEAUdr (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 1 May 2018 16:33:47 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 66B4D406E970;
        Tue,  1 May 2018 20:33:46 +0000 (UTC)
Received: from llong.remote.csb (dhcp-17-164.bos.redhat.com [10.18.17.164])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 2E7E0215CDA7;
        Tue,  1 May 2018 20:33:45 +0000 (UTC)
Subject: Re: [PATCH v7 4/5] cpuset: Restrict load balancing off cpus to subset
 of cpus.isolated
To:     Tejun Heo <tj@kernel.org>
Cc:     Li Zefan <lizefan@huawei.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, cgroups@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        kernel-team@fb.com, pjt@google.com, luto@amacapital.net,
        Mike Galbraith <efault@gmx.de>, torvalds@linux-foundation.org,
        Roman Gushchin <guro@fb.com>,
        Juri Lelli <juri.lelli@redhat.com>
References: <1524145624-23655-1-git-send-email-longman@redhat.com>
 <1524145624-23655-5-git-send-email-longman@redhat.com>
 <20180501195148.GC2368884@devbig577.frc2.facebook.com>
From:   Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <9eb2c45e-e71e-61ef-aa6d-b8124b739cdf@redhat.com>
Date:   Tue, 1 May 2018 16:33:45 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <20180501195148.GC2368884@devbig577.frc2.facebook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]); Tue, 01 May 2018 20:33:46 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]); Tue, 01 May 2018 20:33:46 +0000 (UTC) for IP:'10.11.54.6' DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'longman@redhat.com' RCPT:''
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 05/01/2018 03:51 PM, Tejun Heo wrote:
> Hello, Waiman.
>
> Sorry about the delay.
>
> On Thu, Apr 19, 2018 at 09:47:03AM -0400, Waiman Long wrote:
>> With the addition of "cpuset.cpus.isolated", it makes sense to add the
>> restriction that load balancing can only be turned off if the CPUs in
>> the isolated cpuset are subset of "cpuset.cpus.isolated".
>>
>> Signed-off-by: Waiman Long <longman@redhat.com>
>> ---
>>  Documentation/cgroup-v2.txt |  7 ++++---
>>  kernel/cgroup/cpuset.c      | 29 ++++++++++++++++++++++++++---
>>  2 files changed, 30 insertions(+), 6 deletions(-)
>>
>> diff --git a/Documentation/cgroup-v2.txt b/Documentation/cgroup-v2.txt
>> index 8d89dc2..c4227ee 100644
>> --- a/Documentation/cgroup-v2.txt
>> +++ b/Documentation/cgroup-v2.txt
>> @@ -1554,9 +1554,10 @@ Cpuset Interface Files
>>  	and will not be moved to other CPUs.
>>  
>>  	This flag is hierarchical and is inherited by child cpusets. It
>> -	can be turned off only when the CPUs in this cpuset aren't
>> -	listed in the cpuset.cpus of other sibling cgroups, and all
>> -	the child cpusets, if present, have this flag turned off.
>> +	can be explicitly turned off only when it is a direct child of
>> +	the root cgroup and the CPUs in this cpuset are subset of the
>> +	root's "cpuset.cpus.isolated".	Moreover, the CPUs cannot be
>> +	listed in the "cpuset.cpus" of other sibling cgroups.
> It is a little bit convoluted that the isolation requires coordination
> among root's isolated file and the first-level children's cpus file
> and the flag.  Maybe I'm missing something but can't we do something
> like the following?
>
> * Add isolated flag file, which can only be modified on empty (in
>   terms of cpus) first level children.
>
> * Once isolated flag is set, CPUs can only be added to the cpus file
>   iff they aren't being used by anyone else and automatically become
>   isolated.
>
> The first level cpus file is owned by the root cgroup anyway, so
> there's no danger regarding delegation or whatever and the interface
> would be a lot simpler.

I think that will work too. We currently don't have a flag to make a
file visible on first-level children only, but it shouldn't be hard to
make one.

Putting CPUs into an isolated child cpuset means removing it from the
root's effective CPUs. So I would probably like to expose the read-only
cpus.effective in the root cgroup so that we can check changes in the
effective cpu list.

I will renew the patchset will your suggestion.

Thanks,
Longman

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
