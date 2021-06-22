Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2284DC2B9F4
	for <linux-doc@archiver.kernel.org>; Tue, 22 Jun 2021 15:02:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 08D24611CE
	for <linux-doc@archiver.kernel.org>; Tue, 22 Jun 2021 15:02:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231968AbhFVPET (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 22 Jun 2021 11:04:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53210 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231656AbhFVPES (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 Jun 2021 11:04:18 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 279CCC061574
        for <linux-doc@vger.kernel.org>; Tue, 22 Jun 2021 08:02:01 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id u11so19643922ljh.2
        for <linux-doc@vger.kernel.org>; Tue, 22 Jun 2021 08:02:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=28TZlx5g29Z7lxePs7VfFCILquiSUttASzI3ApneZ7Q=;
        b=aBcu+A4/lQWZECURkhUgBN1tY7A9rJoOOHga1WM/ZZUL0jFnBhEzPRlnrdSV0Ze9eW
         8u3BHWwH2P9EObMhC6KW1ja0ooaXkFWMTQTckWsPz+zuNDZ/VF/Jra7Jmheug2/BZP1G
         4Z9DtLacA0TW42AL0NG3qlFRxz5lUuUs/zKZHJ4/ERv4nOxK4sv+CGqtRUzoO5c2w19h
         u2sy7rQ9CdQc/OxZpsx8wOwgkoT1fdGTzXJYVI8lVKlQp58Fp4HvGCyZPF6tQzYN2Ksc
         El8yjv61qEJ3FoRxAYaNNrb+++ItTVy4m8BEg9MlNuZC/qLFXleGnhNqB/GSQc5cafM6
         IL+g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=28TZlx5g29Z7lxePs7VfFCILquiSUttASzI3ApneZ7Q=;
        b=AoSn6GCWqrnY1xnwAikB1ql47dOFT0S/JwoXp7GDCUJScQuvc8Fd/Wki/fxGnhp5gP
         Myw3CAKGVyc2baipALIgR/QzwgcIuDyt/3xzv/y6Cl4pNO5j1sLC/X6w2lzhUjJpVgeG
         VzMIY8UsTZVNFc19XCQhSMa76d01mPdFeNmIPz/Qu5k3fKImOHpm0IbNJBW7+xb8/Agp
         t8KZKI4nOsAL6nDL/XPvOtsGke80xdzzBPZl6IDlVM6bj0I9KffjGdjHRlcb2hGM+B7f
         gEZpUenZB8xvstLQUKtfiIxSh/hrN163qA7bBJmGHuJ+PUK1oLtRqUmK5JRI8mO11BvS
         AXcA==
X-Gm-Message-State: AOAM531dPLxc/UdWgHNdiSNN/x42i2gUuknRz6gc7fnqhSksjLJLDuFd
        YTKkqz5VqqFwHUuA9fA3h9DfhKcDabpkh4AyUQydGA==
X-Google-Smtp-Source: ABdhPJxtYKOpUQ48QtgAzeyFQUUzdj7UZSXDeRImsG9VNTn6/WfIXoNp6br9Tlnn7xa81vObDJRDeDu9qV0NlNvgnyQ=
X-Received: by 2002:a2e:9252:: with SMTP id v18mr3795173ljg.122.1624374119184;
 Tue, 22 Jun 2021 08:01:59 -0700 (PDT)
MIME-Version: 1.0
References: <20210621083108.17589-1-sj38.park@gmail.com> <20210621083108.17589-7-sj38.park@gmail.com>
In-Reply-To: <20210621083108.17589-7-sj38.park@gmail.com>
From:   Shakeel Butt <shakeelb@google.com>
Date:   Tue, 22 Jun 2021 08:01:48 -0700
Message-ID: <CALvZod5UUE6xjrhXCGH=CKKK_JZUL7MV2y48dX1EzqVYN-q6Pg@mail.gmail.com>
Subject: Re: [PATCH v31 06/13] mm/damon: Add a tracepoint
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
> This commit adds a tracepoint for DAMON.  It traces the monitoring
> results of each region for each aggregation interval.  Using this, DAMON
> can easily integrated with tracepoints supporting tools such as perf.
>
> Signed-off-by: SeongJae Park <sjpark@amazon.de>
> Reviewed-by: Leonard Foerster <foersleo@amazon.de>
> Reviewed-by: Steven Rostedt (VMware) <rostedt@goodmis.org>
> Reviewed-by: Fernand Sieber <sieberf@amazon.com>

Acked-by: Shakeel Butt <shakeelb@google.com>
