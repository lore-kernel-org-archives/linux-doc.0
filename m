Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9B592C433DB
	for <linux-doc@archiver.kernel.org>; Wed, 17 Feb 2021 15:01:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5FDE464E4A
	for <linux-doc@archiver.kernel.org>; Wed, 17 Feb 2021 15:01:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233737AbhBQPA5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 17 Feb 2021 10:00:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233730AbhBQPAt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 17 Feb 2021 10:00:49 -0500
Received: from mail-lf1-x132.google.com (mail-lf1-x132.google.com [IPv6:2a00:1450:4864:20::132])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B129BC061756
        for <linux-doc@vger.kernel.org>; Wed, 17 Feb 2021 07:00:08 -0800 (PST)
Received: by mail-lf1-x132.google.com with SMTP id m22so21967088lfg.5
        for <linux-doc@vger.kernel.org>; Wed, 17 Feb 2021 07:00:08 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Rh+5DVV2EZcIZwJ1XuaHOxn/tnJr/iJkF+N040Yn/HY=;
        b=M2F9g6UwE5JX/c5d+1RDp2TjHOgK94HobVq5+b+33U+hA6d1v8leYWM7ITPeSwqBw6
         wj51n/YUEQM3/eGuAYvT8/qAWMZii7Yik+bLrs7GvTwFJbwFE7GcBC+6qfNhU6/0dLq1
         hwzHf2OkLBmUdv4bHUJtKup9MPpD8HuAf/ndec9RzEXUpHfdvo40swjWsFNjwpF2C/zx
         7SAEyvvlO/NLKOwoSu+ffhOP5o2t08+/NWa3VXVBAo5i8vzoO9/FpPeZEAO673Zid6Dv
         9XaU04B0WRvQfG1NvhQ9l4NcG8K+XCRgrEqcgSEhauKVEuPYoZYrp3lI07JNWy4mjrNi
         NPlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Rh+5DVV2EZcIZwJ1XuaHOxn/tnJr/iJkF+N040Yn/HY=;
        b=pHKzMvXjRDlKVs292UcqnlX/miUYhQAzS7TvZbc8caMITAsxVJbUipCdqwdELCiaaq
         +bKmAxgr45dZMic22i0yQe7oepG2UpGq//9qK55jWnzMHWIP6pTmviD+TxKSRBRO0eVD
         ZxHKDuZNuqjebXT+mufD73b07cNcJ7vYdNJtdg/l+KUlrwgaegRXf06jILcQQOU5wjUt
         a0oPMTwUNkXMRhqQjrw6FF1n7StIPyz+OkIS5S0z2/I33EdLXDkmtLGxVyH/VlDVTIRd
         CXYUPB2i8o44ZPPr0shhTcXXms0up/NB1tD5klSl2z9ZeZwamtcAp2CaZVs/p5sZBWp9
         Cebw==
X-Gm-Message-State: AOAM531Q2NtgyUOh1kpRS02Bha2+mTEd1EymcvR+XHA5AMesN3j311DQ
        6UoGeAwnqH5e/Ia/gIlJuKDWyCfExCJICt1ev48H+A==
X-Google-Smtp-Source: ABdhPJxC3vk206lSTN9W66FKVHDRC0E1DkhIxFEY6OsGgcDpuUBwmLqZwlDnx1hY/9TIQakOxaCd4H9IKdKLhqkPPus=
X-Received: by 2002:a05:6512:10c8:: with SMTP id k8mr15123602lfg.299.1613574006710;
 Wed, 17 Feb 2021 07:00:06 -0800 (PST)
MIME-Version: 1.0
References: <20210216030713.79101-1-eiichi.tsukata@nutanix.com>
 <YCt+cVvWPbWvt2rG@dhcp22.suse.cz> <b821f4de-3260-f6e2-469f-65ccfa699bb7@google.com>
In-Reply-To: <b821f4de-3260-f6e2-469f-65ccfa699bb7@google.com>
From:   Shakeel Butt <shakeelb@google.com>
Date:   Wed, 17 Feb 2021 06:59:55 -0800
Message-ID: <CALvZod6M5L-NJMx5R9ySnGJG5Fe9G9DagWJzt2D7iNuRiaE96g@mail.gmail.com>
Subject: Re: [RFC PATCH] mm, oom: introduce vm.sacrifice_hugepage_on_oom
To:     David Rientjes <rientjes@google.com>,
        Johannes Weiner <hannes@cmpxchg.org>, Tejun Heo <tj@kernel.org>
Cc:     Michal Hocko <mhocko@suse.com>,
        Eiichi Tsukata <eiichi.tsukata@nutanix.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Mike Kravetz <mike.kravetz@oracle.com>, mcgrof@kernel.org,
        Kees Cook <keescook@chromium.org>, yzaikin@google.com,
        Andrew Morton <akpm@linux-foundation.org>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux MM <linux-mm@kvack.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        felipe.franciosi@nutanix.com
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Feb 16, 2021 at 5:25 PM David Rientjes <rientjes@google.com> wrote:
>
> On Tue, 16 Feb 2021, Michal Hocko wrote:
>
> > > Hugepages can be preallocated to avoid unpredictable allocation latency.
> > > If we run into 4k page shortage, the kernel can trigger OOM even though
> > > there were free hugepages. When OOM is triggered by user address page
> > > fault handler, we can use oom notifier to free hugepages in user space
> > > but if it's triggered by memory allocation for kernel, there is no way
> > > to synchronously handle it in user space.
> >
> > Can you expand some more on what kind of problem do you see?
> > Hugetlb pages are, by definition, a preallocated, unreclaimable and
> > admin controlled pool of pages.
>
> Small nit: true of non-surplus hugetlb pages.
>
> > Under those conditions it is expected
> > and required that the sizing would be done very carefully. Why is that a
> > problem in your particular setup/scenario?
> >
> > If the sizing is really done properly and then a random process can
> > trigger OOM then this can lead to malfunctioning of those workloads
> > which do depend on hugetlb pool, right? So isn't this a kinda DoS
> > scenario?
> >
> > > This patch introduces a new sysctl vm.sacrifice_hugepage_on_oom. If
> > > enabled, it first tries to free a hugepage if available before invoking
> > > the oom-killer. The default value is disabled not to change the current
> > > behavior.
> >
> > Why is this interface not hugepage size aware? It is quite different to
> > release a GB huge page or 2MB one. Or is it expected to release the
> > smallest one? To the implementation...
> >
> > [...]
> > > +static int sacrifice_hugepage(void)
> > > +{
> > > +   int ret;
> > > +
> > > +   spin_lock(&hugetlb_lock);
> > > +   ret = free_pool_huge_page(&default_hstate, &node_states[N_MEMORY], 0);
> >
> > ... no it is going to release the default huge page. This will be 2MB in
> > most cases but this is not given.
> >
> > Unless I am mistaken this will free up also reserved hugetlb pages. This
> > would mean that a page fault would SIGBUS which is very likely not
> > something we want to do right? You also want to use oom nodemask rather
> > than a full one.
> >
> > Overall, I am not really happy about this feature even when above is
> > fixed, but let's hear more the actual problem first.
>
> Shouldn't this behavior be possible as an oomd plugin instead, perhaps
> triggered by psi?  I'm not sure if oomd is intended only to kill something
> (oomkilld? lol) or if it can be made to do sysadmin level behavior, such
> as shrinking the hugetlb pool, to solve the oom condition.

The senpai plugin of oomd actually is a proactive reclaimer, so oomd
is being used for more than oom-killing.

>
> If so, it seems like we want to do this at the absolute last minute.  In
> other words, reclaim has failed to free memory by other means so we would
> like to shrink the hugetlb pool.  (It's the reason why it's implemented as
> a predecessor to oom as opposed to part of reclaim in general.)
>
> Do we have the ability to suppress the oom killer until oomd has a chance
> to react in this scenario?

There is no explicit knob but there are indirect ways to delay the
kernel oom killer. In the presence of reclaimable memory the kernel is
very conservative to trigger the oom-kill. I think the way Facebook is
achieving this in oomd is by using swap to have good enough
reclaimable memory and then using memory.swap.high to throttle the
workload's allocation rates which will increase the PSI as well. Since
oomd pools PSI, it will be able to react before the kernel oom-killer.
