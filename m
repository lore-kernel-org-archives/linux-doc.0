Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83CDBC4743D
	for <linux-doc@archiver.kernel.org>; Tue,  8 Jun 2021 18:56:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6F4B061208
	for <linux-doc@archiver.kernel.org>; Tue,  8 Jun 2021 18:56:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236104AbhFHS63 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 8 Jun 2021 14:58:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32970 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235548AbhFHS4R (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Jun 2021 14:56:17 -0400
Received: from mail-qv1-xf35.google.com (mail-qv1-xf35.google.com [IPv6:2607:f8b0:4864:20::f35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id EF2D5C06114E
        for <linux-doc@vger.kernel.org>; Tue,  8 Jun 2021 11:51:34 -0700 (PDT)
Received: by mail-qv1-xf35.google.com with SMTP id g12so11361758qvx.12
        for <linux-doc@vger.kernel.org>; Tue, 08 Jun 2021 11:51:34 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=BHtJ01+O9MGfngUx/tkkUwGswFNUD5Vr6xavfI/bB+w=;
        b=v3P4A1Ia9fsZuLq0N6xEVC9DWIR7E5XQuvfED1xa+4ijHr+R0m5duY4PKJQvebPG15
         hRsCLgqHerQAPTwhfmwD7jTNb/ulH6gF+KGJ+w76AqRERi19GdhmSOj+dZ+2zYIxX57C
         uw4tKBJkwaiv6f2xuCQt+8NnVu5ChESNI3Z4Upi4KY8a6frhl+UguSbowW9snrC9grp6
         lqG8bEjshk27OswFtIzW06u2agWPAgiLdpeKcMkkXteZHMGasVnfRVvEUt5AH4H23uMd
         LFi9PFcCnOjOrPCZOr5VVTCXC7q9GaoKD79JiY+vGKpDQIqEBAZDqHWTraY1bruDCPsV
         Uycw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=BHtJ01+O9MGfngUx/tkkUwGswFNUD5Vr6xavfI/bB+w=;
        b=Dl/DirgYF+VvlI14ziHYYj/dix0iiKClPuH06MxDlup6p0huI+gucMNsZHZU9m/xhs
         nKiKl631scSjiEX4FxbjN10mIbCVi3DZnX26oSpjsS9sX2gnR5uYKMi+ka44vPHK6PTV
         PTrOXQdHmLxK6k7co1wjlELn9a0HTRVrWVrrLl7geXDtLvmoigX45tenhzOKj6uxFUGK
         xGsmKR37hq51l8yjXSM+nKMKtqLjKojk+LRGc7O+bCPxY7+gVxqd4AvGQ2TmGBMWbzK7
         AzppZmDPEPcO2pf8jo1gp3xlTzpqwOG+/lzMV+ZW1o8gs40patCufr1/IWc3zO2f0dSp
         IYog==
X-Gm-Message-State: AOAM531o2Wx8iBKZnffV53MdbPASbY9h4lObndDpeeaY2X920HmB1zuM
        2W3pFdYOQGEEdf1p1/nIqFyvcA==
X-Google-Smtp-Source: ABdhPJxDcpfYFvT+QzXz+jWD0tUoHBqOV1mhqCUxmPjSaeqEDUlqv5gxjBz9Vy9KsoVyiITJCIQe1w==
X-Received: by 2002:ad4:5fc7:: with SMTP id jq7mr1615457qvb.41.1623178294157;
        Tue, 08 Jun 2021 11:51:34 -0700 (PDT)
Received: from localhost (70.44.39.90.res-cmts.bus.ptd.net. [70.44.39.90])
        by smtp.gmail.com with ESMTPSA id g2sm6107432qtb.63.2021.06.08.11.51.33
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 08 Jun 2021 11:51:33 -0700 (PDT)
Date:   Tue, 8 Jun 2021 14:51:32 -0400
From:   Johannes Weiner <hannes@cmpxchg.org>
To:     Suren Baghdasaryan <surenb@google.com>
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
Subject: Re: [PATCH v3 1/1] cgroup: make per-cgroup pressure stall tracking
 configurable
Message-ID: <YL+8NG8xBJmA6lOq@cmpxchg.org>
References: <20210524195339.1233449-1-surenb@google.com>
 <YKz07nx3E8UEo1xa@cmpxchg.org>
 <CAJuCfpE2U3LAZP_42b7XV7rfQTdJWbTVw43TDcxGM95oW03upQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJuCfpE2U3LAZP_42b7XV7rfQTdJWbTVw43TDcxGM95oW03upQ@mail.gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jun 08, 2021 at 09:25:08AM -0700, Suren Baghdasaryan wrote:
> On Tue, May 25, 2021 at 6:00 AM Johannes Weiner <hannes@cmpxchg.org> wrote:
> >
> > On Mon, May 24, 2021 at 12:53:39PM -0700, Suren Baghdasaryan wrote:
> > > PSI accounts stalls for each cgroup separately and aggregates it at each
> > > level of the hierarchy. This causes additional overhead with psi_avgs_work
> > > being called for each cgroup in the hierarchy. psi_avgs_work has been
> > > highly optimized, however on systems with large number of cgroups the
> > > overhead becomes noticeable.
> > > Systems which use PSI only at the system level could avoid this overhead
> > > if PSI can be configured to skip per-cgroup stall accounting.
> > > Add "cgroup_disable=pressure" kernel command-line option to allow
> > > requesting system-wide only pressure stall accounting. When set, it
> > > keeps system-wide accounting under /proc/pressure/ but skips accounting
> > > for individual cgroups and does not expose PSI nodes in cgroup hierarchy.
> > >
> > > Signed-off-by: Suren Baghdasaryan <surenb@google.com>
> >
> > Acked-by: Johannes Weiner <hannes@cmpxchg.org>
> 
> Gentle ping for cgroup folks to please take a look at the cgroup interface part.

Tejun, this is more in cgroups territory than it is psi/scheduler, and
should go through the cgroup tree.

Both the psi and the cgroup side look good to me, and we have Peter's
ack from the scheduler too.

Do you have concerns about the cgroup side? If not, would you mind
picking this up for 5.14?

Thanks
