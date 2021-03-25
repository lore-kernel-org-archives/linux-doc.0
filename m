Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 10045C433C1
	for <linux-doc@archiver.kernel.org>; Thu, 25 Mar 2021 21:51:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D2A6D61A27
	for <linux-doc@archiver.kernel.org>; Thu, 25 Mar 2021 21:51:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230517AbhCYVvP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 25 Mar 2021 17:51:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34070 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231213AbhCYVux (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 25 Mar 2021 17:50:53 -0400
Received: from mail-qk1-x735.google.com (mail-qk1-x735.google.com [IPv6:2607:f8b0:4864:20::735])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7C921C06174A
        for <linux-doc@vger.kernel.org>; Thu, 25 Mar 2021 14:50:44 -0700 (PDT)
Received: by mail-qk1-x735.google.com with SMTP id z10so3355583qkz.13
        for <linux-doc@vger.kernel.org>; Thu, 25 Mar 2021 14:50:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xPDX5Uvos2ib1btitjeT/DSWvnYPpsVpIIBrEV7n3/w=;
        b=PzOKsYkvSBTrup8k68oKcP/7M5mr/IMYCggyr9Hm87+hGOn4uL95lVBiZBBTMOkXHT
         HvoPF6CNNcatwoKgem1fPZrwSAsRyOsgln2qBQzGjFFMdIt3pHGOP2OsBg/6EfWlN6Ja
         d9OUfAkVRzSkl7ABsAtFHIoonu2udIrkVOYeBO2zijSc5TjfkJLYcjoMuOv82TG7UVia
         CKdnKHs46LcMt2keeeFQeqvWcgvbk8nQhFOgqHAXMOV31h5j5LBjzvfNALECOOwnl8PF
         jk9myShHlWo3z4p3nwHUXt3yPfILtuSDw20e4sW3DtGoHOp12hw50vVRugbvXCdvU3kb
         VN0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xPDX5Uvos2ib1btitjeT/DSWvnYPpsVpIIBrEV7n3/w=;
        b=sY0qHz1Eh+PPoVk1/vv/y2DjY+LUw0JTsRpFRoKtEaY8oMps61F9NSSljRh1T7gh2y
         DJSzyVIBEEsdeWH7j7+hTZ5RXY1A29KRptq8JO46j8Scf+OOyhMkPdVOXJWcMW/ZgXfT
         okIdke2jFNSSaIQVl+R4rmg+61Fo3bgWOYxabbC3zFk7xk5EIz54GxU/y2g9vM6/GWLw
         1UdCALWfwO+9gij9iWYcJMVD/Z8JTf30tNVsz4Oy8hKccSdfZOLTQjuYi0OmhHb6k+4V
         t9yUb+mDE+VXlD/FYj97ipGn1S7XOAkSHHZbPFVSiwG7nV/E+H4yGlHsq4mnx+Qchpnr
         Arrg==
X-Gm-Message-State: AOAM5312oxy2r1X7qXTClvfLLpexYJ9Cucu89ljUHB5EEZPUI6tp8ko/
        x3sg3XLAg0vleWu5iDjicQVh2va5tvEh0xf8PArxJw==
X-Google-Smtp-Source: ABdhPJxEiUL0lGnCquAGKAV2sAwzIEC9u8umV+RueZW7xY12lFzwzA1Izpo96Rl35iofOmhm0lCrpflesYZL3xmoEEo=
X-Received: by 2002:a37:a643:: with SMTP id p64mr9830973qke.276.1616709043374;
 Thu, 25 Mar 2021 14:50:43 -0700 (PDT)
MIME-Version: 1.0
References: <20210323035706.572953-1-joshdon@google.com> <20210324112739.GO15768@suse.de>
In-Reply-To: <20210324112739.GO15768@suse.de>
From:   Josh Don <joshdon@google.com>
Date:   Thu, 25 Mar 2021 14:50:32 -0700
Message-ID: <CABk29Nv7qwWcn4nUe_cxH-pJnppUVjHan+f-iHc8hEyPJ37jxA@mail.gmail.com>
Subject: Re: [PATCH v2] sched: Warn on long periods of pending need_resched
To:     Mel Gorman <mgorman@suse.de>
Cc:     Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Ben Segall <bsegall@google.com>,
        Daniel Bristot de Oliveira <bristot@redhat.com>,
        Luis Chamberlain <mcgrof@kernel.org>,
        Kees Cook <keescook@chromium.org>,
        Iurii Zaikin <yzaikin@google.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        linux-fsdevel@vger.kernel.org,
        David Rientjes <rientjes@google.com>,
        Oleg Rombakh <olegrom@google.com>, linux-doc@vger.kernel.org,
        Paul Turner <pjt@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Mar 24, 2021 at 4:27 AM Mel Gorman <mgorman@suse.de> wrote:
>
> I'm not a fan of the name. I know other sysctls have _enabled in the
> name but it's redundant. If you say the name out loud, it sounds weird.
> I would suggest an alternative but see below.

Now using the version rebased by Peter; this control has gone away and
we have simply a scheduling feature "LATENCY WARN"

> I suggest semantics and naming similar to hung_task_warnings
> because it's sortof similar. resched_latency_warnings would combine
> resched_latency_warn_enabled and resched_latency_warn_once. 0 would mean
> "never warn", -1 would mean always warn and any positive value means
> "warn X number of times".

See above. I'm happy with the enabled bit being toggled separately by
a sched feature; the warn_once behavior is not overloaded with the
enabling/disabling. Also, I don't see value in "warn X number of
times", given the warning is rate limited anyway.

> > +int sysctl_resched_latency_warn_ms = 100;
> > +int sysctl_resched_latency_warn_once = 1;
>
> Use __read_mostly

Good point, done.

> > +#ifdef CONFIG_SCHED_DEBUG
> > +static u64 resched_latency_check(struct rq *rq)
> > +{
> > +     int latency_warn_ms = READ_ONCE(sysctl_resched_latency_warn_ms);
> > +     u64 need_resched_latency, now = rq_clock(rq);
> > +     static bool warned_once;
> > +
> > +     if (sysctl_resched_latency_warn_once && warned_once)
> > +             return 0;
> > +
>
> That is a global variable that can be modified in parallel and I do not
> think it's properly locked (scheduler_tick is holding rq lock which does
> not protect this).
>
> Consider making resched_latency_warnings atomic and use
> atomic_dec_if_positive. If it drops to zero in this path, disable the
> static branch.
>
> That said, it may be overkill. hung_task_warnings does not appear to have
> special protection that prevents it going to -1 or lower values by accident
> either. Maybe it can afford to be a bit more relaxed because a system that
> is spamming hung task warnings is probably dead or might as well be dead.

There's no real issue if we race over modification to that sysctl.
This is intentionally not more strongly synchronized for that reason.

> > +     if (!need_resched() || WARN_ON_ONCE(latency_warn_ms < 2))
> > +             return 0;
> > +
>
> Why is 1ms special? Regardless of the answer, if the sysctl should not
> be 1 then the user should not be able to set it to 1.

Yea let me change that to !latency_warn_ms so it isn't HZ specific.

>
> > +     /* Disable this warning for the first few mins after boot */
> > +     if (now < resched_boot_quiet_sec * NSEC_PER_SEC)
> > +             return 0;
> > +
>
> Check system_state == SYSTEM_BOOTING instead?

Yea, that might be better; let me test that.

> > +     if (!rq->last_seen_need_resched_ns) {
> > +             rq->last_seen_need_resched_ns = now;
> > +             rq->ticks_without_resched = 0;
> > +             return 0;
> > +     }
> > +
> > +     rq->ticks_without_resched++;
> > +     need_resched_latency = now - rq->last_seen_need_resched_ns;
> > +     if (need_resched_latency <= latency_warn_ms * NSEC_PER_MSEC)
> > +             return 0;
> > +
>
> The naming need_resched_latency implies it's a boolean but it's not.
> Maybe just resched_latency?
>
> Similarly, resched_latency_check implies it returns a boolean but it
> returns an excessive latency value. At this point I've been reading the
> patch for a long time so I've ran out of naming suggestions :)

The "need_" part does confuse it a bit; I reworded these to hopefully
make it more clear.

> > +     warned_once = true;
> > +
> > +     return need_resched_latency;
> > +}
> > +
>
> I note that you split when a warning is needed and printing the warning
> but it's not clear why. Sure you are under the RQ lock but there are other
> places that warn under the RQ lock. I suppose for consistency it could
> use SCHED_WARN_ON even though all this code is under SCHED_DEBUG already.

We had seen a circular lock dependency warning (console_sem, pi lock,
rq lock), since printing might need to wake a waiter. However, I do
see plenty of warns under rq->lock, so maybe I missed a patch to
address this?
