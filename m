Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9CFC9C4743D
	for <linux-doc@archiver.kernel.org>; Tue,  8 Jun 2021 19:09:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 87AC060FF4
	for <linux-doc@archiver.kernel.org>; Tue,  8 Jun 2021 19:09:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236675AbhFHTLV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 8 Jun 2021 15:11:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35880 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237199AbhFHTJS (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Jun 2021 15:09:18 -0400
Received: from mail-yb1-xb2a.google.com (mail-yb1-xb2a.google.com [IPv6:2607:f8b0:4864:20::b2a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1D1AC061157
        for <linux-doc@vger.kernel.org>; Tue,  8 Jun 2021 12:02:06 -0700 (PDT)
Received: by mail-yb1-xb2a.google.com with SMTP id i4so31774776ybe.2
        for <linux-doc@vger.kernel.org>; Tue, 08 Jun 2021 12:02:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=8Q62ke2XWkCOB5xI489ufG7OUF/C+vGscmBTXHr5cls=;
        b=JefvDSOvRlIAhXCAScJI3MkrvZhUIqoSdi6+Zz2+X+DhJhDkZGIb/RKdsWCOR4WEtZ
         tF7RtQv54pePx1GdKw4blv5HZiO6Z+lQKXXIlkM4+J2ovC5QPJv2Sb7qhE6oFEBKV4gH
         eOFrb4Hd9QdANKsb8iQUrZgkWOo9+QjRdiK1KDejN9LfyG3XLhosv9XRuSbvmKi9AsrS
         CAlZXeQeb7D73fVptUQ1IgolesraCPWKtmlUw38fv7/MZZERWznE9GnfY1NBzpLWunA9
         X9aOnqH7ZcssaOPiLi1NyvLnqcwaa5HORPlh/7FDqQWHu9NO7/J8QgryUQ4CoHgt4rTP
         c/vA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=8Q62ke2XWkCOB5xI489ufG7OUF/C+vGscmBTXHr5cls=;
        b=f5e8AEzuKs74UeCXe3FW6SE0AfxmAhJwmB+lmmVfsMbIm2oP6/KhBATs/rPyEQOjbK
         uhPHga4jAImRLCrrdHzNgWZZ0O3c3Up33uH67klmaEYwSUgwJLLx6tWVB9iizk5qJhIW
         B4K3T2ymv0VlqYACudm+eRQo8Ou7EPXLVil54Aqu0L31IfjZmy5dixW48iV+lLazmTs2
         wpGra6UL1eAeXWSHRQk2B/Xdn8guZgUp6mRAdJRfd1MvkF4Zf9fTbus2BPVxXXcTiYir
         ++VJ2i6AKhXIWEqC7C0d+r8g1Ttrsf2/QVSJJEelK4PL682mseyfXKDOBkD7gFRP6E5R
         o/oA==
X-Gm-Message-State: AOAM531hDA47XhKTaFrAwR4aZDAgCULXpOkp8SHFHZzzN2Vvk3+85gTF
        SNhjUKW0fUs9hIz8OU0cxm7Aac6kZDypG33u+HqsaA==
X-Google-Smtp-Source: ABdhPJy+fNm4QOr298WGvA4Zlz2bTkxgJLA52gN0Z8CpWJHcMpPf1UbFpG1hxpnar6yV3Ga3LQ+Vlh1duPmEzUpeJQE=
X-Received: by 2002:a25:1ec2:: with SMTP id e185mr33330825ybe.23.1623178925539;
 Tue, 08 Jun 2021 12:02:05 -0700 (PDT)
MIME-Version: 1.0
References: <20210524195339.1233449-1-surenb@google.com> <YL++cWuetMvfx9Tf@slm.duckdns.org>
In-Reply-To: <YL++cWuetMvfx9Tf@slm.duckdns.org>
From:   Suren Baghdasaryan <surenb@google.com>
Date:   Tue, 8 Jun 2021 12:01:54 -0700
Message-ID: <CAJuCfpFKBpz10eMaPjcycoLrJ=m68U9=hoEZAG=02Pa+zuBVZg@mail.gmail.com>
Subject: Re: [PATCH v3 1/1] cgroup: make per-cgroup pressure stall tracking configurable
To:     Tejun Heo <tj@kernel.org>
Cc:     Johannes Weiner <hannes@cmpxchg.org>,
        Zefan Li <lizefan.x@bytedance.com>,
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

On Tue, Jun 8, 2021 at 12:01 PM Tejun Heo <tj@kernel.org> wrote:
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
> Applied to cgroup/for-5.14.
>
> Thanks.

Thanks folks!

>
> --
> tejun
