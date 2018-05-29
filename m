Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 8DA5D7DF87
	for <lwn-linux-doc@archive.lwn.net>; Tue, 29 May 2018 12:41:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S933754AbeE2Mk0 convert rfc822-to-8bit (ORCPT
        <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 29 May 2018 08:40:26 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:34356 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S933697AbeE2MkY (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 29 May 2018 08:40:24 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id ADC3E40BC05F;
        Tue, 29 May 2018 12:40:23 +0000 (UTC)
Received: from llong.remote.csb (dhcp-17-81.bos.redhat.com [10.18.17.81])
        by smtp.corp.redhat.com (Postfix) with ESMTP id EC9042166BB2;
        Tue, 29 May 2018 12:40:21 +0000 (UTC)
Subject: Re: [PATCH v8 4/6] cpuset: Make generate_sched_domains() recognize
 isolated_cpus
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
 <1526590545-3350-5-git-send-email-longman@redhat.com>
 <20180524102837.GA3948@localhost.localdomain>
 <45d70c88-e9f5-716a-ee9a-33dc111159cc@redhat.com>
 <8e610b98-970c-a309-5821-fc8e6aca892f@redhat.com>
 <20180529062703.GA8985@localhost.localdomain>
From:   Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <8164a41b-3218-c618-64a6-52747344c4db@redhat.com>
Date:   Tue, 29 May 2018 08:40:21 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <20180529062703.GA8985@localhost.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]); Tue, 29 May 2018 12:40:23 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]); Tue, 29 May 2018 12:40:23 +0000 (UTC) for IP:'10.11.54.6' DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'longman@redhat.com' RCPT:''
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 05/29/2018 02:27 AM, Juri Lelli wrote:
> On 28/05/18 21:24, Waiman Long wrote:
>> On 05/28/2018 09:12 PM, Waiman Long wrote:
>>> On 05/24/2018 06:28 AM, Juri Lelli wrote:
>>>> On 17/05/18 16:55, Waiman Long wrote:
>>>>
>>>> [...]
>>>>
>>>>> @@ -849,7 +860,12 @@ static void rebuild_sched_domains_locked(void)
>>>>>  	 * passing doms with offlined cpu to partition_sched_domains().
>>>>>  	 * Anyways, hotplug work item will rebuild sched domains.
>>>>>  	 */
>>>>> -	if (!cpumask_equal(top_cpuset.effective_cpus, cpu_active_mask))
>>>>> +	if (!top_cpuset.isolation_count &&
>>>>> +	    !cpumask_equal(top_cpuset.effective_cpus, cpu_active_mask))
>>>>> +		goto out;
>>>>> +
>>>>> +	if (top_cpuset.isolation_count &&
>>>>> +	   !cpumask_subset(top_cpuset.effective_cpus, cpu_active_mask))
>>>>>  		goto out;
>>>> Do we cover the case in which hotplug removed one of the isolated cpus
>>>> from cpu_active_mask?
>>> Yes, you are right. That is the remnant of my original patch that allows
>>> only one isolated_cpus at root. Thanks for spotting that.
>> I am sorry. I would like to take it back my previous comment. The code
>> above looks for inconsistency in the state of the effective_cpus mask to
>> find out if it is racing with a hotplug event. If it is, we can skip the
>> domain generation as the hotplug event will do that too. The checks are
>> still valid with the current patchset. So I don't think we need to make
>> any change here.
> Yes, these checks are valid, but don't we also need to check for hotplug
> races w.r.t. isolated CPUs (of some other sub domain)?

It is not actually a race. Both the hotplug event and any changes to cpu
lists or flags are serialized by the cpuset_mutex. It is just that we
may be doing the same work twice that we are wasting cpu cycles. So we
are doing a quick check to avoid this. The check isn't exhaustive and we
can certainly miss some cases. Doing a more throughout check may need as
much time as doing the sched domain generation itself and so you are
actually wasting more CPU cycles on average as the chance of a hotplug
event is very low.

Cheers,
Longman


--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
