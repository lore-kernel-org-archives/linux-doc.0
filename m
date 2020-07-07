Return-Path: <SRS0=3gwW=AS=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.4 required=3.0 tests=DKIMWL_WL_MED,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B6ACC433E1
	for <linux-doc@archiver.kernel.org>; Tue,  7 Jul 2020 20:01:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6E70A2078B
	for <linux-doc@archiver.kernel.org>; Tue,  7 Jul 2020 20:01:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="joExhaby"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728316AbgGGUB7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 7 Jul 2020 16:01:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727791AbgGGUB6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 7 Jul 2020 16:01:58 -0400
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86B71C061755
        for <linux-doc@vger.kernel.org>; Tue,  7 Jul 2020 13:01:58 -0700 (PDT)
Received: by mail-pj1-x1043.google.com with SMTP id b92so135073pjc.4
        for <linux-doc@vger.kernel.org>; Tue, 07 Jul 2020 13:01:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=deVKVkd1dAk3e08j5i5GNiXNm5xjlkJJyaPmekMgYU0=;
        b=joExhabyZB0vt1CrjiLBBJuh2y0s7Ge6/UUdEHw/Rj+xbg/+H0a6S2IOIN3IiViQ4W
         rxW2IIFm9AuobZCgTrgrZ3PNONPWHIO4Sv/zazlNvo3sEgs+oyIGKXJrFoDEs5DZo7JA
         podQjUBXC8G6qX6tTkd+AqoL4n+R8nXmVyuHB9AUzlja1OPlBFUgiSywtkJwqa5Aepem
         +IJ9BKFmSeCExYlUbF41YilpU0wu0MfKQryD6KqPxRDkC4/cE74YKU1ltEhGYhbpzeU1
         2qWH5br7P9OjtB8rVNXM+68xisqJQ/pe9s/3FI9Hvp7nQkFxQO2Yo3bbMbSC3hFsoY9Q
         duaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=deVKVkd1dAk3e08j5i5GNiXNm5xjlkJJyaPmekMgYU0=;
        b=njJbA1cmWDSO2yUJn+Nza1bquiOM2SXVdwcDoGABZNQtWqLPOA4lt7sVhdvc3uGqvP
         H5ulMGC9RzpZ9IK4Agn0M9si9O10UIqxgBx9qBbFYUxgNDHSLGdArFTleNqDKb1D1bPP
         xEOPmUrxsiPZfo2L7ywCwDzoKaJKMe3B/NtDWDK8QheI8pE0t608PZgzKTgYre0EcOnJ
         epvSOzkWDcRNaJ9wgVHfAzAhog6TjdR8UHMBlCpbZkzWHt+NVw887E4Q5rganwYdeK0W
         rdiVAFCNnVyUEVZ/DQU0oXwz1l6yJW1bXRup+V4cAGJhmqvpwbVzVneXZkQo+5yg9kGx
         hOwg==
X-Gm-Message-State: AOAM530bshvXwtkG0NFQL9wlaK2ZMZxdLxxXpgmfOpIjQ7rI0gGHjANS
        2UzHcolwyeet8xtAolocdCvbklxiGDJPOyT8y2PSnA==
X-Google-Smtp-Source: ABdhPJwlyVLVKZHN4qDBBNdeHNC6CEZw4PyXOcicJbwGgUEhBHxpMRM661Kzpz4Odl5vxpRmyjw74Leq6xMBk9xk4ug=
X-Received: by 2002:a17:90a:4bc7:: with SMTP id u7mr6113647pjl.217.1594152117794;
 Tue, 07 Jul 2020 13:01:57 -0700 (PDT)
MIME-Version: 1.0
References: <20200707144540.21216-1-sjpark@amazon.com> <20200707144540.21216-4-sjpark@amazon.com>
In-Reply-To: <20200707144540.21216-4-sjpark@amazon.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Tue, 7 Jul 2020 13:01:46 -0700
Message-ID: <CAFd5g45iCQKUquBCL+htQaQB6B4_dxpkp2wWCUXP6zMTuddiBQ@mail.gmail.com>
Subject: Re: [RFC v5 03/11] mm/damon-test: Add more unit tests for 'init_regions'
To:     SeongJae Park <sjpark@amazon.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        SeongJae Park <sjpark@amazon.de>, Jonathan.Cameron@huawei.com,
        aarcange@redhat.com, acme@kernel.org,
        alexander.shishkin@linux.intel.com, amit@kernel.org,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        brendan.d.gregg@gmail.com, cai@lca.pw,
        Colin King <colin.king@canonical.com>,
        Jonathan Corbet <corbet@lwn.net>, david@redhat.com,
        dwmw@amazon.com, foersleo@amazon.de,
        Ian Rogers <irogers@google.com>, jolsa@redhat.com,
        kirill@shutemov.name, Mark Rutland <mark.rutland@arm.com>,
        mgorman@suse.de, minchan@kernel.org,
        Ingo Molnar <mingo@redhat.com>, namhyung@kernel.org,
        Peter Zijlstra <peterz@infradead.org>,
        Randy Dunlap <rdunlap@infradead.org>, riel@surriel.com,
        David Rientjes <rientjes@google.com>,
        Steven Rostedt <rostedt@goodmis.org>, rppt@kernel.org,
        sblbir@amazon.com, Shakeel Butt <shakeelb@google.com>,
        shuah <shuah@kernel.org>, SeongJae Park <sj38.park@gmail.com>,
        snu@amazon.de, vbabka@suse.cz, vdavydov.dev@gmail.com,
        yang.shi@linux.alibaba.com, ying.huang@intel.com,
        linux-damon@amazon.com, linux-mm@kvack.org,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jul 7, 2020 at 7:47 AM SeongJae Park <sjpark@amazon.com> wrote:
>
> From: SeongJae Park <sjpark@amazon.de>
>
> This commit adds more test cases for the new feature, 'init_regions'.
>
> Signed-off-by: SeongJae Park <sjpark@amazon.de>

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
