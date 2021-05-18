Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 056DBC433B4
	for <linux-doc@archiver.kernel.org>; Tue, 18 May 2021 18:23:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D2B60611B0
	for <linux-doc@archiver.kernel.org>; Tue, 18 May 2021 18:23:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1351526AbhERSYf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 18 May 2021 14:24:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52116 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351499AbhERSYf (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 18 May 2021 14:24:35 -0400
Received: from mail-yb1-xb2c.google.com (mail-yb1-xb2c.google.com [IPv6:2607:f8b0:4864:20::b2c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EB39FC061573
        for <linux-doc@vger.kernel.org>; Tue, 18 May 2021 11:23:15 -0700 (PDT)
Received: by mail-yb1-xb2c.google.com with SMTP id r8so14541556ybb.9
        for <linux-doc@vger.kernel.org>; Tue, 18 May 2021 11:23:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=XVc3DguSfxxYVXN0x5EkHPuQLUSzK1Aah2uiT3qFU3o=;
        b=Eq/h3JfOdyqBY6BBO5kopAzTdIl0PltU1tMCHbexs2XtJruCLS1NvHNDaPu1TNILLK
         LHW5iZ0PyiH/o5kSjrNNGuJn5VLbno2vPoiX3TrYdYpPP+dfPyq0fl8p/fZbukNNcqit
         ec/bdh3lmKUH+XySetmyMsKvkdVT/1tfFwUM9MU75ZB+b3JCX898BSNR6vDFJaTtPVjG
         AjM2bern9kVDfDrFDzOmq9lZG5sCHq1Ebvu2v21Jqbd5GRRFTiu7k52IrwDexYDAcjcF
         qfiKoeaWruQbbSWciPbQN4CxIsaciRekjAsII29RgOcSM/QpaHM3jd9fk/j+AifNXOvX
         SCtQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=XVc3DguSfxxYVXN0x5EkHPuQLUSzK1Aah2uiT3qFU3o=;
        b=sqbaqCXw09E0KzcOlLzEOpKPxFRU7SDByx6lpjx+K584zNu8uPCAalUXDc8y0plRTN
         h4Q9P0C0LYo2ozmUmzZth4Xl0vWQMGPK8KQE+/Nw0Q4w1k8jsowkryObzwFMzqDecT8j
         lpl1I564peiKsHQQF3QECTEUUVXoSwiZ7hYpmdpjfYNwkkvRSaYS9FIbXm2821G7TkZD
         4iuyoDYxP9zFFH/F23nAj+o2g/AqO1PW3WanRzPIvI/7/+Ez5sguxRL4C2R/68MtaPYn
         bwPOBA38zJ7z8mVvOreG7KZKPfaSOol9m1AEZKTEOJkCIzIfj2+9/qLt7YLEp+65ss4P
         9oFA==
X-Gm-Message-State: AOAM533ibg+M5w0zXHjlZHAksEQLgQ3y7ouSowt21aLGbf04H0PFOhwe
        7RI8PCQprBkCf+jdh5kzkU45QQunXIut7Ys3XMziSQ==
X-Google-Smtp-Source: ABdhPJzWO1Acrw6zrrOBxGupwyTWQVrMszflylG4NfHUekUTJSDPHLp8pyQ4hZO0U6sPW9jd/DVLtNs3JKWBra3ElPo=
X-Received: by 2002:a25:c801:: with SMTP id y1mr9726961ybf.250.1621362195006;
 Tue, 18 May 2021 11:23:15 -0700 (PDT)
MIME-Version: 1.0
References: <20210518020200.1790058-1-surenb@google.com> <CALvZod7VBQMyftOffc8maCKtDwybLWGQNkk+R0M2SJPy2BuEjg@mail.gmail.com>
In-Reply-To: <CALvZod7VBQMyftOffc8maCKtDwybLWGQNkk+R0M2SJPy2BuEjg@mail.gmail.com>
From:   Suren Baghdasaryan <surenb@google.com>
Date:   Tue, 18 May 2021 11:23:04 -0700
Message-ID: <CAJuCfpHXhncetUziX=RS0kYTEQKHkeNXZA-hnz26bKkEJrHYzA@mail.gmail.com>
Subject: Re: [PATCH v2 1/1] cgroup: make per-cgroup pressure stall tracking configurable
To:     Shakeel Butt <shakeelb@google.com>
Cc:     Tejun Heo <tj@kernel.org>, Johannes Weiner <hannes@cmpxchg.org>,
        Zefan Li <lizefan.x@bytedance.com>,
        Ingo Molnar <mingo@redhat.com>,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
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
        Cgroups <cgroups@vger.kernel.org>,
        kernel-team <kernel-team@android.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, May 18, 2021 at 11:08 AM Shakeel Butt <shakeelb@google.com> wrote:
>
> On Mon, May 17, 2021 at 7:02 PM Suren Baghdasaryan <surenb@google.com> wrote:
> >
> > PSI accounts stalls for each cgroup separately and aggregates it at each
> > level of the hierarchy. This causes additional overhead with psi_avgs_work
> > being called for each cgroup in the hierarchy. psi_avgs_work has been
> > highly optimized, however on systems with large number of cgroups the
> > overhead becomes noticeable.
> > Systems which use PSI only at the system level could avoid this overhead
> > if PSI can be configured to skip per-cgroup stall accounting.
> > Add "cgroup_disable=pressure" kernel command-line option to allow
> > requesting system-wide only pressure stall accounting. When set, it
> > keeps system-wide accounting under /proc/pressure/ but skips accounting
> > for individual cgroups and does not expose PSI nodes in cgroup hierarchy.
> >
> > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
>
> I am assuming that this is for Android and at the moment Android is
> only interested in system level pressure. I am wondering if there is
> any plan for Android to have cgroup hierarchies with explicit limits
> in future?

Correct and yes, we would like to use memcgs to limit memory in the
future, however we do not plan on using per-cgroup psi so far.

>
> If yes, then I think we should follow up (this patch is fine
> independently) with making this feature more general by explicitly
> enabling psi for each cgroup level similar to how we enable
> controllers through cgroup.subtree_control.
>
> Something like:
>
> $ echo "+psi" > cgroup.subtree_control
>
> This definitely would be helpful for server use cases where jobs do
> sub-containers but might not be interested in psi but the admin is
> interested in the top level job's psi.

Haven't thought about it before but that makes sense to me.
