Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 3EEE37D082
	for <lwn-linux-doc@archive.lwn.net>; Mon, 15 Oct 2018 17:04:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726593AbeJPAu3 convert rfc822-to-8bit (ORCPT
        <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 15 Oct 2018 20:50:29 -0400
Received: from mx1.redhat.com ([209.132.183.28]:34844 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726588AbeJPAu3 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 15 Oct 2018 20:50:29 -0400
Received: from smtp.corp.redhat.com (int-mx05.intmail.prod.int.phx2.redhat.com [10.5.11.15])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 66764307D857;
        Mon, 15 Oct 2018 17:04:25 +0000 (UTC)
Received: from llong.remote.csb (dhcp-17-8.bos.redhat.com [10.18.17.8])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B7A655EE1E;
        Mon, 15 Oct 2018 17:04:21 +0000 (UTC)
Subject: Re: [PATCH v13 00/11] cpuset: Enable cpuset controller in default
 hierarchy
To:     Tejun Heo <tj@kernel.org>
Cc:     Li Zefan <lizefan@huawei.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, cgroups@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        kernel-team@fb.com, pjt@google.com, luto@amacapital.net,
        Mike Galbraith <efault@gmx.de>, torvalds@linux-foundation.org,
        Roman Gushchin <guro@fb.com>,
        Juri Lelli <juri.lelli@redhat.com>,
        Patrick Bellasi <patrick.bellasi@arm.com>
References: <1539366951-8498-1-git-send-email-longman@redhat.com>
 <20181015163540.GQ270328@devbig004.ftw2.facebook.com>
From:   Waiman Long <longman@redhat.com>
Organization: Red Hat
Message-ID: <89b64577-f20e-47d8-03a6-c047e5107271@redhat.com>
Date:   Mon, 15 Oct 2018 13:04:21 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.2.0
MIME-Version: 1.0
In-Reply-To: <20181015163540.GQ270328@devbig004.ftw2.facebook.com>
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: 8BIT
Content-Language: en-US
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.15
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.48]); Mon, 15 Oct 2018 17:04:25 +0000 (UTC)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 10/15/2018 12:35 PM, Tejun Heo wrote:
> Hello, Waiman.
>
> This looks great to me.  I have only one small nit in terms of
> interface.  Currently, cpuset.partition file uses -1, 0, 1; however,
> given that this is consistent with how cgroup.type behaves (something
> can be set but may be invalid), I wonder whether using a similar
> syntax would be more consistent.  e.g. sth like cpuset.type which
> takes "normal" or "partition" and shows one of "normal", "partition"
> and "partition invalid".  I'd be perfectly happy with that being a
> follow-up patch.

Sure. I can send a follow-up patch to add that.
> Peter, does the patchset look good to you?  It does everything we want
> it to in terms of sched domain partitioning and is compliant all
> cgroup2 conventions.  If so, I'll apply the series to the cgroup devel
> branch.
>
> Thank you very much for the work and persistence!
>
Thanks for the comment. There is a minor bug in patch 3 because of the 2
possibilities of how cpumask_var_t can be defined. I will send updated
version of that patch to fix that.

-Longman


