Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D9075C433F5
	for <linux-doc@archiver.kernel.org>; Thu,  7 Oct 2021 15:42:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BBBF7610E6
	for <linux-doc@archiver.kernel.org>; Thu,  7 Oct 2021 15:42:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234337AbhJGPo0 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 7 Oct 2021 11:44:26 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44910 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233486AbhJGPo0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 7 Oct 2021 11:44:26 -0400
Received: from mail-yb1-xb32.google.com (mail-yb1-xb32.google.com [IPv6:2607:f8b0:4864:20::b32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7FD05C061755
        for <linux-doc@vger.kernel.org>; Thu,  7 Oct 2021 08:42:32 -0700 (PDT)
Received: by mail-yb1-xb32.google.com with SMTP id g6so14387568ybb.3
        for <linux-doc@vger.kernel.org>; Thu, 07 Oct 2021 08:42:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Vlar6Cpk8FMyDmzR6kojX5u1Q4wI3iurHkOrDEyZ+tg=;
        b=cmq4sjqDQok/4KxsFCxUkk9uUjfHlLxtyjWkxHQGtzIBTrIVFFXA500G7/LK7k7nIk
         BUEvNt+xYoyFPujGUFiJkIoJi9W7SAaP0mDoD5meAKh2lS6Zh1XOCzznx2FfZg0FT7Ag
         2SEatuWQgxkri0VXJyfyrvf2M+deg74+qLz/0sJ9/FZMYVg2yn5ELyHbB2qDZakEpPis
         UHlTiPe/EvNXYM9rke+8CesJrIiYoJytR6Poemu3GuEBZa0t3XJzK98fjNFXYGa4SmBs
         2lWzudueNw2yi3ebMwzZ3btjk6rGEmlA1IMYTdO4GbR8ClQKqrYfN9AkVxUs7UGy58C6
         +ycw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Vlar6Cpk8FMyDmzR6kojX5u1Q4wI3iurHkOrDEyZ+tg=;
        b=J/jW3FBQ0psfkRBKHDaNH6F/ipGsht/qnGXF38hUhWvy0ADzi6iP0ZadDaTJpzocI/
         N3JwD8V3Zt0vPqXRk6JPzxkAMMzeyWu9E+cQ4skRxq0rcdF06dCDrcj8s4s6hyQk+51h
         zD4blKCkYSowTSU0/e7nKShlxqvLFAaWJiOnzuokCdVYqFNLu8FLSPQCI9ptVsRM8wxy
         9bQ8zKjbBOgVSR2JmqL5Dd4bK3MfGnpZegCCuCB9aWmrzDhy5DBWwSqE0YxkGtMExemM
         Ev90Hp+wv0uphbJsMv8s75VpYO2wNw3opJxeFvO9sTsSuJQIn3/h9eNcJiCdvIJNtHJg
         Jh4Q==
X-Gm-Message-State: AOAM532coq2EVxeUffnx6gO3eO9/0X57xjqjyx+Yl0gZ6KUXv+hpNdFo
        uFPE5h9lnQ48fYSPX/5lhUa21Bc7ZMi9Kg21HtjdtQ==
X-Google-Smtp-Source: ABdhPJzXrozzQndVXvR8NLw9OC068+2VH2pISi5g5Fq0jEtqksTI9lHimoZuNQbEsasUZ55ba8tIP82w/AieCwfl4nM=
X-Received: by 2002:a25:3:: with SMTP id 3mr5602512yba.418.1633621351461; Thu,
 07 Oct 2021 08:42:31 -0700 (PDT)
MIME-Version: 1.0
References: <20211001205657.815551-1-surenb@google.com> <20211001205657.815551-3-surenb@google.com>
 <20211005184211.GA19804@duo.ucw.cz> <CAJuCfpE5JEThTMhwKPUREfSE1GYcTx4YSLoVhAH97fJH_qR0Zg@mail.gmail.com>
 <20211005200411.GB19804@duo.ucw.cz> <CAJuCfpFZkz2c0ZWeqzOAx8KFqk1ge3K-SiCMeu3dmi6B7bK-9w@mail.gmail.com>
 <efdffa68-d790-72e4-e6a3-80f2e194d811@nvidia.com> <YV1eCu0eZ+gQADNx@dhcp22.suse.cz>
 <6b15c682-72eb-724d-bc43-36ae6b79b91a@redhat.com> <CAJuCfpEPBM6ehQXgzp=g4SqtY6iaC8wuZ-CRE81oR1VOq7m4CA@mail.gmail.com>
 <192438ab-a095-d441-6843-432fbbb8e38a@redhat.com> <CAJuCfpH4KT=fOAWsYhaAb_LLg-VwPvL4Bmv32NYuUtZ3Ceo+PA@mail.gmail.com>
 <cb910cf1-1463-8c4f-384e-8b0096a0e01f@redhat.com>
In-Reply-To: <cb910cf1-1463-8c4f-384e-8b0096a0e01f@redhat.com>
From:   Suren Baghdasaryan <surenb@google.com>
Date:   Thu, 7 Oct 2021 08:42:20 -0700
Message-ID: <CAJuCfpHf=VAWzxFOHHgrL8aOZuwM91VtYDQtJPXKdyOo+ucnPQ@mail.gmail.com>
Subject: Re: [PATCH v10 3/3] mm: add anonymous vma name refcounting
To:     David Hildenbrand <david@redhat.com>
Cc:     Michal Hocko <mhocko@suse.com>, John Hubbard <jhubbard@nvidia.com>,
        Pavel Machek <pavel@ucw.cz>,
        Andrew Morton <akpm@linux-foundation.org>,
        Colin Cross <ccross@google.com>,
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
        =?UTF-8?B?Q2hpbndlbiBDaGFuZyAo5by16Yym5paHKQ==?= 
        <chinwen.chang@mediatek.com>,
        Axel Rasmussen <axelrasmussen@google.com>,
        Andrea Arcangeli <aarcange@redhat.com>,
        Jann Horn <jannh@google.com>, apopple@nvidia.com,
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

On Thu, Oct 7, 2021 at 12:33 AM David Hildenbrand <david@redhat.com> wrote:
>
> On 06.10.21 17:20, Suren Baghdasaryan wrote:
> > On Wed, Oct 6, 2021 at 8:08 AM David Hildenbrand <david@redhat.com> wrote:
> >>
> >> On 06.10.21 17:01, Suren Baghdasaryan wrote:
> >>> On Wed, Oct 6, 2021 at 2:27 AM David Hildenbrand <david@redhat.com> wrote:
> >>>>
> >>>> On 06.10.21 10:27, Michal Hocko wrote:
> >>>>> On Tue 05-10-21 23:57:36, John Hubbard wrote:
> >>>>> [...]
> >>>>>> 1) Yes, just leave the strings in the kernel, that's simple and
> >>>>>> it works, and the alternatives don't really help your case nearly
> >>>>>> enough.
> >>>>>
> >>>>> I do not have a strong opinion. Strings are easier to use but they
> >>>>> are more involved and the necessity of kref approach just underlines
> >>>>> that. There are going to be new allocations and that always can lead
> >>>>> to surprising side effects.  These are small (80B at maximum) so the
> >>>>> overall footpring shouldn't all that large by default but it can grow
> >>>>> quite large with a very high max_map_count. There are workloads which
> >>>>> really require the default to be set high (e.g. heavy mremap users). So
> >>>>> if anything all those should be __GFP_ACCOUNT and memcg accounted.
> >>>>>
> >>>>> I do agree that numbers are just much more simpler from accounting,
> >>>>> performance and implementation POV.
> >>>>
> >>>> +1
> >>>>
> >>>> I can understand that having a string can be quite beneficial e.g., when
> >>>> dumping mmaps. If only user space knows the id <-> string mapping, that
> >>>> can be quite tricky.
> >>>>
> >>>> However, I also do wonder if there would be a way to standardize/reserve
> >>>> ids, such that a given id always corresponds to a specific user. If we
> >>>> use an uint64_t for an id, there would be plenty room to reserve ids ...
> >>>>
> >>>> I'd really prefer if we can avoid using strings and instead using ids.
> >>>
> >>> I wish it was that simple and for some names like [anon:.bss] or
> >>> [anon:dalvik-zygote space] reserving a unique id would work, however
> >>> some names like [anon:dalvik-/system/framework/boot-core-icu4j.art]
> >>> are generated dynamically at runtime and include package name.
> >>
> >> Valuable information
> >
> > Yeah, I should have described it clearer the first time around.
> >
> >>
> >>> Packages are constantly evolving, new ones are developed, names can
> >>> change, etc. So assigning a unique id for these names is not really
> >>> feasible.
> >>
> >> So, you'd actually want to generate/reserve an id for a given string at
> >> runtime, assign that id to the VMA, and have a way to match id <->
> >> string somehow?
> >
> > If we go with ids then yes, that is what we would have to do.
> >
> >> That reservation service could be inside the kernel or even (better?) in
> >> user space. The service could for example de-duplicates strings.
> >
> > Yes but it would require an IPC call to that service potentially on
> > every mmap() when we want to name a mapped vma. This would be
> > prohibitive. Even on consumption side, instead of just dumping
> > /proc/$pid/maps we would have to parse the file and convert all
> > [anon:id] into [anon:name] with each conversion requiring an IPC call
> > (assuming no id->name pair caching on the client side).
>
> mmap() and prctl() already do take the mmap sem in write, so they are
> not the "most lightweight" operations so to say.
>
> We already to have two separate operations, first the mmap(), then the
> prctl(). IMHO you could defer the "naming" part to a later point in
> time, without creating too many issues, moving it out of the
> "hot/performance critical phase"
>
> Reading https://lwn.net/Articles/867818/, to me it feels like the use
> case could live with a little larger delay between the mmap popping up
> and a name getting assigned.

That might be doable if occasional inconsistency can be tolerated (we
can't guarantee that maps won't be read before the deferred work name
the vma). However I would prefer an efficient solution vs the one
which is inefficient but can be deferred.

>
> --
> Thanks,
>
> David / dhildenb
>
