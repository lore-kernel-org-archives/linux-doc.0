Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 72516C433EF
	for <linux-doc@archiver.kernel.org>; Fri, 15 Apr 2022 20:12:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352361AbiDOUOl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 15 Apr 2022 16:14:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S239750AbiDOUOk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 15 Apr 2022 16:14:40 -0400
Received: from mail-vs1-xe2f.google.com (mail-vs1-xe2f.google.com [IPv6:2607:f8b0:4864:20::e2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C9C9CDD959
        for <linux-doc@vger.kernel.org>; Fri, 15 Apr 2022 13:12:10 -0700 (PDT)
Received: by mail-vs1-xe2f.google.com with SMTP id z139so2415065vsz.0
        for <linux-doc@vger.kernel.org>; Fri, 15 Apr 2022 13:12:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=77JRexCHO+Dta+d2jV7L61UaG98jtgCgEk5PjH0Qclw=;
        b=bSiip5XBN84sfc8EAMqB+8gWFrwJVQUR5v12Hj7kiLzo35u6nluGLhefFhs00QbZRR
         HT4dBU715eLd92x4QRczO0YgkhjNxz3mbNszIssovkBmykUjqSngT3NhjHLZppusWtw2
         3VOElStHDME19hWWY/06fkmPmCkj5TnXUWGNcJQXPiJhcRrGDX5PvA5W08q9+LL7+ZMB
         C5beDV70lv/ySj0n0+lK3jQG8IwFVL1pffbX7W9VSy4IFCCsXe/mWHDHkdzqPIAHcSfV
         qLrxfXPGfbXfENwPzH7NDV5JMI1paK0Thm/w2BDYLElxNTp4+B8HZdGbZSMnPMcpSwlV
         c0rQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=77JRexCHO+Dta+d2jV7L61UaG98jtgCgEk5PjH0Qclw=;
        b=uxX9jB1MNTBiYFy603uHUGyI8+cAE0aKnKmMwCpEdJFLH+vgZpz/YkK3+axkWKmazX
         djbm1ScNtI4VI9hKhg1lis7bqT6zZxZe0O11ZDIkzfHyh0atS7URt0ogHMvNznYsJeHv
         vLimwvDctQiOlWgmWvnS5H+e+K/P7sS9/qx3Ze3bVpdifXNpUjJ/iss65805jIo6wHsc
         KXEzSjbKRY3HaUKTB/ACCiN2atiTqa6h0B+BrNgyuPyEAqlqat8D2G1+GGk9hIKNMceF
         mWs5Oc9cdIGqsR/GYjOaNGbOeps156ymO1pt7fYlJkpM88HmEN1OaE7GehwhV4aaAsJz
         wiIQ==
X-Gm-Message-State: AOAM530HPxHOF0+9jVaS2ugnMGk4EeflZ6TMJc+jc19j3iYnVoteyP5g
        /I4mqrN1xsmY3m8k0PO5r6aBd2l8pTaFoBG0c/oQfw==
X-Google-Smtp-Source: ABdhPJykqcrKHyXgb08sa7ibqLGNVlW1gdYVPxs3ydRjRchU0Lalyvg1ICTkwCfmsXRhMCN3MYBNGKoe6YsDKcJnXHw=
X-Received: by 2002:a05:6102:5cc:b0:320:9bd2:3823 with SMTP id
 v12-20020a05610205cc00b003209bd23823mr192562vsf.81.1650053529747; Fri, 15 Apr
 2022 13:12:09 -0700 (PDT)
MIME-Version: 1.0
References: <20220407031525.2368067-1-yuzhao@google.com> <20220407031525.2368067-9-yuzhao@google.com>
 <20220411191621.0378467ad99ebc822d5ad005@linux-foundation.org>
 <CAOUHufYeC=Kuu59BPL_48sM67CqACxH2wWy-SYGXpadgMDmY3w@mail.gmail.com>
 <20220414185654.e7150bcbe859e0dd4b9c61af@linux-foundation.org>
 <CAOUHufYy6yQS9ARN9C5+ODkopR+ez4TH3hZNZo4HtNHBExS1mA@mail.gmail.com> <20220415121521.764a88dda55ae8c676ad26b0@linux-foundation.org>
In-Reply-To: <20220415121521.764a88dda55ae8c676ad26b0@linux-foundation.org>
From:   Yu Zhao <yuzhao@google.com>
Date:   Fri, 15 Apr 2022 14:11:32 -0600
Message-ID: <CAOUHufYsjwMGMFCfYoh79rFZqwqS1jDihcBS9sHd-gBxEAD3Ug@mail.gmail.com>
Subject: Re: [PATCH v10 08/14] mm: multi-gen LRU: support page table walks
To:     Andrew Morton <akpm@linux-foundation.org>,
        Justin Forbes <jforbes@fedoraproject.org>
Cc:     Stephen Rothwell <sfr@rothwell.id.au>,
        Linux-MM <linux-mm@kvack.org>, Andi Kleen <ak@linux.intel.com>,
        Aneesh Kumar <aneesh.kumar@linux.ibm.com>,
        Barry Song <21cnbao@gmail.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Hillf Danton <hdanton@sina.com>, Jens Axboe <axboe@kernel.dk>,
        Jesse Barnes <jsbarnes@google.com>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Matthew Wilcox <willy@infradead.org>,
        Mel Gorman <mgorman@suse.de>,
        Michael Larabel <Michael@michaellarabel.com>,
        Michal Hocko <mhocko@kernel.org>,
        Mike Rapoport <rppt@kernel.org>,
        Rik van Riel <riel@surriel.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>,
        Ying Huang <ying.huang@intel.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        linux-kernel <linux-kernel@vger.kernel.org>,
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
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Apr 15, 2022 at 1:15 PM Andrew Morton <akpm@linux-foundation.org> wrote:
>
> On Fri, 15 Apr 2022 00:25:45 -0600 Yu Zhao <yuzhao@google.com> wrote:
>
> > On Thu, Apr 14, 2022 at 7:57 PM Andrew Morton <akpm@linux-foundation.org> wrote:
> > >
> > > On Thu, 14 Apr 2022 19:14:54 -0600 Yu Zhao <yuzhao@google.com> wrote:
> > >
> > > > On Mon, Apr 11, 2022 at 8:16 PM Andrew Morton <akpm@linux-foundation.org> wrote:
> > > > >
> > > > > On Wed,  6 Apr 2022 21:15:20 -0600 Yu Zhao <yuzhao@google.com> wrote:
> > > > >
> > > > > > +static void update_batch_size(struct lru_gen_mm_walk *walk, struct folio *folio,
> > > > > > +                           int old_gen, int new_gen)
> > > > > > +{
> > > > > > +     int type = folio_is_file_lru(folio);
> > > > > > +     int zone = folio_zonenum(folio);
> > > > > > +     int delta = folio_nr_pages(folio);
> > > > > > +
> > > > > > +     VM_BUG_ON(old_gen >= MAX_NR_GENS);
> > > > > > +     VM_BUG_ON(new_gen >= MAX_NR_GENS);
> > > > >
> > > > > General rule: don't add new BUG_ONs, because they crash the kenrel.
> > > > > It's better to use WARN_ON or WARN_ON_ONCE then try to figure out a way
> > > > > to keep the kernel limping along.  At least so the poor user can gather logs.
> > > >
> > > > These are VM_BUG_ONs, which are BUILD_BUG_ONs except for (mostly MM) developers.
> > >
> > > I'm told that many production builds enable runtime VM_BUG_ONning.
> >
> > Nobody wants to debug VM in production. Some distros that offer both
> > the latest/LTS kernels do enable CONFIG_DEBUG_VM in the former so the
> > latter can have better test coverage when it becomes available. Do
> > people use the former in production? Absolutely, otherwise we won't
> > have enough test coverage. Are we supposed to avoid CONFIG_DEBUG_VM? I
> > don't think so, because it defeats the purpose of those distros
> > enabling it in the first place.
> >
> > The bottomline is that none of RHEL 8.5, SLES 15, Debian 11 enables
> > CONFIG_DEBUG_VM.
>
> I grabbed
> https://kojipkgs.fedoraproject.org//packages/kernel/5.18.0/0.rc2.23.fc37/src/kernel-5.18.0-0.rc2.23.fc37.src.rpm
> and

Yes, Fedora/RHEL is one concrete example of the model I mentioned
above (experimental/stable). I added Justin, the Fedora kernel
maintainer, and he can further clarify.

If we don't want more VM_BUG_ONs, I'll remove them. But (let me
reiterate) it seems to me that just defeats the purpose of having
CONFIG_DEBUG_VM.

> hp2:/home/akpm/yy> grep "DEBUG_VM[= ]" *.config
> kernel-aarch64-debug-fedora.config:CONFIG_DEBUG_VM=y
> kernel-aarch64-debug-rhel.config:# CONFIG_DEBUG_VM is not set
> kernel-aarch64-fedora.config:CONFIG_DEBUG_VM=y
> kernel-aarch64-rhel.config:# CONFIG_DEBUG_VM is not set
> kernel-armv7hl-debug-fedora.config:CONFIG_DEBUG_VM=y
> kernel-armv7hl-fedora.config:CONFIG_DEBUG_VM=y
> kernel-armv7hl-lpae-debug-fedora.config:CONFIG_DEBUG_VM=y
> kernel-armv7hl-lpae-fedora.config:CONFIG_DEBUG_VM=y
> kernel-ppc64le-debug-fedora.config:CONFIG_DEBUG_VM=y
> kernel-ppc64le-debug-rhel.config:CONFIG_DEBUG_VM=y
> kernel-ppc64le-fedora.config:CONFIG_DEBUG_VM=y
> kernel-ppc64le-rhel.config:# CONFIG_DEBUG_VM is not set
> kernel-s390x-debug-fedora.config:CONFIG_DEBUG_VM=y
> kernel-s390x-debug-rhel.config:CONFIG_DEBUG_VM=y
> kernel-s390x-fedora.config:CONFIG_DEBUG_VM=y
> kernel-s390x-rhel.config:# CONFIG_DEBUG_VM is not set
> kernel-s390x-zfcpdump-rhel.config:# CONFIG_DEBUG_VM is not set
> kernel-x86_64-debug-fedora.config:CONFIG_DEBUG_VM=y
> kernel-x86_64-debug-rhel.config:CONFIG_DEBUG_VM=y
> kernel-x86_64-fedora.config:CONFIG_DEBUG_VM=y
> kernel-x86_64-rhel.config:# CONFIG_DEBUG_VM is not set
