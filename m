Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 88C09C433F5
	for <linux-doc@archiver.kernel.org>; Thu, 30 Sep 2021 18:56:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 648D360C4C
	for <linux-doc@archiver.kernel.org>; Thu, 30 Sep 2021 18:56:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343679AbhI3S6I (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 30 Sep 2021 14:58:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42710 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1343609AbhI3S6H (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 30 Sep 2021 14:58:07 -0400
Received: from mail-yb1-xb35.google.com (mail-yb1-xb35.google.com [IPv6:2607:f8b0:4864:20::b35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0ABD0C06176D
        for <linux-doc@vger.kernel.org>; Thu, 30 Sep 2021 11:56:25 -0700 (PDT)
Received: by mail-yb1-xb35.google.com with SMTP id z5so15524433ybj.2
        for <linux-doc@vger.kernel.org>; Thu, 30 Sep 2021 11:56:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=kvnWJDkfYff63dedYnGJTZjKEKtttIPMWbyKWd7jcys=;
        b=MszGudlzOc7y2MG5Azj1ge3Zo3H/LqnWaymyDtHDYs/NteFQibW/dGtvn9pUd/GVmz
         dXUSVvumzvTjZUnyRrk7AfBsc1+y7CD7RPdT7eJYe7EZ+pqt+g32fvP/vdEt8S6U4W5I
         JAx/jsNK74i/jP2lFaJFwh+YlQEcOEGR+Opiqs5pd32JCMWAYLBHKoW6Eti0j3vvQims
         OJBrZ7kdlHUALRmeGKU5vDZW+FCjkSkvraAmOeaP5Ep89KwGxX1QnW9y3lMRNf6Yg/iB
         r89sVxo6dhS5lweD4Z77UKiVnKYPID+Xuen3WRgMapVd0WDWAyazW8zmJacKqS6AjA5U
         2XZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=kvnWJDkfYff63dedYnGJTZjKEKtttIPMWbyKWd7jcys=;
        b=ppd30H7xJMpvJdiD+hEnaB/q8ELow5A+2nIEJ7GixvUNYcpoa7OJtAsWHoj0M+vAdT
         0fYLN6yfWFFAGgV66mIdbNnaZt3byNagrtxHWWem6TyG/VjMhJHyqQ/6Sr9ji5jRhyUa
         +bUePO10O8XEmSZlT9KErFvj78fitfcM3qCKyp6wkJXqlusefoTrwpuZwCaB7L05MyUK
         8l6dmL4GX/Lpos9SikUhgUatCygm6UMXuif5FcviTWRgtTgxDA1gzKH8nUFFX+C6idtw
         A5qFSiwyf7QMsFUpJhHJTFGKTxiha3eDlRc318LBnciLqbnx1l3ckxf157N37qgD4HXq
         I7rw==
X-Gm-Message-State: AOAM533Zhkg6vvcY6FPwQapoFxKZJXXSqduMAxwufSqcc+MKnEorwEWn
        7JRJll/O1JVhFAQi/kGxbAVVapO4i+iJQV1P8qyexg==
X-Google-Smtp-Source: ABdhPJy+eGHpLg+c8I2mOWSFvSs59/DdAVBUZvUKl74ku4b0DHYfhCqnG0lf7kkHt1XYSYoQfSszIPerFRm3qKyoAxA=
X-Received: by 2002:a05:6902:124f:: with SMTP id t15mr1118645ybu.161.1633028183843;
 Thu, 30 Sep 2021 11:56:23 -0700 (PDT)
MIME-Version: 1.0
References: <20210902231813.3597709-1-surenb@google.com> <20210902231813.3597709-2-surenb@google.com>
 <YTZIGhbSTghbUay+@casper.infradead.org> <CAJuCfpEYOC+6FPmVzzV2od3H8vqWVCsb1hiu5CiDS0-hSg6cfQ@mail.gmail.com>
In-Reply-To: <CAJuCfpEYOC+6FPmVzzV2od3H8vqWVCsb1hiu5CiDS0-hSg6cfQ@mail.gmail.com>
From:   Suren Baghdasaryan <surenb@google.com>
Date:   Thu, 30 Sep 2021 11:56:12 -0700
Message-ID: <CAJuCfpH8LtKG+1LpVb8JM73dL11yaqR7io8+HDHLGNUVZYVTQw@mail.gmail.com>
Subject: Re: [PATCH v9 2/3] mm: add a field to store names for private
 anonymous memory
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Colin Cross <ccross@google.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
        Michal Hocko <mhocko@suse.com>,
        Dave Hansen <dave.hansen@intel.com>,
        Kees Cook <keescook@chromium.org>,
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
        kernel-team <kernel-team@android.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Sep 8, 2021 at 9:05 PM Suren Baghdasaryan <surenb@google.com> wrote:
>
> On Mon, Sep 6, 2021 at 9:57 AM Matthew Wilcox <willy@infradead.org> wrote:
> >
> > On Thu, Sep 02, 2021 at 04:18:12PM -0700, Suren Baghdasaryan wrote:
> > > On Android we heavily use a set of tools that use an extended version of
> > > the logic covered in Documentation/vm/pagemap.txt to walk all pages mapped
> > > in userspace and slice their usage by process, shared (COW) vs.  unique
> > > mappings, backing, etc.  This can account for real physical memory usage
> > > even in cases like fork without exec (which Android uses heavily to share
> > > as many private COW pages as possible between processes), Kernel SamePage
> > > Merging, and clean zero pages.  It produces a measurement of the pages
> > > that only exist in that process (USS, for unique), and a measurement of
> > > the physical memory usage of that process with the cost of shared pages
> > > being evenly split between processes that share them (PSS).
> > >
> > > If all anonymous memory is indistinguishable then figuring out the real
> > > physical memory usage (PSS) of each heap requires either a pagemap walking
> > > tool that can understand the heap debugging of every layer, or for every
> > > layer's heap debugging tools to implement the pagemap walking logic, in
> > > which case it is hard to get a consistent view of memory across the whole
> > > system.
> > >
> > > Tracking the information in userspace leads to all sorts of problems.
> > > It either needs to be stored inside the process, which means every
> > > process has to have an API to export its current heap information upon
> > > request, or it has to be stored externally in a filesystem that
> > > somebody needs to clean up on crashes.  It needs to be readable while
> > > the process is still running, so it has to have some sort of
> > > synchronization with every layer of userspace.  Efficiently tracking
> > > the ranges requires reimplementing something like the kernel vma
> > > trees, and linking to it from every layer of userspace.  It requires
> > > more memory, more syscalls, more runtime cost, and more complexity to
> > > separately track regions that the kernel is already tracking.
> >
> > I understand that the information is currently incoherent, but why is
> > this the right way to make it coherent?  It would seem more useful to
> > use something like one of the tracing mechanisms (eg ftrace, LTTng,
> > whatever the current hotness is in userspace tracing) for the malloc
> > library to log all the useful information, instead of injecting a subset
> > of it into the kernel for userspace to read out again.
>
> Sorry, for the delay with the response. I'm travelling and my internet
> access is very patchy.
>
> Just to clarify, your suggestion is to require userspace to log any
> allocation using ftrace or a similar mechanism and then for the system
> to parse these logs to calculate the memory usage for each process?
> I didn't think much in this direction but I guess logging each
> allocation in the system and periodically collecting that data would
> be quite expensive both from memory usage and performance POV. I'll
> need to think a bit more but these are to me the obvious downsides of
> this approach.

Sorry for the delay again. Now that I'm back there should not be any
more of them.
I thought more about these alternative suggestions for userspace to
record allocations but that would introduce considerable complexity
into userspace. Userspace would have to collect and consolidate this
data by some daemon, all users would have to query it for the data
(IPC or something similar), in case this daemon crashes the data would
need to be somehow recovered. So, in short, it's possible but makes
things much more complex compared to proposed in-kernel
implementation.
OTOH, the only downside of the current implementation is the
additional memory required to store anon vma names. I checked the
memory consumption on the latest Android with these patches and
because we share vma names during fork, the actual memory required to
store vma names is no more than 600kB. Even on older phones like Pixel
3 with 4GB RAM, this is less than 0.015% of total memory. IMHO, this
is an acceptable price to pay.
