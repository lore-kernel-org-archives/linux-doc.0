Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 82F6AC2B9F4
	for <linux-doc@archiver.kernel.org>; Tue, 22 Jun 2021 14:59:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6C0E8611CE
	for <linux-doc@archiver.kernel.org>; Tue, 22 Jun 2021 14:59:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230510AbhFVPBu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 22 Jun 2021 11:01:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52600 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232094AbhFVPBs (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 Jun 2021 11:01:48 -0400
Received: from mail-lj1-x231.google.com (mail-lj1-x231.google.com [IPv6:2a00:1450:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4FBC7C061766
        for <linux-doc@vger.kernel.org>; Tue, 22 Jun 2021 07:59:32 -0700 (PDT)
Received: by mail-lj1-x231.google.com with SMTP id q23so20121193ljh.0
        for <linux-doc@vger.kernel.org>; Tue, 22 Jun 2021 07:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RA8ZD9ClukMzIKl1MArz2ae3thSxvhEA0gqsTc1XYss=;
        b=Pb4LQYmNj3prWXaEvsu8+rvfYImNKOOFVO+YElWuhVGmGRuzjKH3ziJIRpyoScfWkq
         CtFTKrqB7bLWr3dbBYb/lObqKFZtynQCNjOKG4XgFCSzPIuj8Cq3KKhd3TmrtlHlqgED
         SafREWJtEpmXpAzkZuiZx9uJG1MHLKvv0RhzehuvcKx1aEcAfMsYsULjKYqMLOkFXgQ+
         SXieBM52oa/d16NaRVwpOaypC3AyhGlXY8ya/3N0yFfVohmHUFpNW/6GvNFYew3hCdVj
         esSl1xYrpRwRjF6yq543gA9qCZrqpYjO7GGiGfzFegaccFxdLq9RKHxf51AdT9+N4tP+
         ffYA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RA8ZD9ClukMzIKl1MArz2ae3thSxvhEA0gqsTc1XYss=;
        b=qmP7yDJ96Ne+keBxhQL9bjhY2CjoKsy7QAgEOquzHXrB1T90lE2Cnqz/1xHv/2uLdn
         f8l/ZIOrPgEXjVBKgeFg/K0VhbGcf4TnPjEUJdczHoaV261pa7jNAY0MyGdi0f989+zK
         lT9xSdhLDRajOfVnT7KsJpz6akjIjq7qDWsFBMSOsXdDvsKmbNXAisJ2/8v/SRzm8jUF
         opZEZtvdj17UdaUQrYnN4nLOEyUM+tjrDuIxBBBJapkmLaFhxqi4ZmS7Oe19DqotquRu
         5a2OkmK3wK+ljZnFQWxzW5lakUGEif19++16h4oIMzN2lqlXYx8z3SftuMUdDceHBZpw
         r7MA==
X-Gm-Message-State: AOAM533rV5/+E2iBPaGmIZDLkZT/T49wOFdiBN3Y34iuxFjypkSWQUf7
        LisT84/qAtwkWH7rdxgwR0ehftC64N+fjBxbvbwv+A==
X-Google-Smtp-Source: ABdhPJxulhjPL3w9xH/DtXwDuOpTPs0GBBZVsrKKsHxqzu/ANLShEMXKYExXbngsiCwr7f1lxiXoFteJooEKw+KviKg=
X-Received: by 2002:a05:651c:49d:: with SMTP id s29mr3703265ljc.279.1624373970420;
 Tue, 22 Jun 2021 07:59:30 -0700 (PDT)
MIME-Version: 1.0
References: <20210621083108.17589-1-sj38.park@gmail.com> <20210621083108.17589-3-sj38.park@gmail.com>
In-Reply-To: <20210621083108.17589-3-sj38.park@gmail.com>
From:   Shakeel Butt <shakeelb@google.com>
Date:   Tue, 22 Jun 2021 07:59:19 -0700
Message-ID: <CALvZod7mJivKs+u8cTKrYuUg=X+XFjXZ3zBnureFzTqK+BLrYQ@mail.gmail.com>
Subject: Re: [PATCH v31 02/13] mm/damon/core: Implement region-based sampling
To:     SeongJae Park <sj38.park@gmail.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        SeongJae Park <sjpark@amazon.de>, Jonathan.Cameron@huawei.com,
        acme@kernel.org, alexander.shishkin@linux.intel.com,
        amit@kernel.org, benh@kernel.crashing.org,
        Brendan Higgins <brendanhiggins@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
        David Hildenbrand <david@redhat.com>, dwmw@amazon.com,
        Marco Elver <elver@google.com>, "Du, Fan" <fan.du@intel.com>,
        foersleo@amazon.de, greg@kroah.com,
        Greg Thelen <gthelen@google.com>, guoju.fgj@alibaba-inc.com,
        jgowans@amazon.com, Mel Gorman <mgorman@suse.de>, mheyne@amazon.de,
        Minchan Kim <minchan@kernel.org>,
        Ingo Molnar <mingo@redhat.com>, namhyung@kernel.org,
        "Peter Zijlstra (Intel)" <peterz@infradead.org>,
        Rik van Riel <riel@surriel.com>,
        David Rientjes <rientjes@google.com>,
        Steven Rostedt <rostedt@goodmis.org>,
        Mike Rapoport <rppt@kernel.org>, Shuah Khan <shuah@kernel.org>,
        sieberf@amazon.com, snu@zelle79.org,
        Vlastimil Babka <vbabka@suse.cz>,
        Vladimir Davydov <vdavydov.dev@gmail.com>,
        zgf574564920@gmail.com, linux-damon@amazon.com,
        Linux MM <linux-mm@kvack.org>, linux-doc@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jun 21, 2021 at 1:31 AM SeongJae Park <sj38.park@gmail.com> wrote:
>
> From: SeongJae Park <sjpark@amazon.de>
>
> To avoid the unbounded increase of the overhead, DAMON groups adjacent
> pages that are assumed to have the same access frequencies into a
> region.  As long as the assumption (pages in a region have the same
> access frequencies) is kept, only one page in the region is required to
> be checked.  Thus, for each ``sampling interval``,
>
>  1. the 'prepare_access_checks' primitive picks one page in each region,
>  2. waits for one ``sampling interval``,
>  3. checks whether the page is accessed meanwhile, and
>  4. increases the access count of the region if so.
>
> Therefore, the monitoring overhead is controllable by adjusting the
> number of regions.  DAMON allows both the underlying primitives and user
> callbacks to adjust regions for the trade-off.  In other words, this
> commit makes DAMON to use not only time-based sampling but also
> space-based sampling.
>
> This scheme, however, cannot preserve the quality of the output if the
> assumption is not guaranteed.  Next commit will address this problem.
>
> Signed-off-by: SeongJae Park <sjpark@amazon.de>
> Reviewed-by: Leonard Foerster <foersleo@amazon.de>
> Reviewed-by: Fernand Sieber <sieberf@amazon.com>

Acked-by: Shakeel Butt <shakeelb@google.com>
