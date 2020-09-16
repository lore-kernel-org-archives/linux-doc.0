Return-Path: <SRS0=XgFW=CZ=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38FF2C35257
	for <linux-doc@archiver.kernel.org>; Wed, 16 Sep 2020 20:53:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D63C821941
	for <linux-doc@archiver.kernel.org>; Wed, 16 Sep 2020 20:53:41 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.b="diAhpmQr"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726280AbgIPUxl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 16 Sep 2020 16:53:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55276 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726544AbgIPQyL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Sep 2020 12:54:11 -0400
Received: from mail-pf1-x441.google.com (mail-pf1-x441.google.com [IPv6:2607:f8b0:4864:20::441])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9ECD6C0D9418
        for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2020 07:47:49 -0700 (PDT)
Received: by mail-pf1-x441.google.com with SMTP id x123so4102462pfc.7
        for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2020 07:47:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=FQGO6d/0mEB1ogv6r8XPPwwDAuJ9mmObgleVeh1W30Q=;
        b=diAhpmQrYS7M270CGrN/O5Df6Kk/JIw2jK0wB8bstS53QPuZIMXExqEKVk18DEyzjV
         lrxvcXifZ+5YUVBfWIwCtt7OL+27JGQ4L6/7JfqaU/QubBtMkdF5BiHfRNUNu5xc6s9K
         AJ7katPYRezI+CcMmjtpqq8ya/8MlrOYuWNc237it6xBe7QJU8lEHsJEiHYWLLq9ERdW
         BheACdvioFzNHXrAxzi2skE1jYQhc6reOgiq78JPVS+vGTCNAlfbk53fkYaROBTG13j7
         X1GrYdQmyNtu+fn7IOnI+Dff9pLuqE3a44IT0Q+A7uB1oip+EXX3cRjS1IJ0R+YRsUNg
         NgpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=FQGO6d/0mEB1ogv6r8XPPwwDAuJ9mmObgleVeh1W30Q=;
        b=d8eo73h2KwK8PtH7dvhlf9pMDZkca+D/NySIIOY8026vakzSxCoSBry6m9ZUmIHnuv
         ZyrstPkO3hLsUBbwnJXI9YmVX7ioMrN1WWOsPLeyUfVlnrK4H8y2k3PLKV6p4rk8uLuD
         Dmn6hqKkm/iNw23pQrv3mz/g940toUx+0lMIW5eBlm7IkKEsTwAic6iLPxEnKpjURzci
         61d5C/HbsyTQKj13em6fYqi8CeM8bEuqlGKnxmqajzTPlsgx+qZuD0yZSx48ZptJVDno
         NsyiwFxzP29fZ4xVqEJYak1uAArzO8TkIIKaHm/DyxFsmxGCmOowKt7kWtHOX/SpRwne
         Zqbw==
X-Gm-Message-State: AOAM532xIAfpQAeomKLJvrlU9kX4PJDDZjVUItHks6FuOTSAMdkVtw2W
        oaawRh9K+vfF4NZuz3/v6mExMXSVNUML2FmsQD7hLQ==
X-Google-Smtp-Source: ABdhPJwHamuSqfH4lJpIQcn0CZDeDCmKb5iALIr0BJPrcv+edfAnkn4NuZArB/B5l70iTD2jJffpjleIYuvEGchu+bs=
X-Received: by 2002:aa7:941a:0:b029:142:2501:35d1 with SMTP id
 x26-20020aa7941a0000b0290142250135d1mr6672587pfo.49.1600267669164; Wed, 16
 Sep 2020 07:47:49 -0700 (PDT)
MIME-Version: 1.0
References: <20200915171801.39761-1-songmuchun@bytedance.com>
 <20200915214845.GB189808@cmpxchg.org> <CAMZfGtXOR1Ed2PyB4TB5mq=1mh7p7La-4BsoZ8oYhtgc8ZcqLQ@mail.gmail.com>
 <20200916144057.GA194430@cmpxchg.org>
In-Reply-To: <20200916144057.GA194430@cmpxchg.org>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Wed, 16 Sep 2020 22:47:12 +0800
Message-ID: <CAMZfGtX-q6vB853YCKqW3Yo=N=AFWcQSxYF=mYK6PKC2XAHMAg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v5] mm: memcontrol: Add the missing
 numa_stat interface for cgroup v2
To:     Johannes Weiner <hannes@cmpxchg.org>
Cc:     Tejun Heo <tj@kernel.org>, Zefan Li <lizefan@huawei.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Michal Hocko <mhocko@kernel.org>,
        Vladimir Davydov <vdavydov.dev@gmail.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Shakeel Butt <shakeelb@google.com>,
        Roman Gushchin <guro@fb.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Cgroups <cgroups@vger.kernel.org>, linux-doc@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Sep 16, 2020 at 10:42 PM Johannes Weiner <hannes@cmpxchg.org> wrote:
>
> On Wed, Sep 16, 2020 at 12:14:49PM +0800, Muchun Song wrote:
> > On Wed, Sep 16, 2020 at 5:50 AM Johannes Weiner <hannes@cmpxchg.org> wrote:
> > >
> > > On Wed, Sep 16, 2020 at 01:18:01AM +0800, Muchun Song wrote:
> > > > In the cgroup v1, we have a numa_stat interface. This is useful for
> > > > providing visibility into the numa locality information within an
> > > > memcg since the pages are allowed to be allocated from any physical
> > > > node. One of the use cases is evaluating application performance by
> > > > combining this information with the application's CPU allocation.
> > > > But the cgroup v2 does not. So this patch adds the missing information.
> > > >
> > > > Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> > > > Suggested-by: Shakeel Butt <shakeelb@google.com>
> > > > Reviewed-by: Shakeel Butt <shakeelb@google.com>
> > >
> > > Yup, that would be useful information to have. Just a few comments on
> > > the patch below:
> > >
> > > > @@ -1368,6 +1368,78 @@ PAGE_SIZE multiple when read back.
> > > >               collapsing an existing range of pages. This counter is not
> > > >               present when CONFIG_TRANSPARENT_HUGEPAGE is not set.
> > > >
> > > > +  memory.numa_stat
> > > > +     A read-only flat-keyed file which exists on non-root cgroups.
> > >
> > > It's a nested key file, not flat.
> >
> > This is just copied from memory.stat documentation.Is the memory.stat
> > also a nested key file?
>
> No, memory.stat is a different format. From higher up in the document:
>
>   Flat keyed
>
>         KEY0 VAL0\n
>         KEY1 VAL1\n
>         ...
>
>   Nested keyed
>
>         KEY0 SUB_KEY0=VAL00 SUB_KEY1=VAL01...
>         KEY1 SUB_KEY0=VAL10 SUB_KEY1=VAL11...
>         ...

Got it. Thanks for your explanation.

>
> > > Otherwise, this looks reasonable to me.
> >
> > OK. Will do that.
>
> Thanks!



-- 
Yours,
Muchun
