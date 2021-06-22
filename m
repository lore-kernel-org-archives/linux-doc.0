Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6772FC49EA4
	for <linux-doc@archiver.kernel.org>; Tue, 22 Jun 2021 14:59:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4ED256134F
	for <linux-doc@archiver.kernel.org>; Tue, 22 Jun 2021 14:59:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230047AbhFVPBm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 22 Jun 2021 11:01:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52562 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231350AbhFVPBl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 Jun 2021 11:01:41 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A0CEEC061574
        for <linux-doc@vger.kernel.org>; Tue, 22 Jun 2021 07:59:24 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id a16so9045502ljq.3
        for <linux-doc@vger.kernel.org>; Tue, 22 Jun 2021 07:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=YkBx1QZ3YBUcTOVSAktKfd9SQPvUoOM5O8r05maYQAQ=;
        b=snHPRXQhEZNJPwQqRxZC6v8U6a8W9E2FA+po5CGY2JTudvUl8mDcAAaHoztv7MpHxX
         /k/Gij67GUyS2zlvi771HTGkk/7+YoktyKygOp0DvrP8aVxjnr/+PWNEfEO/2A6ylX+3
         VOZARUS6Cvp1mmVceEcvU436WL50GtfhoF/UUHvb3JqcQnm6uMb3rFC3MxwKXHc96lQ6
         249kcrwzOgpIFQKcldBio6d8kmI8SPk8rIIpMXhO1tLzRidXnQVqLUZFnMiGqbCJboCs
         tfjM8Xv/kDC4+jZf8us5mkT88LsTcGHVbmhwn4C/T8THxSUdTKypqYkgs4v1qL8xUnIe
         taxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=YkBx1QZ3YBUcTOVSAktKfd9SQPvUoOM5O8r05maYQAQ=;
        b=lviFiBx+4Mt+T6IGBZyzK/vXeq4S++7OJ1HZ35pLqM9q2Uj7z6IIXS9oN8vospU/pY
         m7hIsRAO6/DnFUzkcRV0h2kUNiDsQ3srP/leaBNRZDUZlsYJx0Lloz842j9ZD6iR+8cS
         doi2e3hzY30PEcGIor1npC6tVm6P+3N8C8Il1tfKuOYfsIT8WONQyttkXismM32CoGhh
         w3vFIYQxqqy2Wp8dU3HTxNhD0+Nkgbw8usEpuvNyhDcTVgpQiKGumaTNcfJWIzDqAvGe
         Ud8hK+P1LE9XJXb81Zi1U96AKxYMDd6yto6AJN6shPPKxsfyNFXz5JvuWZY0UVgKQch2
         9WlA==
X-Gm-Message-State: AOAM531FNSJ3lCPT9qnJIFsKqN4gXSnqQNMbiz3BeY3AWsL9s6/p3gii
        ztVBhuegnllYupjSg2YE9kY70afxB3FYdkThUTtPFQ==
X-Google-Smtp-Source: ABdhPJw24ImUKGKOxJBlWjfykDltmmZe05nzbOYLp2G/uUfjgWfVekd/NvNH3RSPY6Vo82S0GxVIslMrrGSZMbHUUvM=
X-Received: by 2002:a2e:6c1a:: with SMTP id h26mr3725615ljc.34.1624373962635;
 Tue, 22 Jun 2021 07:59:22 -0700 (PDT)
MIME-Version: 1.0
References: <20210621083108.17589-1-sj38.park@gmail.com> <20210621083108.17589-2-sj38.park@gmail.com>
In-Reply-To: <20210621083108.17589-2-sj38.park@gmail.com>
From:   Shakeel Butt <shakeelb@google.com>
Date:   Tue, 22 Jun 2021 07:59:11 -0700
Message-ID: <CALvZod7byYA5jfzF3Vtr1czwWoiaHjkqn9M4e1Ajn1PP47k9=w@mail.gmail.com>
Subject: Re: [PATCH v31 01/13] mm: Introduce Data Access MONitor (DAMON)
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
> DAMON is a data access monitoring framework for the Linux kernel.  The
> core mechanisms of DAMON make it
>
>  - accurate (the monitoring output is useful enough for DRAM level
>    performance-centric memory management; It might be inappropriate for
>    CPU cache levels, though),
>  - light-weight (the monitoring overhead is normally low enough to be
>    applied online), and
>  - scalable (the upper-bound of the overhead is in constant range
>    regardless of the size of target workloads).
>
> Using this framework, hence, we can easily write efficient kernel space
> data access monitoring applications.  For example, the kernel's memory
> management mechanisms can make advanced decisions using this.
> Experimental data access aware optimization works that incurring high
> access monitoring overhead could again be implemented on top of this.
>
> Due to its simple and flexible interface, providing user space interface
> would be also easy.  Then, user space users who have some special
> workloads can write personalized applications for better understanding
> and optimizations of their workloads and systems.
>
> ===
>
> Nevertheless, this commit is defining and implementing only basic access
> check part without the overhead-accuracy handling core logic.  The basic
> access check is as below.
>
> The output of DAMON says what memory regions are how frequently accessed
> for a given duration.  The resolution of the access frequency is
> controlled by setting ``sampling interval`` and ``aggregation
> interval``.  In detail, DAMON checks access to each page per ``sampling
> interval`` and aggregates the results.  In other words, counts the
> number of the accesses to each region.  After each ``aggregation
> interval`` passes, DAMON calls callback functions that previously
> registered by users so that users can read the aggregated results and
> then clears the results.  This can be described in below simple
> pseudo-code::
>
>     init()
>     while monitoring_on:
>         for page in monitoring_target:
>             if accessed(page):
>                 nr_accesses[page] += 1
>         if time() % aggregation_interval == 0:
>             for callback in user_registered_callbacks:
>                 callback(monitoring_target, nr_accesses)
>             for page in monitoring_target:
>                 nr_accesses[page] = 0
>         if time() % update_interval == 0:

regions_update_interval?

>             update()
>         sleep(sampling interval)
>
> The target regions constructed at the beginning of the monitoring and
> updated after each ``regions_update_interval``, because the target
> regions could be dynamically changed (e.g., mmap() or memory hotplug).
> The monitoring overhead of this mechanism will arbitrarily increase as
> the size of the target workload grows.
>
> The basic monitoring primitives for actual access check and dynamic
> target regions construction aren't in the core part of DAMON.  Instead,
> it allows users to implement their own primitives that are optimized for
> their use case and configure DAMON to use those.  In other words, users
> cannot use current version of DAMON without some additional works.
>
> Following commits will implement the core mechanisms for the
> overhead-accuracy control and default primitives implementations.
>
> Signed-off-by: SeongJae Park <sjpark@amazon.de>
> Reviewed-by: Leonard Foerster <foersleo@amazon.de>
> Reviewed-by: Fernand Sieber <sieberf@amazon.com>

Few nits below otherwise look good to me. You can add:

Acked-by: Shakeel Butt <shakeelb@google.com>

[...]
> +/*
> + * __damon_start() - Starts monitoring with given context.
> + * @ctx:       monitoring context
> + *
> + * This function should be called while damon_lock is hold.
> + *
> + * Return: 0 on success, negative error code otherwise.
> + */
> +static int __damon_start(struct damon_ctx *ctx)
> +{
> +       int err = -EBUSY;
> +
> +       mutex_lock(&ctx->kdamond_lock);
> +       if (!ctx->kdamond) {
> +               err = 0;
> +               ctx->kdamond_stop = false;
> +               ctx->kdamond = kthread_create(kdamond_fn, ctx, "kdamond.%d",
> +                               nr_running_ctxs);
> +               if (IS_ERR(ctx->kdamond))
> +                       err = PTR_ERR(ctx->kdamond);
> +               else
> +                       wake_up_process(ctx->kdamond);

Nit: You can use kthread_run() here.

> +       }
> +       mutex_unlock(&ctx->kdamond_lock);
> +
> +       return err;
> +}
> +
[...]
> +static int __damon_stop(struct damon_ctx *ctx)
> +{
> +       mutex_lock(&ctx->kdamond_lock);
> +       if (ctx->kdamond) {
> +               ctx->kdamond_stop = true;
> +               mutex_unlock(&ctx->kdamond_lock);
> +               while (damon_kdamond_running(ctx))
> +                       usleep_range(ctx->sample_interval,
> +                                       ctx->sample_interval * 2);

Any reason to not use kthread_stop() here?
