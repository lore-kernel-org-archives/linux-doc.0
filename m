Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id AF3B87D08C
	for <lwn-linux-doc@archive.lwn.net>; Wed, 30 May 2018 13:47:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1753302AbeE3Nrr (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 30 May 2018 09:47:47 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:52314 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1752675AbeE3Nrq (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 30 May 2018 09:47:46 -0400
Received: from smtp.corp.redhat.com (int-mx03.intmail.prod.int.rdu2.redhat.com [10.11.54.3])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 9673A40BC04F;
        Wed, 30 May 2018 13:47:45 +0000 (UTC)
Received: from llong.remote.csb (dhcp-17-81.bos.redhat.com [10.18.17.81])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 91E4B10F1C1B;
        Wed, 30 May 2018 13:47:42 +0000 (UTC)
Subject: Re: [PATCH v9 0/7] Enable cpuset controller in default hierarchy
To:     Juri Lelli <juri.lelli@redhat.com>
Cc:     Tejun Heo <tj@kernel.org>, Li Zefan <lizefan@huawei.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, cgroups@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        kernel-team@fb.com, pjt@google.com, luto@amacapital.net,
        Mike Galbraith <efault@gmx.de>, torvalds@linux-foundation.org,
        Roman Gushchin <guro@fb.com>,
        Patrick Bellasi <patrick.bellasi@arm.com>
References: <1527601294-3444-1-git-send-email-longman@redhat.com>
 <20180530101317.GB3320@localhost.localdomain>
 <d74c67ea-43c9-cabb-4303-ecff008412df@redhat.com>
 <20180530130555.GD3320@localhost.localdomain>
From:   Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <e42f910a-83b7-0fd2-2c77-05d069441c2f@redhat.com>
Date:   Wed, 30 May 2018 09:47:42 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <20180530130555.GD3320@localhost.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.3
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]); Wed, 30 May 2018 13:47:45 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.7]); Wed, 30 May 2018 13:47:45 +0000 (UTC) for IP:'10.11.54.3' DOMAIN:'int-mx03.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'longman@redhat.com' RCPT:''
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 05/30/2018 09:05 AM, Juri Lelli wrote:
> On 30/05/18 08:56, Waiman Long wrote:
>> On 05/30/2018 06:13 AM, Juri Lelli wrote:
>>> Hi,
>>>
>>> On 29/05/18 09:41, Waiman Long wrote:
>>>> v9:
>>>>  - Rename cpuset.sched.domain to cpuset.sched.domain_root to better
>>>>    identify its purpose as the root of a new scheduling domain or
>>>>    partition.
>>>>  - Clarify in the document about the purpose of domain_root and
>>>>    load_balance. Using domain_root is th only way to create new
>>>>    partition.
>>>>  - Fix a lockdep warning in update_isolated_cpumask() function.
>>>>  - Add a new patch to eliminate call to generate_sched_domains() for
>>>>    v2 when a change in cpu list does not touch a domain_root.
>>> I was playing with this and ended up with the situation below:
>>>
>>>  g1/cgroup.controllers:cpuset
>>>  g1/cgroup.events:populated 0
>>>  g1/cgroup.max.depth:max
>>>  g1/cgroup.max.descendants:max
>>>  g1/cgroup.stat:nr_descendants 1
>>>  g1/cgroup.stat:nr_dying_descendants 0
>>>  g1/cgroup.subtree_control:cpuset
>>>  g1/cgroup.type:domain
>>>  g1/cpuset.cpus:0-5                   <---
>>>  g1/cpuset.cpus.effective:0-5
>>>  g1/cpuset.mems.effective:0-1
>>>  g1/cpuset.sched.domain_root:1        <---
>>>  g1/cpuset.sched.load_balance:1
>>>  g1/cpu.stat:usage_usec 0
>>>  g1/cpu.stat:user_usec 0
>>>  g1/cpu.stat:system_usec 0
>>>  g1/g11/cgroup.events:populated 0
>>>  g1/g11/cgroup.max.descendants:max
>>>  g1/g11/cpu.stat:usage_usec 0
>>>  g1/g11/cpu.stat:user_usec 0
>>>  g1/g11/cpu.stat:system_usec 0
>>>  g1/g11/cgroup.type:domain
>>>  g1/g11/cgroup.stat:nr_descendants 0
>>>  g1/g11/cgroup.stat:nr_dying_descendants 0
>>>  g1/g11/cpuset.cpus.effective:0-5
>>>  g1/g11/cgroup.controllers:cpuset
>>>  g1/g11/cpuset.sched.load_balance:1
>>>  g1/g11/cpuset.mems.effective:0-1
>>>  g1/g11/cpuset.cpus:6-11              <---
>>>  g1/g11/cgroup.max.depth:max
>>>  g1/g11/cpuset.sched.domain_root:0
>>>
>>> Should this be allowed? I was expecting subgroup g11 should be
>>> restricted to a subset of g1's cpus.
>>>
>>> Best,
>>>
>>> - Juri
>> That shouldn't be allowed.The code is probably missing some checks that
>> should have been done. What was the sequence of commands leading to the
>> above configuration?
> This is a E5-2609 v3 (12 cores) Fedora Server box (with systemd, so
> first command is needed to be able to use cpuset controller with v2,
> IIUC):
>
> # umount /sys/fs/cgroup/cpuset 
> # cd /sys/fs/cgroup/unified/
> # echo "+cpuset" >cgroup.subtree_control 
> # mkdir g1
> # echo 0-5 >g1/cpuset.cpus
> # echo 6-11 >init.scope/cpuset.cpus
> # echo 6-11 >machine.slice/cpuset.cpus
> # echo 6-11 >system.slice/cpuset.cpus
> # echo 6-11 >user.slice/cpuset.cpus
> # echo 1 >g1/cpuset.sched.domain_root 
> # mkdir g1/g11
> # echo "+cpuset" > g1/cgroup.subtree_control 
> # echo 6-11 >g1/g11/cpuset.cpus
> # grep -R . g1/*
>
> That should be it. Am I doing something wrong?
>
> Thanks,
>
> - Juri


Yes, it is a bug in the existing code. I have sent out a patch to fix that.

-Longman

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
