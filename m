Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 212C4C433F5
	for <linux-doc@archiver.kernel.org>; Wed,  9 Mar 2022 01:06:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229764AbiCIBG5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 8 Mar 2022 20:06:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46148 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229942AbiCIBGm (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 8 Mar 2022 20:06:42 -0500
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A3F7814994E
        for <linux-doc@vger.kernel.org>; Tue,  8 Mar 2022 16:45:54 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id g1so867117pfv.1
        for <linux-doc@vger.kernel.org>; Tue, 08 Mar 2022 16:45:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=C9mwhzMPXsuBhWeNQaY1yLcs8fwNMTqk4ERNtUz41w0=;
        b=BDABS9uVQcFS/djzmKr84X48kvQ7FDJAHE5GyVdrdiXPfTAYC3kgAFEzfvB6h5+7Ne
         DKI04IYSdFHK205mfzwOunyx4PHkbqy5VyoQ+nymhIwFfW7fLx6kcpzrepYQtmDNfncI
         YRhh6zrCf45T/6Th5xWqyvHHaC1k7FaJUXexXtRN4AiXd2xH+N4D4P3m+p/ADG+Xg6ve
         AFjeP6Jm272NK/5u/t9B1O8Qh2xSavwE4p9U+Dr8Oiwr+ilU5lrCUw3f+pMoIIM882Va
         O0xSq8iwXs3eCyKaIJHJymhVdMnlCnaqFoNkx7QlKg6nFd850+5Z0Y1pVrPq8DGUnblw
         V87g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=C9mwhzMPXsuBhWeNQaY1yLcs8fwNMTqk4ERNtUz41w0=;
        b=Qwak8zvVAzSMKyBWMp70+aoZtveaF/S2RCoN24QI5bwsbcz3hGqdVmW7ZTvaxhM5Sn
         WBTf5VzCq54mafqNS5h6t3+sv5Fmm+rG/K335tgfp7eddHBwYma/30uBr81PBUI1RH1T
         JQzh/+/a4gBWtU+dlVDevN6sBzPUDRtgCQnCVxqcy4N6zj1twlJK8e3PjxfqjYtDZpNb
         U15iyjLHDsJ3r5Lx+fBNqUsYh37lnM5SXEebWA225MKhJxl9iUEHiF1XBqkgy8/IAKXG
         lJFPlGd1a1a9+npc9DwNzmANSZ3PQ1X7gICPRNke/R+qTsS6RLrehpnN9/9avb6AP1GP
         doSg==
X-Gm-Message-State: AOAM530DxFLiWfHghyACVzZCb2iE3O6SOy6TAkfdkvRrb9j2uWTgPtIy
        6WPWtzZ2KNovPdESfm2w916QB31aixfxjZzG3fNQm437hxr6Ow8/
X-Google-Smtp-Source: ABdhPJyBAfeSZLyjOQmRLVwYDPtCASEbExuTxYgwggPQnIDguzuOxXWN2t0qp9chTtu67kkdtr9sUGRdA8hf3NSsJIk=
X-Received: by 2002:a1f:314b:0:b0:331:fff6:a89e with SMTP id
 x72-20020a1f314b000000b00331fff6a89emr8182208vkx.26.1646784902851; Tue, 08
 Mar 2022 16:15:02 -0800 (PST)
MIME-Version: 1.0
References: <20220308234723.3834941-1-yuzhao@google.com> <CAHk-=wi5wg=72exwHODJdVtAfqa1e85dGfjGftuhHQ5Z4v-DNA@mail.gmail.com>
In-Reply-To: <CAHk-=wi5wg=72exwHODJdVtAfqa1e85dGfjGftuhHQ5Z4v-DNA@mail.gmail.com>
From:   Yu Zhao <yuzhao@google.com>
Date:   Tue, 8 Mar 2022 17:14:51 -0700
Message-ID: <CAOUHufYFDawK6vmkQ16EQm7FSHresViifnxW2yj_RDuMSjJPjg@mail.gmail.com>
Subject: Re: [PATCH v8 00/14] Multi-Gen LRU Framework
To:     Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
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
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>,
        Kernel Page Reclaim v2 <page-reclaim@google.com>,
        "the arch/x86 maintainers" <x86@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Mar 8, 2022 at 5:07 PM Linus Torvalds
<torvalds@linux-foundation.org> wrote:
>
> On Tue, Mar 8, 2022 at 3:48 PM Yu Zhao <yuzhao@google.com> wrote:
> >
> > The current page reclaim is too expensive in terms of CPU usage and it
> > often makes poor choices about what to evict. This patchset offers an
> > alternative solution that is performant, versatile and
> > straightforward.
>
> So apart from my complaints about asking users config questions that
> simply should not be asked, I really think this just needs to start
> getting merged.
>
> We've seen several numbers on the upsides, and I don't think we'll see
> any of the downsides until we try it. And I don't think there is any
> question that we _shouldn't_ try it, given the numbers posted.
>
> But yeah, I certainly _hope_ that all the benchmarking has been done
> with a unified set of config values, and it's not some kind of bogus
> "cherry-picked config values for this particular machine" kind of
> benchmarking that has been done.
>
> Because that isn't valid benchmarking - comparing some "tuned for this
> paeticular machine or load" setup to a default one is just not worth
> even setting numbers to, and debases the whole value of posting
> results.

All benchmarks were done with the default config values. I'm removing
those config options now.

This sounds self-serving: our data centers want them, so I had to try.
