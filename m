Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.3 required=3.0 tests=BAYES_00,DKIMWL_WL_MED,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_IN_DEF_DKIM_WL
	autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D558C4320A
	for <linux-doc@archiver.kernel.org>; Sat, 28 Aug 2021 21:14:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 089A360E90
	for <linux-doc@archiver.kernel.org>; Sat, 28 Aug 2021 21:14:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232404AbhH1VOw (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 28 Aug 2021 17:14:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34944 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231773AbhH1VOt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 28 Aug 2021 17:14:49 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B3742C0613D9
        for <linux-doc@vger.kernel.org>; Sat, 28 Aug 2021 14:13:58 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id e133so4203299ybh.0
        for <linux-doc@vger.kernel.org>; Sat, 28 Aug 2021 14:13:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20161025;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ICcSCFexjhpp8PBl0tQjqKkSyaD0mJsG1uKHkuscRbw=;
        b=gV1T+5i/k5S8ZzJnpNhMlyvXxAUnUgvbFDNvQcSjiLmWAm+5RMKOptlxPVAbDSB9y5
         DjNRnN5aBxTyw4/H75I2FCH88Zwihmjf9TpcXO0SJAX0UN8e8SIAlqjOOjkIanqGlbTY
         RMI8YRMNYv2G0S6FVFQCX5uNDAR2kKbD92SjaqnfnhfD0tQqLs3X8CtGg8rjSdEceQ6S
         MvJcXW+AL/eJW0wFEQvZwnxxN6qjnabEpuE4gDcxYezkBmtBq4lWKff5KT71Tk38dlWf
         Y6FEywUwpOgKyVBbSlLlUHSK8Ky94Q6eoOfKdGBLWf3OAxCQyDjyLfUl+Mam1YIEpNhr
         GF+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ICcSCFexjhpp8PBl0tQjqKkSyaD0mJsG1uKHkuscRbw=;
        b=XZfmjhDSDPx4swUwoa1vCRLK3+7dQ11Jgd4Z/LgkMOhyGV/URRLGlr9uexphZdpFtG
         uoVGtQPhfzQ+CQbrNj9uKNICsJ99lI2DQJJ8px0Rv00vo7xU6ENWoVBKfVScLDAm+q6z
         zHh2w1xczpRjxykjioM+kSPTH58Neb5+uyIc4/d3RhTMlzj8k4Hdif4zG/J8+mCrOW/R
         FDF8G/R78IlhoUxEr26A4p8RVd4QA4bU17eqtAgfJNaGV6hIj5XY75gmaEcNFrGcpEkP
         tpzKlnQV0B2Q2eKMIf9+DOCgT+iD/wfMgpohqumCd14wNug3n+dwFyfwDXBsxQYBci8s
         bkuQ==
X-Gm-Message-State: AOAM532nwiCh0iHiGKeUOJtcXp+tEN0Ym/3NANVNvpYaz372vVOxSGAm
        WZv7e7YJWrhkWoXiJKAse6+X5ht2ssoVqyG4X5vqeA==
X-Google-Smtp-Source: ABdhPJzTGgBAMEHL0PjhT2MzcQ07lzKlvxCvWWXzRYRZdMn4dsVrA+qJVnFa57VycofHCrLOcfOcy4S0yhD1Mp8cwI0=
X-Received: by 2002:a25:810c:: with SMTP id o12mr14438431ybk.250.1630185237477;
 Sat, 28 Aug 2021 14:13:57 -0700 (PDT)
MIME-Version: 1.0
References: <20210827191858.2037087-1-surenb@google.com> <20210827191858.2037087-4-surenb@google.com>
 <202108271746.F444DA6C9@keescook>
In-Reply-To: <202108271746.F444DA6C9@keescook>
From:   Suren Baghdasaryan <surenb@google.com>
Date:   Sat, 28 Aug 2021 14:13:46 -0700
Message-ID: <CAJuCfpHLTMyAFsxAYHbiwkZNidzQU3qKWzj57LZX=b-Zybmugg@mail.gmail.com>
Subject: Re: [PATCH v8 3/3] mm: add anonymous vma name refcounting
To:     Kees Cook <keescook@chromium.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Colin Cross <ccross@google.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Michal Hocko <mhocko@suse.com>,
        Dave Hansen <dave.hansen@intel.com>,
        Matthew Wilcox <willy@infradead.org>,
        "Kirill A . Shutemov" <kirill.shutemov@linux.intel.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Al Viro <viro@zeniv.linux.org.uk>,
        Randy Dunlap <rdunlap@infradead.org>,
        Kalesh Singh <kaleshsingh@google.com>,
        Peter Xu <peterx@redhat.com>, rppt@kernel.org,
        Peter Zijlstra <peterz@infradead.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        vincenzo.frascino@arm.com,
        =?UTF-8?B?Q2hpbndlbiBDaGFuZyAo5by16Yym5paHKQ==?= 
        <chinwen.chang@mediatek.com>,
        Axel Rasmussen <axelrasmussen@google.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Jann Horn <jannh@google.com>, apopple@nvidia.com,
        John Hubbard <jhubbard@nvidia.com>,
        Yu Zhao <yuzhao@google.com>, Will Deacon <will@kernel.org>,
        fenghua.yu@intel.com, thunder.leizhen@huawei.com,
        Hugh Dickins <hughd@google.com>, feng.tang@intel.com,
        Jason Gunthorpe <jgg@ziepe.ca>, Roman Gushchin <guro@fb.com>,
        Thomas Gleixner <tglx@linutronix.de>, krisman@collabora.com,
        chris.hyser@oracle.com, Peter Collingbourne <pcc@google.com>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Jens Axboe <axboe@kernel.dk>, legion@kernel.org, eb@emlix.com,
        Muchun Song <songmuchun@bytedance.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        thomascedeno@google.com, sashal@kernel.org, cxfcosmos@gmail.com,
        linux@rasmusvillemoes.dk, LKML <linux-kernel@vger.kernel.org>,
        linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-mm <linux-mm@kvack.org>,
        kernel-team <kernel-team@android.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Aug 27, 2021 at 10:28 PM Kees Cook <keescook@chromium.org> wrote:
>
> On Fri, Aug 27, 2021 at 12:18:58PM -0700, Suren Baghdasaryan wrote:
> > While forking a process with high number (64K) of named anonymous vmas the
> > overhead caused by strdup() is noticeable. Experiments with ARM64 Android
> > device show up to 40% performance regression when forking a process with
> > 64k unpopulated anonymous vmas using the max name lengths vs the same
> > process with the same number of anonymous vmas having no name.
> > Introduce anon_vma_name refcounted structure to avoid the overhead of
> > copying vma names during fork() and when splitting named anonymous vmas.
> > When a vma is duplicated, instead of copying the name we increment the
> > refcount of this structure. Multiple vmas can point to the same
> > anon_vma_name as long as they increment the refcount. The name member of
> > anon_vma_name structure is assigned at structure allocation time and is
> > never changed. If vma name changes then the refcount of the original
> > structure is dropped, a new anon_vma_name structure is allocated
> > to hold the new name and the vma pointer is updated to point to the new
> > structure.
> > With this approach the fork() performance regressions is reduced 3-4x
> > times and with usecases using more reasonable number of VMAs (a few
> > thousand) the regressions is not measurable.
>
> I like the refcounting; thank you!
>
> Since patch2 adds a lot of things that are changed by patch3; maybe
> combine them?

I thought it would be easier to review with the main logic being
written using a basic type (string) first and then replace the basic
type with a more complex refcounted structure. Also, if someone would
like to rerun the tests and measure the regression of strdup vs
refcounting approach, keeping this patch separate makes it easier to
set up these tests.
If that's not convenient I can absolutely squash them together.

>
> --
> Kees Cook
