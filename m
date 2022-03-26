Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F92EC433EF
	for <linux-doc@archiver.kernel.org>; Sat, 26 Mar 2022 01:07:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229437AbiCZBJY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 25 Mar 2022 21:09:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44004 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229836AbiCZBJY (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 25 Mar 2022 21:09:24 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1069715282E
        for <linux-doc@vger.kernel.org>; Fri, 25 Mar 2022 18:07:49 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id bi12so18464435ejb.3
        for <linux-doc@vger.kernel.org>; Fri, 25 Mar 2022 18:07:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NseqcOErFtU1LljXK411YTLgt9GH8dQMTY4dlb6RFSk=;
        b=LNgmEMCn1XnxX/EFBHUQ2zGxHvMCFBgu+ZpE3CiC2daiCLlILuCJLO7tuHRQ4w19+G
         zouO12+LwuYUNeyDQXrfeVBAI4OThT+BsSQLmjTA4r/9D4Ajgbdmr5vbulOZz7lXV5yM
         ZTs47phBmakG6v9VF47l0+hTPTc3c8ssjfmXs=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NseqcOErFtU1LljXK411YTLgt9GH8dQMTY4dlb6RFSk=;
        b=H6f7o3Misj6A3IKRtpVGy1dgk+T5RDu5jf7S+JaxzgmrliOSSew/dBi09kAMZzjgsC
         cF0XqVyTIK/OBoi+QNxaaKeWcdOU1vpUYMqyiD1p12qsS2Soyheg2g3LQBCG+oy0p1Ch
         CWerbTQXyGKvCtglGzn64C0+S+qjP9hWfZRpaNj7LPfhABnRsuZfbV4ih1c4cNXypyw2
         6DtG0beIkOiJux3lGuEOZ/CqrU5COTdGLQLtstYVXi0ii8ucxsScT3wyi21EAREH0rE0
         EoW2oZF4N+Qh80VpuxNHEI85KmHjWU8ZQT/pjHI6Szr+2o5V3vCw9p1rnXzZ10zTUaG6
         j8bA==
X-Gm-Message-State: AOAM531djHIcI1UI9uev1q2libIeGOvpBj045X7UHpfL/Xx+Kq5+VbYp
        a7isGdvX6HxxgXxTlrg+/hU9/yWs0+LpL12AULeUdg==
X-Google-Smtp-Source: ABdhPJzmp2Fvx8HvIrYvzZLug+YwlHo5lh2kq3HbpFLQ/832eNAGB53chiPnx7hdOac3i+MjU8qAfg==
X-Received: by 2002:a17:907:7f0b:b0:6e0:a336:a3f5 with SMTP id qf11-20020a1709077f0b00b006e0a336a3f5mr6151941ejc.541.1648256867305;
        Fri, 25 Mar 2022 18:07:47 -0700 (PDT)
Received: from mail-ej1-f43.google.com (mail-ej1-f43.google.com. [209.85.218.43])
        by smtp.gmail.com with ESMTPSA id qa44-20020a17090786ac00b006dbcd7c9656sm2920418ejc.172.2022.03.25.18.07.45
        for <linux-doc@vger.kernel.org>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Mar 2022 18:07:46 -0700 (PDT)
Received: by mail-ej1-f43.google.com with SMTP id bq8so4451332ejb.10
        for <linux-doc@vger.kernel.org>; Fri, 25 Mar 2022 18:07:45 -0700 (PDT)
X-Received: by 2002:a2e:9904:0:b0:247:ec95:fdee with SMTP id
 v4-20020a2e9904000000b00247ec95fdeemr10483376lji.291.1648256855004; Fri, 25
 Mar 2022 18:07:35 -0700 (PDT)
MIME-Version: 1.0
References: <20220326010003.3155137-1-yuzhao@google.com>
In-Reply-To: <20220326010003.3155137-1-yuzhao@google.com>
From:   Linus Torvalds <torvalds@linux-foundation.org>
Date:   Fri, 25 Mar 2022 18:07:18 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjp=jEhjvD9GPnHfuV5Kc1=rUnf84b_qscLJ8fkY74u3Q@mail.gmail.com>
Message-ID: <CAHk-=wjp=jEhjvD9GPnHfuV5Kc1=rUnf84b_qscLJ8fkY74u3Q@mail.gmail.com>
Subject: Re: [GIT PULL] Multi-gen LRU for 5.18-rc1
To:     Yu Zhao <yuzhao@google.com>
Cc:     Andi Kleen <ak@linux.intel.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Aneesh Kumar <aneesh.kumar@linux.ibm.com>,
        Barry Song <baohua@kernel.org>,
        Brian Geffon <bgeffon@google.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Daniel Byrne <djbyrne@mtu.edu>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Donald Carr <d@chaos-reins.com>,
        Hillf Danton <hdanton@sina.com>,
        =?UTF-8?Q?Holger_Hoffst=C3=A4tte?= <holger@applied-asynchrony.com>,
        Jan Alexander Steffens <heftig@archlinux.org>,
        Jens Axboe <axboe@kernel.dk>,
        Jesse Barnes <jsbarnes@google.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Konstantin Kharlamov <Hi-Angel@yandex.ru>,
        Matthew Wilcox <willy@infradead.org>,
        Mel Gorman <mgorman@suse.de>,
        Michael Larabel <Michael@michaellarabel.com>,
        Michal Hocko <mhocko@kernel.org>,
        Mike Rapoport <rppt@kernel.org>,
        Oleksandr Natalenko <oleksandr@natalenko.name>,
        Rik van Riel <riel@surriel.com>,
        Shuang Zhai <szhai2@cs.rochester.edu>,
        Sofia Trinh <sofia.trinh@edi.works>,
        Steven Barrett <steven@liquorix.net>,
        Suleiman Souhlal <suleiman@google.com>,
        Vaibhav Jain <vaibhav@linux.ibm.com>,
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

On Fri, Mar 25, 2022 at 6:00 PM Yu Zhao <yuzhao@google.com> wrote:
>
> This is more of an option than a request for 5.18. I'm sending it to
> you directly because, in my judgement, it's now as ready as it'll ever
> be.

So I do expect to merge this, but I don't think it has been in
linux-next, has it?

I would really like to see it get that linux-next workout with various
automation bots going after it.

I'd also like to see explicit acks from the usual suspects, or at
least make sure we don't have any explicit NAK's coming in.

Andrew & co?

                   Linus
