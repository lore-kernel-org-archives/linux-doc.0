Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 182B1C433EF
	for <linux-doc@archiver.kernel.org>; Fri, 15 Oct 2021 17:45:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id EA5AD611C1
	for <linux-doc@archiver.kernel.org>; Fri, 15 Oct 2021 17:45:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241802AbhJORrQ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 15 Oct 2021 13:47:16 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45526 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241630AbhJORrP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 15 Oct 2021 13:47:15 -0400
Received: from mail-pg1-x536.google.com (mail-pg1-x536.google.com [IPv6:2607:f8b0:4864:20::536])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E10E5C061570
        for <linux-doc@vger.kernel.org>; Fri, 15 Oct 2021 10:45:08 -0700 (PDT)
Received: by mail-pg1-x536.google.com with SMTP id 75so9246109pga.3
        for <linux-doc@vger.kernel.org>; Fri, 15 Oct 2021 10:45:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=l4qlclu2RIa4oxKpd1H+1z1yST7CZssZbBES01bC8pU=;
        b=cAOAcqa2nvyIYH0EqUubHMzpXLPqTCLfz9xXXZUr73uY/T9PXlYXrzSWM4agbNawT6
         UHxCgHfYfzOnRHuIvx9WP0OnZ8mbvAgQLzUM9uzvOQ9Fip6iBQ8ox7zgwXjDH2XjEKcN
         oWT/v3c7Vz8AVenh97wnyrnm+5OkVdfp4L2FE=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=l4qlclu2RIa4oxKpd1H+1z1yST7CZssZbBES01bC8pU=;
        b=S11hCVL783SzLL7hDm8QqKXTb2aZ0NtRaECJDNMFQvROO7VqR9tKfcODxFkBHvHnSq
         D+XLfvm/jctq/SBxNll/tyuuGjFbV3FzC3SyR3Y7K0Q/jftZ44ONZpdQZzP2bYvyxWn2
         uzP4b+a8d0v1YZ6NcqqEqGQORZEYsksCgntyY3G86k2vt1u9iOmV3Vcvp40fwu8f5N3T
         5aWEnaXe3f3rnflJ85aD1oqvvMWVJ9fXRl/N3qMRcgb87XXQNeRtfhPCMGbq9nB5FsOA
         KPbssDhBpoB0EnHjIWmoPcfLRekI5BI7PXVM2qAwie5w6IjZpEZFpvPRbjkfWcAvfybN
         N9+A==
X-Gm-Message-State: AOAM533A9iSgO+d+x/tKSJlAFQy5UJ2Eo4OJ+1fvIFJKSwIs1TgoC3os
        bRceYIQjVKJTz+sS61qdhQVQIA==
X-Google-Smtp-Source: ABdhPJwjRvl42xTYzqW8RUTxPJkRo3VNvT2r9xBa4I1xgxZ5olUh/8U0oh2VG71cExredtCSHa+qkw==
X-Received: by 2002:a05:6a00:731:b0:44c:7c1b:fe6a with SMTP id 17-20020a056a00073100b0044c7c1bfe6amr12970406pfm.44.1634319908311;
        Fri, 15 Oct 2021 10:45:08 -0700 (PDT)
Received: from www.outflux.net (smtp.outflux.net. [198.145.64.163])
        by smtp.gmail.com with ESMTPSA id s14sm5644591pfg.50.2021.10.15.10.45.07
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 10:45:07 -0700 (PDT)
Date:   Fri, 15 Oct 2021 10:45:06 -0700
From:   Kees Cook <keescook@chromium.org>
To:     Suren Baghdasaryan <surenb@google.com>
Cc:     David Hildenbrand <david@redhat.com>,
        Michal Hocko <mhocko@suse.com>, Pavel Machek <pavel@ucw.cz>,
        Rasmus Villemoes <linux@rasmusvillemoes.dk>,
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
Message-ID: <202110151002.059B2EAF@keescook>
References: <202110071111.DF87B4EE3@keescook>
 <YV/mhyWH1ZwWazdE@dhcp22.suse.cz>
 <202110081344.FE6A7A82@keescook>
 <YWP3c/bozz5npQ8O@dhcp22.suse.cz>
 <CAJuCfpHQVMM4+6Lm_EnFk06+KrOjSjGA19K2cv9GmP3k9LW5vg@mail.gmail.com>
 <26f9db1e-69e9-1a54-6d49-45c0c180067c@redhat.com>
 <CAJuCfpGTCM_Rf3GEyzpR5UOTfgGKTY0_rvAbGdtjbyabFhrRAw@mail.gmail.com>
 <CAJuCfpE2j91_AOwwRs_pYBs50wfLTwassRqgtqhXsh6fT+4MCg@mail.gmail.com>
 <b46d9bfe-17a9-0de9-271d-a3e6429e3f5f@redhat.com>
 <CAJuCfpG=fNMDuYUo8UwjB-kDzR2gxmRmTJCqgojfPe6RULwc4A@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAJuCfpG=fNMDuYUo8UwjB-kDzR2gxmRmTJCqgojfPe6RULwc4A@mail.gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Oct 15, 2021 at 09:30:09AM -0700, Suren Baghdasaryan wrote:
> On Fri, Oct 15, 2021 at 1:04 AM David Hildenbrand <david@redhat.com> wrote:
> >
> > On 14.10.21 22:16, Suren Baghdasaryan wrote:
> > > [...]
> > > 3. Leaves an fd exposed, even briefly, which may lead to unexpected
> > > flaws (e.g. anything using mmap MAP_SHARED could allow exposures or
> > > overwrites). Even MAP_PRIVATE, if an attacker writes into the file
> > > after ftruncate() and before mmap(), can cause private memory to be
> > > initialized with unexpected data.
> >
> > I don't quite follow. Can you elaborate what exactly the issue here is?
> > We use a temporary fd, yes, but how is that a problem?
> >
> > Any attacker can just write any random memory memory in the address
> > space, so I don't see the issue.
> 
> It feels to me that introducing another handle to the memory region is
> a potential attack vector but I'm not a security expert. Maybe Kees
> can assess this better?

This case is kind of just an extension of "we don't need an fd, we need
a name". There is a lot of resulting baggage suddenly added to using
anonymous VMA (fork overhead to deal with the fds, etc), but for me, this
particular situation above is what really demonstrates the "unexpected
side-effects" of trying to swap an anonymous mmap for a memfd: there is
now an _external handle_ attached to memory that doesn't pass through
any of the existing security boundaries normally associated with process
memory (i.e. ptrace). Here's the example race:

victim process			attacker process (same uid)
memfd_create(name, flags);
	-> /proc/$pid/fd/3
ftruncate(3, size);
				open("/proc/$victim/fd/3", O_RDWR)
					-> 3
				mmap(NULL, size,
				     PROT_READ | PROT_WRITE | PROT_EXEC,
				     MAP_SHARED, 3, 0);
					-> addr
				memset(addr, 0xFF, size);

mmap(NULL, size, prot,
     MAP_PRIVATE, 3, 0);
	-> addr
close(3);

surprise, addr[0] != 0x00

And again, yes, we could program defensively, but it's a surprising
situation with new corner cases that haven't been present for years of
Just Using Anon VMAs. :) I would be worried about other vectors we
haven't imagined yet.

So, I think between both the overhead of files and the expanded attack
surface make memfd unsuited for this use-case.

-Kees

-- 
Kees Cook
