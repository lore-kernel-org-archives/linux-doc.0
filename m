Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 12027C63798
	for <linux-doc@archiver.kernel.org>; Wed, 25 Nov 2020 15:30:17 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A9F252083E
	for <linux-doc@archiver.kernel.org>; Wed, 25 Nov 2020 15:30:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="HDVu0Syp"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730211AbgKYPaB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 25 Nov 2020 10:30:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49146 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730112AbgKYPaB (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 25 Nov 2020 10:30:01 -0500
Received: from mail-lf1-x142.google.com (mail-lf1-x142.google.com [IPv6:2a00:1450:4864:20::142])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0137CC0613D4
        for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2020 07:29:54 -0800 (PST)
Received: by mail-lf1-x142.google.com with SMTP id a9so3713751lfh.2
        for <linux-doc@vger.kernel.org>; Wed, 25 Nov 2020 07:29:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xQqMteze+xCEHenPxthBOcsc/0tSfwlYlu1DqoC4HPs=;
        b=HDVu0SypUkrIgHq8Lxae6Be+CHBAkJmeBVmQ+herklMZWndUiYC8kMvy8Q6IAlaiGL
         UtYPndNlAzpDW/qVIl/oySemQRx0RhBQSdpniMuQ9w6UZWBwH8qCpY+VcXlj+2IMMBUV
         Ij/YRDh+SLKR/PeJ3IcLiRriCfMXSZeYulfuwycCVrjDIFvqoC96hG1To++cN69AfztD
         CYR+CklbRvZXkxHMGASiN0d/X96QnSMupdlDimuo3r4Vs52Pn5CUrgrpDSacBnFgmtmc
         Kkjk+rP/0VLT178E31JGhUaAg58LQlz5I7xBYGuHr8EsqKJsldnoK8Wv6Yz96ro1GmpC
         Song==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xQqMteze+xCEHenPxthBOcsc/0tSfwlYlu1DqoC4HPs=;
        b=iiGH1GfJarKeKIMvIJUmdW2TH9u1Cyng23Ai0xhTRfuHwolVZIzzz0awk36VDR5Aqn
         T70aUsnCFbp0PS0KZstZ741SF5kdWUJATCBIFaGTAlFEw0Y9YhDmNAYSGdKmtlqN7AKN
         yP+J8ZNjfSKcEvoGmPalDD+dRQMWGAtpUW9U4pS6hwUOfiRTpcmBJvu2bDbKyw5JbgRO
         Z37hwH4R9a6FJJciK5K0ApwpXl2F8b8qm8Kk8BbkEf/yPN8Q4JmJzTlRwsMQr2I4YEkB
         9pGRokrnxEmipU/xjXAYgULbgAu2ZVMPdVgxGLBRabIdyekgqF2TdkYF7nQn5nAkc6tL
         dpgA==
X-Gm-Message-State: AOAM532RBbUXXjGkElotXWTMqdJHAXE1snAR1HfI0BQenkHeIpjOWwuG
        JLBTrAipPE4s5n/hajDI1NFOhkQCqxa/RUM+zD7wuw==
X-Google-Smtp-Source: ABdhPJx85SPYIbloEx1FWJOrMCYVt4KwN1kTSlFJCN8071jaUDxsqRIq/NSp0TvyLXUzcHPWGeF46kjbfQryo9a5bFM=
X-Received: by 2002:a19:be4a:: with SMTP id o71mr1491208lff.494.1606318192153;
 Wed, 25 Nov 2020 07:29:52 -0800 (PST)
MIME-Version: 1.0
References: <20201020085940.13875-1-sjpark@amazon.com> <20201020085940.13875-4-sjpark@amazon.com>
In-Reply-To: <20201020085940.13875-4-sjpark@amazon.com>
From:   Shakeel Butt <shakeelb@google.com>
Date:   Wed, 25 Nov 2020 07:29:41 -0800
Message-ID: <CALvZod6nhJyOh943+EqttG+33ugrkNYxpLM3Gq7U7TFw70dOAA@mail.gmail.com>
Subject: Re: [PATCH v22 03/18] mm/damon: Adaptively adjust regions
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
> Even somehow the initial monitoring target regions are well constructed
> to fulfill the assumption (pages in same region have similar access
> frequencies), the data access pattern can be dynamically changed.  This
> will result in low monitoring quality.  To keep the assumption as much
> as possible, DAMON adaptively merges and splits each region based on
> their access frequency.
>
> For each ``aggregation interval``, it compares the access frequencies of
> adjacent regions and merges those if the frequency difference is small.
> Then, after it reports and clears the aggregated access frequency of
> each region, it splits each region into two or three regions if the
> total number of regions will not exceed the user-specified maximum
> number of regions after the split.
>
> In this way, DAMON provides its best-effort quality and minimal overhead
> while keeping the upper-bound overhead that users set.
>
> Signed-off-by: SeongJae Park <sjpark@amazon.de>
> Reviewed-by: Leonard Foerster <foersleo@amazon.de>

The high level comment I have is that kdamond_[merge|split]_regions
should be part of the abstraction of the target instead of the damon
context.
