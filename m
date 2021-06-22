Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3ACA2C2B9F4
	for <linux-doc@archiver.kernel.org>; Tue, 22 Jun 2021 14:59:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1C7116134F
	for <linux-doc@archiver.kernel.org>; Tue, 22 Jun 2021 14:59:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232099AbhFVPCF (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 22 Jun 2021 11:02:05 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52672 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232102AbhFVPCF (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 Jun 2021 11:02:05 -0400
Received: from mail-lj1-x234.google.com (mail-lj1-x234.google.com [IPv6:2a00:1450:4864:20::234])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7F93BC06175F
        for <linux-doc@vger.kernel.org>; Tue, 22 Jun 2021 07:59:48 -0700 (PDT)
Received: by mail-lj1-x234.google.com with SMTP id r16so30576979ljk.9
        for <linux-doc@vger.kernel.org>; Tue, 22 Jun 2021 07:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=qwYAfiYXqjI2nwrVAYIcKqS0ZhT5P4dOm2JQEAubKpQ=;
        b=EUy5hSQvlr8ahlU4CaiCb2eNOofiUSD+vYfRdctNN157O9jl4+Qq6tJH0mQqexJocZ
         dFdPNn1PjMVEHq0IZrzaliNGMXUSDFSr0EdImVqstiim9tRoM3nKofzeXq7b/mU/6fty
         anECsJMjFdAuTnUKKVJ11E+l4p0WdjrMpeySt/wlkJTwGd7SsFHtEeXIXcNuTjGHMvif
         9h2PLYOQfdmOMXX7EfR8VWZPsOkylWcIVTdCA+Bj5Me7VVI2kDE2ii9bRPqlXimNXQvk
         oD5k6m6h/LW9X2W11+sf10Dr+i9o0gQYG4rsiI9twScaF761lflMTuA++iJv/mB9b7z6
         PwFg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=qwYAfiYXqjI2nwrVAYIcKqS0ZhT5P4dOm2JQEAubKpQ=;
        b=P+4YgHzrcZeOU0osN8Bykm0OjZUccvR9Y9BrJW3rpKs7qOkITJ88fC8j0gQbg8zsAa
         OcOZS13ExfUJJ+9T+gw70cUIrTnuxUjgWaB2Q3KnBSTPlPWUuYP+VioFm+CVPI2FdnmZ
         UWlIsb7D3bjnuxZgPfBJretrMHI/mLDyp4n1gnRZtPWDYaX/ZjR+pygVL2iu+oDecrLy
         wvnYX5GugBj0kx51N6l79UDy+wZa36QBrp/P9V3D5MLi9Jjh0ZfS2xX4WjXE4H4Jyryf
         PchhvgXw2admkHi8kfDTQStMogn6X6HpFWKAbcMIlmc8HkrjCoyZgigLyz7RnY50la0S
         DMjw==
X-Gm-Message-State: AOAM531nxRaxO+eP5x+VgL+SrODAyiiTHo4x6d2UK5s8cMR6cZHijg6d
        WZyUrkfZdfqTQPsx5xDW9Bzw3Xi6IjkXM1Ayul3CAA==
X-Google-Smtp-Source: ABdhPJxnakeCsIeusqxGOiH57rUIiE9gS1DlKbFj5pW3GBl5tNKGv95nzwlgEJzP4ve+0FfyN/FCxE/tKR0t7RUWsLQ=
X-Received: by 2002:a2e:8190:: with SMTP id e16mr3684033ljg.81.1624373986663;
 Tue, 22 Jun 2021 07:59:46 -0700 (PDT)
MIME-Version: 1.0
References: <20210621083108.17589-1-sj38.park@gmail.com> <20210621083108.17589-4-sj38.park@gmail.com>
In-Reply-To: <20210621083108.17589-4-sj38.park@gmail.com>
From:   Shakeel Butt <shakeelb@google.com>
Date:   Tue, 22 Jun 2021 07:59:35 -0700
Message-ID: <CALvZod7uzDuWAMnnxubv7=vx5Qktmw5o=2ivS-tUa2YA+5QzzA@mail.gmail.com>
Subject: Re: [PATCH v31 03/13] mm/damon: Adaptively adjust regions
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
> Reviewed-by: Fernand Sieber <sieberf@amazon.com>
[...]
>
> +unsigned int damon_nr_regions(struct damon_target *t)
> +{
> +       struct damon_region *r;
> +       unsigned int nr_regions = 0;
> +
> +       damon_for_each_region(r, t)
> +               nr_regions++;

This bugs me everytime. Please just have nr_regions field in the
damon_target instead of traversing the list to count the number of
regions.

Other than that, it looks good to me.
