Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BC3EC433EF
	for <linux-doc@archiver.kernel.org>; Fri, 11 Mar 2022 00:37:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233639AbiCKAix (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 10 Mar 2022 19:38:53 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44504 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231675AbiCKAiv (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 10 Mar 2022 19:38:51 -0500
Received: from mail-vs1-xe2e.google.com (mail-vs1-xe2e.google.com [IPv6:2607:f8b0:4864:20::e2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0B270E0B3
        for <linux-doc@vger.kernel.org>; Thu, 10 Mar 2022 16:37:49 -0800 (PST)
Received: by mail-vs1-xe2e.google.com with SMTP id v128so7888095vsb.8
        for <linux-doc@vger.kernel.org>; Thu, 10 Mar 2022 16:37:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc:content-transfer-encoding;
        bh=2LimIffJ+2+Hyyt6gnHQ4aWXqCPLYzM2e759iW7Bjvs=;
        b=mty1HpxRPn8/WTH88zZr9s6Y/9AXI8+ZtcAXwR/9jYzMRHoIgkazky9PnIXWRBLL6l
         a/S/hZsKCU0Nk0IRq/Rv5fahGNUE+EenmVeNpzrbcXsNf2AtS3gZyedkIpAYS1gYXqKL
         zinynolnVzRXP6jgATvA8yuhMPWBZ/ZlTL9PKGP0ODk3aMdgbmX/MU66KZ3dw0fyrYHR
         YI7ZkrsASQv6OLRNQ8beTXmxnJ+5zu22EipsaenH6yvjYgmXGW4alIKYyGYfMLmTe/ZQ
         m3DQKDMT0v3vSvOALsG4dN9ZvTfxewswnTzQjahtAr3WrfEuvSfXAo5u7d3Sep3EwoEx
         7Yqg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=2LimIffJ+2+Hyyt6gnHQ4aWXqCPLYzM2e759iW7Bjvs=;
        b=DTSXLdC35stOkMtcjd7zEzl+C1Q1qPtdq0NHbyfeMsGDWNABXmOQZk5F2KyraPUo/Q
         Zs9+h0PSsGH1jMg4c3U+QuvGvjeMBgrCFZesVhcXvgQQyB1uC9iMgM4TuFIASqIWYSuK
         D6liNohZOJpUp0tfHmnDQQPDJJpFgNbmtHZjSTyO0M4lKxRFi9ra1MwIwmXXEeshRUKC
         T2QmFP0yoG8Fns0Xxh9iddruSc6wkm8J+MkOp9KL50HzjeGdsqTwevGoyBNy2BBkC2D+
         twRmTaoN/4MQ0lACGlRm2mVLxYauLj7ISswS2HZtqdHJ9ft6qAKio46UvyyDJeLGpO2t
         lqiw==
X-Gm-Message-State: AOAM532AksmJaDdUTKFD9D7huoE6VmoHDev2k7zlYr3S165itAJEwxvy
        028srdPbCIWKqqF2yyKIIcYCe+54k/zdxzcxm4wr8w==
X-Google-Smtp-Source: ABdhPJwEZjiPQbHIsygGqzPp3H8aq0we/iEyH5B93eTNUR7mxTEl549bv+jWAgmUn9+GF3xxu2xt236nKnjQsePTdzc=
X-Received: by 2002:a05:6102:3a06:b0:31b:d9c6:c169 with SMTP id
 b6-20020a0561023a0600b0031bd9c6c169mr3806840vsu.22.1646959067809; Thu, 10 Mar
 2022 16:37:47 -0800 (PST)
MIME-Version: 1.0
References: <20220309021230.721028-1-yuzhao@google.com> <20220309021230.721028-14-yuzhao@google.com>
 <YinvPMIP4oEwCo6T@kernel.org>
In-Reply-To: <YinvPMIP4oEwCo6T@kernel.org>
From:   Yu Zhao <yuzhao@google.com>
Date:   Thu, 10 Mar 2022 17:37:36 -0700
Message-ID: <CAOUHufbYhRoiFgwbRpz7Ce5tfec7fbUEjk8b9Zty22jz9tN5TA@mail.gmail.com>
Subject: Re: [PATCH v9 13/14] mm: multi-gen LRU: admin guide
To:     Mike Rapoport <rppt@kernel.org>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Andi Kleen <ak@linux.intel.com>,
        Aneesh Kumar <aneesh.kumar@linux.ibm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Hillf Danton <hdanton@sina.com>, Jens Axboe <axboe@kernel.dk>,
        Jesse Barnes <jsbarnes@google.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Matthew Wilcox <willy@infradead.org>,
        Mel Gorman <mgorman@suse.de>,
        Michael Larabel <Michael@michaellarabel.com>,
        Michal Hocko <mhocko@kernel.org>,
        Rik van Riel <riel@surriel.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>,
        Ying Huang <ying.huang@intel.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>,
        Kernel Page Reclaim v2 <page-reclaim@google.com>,
        "the arch/x86 maintainers" <x86@kernel.org>,
        Brian Geffon <bgeffon@google.com>,
        Jan Alexander Steffens <heftig@archlinux.org>,
        Oleksandr Natalenko <oleksandr@natalenko.name>,
        Steven Barrett <steven@liquorix.net>,
        Suleiman Souhlal <suleiman@google.com>,
        Daniel Byrne <djbyrne@mtu.edu>,
        Donald Carr <d@chaos-reins.com>,
        =?UTF-8?Q?Holger_Hoffst=C3=A4tte?= <holger@applied-asynchrony.com>,
        Konstantin Kharlamov <Hi-Angel@yandex.ru>,
        Shuang Zhai <szhai2@cs.rochester.edu>,
        Sofia Trinh <sofia.trinh@edi.works>,
        Vaibhav Jain <vaibhav@linux.ibm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Mar 10, 2022 at 5:30 AM Mike Rapoport <rppt@kernel.org> wrote:
>
> Hi,
>
> On Tue, Mar 08, 2022 at 07:12:30PM -0700, Yu Zhao wrote:
> > Add an admin guide.
> >
> > Signed-off-by: Yu Zhao <yuzhao@google.com>
> > Acked-by: Brian Geffon <bgeffon@google.com>
> > Acked-by: Jan Alexander Steffens (heftig) <heftig@archlinux.org>
> > Acked-by: Oleksandr Natalenko <oleksandr@natalenko.name>
> > Acked-by: Steven Barrett <steven@liquorix.net>
> > Acked-by: Suleiman Souhlal <suleiman@google.com>
> > Tested-by: Daniel Byrne <djbyrne@mtu.edu>
> > Tested-by: Donald Carr <d@chaos-reins.com>
> > Tested-by: Holger Hoffst=C3=A4tte <holger@applied-asynchrony.com>
> > Tested-by: Konstantin Kharlamov <Hi-Angel@yandex.ru>
> > Tested-by: Shuang Zhai <szhai2@cs.rochester.edu>
> > Tested-by: Sofia Trinh <sofia.trinh@edi.works>
> > Tested-by: Vaibhav Jain <vaibhav@linux.ibm.com>
> > ---
> >  Documentation/admin-guide/mm/index.rst        |   1 +
> >  Documentation/admin-guide/mm/multigen_lru.rst | 146 ++++++++++++++++++
> >  mm/Kconfig                                    |   3 +-
> >  3 files changed, 149 insertions(+), 1 deletion(-)
> >  create mode 100644 Documentation/admin-guide/mm/multigen_lru.rst
> >
> > diff --git a/Documentation/admin-guide/mm/index.rst b/Documentation/adm=
in-guide/mm/index.rst
> > index c21b5823f126..2cf5bae62036 100644
> > --- a/Documentation/admin-guide/mm/index.rst
> > +++ b/Documentation/admin-guide/mm/index.rst
> > @@ -32,6 +32,7 @@ the Linux memory management.
> >     idle_page_tracking
> >     ksm
> >     memory-hotplug
> > +   multigen_lru
> >     nommu-mmap
> >     numa_memory_policy
> >     numaperf
> > diff --git a/Documentation/admin-guide/mm/multigen_lru.rst b/Documentat=
ion/admin-guide/mm/multigen_lru.rst
> > new file mode 100644
> > index 000000000000..4ea6a801dc56
> > --- /dev/null
> > +++ b/Documentation/admin-guide/mm/multigen_lru.rst
> > @@ -0,0 +1,146 @@
> > +.. SPDX-License-Identifier: GPL-2.0
> > +
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +Multi-Gen LRU
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>
> I'm still missing an opening paragraph the explains what is Multi-gen LRU
> and why users would want it.
>
> Something like
>
>   Multi-gen LRU is an efficient mechanism for page reclamation.
>
> More details are of course welcome :)

I've add the following for the next spin:

+Page reclaim decides the kernel's caching policy and ability to
+overcommit memory. It directly impacts the kswapd CPU usage and RAM
+efficiency. Multi-gen LRU aims to optimize page reclaim and improve
+performance under memory pressure.

> > +Quick start
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +Build the kernel with the following configurations.
> > +
> > +* ``CONFIG_LRU_GEN=3Dy``
> > +* ``CONFIG_LRU_GEN_ENABLED=3Dy``
> > +
> > +All set!
> > +
> > +Runtime options
> > +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +``/sys/kernel/mm/lru_gen/`` contains stable ABIs described in the
> > +following subsections.
> > +
> > +Kill switch
> > +-----------
> > +``enable`` accepts different values to enable or disabled the
>
>                                                    ^ disable

Good catch. Will fix it up.

> > +following components. The default value of this file depends on
> > +``CONFIG_LRU_GEN_ENABLED``. All the components should be enabled
> > +unless some of them have unforeseen side effects. Writing to
> > +``enable`` has no effect when a component is not supported by the
> > +hardware, and valid values will be accepted even when the main switch
> > +is off.
> > +
> > +=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +Values Components
> > +=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +0x0001 The main switch for the multi-gen LRU.
> > +0x0002 Clearing the accessed bit in leaf page table entries in large
> > +       batches, when MMU sets it (e.g., on x86). This behavior can
> > +       theoretically worsen lock contention (mmap_lock). If it is
> > +       disabled, the multi-gen LRU will suffer a minor performance
> > +       degradation.
> > +0x0004 Clearing the accessed bit in non-leaf page table entries as
> > +       well, when MMU sets it (e.g., on x86). This behavior was not
> > +       verified on x86 varieties other than Intel and AMD. If it is
> > +       disabled, the multi-gen LRU will suffer a negligible
> > +       performance degradation.
> > +[yYnN] Apply to all the components above.
> > +=3D=3D=3D=3D=3D=3D =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> > +
> > +E.g.,
> > +::
> > +
> > +    echo y >/sys/kernel/mm/lru_gen/enabled
> > +    cat /sys/kernel/mm/lru_gen/enabled
> > +    0x0007
> > +    echo 5 >/sys/kernel/mm/lru_gen/enabled
> > +    cat /sys/kernel/mm/lru_gen/enabled
> > +    0x0005
> > +
> > +Thrashing prevention
> > +--------------------
> > +Personal computers are more sensitive to thrashing because it can
> > +cause janks (lags when rendering UI) and negatively impact user
> > +experience. The multi-gen LRU offers thrashing prevention to the
> > +majority of laptop and desktop users who do not have ``oomd``.
> > +
> > +Users can write ``N`` to ``min_ttl_ms`` to prevent the working set of
> > +``N`` milliseconds from getting evicted. The OOM killer is triggered
> > +if this working set cannot be kept in memory. In other words, this
> > +option works as an adjustable pressure relief valve, and when open, it
> > +terminates applications that are hopefully not being used.
> > +
> > +Based on the average human detectable lag (~100ms), ``N=3D1000`` usual=
ly
> > +eliminates intolerable janks due to thrashing. Larger values like
> > +``N=3D3000`` make janks less noticeable at the risk of premature OOM
> > +kills.
>
> What is the default value of min_ttl_ms?

Right. I've added the following for the next spin:

+The default value ``0`` means disabled.
