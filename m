Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3585FC11F69
	for <linux-doc@archiver.kernel.org>; Thu,  1 Jul 2021 00:19:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 11C2D61443
	for <linux-doc@archiver.kernel.org>; Thu,  1 Jul 2021 00:19:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237471AbhGAAWV (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 30 Jun 2021 20:22:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237259AbhGAAWV (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 30 Jun 2021 20:22:21 -0400
Received: from mail-lj1-x232.google.com (mail-lj1-x232.google.com [IPv6:2a00:1450:4864:20::232])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 64B8DC061756
        for <linux-doc@vger.kernel.org>; Wed, 30 Jun 2021 17:19:51 -0700 (PDT)
Received: by mail-lj1-x232.google.com with SMTP id x20so5842228ljc.5
        for <linux-doc@vger.kernel.org>; Wed, 30 Jun 2021 17:19:51 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Y7O5yPPqy47i4kWXigRNtGqLZWA5RvHaA+tBBNz9j/E=;
        b=euBEeyqPefv/L+lWYKMqvVCnpFOJSCkB4S4OIAh7Alk/L1QWouT6aCWZQJ0CLELthY
         I6Skv8RNTgsFv8x2KFss5JbWxXaeCq4ej9+fkGAwSKboNRWjAX/jyhbTCI9ldNRn1aW/
         i9YxyF63YTJJZoJMHFAKoSisjhmU8Mg86UIXeB+6RuIFRzQYerTTEOEXMNAipCTtshcV
         74/aT5khIWAH2xKsSet0l1PNPfNz9h5MWoLhXnlPSDpeMgM/FpYHSupSNt1ftnXG+kax
         RYQf+2h1o8dwAPBlZ8Ho1v2mjraCpTa9xpt0jrMSXcZJMoZwidnmufi42dHeEpXZ3m1i
         /D1w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Y7O5yPPqy47i4kWXigRNtGqLZWA5RvHaA+tBBNz9j/E=;
        b=EkZ+9YVO7c3l4k8CYVlthLvc2Z0H5s3Xf/rHB5VxP8xDZ83i5yCknmTM9vGCLNFPYI
         yUthRbCMb6JosUgkTnLnlyO5dz3ADzIMdKYsw2fRskiXI7ID280I/CDnWaf0WFZKnAEx
         RAq7sT12JExIDWwOnRlZD6e1rxX8owmO8CT/b9lY99iQzU0qFjjSqWRXAiM4FzAW0FEc
         nva6eLAOti3hjvXjgslXVPgdMhE2zqdaSrVN7WkLE9rQ2SsDtoJjb/n7ay+Pzl5M26SC
         slHI01C8gnBNfoWopN+Tgdj0cZM970ZBhfleDT1AqXDgHv3TGvZZB3u8gdmicVfIWDW1
         KBQg==
X-Gm-Message-State: AOAM532ZHr83A9JVbZcHj8OwYb5Z3JojViLTlWZKuj/0kKv2rlS+g/tH
        I9dhu+iwYJlUebU56sp1CNcByhQeXJHXl6rdziayww==
X-Google-Smtp-Source: ABdhPJzwp3bMv/tnUCGdW2cRdr6o2o6vWqNJqsLY94tNxoD36tjRhiZkOyI57pz0GE1UtjYVhypgo08ynM7ZEQRkBzk=
X-Received: by 2002:a2e:9252:: with SMTP id v18mr10131163ljg.122.1625098789518;
 Wed, 30 Jun 2021 17:19:49 -0700 (PDT)
MIME-Version: 1.0
References: <20210628133355.18576-1-sj38.park@gmail.com> <20210628133355.18576-6-sj38.park@gmail.com>
In-Reply-To: <20210628133355.18576-6-sj38.park@gmail.com>
From:   Shakeel Butt <shakeelb@google.com>
Date:   Wed, 30 Jun 2021 17:19:38 -0700
Message-ID: <CALvZod4zm0KjGMZzooOPXXDJPyw-TaFSeJn-s-tL3EWBz2td_A@mail.gmail.com>
Subject: Re: [PATCH v32 05/13] mm/damon: Implement primitives for the virtual
 memory address spaces
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

On Mon, Jun 28, 2021 at 6:34 AM SeongJae Park <sj38.park@gmail.com> wrote:
>
> From: SeongJae Park <sjpark@amazon.de>
>
> This commit introduces a reference implementation of the address space
> specific low level primitives for the virtual address space, so that
> users of DAMON can easily monitor the data accesses on virtual address
> spaces of specific processes by simply configuring the implementation to
> be used by DAMON.
>
> The low level primitives for the fundamental access monitoring are
> defined in two parts:
>
> 1. Identification of the monitoring target address range for the address
>    space.
> 2. Access check of specific address range in the target space.
>
> The reference implementation for the virtual address space does the
> works as below.
>
> PTE Accessed-bit Based Access Check
> -----------------------------------
>
> The implementation uses PTE Accessed-bit for basic access checks.  That
> is, it clears the bit for the next sampling target page and checks
> whether it is set again after one sampling period.  This could disturb
> the reclaim logic.  DAMON uses ``PG_idle`` and ``PG_young`` page flags
> to solve the conflict, as Idle page tracking does.
>
> VMA-based Target Address Range Construction
> -------------------------------------------
>
> Only small parts in the super-huge virtual address space of the
> processes are mapped to physical memory and accessed.  Thus, tracking
> the unmapped address regions is just wasteful.  However, because DAMON
> can deal with some level of noise using the adaptive regions adjustment
> mechanism, tracking every mapping is not strictly required but could
> even incur a high overhead in some cases.  That said, too huge unmapped
> areas inside the monitoring target should be removed to not take the
> time for the adaptive mechanism.
>
> For the reason, this implementation converts the complex mappings to
> three distinct regions that cover every mapped area of the address
> space.  Also, the two gaps between the three regions are the two biggest
> unmapped areas in the given address space.  The two biggest unmapped
> areas would be the gap between the heap and the uppermost mmap()-ed
> region, and the gap between the lowermost mmap()-ed region and the stack
> in most of the cases.  Because these gaps are exceptionally huge in
> usual address spaces, excluding these will be sufficient to make a
> reasonable trade-off.  Below shows this in detail::
>
>     <heap>
>     <BIG UNMAPPED REGION 1>
>     <uppermost mmap()-ed region>
>     (small mmap()-ed regions and munmap()-ed regions)
>     <lowermost mmap()-ed region>
>     <BIG UNMAPPED REGION 2>
>     <stack>
>
> Signed-off-by: SeongJae Park <sjpark@amazon.de>
> Reviewed-by: Leonard Foerster <foersleo@amazon.de>
> Reviewed-by: Fernand Sieber <sieberf@amazon.com>

Acked-by: Shakeel Butt <shakeelb@google.com>
