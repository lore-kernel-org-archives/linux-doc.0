Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-13.6 required=5.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE,T_DKIMWL_WL_MED,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 39A797D2EF
	for <lwn-linux-doc@archive.lwn.net>; Wed, 29 May 2019 21:06:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726464AbfE2VF7 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Wed, 29 May 2019 17:05:59 -0400
Received: from mail-pf1-f194.google.com ([209.85.210.194]:39158 "EHLO
        mail-pf1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726428AbfE2VF7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 29 May 2019 17:05:59 -0400
Received: by mail-pf1-f194.google.com with SMTP id j2so2425747pfe.6
        for <linux-doc@vger.kernel.org>; Wed, 29 May 2019 14:05:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=from:to:cc:subject:references:date:in-reply-to:message-id
         :user-agent:mime-version;
        bh=IK6TE1g/zjrlYdKpXduba6GIWdiYkCXHBc8wY5Q2h6c=;
        b=vtINRHGv9pOMzEibPlyS5UheCDyPErD1isWONiJgdUP9nFIKtlhvlR8khJ6OGtj8Ub
         2wdHJ81EyLkh+O2THYqHMuUQbZJF51XI2o7C4rXJKaweU9flDgqo6sZDLCB0F0IFFr3o
         XqnUqkKAZMp1Fis0qGAWaWgx5BHhAoA8b1/epmScbDLNT3udqtjsXbQv7IDkMa30s/4G
         TamPt5Ni00hfDsvhp5BYEE1NK/vbSsMEkiDZqBc9TmZUl3WysTgYsyGgX0XmeD1uB6W5
         Er8tVXbeNNpFaTnDtxluP9+RPFR/EDG7A/hRp71FY8UUlceZIoQggoxcp7CX9wYlac9A
         /HXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:references:date:in-reply-to
         :message-id:user-agent:mime-version;
        bh=IK6TE1g/zjrlYdKpXduba6GIWdiYkCXHBc8wY5Q2h6c=;
        b=oJz184L+hQKcAIXVAsF9pd0Ft2QcgZeYbcEwKnwSOwfY2OyrRgTdBQi/dNJ0AjIv34
         EPPANro1ABkSM99UHSgjS5Q+L4pgE1Jt6ahpPhzYb3BFc6QrrzTr3kMHytP/UtrIoGL3
         3qMeeCaftEoLZw08ItsHa5EG1+1c8FbYrF4X/rtpxMH8N2ty7BzbTV7I+HPKnWqQ7Ltn
         mpIEvt4QEhcR2ctUOje7cbLRBuOpbvvbPVqok8+jrVUhiiOku8lQADv+IaNmT801hIEF
         KqmLIG7E4v3ET2Kin//mdMWHaaAgiSyDp831qUevvFy4PuVsimFgC8dx3gyiVbr9nPdq
         lLpA==
X-Gm-Message-State: APjAAAXQ5VkGsawsPDfKSZd+0hIiNlmNbxdmrzIsGfyZyu3Hb8xH4azk
        19MxWY8QomI/CsG8Ztyyp/CjMupAJwXiHuFw
X-Google-Smtp-Source: APXvYqziz3dX83BfWwOt4Dg3dahd01BeeDJYhvSZSrbtcPTk/gYYJdIsVLXiqebnxwhOWddLSw5chQ==
X-Received: by 2002:a63:1460:: with SMTP id 32mr141850372pgu.319.1559163958462;
        Wed, 29 May 2019 14:05:58 -0700 (PDT)
Received: from bsegall-linux.svl.corp.google.com.localhost ([2620:15c:2cd:202:39d7:98b3:2536:e93f])
        by smtp.gmail.com with ESMTPSA id z9sm254119pgc.82.2019.05.29.14.05.56
        (version=TLS1_2 cipher=ECDHE-RSA-CHACHA20-POLY1305 bits=256/256);
        Wed, 29 May 2019 14:05:57 -0700 (PDT)
From:   bsegall@google.com
To:     Dave Chiluk <chiluk+linux@indeed.com>
Cc:     Phil Auld <pauld@redhat.com>, Peter Oskolkov <posk@posk.io>,
        Peter Zijlstra <peterz@infradead.org>,
        Ingo Molnar <mingo@redhat.com>, cgroups@vger.kernel.org,
        linux-kernel@vger.kernel.org, Brendan Gregg <bgregg@netflix.com>,
        Kyle Anderson <kwa@yelp.com>,
        Gabriel Munos <gmunoz@netflix.com>,
        John Hammond <jhammond@indeed.com>,
        Cong Wang <xiyou.wangcong@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        pjt@google.com
Subject: Re: [PATCH v3 1/1] sched/fair: Fix low cpu usage with high throttling by removing expiration of cpu-local slices
References: <1558121424-2914-1-git-send-email-chiluk+linux@indeed.com>
        <1559156926-31336-1-git-send-email-chiluk+linux@indeed.com>
        <1559156926-31336-2-git-send-email-chiluk+linux@indeed.com>
Date:   Wed, 29 May 2019 14:05:55 -0700
In-Reply-To: <1559156926-31336-2-git-send-email-chiluk+linux@indeed.com> (Dave
        Chiluk's message of "Wed, 29 May 2019 14:08:46 -0500")
Message-ID: <xm264l5dynrg.fsf@bsegall-linux.svl.corp.google.com>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Dave Chiluk <chiluk+linux@indeed.com> writes:

> It has been observed, that highly-threaded, non-cpu-bound applications
> running under cpu.cfs_quota_us constraints can hit a high percentage of
> periods throttled while simultaneously not consuming the allocated
> amount of quota.  This use case is typical of user-interactive non-cpu
> bound applications, such as those running in kubernetes or mesos when
> run on multiple cpu cores.
>
> This has been root caused to threads being allocated per cpu bandwidth
> slices, and then not fully using that slice within the period. At which
> point the slice and quota expires.  This expiration of unused slice
> results in applications not being able to utilize the quota for which
> they are allocated.
>
> The expiration of per-cpu slices was recently fixed by
> 'commit 512ac999d275 ("sched/fair: Fix bandwidth timer clock drift
> condition")'.  Prior to that it appears that this has been broken since
> at least 'commit 51f2176d74ac ("sched/fair: Fix unlocked reads of some
> cfs_b->quota/period")' which was introduced in v3.16-rc1 in 2014.  That
> added the following conditional which resulted in slices never being
> expired.


Yeah, having run the test, stranding only 1 ms per cpu rather than 5
doesn't help if you only have 10 ms of quota and even 10 threads/cpus.
The slack timer isn't important in this test, though I think it probably
should be changed.

Decreasing min_cfs_rq_runtime helps, but would mean that we have to pull
quota more often / always. The worst case here I think is where you
run/sleep for ~1ns, so you wind up taking the lock twice every
min_cfs_rq_runtime: once for assign and once to return all but min,
which you then use up doing short run/sleep. I suppose that determines
how much we care about this overhead at all.

Removing expiration means that in the worst case period and quota can be
effectively twice what the user specified, but only on very particular
workloads.

I think we should at least think about instead lowering
min_cfs_rq_runtime to some smaller value.
