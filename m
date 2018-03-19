Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 9A9AD7E279
	for <lwn-linux-doc@archive.lwn.net>; Mon, 19 Mar 2018 21:42:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S965236AbeCSVlz convert rfc822-to-8bit (ORCPT
        <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 19 Mar 2018 17:41:55 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:37486 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S965074AbeCSVlP (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 19 Mar 2018 17:41:15 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id E16DE8D746;
        Mon, 19 Mar 2018 21:41:14 +0000 (UTC)
Received: from llong.remote.csb (dhcp-17-75.bos.redhat.com [10.18.17.75])
        by smtp.corp.redhat.com (Postfix) with ESMTP id E450820292A0;
        Mon, 19 Mar 2018 21:41:13 +0000 (UTC)
Subject: Re: [PATCH v4] cpuset: Enable cpuset controller in default hierarchy
To:     Mike Galbraith <efault@gmx.de>, Tejun Heo <tj@kernel.org>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        Li Zefan <lizefan@huawei.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Ingo Molnar <mingo@redhat.com>, cgroups@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        kernel-team@fb.com, pjt@google.com, luto@amacapital.net,
        torvalds@linux-foundation.org, Roman Gushchin <guro@fb.com>
References: <1c3fe7b0-2600-c46d-1527-d3aaf024bb91@redhat.com>
 <1520619426.27998.18.camel@gmx.de>
 <55809fe4-98ba-5566-86ed-457acfef0e1c@redhat.com>
 <1520624424.27998.76.camel@gmx.de>
 <53de9683-01b7-bac4-8b70-dc1f93ede600@redhat.com>
 <20180309221736.GB5926@hirez.programming.kicks-ass.net>
 <f0fca497-e4e7-3dbd-1e5c-a7f502c05dcb@redhat.com>
 <1520653648.12749.20.camel@gmx.de>
 <20180314195711.GD2943022@devbig577.frc2.facebook.com>
 <1521082141.7100.1.camel@gmx.de>
 <20180319153413.GO2943022@devbig577.frc2.facebook.com>
 <1521492550.16869.1.camel@gmx.de>
From:   Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <a334a234-3e87-a9a7-9589-8476fecb4149@redhat.com>
Date:   Mon, 19 Mar 2018 17:41:13 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <1521492550.16869.1.camel@gmx.de>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 8BIT
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]); Mon, 19 Mar 2018 21:41:15 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]); Mon, 19 Mar 2018 21:41:15 +0000 (UTC) for IP:'10.11.54.4' DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'longman@redhat.com' RCPT:''
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 03/19/2018 04:49 PM, Mike Galbraith wrote:
> On Mon, 2018-03-19 at 08:34 -0700, Tejun Heo wrote:
>> Hello, Mike.
>>
>> On Thu, Mar 15, 2018 at 03:49:01AM +0100, Mike Galbraith wrote:
>>> Under the hood v2 details are entirely up to you.  My input ends at
>>> please don't leave dynamic partitioning standing at the dock when v2
>>> sails.
>> So, this isn't about implementation details but about what the
>> interface achieves - ie, what's the actual function?  The only thing I
>> can see is blocking the entity which is configuring the hierarchy from
>> making certain configs.  While that might be useful in some specific
>> use cases, it seems to miss the bar for becoming its own kernel
>> feature.  After all, nothing prevents the same entity from clearing
>> the exlusive bit and making the said changes.
> Yes, privileged contexts can maliciously or stupidly step all over one
> other no matter what you do (finite resource), but oxymoron creation
> (CPUs simultaneously balanced and isolated) should be handled.  If one
> context can allocate a set overlapping a set another context intends to
> or already has detached from scheduler domains, both are screwed.
>
> 	-Mike

The allocations of CPUs to child cgroups should be controlled by the
parent cgroup. It is the parent's fault if some CPUs are in both
balanced and isolated cgroups.

How about we don't allow turning off scheduling if the CPUs aren't
exclusive from the parent's perspective? So you can't create an isolated
cgroup if the CPUs aren't exclusive. Will this be a good enough compromise?

Cheers,
Longman



--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
