Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id EC5087E6A7
	for <lwn-linux-doc@archive.lwn.net>; Mon, 23 Apr 2018 14:15:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1755276AbeDWOKm (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 23 Apr 2018 10:10:42 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:57580 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1754962AbeDWOKl (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 23 Apr 2018 10:10:41 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id B8788F0803;
        Mon, 23 Apr 2018 14:10:40 +0000 (UTC)
Received: from llong.remote.csb (dhcp-17-164.bos.redhat.com [10.18.17.164])
        by smtp.corp.redhat.com (Postfix) with ESMTP id BD3062166BAD;
        Mon, 23 Apr 2018 14:10:39 +0000 (UTC)
Subject: Re: [PATCH v7 0/5] cpuset: Enable cpuset controller in default
 hierarchy
To:     Juri Lelli <juri.lelli@redhat.com>
Cc:     Tejun Heo <tj@kernel.org>, Li Zefan <lizefan@huawei.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, cgroups@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        kernel-team@fb.com, pjt@google.com, luto@amacapital.net,
        Mike Galbraith <efault@gmx.de>, torvalds@linux-foundation.org,
        Roman Gushchin <guro@fb.com>
References: <1524145624-23655-1-git-send-email-longman@redhat.com>
 <20180423130715.GA32341@localhost.localdomain>
 <20180423135756.GC32341@localhost.localdomain>
From:   Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <22ad86e3-0661-6db0-f4f3-5b06f439dcf7@redhat.com>
Date:   Mon, 23 Apr 2018 10:10:39 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <20180423135756.GC32341@localhost.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]); Mon, 23 Apr 2018 14:10:40 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]); Mon, 23 Apr 2018 14:10:40 +0000 (UTC) for IP:'10.11.54.6' DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'longman@redhat.com' RCPT:''
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 04/23/2018 09:57 AM, Juri Lelli wrote:
> On 23/04/18 15:07, Juri Lelli wrote:
>> Hi Waiman,
>>
>> On 19/04/18 09:46, Waiman Long wrote:
>>> v7:
>>>  - Add a root-only cpuset.cpus.isolated control file for CPU isolation.
>>>  - Enforce that load_balancing can only be turned off on cpusets with
>>>    CPUs from the isolated list.
>>>  - Update sched domain generation to allow cpusets with CPUs only
>>>    from the isolated CPU list to be in separate root domains.
> Guess I'll be adding comments as soon as I stumble on something unclear
> (to me :), hope that's OK (shout if I should do it differently).
>
> The below looked unexpected to me:
>
> root@debian-kvm:/sys/fs/cgroup# cat g1/cpuset.cpus
> 2-3
> root@debian-kvm:/sys/fs/cgroup# cat g1/cpuset.mems
>
> root@debian-kvm:~# echo $$ > /sys/fs/cgroup/g1/cgroup.threads
> root@debian-kvm:/sys/fs/cgroup# cat g1/cgroup.threads
> 2312
>
> So I can add tasks to groups with no mems? Or is it this only true in my
> case with a single mem node? Or maybe it's inherited from root group
> (slightly confusing IMHO if that's the case).

No mems mean looking up the parents until we find one with non-empty
mems. The mems.effective will show you the actual memory nodes used.

-Longman

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
