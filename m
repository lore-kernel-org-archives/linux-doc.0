Return-Path: <SRS0=XgFW=CZ=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EAC9C433E2
	for <linux-doc@archiver.kernel.org>; Wed, 16 Sep 2020 16:52:20 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0CA53221F1
	for <linux-doc@archiver.kernel.org>; Wed, 16 Sep 2020 16:52:20 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="hKDswPUk"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726450AbgIPQvz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 16 Sep 2020 12:51:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51882 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726584AbgIPQd1 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Sep 2020 12:33:27 -0400
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0847BC02C2A1
        for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2020 09:11:32 -0700 (PDT)
Received: by mail-lf1-x142.google.com with SMTP id y11so7600368lfl.5
        for <linux-doc@vger.kernel.org>; Wed, 16 Sep 2020 09:11:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xM847DRY5VbfgME6R21m1SfXUf/uGuxPDsbHMsNay3U=;
        b=hKDswPUkgyP7KsRAEQnw4b2+wQq1wAyUkDPrRrg88wJzF488+tYfUAH71qQJ5RFRPC
         UTOQhJGBS7tiYZ+F+7abR9j1+eHbkxqL/DmLTrWZIE3eFy9FBQViIDNj9QU4UJoSSA5a
         +XdUrXBw5BIAjEXxN0I0wAESVftczz8J3O/vhOnihktkYuhEpcpTRoSRcHRkaNuhJOzj
         qBZ2qUG3jBZQDWpddafVMR5Yo+cemVff7MvTyzCggUtB8YUOKjbiDouRwwWDjyqGTNJc
         v7MbSkNWBHqH+++JkmFK4qhhPIXzfnqfZ/gU1UOV8zQuyDSu/ngrJ4jWFmZbWdE99oQz
         8Lfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xM847DRY5VbfgME6R21m1SfXUf/uGuxPDsbHMsNay3U=;
        b=bJOap20HVHBazGMuK+zxT5LiBsJhL/yHfJ/GSVuElTzMyarxQriQDu/5+0Tdvuk/S1
         57CQvbXRgFTR9iQ2gyGR7k3sYsY69GpUJwdlRGdStkBG/a/7gDomJeWSimEnQ70VkdRR
         RgodgzbHzQFzgk0DChbZGutBI+iQoHAyr+0AFYdTIAsYQvct1s82ZyKFJHJLyCAxmiJJ
         MElEIHiz29sX5A0s2VKKjXnmVL7BLaszyVFarFbEoR1yHSkYkxEB9dwTIm+pSRvdipzo
         YKPH4PcKjYdzq71ZR9hOaz30mEEuMwfqYgloQTcUIcHCPASsOx8vs8AF0K85AANGejyq
         V3MA==
X-Gm-Message-State: AOAM531eXukr9uhgAE0UG4Ni6S0gDnOQ7QFxiyeckLE4WvI/NS1YLKC+
        bNuiRMImyvTNCWjpbxFJoxWKO4iHvLptyg3izCfK+A==
X-Google-Smtp-Source: ABdhPJxlV8OQGTI/jgSgIoAV3Cuw+6CQr9/1xF6SkEn4+P2CCa9DerMGUn4j4076dFJ7Mxe3d1DPzPr+326L2DCNr34=
X-Received: by 2002:ac2:59da:: with SMTP id x26mr8500214lfn.346.1600272690424;
 Wed, 16 Sep 2020 09:11:30 -0700 (PDT)
MIME-Version: 1.0
References: <20200915180225.17439-1-sjpark@amazon.com> <20200915180225.17439-3-sjpark@amazon.com>
In-Reply-To: <20200915180225.17439-3-sjpark@amazon.com>
From:   Shakeel Butt <shakeelb@google.com>
Date:   Wed, 16 Sep 2020 09:11:18 -0700
Message-ID: <CALvZod5fO4PzRKO84TZMZ_wqjPTXnEcecbKUaV_TVkmoF70gpA@mail.gmail.com>
Subject: Re: [RFC PATCH 2/2] mm/damon/debugfs: Support multiple contexts
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

On Tue, Sep 15, 2020 at 11:03 AM SeongJae Park <sjpark@amazon.com> wrote:
>
> From: SeongJae Park <sjpark@amazon.de>
>
> DAMON allows the programming interface users to run monitoring with
> multiple contexts.  This could be useful in some cases.  For example, if
> someone want to do highly accurate monitoring and lots of CPUs are
> available, splitting the monitoring target regions into multiple small
> regions and allocating context (monitoring thread) to each small region
> could be helpful.  Or, someone could need to monitor different types of
> address spaces simultaneously.
>
> However, it's impossible from the user space because the DAMON debugfs
> interface supports only single context.  This commit makes it available
> by implementing 'nr_contexts' debugfs file.
>
> Users can pass the number (N) of contexts they want to use to the file.

Why not just mkdir which will create a new context?

> Then, N folders having name of 'ctx<1-(N-1)>' are created in the DAMON
> debugfs dir.  Each of the directory is associated with the contexts and
> contains the the files for context setting (attrs, init_regions, record,
> schemes, and target_ids).

Also instead of naming the kthread with context number why not give
the kthread pids through attrs (or new interface) and the admin can
move those kthreads to the cgroup they want to charge against?

> The first context related files are still in
> the DAMON debugfs root directory, though.
>
> Signed-off-by: SeongJae Park <sjpark@amazon.de>
> ---
