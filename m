Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA76BC433F5
	for <linux-doc@archiver.kernel.org>; Thu,  7 Apr 2022 09:08:30 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236975AbiDGJK1 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 7 Apr 2022 05:10:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54708 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S243593AbiDGJKW (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 7 Apr 2022 05:10:22 -0400
Received: from mail-ua1-x930.google.com (mail-ua1-x930.google.com [IPv6:2607:f8b0:4864:20::930])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F051F13E41F
        for <linux-doc@vger.kernel.org>; Thu,  7 Apr 2022 02:08:18 -0700 (PDT)
Received: by mail-ua1-x930.google.com with SMTP id az14so3234727uab.8
        for <linux-doc@vger.kernel.org>; Thu, 07 Apr 2022 02:08:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=6oyzUUsDsP7WzlUuQJplNjzt5un2oXahWVrU3GKQPuI=;
        b=BEKfjEYesu4xxuGItEJPl+h/svVPiup/e4mDMVBM/crzcZXc/qK8KXuCZaIuRK54Kx
         Jzj1b892Dg8IaxwsCNIu6NZaNjk8xMFZ2GlcMmHcenRDB6NZoQt03/iELcT9++s6pMrL
         5TMbLvnB5YKDSikzvv0x0xa66Xb6b+8yIwa//ac1UIhyN8UfHM5BhwbjcW2d+972BwP/
         OzUhzLgCDQua4+8Yx1DRIMISpG3dSIruPY036DG6mrXI9AafC6X/q+tD9ESuUQyL+4Ud
         fShCC1270vyTOeN2fRtMC6jm/sM8jn3d/V4YS3pOiP5Tks8JQ6HcgYzgxtHW9i70hs3P
         9/pA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=6oyzUUsDsP7WzlUuQJplNjzt5un2oXahWVrU3GKQPuI=;
        b=mcGIGRp7cd4c0Nnq23EZcNNhKvcDrkdQQmHxolOzK5UnsQ7he79sK14rlZOnvGiSQp
         5tsJ3oir/cZswSuyHi8F6nab3imNiO1ZrFF1WYU5B28hgRE61BJYiPZ3rUpSp83rYxqI
         y4sIhEzgS1wl+Wzf+6nQhknUn/J85FOFLWDHP2M+H2fHmHBIPM7zIxBXeYNiO8rOrLpG
         C2Sv1KEJzKf1fUA4LdbGI46UYqv2MUozRf4xGU8JkAZrbeSoEPrUes5gpnVtHTxYPBsY
         nwySLa5fk9Qjd+UxNui0vLRIvor3mUJe40+mDJQ2rpVjaNe7ofbPXQ5j2MUcgAqwdAYr
         HIqA==
X-Gm-Message-State: AOAM5314APO0VaIs3wdoqtO0TdoKKT25BFsP9VMFFbRmT38WgYoghk2y
        mLCFdpL5UQWjoKrRtCsR1dHvWJO028WllZztUcULyA==
X-Google-Smtp-Source: ABdhPJwRIUxVBC7LgYZPPCGVWUkXd0Jiwm7u+cd4Q61f75FZX/O7eUiX7MXlRBW1fHxpoz/IApfjXak8IwLQEOsL5Qo=
X-Received: by 2002:a9f:23e4:0:b0:35c:d4cf:c96f with SMTP id
 91-20020a9f23e4000000b0035cd4cfc96fmr3834873uao.17.1649322497880; Thu, 07 Apr
 2022 02:08:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220407031525.2368067-1-yuzhao@google.com> <CAOUHufZ8x5B-e+Wwgrh+qWryf8dAbfMWVEE0s-AfwZ-H7DouQg@mail.gmail.com>
 <20220407183112.2cb5b627@canb.auug.org.au>
In-Reply-To: <20220407183112.2cb5b627@canb.auug.org.au>
From:   Yu Zhao <yuzhao@google.com>
Date:   Thu, 7 Apr 2022 03:08:06 -0600
Message-ID: <CAOUHufYdeDV=caQvRv_g0rrPjTm29f0_bCOQJpr+qcFO+vpK6g@mail.gmail.com>
Subject: Re: [PATCH v10 00/14] Multi-Gen LRU Framework
To:     Stephen Rothwell <sfr@canb.auug.org.au>
Cc:     Linux-MM <linux-mm@kvack.org>, Andi Kleen <ak@linux.intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Aneesh Kumar <aneesh.kumar@linux.ibm.com>,
        Barry Song <21cnbao@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Hillf Danton <hdanton@sina.com>, Jens Axboe <axboe@kernel.dk>,
        Jesse Barnes <jsbarnes@google.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Matthew Wilcox <willy@infradead.org>,
        Mel Gorman <mgorman@suse.de>,
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
        "the arch/x86 maintainers" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Apr 7, 2022 at 2:31 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi Yu,
>
> On Wed, 6 Apr 2022 21:24:27 -0600 Yu Zhao <yuzhao@google.com> wrote:
> >
> > Can you please include this patchset in linux-next? Git repo for you to fetch:
> >
> > https://linux-mm.googlesource.com/mglru for-linux-next
>
> I get a message saying "This repository is empty. Push to it to show
> branches and history." :-(

Sorry about that

> > My goal is to get additional test coverage before I send a pull
> > request for 5.19 to Linus.
>
> Good idea :-)
>
> > I've explored all avenues, but ultimately I've failed to rally
> > substantial support from the MM stakeholders [1]. There are no pending
> > technical issues against this patchset [2]. What is more concerning
> > are the fundamental disagreements on priorities, methodologies, etc.
> > that are not specific to this patchset and have been hindering our
> > progress as a collective. (Cheers to the mutual dissatisfaction.)
>
> I have not been following the discussion as I am not an mm person, but
> this is not a good sign.
>
> > While we plan to discuss those issues during the LSFMM next month, it
> > doesn't seem reasonable to leave this patchset hanging in the air,
> > since it has reached its maturity a while ago and there are strong
> > demands from downstream kernels as well as a large user base. Thus I
> > sent that pull request to Linus a couple of weeks ago, implying that
> > he would have to make the final decision soon.
> >
> > I hope this gives enough background about what's been going on with
> > this patchset. If you decide to take it and it causes you any
> > troubles, please feel free to yell at me.
> >
> > Thanks!
> >
> > [1] https://lore.kernel.org/r/20220104202227.2903605-1-yuzhao@google.com/
> > [2] https://lore.kernel.org/r/20220326010003.3155137-1-yuzhao@google.com/
>
> I had a look at those threads and I guess things are better that your
> comment above implies.
>
> So, a couple of questions:
>
> Have you done a trial merge with a current linux-next tree to see what
> sort of mess/pain we may already be in?
>
> Is it all stable enough now that it could be sent as a patch series for
> Andrew to include in mmotm (with perhaps just smallish followup patches)?
>
> --
> Cheers,
> Stephen Rothwell
