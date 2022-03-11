Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 85F69C433EF
	for <linux-doc@archiver.kernel.org>; Fri, 11 Mar 2022 23:45:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229784AbiCKXqW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 11 Mar 2022 18:46:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45730 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229852AbiCKXqW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 11 Mar 2022 18:46:22 -0500
Received: from mail-vs1-xe36.google.com (mail-vs1-xe36.google.com [IPv6:2607:f8b0:4864:20::e36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B1B58B2A
        for <linux-doc@vger.kernel.org>; Fri, 11 Mar 2022 15:45:17 -0800 (PST)
Received: by mail-vs1-xe36.google.com with SMTP id v128so11156575vsb.8
        for <linux-doc@vger.kernel.org>; Fri, 11 Mar 2022 15:45:17 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=jgWt/h1KdiygO0MXrJh7m5UOZKMB2VItBU/y6w5jdRk=;
        b=oZytWIDQPcCDRDIoQChqrlmhIaD7llu9P5DEu+KS08AIzPIgLCPKKBsZwyF5mi1Pc4
         HXZCyOe3GkMnCEF/VHXh49dszLjisjb1WNh4B1X5fMVv4jCDWLEKJ7v9CwjbYUjSm6xt
         4hq89LSLAzFz79dWnRWkQ6TCQPCALfFEDTmXwI5Mmrmg3xi/j5/UYeU4FVFXslNem1ZT
         gmJC8ftfUIis2szN1Q/4wywZpcNI/hyLDDyB6ubDBpasB/vWMQuEdlOddyRN/oOxxWaM
         0onT8FS0mikrQJQgRDh+oTQPV5A8N73AorqNYxSEGOdbRGq75oAWoPwfmACGFTSVUqgA
         wklA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=jgWt/h1KdiygO0MXrJh7m5UOZKMB2VItBU/y6w5jdRk=;
        b=H0W+J3yS5JZnSZ0wePBMwMiOfXk7+kSHOvFmlQ0M0bIfQ20OZUXvKtCak9pDnhI9B7
         0hDxQPBD/qn+mmqyIyFc5RQqCNqQ4/YaOaUjx3laoMwuKx883eT61rmMi6jMm1DyI2fx
         u7G07vdnk24fi+uOtExwPOeAn+UvvH841mCeonZ0NQ2Goz9/X8RJCwi7d9zguVe1oKvD
         JCKkt3AHQSPr0ywvb0Vc5fQAhXBbc1HzhL7jtjAJ+k6Sj8vHl2lWQmkoU4781eyAoIth
         LO9Qov0sFjVn+Yngi96Eu/Fbvnk+zaAiPnnCw7HzHQ++ZmeEKFz+PcHoqerLa82ex8K1
         OpaA==
X-Gm-Message-State: AOAM530I76wG81BINL/8Zn4X0VTXrGDVtjmNd8WwtJwRyNRbHPOmM5AY
        08Rkw+m0x22N3Dij4FwcW8ERzzwsrLBaMVRMZPqq1A==
X-Google-Smtp-Source: ABdhPJzo48Uus6VFTpGZvjATe6Iht5+Z3+GWkPxJhUQ3VuQempIIQjYA0aVJsViX8+/2Mk2XMNiUidRQDZfkYAxEtJU=
X-Received: by 2002:a05:6102:3a06:b0:31b:d9c6:c169 with SMTP id
 b6-20020a0561023a0600b0031bd9c6c169mr5989160vsu.22.1647042316582; Fri, 11 Mar
 2022 15:45:16 -0800 (PST)
MIME-Version: 1.0
References: <20220208081902.3550911-1-yuzhao@google.com> <20220208081902.3550911-5-yuzhao@google.com>
 <YgV4lZXc6+jhUdsR@cmpxchg.org> <Ygt1qaQM5YobEZK9@google.com> <CAGsJ_4wN_CAOsyR3LATE+EUhuV0gO-zhhNiMwEBwyXOp0CbkZg@mail.gmail.com>
In-Reply-To: <CAGsJ_4wN_CAOsyR3LATE+EUhuV0gO-zhhNiMwEBwyXOp0CbkZg@mail.gmail.com>
From:   Yu Zhao <yuzhao@google.com>
Date:   Fri, 11 Mar 2022 16:45:04 -0700
Message-ID: <CAOUHufaUJD8nC6PDVfmkeTwB4BtzBzigxh+V-hfR-_26VwjOPA@mail.gmail.com>
Subject: Re: [PATCH v7 04/12] mm: multigenerational LRU: groundwork
To:     Barry Song <21cnbao@gmail.com>
Cc:     Johannes Weiner <hannes@cmpxchg.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Mel Gorman <mgorman@suse.de>, Michal Hocko <mhocko@kernel.org>,
        Andi Kleen <ak@linux.intel.com>,
        Aneesh Kumar <aneesh.kumar@linux.ibm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Hillf Danton <hdanton@sina.com>, Jens Axboe <axboe@kernel.dk>,
        Jesse Barnes <jsbarnes@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Matthew Wilcox <willy@infradead.org>,
        Michael Larabel <Michael@michaellarabel.com>,
        Mike Rapoport <rppt@kernel.org>,
        Rik van Riel <riel@surriel.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>,
        Ying Huang <ying.huang@intel.com>,
        LAK <linux-arm-kernel@lists.infradead.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>,
        Kernel Page Reclaim v2 <page-reclaim@google.com>,
        x86 <x86@kernel.org>, Brian Geffon <bgeffon@google.com>,
        Jan Alexander Steffens <heftig@archlinux.org>,
        Oleksandr Natalenko <oleksandr@natalenko.name>,
        Steven Barrett <steven@liquorix.net>,
        Suleiman Souhlal <suleiman@google.com>,
        Daniel Byrne <djbyrne@mtu.edu>,
        Donald Carr <d@chaos-reins.com>,
        =?UTF-8?Q?Holger_Hoffst=C3=A4tte?= <holger@applied-asynchrony.com>,
        Konstantin Kharlamov <Hi-Angel@yandex.ru>,
        Shuang Zhai <szhai2@cs.rochester.edu>,
        Sofia Trinh <sofia.trinh@edi.works>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Mar 11, 2022 at 3:16 AM Barry Song <21cnbao@gmail.com> wrote:
>
> On Tue, Feb 15, 2022 at 10:43 PM Yu Zhao <yuzhao@google.com> wrote:
> >
> > On Thu, Feb 10, 2022 at 03:41:57PM -0500, Johannes Weiner wrote:
> >
> > Thanks for reviewing.
> >
> > > > +static inline bool lru_gen_is_active(struct lruvec *lruvec, int gen)
> > > > +{
> > > > +   unsigned long max_seq = lruvec->lrugen.max_seq;
> > > > +
> > > > +   VM_BUG_ON(gen >= MAX_NR_GENS);
> > > > +
> > > > +   /* see the comment on MIN_NR_GENS */
> > > > +   return gen == lru_gen_from_seq(max_seq) || gen == lru_gen_from_seq(max_seq - 1);
> > > > +}
> > >
> > > I'm still reading the series, so correct me if I'm wrong: the "active"
> > > set is split into two generations for the sole purpose of the
> > > second-chance policy for fresh faults, right?
> >
> > To be precise, the active/inactive notion on top of generations is
> > just for ABI compatibility, e.g., the counters in /proc/vmstat.
> > Otherwise, this function wouldn't be needed.
>
> Hi Yu,
> I am still quite confused as i am seeing both active/inactive and lru_gen.
> eg:
>
> root@ubuntu:~# cat /proc/vmstat | grep active
> nr_zone_inactive_anon 22797
> nr_zone_active_anon 578405
> nr_zone_inactive_file 0
> nr_zone_active_file 4156
> nr_inactive_anon 22800
> nr_active_anon 578574
> nr_inactive_file 0
> nr_active_file 4215

Yes, this is expected. We have to maintain the ABI, i.e., the
*_active/inactive_* counters.

> and:
>
> root@ubuntu:~# cat /sys//kernel/debug/lru_gen
>
> ...
> memcg    36 /user.slice/user-0.slice/user@0.service
>  node     0
>          20      18820         22           0
>          21       7452          0           0
>          22       7448          0           0
> memcg    33 /user.slice/user-0.slice/user@0.service/app.slice
>  node     0
>           0    2171452          0           0
>           1    2171452          0           0
>           2    2171452          0           0
>           3    2171452          0           0
> memcg    37 /user.slice/user-0.slice/session-1.scope
>  node     0
>          42      51804     102127           0
>          43      18840     275622           0
>          44      16104     216805           1
>
> Does it mean one page could be in both one of the generations and one
> of the active/inactive lists?

In terms of the data structure, evictable pages are either on
lruvec->lists or lrugen->lists.

> Do we have some mapping relationship between active/inactive lists
> with generations?

For the counters, yes -- pages in max_seq and max_seq-1 are counted as
active, and the rest are inactive.

> We used to put a faulted file page in inactive, if we access it a
> second time, it can be promoted
> to active. then in recent years, we have also applied this to anon
> pages while kernel adds
> workingset protection for anon pages. so basically both anon and file
> pages go into the inactive
> list for the 1st time, if we access it for the second time, they go to
> the active list. if we don't access
> it any more, they are likely to be reclaimed as they are inactive.
> we do have some special fastpath for code section, executable file
> pages are kept on active list
> as long as they are accessed.

Yes.

> so all of the above concerns are actually not that correct?

They are valid concerns but I don't know any popular workloads that
care about them.
