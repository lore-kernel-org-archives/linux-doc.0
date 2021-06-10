Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 884C6C48BDF
	for <linux-doc@archiver.kernel.org>; Thu, 10 Jun 2021 19:16:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6E51961403
	for <linux-doc@archiver.kernel.org>; Thu, 10 Jun 2021 19:16:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230364AbhFJTSa (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 10 Jun 2021 15:18:30 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:35378 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S230358AbhFJTS3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Jun 2021 15:18:29 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1623352592;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=liO0eMHLLQxFJzTbME5X4nacHbq/D6xkCgBqqSco7f0=;
        b=UKN+VJFnPT1Qyo3v1npa3BNUZAI5MynuwJj6j1bhiY7PgYNDadnJiKxiSqCfqlg+CR+/Dc
        +a2PtBDDqQNbbPd+VasXaEE0uJ7hI2W9T773WubC+23Di5HiXGq+fjZj3RznfOg8b2brr1
        U58N3WY9z3khNJP/ah9cLwXYoHprR48=
Received: from mail-qv1-f72.google.com (mail-qv1-f72.google.com
 [209.85.219.72]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-400-s_LJ4oJNNdS-bKtJA3iV8Q-1; Thu, 10 Jun 2021 15:16:31 -0400
X-MC-Unique: s_LJ4oJNNdS-bKtJA3iV8Q-1
Received: by mail-qv1-f72.google.com with SMTP id k12-20020a0cfd6c0000b029020df9543019so18630900qvs.14
        for <linux-doc@vger.kernel.org>; Thu, 10 Jun 2021 12:16:31 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:subject:to:cc:references:message-id:date
         :user-agent:mime-version:in-reply-to:content-transfer-encoding
         :content-language;
        bh=liO0eMHLLQxFJzTbME5X4nacHbq/D6xkCgBqqSco7f0=;
        b=idvaBljnpfTk1foovZ1vgo9HciduqkZj1fdD1i6OmcqC6SD4cEwlq4eNdM3bQw0QGR
         ZeIq0ISKZhF8qFSXPcTChNQN0it9Z4j8e0k3coGMGrgWvw1iYCelILF20CA1OM8x+F53
         EvyYG/mY1YO18tXAutLBetZ2GgAYiBRPdBoFKLPdtdrxITqIbypQAKTmax0/NqVQp53U
         NO35buFgGAfeU7JZp1VanxpVib6rHcxf2LiJyU7Mg575i2evyUTNHlHAg2zX9O4x02Qx
         3CLC3ns+ddWnLP7mPd2hzmgtWSiBd/ijjz/ULxuqzJui6VRvauT8U0n+LNm4S9nt6tGa
         v6nA==
X-Gm-Message-State: AOAM530k+JvU1cPu8VwCm8ypyjkkpoI9ITDPy+7xzB+8RGLd9WQFWMgx
        BETwubtjZWsYpu4L37IQdasgWMWfS+Mn9uq4c73peGTmMow5SUCnK+/hYtykEjZo5HJtelwzhZg
        zZ0NqPIkQy1OY3+JW7tsZ
X-Received: by 2002:a37:5507:: with SMTP id j7mr104032qkb.309.1623352591111;
        Thu, 10 Jun 2021 12:16:31 -0700 (PDT)
X-Google-Smtp-Source: ABdhPJyAuBlSzvmN6H5oSpFj7wzJ2WHLurIlPNKFIgsipjYWbH5Grt8CtLeVfMxQOG6UnUOcx7CMDw==
X-Received: by 2002:a37:5507:: with SMTP id j7mr104009qkb.309.1623352590931;
        Thu, 10 Jun 2021 12:16:30 -0700 (PDT)
Received: from llong.remote.csb ([2601:191:8500:76c0::cdbc])
        by smtp.gmail.com with ESMTPSA id 7sm2906484qkb.86.2021.06.10.12.16.29
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 10 Jun 2021 12:16:30 -0700 (PDT)
From:   Waiman Long <llong@redhat.com>
X-Google-Original-From: Waiman Long <longman@redhat.com>
Subject: Re: [PATCH 2/5] cgroup/cpuset: Add new cpus.partition type with no
 load balancing
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <shuah@kernel.org>, cgroups@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org,
        Andrew Morton <akpm@linux-foundation.org>,
        Roman Gushchin <guro@fb.com>, Phil Auld <pauld@redhat.com>,
        Juri Lelli <juri.lelli@redhat.com>
References: <20210603212416.25934-1-longman@redhat.com>
 <20210603212416.25934-3-longman@redhat.com>
 <YMJfDHr1+xxm6SBi@hirez.programming.kicks-ass.net>
Message-ID: <820aff72-fce2-ac2f-88e6-787249e04308@redhat.com>
Date:   Thu, 10 Jun 2021 15:16:29 -0400
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.9.0
MIME-Version: 1.0
In-Reply-To: <YMJfDHr1+xxm6SBi@hirez.programming.kicks-ass.net>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On 6/10/21 2:50 PM, Peter Zijlstra wrote:
> On Thu, Jun 03, 2021 at 05:24:13PM -0400, Waiman Long wrote:
>> Cpuset v1 uses the sched_load_balance control file to determine if load
>> balancing should be enabled.  Cpuset v2 gets rid of sched_load_balance
>> as its use may require disabling load balancing at cgroup root.
>>
>> For workloads that require very low latency like DPDK, the latency
>> jitters caused by periodic load balancing may exceed the desired
>> latency limit.
>>
>> When cpuset v2 is in use, the only way to avoid this latency cost is to
>> use the "isolcpus=" kernel boot option to isolate a set of CPUs. After
>> the kernel boot, however, there is no way to add or remove CPUs from
>> this isolated set. For workloads that are more dynamic in nature, that
>> means users have to provision enough CPUs for the worst case situation
>> resulting in excess idle CPUs.
>>
>> To address this issue for cpuset v2, a new cpuset.cpus.partition type
>> "root-nolb" is added which allows the creation of a cpuset partition with
>> no load balancing. This will allow system administrators to dynamically
>> adjust the size of the no load balancing partition to the current need
>> of the workload without rebooting the system.
> I'm confused, why do you need this? Just create a parition for each cpu.
>
 From a management point of view, it is more cumbersome to do one cpu 
per partition. I have suggested this idea of 1 cpu per partition to the 
container developers, but they don't seem to like it.

Cheers,
Longman

