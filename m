Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D4F1AC677F1
	for <linux-doc@archiver.kernel.org>; Thu, 19 Jan 2023 02:01:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229646AbjASCBT (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 18 Jan 2023 21:01:19 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59884 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229716AbjASCBS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 18 Jan 2023 21:01:18 -0500
Received: from mail-wr1-x42d.google.com (mail-wr1-x42d.google.com [IPv6:2a00:1450:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B4FA73A5B4
        for <linux-doc@vger.kernel.org>; Wed, 18 Jan 2023 18:01:17 -0800 (PST)
Received: by mail-wr1-x42d.google.com with SMTP id k8so427604wrc.9
        for <linux-doc@vger.kernel.org>; Wed, 18 Jan 2023 18:01:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=Pu1tq3n/LdB6P4+KI23iUwlSXgHNKcoPMfDjTSYiEt0=;
        b=YligMrxe4E/orUgqR8VvI6pwrEwgaXISw8haCFjF/uJle48taVQYMygU3blqy0PhYu
         5NjJq/dS99GAw4Bf9u4qfjx+7h2j/6YUYENx8CmpBsMsmzY0Ubp1IOb4t15z9hL/TACI
         n6YPwlPWgVpXdvdchff0menWL2ZG7BV7Of+WuVBoVVff/SbAcYsKI1VEOfj3L6qqvqy4
         zB4iQORX8DvkN7pL8vTJrt3m+WnTLb+RaHzaBME95RTp5exIDlRCPbjs2zZfsUDp4LpB
         oVxDLqk5M3f3a4hQRnMASQilI3rMojvmnvvV8miygPf0EviOGFAL3xPm+ugtkEWltgdQ
         7p7Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=Pu1tq3n/LdB6P4+KI23iUwlSXgHNKcoPMfDjTSYiEt0=;
        b=V/69Bha4iad0O5dneNNOS0Gs/mP6Af7iTjkmuEcWUvkbfTyf3hiHATODl/swZOKxd0
         cD4JH1+jHlt5vl++CP8LvDF0YZTan9Mbo/Ky949e6zTBoihVY05LNbMuJBL/bBFAbFZF
         cGewcuQmZNYOZKq08X/HwXIJoO+YiAkws+dVjZ8BhO02cXmbdrKbX9Q1scWF/WMs6W50
         W5wyyfhNcXDgXe2NOT1QIcEM0QLQ1MKn5CUFsIovbJ1SgB6lWkY9Xa1+dJ9ZVH9+LG+t
         o3XN+jl4c3VRZJgC59+fkXg7b+G3KL7A2L2X+e+wjnbQy4r9Oak7DdAULjiBNszNI6Np
         6aSA==
X-Gm-Message-State: AFqh2kpi/2sb0+8LDIrv7TicZVinrjnvbFSs+VsMadszcoJe7+qvE2qJ
        Aiu/X+RovNUnYutgGlqF7hqeTvbESTNROcTB9NV46A==
X-Google-Smtp-Source: AMrXdXvGBk5yLN/gW9lWvReD+EGsDcrto7RDqABj5uRF8qWeaRh0yOMij495GRMURAhXONtQlFD3pCS9LGGRDh2eRfA=
X-Received: by 2002:adf:ec88:0:b0:2bd:c1c9:131c with SMTP id
 z8-20020adfec88000000b002bdc1c9131cmr221748wrn.402.1674093676160; Wed, 18 Jan
 2023 18:01:16 -0800 (PST)
MIME-Version: 1.0
References: <20230113210703.62107-1-nhuck@google.com> <Y8HI+42TxxlJxT6D@slm.duckdns.org>
In-Reply-To: <Y8HI+42TxxlJxT6D@slm.duckdns.org>
From:   Nathan Huckleberry <nhuck@google.com>
Date:   Wed, 18 Jan 2023 18:01:04 -0800
Message-ID: <CAJkfWY4Az45dNkPu5JpDsiMV-gRLe2VjVuixQd9xNG7zdLb4jA@mail.gmail.com>
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

Hi Tejun,

> Given that its use case mostly intersects with WQ_HIGHPRI, would it make
> more sense to add a switch to alter its behavior instead? I don't really
> like the idea of pushing the decision between WQ_HIGHPRI and WQ_SCHED_FIFO
> to each user.

Do you think something similar should be done for WQ_UNBOUND? In most
places where WQ_HIGHPRI is used, WQ_UNBOUND is also used because it
boosts performance. However, I suspect that most of these benchmarks
were done on x86-64. I've found that WQ_UNBOUND significantly reduces
performance on arm64/Android.

From the documentation, using WQ_UNBOUND for performance doesn't seem
correct. It's only supposed to be used for long-running work. It might
make more sense to get rid of WQ_UNBOUND altogether and only move work
to unbound worker pools once it has stuck around for long enough.

Android will probably need to remove WQ_UNBOUND from all of these
performance critical users.

If there are performance benefits to using unbinding workqueues from
CPUs on x86-64, that should probably be a config flag, not controlled
by every user.

Thanks,
Huck

>
> Thanks.
>
> --
> tejun
