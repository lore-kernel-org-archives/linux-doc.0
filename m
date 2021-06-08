Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C260BC4743E
	for <linux-doc@archiver.kernel.org>; Tue,  8 Jun 2021 16:26:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id AC3D361184
	for <linux-doc@archiver.kernel.org>; Tue,  8 Jun 2021 16:26:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233804AbhFHQ22 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 8 Jun 2021 12:28:28 -0400
Received: from mail-yb1-f173.google.com ([209.85.219.173]:45943 "EHLO
        mail-yb1-f173.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233485AbhFHQ2Z (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Jun 2021 12:28:25 -0400
Received: by mail-yb1-f173.google.com with SMTP id g38so30985808ybi.12
        for <linux-doc@vger.kernel.org>; Tue, 08 Jun 2021 09:26:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=O9BYezu8gyZabw4yWCqgrj5D/dzmRPqg3cqOBnuX70I=;
        b=JFQV+NEkpW/iFhrOOSAEJdSvL4Y5t7uoDY1dd51Y2Duhk5IpfAeqhuOyRWPFleGd3j
         IYdDjObTU/mSwgFZLLbQl5DFxzATFnERzNKUj5O4DVbW7GoQzRu3HVFLrA6eE932UFqa
         TUBINtgBShb/FCjRoTrYIdj2+wQRXbb2T1VZ52hbLSQRcCbHE42KncKpaSAw32jsGP5E
         aOHoGGn9J8Esk/WJ6zRNYgghsabPfwjmjUR7H7m9bfTjOaWn1kBnCbrIJrYVMBeHab7V
         9z39z1pHc3ZsyC7nRCPnIz4iOwdfrAki0j7U0Jb8FcXcaGkp0//wtiz90eUBg7r+88WM
         BlZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=O9BYezu8gyZabw4yWCqgrj5D/dzmRPqg3cqOBnuX70I=;
        b=WKQFGlbj5lfUkJ88gYU31vwREiSl5w4QqGx4U9ruIfHSx05CayxLewPZskJfumzBe8
         ga7iTcKMUH2PYV3I39KEezHTElCFRD0SpNGyA5ERtY+iVUk/wuIZXqHjDG3lEFYqH9JK
         fhot3QFzMxpOWPeQsUBxfMcFqRLhicjB3GzQWIHKUToZddxD6V6ymGsm/MnDACBFwaCl
         myB3bUrvIKe3xTHPbKgSR7JayMKIzMDpP/DTZQZbKXV39PLM9jBmDtVWOB+s49lM8IOa
         8TNgv7tRLm88TDEYdIu38vCLJht6SDzsfmoU57seiJFdm2W/Br2E/AeoGl2x9sZPTM+I
         SEaw==
X-Gm-Message-State: AOAM532GLtjH2ut+uZ/TCSkR96Ut+pU6PdRLplRUAGxGk9nkmmVLrq6Y
        gewGV6psrkmQ0TOD7CVMARmHfo9chDyFga66lJN2Wg==
X-Google-Smtp-Source: ABdhPJy/90mDe1H2hifctB9B/7ALX5JPz820xu2hHqF2Ww069zzxmnIKlkaoYn4bNVvu6YINVAbfCT1TVBOcLPHP9dE=
X-Received: by 2002:a25:ade3:: with SMTP id d35mr34223802ybe.190.1623169519031;
 Tue, 08 Jun 2021 09:25:19 -0700 (PDT)
MIME-Version: 1.0
References: <20210524195339.1233449-1-surenb@google.com> <YKz07nx3E8UEo1xa@cmpxchg.org>
In-Reply-To: <YKz07nx3E8UEo1xa@cmpxchg.org>
From:   Suren Baghdasaryan <surenb@google.com>
Date:   Tue, 8 Jun 2021 09:25:08 -0700
Message-ID: <CAJuCfpE2U3LAZP_42b7XV7rfQTdJWbTVw43TDcxGM95oW03upQ@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] cgroup: make per-cgroup pressure stall tracking configurable
To:     Johannes Weiner <hannes@cmpxchg.org>
Cc:     Tejun Heo <tj@kernel.org>, Zefan Li <lizefan.x@bytedance.com>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Shakeel Butt <shakeelb@google.com>,
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

On Tue, May 25, 2021 at 6:00 AM Johannes Weiner <hannes@cmpxchg.org> wrote:
>
> On Mon, May 24, 2021 at 12:53:39PM -0700, Suren Baghdasaryan wrote:
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
> Acked-by: Johannes Weiner <hannes@cmpxchg.org>

Gentle ping for cgroup folks to please take a look at the cgroup interface part.
