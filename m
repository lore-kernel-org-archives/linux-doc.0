Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03966C77B7C
	for <linux-doc@archiver.kernel.org>; Sun,  7 May 2023 14:26:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230225AbjEGO0s (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 7 May 2023 10:26:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41712 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229653AbjEGO0r (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 7 May 2023 10:26:47 -0400
Received: from smtp-relay-internal-1.canonical.com (smtp-relay-internal-1.canonical.com [185.125.188.123])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E86A25FFD
        for <linux-doc@vger.kernel.org>; Sun,  7 May 2023 07:26:44 -0700 (PDT)
Received: from mail-ed1-f71.google.com (mail-ed1-f71.google.com [209.85.208.71])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
        (No client certificate requested)
        by smtp-relay-internal-1.canonical.com (Postfix) with ESMTPS id C8CFF3F229
        for <linux-doc@vger.kernel.org>; Sun,  7 May 2023 14:26:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=canonical.com;
        s=20210705; t=1683469602;
        bh=YnfFAM3r3KCjfkqIxtX/kqifZvcC8kbbuNC04ZHIoR0=;
        h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
         Content-Type:In-Reply-To;
        b=C9tzCk2itjKLJbzPA7bkdVMK5EWrReokNSDnf5CUY6TLTgqJ6WPXuMnKDjwns6QlN
         C5DsWkM3nSH1GlJNnrEmkj0J6LblXe0dIl5Ra3Ye/M34uxe1N6klLHLqO1xEUO9ci6
         804j79iaM0cWU7luoEVv7iSnHXyT6olHcvYPsp62bLE/iuSiBe39Xjh5/MWm3h3ya3
         Jildu3Ubx8rYIwqaxFb2J7n8CCFFIpVOhcwCSO/e6IXKVOewNmzHvUSEZ1kPI83z1s
         G1DTcNDBmLKDlX7B57/4fV6pcmOpYpBWfxcJIK5oBJWUdl6D8I0olTZgC1ZGLNFzE6
         Wm2lTqkcITp2A==
Received: by mail-ed1-f71.google.com with SMTP id 4fb4d7f45d1cf-50bc6c6b9dbso5248054a12.0
        for <linux-doc@vger.kernel.org>; Sun, 07 May 2023 07:26:42 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683469602; x=1686061602;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=YnfFAM3r3KCjfkqIxtX/kqifZvcC8kbbuNC04ZHIoR0=;
        b=acPr3KX9xsRX7QnnHOy4xuChyKgiod42mDoFtwbv31nlDMZQfttokzI6dK1qBAKe9R
         XlQ4WM/qlV/6IOi6XWrsOQuSqRu59aGV6QPlfmXBUpDSHCLDtuQZl/zu6xnr88jEK1QV
         jQ//iH/Xtmrkk1JSqKd4CDLboQLo85P4tL3jmQQZWqXIylMEtxUvSVNluTIJrKcPDpxt
         G3tquXs61Waz3ZLG2MpOjYpdDXCtSytEAZ2FQLgPmUHTeRVjULhV6+AqxB/LIv8+yxxd
         q5ixxgvXAOmyfq01jfqDAVMaTHGGzGTxVEQYIGvqnjcR6NksFJbz6zEsrwNflpcztB9e
         hInw==
X-Gm-Message-State: AC+VfDxBzz5SzG+syq5Vp+YnRiUVeHo6vWbvn0AA0lxZR17oJ22PLyUV
        olBwXD2xFHFtm/grond0Z0ZWwAJCxCqcHDJwvxHJg5cDuPS7rMNY3IWIGX7hgvuH8AWhK2YfI+a
        UI1clYSSkf9tWo/PNpXgMD3cUOBBi9FNrOsGDSQ==
X-Received: by 2002:a17:907:96a8:b0:957:1dda:853b with SMTP id hd40-20020a17090796a800b009571dda853bmr7104659ejc.24.1683469602406;
        Sun, 07 May 2023 07:26:42 -0700 (PDT)
X-Google-Smtp-Source: ACHHUZ6quu+Tgz2NaYlwp8vk71dugri7IWEbGjG1Cq15nDr5LijXJ/5PduySlRy0qD/Z5zH5Vmm/EA==
X-Received: by 2002:a17:907:96a8:b0:957:1dda:853b with SMTP id hd40-20020a17090796a800b009571dda853bmr7104646ejc.24.1683469602039;
        Sun, 07 May 2023 07:26:42 -0700 (PDT)
Received: from localhost (host-79-20-89-124.retail.telecomitalia.it. [79.20.89.124])
        by smtp.gmail.com with ESMTPSA id f11-20020a170906560b00b009662b4230cesm1725285ejq.148.2023.05.07.07.26.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 07 May 2023 07:26:41 -0700 (PDT)
Date:   Sun, 7 May 2023 16:26:41 +0200
From:   Andrea Righi <andrea.righi@canonical.com>
To:     Steven Rostedt <rostedt@goodmis.org>
Cc:     Frederic Weisbecker <frederic@kernel.org>,
        Ingo Molnar <mingo@kernel.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        "Rafael J. Wysocki" <rafael@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Salvatore Bonaccorso <carnil@debian.org>,
        Pawan Gupta <pawan.kumar.gupta@linux.intel.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
        Anna-Maria Behnsen <anna-maria@linutronix.de>
Subject: Re: [PATCH] timers/nohz: introduce nohz_full_aggressive
Message-ID: <ZFe1IY+TdzSC0RLZ@righiandr-XPS-13-7390>
References: <20230507090700.18470-1-andrea.righi@canonical.com>
 <20230507100852.54a354ca@rorschach.local.home>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230507100852.54a354ca@rorschach.local.home>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, May 07, 2023 at 10:08:52AM -0400, Steven Rostedt wrote:
> 
> [ Added Anna-Maria who is doing some timer work as well ]
> 
> On Sun,  7 May 2023 11:07:00 +0200
> Andrea Righi <andrea.righi@canonical.com> wrote:
> 
> > Overview:
> > 
> > nohz_full is a feature that allows to reduce the number of CPU tick
> > interrupts, thereby improving energy efficiency and reducing kernel
> > jitter.
> 
> Hmm, I never thought of NOHZ_FULL used for energy efficiency, as the
> CPU is still running user space code, and there's really nothing
> inherently more power consuming with the tick.

The idea here was to try to reduce the tick also on the timekeeping CPU
to have more idle time (because at least 1 CPU is periodically ticking
with nohz_full=all).

But my patch was mostly a toy patch and the real purpose was really to
get some advices/guidance on the tick/nohz topic.

> 
> > 
> > This works by stopping the tick interrupts on the CPUs that are either
> > idle or that have only one runnable task on them (there is no reason to
> > periodically interrupt the execution of a single running task if none
> > else is waiting to acquire the same CPU).
> > 
> > It is not possible to configure all the available CPUs to work in the
> > nohz_full mode, at least one non-adaptive-tick CPU must be periodically
> > interrupted to properly handle timekeeping tasks in the system (such as
> > the gettimeofday() syscall returning accurate values).
> 
> Do we really need nohz_full, instead, I think you want to look at what
> Anna-Maria is doing with moving the timer "manager" around to make sure
> that the tick stays on busy CPUs.
> 
> Again, nohz_full is not for power consumption savings, but instead to
> reduce kernel interruption in user space.

Will definitely look at Anna-Maria's work.

> 
> > 
> > However, under certain conditions, we may want to relax this constraint,
> > accepting potential time inaccuracies in the system, in order to provide
> > additional benefits in terms of power consumption, performance and/or
> > reduce kernel jitter even more.
> > 
> > For this reason introduce the new parameter nohz_full_aggressive.
> > 
> > This option allows to enforce nozh_full across all the CPUs (even the
> > timekeeping CPU) at the cost of having potential timer inaccuracies in
> > the system.
> > 
> > Test:
> > 
> >  - Hardware: Dell XPS 13 7390 w/ 8 cores
> > 
> >  - Kernel is using CONFIG_HZ=1000 (worst case scenario in terms of
> >    power consumption and kernel jitter) and nohz_full=all
> > 
> >  - Measure interrupts and power consumption when the system is idle and
> >    with 2, 4 and 8 cpu hogs
> > 
> > Result:
> > 
> > The following numbers have been collected using turbostat and dstat
> > measuring the average over a 5min run for each test.
> > 
> > irqs/sec             idle     1 CPU hog  2 CPU hogs  4 CPU hogs  8 CPU hogs
> >                      ------------------------------------------------------
> > nohz_full            1036.679  1047.522    1046.203    1048.590    1074.867
> > nohz_full_aggressive   98.685   106.296     127.587     146.586    1062.277
> > 
> > Power (Watt)         idle     1 CPU hog  2 CPU hogs  4 CPU hogs  8 CPU hogs
> >                      ------------------------------------------------------
> > nohz_full            0.502 W    3.436 W    3.755 W    6.187 W    6.019 W
> > nohz_full_aggressive 0.301 W    2.372 W    2.372 W    6.005 W    6.016 W
> > 
> > % power reduction     40.04%     30.97%     36.83%      2.94%      0.05%
> > 
> 
> Nice.
> 
> Now I doubt this is acceptable considering the side effects that the
> timer inaccuracy can cause. I think this breaks some basic assumptions
> in both the kernel and user space.

I've been running this nohz_full_aggressive patch for some days on my
laptop without any evident side effect, but I'm pretty sure it can break
something, considering that timing potentially can become totally
unreliable.

I was also wondering if we could try to implement a kind of dynamic HZ
scaling (like scaling HZ up/down dynamically at runtime or even at boot
time), but it seems quite complicated (and scary, especially looking at
the code in jiffies / timers, i.e. all the constants in
./kernel/time/timeconst.bc).

I remember there used to be a dynamic-hz patch a long long time ago by
Andrea Arcangeli, but I couldn't find any recent work on this topic.

> 
> Now, I think what is really happening here is that you are somewhat
> simulating the results that Anna-Maria has indirectly. That is, you
> just prevent an idle CPU from waking up to handle interrupts when not
> needed.
> 
> Anna-Maria,
> 
> Do you have some patches that Andrea could test with?
> 
> Thanks,
> 
> -- Steve

Thanks for looking at this (and I'm happy to help Anna-Maria with any
test).

-Andrea
