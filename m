Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D5CD5C433EF
	for <linux-doc@archiver.kernel.org>; Tue, 22 Mar 2022 09:00:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232089AbiCVJCD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 22 Mar 2022 05:02:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42774 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232103AbiCVJCC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 Mar 2022 05:02:02 -0400
Received: from mail-vs1-xe33.google.com (mail-vs1-xe33.google.com [IPv6:2607:f8b0:4864:20::e33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2278224595
        for <linux-doc@vger.kernel.org>; Tue, 22 Mar 2022 02:00:35 -0700 (PDT)
Received: by mail-vs1-xe33.google.com with SMTP id 2so10363525vse.4
        for <linux-doc@vger.kernel.org>; Tue, 22 Mar 2022 02:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hgfIwOPYuptRsTuNKCi9/HUJBoBxu7b265kLbqakkq0=;
        b=obV+azB1p6rhDPLAT0mRjy/R6+VmuleFeLZBUgp5ejFvuaC31FwKArh69ninRxOilY
         UOU0mD/cvDa75BFcaL93QMAAZsiZAhJYBQ5VpmVLW2Q4PEv5FQF3RJgY6lA/rz/aaGJ2
         FuoXy83LFS0Z/Ew2bm7VRW/0blWe3YJ00+lshmiaHdProRlqRvuXL3GJBjCSWHGDu3bC
         EpH6UX6k9qzwSQkpNIWrE8Uoi32P/XA4Hcp68A28HOUACLo4+gl9KpKHeNha/evqng88
         dPuLNKhCo2RPcYFSludSG698aIqeFgcvYwFJp3CzL5ntwwPPWJphFFW3BbDYzc4g1JVl
         aZNA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hgfIwOPYuptRsTuNKCi9/HUJBoBxu7b265kLbqakkq0=;
        b=D9c0yAT1+ZZVm0b3rm/rVQPkDSp0++OYjuPgRlnlyqbeZz3F2h8sJv3zWPNygyB/GA
         8l5aqfpHgMWLh4BwShIVHQcb64XdTuTVskoGmM96JVQKgLfNi4Mfew0jwVvf1F5gepAw
         7S3BcdVj76uIzyll0TTOR1vdPQTG+eNJhT6cqU4JrE1A8wpgkj49goVAihFiQDYK2YUG
         DJj+570g0HRf+otink7f9tXNdF/R0SsJ22vx5HuMjzeKH6Mg2d0DN8f8tdhUfaBNW+4h
         iUwK09CG1I1tyMpCldo8j/EBgKXu5asquE7TS4LE9bvc0wepkITVXVOyC+Md0B9WDrnD
         jCLw==
X-Gm-Message-State: AOAM530niJ4W2oaGC45EP6elRMOxaniPO6doGYMW4fhjtTXVVITh6DkE
        kH+viWjfptYimtK2qXf1e904gkOZakVf+BU7t6NI5w==
X-Google-Smtp-Source: ABdhPJwBytuxvl00Jby+t9xir1uQGJuN5IuNFpeHLDV+zBSHYjNu3Il+S3/PGYJpCRGGBFbHf0jtzBkDYfSUSEGwcTY=
X-Received: by 2002:a67:f956:0:b0:324:eb38:52fb with SMTP id
 u22-20020a67f956000000b00324eb3852fbmr5387865vsq.22.1647939634018; Tue, 22
 Mar 2022 02:00:34 -0700 (PDT)
MIME-Version: 1.0
References: <20220309021230.721028-1-yuzhao@google.com> <20220309021230.721028-11-yuzhao@google.com>
 <CAGsJ_4xqRGp1gV89+bAx5iA=AVwj2TA+No92UqLHFa0i14MBMQ@mail.gmail.com>
 <CAOUHufbP7kHquWiD3VsmD=veNFF2v_E9HWqdYSMbS1nPJic0Fg@mail.gmail.com> <CAGsJ_4wPWRkmioxGYOwZ9KwdiJUUdgH9Xd38MJH6B2sKJNG+iA@mail.gmail.com>
In-Reply-To: <CAGsJ_4wPWRkmioxGYOwZ9KwdiJUUdgH9Xd38MJH6B2sKJNG+iA@mail.gmail.com>
From:   Yu Zhao <yuzhao@google.com>
Date:   Tue, 22 Mar 2022 03:00:23 -0600
Message-ID: <CAOUHufaLdywz7UtACypbGQsZ9m9cLhfZw78f0wiPGGjQYSGquQ@mail.gmail.com>
Subject: Re: [PATCH v9 10/14] mm: multi-gen LRU: kill switch
To:     Barry Song <21cnbao@gmail.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Andi Kleen <ak@linux.intel.com>,
        Aneesh Kumar <aneesh.kumar@linux.ibm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Hillf Danton <hdanton@sina.com>, Jens Axboe <axboe@kernel.dk>,
        Jesse Barnes <jsbarnes@google.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Matthew Wilcox <willy@infradead.org>,
        Mel Gorman <mgorman@suse.de>,
        Michael Larabel <Michael@michaellarabel.com>,
        Michal Hocko <mhocko@kernel.org>,
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
        Sofia Trinh <sofia.trinh@edi.works>,
        Vaibhav Jain <vaibhav@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Mar 22, 2022 at 2:45 AM Barry Song <21cnbao@gmail.com> wrote:
>
> On Tue, Mar 22, 2022 at 9:20 PM Yu Zhao <yuzhao@google.com> wrote:
> >
> > On Tue, Mar 22, 2022 at 1:47 AM Barry Song <21cnbao@gmail.com> wrote:
> > >
> > ...
> > > > +static bool drain_evictable(struct lruvec *lruvec)
> > > > +{
> > > > +       int gen, type, zone;
> > > > +       int remaining = MAX_LRU_BATCH;
> > > > +
> > > > +       for_each_gen_type_zone(gen, type, zone) {
> > > > +               struct list_head *head = &lruvec->lrugen.lists[gen][type][zone];
> > > > +
> > > > +               while (!list_empty(head)) {
> > > > +                       bool success;
> > > > +                       struct folio *folio = lru_to_folio(head);
> > > > +
> > > > +                       VM_BUG_ON_FOLIO(folio_test_unevictable(folio), folio);
> > > > +                       VM_BUG_ON_FOLIO(folio_test_active(folio), folio);
> > > > +                       VM_BUG_ON_FOLIO(folio_is_file_lru(folio) != type, folio);
> > > > +                       VM_BUG_ON_FOLIO(folio_zonenum(folio) != zone, folio);
> > > > +
> > > > +                       success = lru_gen_del_folio(lruvec, folio, false);
> > > > +                       VM_BUG_ON(!success);
> > > > +                       lruvec_add_folio(lruvec, folio);
> > >
> > > for example, max_seq=4(GEN=0) and max_seq-1=3, then we are supposed to put
> > > max_seq in the head of active list. but your code seems to be putting max_seq-1
> > > after putting max_seq, then max_seq is more likely to be evicted
> > > afterwards as it
> > > is in the tail of the active list.
> >
> > This is correct.
>
> maybe something like below can fix it:
>  #define for_each_gen_type_zone(gen, type, zone)
>          \
> -       for ((gen) = 0; (gen) < MAX_NR_GENS; (gen)++)                   \
> +       for (int seq = min_seq[type], (gen)=(seq_to_gen(seq)); seq <=
> max_seq ; seq++)                       \
>                 for ((type) = 0; (type) < ANON_AND_FILE; (type)++)      \
>                         for ((zone) = 0; (zone) < MAX_NR_ZONES; (zone)++)

I explained in another email that you might not have the time to go
over yet [1].

This has to be all *possible* generations, not just [min_seq, max_seq].

[1] https://lore.kernel.org/linux-mm/CAOUHufa50Mj6wusKvFX2cCAk58oTwCLDC8im+_B6OS_dP6=TJQ@mail.gmail.com/
