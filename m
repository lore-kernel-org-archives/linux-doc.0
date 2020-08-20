Return-Path: <SRS0=ZADm=B6=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7E2AFC433E1
	for <linux-doc@archiver.kernel.org>; Thu, 20 Aug 2020 01:22:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 564F92078D
	for <linux-doc@archiver.kernel.org>; Thu, 20 Aug 2020 01:22:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="QecQW2KN"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726701AbgHTBWA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 19 Aug 2020 21:22:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38540 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726578AbgHTBV6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 19 Aug 2020 21:21:58 -0400
Received: from mail-lj1-x244.google.com (mail-lj1-x244.google.com [IPv6:2a00:1450:4864:20::244])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 74C11C061757
        for <linux-doc@vger.kernel.org>; Wed, 19 Aug 2020 18:21:58 -0700 (PDT)
Received: by mail-lj1-x244.google.com with SMTP id i10so398659ljn.2
        for <linux-doc@vger.kernel.org>; Wed, 19 Aug 2020 18:21:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=f2YYW8edHeX1XU5Hyd3BTnCfsz4e6RGc2J6WqCLqZNs=;
        b=QecQW2KN7UqoOPEbPzIa1X6BNdwEoPIK3Zx/Cz1cbaaaWzq0I96Bg2sxEjLXoWhVuK
         PbvXHn2Uii0TYpGDnCXfHmmE5XrHtrf1FGFTrn8xLggR1p7SiGD9AVvWs4E17GLlQa7i
         +9RrO2pb+ivo2qh5kdDdamSMyool04JXjvdTpV/WTFdoqvC3TWaq+DcnVBQyRrWAkEpv
         zXGfccmBw8kfZ3Bt8Ot5yOjSVYSdr5sTrBrHT/1eU3R2BLyb/87hGhY7iwc/z+zSRxBS
         oAePzBtUQ7cH/w548Cl4Y81xeBa3/xsK+VsEs77pv6y3y7buQY14LPj6t2wYozvtscQN
         x5vg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=f2YYW8edHeX1XU5Hyd3BTnCfsz4e6RGc2J6WqCLqZNs=;
        b=KmTdI6hx8IhnhLfYCqzCK+wUagN6ZVMKndyuLHG1xopmnx1VAHEYzJkAwVCwEzd6q9
         07WJpe5DuoT0FIYxhb5UieS6S2KtWpL8Ucuoap7Xp7x/fTLfxNZqtC1VNojqsgzx8RKT
         Aorod4Lcy82k1oveewH0h823o/8gQLl2CZplfR3MX+69dAKYiZCeGX9upqKnPo2EkQMu
         2kZ/TU8TaB2GE3PfagiexShhY2k4OfEjOEwW/Wi5s0uaxxK8sBgITvJ+ahDwxwdrbnkr
         e4FFgvRBsNr0HlmHkgpT31sfY+gImYQ6atHhP1/Aoie22T+8dOlJrLUiNRCe1fWyZLHg
         byTg==
X-Gm-Message-State: AOAM532BYnwWZ1QwwlXbG/iLSZ/m4MzN6xE5HAf40EIDfTRxcNG7UWKt
        LZ6cNNuRhVuiDtt8kdLYZ1/t9WFKAgzmMvOyStAnmw==
X-Google-Smtp-Source: ABdhPJw37D5+GBoWe31O7oE4FkKmrNPnt4yXn6gWy6RLRKh0JBcxDx/XhFlwEmWfYkIVaYDsUe1DzfQA3e5OU0nIeHk=
X-Received: by 2002:a2e:9396:: with SMTP id g22mr442161ljh.446.1597886516487;
 Wed, 19 Aug 2020 18:21:56 -0700 (PDT)
MIME-Version: 1.0
References: <20200818072501.30396-1-sjpark@amazon.com>
In-Reply-To: <20200818072501.30396-1-sjpark@amazon.com>
From:   Shakeel Butt <shakeelb@google.com>
Date:   Wed, 19 Aug 2020 18:21:44 -0700
Message-ID: <CALvZod6RS66aSFjWHvpbjuinz2mwbGDnz+gh5L7dp+c3D_Zy1w@mail.gmail.com>
Subject: Re: [RFC v7 00/10] DAMON: Support Physical Memory Address Space Monitoring
To:     SeongJae Park <sjpark@amazon.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        SeongJae Park <sjpark@amazon.de>, Jonathan.Cameron@huawei.com,
        Andrea Arcangeli <aarcange@redhat.com>, acme@kernel.org,
        alexander.shishkin@linux.intel.com, amit@kernel.org,
        benh@kernel.crashing.org, brendan.d.gregg@gmail.com,
        Brendan Higgins <brendanhiggins@google.com>,
        Qian Cai <cai@lca.pw>,
        Colin Ian King <colin.king@canonical.com>,
        Jonathan Corbet <corbet@lwn.net>,
        David Hildenbrand <david@redhat.com>, dwmw@amazon.com,
        "Du, Fan" <fan.du@intel.com>, foersleo@amazon.de,
        Greg Thelen <gthelen@google.com>,
        Ian Rogers <irogers@google.com>, jolsa@redhat.com,
        "Kirill A. Shutemov" <kirill@shutemov.name>, mark.rutland@arm.com,
        Mel Gorman <mgorman@suse.de>, Minchan Kim <minchan@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, namhyung@kernel.org,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Rik van Riel <riel@surriel.com>,
        David Rientjes <rientjes@google.com>,
        Steven Rostedt <rostedt@goodmis.org>, rppt@kernel.org,
        sblbir@amazon.com, shuah@kernel.org, sj38.park@gmail.com,
        snu@amazon.de, Vlastimil Babka <vbabka@suse.cz>,
        Vladimir Davydov <vdavydov.dev@gmail.com>,
        Yang Shi <yang.shi@linux.alibaba.com>,
        Huang Ying <ying.huang@intel.com>, zgf574564920@gmail.com,
        linux-damon@amazon.com, Linux MM <linux-mm@kvack.org>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Aug 18, 2020 at 12:25 AM SeongJae Park <sjpark@amazon.com> wrote:
>
> From: SeongJae Park <sjpark@amazon.de>
>
> Changes from Previous Version
> =============================
>
> - Use 42 as the fake target id for paddr instead of -1
> - Fix a typo
>
> Introduction
> ============
>
> DAMON[1] programming interface users can extend DAMON for any address space by
> configuring the address-space specific low level primitives with appropriate
> ones including their own implementations.  However, because the implementation
> for the virtual address space is only available now, the users should implement
> their own for other address spaces.  Worse yet, the user space users who rely
> on the debugfs interface and user space tool, cannot implement their own.
>
> This patchset implements another reference implementation of the low level
> primitives for the physical memory address space.  With this change, hence, the
> kernel space users can monitor both the virtual and the physical address spaces
> by simply changing the configuration in the runtime.  Further, this patchset
> links the implementation to the debugfs interface and the user space tool for
> the user space users.
>
> Note that the implementation supports only the user memory, as same to the idle
> page access tracking feature.
>
> [1] https://lore.kernel.org/linux-mm/20200706115322.29598-1-sjpark@amazon.com/
>

I am still struggling to find the benefit of this feature the way it
is implemented i.e. region based physical address space monitoring.
What exactly am I supposed to do for a given hot (or cold) physical
region? In a containerized world, that region can contain pages from
any cgroup. I can not really do anything about the accesses PHY-DAMON
provides me for a region.

Now if you give me per-page information that would be useful as I can
at least get per-cgroup accesses (idle or re-use data) but that would
be as costly as Page Idle Tracking.
