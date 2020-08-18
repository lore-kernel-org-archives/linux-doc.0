Return-Path: <SRS0=tMRj=B4=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.4 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7CD4BC433E1
	for <linux-doc@archiver.kernel.org>; Tue, 18 Aug 2020 19:22:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5DD4620786
	for <linux-doc@archiver.kernel.org>; Tue, 18 Aug 2020 19:22:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="wNeGxpkX"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726673AbgHRTWP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 18 Aug 2020 15:22:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41838 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726653AbgHRTWO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 18 Aug 2020 15:22:14 -0400
Received: from mail-pf1-x444.google.com (mail-pf1-x444.google.com [IPv6:2607:f8b0:4864:20::444])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D7CFDC061389
        for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2020 12:22:13 -0700 (PDT)
Received: by mail-pf1-x444.google.com with SMTP id m8so10457896pfh.3
        for <linux-doc@vger.kernel.org>; Tue, 18 Aug 2020 12:22:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=RnXaBz5VuHX3H/YR5fkZQKNpdCOXQQKobMc+SiMfEG0=;
        b=wNeGxpkXbRBcfZ7VIZMVQNTm25lswlYBS948OrkjdpKg1f8ooEBsCfwUX5wGiyJoOR
         dnduS6Ej/5Ic5J8ZDxwRi4lbDfRjnL4rY/eDFArgUDkK4FtXVTJzK9aWVFFmTczwGVYl
         EtqbOZxglsFQE8z3FZ95WCLLDfqwwZG9L1rUiFZvsMwuGB859v+rjrXEgpQ0vO5RRbOO
         BjAklp+Ok6jf6yMyYf4OHEkQCHLKY+4n5VZgLaWj4IR8SUh0MekZAKCeHFpN2MO2UwYF
         ONzJH3cZgMWNtcQ9/y3Kn6R87wjfX/ucKrACVUhO3iPd1aXLLmH2VR6JN+OE3EU5sNlf
         ugVw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=RnXaBz5VuHX3H/YR5fkZQKNpdCOXQQKobMc+SiMfEG0=;
        b=SpqdAs7MznpTUqbUSzFNpCyNZElctzkX8EFQOzzXOPgqtimxHsNdjI9SVmmGVMz0Oi
         N5Ey4EQyY0auJNYuXBdvQXEcRyP1rIgMkJTYwkejxTUgjAWeEYffPN9t4dwSdFzMo/aR
         GvgLwsVDLQFcN2cUccb2oGzkHhuXWN59gUFTXJ/MAZXzU/1V4kMXOUhwutc3FWNBUaMU
         y5Ghe4YrM142m9Ho5INbISM5+IPEO+CuWe4bu47/HJ8VHedwNstYNc/8BCoYUhM8yeDu
         ZvYehRAj5rhEbyI8hDPtQduKLB/LVD+Z8f90PrZBPeN7ase8K90YjsrZWkIBGuckxDcO
         tL5A==
X-Gm-Message-State: AOAM533LjUSF+vPBsC0OkCAY9qT/PGkGcoFDtvafe818q+C6rHZlXL3s
        g9CMzZXFOob+4R0MzqvebadZqsEKbO1ed7FVQgQ4dg==
X-Google-Smtp-Source: ABdhPJyWlfTWSAdjpdCvinEsKRXSCnWYwa1wJq4ltVBy4L396qWTBjgo9NEU58QeMpxt61o6Thfe6CywmhuwMW3yGD4=
X-Received: by 2002:a63:7746:: with SMTP id s67mr14209143pgc.159.1597778533126;
 Tue, 18 Aug 2020 12:22:13 -0700 (PDT)
MIME-Version: 1.0
References: <20200818072501.30396-1-sjpark@amazon.com> <20200818072501.30396-4-sjpark@amazon.com>
In-Reply-To: <20200818072501.30396-4-sjpark@amazon.com>
From:   Brendan Higgins <brendanhiggins@google.com>
Date:   Tue, 18 Aug 2020 12:22:02 -0700
Message-ID: <CAFd5g44BR8ETGQ4cqqq+eu8hwufAuDFSAMtpS-cpkkDp5nYYuw@mail.gmail.com>
Subject: Re: [RFC v7 03/10] mm/damon-test: Add more unit tests for 'init_regions'
To:     SeongJae Park <sjpark@amazon.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        SeongJae Park <sjpark@amazon.de>,
        Jonathan Cameron <Jonathan.Cameron@huawei.com>,
        aarcange@redhat.com, acme@kernel.org,
        alexander.shishkin@linux.intel.com, amit@kernel.org,
        Benjamin Herrenschmidt <benh@kernel.crashing.org>,
        brendan.d.gregg@gmail.com, cai@lca.pw,
        Colin King <colin.king@canonical.com>,
        Jonathan Corbet <corbet@lwn.net>, david@redhat.com,
        dwmw@amazon.com, fan.du@intel.com, foersleo@amazon.de,
        Greg Thelen <gthelen@google.com>,
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
        zgf574564920@gmail.com, linux-damon@amazon.com, linux-mm@kvack.org,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Aug 18, 2020 at 12:26 AM SeongJae Park <sjpark@amazon.com> wrote:
>
> From: SeongJae Park <sjpark@amazon.de>
>
> This commit adds more test cases for the new feature, 'init_regions'.
>
> Signed-off-by: SeongJae Park <sjpark@amazon.de>

Reviewed-by: Brendan Higgins <brendanhiggins@google.com>
