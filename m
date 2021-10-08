Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AC0EEC433F5
	for <linux-doc@archiver.kernel.org>; Fri,  8 Oct 2021 20:58:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8DC7E60F44
	for <linux-doc@archiver.kernel.org>; Fri,  8 Oct 2021 20:58:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243192AbhJHU77 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 8 Oct 2021 16:59:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52626 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231702AbhJHU77 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 8 Oct 2021 16:59:59 -0400
Received: from mail-pg1-x52c.google.com (mail-pg1-x52c.google.com [IPv6:2607:f8b0:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4575BC061570
        for <linux-doc@vger.kernel.org>; Fri,  8 Oct 2021 13:58:03 -0700 (PDT)
Received: by mail-pg1-x52c.google.com with SMTP id a73so4283195pge.0
        for <linux-doc@vger.kernel.org>; Fri, 08 Oct 2021 13:58:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=IjJJiWQU/XhRbwSW4a6J5pEI82Dwvbf4Msp/9IsGztA=;
        b=fuF/48s/XKLjw/WxekTae8fxsnWdv9YZmnzgUBVcpUj7wDFyoAh9dbVeWHwfDtkKDu
         RiFV0cdkUHd/WrfAjkgqUH34GYwNOU8Km6wcNGt+b1nCWLn47S0Ft8Xq1zZt+StdVMvU
         jBfM3LscUBzEFw2GiqY3yuUIwXQjskDaNCMz4=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=IjJJiWQU/XhRbwSW4a6J5pEI82Dwvbf4Msp/9IsGztA=;
        b=K1svyAm2ajo3GPPH7UKAc4QxQcdjCgX9YN9G0z+kFNVHaMOD8E1VuJ+FoEjw220158
         +10kS5VdqIizadSyjlip0Xwhy2I/5wgs2fOzr9eXLlWHEpSBI5v8QaxrN0eyQmrdAUer
         5EG3Z42Fz7+Y2L3wmH+/MfMua+VJNcowb7QqZU32oIQldQAm9xtrvkvO271E14XsbPpp
         lOXi81aidfj1tD+BdXXYRZgjh6TU0KyAlblU74vWn67jsoqWj3rOaFeAkJU/7Htwdss5
         vKJlavrS9gGw3UTi4IuDWWw2+XLiseMfwQbOzvssOJIVqRGH0F5IvY8LGBtt4s4zK0Z/
         uZIw==
X-Gm-Message-State: AOAM5337qdpytHUFR5TOK8l20LxI/OXjObLA11N6b2nYr/pvOJ6606yQ
        zWDIBd/cTCC8bwHzxUyjcovIZQ==
X-Google-Smtp-Source: ABdhPJyrGB7dBpiaDnYPnJIbaaQdWSM4FfIArdEe62p0xJjdD6l8chOBq8mOvXFxCXKn2tBgDNxRKA==
X-Received: by 2002:a63:d2:: with SMTP id 201mr6488991pga.400.1633726682737;
        Fri, 08 Oct 2021 13:58:02 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id b1sm222008pfm.38.2021.10.08.13.58.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 08 Oct 2021 13:58:02 -0700 (PDT)
Date:   Fri, 8 Oct 2021 13:58:01 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Michal Hocko <mhocko@suse.com>
Cc:     Suren Baghdasaryan <surenb@google.com>,
        Pavel Machek <pavel@ucw.cz>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
        David Hildenbrand <david@redhat.com>,
        John Hubbard <jhubbard@nvidia.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Colin Cross <ccross@google.com>,
        Sumit Semwal <sumit.semwal@linaro.org>,
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
        Chinwen Chang =?utf-8?B?KOW8temMpuaWhyk=?= 
        <chinwen.chang@mediatek.com>,
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
        cxfcosmos@gmail.com, LKML <linux-kernel@vger.kernel.org>,
        linux-fsdevel@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-mm <linux-mm@kvack.org>,
        kernel-team <kernel-team@android.com>
Subject: Re: [PATCH v10 3/3] mm: add anonymous vma name refcounting
Message-ID: <202110081344.FE6A7A82@keescook>
References: <YV6rksRHr2iSWR3S@dhcp22.suse.cz>
 <92cbfe3b-f3d1-a8e1-7eb9-bab735e782f6@rasmusvillemoes.dk>
 <20211007101527.GA26288@duo.ucw.cz>
 <CAJuCfpGp0D9p3KhOWhcxMO1wEbo-J_b2Anc-oNwdycx4NTRqoA@mail.gmail.com>
 <YV8jB+kwU95hLqTq@dhcp22.suse.cz>
 <CAJuCfpG-Nza3YnpzvHaS_i1mHds3nJ+PV22xTAfgwvj+42WQNA@mail.gmail.com>
 <YV8u4B8Y9AP9xZIJ@dhcp22.suse.cz>
 <CAJuCfpHAG_C5vE-Xkkrm2kynTFF-Jd06tQoCWehHATL0W2mY_g@mail.gmail.com>
 <202110071111.DF87B4EE3@keescook>
 <YV/mhyWH1ZwWazdE@dhcp22.suse.cz>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <YV/mhyWH1ZwWazdE@dhcp22.suse.cz>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Oct 08, 2021 at 08:34:47AM +0200, Michal Hocko wrote:
> I am sorry but there were no strong arguments mentioned for strings so
> far. Effectively string require a more complex and more resource hungry
> solution. The only advantage is that strings are nicer to read for
> humans.

How I see it:

- Strings are already present in the "maps" output, so this doesn't
  create a burden on userspace to grow new parsers.

- Strings for "anon" specifically have no required format (this is good)
  it's informational like the task_struct::comm and can (roughly)
  anything. There's no naming convention for memfds, AF_UNIX, etc. Why
  is one needed here? That seems like a completely unreasonable
  requirement.

- Strings need to be in kernel space because cross-process GUP has been a
  constant source of security flaws.

> There hasn't been any plan presented for actual naming convention or how
> those names would be used in practice. Except for a more advanced
> resource management and that sounds like something that can work with
> ids just fine.

There doesn't need to be and there shouldn't be. Why aren't memfds names
an id? Because, to quote the man-page, "... serves only for debugging
purposes. Names do not affect the behavior of the file descriptor, and
as such multiple files can have the same name without any side effects."

And they aren't filtered _at all_ either. I think the anonymous vma name
series has gone out of its way to be safe and sane while still providing
the ease-of-use that it was designed to provide.

> Initially I was not really feeling strongly one way or other but more we
> are discussing the topic the more I see that strings have a very weak
> justification behind.

I just don't see any _down_ side to gaining this. There's only resource
utilization when it's used, and the complexity is minimal.

-- 
Kees Cook
