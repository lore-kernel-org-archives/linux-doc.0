Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5AA6FC433FE
	for <linux-doc@archiver.kernel.org>; Fri, 15 Apr 2022 23:37:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236231AbiDOXkB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 15 Apr 2022 19:40:01 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47536 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233560AbiDOXkA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 15 Apr 2022 19:40:00 -0400
Received: from mail-yw1-x1130.google.com (mail-yw1-x1130.google.com [IPv6:2607:f8b0:4864:20::1130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E0F42814A4
        for <linux-doc@vger.kernel.org>; Fri, 15 Apr 2022 16:37:30 -0700 (PDT)
Received: by mail-yw1-x1130.google.com with SMTP id 00721157ae682-2db2add4516so95812667b3.1
        for <linux-doc@vger.kernel.org>; Fri, 15 Apr 2022 16:37:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=GBzN0oGFUFjzpywBXSVux/Xmu/oJE1kMpJ05D3WkT7w=;
        b=gEXUAF2gs2CTa7hRCFDB89694XtziZL6aHbaBs2Oxd80FnFUNaJ+CyTYohPLbzMFEz
         kiEZ4GY9F4nR/3mlIWDrB5YBrtZjed+jnmGf+30p6GhxDwTopugU11f5HXvKaTGwrMBj
         eb1NkZHXjKoHBYKfyIXTvWnbAcgX8s5qXY1I/41fh4CsWhvwLr1N83/2Gub1q+i2cmDL
         NehpdNnityZBdgPXErbsuVGsbZ8XFXb/GDHBWB13ZjkKX4nVOz7eHLObkPqRKMqXUtzx
         IeEEfQw3BfIQBxVoiKFwkCi/4AspSYsixdMVKxrJxxeHKv02PgAJH6ZZzu+kUUAzsydS
         QpFQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=GBzN0oGFUFjzpywBXSVux/Xmu/oJE1kMpJ05D3WkT7w=;
        b=7hRC7Kq84WUbYdmbJpuTD/YUoxIz2ho+O13vMRRFVQsV6dARt7y7z1q4o4q+xLcQeX
         fDNeH0KwzICAq3mtsv7qwScCeDL3Fj0xoByGb0WywyKul5qUWJX56i3YpF65Y3pfB80t
         2klWNRevQU/2/lJ3wj36ldpdsm5yoWjy+T5bFi2ij37cD3vDGloRli2qPysYDSuuq82C
         rIuIyAL0z3gAzcyOMO6IR6bDVucTp1cUwS+CK3n1T8rraW64PCIgPce+rYu8AH4Z0Ui8
         Ed86sn7g5XDBMp+JZK7E/Fa2WBCTLfQKHbS3gSI+DqRB8ENoSSgtf2s5TF7O9J248shV
         oqqQ==
X-Gm-Message-State: AOAM533e0P0E5w4MX9vxxwIcoAMBNoSZzUQKJLXn9zHcCxwgtL5c0531
        Ujge+m126dCAzMN/507AnfoDfL04kGyRXRK7ZJ/UdA==
X-Google-Smtp-Source: ABdhPJyg4K4LACqH2AcGFF1qsZf4zXwnYa7M+1ZR/KBW0Gvu89HiGnqnLTcYYAIN5JZCFsJgUKCChcvn9V71cx1qJ0Y=
X-Received: by 2002:a81:8b47:0:b0:2e6:57ba:5f84 with SMTP id
 e7-20020a818b47000000b002e657ba5f84mr1217410ywk.285.1650065849882; Fri, 15
 Apr 2022 16:37:29 -0700 (PDT)
MIME-Version: 1.0
References: <CAOUHufYeC=Kuu59BPL_48sM67CqACxH2wWy-SYGXpadgMDmY3w@mail.gmail.com>
 <20220414185654.e7150bcbe859e0dd4b9c61af@linux-foundation.org>
 <CAOUHufYy6yQS9ARN9C5+ODkopR+ez4TH3hZNZo4HtNHBExS1mA@mail.gmail.com>
 <20220415121521.764a88dda55ae8c676ad26b0@linux-foundation.org>
 <CAOUHufYsjwMGMFCfYoh79rFZqwqS1jDihcBS9sHd-gBxEAD3Ug@mail.gmail.com>
 <20220415143220.cc37b0b0a368ed2bf2a821f8@linux-foundation.org>
 <CAHk-=whvkRTVBhAamt0kYyp925jk_+g7T0CyPke_FbCWGQ1VvA@mail.gmail.com>
 <CAOUHufZ4KrjFTYH8wtwMGd9AriZfZtO4GhbiK1SuNbY31VTT9w@mail.gmail.com>
 <CAHk-=whneDk3Jde3J+O-fD32VjaK+fDf9+P6jgDtr2qyo0iu2w@mail.gmail.com>
 <CAJmaN=mJKAhRjDHbsLrqyK_uvuysx596jEcTwV2fwx4UOe4oow@mail.gmail.com> <YloAOrA6+8Yov57h@casper.infradead.org>
In-Reply-To: <YloAOrA6+8Yov57h@casper.infradead.org>
From:   Jesse Barnes <jsbarnes@google.com>
Date:   Fri, 15 Apr 2022 16:37:17 -0700
Message-ID: <CAJmaN==58aOME8m7GmtOxiRfD2qz8aFjJucC_0MYLhk-7GDqvQ@mail.gmail.com>
Subject: Re: [page-reclaim] Re: [PATCH v10 08/14] mm: multi-gen LRU: support
 page table walks
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Linus Torvalds <torvalds@linux-foundation.org>,
        Yu Zhao <yuzhao@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Justin Forbes <jforbes@fedoraproject.org>,
        Stephen Rothwell <sfr@rothwell.id.au>,
        Linux-MM <linux-mm@kvack.org>, Andi Kleen <ak@linux.intel.com>,
        Aneesh Kumar <aneesh.kumar@linux.ibm.com>,
        Barry Song <21cnbao@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Hillf Danton <hdanton@sina.com>, Jens Axboe <axboe@kernel.dk>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>, Mel Gorman <mgorman@suse.de>,
        Michael Larabel <Michael@michaellarabel.com>,
        Michal Hocko <mhocko@kernel.org>,
        Mike Rapoport <rppt@kernel.org>,
        Rik van Riel <riel@surriel.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>,
        Ying Huang <ying.huang@intel.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Kernel Page Reclaim v2 <page-reclaim@google.com>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        Brian Geffon <bgeffon@google.com>,
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

On Fri, Apr 15, 2022, 4:31 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Fri, Apr 15, 2022 at 04:24:14PM -0700, Jesse Barnes wrote:
> > On Fri, Apr 15, 2022 at 4:04 PM Linus Torvalds
> > <torvalds@linux-foundation.org> wrote:
> > > And for ordinary users, a WARN_ON_ONCE() is about a million times
> > > better, becasue:
> > >
> > >  - the machine will hopefully continue working, so they can report the warning
> > >
> > >  - even when they don't notice them, distros tend to have automated
> > > reporting infrastructure
> > >
> > > That's why I absolutely *DETEST* those stupid BUG_ON() cases - they
> > > will often kill the machine with nasty locks held, resulting in a
> > > completely undebuggable thing that never gets reported.
> > >
> > > Yes, you can be careful and only put BUG_ON() in places where recovery
> > > is possible. But even then, they have no actual _advantages_ over just
> > > a WARN_ON_ONCE.
> >
> > Generally agreed, and not to belabor this relatively small issue, but in some
> > environments like cloud or managed client deployments, a crash can actually
> > be preferable so we can get a dump, reboot the machine, and get things going
> > again for the application or user, then debug offline.  So having the
> > flexibility to
> > do that in those situations is helpful.  And there, a full crash dump is better
> > than just a log report with the WARN info, since debugging may be easier with
> > all the kernel memory.
>
> But for those situations, don't you set panic_on_warn anyway?

Yes ignore me.

Jesse "returning to his cave of ignorace" Barnes
