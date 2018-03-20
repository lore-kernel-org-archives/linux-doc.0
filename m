Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 5C6CC7DE75
	for <lwn-linux-doc@archive.lwn.net>; Tue, 20 Mar 2018 20:12:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751691AbeCTUM3 convert rfc822-to-8bit (ORCPT
        <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 20 Mar 2018 16:12:29 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:41776 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751343AbeCTUM2 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 20 Mar 2018 16:12:28 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.rdu2.redhat.com [10.11.54.5])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 153364001852;
        Tue, 20 Mar 2018 20:12:28 +0000 (UTC)
Received: from llong.remote.csb (dhcp-17-75.bos.redhat.com [10.18.17.75])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0BCB5AB3FB;
        Tue, 20 Mar 2018 20:12:25 +0000 (UTC)
Subject: Re: [PATCH v5 2/2] cpuset: Add cpuset.flags control knob to v2
From:   Waiman Long <longman@redhat.com>
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
 <1521148842-15486-3-git-send-email-longman@redhat.com>
 <20180319162654.GR2943022@devbig577.frc2.facebook.com>
 <8e553b7e-cab6-1b5d-9110-cc5770ae16c4@redhat.com>
Organization: Red Hat
Message-ID: <cbe9b852-80b6-8341-b51c-4d754d00ce53@redhat.com>
Date:   Tue, 20 Mar 2018 16:12:25 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <8e553b7e-cab6-1b5d-9110-cc5770ae16c4@redhat.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.11.54.5
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]); Tue, 20 Mar 2018 20:12:28 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]); Tue, 20 Mar 2018 20:12:28 +0000 (UTC) for IP:'10.11.54.5' DOMAIN:'int-mx05.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'longman@redhat.com' RCPT:''
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 03/19/2018 12:33 PM, Waiman Long wrote:
> On 03/19/2018 12:26 PM, Tejun Heo wrote:
>> Hello, Waiman.
>>
>> On Thu, Mar 15, 2018 at 05:20:42PM -0400, Waiman Long wrote:
>>> +	The currently supported flag is:
>>> +
>>> +	  sched_load_balance
>>> +		When it is not set, there will be no load balancing
>>> +		among CPUs on this cpuset.  Tasks will stay in the
>>> +		CPUs they are running on and will not be moved to
>>> +		other CPUs.
>>> +
>>> +		When it is set, tasks within this cpuset will be
>>> +		load-balanced by the kernel scheduler.  Tasks will be
>>> +		moved from CPUs with high load to other CPUs within
>>> +		the same cpuset with less load periodically.
>> Hmm... looks like this is something which can be decided by the cgroup
>> itself and should be made delegatable.  Given that different flags
>> might need different delegation settings and the precedence of
>> memory.oom_group, I think it'd be better to make the flags separate
>> bool files - ie. cpuset.sched_load_balance which contains 0/1 and
>> marked delegatable.
>>
>> Thanks.
>>
> Sure. Will do that.

After some thought, I am planning to impose the following additional
constraints on how sched_load_balance works in v2.

1) sched_load_balance will be made hierarchical, the child will inherit
the flag from its parent.
2) cpu_exclusive will be implicitly associated with sched_load_balance.
IOW, sched_load_balance => !cpu_exclusive, and !sched_load_balance =>
cpu_exclusive.
3) sched_load_balance cannot be 1 on a child if it is 0 on the parent.

With these changes, sched_load_balance will have to be set by the parent
and so will not be delegatable. Please let me know your thought on that.

Cheers,
Longman



--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
