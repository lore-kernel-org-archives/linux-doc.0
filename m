Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CFA86C3DA78
	for <linux-doc@archiver.kernel.org>; Sat, 14 Jan 2023 21:01:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230385AbjANVB2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 14 Jan 2023 16:01:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46438 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230407AbjANVB1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 14 Jan 2023 16:01:27 -0500
Received: from mail-wm1-x333.google.com (mail-wm1-x333.google.com [IPv6:2a00:1450:4864:20::333])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02FEC83CE
        for <linux-doc@vger.kernel.org>; Sat, 14 Jan 2023 13:01:26 -0800 (PST)
Received: by mail-wm1-x333.google.com with SMTP id ay40so17428497wmb.2
        for <linux-doc@vger.kernel.org>; Sat, 14 Jan 2023 13:01:25 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=cmx+GOrtGHSSNT8+mZXXNfQG96xDWqpvLPXvzcMm9QU=;
        b=LMOTEDXhe+m5MI40I9KVZlHCiA0QHsVbGujXfWLC3DaQaXp6JhUmayhgb/w1oXGP2y
         euuBvqR8o6nUcAzGaAtPfLl59oOuTYA7ReID9Ex3nBajiOTBD0WB5IALnXP2TKBIUo7d
         4vFLpFndu43EjldWhCHOAIORJ7tjPZ3dBrXGPELbisTouy78U2DNDeFZCKlLELM1m1yX
         Bu70IsA4z6DUEtMpX4mZUngtQz4kmlR62mp8tolWEB349A1RICNjdF202CZMJQQud9wr
         kGKFagzO9I2QA0lAOHR0dsT4mErcg42pYyCPPrpvpzmRGwwmg6YDHKwN29o8R4y4sZz+
         oxHg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=cmx+GOrtGHSSNT8+mZXXNfQG96xDWqpvLPXvzcMm9QU=;
        b=Jdt9eBLXsxIIa+ItTGskdfXye2vZ0U8ROsNV3lUKCaACkfJhkCkSXrJlIaCOUodhGS
         OpUb2d7gXgsEKVkcU8AsnAWietrAjsieLlgbtU4zNh0MtRV+veXJJkdsYTBdoVsi86gA
         cmCBKqYhjeusFZ9/zDmhvRr7tj10OrwMxBeH9MeuxLktVHQNY1xiKH5HTnT6qHKYMaeB
         ULoZX6VkP1zoz8BnunxbNqvMgUZqPvPogubNvt5lRMXz6btmVwRrhlCZz93Xi1UuHubH
         YABsdiHAOQrJtusUue4NxhgoVaTpTzyXBukeTfSS/lFGnlms0pjfbZZYAFXE5dbfEPYJ
         O7KQ==
X-Gm-Message-State: AFqh2kqZvRnxhPf9HqB+ajtS23PwqryfM/xmgtlcXBJUFe+UhkUnl7Ed
        +su4BILm66vvPwohmEbzyANXKw94BKP7n2H8hm/eWA==
X-Google-Smtp-Source: AMrXdXtCoVOrSXgZMmmcxRX6s0tHseqpCGpAjTXOLHSb36K8efoazLaGMBK5ZRWeZGJeR0xcXFN4QLhod/EALcgTqbg=
X-Received: by 2002:a05:600c:16d6:b0:3d9:ed46:7e26 with SMTP id
 l22-20020a05600c16d600b003d9ed467e26mr1436787wmn.184.1673730084439; Sat, 14
 Jan 2023 13:01:24 -0800 (PST)
MIME-Version: 1.0
References: <20230113210703.62107-1-nhuck@google.com> <Y8HI+42TxxlJxT6D@slm.duckdns.org>
In-Reply-To: <Y8HI+42TxxlJxT6D@slm.duckdns.org>
From:   Nathan Huckleberry <nhuck@google.com>
Date:   Sat, 14 Jan 2023 13:00:00 -0800
Message-ID: <CAJkfWY7vmvrU8sW3OWpSa9zygY=6e8BTTkktPe-VScdOcLL-sw@mail.gmail.com>
Subject: Re: [PATCH] workqueue: Add WQ_SCHED_FIFO
To:     Tejun Heo <tj@kernel.org>
Cc:     Sandeep Dhavale <dhavale@google.com>,
        Daeho Jeong <daehojeong@google.com>,
        Eric Biggers <ebiggers@kernel.org>,
        Sami Tolvanen <samitolvanen@google.com>,
        Lai Jiangshan <jiangshanlai@gmail.com>,
        Jonathan Corbet <corbet@lwn.net>, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jan 13, 2023 at 1:11 PM Tejun Heo <tj@kernel.org> wrote:
>
> On Fri, Jan 13, 2023 at 01:07:02PM -0800, Nathan Huckleberry wrote:
> > Add a WQ flag that allows workqueues to use SCHED_FIFO with the least
> > imporant RT priority.  This can reduce scheduler latency for IO
> > post-processing when the CPU is under load without impacting other RT
> > workloads.  This has been shown to improve app startup time on Android
> > [1].
> >
> > Scheduler latency affects several drivers as evidenced by [1], [2], [3],
> > [4].  Some of these drivers have moved post-processing into IRQ context.
> > However, this can cause latency spikes for real-time threads and jitter
> > related jank on Android.  Using a workqueue with SCHED_FIFO improves
> > scheduler latency without causing latency problems for RT threads.
> >
> > [1]:
> > https://lore.kernel.org/linux-erofs/20230106073502.4017276-1-dhavale@google.com/
> > [2]:
> > https://lore.kernel.org/linux-f2fs-devel/20220802192437.1895492-1-daeho43@gmail.com/
> > [3]:
> > https://lore.kernel.org/dm-devel/20220722093823.4158756-4-nhuck@google.com/
> > [4]:
> > https://lore.kernel.org/dm-crypt/20200706173731.3734-1-ignat@cloudflare.com/
> >
> > This change has been tested on dm-verity with the following fio config:
> >
> > [global]
> > time_based
> > runtime=120
> >
> > [do-verify]
> > ioengine=sync
> > filename=/dev/testing
> > rw=randread
> > direct=1
> >
> > [burn_8x90%_qsort]
> > ioengine=cpuio
> > cpuload=90
> > numjobs=8
> > cpumode=qsort
> >
> > Before:
> > clat (usec): min=13, max=23882, avg=29.56, stdev=113.29 READ:
> > bw=122MiB/s (128MB/s), 122MiB/s-122MiB/s (128MB/s-128MB/s), io=14.3GiB
> > (15.3GB), run=120001-120001msec
> >
> > After:
> > clat (usec): min=13, max=23137, avg=19.96, stdev=105.71 READ:
> > bw=180MiB/s (189MB/s), 180MiB/s-180MiB/s (189MB/s-189MB/s), io=21.1GiB
> > (22.7GB), run=120012-120012msec
>
> Given that its use case mostly intersects with WQ_HIGHPRI, would it make
> more sense to add a switch to alter its behavior instead? I don't really
> like the idea of pushing the decision between WQ_HIGHPRI and WQ_SCHED_FIFO
> to each user.

This sounds fine to me. How do you feel about a config flag to change
the default WQ_HIGHPRI scheduler policy and a sysfs node to update the
policy per workqueue?

Thanks,
Huck

>
> Thanks.

>
> --
> tejun
