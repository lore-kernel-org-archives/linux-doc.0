Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_IN_DEF_DKIM_WL autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DAA9C2B9F4
	for <linux-doc@archiver.kernel.org>; Sat, 19 Jun 2021 09:20:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 53A6F611CE
	for <linux-doc@archiver.kernel.org>; Sat, 19 Jun 2021 09:20:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232638AbhFSJXD (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 19 Jun 2021 05:23:03 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41978 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230318AbhFSJXD (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 19 Jun 2021 05:23:03 -0400
Received: from mail-il1-x130.google.com (mail-il1-x130.google.com [IPv6:2607:f8b0:4864:20::130])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 90F02C061756
        for <linux-doc@vger.kernel.org>; Sat, 19 Jun 2021 02:20:52 -0700 (PDT)
Received: by mail-il1-x130.google.com with SMTP id s19so3875536ilj.1
        for <linux-doc@vger.kernel.org>; Sat, 19 Jun 2021 02:20:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sDVZ3c/xTpZGtI9erkQPxbYx9+iJ9vOpXLUpVMNI/1E=;
        b=iHMdMmyEQsXFGONPsrbXeEqTaxCjYY+Hxsr/rW3fMWm9fmLa0dddqDGpxFSGsyqNGo
         UnnNULKgqQTqPE+3pDD8mO6+L1jPBQ/i8QtZiVGibEXD8enghkDVYBJ9bL/BqIZRE8HJ
         7cf7RYJ4aZFwZ1nUpBIX1ZL6Js4uxBtJAh3AS5xjbOHIZLm8A67mlB6WLRqPW5Z7dcm9
         y8F3Pv1PozB9Q7LktRb/mRluF1Kw5Tl3kP3Lq6jIIFFvIiNT5B7mUqzPokZAqckBTCPL
         wl37rREtww+9/IDpoB/pPty7BOwtLg2IoWaAHdGKgv62c3MSfOGxkbAZ+hEjzeWygxUx
         xGQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sDVZ3c/xTpZGtI9erkQPxbYx9+iJ9vOpXLUpVMNI/1E=;
        b=URVKNSqn+qoeR2VjDA/R6USIBqyN1DyczUD56uESy1v+zdbVMHyyY3Hpnvni028b0S
         TvmK1fAEo9ZVYelxlOU284xViSFlRzz/XljlB4wf1ykppLPUUuRLV2V8/7Oh4/l1ZnNs
         qps1g5UmIDNWT+shSBIjPRpucEOEZ1xprnqFhQ8662+EDWYvYNzqqcJoF+0spmzkpRp3
         tZ53um1K10qaT80ae70UFyRJ280m6U0sS2PqY3cW0RJGYrg3D8OAz/HZzSoMjKtS/5BK
         OkKTOQjzJIbLcODcaT85c9zs1wTYVJvTcJ7wmr6UNwjOft3F2v577qec7Kw9gj4dr3KX
         prug==
X-Gm-Message-State: AOAM531PXYehoEb6WePd4O5Y/NoZwXvzbM+UaeADvoKfh7/0fCJ0rg/V
        14e5aCbMu0Vzvoo5yBXM/ud5cnsuy+5sKrfgP22hrA==
X-Google-Smtp-Source: ABdhPJwC/gS2gEWwdpnbyJ8UJU65AE8I+o9uIFLn0OHwp2dbho65Kx5LceLdZla0C3j9jz2Xmz9m+m6Ai/Rn9FTODU4=
X-Received: by 2002:a05:6e02:10c3:: with SMTP id s3mr10298743ilj.37.1624094451650;
 Sat, 19 Jun 2021 02:20:51 -0700 (PDT)
MIME-Version: 1.0
References: <20200814213310.42170-1-pcc@google.com> <c2f7efa7-0b52-b92f-79bc-a0cc26b0d92c@nvidia.com>
 <20200818030021.GM17456@casper.infradead.org> <2ce2125f-5424-63d5-16a2-a4e1da76053e@nvidia.com>
In-Reply-To: <2ce2125f-5424-63d5-16a2-a4e1da76053e@nvidia.com>
From:   Peter Collingbourne <pcc@google.com>
Date:   Sat, 19 Jun 2021 02:20:40 -0700
Message-ID: <CAMn1gO7ggssTJKdjtfDWsmWDV_ShgQjH+gOx=7H7DmFRQKXupw@mail.gmail.com>
Subject: Re: [PATCH v3] mm: introduce reference pages
To:     John Hubbard <jhubbard@nvidia.com>
Cc:     Matthew Wilcox <willy@infradead.org>,
        "Kirill A . Shutemov" <kirill@shutemov.name>,
        Andrew Morton <akpm@linux-foundation.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Evgenii Stepanov <eugenis@google.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        kernel test robot <lkp@intel.com>,
        Linux API <linux-api@vger.kernel.org>,
        linux-doc@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

[Apologies for the delay in getting back to you; other work ended up
taking priority and now I'm back to looking at this.]

On Tue, Aug 18, 2020 at 11:25 AM John Hubbard <jhubbard@nvidia.com> wrote:
>
> On 8/17/20 8:00 PM, Matthew Wilcox wrote:
> > On Mon, Aug 17, 2020 at 07:31:39PM -0700, John Hubbard wrote:
> >>>             Real time (s)    Max RSS (KiB)
> >>> anon        2.237081         107088
> >>> memset      2.252241         112180
> >>> refpage     2.243786         107128
> >>>
> >>> We can see that RSS for refpage is almost the same as anon, and real
> >>> time overhead is 44% that of memset.
> >>>
> >>
> >> Are some of the numbers stale, maybe? Try as I might, I cannot combine
> >> anything above to come up with 44%. :)
> >
> > You're not trying hard enough ;-)
> >
> > (2.252241 - 2.237081) / 2.237081 = .00677668801442594166
> > (2.243786 - 2.237081) / 2.237081 = .00299720930981041812
> > .00299720930981041812 / .00677668801442594166 = .44228232189973614648
> >
> > tadaa!
>
> haha, OK then! :) Next time I may try harder, but on the other hand my
> interpretation of the results is still "this is a small effect", even
> if there is a way to make it sound large by comparing the 3rd significant
> digits of the results...
>
> >
> > As I said last time this was posted, I'm just not excited by this.  We go
> > from having a 0.68% time overhead down to an 0.30% overhead, which just
> > doesn't move the needle for me.  Maybe there's a better benchmark than
> > this to show benefits from this patchset.
> >
>

Remember that this is a "realistic" benchmark, so it's doing plenty of
other work besides faulting pages. So I don't think we should expect
to see a massive improvement here.

I ran the pdfium benchmark again but I couldn't see the same
improvements that I got last time. This seems to be because pdfium has
since switched to its own allocator, bypassing the system allocator. I
think the gains should be larger with the memset optimization that
I've implemented, but I'm still in the process of finding a suitable
realistic benchmark that uses the system allocator.

But I would find a 0.4% perf improvement convincing enough,
personally, given that the workload is realistic. Consider a certain
large company which spends $billions annually on data centers. In that
environment a 0.4% performance improvement on realistic workloads can
translate to $millions of savings. And that's not taking into account
the memory savings which are important both in mobile environments and
in data centers.

> Yes, I wonder if there is an artificial workload that just uses refpages
> really extensively, maybe we can get some good solid improvements shown
> with that? Otherwise, it seems like we've just learned that memset is
> actually pretty good in this case. :)

Yes, it's possible to see the performance improvement here more
clearly with a microbenchmark. I've updated the commit message in v4
to include a microbenchmark program and some performance numbers from
it.

Peter
