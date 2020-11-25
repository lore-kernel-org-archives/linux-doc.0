Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-23.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 837ACC64E75
	for <linux-doc@archiver.kernel.org>; Wed, 25 Nov 2020 15:30:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 365E12083E
	for <linux-doc@archiver.kernel.org>; Wed, 25 Nov 2020 15:30:17 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="MWBqsMqB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730245AbgKYPaK (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 25 Nov 2020 10:30:10 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49190 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730112AbgKYPaK (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 25 Nov 2020 10:30:10 -0500
Received: from mail-lf1-x141.google.com (mail-lf1-x141.google.com [IPv6:2a00:1450:4864:20::141])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 29EEEC0613D4
        for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2020 07:30:10 -0800 (PST)
Received: by mail-lf1-x141.google.com with SMTP id t6so3642904lfl.13
        for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2020 07:30:10 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Xw/d2aL2V6OyUJc5Lb0yrMaOLnYVpYV2bdYYQamMGc0=;
        b=MWBqsMqBpkegZ9cm2AN+6GNJuM1/HaLoNDyLLanpmYnqeimJPKC1ygemMiRZ+FIvlW
         2+O9wuEMUWF+vXohOu7PIPKFptm+XHU7s56V0TsEtZTFkdQlyRVRMaILU1SMzjjp4vMw
         O0SZkmY07leSN/rrz8ESoI4G3C4knpSXh5Ajuk/xR4XQYHB7Nz9edn/z6kVqMfBYoqzL
         8dmV3+XX89bWjeTzYPKkx4+wlvgqV29zgEwrajjaXj3imTkgEQZc4pT9m45rF0lc/rAd
         JTCcJPX8MBhqi+UN4PerFekbtDSenwDkQAriCwze8+FI5ZWtZ4TGqF3VcjQ9A9MhycrV
         4EaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Xw/d2aL2V6OyUJc5Lb0yrMaOLnYVpYV2bdYYQamMGc0=;
        b=dNSOTEkZkdFc86wwijelX84vEetrwgeJHYf53TgbjdTfPIhhqULsZz2MVR/F5wWWWB
         ljwREiZErydUCJNrSVBI6gXZ+4R2HKhk4Cgcc/j5FcCfI9hOTDviDPeS60MJXPxL82/t
         QjRFcwfj+gVWzUWixDZ0fhuveUJdkHMea9gu7vrxPuMjqIl7X7FJEBGMgxtsm4BOe/+1
         Ooz20sfvT9IoCwUMSS5cNVqP5Lt5wIR3+DmtdR+i+HmJgbFeJ3XHzEDQQ5E8ZInsYjxP
         Z8L59cDauUN5vzrAwZtjm7w8J+x/iXK6D1Aj2lqInkG5cjUwqNWegYfV/THD8YLiQcg4
         CNzA==
X-Gm-Message-State: AOAM533ourKlBGTQbUuWDs33SkQKLlCEWsNXpu4BQs2//v4tJTi8/cQ9
        SBjDn7o+46Zd7b7vwJPGNt4fYS4N80hvo6sc9INngg==
X-Google-Smtp-Source: ABdhPJymDgfWal1UzxfIM98lP5IZ5DYTmO9CqloamXZNu690XNw4o8xkul77pSc7vicKazCnSS2LhP1gDXV9tmzWi4s=
X-Received: by 2002:a05:6512:6c9:: with SMTP id u9mr1529475lff.475.1606318208341;
 Wed, 25 Nov 2020 07:30:08 -0800 (PST)
MIME-Version: 1.0
References: <20201020085940.13875-1-sjpark@amazon.com> <20201020085940.13875-5-sjpark@amazon.com>
In-Reply-To: <20201020085940.13875-5-sjpark@amazon.com>
From:   Shakeel Butt <shakeelb@google.com>
Date:   Wed, 25 Nov 2020 07:29:57 -0800
Message-ID: <CALvZod6iLkNyePTMn9=DOgbD5Q7Yqc_WrQrNqOQ3e-2+FtJZsg@mail.gmail.com>
Subject: Re: [PATCH v22 04/18] mm/damon: Track dynamic monitoring target
 regions update
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
        Marco Elver <elver@google.com>, "Du, Fan" <fan.du@intel.com>,
        foersleo@amazon.de, Greg Thelen <gthelen@google.com>,
        Ian Rogers <irogers@google.com>, jolsa@redhat.com,
        "Kirill A. Shutemov" <kirill@shutemov.name>,
        Mark Rutland <mark.rutland@arm.com>,
        Mel Gorman <mgorman@suse.de>, Minchan Kim <minchan@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, namhyung@kernel.org,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Rik van Riel <riel@surriel.com>,
        David Rientjes <rientjes@google.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Mike Rapoport <rppt@kernel.org>, sblbir@amazon.com,
        Shuah Khan <shuah@kernel.org>, sj38.park@gmail.com,
        snu@amazon.de, Vlastimil Babka <vbabka@suse.cz>,
        Vladimir Davydov <vdavydov.dev@gmail.com>,
        Yang Shi <yang.shi@linux.alibaba.com>,
        Huang Ying <ying.huang@intel.com>, zgf574564920@gmail.com,
        linux-damon@amazon.com, Linux MM <linux-mm@kvack.org>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Oct 20, 2020 at 2:02 AM SeongJae Park <sjpark@amazon.com> wrote:
>
> From: SeongJae Park <sjpark@amazon.de>
>
> The monitoring target address range can be dynamically changed.  For
> example, virtual memory could be dynamically mapped and unmapped.
> Physical memory could be hot-plugged.
>
> As the changes could be quite frequent in some cases,

Which cases? Usually address space changes are very infrequent for
performance reasons.

> DAMON checks the
> dynamic memory mapping changes and applies it to the abstracted target
> area only for each of a user-specified time interval, ``regions update
> interval``.
>
> Signed-off-by: SeongJae Park <sjpark@amazon.de>
> Reviewed-by: Leonard Foerster <foersleo@amazon.de>
[snip]
>   * Check whether current monitoring should be stopped
>   *
> @@ -612,6 +625,11 @@ static int kdamond_fn(void *data)
>                         kdamond_reset_aggregated(ctx);
>                         kdamond_split_regions(ctx);
>                 }
> +
> +               if (kdamond_need_update_regions(ctx)) {
> +                       kdamond_call_prmt(ctx, update_target_regions);

The implementation of update_target_regions callback should be part of
this patch.


> +                       sz_limit = damon_region_sz_limit(ctx);
> +               }
>         }
>         damon_for_each_target(t, ctx) {
>                 damon_for_each_region_safe(r, next, t)
> --
> 2.17.1
>
