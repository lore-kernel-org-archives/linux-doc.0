Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 855CEC433FE
	for <linux-doc@archiver.kernel.org>; Tue,  4 Jan 2022 20:30:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232712AbiADUaG (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 4 Jan 2022 15:30:06 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53530 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232308AbiADUaG (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 4 Jan 2022 15:30:06 -0500
Received: from mail-il1-x12c.google.com (mail-il1-x12c.google.com [IPv6:2607:f8b0:4864:20::12c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2B550C061784
        for <linux-doc@vger.kernel.org>; Tue,  4 Jan 2022 12:30:06 -0800 (PST)
Received: by mail-il1-x12c.google.com with SMTP id c4so22834676iln.7
        for <linux-doc@vger.kernel.org>; Tue, 04 Jan 2022 12:30:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=bul4qlld97QBjtDSOOsdxIpEMimKYTW5dlcNbaowlwI=;
        b=mtOJsGe1HP0q/Qhh/bycX0h7Jl/2jwzWfmiCyFlRg7R9A2TbdfKxdP8MT5k8D3hwYG
         dT7Ui1OUrpbhvH9QaHr78W0WdOnp64FBmr+S7Q0Vpeg5LpyfuffPNRR9HI3Xbxe8isPN
         F1Sjctn+bJI+/w+T9FmffZPNjQUR5pzoQaQXQWByf530JChpNIL06htkS0sLXiE/CxEA
         gLcuxfQ6BwNSvI3d995Wjh3kaRM06X91TN6q8ctqymYXrDluJ4ns16GLmg4BF0TWfb+K
         rTRwjSYscljigBMSX1uYI63ZSp0B+NmdoJSZ0rSu3In2kLIawYXWswXTAj4tL5YXTQGP
         BRSw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=bul4qlld97QBjtDSOOsdxIpEMimKYTW5dlcNbaowlwI=;
        b=xaAiR0xRcWaM/w4bsRP/jPJ32CH26GdcLMK+b2lb41uk1o6JgyDfsXJK1148JjMg2k
         MuHsXI2CmEf2nFx2Xm3zrzImNjYvQhBglLzuiQT91y6l0w9ccmQ3iVjAQ577cxbriaA9
         3gdwgoCPz8JBhofvqdtU4tQm7HAQiSAxyMkmUrTkb4YrMxEwXKnDK4YlWo/HBDLY2opJ
         LZILm7L8gzav5SvKLXMWUe88Ff2QoAtDSiST/oYU3NNIyjTVAGGiOUv09uKseyoO77j2
         bu9H3jCdshm5+EJKDHQo9NuixO3sB/icDHqWXGkg7ojX4IzHXGXZQVsiL7WmS4LXZeun
         FMSA==
X-Gm-Message-State: AOAM531QVJCeVpXBXIotkERuUmdUXfQHiRMcFMY9+Nltr6oBDbbiuPEd
        VTw4sBZaRKwUQV2tHhK45muF1Q==
X-Google-Smtp-Source: ABdhPJwvrfas8nfe+PA6BOX0tHt36uxsoseV9gaRTUzX91V4WBmk/Mv40lM9zPNj86T6Z6k0gl7T1Q==
X-Received: by 2002:a05:6e02:1567:: with SMTP id k7mr23098838ilu.46.1641328205445;
        Tue, 04 Jan 2022 12:30:05 -0800 (PST)
Received: from google.com ([2620:15c:183:200:6c8c:5506:7ca2:9dfd])
        by smtp.gmail.com with ESMTPSA id k13sm29592220iow.45.2022.01.04.12.30.04
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 04 Jan 2022 12:30:05 -0800 (PST)
Date:   Tue, 4 Jan 2022 13:30:00 -0700
From:   Yu Zhao <yuzhao@google.com>
To:     Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>
Cc:     Andi Kleen <ak@linux.intel.com>,
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
        Rik van Riel <riel@surriel.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>,
        Ying Huang <ying.huang@intel.com>,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-mm@kvack.org,
        page-reclaim@google.com, x86@kernel.org
Subject: Re: [PATCH v6 0/9] Multigenerational LRU Framework
Message-ID: <YdSuSHa/Vjl6bPkg@google.com>
References: <20220104202227.2903605-1-yuzhao@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220104202227.2903605-1-yuzhao@google.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jan 04, 2022 at 01:22:19PM -0700, Yu Zhao wrote:
> TLDR
> ====
> The current page reclaim is too expensive in terms of CPU usage and it
> often makes poor choices about what to evict. This patchset offers an
> alternative solution that is performant, versatile and
> straightforward.

<snipped>

> Summery
> =======
> The facts are:
> 1. The independent lab results and the real-world applications
>    indicate substantial improvements; there are no known regressions.
> 2. Thrashing prevention, working set estimation and proactive reclaim
>    work out of the box; there are no equivalent solutions.
> 3. There is a lot of new code; nobody has demonstrated smaller changes
>    with similar effects.
> 
> Our options, accordingly, are:
> 1. Given the amount of evidence, the reported improvements will likely
>    materialize for a wide range of workloads.
> 2. Gauging the interest from the past discussions [14][15][16], the
>    new features will likely be put to use for both personal computers
>    and data centers.
> 3. Based on Google's track record, the new code will likely be well
>    maintained in the long term. It'd be more difficult if not
>    impossible to achieve similar effects on top of the existing
>    design.

Hi Andrew, Linus,

Can you please take a look at this patchset and let me know if it's
5.17 material?

My goal is to get it merged asap so that users can reap the benefits
and I can push the sequels. Please examine the data provided -- I
think the unprecedented coverage and the magnitude of the improvements
warrant a green light.

Thanks!
