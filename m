Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-4.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	RCVD_IN_DNSWL_HI,T_RP_MATCHES_RCVD autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 454297DD31
	for <lwn-linux-doc@archive.lwn.net>; Tue, 20 Mar 2018 22:02:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1751511AbeCTWBe (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Tue, 20 Mar 2018 18:01:34 -0400
Received: from mx3-rdu2.redhat.com ([66.187.233.73]:59848 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751004AbeCTWBd (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 20 Mar 2018 18:01:33 -0400
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 3BD1DA28F4;
        Tue, 20 Mar 2018 22:01:32 +0000 (UTC)
Received: from llong.remote.csb (dhcp-17-75.bos.redhat.com [10.18.17.75])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 38888202322F;
        Tue, 20 Mar 2018 22:01:31 +0000 (UTC)
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
 <2b9261b8-6a3a-81d1-9c9a-394524a0d413@redhat.com>
 <20180320211417.GA2149215@devbig577.frc2.facebook.com>
From:   Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <eae1cbd1-4b49-e79b-f6d4-bf62e828ebf1@redhat.com>
Date:   Tue, 20 Mar 2018 18:01:31 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <20180320211417.GA2149215@devbig577.frc2.facebook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 7bit
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.78 on 10.11.54.4
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]); Tue, 20 Mar 2018 22:01:32 +0000 (UTC)
X-Greylist: inspected by milter-greylist-4.5.16 (mx1.redhat.com [10.11.55.2]); Tue, 20 Mar 2018 22:01:32 +0000 (UTC) for IP:'10.11.54.4' DOMAIN:'int-mx04.intmail.prod.int.rdu2.redhat.com' HELO:'smtp.corp.redhat.com' FROM:'longman@redhat.com' RCPT:''
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 03/20/2018 05:14 PM, Tejun Heo wrote:
> Hello,
>
> On Tue, Mar 20, 2018 at 04:53:37PM -0400, Waiman Long wrote:
>> ASAIK for v2, when cpuset.cpus is empty, cpuset.effective_cpus will show
>> all the cpus available from the parent. It is a different behavior from
>> v1. So do we still need a cpuset.cpus_available?
> Heh, you're right.  Let's forget about available and do
> cpuset.cpus.effective.  The primary reason for suggesting that was
> because of the similarity with cgroup.controllers and
> cgroup.subtree_control; however, they're that way because
> subtree_control is delegatable.  For a normal resource knob like
> cpuset.cpus, the knob is owned by the parent and what's interesting to
> the parent is its effective set that it's distributing from.

OK, will change the names as suggested.

-Longman
--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
