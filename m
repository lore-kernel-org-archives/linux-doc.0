Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 033697E27B
	for <lwn-linux-doc@archive.lwn.net>; Tue,  1 May 2018 21:31:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751181AbeEAVbK (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 1 May 2018 17:31:10 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:59090 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1750743AbeEAVbH (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 1 May 2018 17:31:07 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id C8692406C797;
        Tue,  1 May 2018 21:31:06 +0000 (UTC)
Received: from llong.remote.csb (dhcp-17-164.bos.redhat.com [10.18.17.164])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 0E59F2022C00;
        Tue,  1 May 2018 21:31:06 +0000 (UTC)
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
 <9eb2c45e-e71e-61ef-aa6d-b8124b739cdf@redhat.com>
 <20180501205828.GD2368884@devbig577.frc2.facebook.com>
From:   Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <c3064aa6-6114-95f2-6204-e80937f40a92@redhat.com>
Date:   Tue, 1 May 2018 17:31:05 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <20180501205828.GD2368884@devbig577.frc2.facebook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]); Tue, 01 May 2018 21:31:06 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]); Tue, 01 May 2018 21:31:06 +0000 (UTC) for IP:'10.11.54.4' DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'longman@redhat.com' RCPT:''
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 05/01/2018 04:58 PM, Tejun Heo wrote:
> Hello,
>
> On Tue, May 01, 2018 at 04:33:45PM -0400, Waiman Long wrote:
>> I think that will work too. We currently don't have a flag to make a
>> file visible on first-level children only, but it shouldn't be hard to
>> make one.
> I think it'd be fine to make the flag file exist on all !root cgroups
> but only writable on the first level children.

Right. This flag will be inherited by child cgroups like the
sched_load_balance.

Cheers,
Longman
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
