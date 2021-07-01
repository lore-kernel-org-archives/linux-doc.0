Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_IN_DEF_DKIM_WL autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16BBDC11F66
	for <linux-doc@archiver.kernel.org>; Thu,  1 Jul 2021 00:18:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F3D0861451
	for <linux-doc@archiver.kernel.org>; Thu,  1 Jul 2021 00:18:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237838AbhGAAUz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 30 Jun 2021 20:20:55 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43954 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236997AbhGAAUw (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 30 Jun 2021 20:20:52 -0400
Received: from mail-lf1-x133.google.com (mail-lf1-x133.google.com [IPv6:2a00:1450:4864:20::133])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2CD83C0617A8
        for <linux-doc@vger.kernel.org>; Wed, 30 Jun 2021 17:18:21 -0700 (PDT)
Received: by mail-lf1-x133.google.com with SMTP id k10so8336989lfv.13
        for <linux-doc@vger.kernel.org>; Wed, 30 Jun 2021 17:18:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=CmjVxgCuZa7W1IB2rE7Ahs8xwAc6kD7PBq+4uE9+JOg=;
        b=MwGuYq470DmmxyRW4pUzKJAiI4H+QXWtWt+NTxQliXHh0rcaeFKoVfPZgD6OBSkoeG
         YFK7kzI7NdXqOnjvIk9UbPglOGKun5fmzyA7G09R69iUwxLwGFkfLbQu2SHKAC88o91m
         g0aY9S4Y8QJy8Sy6GgZAZtSNU5JQmRivsHihX1qNcdnmjhYbEOGPjgliq8iesXVK3S3P
         w59/vFnMZbpLHyfmLBy0+tgwGLmD3CoPbifnp6OsA+FgqfJTdBgWQbRbKz38k7JdCjZ1
         J4UlP0kiYjFkxQAye44s4FCOOvw+H/ydsXoCp7JfjR0eVeW2R72lPix4v4E91Wjnj41K
         1AIQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=CmjVxgCuZa7W1IB2rE7Ahs8xwAc6kD7PBq+4uE9+JOg=;
        b=BeC+/fw4iQF1CS94S7E3TFmgCoMR7CyxGPfhWDQtIMo7O6qEK6sfQtdA+idOshNpwy
         C1qpHHSx4oEudL+06wvyvf1lb1jEz9mkSHFrifLR3mLDCYBlzdiXoxnOzByEY7VA6ust
         SAtaA6u927bD8e0EdMfQtcak+Eem/UI71ihqOeYi3XlCsJ+AuN4KsLqu3Pn4PQBShAzx
         7pMNeO6GsCJphZDVBzLAAGHYOHVJviEl3uK8xi2I1/RsJy3v3+qwl3eZZUb3c4FoODzB
         vwu+KK6H2J2XOy4SOHU4xyaTHrHKFt82tfPosLtFj5rjMCEC3Xpt0BNVgARLvErhAQDr
         24/g==
X-Gm-Message-State: AOAM5307cSxsM/6H2WdfC6f4ZwuKeRd35Nw8I4DBfwjKp2uGTt2jI89d
        rYwPgd7H0/L7km5+P30AdnXMmoTc0YHpIgnPaC0ZAg==
X-Google-Smtp-Source: ABdhPJxhdsug23dO9aKrK0MJcADXuwga3FJN8Rqu74M+5beXZR3CMYGYDeoM6AE7Daeb6YUcq+j6pJ9NWKihh6AqwT8=
X-Received: by 2002:a19:5016:: with SMTP id e22mr16601403lfb.299.1625098698637;
 Wed, 30 Jun 2021 17:18:18 -0700 (PDT)
MIME-Version: 1.0
References: <20210621083108.17589-1-sj38.park@gmail.com> <20210621083108.17589-6-sj38.park@gmail.com>
In-Reply-To: <20210621083108.17589-6-sj38.park@gmail.com>
From:   Shakeel Butt <shakeelb@google.com>
Date:   Wed, 30 Jun 2021 17:18:07 -0700
Message-ID: <CALvZod4zE812VjubFKfbTG_jF7-uX5kT48=XQ+2cYxnzsY9-fQ@mail.gmail.com>
Subject: Re: [PATCH v31 05/13] mm/damon: Implement primitives for the virtual
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

On Mon, Jun 21, 2021 at 1:31 AM SeongJae Park <sj38.park@gmail.com> wrote:
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
