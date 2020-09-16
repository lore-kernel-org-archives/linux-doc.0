Return-Path: <SRS0=XgFW=CZ=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E439FC433E2
	for <linux-doc@archiver.kernel.org>; Wed, 16 Sep 2020 18:39:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9E9C9206B5
	for <linux-doc@archiver.kernel.org>; Wed, 16 Sep 2020 18:39:51 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=cmpxchg-org.20150623.gappssmtp.com header.i=@cmpxchg-org.20150623.gappssmtp.com header.b="x3fuQca0"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728173AbgIPSjt (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 16 Sep 2020 14:39:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728051AbgIPS2s (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Sep 2020 14:28:48 -0400
Received: from mail-qk1-x743.google.com (mail-qk1-x743.google.com [IPv6:2607:f8b0:4864:20::743])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7AFABC002175
        for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2020 07:42:23 -0700 (PDT)
Received: by mail-qk1-x743.google.com with SMTP id f142so8315244qke.13
        for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2020 07:42:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=cmpxchg-org.20150623.gappssmtp.com; s=20150623;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=fKYfJDr6XxN79fp7RRW8vHbFzGf8aLsEG/U2ZaiDjdE=;
        b=x3fuQca0YO4vXhnbqTr/awp8cN0ZmiMYzYQ/wBG5yKnOrO8F+Nw+YZ0TuosHxJH//Y
         3iNLZoxNj3tgOeuQOZc/gGlF2FUljYQwnGuXvAJLuhARwn22qD/0LFjmb/NZ3tKLJ+of
         Gr1QMEfApz/Dx/Qro6daJdCGB5v8rMY7CZQp0JFUZHnZysVsMBjlc53pAUpu1lkR/jwA
         GaWH31lJFMfcLnxfjTsd2oFBxFLjxEuT2GZiX3v9V95vS6x+6VnHOOh1j46dEpnz3rOI
         gItFy9wcDwGEuqN9UCktG0P2Nk87Swobyq2yLNj8GLYSO0YGumg8dOshimjHMZL5xP8Q
         s4WA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=fKYfJDr6XxN79fp7RRW8vHbFzGf8aLsEG/U2ZaiDjdE=;
        b=Vo8Ut45MMZzJxcRS4POvf9dO18HFpp2EZNAd9LiByBERpB/3gjwecyCeMTu1qTuajr
         OwUmUvAFh+X1JzGGZy9pYjfA2jFg0C4yCzrPHVn+VhyUqTWK6XlWeMXoiIpMt6orux3x
         B1Zc6EJmXBRwlqO1DGcHZlpEJFUIhyOWlXdG1irri0ORPTmYeNhh92Sg43nieDCcinvQ
         xhjgCe1KudyQVSF1fjb3kMRECIFqvw+qtLjYpmHgLc1smd/sNFfyOWsh8GQJZcTbIXrh
         C8y0iFfnaoKVmXaz5yljnWD6n1r5Bv8gtbs4aI8lusDfSg/eYcVa8/yXoU6dDuyABoP6
         41wA==
X-Gm-Message-State: AOAM533pPLEQDgJSWv7N66FWhnbhCyru2e+qK943Z3HuJ5s5FPvxGpGH
        uVLg6xDW9PYs8o6DbGMJ+IyfQQ==
X-Google-Smtp-Source: ABdhPJwijrABVKYt/qN7UOpgp0u84imCjvrxLSbBsmEHE10f61LGvpcUBadv1NkypK+pBVqu+G4IGA==
X-Received: by 2002:ae9:dd01:: with SMTP id r1mr22802872qkf.467.1600267342448;
        Wed, 16 Sep 2020 07:42:22 -0700 (PDT)
Received: from localhost ([2620:10d:c091:480::1:445c])
        by smtp.gmail.com with ESMTPSA id 16sm19950302qks.102.2020.09.16.07.42.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Sep 2020 07:42:21 -0700 (PDT)
Date:   Wed, 16 Sep 2020 10:40:57 -0400
From:   Johannes Weiner <hannes@cmpxchg.org>
To:     Muchun Song <songmuchun@bytedance.com>
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
Subject: Re: [External] Re: [PATCH v5] mm: memcontrol: Add the missing
 numa_stat interface for cgroup v2
Message-ID: <20200916144057.GA194430@cmpxchg.org>
References: <20200915171801.39761-1-songmuchun@bytedance.com>
 <20200915214845.GB189808@cmpxchg.org>
 <CAMZfGtXOR1Ed2PyB4TB5mq=1mh7p7La-4BsoZ8oYhtgc8ZcqLQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMZfGtXOR1Ed2PyB4TB5mq=1mh7p7La-4BsoZ8oYhtgc8ZcqLQ@mail.gmail.com>
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Sep 16, 2020 at 12:14:49PM +0800, Muchun Song wrote:
> On Wed, Sep 16, 2020 at 5:50 AM Johannes Weiner <hannes@cmpxchg.org> wrote:
> >
> > On Wed, Sep 16, 2020 at 01:18:01AM +0800, Muchun Song wrote:
> > > In the cgroup v1, we have a numa_stat interface. This is useful for
> > > providing visibility into the numa locality information within an
> > > memcg since the pages are allowed to be allocated from any physical
> > > node. One of the use cases is evaluating application performance by
> > > combining this information with the application's CPU allocation.
> > > But the cgroup v2 does not. So this patch adds the missing information.
> > >
> > > Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> > > Suggested-by: Shakeel Butt <shakeelb@google.com>
> > > Reviewed-by: Shakeel Butt <shakeelb@google.com>
> >
> > Yup, that would be useful information to have. Just a few comments on
> > the patch below:
> >
> > > @@ -1368,6 +1368,78 @@ PAGE_SIZE multiple when read back.
> > >               collapsing an existing range of pages. This counter is not
> > >               present when CONFIG_TRANSPARENT_HUGEPAGE is not set.
> > >
> > > +  memory.numa_stat
> > > +     A read-only flat-keyed file which exists on non-root cgroups.
> >
> > It's a nested key file, not flat.
> 
> This is just copied from memory.stat documentation.Is the memory.stat
> also a nested key file?

No, memory.stat is a different format. From higher up in the document:

  Flat keyed

	KEY0 VAL0\n
	KEY1 VAL1\n
	...

  Nested keyed

	KEY0 SUB_KEY0=VAL00 SUB_KEY1=VAL01...
	KEY1 SUB_KEY0=VAL10 SUB_KEY1=VAL11...
	...

> > Otherwise, this looks reasonable to me.
> 
> OK. Will do that.

Thanks!
