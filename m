Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A9927FA373D
	for <linux-doc@archiver.kernel.org>; Fri, 21 Oct 2022 16:50:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230318AbiJUQuj (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 21 Oct 2022 12:50:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43698 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230363AbiJUQuh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 21 Oct 2022 12:50:37 -0400
Received: from mail-qt1-x82c.google.com (mail-qt1-x82c.google.com [IPv6:2607:f8b0:4864:20::82c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7BDE432D93
        for <linux-doc@vger.kernel.org>; Fri, 21 Oct 2022 09:50:30 -0700 (PDT)
Received: by mail-qt1-x82c.google.com with SMTP id cr19so2046870qtb.0
        for <linux-doc@vger.kernel.org>; Fri, 21 Oct 2022 09:50:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=K4hKno/aL4Bg3771FP97RAk5vH0GViKpS0EoTFQiXAc=;
        b=QLOUBa61SZHZELYuNpmzZwTNuHX9WWmk2yK/KTPOBV/MohvWeTpdvKV+If+Gt00dLR
         HDpP7VpVW3lZbNB5dJ1RnNqyztGfGm1VPhetkX0w9W5qnsLXrfzEi66whylia5hRH4q3
         y/EzFsN0ohUolFYNwuS9CZuiefP2XPX9gNCzY=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=K4hKno/aL4Bg3771FP97RAk5vH0GViKpS0EoTFQiXAc=;
        b=WMn8uU17eJGgLLvNEJEwUdHSCJQLCcTWy6KkUgoO7aYfbPsaGhoAk28rYuOAtS9p/3
         EvrIMRQi4cJsNoBJBqBANakOrQIMVnsyPajuIu07ivk1tC6fiPRwSET8oDpHv9h0QEnH
         lNHupU6eopvDC7TY7n5bv8Hinn7VnhoDWHxL0u/c7zjzAxtrltMEyvdPFkPhWZxUXey7
         RRhZnYKPMnD6ND4lqk1UCSICosYEMZdVqsjtZiSA8YSxlYYdMoR/lM3R9rybQM6LhISu
         d3EdKq0x33gJ0pUvhivbu60tXcXhT2nch+G2CuqURMYG4mjLpaOkjCZOIcwdAicy9Cpf
         Pmyg==
X-Gm-Message-State: ACrzQf28mbpvJdnEZLCB6cCTu5+HUBLwS0EQU0BlYvP+du0HbsxvtuYx
        q5bm7bpu9XfBxmknXgRvp9e9WxtJTmYW2A==
X-Google-Smtp-Source: AMsMyM5AfouZd21mOxiol2R/6NScARErSYxJ/UzD2p9cUNCQIQYv32QNgtux2AzX7EkHXfC4GNFDLw==
X-Received: by 2002:a05:622a:1809:b0:39c:c7b5:b3ed with SMTP id t9-20020a05622a180900b0039cc7b5b3edmr17773862qtc.140.1666371029389;
        Fri, 21 Oct 2022 09:50:29 -0700 (PDT)
Received: from mail-yw1-f181.google.com (mail-yw1-f181.google.com. [209.85.128.181])
        by smtp.gmail.com with ESMTPSA id y13-20020a05620a25cd00b006bbf85cad0fsm10111762qko.20.2022.10.21.09.50.28
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Oct 2022 09:50:28 -0700 (PDT)
Received: by mail-yw1-f181.google.com with SMTP id 00721157ae682-36ad4cf9132so263347b3.6
        for <linux-doc@vger.kernel.org>; Fri, 21 Oct 2022 09:50:28 -0700 (PDT)
X-Received: by 2002:a81:6088:0:b0:361:52e4:dec8 with SMTP id
 u130-20020a816088000000b0036152e4dec8mr17473482ywb.352.1666371017990; Fri, 21
 Oct 2022 09:50:17 -0700 (PDT)
MIME-Version: 1.0
References: <20220815071332.627393-1-yuzhao@google.com> <20220815071332.627393-9-yuzhao@google.com>
 <Y0go8wWtdcyH1+Ch@hirez.programming.kicks-ass.net> <CAOUHufa9+FTO3Pv-5jC-e3S5goPsUGu-5KcPVHa4bWb0X+d2ug@mail.gmail.com>
 <CAHk-=wj1rc2t5noMtVOgu8XXeTM4KiggEub9PdcexxeQrYPZvA@mail.gmail.com>
 <Y1FXpHdyvXjrjbLw@hirez.programming.kicks-ass.net> <CAHk-=whQchubuDpRGFabhmcZuzdt13OOF8wznXb+Dbi3GzBQhQ@mail.gmail.com>
 <Y1GZjPO+szk7X0wP@hirez.programming.kicks-ass.net> <CAHk-=wikUaRM5H_y1Bc+QyvGi40dKDL8fnCTyz7ECbwK7aHNPQ@mail.gmail.com>
 <Y1IUMDJFScAMrCS5@casper.infradead.org>
In-Reply-To: <Y1IUMDJFScAMrCS5@casper.infradead.org>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 21 Oct 2022 09:50:01 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjrpH1+6cQQjTO6p-96ndBMiOnNH098vhS2jLybxD+7gA@mail.gmail.com>
Message-ID: <CAHk-=wjrpH1+6cQQjTO6p-96ndBMiOnNH098vhS2jLybxD+7gA@mail.gmail.com>
Subject: Re: [PATCH v14 08/14] mm: multi-gen LRU: support page table walks
To:     Matthew Wilcox <willy@infradead.org>,
        "Maciej W. Rozycki" <macro@orcam.me.uk>
Cc:     Peter Zijlstra <peterz@infradead.org>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        Yu Zhao <yuzhao@google.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Andi Kleen <ak@linux.intel.com>,
        Aneesh Kumar <aneesh.kumar@linux.ibm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Hillf Danton <hdanton@sina.com>, Jens Axboe <axboe@kernel.dk>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>, Mel Gorman <mgorman@suse.de>,
        Michael Larabel <Michael@michaellarabel.com>,
        Michal Hocko <mhocko@kernel.org>,
        Mike Rapoport <rppt@kernel.org>, Tejun Heo <tj@kernel.org>,
        Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        page-reclaim@google.com, Brian Geffon <bgeffon@google.com>,
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

On Thu, Oct 20, 2022 at 8:38 PM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Thu, Oct 20, 2022 at 07:10:46PM -0700, Linus Torvalds wrote:
> >
> > We got rid of i386 support back in 2012. Maybe it's time to get rid of
> > i486 support in 2022?
>
> Arnd suggested removing i486 last year and got a bit of pushback.
> The most convincing to my mind was Maciej:

Hmm. Maciej added to the cc.

I suspect we can just say "oh, well, use LTS kernels".

> but you can see a few other responses indicating that people have
> shipped new 486-class hardware within the last few years (!)

Hmm.. I can only find references to PC104 boards with Bay Trail
(Pentium-class Atom core, iirc), and some possible FPGA
implementations through MISTer.

There's apparently also a Vortex86DX board too, and I don't know what
core that is based off, but judging from the fact that it has a
dual-core version, it had *better* support cmpxchg8b anyway, because
without that our 64-bit atomics aren't actually atomic.

(Trying to google around, it looks like the older Vortex86SX was a
486-class CPU and did indeed lack CX8)

Intel had some embedded cores (Quark) that were based on the i486
pipeline (as can be seen from the timings), but they actually reported
themselves as Pentium-class and supported all the classic (pre-MMX)
Pentium features.

So I *really* don't think i486 class hardware is relevant any more.
Yes, I'm sure it exists (Maciej being an example), but from a kernel
development standpoint I don't think they are really relevant.

At some point, people have them as museum pieces. They might as well
run museum kernels.

Moving up to requiring cmpxchg8b doesn't sound unreasonable to me.

            Linus
