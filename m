Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C3F33C433EF
	for <linux-doc@archiver.kernel.org>; Thu,  7 Oct 2021 03:01:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A023A61177
	for <linux-doc@archiver.kernel.org>; Thu,  7 Oct 2021 03:01:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240049AbhJGDDs (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 6 Oct 2021 23:03:48 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41204 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239972AbhJGDDq (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 6 Oct 2021 23:03:46 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CF420C061746
        for <linux-doc@vger.kernel.org>; Wed,  6 Oct 2021 20:01:53 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id d131so10057953ybd.5
        for <linux-doc@vger.kernel.org>; Wed, 06 Oct 2021 20:01:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=vS4/WOvYDhNQ7ZsXwhiF8T3HN4eYLx7yihXGA4gOi8Q=;
        b=dmiCtiNfg3F1ojrOt2kKAa87WL7RZ81/psMuqyaUaCcmRrX9ExgCOOsDqPjUDZbWAV
         /I0Pk/3VHqkpewCiUKWA8d4JlwoPsGXZXIYmju9wEHL9TVHS0Orqa5NdEbLbq22fzW14
         l7InE8yrsBMGM1vmNkTSeZ90ZFkonfWNdUMalDKhWwH3IXItN3KIYTo1saLaJ9xuL3pe
         SGQ/Elmv7+OeWgdPgfullF+YxQH3WSAyBtK5+Vy0KSu2qLhJy9lo8jExk8QA+ksiAIW3
         Kqa6CUduCBvAWoCmVmQubEbYqi+ILUgDkmRr9mBZRfTri9fEuWoe6uk7SlCeuqfdY8uE
         D8ag==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=vS4/WOvYDhNQ7ZsXwhiF8T3HN4eYLx7yihXGA4gOi8Q=;
        b=10eJozBKOnkDorSGO9uPh5rD3PMeHvTQSPKzJbU8gLQGAhzyKvVORIITzsSP6iixvM
         bASsojCLJwgIDTGpBp1hev6m2wRSPGNqVB2OiwHws9nxGYkFFAwmUJjRLziuN0YWsniv
         Gq9WmqUaebR1unfq2k9wiA8nHzLs1DAmQ/dX+3Q4Y0s9A47VB/Xtld6dZ50z6532xvK6
         Gga5fKO7tgF0DV03wWAVge6hmnC3+4vOGRK5AoIjpbEQemOyxUYSz8YDhnrZm5QVL1V9
         xKBCIOoFsz5sw1RsxYmxLRjj3hzms59rExlTDzR8+fzS0YtoBp3L8yjnQNali81NCnfH
         YVgg==
X-Gm-Message-State: AOAM530NKy2prWsxjcolGyw9mnAqhHFY5UzHflIk33RgLz9InijvdFnP
        OYgw8yFMhBVGKnb4pTYL14o50EmceaQ2uRC592+FMQ==
X-Google-Smtp-Source: ABdhPJzxEEoo/pcYDZMOV4N414fYfqOlmoxKNZxbDuRFKK1KmSs2TGXymC53i/KVPXTVnDpF8ixE9gXUqIldDfHRo/I=
X-Received: by 2002:a25:5b04:: with SMTP id p4mr1908085ybb.34.1633575712677;
 Wed, 06 Oct 2021 20:01:52 -0700 (PDT)
MIME-Version: 1.0
References: <20211001205657.815551-1-surenb@google.com> <20211001205657.815551-3-surenb@google.com>
 <20211005184211.GA19804@duo.ucw.cz> <CAJuCfpE5JEThTMhwKPUREfSE1GYcTx4YSLoVhAH97fJH_qR0Zg@mail.gmail.com>
 <20211005200411.GB19804@duo.ucw.cz> <CAJuCfpFZkz2c0ZWeqzOAx8KFqk1ge3K-SiCMeu3dmi6B7bK-9w@mail.gmail.com>
 <efdffa68-d790-72e4-e6a3-80f2e194d811@nvidia.com> <YV1eCu0eZ+gQADNx@dhcp22.suse.cz>
 <6b15c682-72eb-724d-bc43-36ae6b79b91a@redhat.com> <CAJuCfpEPBM6ehQXgzp=g4SqtY6iaC8wuZ-CRE81oR1VOq7m4CA@mail.gmail.com>
 <192438ab-a095-d441-6843-432fbbb8e38a@redhat.com> <CAJuCfpH4KT=fOAWsYhaAb_LLg-VwPvL4Bmv32NYuUtZ3Ceo+PA@mail.gmail.com>
 <20211006192927.f7a735f1afe4182bf4693838@linux-foundation.org>
 <CAJuCfpGLQK5aVe5zQfdkP=K4NBZXPjtG=ycjk3E4D64CAvVPsg@mail.gmail.com> <20211006195342.0503b3a3cbcd2c3c3417df46@linux-foundation.org>
In-Reply-To: <20211006195342.0503b3a3cbcd2c3c3417df46@linux-foundation.org>
From:   Suren Baghdasaryan <surenb@google.com>
Date:   Wed, 6 Oct 2021 20:01:41 -0700
Message-ID: <CAJuCfpEZzrN+V2g4+RsRs5v3e60RGvXOCk_X9e3wWkeMBZProg@mail.gmail.com>
Subject: Re: [PATCH v10 3/3] mm: add anonymous vma name refcounting
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     David Hildenbrand <david@redhat.com>,
        Michal Hocko <mhocko@suse.com>,
        John Hubbard <jhubbard@nvidia.com>,
        Pavel Machek <pavel@ucw.cz>, Colin Cross <ccross@google.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Dave Hansen <dave.hansen@intel.com>,
        Kees Cook <keescook@chromium.org>,
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
        Chinwen Chang <chinwen.chang@mediatek.com>,
        Axel Rasmussen <axelrasmussen@google.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Jann Horn <jannh@google.com>, apopple@nvidia.com,
        Yu Zhao <yuzhao@google.com>, Will Deacon <will@kernel.org>,
        fenghua.yu@intel.com, thunder.leizhen@huawei.com,
        Hugh Dickins <hughd@google.com>, feng.tang@intel.com,
        Jason Gunthorpe <jgg@ziepe.ca>, Roman Gushchin <guro@fb.com>,
        Thomas Gleixner <tglx@linutronix.de>, krisman@collabora.com,
        Chris Hyser <chris.hyser@oracle.com>,
        Peter Collingbourne <pcc@google.com>,
        "Eric W. Biederman" <ebiederm@xmission.com>,
        Jens Axboe <axboe@kernel.dk>, legion@kernel.org,
        Rolf Eike Beer <eb@emlix.com>,
        Cyrill Gorcunov <gorcunov@gmail.com>,
        Muchun Song <songmuchun@bytedance.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Thomas Cedeno <thomascedeno@google.com>, sashal@kernel.org,
        cxfcosmos@gmail.com, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-mm <linux-mm@kvack.org>,
        kernel-team <kernel-team@android.com>,
        Tim Murray <timmurray@google.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Oct 6, 2021 at 7:53 PM Andrew Morton <akpm@linux-foundation.org> wrote:
>
> On Wed, 6 Oct 2021 19:46:57 -0700 Suren Baghdasaryan <surenb@google.com> wrote:
>
> > > > > > I wish it was that simple and for some names like [anon:.bss] or
> > > > > > [anon:dalvik-zygote space] reserving a unique id would work, however
> > > > > > some names like [anon:dalvik-/system/framework/boot-core-icu4j.art]
> > > > > > are generated dynamically at runtime and include package name.
> > > > >
> > > > > Valuable information
> > > >
> > > > Yeah, I should have described it clearer the first time around.
> > >
> > > If it gets this fancy then the 80 char limit is likely to become a
> > > significant limitation and the choice should be explained & justified.
> > >
> > > Why not 97?  1034?  Why not just strndup_user() and be done with it?
> >
> > The original patch from 8 years ago used 256 as the limit but Rasmus
> > argued that the string content should be human-readable, so 80 chars
> > seems to be a reasonable limit (see:
> > https://lore.kernel.org/all/d8619a98-2380-ca96-001e-60fe9c6204a6@rasmusvillemoes.dk),
> > which makes sense to me. We should be able to handle the 80 char limit
> > by trimming it before calling prctl().
>
> What's the downside to making it unlimited?

If we ignore the human-readability argument, I guess the possibility
of abuse and increased memory consumption? I'm guessing parsing such a
string is also easier if there is a known limit?

>
>
> --
> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
>
