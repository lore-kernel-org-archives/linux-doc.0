Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5624CC433EF
	for <linux-doc@archiver.kernel.org>; Thu,  7 Oct 2021 02:50:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2A41B6113E
	for <linux-doc@archiver.kernel.org>; Thu,  7 Oct 2021 02:50:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238858AbhJGCwp (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 6 Oct 2021 22:52:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38700 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232254AbhJGCwn (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 6 Oct 2021 22:52:43 -0400
Received: from mail-yb1-xb2e.google.com (mail-yb1-xb2e.google.com [IPv6:2607:f8b0:4864:20::b2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D5B1C061753
        for <linux-doc@vger.kernel.org>; Wed,  6 Oct 2021 19:50:50 -0700 (PDT)
Received: by mail-yb1-xb2e.google.com with SMTP id s4so9951090ybs.8
        for <linux-doc@vger.kernel.org>; Wed, 06 Oct 2021 19:50:50 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=4F/VUUoX5d9pLuj9va8DmcDC9EaYJA0ZhNF6WOHt3n8=;
        b=W4z+Ot2/rwfvUtqGOA0HqHFoPN/g2j2f12GEa+aPzxsQqWMDUSbzhdbl4QKDrE5ZEH
         uCF7VIMSREr8EXiPVqrejCQbJSVyY2YfWGFwWBoIrfj/BB6LCd9F9DVskFMoD9Ak5lyQ
         7OGOEDa1y4GOfsuzJV8OjddHLK7I2zWWrZ6LX9yavhM0d79aOGcrKB69ETdcrtkCp+vL
         eTLjv/V9P4VkKOZxo4oydFSm52hqgupfnZYFj3X3H0XUZw+yNpoBAiqlCXntoBX7AveU
         1ea1Tcel5OGxJeCtTyf8suXBuuZ9WvU7NB51pCaeC8wreksJH3D5S8qvwFjnytkmgNbt
         zkjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=4F/VUUoX5d9pLuj9va8DmcDC9EaYJA0ZhNF6WOHt3n8=;
        b=oUu0ZNl6HXuLMob2AQNT3tEgK6il/KlM8upLw3wfhAFyYRweAeQVZH/AwaSZNZ1ppI
         HZrfrkuqEivJJ21dMKV+GO0uyP5tLzFDSnCtfW7upRksiOMBzDQrR7Gli3HvSriNzyD2
         1CrLwyTp0ljyvP23rQwFE85CfPSKgqRkDKB9B3atu0IpiQGUcj6khj1Zs6yWMPDPOAoA
         0MB/F6N6kTmcQRmGD6EafcQWnqLOZnSe603HY9FoRNjfBJWLfuReajDwm2zk8cVEwI1O
         ZMKJ52J2mJIhoVyfchCS9Z24PmD2oxWZQPJZE+QbcQ7AwSVczzLq5Vf1ikX+csRgH2Bh
         f+Ug==
X-Gm-Message-State: AOAM532SLSPiCgSoJe35cEzwfI4ELWnsEzd8dyzvRFyfsy4U1vkeApG0
        2OLuK4v1IbI3A4gFZMMgp0oK1/vZTu9dfH/rsBcycw==
X-Google-Smtp-Source: ABdhPJwURhBGwIa2Mo2zsN2z5+HcTIt/J+M1PIauJMogSr896kv94sWKf2q7mONzOcq02flzV/NuzQLkoCDX8/08/9U=
X-Received: by 2002:a05:6902:120e:: with SMTP id s14mr2185756ybu.161.1633575049472;
 Wed, 06 Oct 2021 19:50:49 -0700 (PDT)
MIME-Version: 1.0
References: <20211001205657.815551-1-surenb@google.com> <20211001205657.815551-2-surenb@google.com>
 <20211001160830.700c36b32b736478000b3420@linux-foundation.org>
 <CAJuCfpGpMru4z=ZMezRQW56tHNjrWHU3jWhG3qzuXvuUytq-3w@mail.gmail.com>
 <CAJuCfpFWUXQ445VcqTcV1kNY3AWX=wB5iaeDAX_=+xZefjTUjg@mail.gmail.com> <20211006193940.c261f21fcd14b4b52aae1fbc@linux-foundation.org>
In-Reply-To: <20211006193940.c261f21fcd14b4b52aae1fbc@linux-foundation.org>
From:   Suren Baghdasaryan <surenb@google.com>
Date:   Wed, 6 Oct 2021 19:50:38 -0700
Message-ID: <CAJuCfpGMKPmVx8ADwFOyRPYfYKCuOHCUzr2o-vq0GZGSVj20Dw@mail.gmail.com>
Subject: Re: [PATCH v10 2/3] mm: add a field to store names for private
 anonymous memory
To:     Andrew Morton <akpm@linux-foundation.org>
Cc:     Colin Cross <ccross@google.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Michal Hocko <mhocko@suse.com>,
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
        John Hubbard <jhubbard@nvidia.com>,
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
        Pavel Machek <pavel@ucw.cz>,
        Muchun Song <songmuchun@bytedance.com>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Thomas Cedeno <thomascedeno@google.com>, sashal@kernel.org,
        cxfcosmos@gmail.com, Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        LKML <linux-kernel@vger.kernel.org>,
        linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-mm <linux-mm@kvack.org>,
        kernel-team <kernel-team@android.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Oct 6, 2021 at 7:39 PM Andrew Morton <akpm@linux-foundation.org> wrote:
>
> On Mon, 4 Oct 2021 09:21:42 -0700 Suren Baghdasaryan <surenb@google.com> wrote:
>
> > > > > The name pointers are not shared between vmas even if they contain the
> > > > > same name. The name pointer is stored in a union with fields that are
> > > > > only used on file-backed mappings, so it does not increase memory usage.
> > > > >
> > > > > The patch is based on the original patch developed by Colin Cross, more
> > > > > specifically on its latest version [1] posted upstream by Sumit Semwal.
> > > > > It used a userspace pointer to store vma names. In that design, name
> > > > > pointers could be shared between vmas. However during the last upstreaming
> > > > > attempt, Kees Cook raised concerns [2] about this approach and suggested
> > > > > to copy the name into kernel memory space, perform validity checks [3]
> > > > > and store as a string referenced from vm_area_struct.
> > > > > One big concern is about fork() performance which would need to strdup
> > > > > anonymous vma names. Dave Hansen suggested experimenting with worst-case
> > > > > scenario of forking a process with 64k vmas having longest possible names
> > > > > [4]. I ran this experiment on an ARM64 Android device and recorded a
> > > > > worst-case regression of almost 40% when forking such a process. This
> > > > > regression is addressed in the followup patch which replaces the pointer
> > > > > to a name with a refcounted structure that allows sharing the name pointer
> > > > > between vmas of the same name. Instead of duplicating the string during
> > > > > fork() or when splitting a vma it increments the refcount.
> > > >
> > > > Generally, the patch adds a bunch of code which a lot of users won't
> > > > want.  Did we bust a gut to reduce this impact?  Was a standalone
> > > > config setting considered?
> > >
> > > I didn't consider a standalone config for this feature because when
> > > not used it has no memory impact at runtime. As for the image size, I
> > > built Linus' ToT with and without this patchset with allmodconfig and
>
> allnoconfig would be more interesting.  People who want small kernels
> won't be using allmodconfig!

Sure, I will check that and report back.

>
> > > the sizes are:
> > > Without the patchset:
> > > $ size vmlinux
> > >    text    data     bss     dec     hex filename
> > > 40763556 58424519 29016228 128204303 7a43e0f vmlinux
> > >
> > > With the patchset:
> > > $ size vmlinux
> > >    text    data     bss     dec     hex filename
> > > 40765068 58424671 29016228 128205967 7a4448f vmlinux
> > >
> > > The increase seems quite small, so I'm not sure if it warrants a
> > > separate config option.
> >
> > Andrew, do you still think we need a separate CONFIG option? I fixed
> > the build issue when CONFIG_ADVISE_SYSCALLS=n and would like to post
> > the update but if you want to have a separate config then I can post
> > that together with the fix. Please let me know.
>
> I don't see much downside to the standalone option.  More complexity
> for developers/testers, I guess.  But such is life?

Sounds good to me. I will post a new version with a separate config if
we get over the objections of using numbers instead of strings.
Thanks!

>
> --
> To unsubscribe from this group and stop receiving emails from it, send an email to kernel-team+unsubscribe@android.com.
>
