Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3773F7D048
	for <lwn-linux-doc@archive.lwn.net>; Thu, 31 May 2018 01:26:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932593AbeEaB0B (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 30 May 2018 21:26:01 -0400
Received: from szxga07-in.huawei.com ([45.249.212.35]:37168 "EHLO huawei.com"
        rhost-flags-OK-FAIL-OK-FAIL) by vger.kernel.org with ESMTP
        id S932563AbeEaB0A (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 30 May 2018 21:26:00 -0400
Received: from DGGEMS412-HUB.china.huawei.com (unknown [172.30.72.60])
        by Forcepoint Email with ESMTP id 65231DBD8DDD9;
        Thu, 31 May 2018 09:25:56 +0800 (CST)
Received: from [10.177.19.236] (10.177.19.236) by smtp.huawei.com
 (10.3.19.212) with Microsoft SMTP Server (TLS) id 14.3.382.0; Thu, 31 May
 2018 09:25:55 +0800
Subject: Re: [PATCH] cpuset: Enforce that a child's cpus must be a subset of
 the parent
To:     Waiman Long <longman@redhat.com>, Tejun Heo <tj@kernel.org>,
        "Johannes Weiner" <hannes@cmpxchg.org>,
        Peter Zijlstra <peterz@infradead.org>,
        "Ingo Molnar" <mingo@redhat.com>
References: <1527687991-1431-1-git-send-email-longman@redhat.com>
CC:     <cgroups@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-doc@vger.kernel.org>, <kernel-team@fb.com>,
        <pjt@google.com>, <luto@amacapital.net>,
        Mike Galbraith <efault@gmx.de>,
        <torvalds@linux-foundation.org>, Roman Gushchin <guro@fb.com>,
        Juri Lelli <juri.lelli@redhat.com>,
        Patrick Bellasi <patrick.bellasi@arm.com>
From:   Zefan Li <lizefan@huawei.com>
X-Enigmail-Draft-Status: N1110
Message-ID: <5B0F4F09.9050100@huawei.com>
Date:   Thu, 31 May 2018 09:25:29 +0800
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:38.0) Gecko/20100101
 Thunderbird/38.5.1
MIME-Version: 1.0
In-Reply-To: <1527687991-1431-1-git-send-email-longman@redhat.com>
Content-Type: text/plain; charset="gbk"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.177.19.236]
X-CFilter-Loop: Reflected
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Hi Waiman,

On 2018/5/30 21:46, Waiman Long wrote:
> It was found that the cpuset.cpus could contain CPUs that are not listed
> in their parent's cpu list as shown by the command sequence below:
> 
>   # echo "+cpuset" >cgroup.subtree_control
>   # mkdir g1
>   # echo 0-5 >g1/cpuset.cpus
>   # mkdir g1/g11
>   # echo "+cpuset" > g1/cgroup.subtree_control
>   # echo 6-11 >g1/g11/cpuset.cpus
>   # grep -R . g1 | grep "\.cpus"
>   g1/cpuset.cpus:0-5
>   g1/cpuset.cpus.effective:0-5
>   g1/g11/cpuset.cpus:6-11
>   g1/g11/cpuset.cpus.effective:0-5
> 
> As the intersection of g11's cpus and that of g1 is empty, the effective
> cpus of g11 is just that of g1. The check in update_cpumask() is now
> corrected to make sure that cpus in a child cpus must be a subset of
> its parent's cpus. The error "write error: Invalid argument" will now
> be reported in the above case.
> 

We made the distinction between user-configured CPUs and effective CPUs
in commit 7e88291beefbb758, so actually it's not a bug.

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
