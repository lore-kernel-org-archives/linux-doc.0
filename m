Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC24FC433FE
	for <linux-doc@archiver.kernel.org>; Thu, 24 Feb 2022 01:34:48 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229590AbiBXBfQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 23 Feb 2022 20:35:16 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229561AbiBXBfP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 Feb 2022 20:35:15 -0500
Received: from mail-ua1-x934.google.com (mail-ua1-x934.google.com [IPv6:2607:f8b0:4864:20::934])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 567EB13AA3C
        for <linux-doc@vger.kernel.org>; Wed, 23 Feb 2022 17:34:46 -0800 (PST)
Received: by mail-ua1-x934.google.com with SMTP id t25so192603uaa.3
        for <linux-doc@vger.kernel.org>; Wed, 23 Feb 2022 17:34:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DlTEvCMe8gLH8mkJngq0jMMrhF4Rb9J1L2FbOtnoMeA=;
        b=sjYQXiAaTh8Pan58Dwbpxw8kVwXQt1oAtAF/M0W1jQ6kHv5MlMXbLhguJMlVQsz2mt
         4eif8qTqHSAlzgJNMnMyUMVZy0186FJfeZP8a5XgyewuzQB8LgrY2v/VlIIxYnS5Tvw1
         ahrvsWzDtvSalYitjQ/o/WowcaihqDCzMk82kA52tuXXN6+6QBx7m2q3ulEvMJ16uYEz
         V5ZujsVnuN04sVmFL0PQPdCxfh/nwn5+yzc7DL6LoS+q3O+BFjnSOUMS2VOf/ZURdy8K
         DDwVwm1IctjAuB6SKRa1QT3xdSHHJFY0rf7QFg88fopcFzkRII9LEpXSGdwirgd0ndLd
         SQ0w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DlTEvCMe8gLH8mkJngq0jMMrhF4Rb9J1L2FbOtnoMeA=;
        b=fkJ69n/FIINSbxxRZD1cycha1XNmWxXw+mn9fKQhbqG5SIqjysIHVUvY1Qn3BPQwLw
         0uEb7DAOZYr0A6c4/TTaqYcI3+31G+Qsunft6+WaMpYvmLvzOvpISDkbrQBNUkMSAvUk
         KauSL5UNPjTNAk1fNjwxo4NbDGLkkJDJ2YPQtHKfKGGJUK1OwM9w5szbYTLNH4hTJizc
         d26l6Q4VGWfOnf3XVUiYqx9i+Bkqudh5G350vHI430W1ocTSR15EIOUOpuKHtJHzOLHA
         zy1yXNaJntf5LvPS6Y4IK5/XZvQkTrh91Z70ND6TSiAQqHq6+HCvsNmxnfRDEMIKg07g
         cNNg==
X-Gm-Message-State: AOAM533UDz5ek4DZSgAOwlgqSup77WhuGuZHnLJs/LQQ9ZBB1wOlpLDd
        81YpKhrbcBstsiLUKlL4yXbgKWJEfFJR1mDDqMCWpg==
X-Google-Smtp-Source: ABdhPJxBaf8RnByOCleoWZEZPun+AOvuwypSAyh6/fwhiM94QTJdh8bQ3/HbbFgUPiAM6IdBkr8T8WRot1ZydwqPvVI=
X-Received: by 2002:ab0:2111:0:b0:341:8339:51b4 with SMTP id
 d17-20020ab02111000000b00341833951b4mr162619ual.76.1645666485123; Wed, 23 Feb
 2022 17:34:45 -0800 (PST)
MIME-Version: 1.0
References: <20220208081902.3550911-1-yuzhao@google.com> <20220208081902.3550911-6-yuzhao@google.com>
 <87bkyy56nv.fsf@yhuang6-desk2.ccr.corp.intel.com> <CAOUHufbekcu09DyEZAkJNRq_1qKaf_xibXQNeAVK=rsGBn9Z4Q@mail.gmail.com>
 <87y2213wrl.fsf@yhuang6-desk2.ccr.corp.intel.com>
In-Reply-To: <87y2213wrl.fsf@yhuang6-desk2.ccr.corp.intel.com>
From:   Yu Zhao <yuzhao@google.com>
Date:   Wed, 23 Feb 2022 18:34:33 -0700
Message-ID: <CAOUHufY8dRimricP=pvvgg8mEagb369nE8MVe6tnnLXQuKyAEA@mail.gmail.com>
Subject: Re: [PATCH v7 05/12] mm: multigenerational LRU: minimal implementation
To:     "Huang, Ying" <ying.huang@intel.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Mel Gorman <mgorman@suse.de>, Michal Hocko <mhocko@kernel.org>,
        Andi Kleen <ak@linux.intel.com>,
        Aneesh Kumar <aneesh.kumar@linux.ibm.com>,
        Barry Song <21cnbao@gmail.com>,
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
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>,
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
        Sofia Trinh <sofia.trinh@edi.works>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Feb 23, 2022 at 5:59 PM Huang, Ying <ying.huang@intel.com> wrote:
>
> Yu Zhao <yuzhao@google.com> writes:
>
> > On Wed, Feb 23, 2022 at 1:28 AM Huang, Ying <ying.huang@intel.com> wrote:
> >>
> >> Hi, Yu,
> >>
> >> Yu Zhao <yuzhao@google.com> writes:
> >>
> >> > To avoid confusions, the terms "promotion" and "demotion" will be
> >> > applied to the multigenerational LRU, as a new convention; the terms
> >> > "activation" and "deactivation" will be applied to the active/inactive
> >> > LRU, as usual.
> >>
> >> In the memory tiering related commits and patchset, for example as follows,
> >>
> >> commit 668e4147d8850df32ca41e28f52c146025ca45c6
> >> Author: Yang Shi <yang.shi@linux.alibaba.com>
> >> Date:   Thu Sep 2 14:59:19 2021 -0700
> >>
> >>     mm/vmscan: add page demotion counter
> >>
> >> https://lore.kernel.org/linux-mm/20220221084529.1052339-1-ying.huang@intel.com/
> >>
> >> "demote" and "promote" is used for migrating pages between different
> >> types of memory.  Is it better for us to avoid overloading these words
> >> too much to avoid the possible confusion?
> >
> > Given that LRU and migration are usually different contexts, I think
> > we'd be fine, unless we want a third pair of terms.
>
> This is true before memory tiering is introduced.  In systems with
> multiple types memory (called memory tiering), LRU is used to identify
> pages to be migrated to the slow memory node.  Please take a look at
> can_demote(), which is called in shrink_page_list().

This sounds clearly two contexts to me. Promotion/demotion (move
between generations) while pages are on LRU; or promotion/demotion
(migration between nodes) after pages are taken off LRU.

Note that promotion/demotion are not used in function names. They are
used to describe how MGLRU works, in comparison with the
active/inactive LRU. Memory tiering is not within this context.

> >> > +static int get_swappiness(struct mem_cgroup *memcg)
> >> > +{
> >> > +     return mem_cgroup_get_nr_swap_pages(memcg) >= MIN_LRU_BATCH ?
> >> > +            mem_cgroup_swappiness(memcg) : 0;
> >> > +}
> >>
> >> After we introduced demotion support in Linux kernel.  The anonymous
> >> pages in the fast memory node could be demoted to the slow memory node
> >> via the page reclaiming mechanism as in the following commit.  Can you
> >> consider that too?
> >
> > Sure. How do I check whether there is still space on the slow node?
>
> You can always check the watermark of the slow node.  But now, we
> actually don't check that (as in demote_page_list()), instead we will
> wake up kswapd of the slow node.  The intended behavior is something
> like,
>
>   DRAM -> PMEM -> disk

I'll look into this later -- for now, it's a low priority because
there isn't much demand. I'll bump it up if anybody is interested in
giving it a try. Meanwhile, please feel free to cook up something if
you are interested.
