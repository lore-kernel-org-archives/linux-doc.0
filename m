Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E61BB7E66E
	for <lwn-linux-doc@archive.lwn.net>; Fri,  9 Mar 2018 18:20:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S932223AbeCISUZ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 9 Mar 2018 13:20:25 -0500
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:50502 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751239AbeCISUY (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 9 Mar 2018 13:20:24 -0500
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 18388EBFEE;
        Fri,  9 Mar 2018 18:20:24 +0000 (UTC)
Received: from llong.remote.csb (dhcp-17-75.bos.redhat.com [10.18.17.75])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 1CC21215CDA7;
        Fri,  9 Mar 2018 18:20:23 +0000 (UTC)
Subject: Re: [PATCH v4] cpuset: Enable cpuset controller in default hierarchy
To:     Mike Galbraith <efault@gmx.de>, Tejun Heo <tj@kernel.org>,
        Li Zefan <lizefan@huawei.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>
Cc:     cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, kernel-team@fb.com, pjt@google.com,
        luto@amacapital.net, torvalds@linux-foundation.org,
        Roman Gushchin <guro@fb.com>
References: <1520609707-16582-1-git-send-email-longman@redhat.com>
 <1520613285.12489.36.camel@gmx.de>
 <1c3fe7b0-2600-c46d-1527-d3aaf024bb91@redhat.com>
 <1520619426.27998.18.camel@gmx.de>
From:   Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <55809fe4-98ba-5566-86ed-457acfef0e1c@redhat.com>
Date:   Fri, 9 Mar 2018 13:20:22 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <1520619426.27998.18.camel@gmx.de>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]); Fri, 09 Mar 2018 18:20:24 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.1]); Fri, 09 Mar 2018 18:20:24 +0000 (UTC) for IP:'10.11.54.6' DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'longman@redhat.com' RCPT:''
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 03/09/2018 01:17 PM, Mike Galbraith wrote:
> On Fri, 2018-03-09 at 12:45 -0500, Waiman Long wrote:
>> On 03/09/2018 11:34 AM, Mike Galbraith wrote:
>>> On Fri, 2018-03-09 at 10:35 -0500, Waiman Long wrote:
>>>> Given the fact that thread mode had been merged into 4.14, it is now
>>>> time to enable cpuset to be used in the default hierarchy (cgroup v2)
>>>> as it is clearly threaded.
>>>>
>>>> The cpuset controller had experienced feature creep since its
>>>> introduction more than a decade ago. Besides the core cpus and mems
>>>> control files to limit cpus and memory nodes, there are a bunch of
>>>> additional features that can be controlled from the userspace. Some of
>>>> the features are of doubtful usefulness and may not be actively used.
>>> One rather important features is the ability to dynamically partition a
>>> box and isolate critical loads.  How does one do that with v2?
>>>
>>> In v1, you create two or more exclusive sets, one for generic
>>> housekeeping, and one or more for critical load(s), RT in my case,
>>> turning off load balancing in the critical set(s) for obvious reasons.
>> This patch just serves as a foundation for cpuset support in v2. I am
>> not excluding the fact that more v1 features will be added in future
>> patches. We want to start with a clean slate and add on it after careful
>> consideration. There are some v1 cpuset features that are not used or
>> rarely used. We certainly want to get rid of them, if possible.
> If v2 is to ever supersede v1, as is the normal way of things, core
> functionality really should be on the v2 boat when it sails.  What you
> left standing on the dock is critical core cpuset functionality.
>
> 	-Mike

From your perspective, what are core functionality that should be
included in cpuset v2 other than the ability to restrict cpus and memory
nodes.

Cheers,
Longman

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
