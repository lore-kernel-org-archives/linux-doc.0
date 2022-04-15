Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7FD7C433F5
	for <linux-doc@archiver.kernel.org>; Fri, 15 Apr 2022 22:58:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1356385AbiDOXAq (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 15 Apr 2022 19:00:46 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60806 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1349697AbiDOXAo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 15 Apr 2022 19:00:44 -0400
Received: from mail-vs1-xe30.google.com (mail-vs1-xe30.google.com [IPv6:2607:f8b0:4864:20::e30])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0E5501A061
        for <linux-doc@vger.kernel.org>; Fri, 15 Apr 2022 15:58:15 -0700 (PDT)
Received: by mail-vs1-xe30.google.com with SMTP id z139so2647918vsz.0
        for <linux-doc@vger.kernel.org>; Fri, 15 Apr 2022 15:58:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=A+56kF8Lrin39J5VdgWnd4/aOUjS2DtusSM12wLozqw=;
        b=UZF+A66HZGnZJZ61lTOtqW6g2I7YTVdbyQcNB+evGKbXCRVZz62v/EwsKOIzp19zBB
         59rP6ewO/3sygS2xCMotjevd9M8r3znfqKm/4bgOn9fX5Z8fVJx5lOA4j1US7s0aIHl5
         /VtYuyVHER/ytM7ZGizJ/r5kgT/co3s6JzRUMqpTNFKyNfQN3hEwrDzUPGGJfUwgp1sp
         aFryI9eCSPcud7ziWsN3knb9cLSCgeLaAdLiVqqKjSMwuFmKCqXh/wbxQdH0xhWBZipj
         NEys5URXcr/aYhEiaU9NSXuTQoXCn5bbR1TWWP4qtJUwTlyMqz53GuG85W6cXTkubUnc
         JUMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=A+56kF8Lrin39J5VdgWnd4/aOUjS2DtusSM12wLozqw=;
        b=6PljdAdlr9c0s8v1aGLPeNkNPHDGSKDyJtVPGC7OoLMi79UnjtPTjvZ39KTHRoHEEt
         BvsQIirxS0yj5Adhpmn26ijrgUm5dkGDl+3NB/JVPQIFEaRnz2rRwH9SDtWMMCgLPZEP
         LUiQ6gnYO1acduMi3vV+/i1BL01rLUwja1xJ6HoFFL09wXvIiQhmigqOrbhBfR9mJjD2
         eMVX8BBRy58drqD/hFOUlWMp42NaVD1lr5fbpZnRO9S5kdwz3YeSsocbeAuj7g/ZkHPW
         X4Soau8I2J2s0zTDxQcHlR10oQj9/xJax3YfUcHTNQ1MYwDQjDErJXNXJGDr+/XTPIgw
         ngNQ==
X-Gm-Message-State: AOAM530gsJdcmbfoPVJu2x+v55B2u2mJ9fFOnuThYqCmzT4yZPEgR6Xb
        Je7Q66Tm5ehDTHkky/sDgz4OXn4htF/YpsOsX10Q+w==
X-Google-Smtp-Source: ABdhPJwWAmqYmdT8dsz6M7ZpU7MuJkcW11EpUOZD7VbT85AzKxPPMX2jjcOCdoHQ63DJsfg6SUOF9gF2pR4cTTl/WTA=
X-Received: by 2002:a05:6102:5cc:b0:320:9bd2:3823 with SMTP id
 v12-20020a05610205cc00b003209bd23823mr332654vsf.81.1650063493942; Fri, 15 Apr
 2022 15:58:13 -0700 (PDT)
MIME-Version: 1.0
References: <20220407031525.2368067-1-yuzhao@google.com> <20220407031525.2368067-9-yuzhao@google.com>
 <20220411191621.0378467ad99ebc822d5ad005@linux-foundation.org>
 <CAOUHufYeC=Kuu59BPL_48sM67CqACxH2wWy-SYGXpadgMDmY3w@mail.gmail.com>
 <20220414185654.e7150bcbe859e0dd4b9c61af@linux-foundation.org>
 <CAOUHufYy6yQS9ARN9C5+ODkopR+ez4TH3hZNZo4HtNHBExS1mA@mail.gmail.com>
 <20220415121521.764a88dda55ae8c676ad26b0@linux-foundation.org>
 <CAOUHufYsjwMGMFCfYoh79rFZqwqS1jDihcBS9sHd-gBxEAD3Ug@mail.gmail.com>
 <20220415143220.cc37b0b0a368ed2bf2a821f8@linux-foundation.org> <CAHk-=whvkRTVBhAamt0kYyp925jk_+g7T0CyPke_FbCWGQ1VvA@mail.gmail.com>
In-Reply-To: <CAHk-=whvkRTVBhAamt0kYyp925jk_+g7T0CyPke_FbCWGQ1VvA@mail.gmail.com>
From:   Yu Zhao <yuzhao@google.com>
Date:   Fri, 15 Apr 2022 16:57:37 -0600
Message-ID: <CAOUHufZ4KrjFTYH8wtwMGd9AriZfZtO4GhbiK1SuNbY31VTT9w@mail.gmail.com>
Subject: Re: [PATCH v10 08/14] mm: multi-gen LRU: support page table walks
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Justin Forbes <jforbes@fedoraproject.org>,
        Stephen Rothwell <sfr@rothwell.id.au>,
        Linux-MM <linux-mm@kvack.org>, Andi Kleen <ak@linux.intel.com>,
        Aneesh Kumar <aneesh.kumar@linux.ibm.com>,
        Barry Song <21cnbao@gmail.com>,
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

On Fri, Apr 15, 2022 at 3:43 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Fri, Apr 15, 2022 at 2:32 PM Andrew Morton <akpm@linux-foundation.org> wrote:
> >
> > We could create a new MM-developer-only assertion.  Might even call it
> > MM_BUG_ON().  With compile-time enablement but perhaps not a runtime
> > switch.
>
> .. or VM_BUG_ON() could just become a WARN_ON_ONCE().
>
> Which it should be anyway - since the code has to be written to
> continue after that BUG_ON() anyway.
>
> There is absolutely _zero_ advantage to killing the machine. If you
> want to be notified about "this must not happen", then WARN_ON_ONCE()
> is the right thing to use.
>
> BUG_ON() is basically always the wrong thing to do.

Not trying to start a meta discussion, just my two cents:

This is a typical trolley problem: for the greater good, do we want to
inflict more pain on a small group of users running experimental
kernels so that they'd come back and yell at us quicker and louder?
BUG_ONs are harmful but problems that trigger them would be
presummingly less penetrating to the user base; on the other hand,
from my experience working with some testers (ordinary users), they
ignore WARN_ON_ONCEs until the kernel crashes.

I'll let Justin chime in on Fedora's take on CONFIG_DEBUG_VM. I bet
it's intended to crash the kernel.
