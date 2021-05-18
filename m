Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE3C1C433B4
	for <linux-doc@archiver.kernel.org>; Tue, 18 May 2021 18:56:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BD8F06135B
	for <linux-doc@archiver.kernel.org>; Tue, 18 May 2021 18:56:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245037AbhERS5a (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 18 May 2021 14:57:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59612 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236295AbhERS5a (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 18 May 2021 14:57:30 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2919C061760
        for <linux-doc@vger.kernel.org>; Tue, 18 May 2021 11:56:11 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id g38so14647726ybi.12
        for <linux-doc@vger.kernel.org>; Tue, 18 May 2021 11:56:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=U5LLkV364fFy+W60IIkSO6ynttP+rk35+EuRn6ckGs8=;
        b=cxprohY/XMTUx1TEQw8jbzPmXFucnMNA2eyWUf19LpmAQx4UNLsmqbHDZHdjS/CaGr
         t03JLmDOtp4Xg8I94GL554PMO32h1RtbAqafRiUuHeVq0UM4yvTJUOloXYB06ANBfGoL
         jHHUFpm3nc2I9VvFuOTc16xcLvyF/tSSQeTmyKXCLvcacBJg/QcxMiYoGjz3FPLCq2i4
         yYN8KkaSHTDa9C4UeiuwVYyH/i+SWrdUN9pY85oTs04kt0M7iKY9mN+soWEbt1EI4dpk
         edMxfCj+tyiAfv6N8heO33kP/Uy2yt6kyaDwkgF3bgtxtw/079Q1Rsuq/cikCVm577W8
         /QhA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=U5LLkV364fFy+W60IIkSO6ynttP+rk35+EuRn6ckGs8=;
        b=Xa4mgVss1TCAwvb6NNjCbFtGo2ckwtwDW3oYBRMmVMUmC8A7ULUres67V8Vwmgom/P
         Zv9eoBbDlVXtvvnSrD0pVhzIFhPF4asJFfecFs4kJSp4u/ZRU1DSDgLTHJn7yb6SEgtL
         9kOkXfi+lvQDnDGbaLXygNUAW09iP6+CgMKfZjhWSlMwZGUfMoXDjBTmQxmDkSYydQgy
         qjy26ihZd9e074o10GiaKTH8CcEp0Vig23LcMTqoEGtrCRmt23+wp2MSOTX0jm8ptgZ8
         Pu/+dR1+DhobC4GrdwHySn4s6kYUKl8WC8WvH/Kl95PrRNfJNfFQb8FLy1/uLuIoplTK
         e49w==
X-Gm-Message-State: AOAM532syfQA6Fduxf0kXfVD2aA1w/FN6ebit4CoK8gz/6cD9rSmsY9D
        WbkHLLSui4lxGOJ4TjFzCuQPwCOz8OTfXmg45tKcjw==
X-Google-Smtp-Source: ABdhPJw+r9Vs8W/wHNhLBVF/L2/v9zN6CWY6uzHU1K20kYiRC4gsip28a5tC3+Qqg8OJDi8hfcKE77la5Q0Nvw9ThKI=
X-Received: by 2002:a25:7ec4:: with SMTP id z187mr9138416ybc.136.1621364170924;
 Tue, 18 May 2021 11:56:10 -0700 (PDT)
MIME-Version: 1.0
References: <20210518020200.1790058-1-surenb@google.com> <20210518185251.GI5618@worktop.programming.kicks-ass.net>
In-Reply-To: <20210518185251.GI5618@worktop.programming.kicks-ass.net>
From:   Suren Baghdasaryan <surenb@google.com>
Date:   Tue, 18 May 2021 11:55:59 -0700
Message-ID: <CAJuCfpFVEmYdnqDz+-txLtxM3OhLTyQUJPPP-jLq1YPg0fZ_dA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] cgroup: make per-cgroup pressure stall tracking configurable
To:     Peter Zijlstra <peterz@infradead.org>
Cc:     Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
        Zefan Li <lizefan.x@bytedance.com>,
        Ingo Molnar <mingo@redhat.com>,
        Juri Lelli <juri.lelli@redhat.com>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        Dietmar Eggemann <dietmar.eggemann@arm.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Benjamin Segall <bsegall@google.com>,
        Mel Gorman <mgorman@suse.de>, Minchan Kim <minchan@kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Daniel Bristot de Oliveira <bristot@redhat.com>,
        "Paul E . McKenney" <paulmck@kernel.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Thomas Gleixner <tglx@linutronix.de>, macro@orcam.me.uk,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        cgroups mailinglist <cgroups@vger.kernel.org>,
        kernel-team <kernel-team@android.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, May 18, 2021 at 11:52 AM Peter Zijlstra <peterz@infradead.org> wrote:
>
> On Mon, May 17, 2021 at 07:02:00PM -0700, Suren Baghdasaryan wrote:
>
> > diff --git a/kernel/sched/psi.c b/kernel/sched/psi.c
> > index cc25a3cff41f..4b8e72640ac9 100644
> > --- a/kernel/sched/psi.c
> > +++ b/kernel/sched/psi.c
> > @@ -148,6 +148,7 @@
> >  static int psi_bug __read_mostly;
> >
> >  DEFINE_STATIC_KEY_FALSE(psi_disabled);
> > +DEFINE_STATIC_KEY_FALSE(psi_cgroups_disabled);
>
> I'm thinking the whole thing will be easier/clearer when you make this:
>
> DEFINE_STATIC_KEY_TRUE(psi_cgroups_enabled);
>

Sounds good. Will respin another version. Thanks for reviewing!


> >
> >  #ifdef CONFIG_PSI_DEFAULT_DISABLED
> >  static bool psi_enable;
> > @@ -211,6 +212,9 @@ void __init psi_init(void)
> >               return;
> >       }
> >
> > +     if (!cgroup_psi_enabled())
> > +             static_branch_enable(&psi_cgroups_disabled);
>
>         if (!cgroup_psi_enabled())
>                 static_branch_disable(&psi_cgroups_enabled);
>
> > +
> >       psi_period = jiffies_to_nsecs(PSI_FREQ);
> >       group_init(&psi_system);
> >  }
> > @@ -744,23 +748,23 @@ static void psi_group_change(struct psi_group *group, int cpu,
> >
> >  static struct psi_group *iterate_groups(struct task_struct *task, void **iter)
> >  {
> > +     if (*iter == &psi_system)
> > +             return NULL;
> > +
> >  #ifdef CONFIG_CGROUPS
> > +     if (!static_branch_likely(&psi_cgroups_disabled)) {
>
>         if (static_branch_likely(&psi_cgroups_enabled)) {
>
> > +             struct cgroup *cgroup = NULL;
> >
> > +             if (!*iter)
> > +                     cgroup = task->cgroups->dfl_cgrp;
> > +             else
> > +                     cgroup = cgroup_parent(*iter);
> >
> > +             if (cgroup && cgroup_parent(cgroup)) {
> > +                     *iter = cgroup;
> > +                     return cgroup_psi(cgroup);
> > +             }
> >       }
> >  #endif
> >       *iter = &psi_system;
> >       return &psi_system;
>
> But yes, very nice.
>
> --
> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
>
