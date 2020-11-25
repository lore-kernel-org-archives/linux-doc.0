Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B24C5C56202
	for <linux-doc@archiver.kernel.org>; Wed, 25 Nov 2020 15:29:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 509122083E
	for <linux-doc@archiver.kernel.org>; Wed, 25 Nov 2020 15:29:38 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="EtFwDakd"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730047AbgKYP3i (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 25 Nov 2020 10:29:38 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729988AbgKYP3h (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 25 Nov 2020 10:29:37 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3063DC061A4F
        for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2020 07:29:24 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id s30so3702238lfc.4
        for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2020 07:29:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=13PkHEsv5Gfsa10yo6xM+865e/X5/3hhggzHTqOXsfY=;
        b=EtFwDakdU9esaLPfWzzJWQtYC0O8QZ1aEjSYd6jyGyNFsHJbU3dKUmYx/8clc5nygX
         Kg9cV5BthVrMiwyp4ET9GXGQCSU6jr00bTNUXQelW1NTF92XFBTITcCQ2vKtBk2hlbW0
         KFCXPk81RL0a6N6E7YzOef0MyTqMww45RtMIX4nu2KfuzH4/RMa93iWSnzzsuHhVtNYI
         1sHg6kX7myPLW4vH8t/EMJaLxl+APqJIm//p6N8TOrsTOeIorJxwFOeDShhnZFTLFhG5
         duyLIOrAX7uOWCNDMTPoB49Q67kC8++gGKTMbP+k4uDFOPSRdm0XIIEOg0K87bT+1AoV
         VUww==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=13PkHEsv5Gfsa10yo6xM+865e/X5/3hhggzHTqOXsfY=;
        b=HwJRv7cvhlRipy8mdvPGfZIZdv8uxNrNQEanHYMhKX7IYwUrqMSdSOGouD9fjH0aVV
         VGklQiLcfeFHBThlYA3i6ZDsUp6x3eIluLKN3xCGTwh0qArU5kBcAVAG/2utRwSqfPiQ
         CX9tp06MKnwJIbZzCDIBoA2uNRpKdClMI3sI8MKPy6FWFd9JfTflNgjRtge//qAvEX5i
         xHTTLTIlrVVTZMWrXTJjh4CiG5RDFTCzXhlnVb60iWR8HU1na05epjAR8Tg3MOI0qN3Q
         GWHKsztciNXwiqYGjBQUbdchB/tfXCnYYsetvlelwhYxqupFIslhoMnaLwraum87HViM
         1ZcA==
X-Gm-Message-State: AOAM533M+nvqpkr+Y1T1LnCGcLZ7W+w4mwmM8wFCoCOxYPR8tULJWZWC
        DMa1DhtHn3cq5nIleguW4JIQ5DyIqh80aBiNLQW+Jw==
X-Google-Smtp-Source: ABdhPJwzuLmEK1UhNY2f2Yzr1gYWBmJ4e3SlnShveEx8r1IdEbiY7y110FD2IyZZ2Nz8RyetMJzXwtu34FltaqP3zKM=
X-Received: by 2002:ac2:43cc:: with SMTP id u12mr504816lfl.54.1606318162152;
 Wed, 25 Nov 2020 07:29:22 -0800 (PST)
MIME-Version: 1.0
References: <20201020085940.13875-1-sjpark@amazon.com> <20201020085940.13875-2-sjpark@amazon.com>
In-Reply-To: <20201020085940.13875-2-sjpark@amazon.com>
From:   Shakeel Butt <shakeelb@google.com>
Date:   Wed, 25 Nov 2020 07:29:10 -0800
Message-ID: <CALvZod5rALTNRzK2w-y7AJMxFfBV9upJECPvCjhF=iFcDFt-5g@mail.gmail.com>
Subject: Re: [PATCH v22 01/18] mm: Introduce Data Access MONitor (DAMON)
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

On Tue, Oct 20, 2020 at 2:01 AM SeongJae Park <sjpark@amazon.com> wrote:
>
> From: SeongJae Park <sjpark@amazon.de>
>
> DAMON is a data access monitoring framework for the Linux kernel.  The
> core mechanisms of DAMON make it
>
>  - accurate (the monitoring output is useful enough for DRAM level
>    performance-centric memory management; It might be inappropriate for
>    CPU Cache levels, though),
>  - light-weight (the monitoring overhead is normally low enough to be
>    applied online), and
>  - scalable (the upper-bound of the overhead is in constant range
>    regardless of the size of target workloads).
>
> Using this framework, hence, we can easily write efficient kernel space
> data access monitoring applications.  For example, the kernel's memory
> management mechanisms can make advanced decisions using this.
> Experimental data access aware optimization works that incurring high
> access monitoring overhead could implemented again on top of this.
>
> Due to its simple and flexible interface, providing user space interface
> would be also easy.  Then, user space users who have some special
> workloads can write personalized applications for better understanding
> and optimizations of their workloads and systems.
>
> That said, this commit is implementing only basic data structures and
> simple manipulation functions of the structures.  The core mechanisms of
> DAMON will be implemented by following commits.
>
> Signed-off-by: SeongJae Park <sjpark@amazon.de>
> Reviewed-by: Leonard Foerster <foersleo@amazon.de>
> Reviewed-by: Varad Gautam <vrd@amazon.de>

I don't see any benefit of this patch on its own. Some of this should
be part of the main damon context patch. I would suggest to separate
the core (damon context) from the target related structs (target,
region, addr range).

Also I would prefer the code be added with the actual usage otherwise
it is hard to review.

> ---
[snip]
> +unsigned int damon_nr_regions(struct damon_target *t)
> +{
> +       struct damon_region *r;
> +       unsigned int nr_regions = 0;
> +
> +       damon_for_each_region(r, t)
> +               nr_regions++;
> +
> +       return nr_regions;
> +}

Why not keep a count instead of traversing to get the size?
