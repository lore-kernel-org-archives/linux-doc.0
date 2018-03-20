Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=unavailable autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0CF217DE75
	for <lwn-linux-doc@archive.lwn.net>; Tue, 20 Mar 2018 20:53:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751320AbeCTUxj convert rfc822-to-8bit (ORCPT
        <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 20 Mar 2018 16:53:39 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:48212 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751186AbeCTUxi (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 20 Mar 2018 16:53:38 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id D9BF6EB700;
        Tue, 20 Mar 2018 20:53:37 +0000 (UTC)
Received: from llong.remote.csb (dhcp-17-75.bos.redhat.com [10.18.17.75])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 2C978202322F;
        Tue, 20 Mar 2018 20:53:37 +0000 (UTC)
Subject: Re: [PATCH v5 1/2] cpuset: Enable cpuset controller in default
 hierarchy
To:     Tejun Heo <tj@kernel.org>
Cc:     Li Zefan <lizefan@huawei.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, cgroups@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        kernel-team@fb.com, pjt@google.com, luto@amacapital.net,
        efault@gmx.de, torvalds@linux-foundation.org,
        Roman Gushchin <guro@fb.com>
References: <1521148842-15486-1-git-send-email-longman@redhat.com>
 <1521148842-15486-2-git-send-email-longman@redhat.com>
 <20180319155937.GQ2943022@devbig577.frc2.facebook.com>
 <1881c1da-56ec-d76b-b736-fd0919737ec6@redhat.com>
 <20180320201029.GO519464@devbig577.frc2.facebook.com>
From:   Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <2b9261b8-6a3a-81d1-9c9a-394524a0d413@redhat.com>
Date:   Tue, 20 Mar 2018 16:53:37 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <20180320201029.GO519464@devbig577.frc2.facebook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]); Tue, 20 Mar 2018 20:53:38 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]); Tue, 20 Mar 2018 20:53:38 +0000 (UTC) for IP:'10.11.54.4' DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'longman@redhat.com' RCPT:''
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 03/20/2018 04:10 PM, Tejun Heo wrote:
> Hello, Waiman.
>
> On Tue, Mar 20, 2018 at 09:51:20AM -0400, Waiman Long wrote:
>>>> +	It lists the onlined CPUs that are actually allowed to be
>>>> +	used by tasks within the current cgroup. It is a subset of
>>>> +	"cpuset.cpus".  Its value will be affected by CPU hotplug
>>>> +	events.
>>> Can we do cpuset.cpus.availble which lists the cpus available to the
>>> cgroup instead of the eventual computed mask for the cgroup?  That'd
>>> be more useful as it doesn't lose the information by and'ing what's
>>> available with the cgroup's mask and it's trivial to determine the
>>> effective from the two masks.
>> I don't get what you want here. cpus is the cpuset's cpus_allowed mask.
>> effective_cpus is the effective_cpus mask. When you say cpus available
>> to the cgroup, do you mean the cpu_online_mask or the list of cpus from
>> the parent? Or do you just want to change the name to cpus.available
>> instead of effective_cpus?
> The available cpus from the parent, where the effective is AND between
> cpuset.available and cpuset.cpus of the cgroup, so that the user can
> see what's available for the cgroup unfiltered by cpuset.cpus.

ASAIK for v2, when cpuset.cpus is empty, cpuset.effective_cpus will show
all the cpus available from the parent. It is a different behavior from
v1. So do we still need a cpuset.cpus_available?

>> Right, I will set CFTYPE_NOT_ON_ROOT to "cpus" and "mems" as we are not
>> supposed to change them in the root. The effective_cpus and
>> effective_mems will be there in the root to show what are available.
> So, we can do that in the future but let's not do that for now.  It's
> the same problem we have for basically everything else and we've
> stayed away from replicating the information in the root cgroup.  This
> might change in the future but if we do that let's do that
> consistently.
That is fine. I will make them all disappears in the root cgroup.

Cheers,
Longman

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
