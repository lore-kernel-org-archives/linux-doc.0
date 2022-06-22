Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F384C433EF
	for <linux-doc@archiver.kernel.org>; Wed, 22 Jun 2022 18:59:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1377421AbiFVS7k (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 22 Jun 2022 14:59:40 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46968 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1377379AbiFVS7h (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 22 Jun 2022 14:59:37 -0400
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com [IPv6:2607:f8b0:4864:20::e2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7018233368
        for <linux-doc@vger.kernel.org>; Wed, 22 Jun 2022 11:59:36 -0700 (PDT)
Received: by mail-vs1-xe2e.google.com with SMTP id k25so10333150vso.6
        for <linux-doc@vger.kernel.org>; Wed, 22 Jun 2022 11:59:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=znYvHmQcO9pIRRv6Z8ozam49umE/VEVHtcAiw2I40Es=;
        b=CLK0Sc/VIQrO0e0i4+me/g3XoHa0rzmIKIsq7EEwFczzkwg7MmJmjQtgOABsf+JhAj
         rdt0AtJ9uvHEebNKgMI2tl7OzmOoGwYLZr1OeLh5aBeYBbjkw8E6v+OuEktc+sdw1Nec
         13m88X9Nab1dyhzoVljcxP30x42qCsjqU6X0Z00ETL+oIY2ZgYndQ9Oj5qTT04s5pIg/
         g9fPQh8DaGU4Zte5VhvuiY8Sem3CAAtxdhE5pRMwYtpUBLNFbgWgKlqyFL7Rrjx4moU/
         8/tM3m0AusZI6GKOgQtIo/UHMUJ00DmKJZHSLtis09uIimKdBEbyyfEblHYNBCRAM+55
         w/wA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=znYvHmQcO9pIRRv6Z8ozam49umE/VEVHtcAiw2I40Es=;
        b=henbcYQ0VjotxpQ70keRi7pC8XVcog9Wue5co7pb6002XMV05XJkmfHQZgho+9eLUZ
         fdVsYI+U5TXCY4IbtotbVIUo/QC63DBli1BEMtzT85JGkJcfrH0GSmr5oVX8AwjIDu2I
         qsXZUgfKlkQcfq1yilNFDTdcHY0OwZ8LJjB4hrhr0GaiydrWaz5i9TM58jXe6hZqX8/B
         Zk28zwfxeBqMgM1hMecrB5U4bTMEH5/xpmQsdt4Cv7YXFxEOB9C6Xh86jrEm99dPxoth
         ps6+U4iqhYd83I940M86WX+Gi57oAKfPax22OqALPw7zP26Hk6Wn32lCMRBoYHrGIlkK
         seow==
X-Gm-Message-State: AJIora9b+YA+afXA3dnKJVtmh2qBG9Wq3PPIUEVu0sqU75V/s4cOAIs3
        4YQMFXv6JlNuDywV33q7qyRL5Szyw5Hji/GowaLRDQ==
X-Google-Smtp-Source: AGRyM1uavjJLzM0cL61VD8DwjKtvC3vJEveEtmvdwbmLM160pNEVOUsFglLOn9gcHkO71FalVgfPg63k9+qdulgbh4w=
X-Received: by 2002:a05:6102:32c8:b0:34c:2358:1824 with SMTP id
 o8-20020a05610232c800b0034c23581824mr17035693vss.65.1655924375399; Wed, 22
 Jun 2022 11:59:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220614071650.206064-1-yuzhao@google.com> <CAOUHufbuqGJJ1pUJuYW8h6uB5+KpNSJotEd_WSzF5AK-S_6PoA@mail.gmail.com>
 <20220622114552.d878769ee7e3bc6a5240f430@linux-foundation.org>
In-Reply-To: <20220622114552.d878769ee7e3bc6a5240f430@linux-foundation.org>
From:   Yu Zhao <yuzhao@google.com>
Date:   Wed, 22 Jun 2022 12:58:59 -0600
Message-ID: <CAOUHufZw3g4Fpntmwir_Hy5FR7=xvzKoOiA3R24FCW_=tfvUkg@mail.gmail.com>
Subject: Re: [PATCH v12 00/14] Multi-Gen LRU Framework
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Andi Kleen <ak@linux.intel.com>,
        Aneesh Kumar <aneesh.kumar@linux.ibm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Hillf Danton <hdanton@sina.com>, Jens Axboe <axboe@kernel.dk>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Matthew Wilcox <willy@infradead.org>,
        Mel Gorman <mgorman@suse.de>,
        Michael Larabel <Michael@michaellarabel.com>,
        Michal Hocko <mhocko@kernel.org>,
        Mike Rapoport <rppt@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Tejun Heo <tj@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        Kernel Page Reclaim v2 <page-reclaim@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jun 22, 2022 at 12:46 PM Andrew Morton
<akpm@linux-foundation.org> wrote:
>
> On Wed, 22 Jun 2022 00:21:47 -0600 Yu Zhao <yuzhao@google.com> wrote:
>
> > > TLDR
> > > ====
> > > The current page reclaim is too expensive in terms of CPU usage and it
> > > often makes poor choices about what to evict. This patchset offers an
> > > alternative solution that is performant, versatile and
> > > straightforward.
> >
> > I don't see any action items left for me. Are we good for the next merge window?
>
> Qi Zheng just found an item ;)

Well, an embarrassing one, and I hope it's the last one :)

> Yes, I'd like to get this in soon.  I've been waiting for the mapletree work
> to converge a bit further.

No worries. We are not in any rush, just planning ahead, since this
patchset has conflicts with Muchun's LRU page reparenting work [1].

[1] https://lore.kernel.org/linux-mm/20220621125658.64935-1-songmuchun@bytedance.com/
