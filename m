Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 0E1227DD31
	for <lwn-linux-doc@archive.lwn.net>; Mon, 23 Apr 2018 16:32:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1755473AbeDWQcQ (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 23 Apr 2018 12:32:16 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:49326 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1755165AbeDWQcP (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 23 Apr 2018 12:32:15 -0400
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.rdu2.redhat.com [10.11.54.6])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id BE466406C796;
        Mon, 23 Apr 2018 16:32:14 +0000 (UTC)
Received: from llong.remote.csb (dhcp-17-164.bos.redhat.com [10.18.17.164])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 78348215CDC8;
        Mon, 23 Apr 2018 16:32:12 +0000 (UTC)
Subject: Re: [PATCH v7 0/5] cpuset: Enable cpuset controller in default
 hierarchy
To:     Mike Galbraith <efault@gmx.de>, Tejun Heo <tj@kernel.org>,
        Li Zefan <lizefan@huawei.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>
Cc:     cgroups@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-doc@vger.kernel.org, kernel-team@fb.com, pjt@google.com,
        luto@amacapital.net, torvalds@linux-foundation.org,
        Roman Gushchin <guro@fb.com>,
        Juri Lelli <juri.lelli@redhat.com>
References: <1524145624-23655-1-git-send-email-longman@redhat.com>
 <1524212601.11030.2.camel@gmx.de>
From:   Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <f1f02718-c7e7-f6b3-be7b-3d7c2f2ffa50@redhat.com>
Date:   Mon, 23 Apr 2018 12:32:12 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <1524212601.11030.2.camel@gmx.de>
Content-Type: text/plain; charset=iso-8859-15
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.6
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]); Mon, 23 Apr 2018 16:32:14 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.5]); Mon, 23 Apr 2018 16:32:14 +0000 (UTC) for IP:'10.11.54.6' DOMAIN:'int-mx06.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'longman@redhat.com' RCPT:''
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 04/20/2018 04:23 AM, Mike Galbraith wrote:
> On Thu, 2018-04-19 at 09:46 -0400, Waiman Long wrote:
>> v7:
>>  - Add a root-only cpuset.cpus.isolated control file for CPU isolation.
>>  - Enforce that load_balancing can only be turned off on cpusets with
>>    CPUs from the isolated list.
>>  - Update sched domain generation to allow cpusets with CPUs only
>>    from the isolated CPU list to be in separate root domains.
> I haven't done much, but was able to do a q/d manual build, populate
> and teardown of system/critical sets on my desktop box, and it looked
> ok.  Thanks for getting this aboard the v2 boat.
>
> 	-Mike

Thank for the testing.

Cheers,
Longman

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
