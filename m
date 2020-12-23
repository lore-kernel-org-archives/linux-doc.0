Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C01B9C433DB
	for <linux-doc@archiver.kernel.org>; Wed, 23 Dec 2020 22:50:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7301C22273
	for <linux-doc@archiver.kernel.org>; Wed, 23 Dec 2020 22:50:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727207AbgLWWux (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 23 Dec 2020 17:50:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727184AbgLWWuw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 23 Dec 2020 17:50:52 -0500
Received: from mail-lf1-x129.google.com (mail-lf1-x129.google.com [IPv6:2a00:1450:4864:20::129])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CFA0C061794
        for <linux-doc@vger.kernel.org>; Wed, 23 Dec 2020 14:50:12 -0800 (PST)
Received: by mail-lf1-x129.google.com with SMTP id o19so1010368lfo.1
        for <linux-doc@vger.kernel.org>; Wed, 23 Dec 2020 14:50:12 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=fUg/8XfBmtURDT5lBCWnW6DL77gquz8BfclV7WZ4WGw=;
        b=WXc/1DGf132PTO1txk0qMQlA5PG0JderjXg2RMviXDYMgUBTpn0MqJXVQrstbdvo6U
         sKm9x+TNynXiw6fdwNIhfb9WiW73WTA5/GgwZ63RKCfipWjrnCp/3sDrRiqtyLXe/pu/
         RrMmKQzJmh06iQw8BhyxXv85Zh3l9UA6Ma1uzb62jIYj+VBrUW+UR+spV0IMA2cM7gvX
         1WU4XzoMmfXN4HmmtrpXX/FjhnZfG0j4BuNb3k6ZhbP0/BDUHTMikjqdM0hs5QPto24B
         dHsBaQcvbYHG/SiToDbByT99rbRC3ga3AiXz2NEi+G5EjGn0LhHJ/kt3qh7dBINn1oiZ
         LLaQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=fUg/8XfBmtURDT5lBCWnW6DL77gquz8BfclV7WZ4WGw=;
        b=YUIFcwAnkOQOmUeVjskV+yb3xFVqxVK8sI2fBTON74e4IwAbgY3pFn/lU399x4czNH
         IAIccQcahuEM3+81wEN2EXLIII93qxcw8v3gzoWI1AoZyfl8WLOirWbBmZA72jFo72Eb
         3DKWTgoLFdVpx3wmFz9MX+iZdEEKGB87p4Om1HEVoy3aF8tCRkyqmDC1XoUNzo88ruf5
         2q03IqM22a0uLXOVob3UF5TpG3i/JT5ooBnOG7vouL+daobhdK8wpqGNx79fhOMjS+UG
         mryAye+o4rRKP5oXYAUv0TdIMZkMV0SVMKGJBRbcrqn0RfbkaBHiAsWJM51WxPu6dDQA
         Lusg==
X-Gm-Message-State: AOAM530n3jgzKuyGPOmOcp3DeU+jyhcDafv9p/PvFfh1qqR7t0DpJCIa
        yQojJI8dS+qjoaFEPT1ggpEPlKI4wLLJGD4EDlNDqw==
X-Google-Smtp-Source: ABdhPJz1fu+GYJ9Q4hXNi4+W2DXO1kx8E49h4Uw1p0aYX/QxgzzQ1t8pfpNBN4cRz69zRb7/MqIYJBvXh6tuLD6HBDE=
X-Received: by 2002:a2e:9cc3:: with SMTP id g3mr13689242ljj.0.1608763808708;
 Wed, 23 Dec 2020 14:50:08 -0800 (PST)
MIME-Version: 1.0
References: <CALvZod5C_Pt_BAVBW7QRYLnfv9=9Qs0K5=kXqyyM=2dg6EqVXw@mail.gmail.com>
 <20201223163317.25979-1-sjpark@amazon.com>
In-Reply-To: <20201223163317.25979-1-sjpark@amazon.com>
From:   Shakeel Butt <shakeelb@google.com>
Date:   Wed, 23 Dec 2020 14:49:57 -0800
Message-ID: <CALvZod6HjfHg-LGM82mnj5keCL8gXykmvR_aatfi2B=F0hqgbw@mail.gmail.com>
Subject: Re: [PATCH v23 01/15] mm: Introduce Data Access MONitor (DAMON)
To:     SeongJae Park <sjpark@amazon.com>
Cc:     SeongJae Park <sjpark@amazon.de>, Jonathan.Cameron@huawei.com,
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

On Wed, Dec 23, 2020 at 8:34 AM SeongJae Park <sjpark@amazon.com> wrote:
[snip]
> > Overall the patch looks good to me. Two concerns I have are if we
> > should damon_callback here or with the real user and the regions part
> > of primitive abstraction. For the first one, I don't have any strong
> > opinion but for the second one I do.
>
> I'd like to keep 'damon_callback' part here, to let API users know how the
> monitoring result will be available to them.
>
> For the 'regions' part, I will rename relevant things as below in the next
> version, to reduce any confusion.
>
> init_target_regions() -> init()
> update_target_regions() -> update()
> regions_update_interval -> update_interval
> last_regions_update -> last_update
>
> >
> > More specifically the question is if sampling and adaptive region
> > adjustment are general enough to be part of core monitoring context?
> > Can you give an example of a different primitive/use-case where these
> > would be beneficial.
>
> I think all adress spaces having some spatial locality and monitoring requests
> that need to have upper-bound overhead and best-effort accuracy could get
> benefit from it.  The primitives targetting 'virtual address spaces' and the
> 'physical address space' clearly showed the benefit.

I am still not much convinced on the 'physical address space' use-case
or the way you are presenting it. Anyways I think we start with what
you have and if in future there is a use-case where regions adjustment
does not make sense, we can change it then.
