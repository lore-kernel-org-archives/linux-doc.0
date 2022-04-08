Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12996C433F5
	for <linux-doc@archiver.kernel.org>; Fri,  8 Apr 2022 02:09:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230468AbiDHCLY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 7 Apr 2022 22:11:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52928 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229716AbiDHCLX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 7 Apr 2022 22:11:23 -0400
Received: from mail-vs1-xe32.google.com (mail-vs1-xe32.google.com [IPv6:2607:f8b0:4864:20::e32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 28509EAF
        for <linux-doc@vger.kernel.org>; Thu,  7 Apr 2022 19:09:20 -0700 (PDT)
Received: by mail-vs1-xe32.google.com with SMTP id r25so4105229vsa.13
        for <linux-doc@vger.kernel.org>; Thu, 07 Apr 2022 19:09:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Z0Qp7Yu0DBCRj1c8Wq8BvL9+iH9DKnierxKEWSMuj1A=;
        b=Zfdn9yf2N3tSdFK9CPpFN9l1Xg3YPG0WlnBAzf+DH8b2G2orW6EFhxiI0Pr+YgZpth
         veyUHtT2+2NlwUMOLJOH0uDzGELFgiagnJ1nnejf4FS77CFM5ftoqbaTcLdwz4PsNkxd
         QsNtImak6ce3HBvVPLjtMoBN7Ozr6WSHSUE7/DSFgUVAKzV2WhP0bBbxRK/yTEd1B2Od
         o8rY8pYr2Rxyvv61DtledlxZztsIWpGY4DV8NrSLLN+m6xgScP4WtXGePYxgCzIBE7bm
         xGGPi18ju+WaFsS0ANGoGAULK7heexzzowMR2UIhNtqHLimWCwxgiq/BZpz5//D+HYrn
         3lGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Z0Qp7Yu0DBCRj1c8Wq8BvL9+iH9DKnierxKEWSMuj1A=;
        b=OjqIKAlXYbZw6di+8YozX/8+4k65F3HKDwL7KWTU1f74zmvAeNbhvtkwdToWM2lCyL
         CuiirVCRz/fVe3WqbCxReBNpE/SiWrg5KZkUSh5OQkLPS6UqUrH4KXczjoTBO8kK4lry
         QE1xcb1QBTTAW6GbfU9bxrtI9ywfI1S6vz6oxaCbZpuS3o9NWr6G6dUb3SzS97z/KQ+w
         Gdni8T7fhaHmp3sWnnCHOB8OFXNpt/MeOe8XTs8AwBIjpieXXhU1uiBBmtolI0Zo33a0
         3CbwnMx1c9lgtF09pC/oYdt7uOXKzfjAYTcvQI713sC9wTlcJ8MM2L8xc1702h45Al/0
         ilXQ==
X-Gm-Message-State: AOAM533Hv/LaWJmYRJVf00X7iWmC0nukMIOu0ZJjLUW7QrTxKRaY1/Qg
        9ai+10+FZ9yLFQSJwLRgXjAd4Rmim498iLgyhI887A==
X-Google-Smtp-Source: ABdhPJwUZIDsaHJwpCof+f66Zu32Q3dHG70av+1BA38l3kjKLGbhm7LjGQqxI88AKvIaDFQrOR5DTJ/8oM8dJZQiSZI=
X-Received: by 2002:a67:fbcf:0:b0:325:6e61:4290 with SMTP id
 o15-20020a67fbcf000000b003256e614290mr5275653vsr.22.1649383759039; Thu, 07
 Apr 2022 19:09:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220407031525.2368067-1-yuzhao@google.com> <CAOUHufZ8x5B-e+Wwgrh+qWryf8dAbfMWVEE0s-AfwZ-H7DouQg@mail.gmail.com>
 <20220407183112.2cb5b627@canb.auug.org.au> <CAOUHufbaPR3H2KcYywCf0ycFWh=2Nf1PwiO4t8tO6TXB9U1MwA@mail.gmail.com>
 <20220407221354.5acc2711@canb.auug.org.au>
In-Reply-To: <20220407221354.5acc2711@canb.auug.org.au>
From:   Yu Zhao <yuzhao@google.com>
Date:   Thu, 7 Apr 2022 20:08:43 -0600
Message-ID: <CAOUHufafM6kK-UWncn2rVw0qCv1Ap3SoDn7SeT0Efbtmrfyd0Q@mail.gmail.com>
Subject: Re: [PATCH v10 00/14] Multi-Gen LRU Framework
To:     Stephen Rothwell <sfr@canb.auug.org.au>,
        Andrew Morton <akpm@linux-foundation.org>
Cc:     Linux-MM <linux-mm@kvack.org>, Andi Kleen <ak@linux.intel.com>,
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

On Thu, Apr 7, 2022 at 6:14 AM Stephen Rothwell <sfr@canb.auug.org.au> wrote:
>
> Hi,
>
> On Thu, 7 Apr 2022 03:41:15 -0600 Yu Zhao <yuzhao@google.com> wrote:
> >
> > > So, a couple of questions:
> > >
> > > Have you done a trial merge with a current linux-next tree to see what
> > > sort of mess/pain we may already be in?
> >
> > Yes, the repo I prepared for you is based on the latest linux-next.
> > There shouldn't be any conflicts.
>
> Ah, that is a problem :-(  I can't merge a branch into linux-next if
> that branch is based on linux-next itself.  linux-next rebases
> everyday, so that merge would bring in the previous version of
> linux-next - including other branches that may have rebased :-(
>
> All the branches in linux-next need to be based on Linus' tree or some
> tree that does not rebase (or one you can keep up with if it does
> rebase).
>
> The only exception is part of Andrew's patch series which is rebased
> (by me) on top of linux-next each day.

Gotcha.

> > > Is it all stable enough now that it could be sent as a patch series for
> > > Andrew to include in mmotm (with perhaps just smallish followup patches)?
> >
> > Yes, on multiple occasions, e.g., [1][2][3], I've claimed this
> > patchset has an unprecedented test coverage and nobody has proven
> > otherwise so far.
> >
> > Andrew suggested a cycle in linux-next [4]. So here we are :)
>
> So the easiest thing for me is if Andrew takes it into his mmotm patch
> series (most of which ends up in linux-next).

Agreed.

> Otherwise I am probably
> at some point going to need help fixing the conflicts.

Yes, very likely.

I see three options at the moment:
1. I grab mmotm, rebase it, apply this patchset atop and then route it
to you. Based on my rough understanding of your workflow, this might
reduce the work on your side.
2. I skip linux-next, and when I send the pull request for 5.19, I'll
include incentive for Linus to potentially forgo the required
linux-next cycle.
3. You or Andrew would have to do something you/he might not enjoy :)

Please let me know. Thanks!
