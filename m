Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76B59C433F5
	for <linux-doc@archiver.kernel.org>; Fri, 15 Apr 2022 06:26:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1350427AbiDOG2u (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 15 Apr 2022 02:28:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50610 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1350426AbiDOG2t (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 15 Apr 2022 02:28:49 -0400
Received: from mail-vs1-xe35.google.com (mail-vs1-xe35.google.com [IPv6:2607:f8b0:4864:20::e35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C3D4C75C16
        for <linux-doc@vger.kernel.org>; Thu, 14 Apr 2022 23:26:22 -0700 (PDT)
Received: by mail-vs1-xe35.google.com with SMTP id i34so5396990vsv.6
        for <linux-doc@vger.kernel.org>; Thu, 14 Apr 2022 23:26:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=r4RShQi9icr7wSxQlh0D5L5Evfs0VvFyTLZdHUvu9L8=;
        b=sBwypCjbQBF+/WnqvmCEXoT4JJbp6AciTPTzeArpyy83AZyGtxPkBZkpF85m+7fkMn
         kPx4nv3WZ5qyoxA/4xAgWEUyUcZXrS7bf5+Eisexvk/XGpQV+k7wpEcVUB0KMptK0UZK
         3yNAS7Z6y7+iNRD97p4PZILtxALsN4zNaC882fCMTlwjDoLPNjZ2GAqPEjJLPz+K3I6h
         l/ye5pX+ePxFIAPQxK8F3iX6fMxyHcEhpSeUCtlMdGZNny74nOsnP22k6qPrMTvdwOew
         /t0cYCS21NKTCj6temp6PIHBKX94uBS+QcaG0ghNHJO2Pimg8PGEILuUamsf74rauMez
         mMVQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=r4RShQi9icr7wSxQlh0D5L5Evfs0VvFyTLZdHUvu9L8=;
        b=4jt/rNELAm9wdH7CzWhdNGqkycA6OEUsGA8RywQo4NXEoWA3nVVe51ox2EfTc6r5nm
         88S+35QvlIwLQzj1Q0wgV/8dxyHL/bwfMonyBRZrwST7ECMy/cpAEJCu+laIYjtSUyY2
         Mwzra9wpQX0Jvn1GSGc4FdpLQcN2SO8mllwAnalUAksG2HlubpeHDZZRQcCqvdzxfEKK
         QTAwif2J28Ne9Co3MKZuY2YYSM/b8OOQ/vukK67BVSVKR00dqKf3hiKFEjn2T1HVAVtI
         +DPn2bQa0i+Yds4sLei4QlO4ONtXkp9meQedfR1a6L2MsVtgFW3kBXL7ROKGW9KxnRWt
         mS4w==
X-Gm-Message-State: AOAM532Gewby/YK1QyOUxH2ODUIlVK2P96BZ9JDaxHLLDxb5FG4Sryqo
        61nzl1zbEWwYO6k8X9Yuu3nUnAXhV51eDpE1fYIDZw==
X-Google-Smtp-Source: ABdhPJxMuVrw6CCgd27RYTqBzChXKJNxGSOn9st5mfjSU3MHVTrF9aapaud6/EVQrwuLVccLBrOGNcvr5Ir3CrMKYXc=
X-Received: by 2002:a05:6102:5cc:b0:320:9bd2:3823 with SMTP id
 v12-20020a05610205cc00b003209bd23823mr2694438vsf.81.1650003981638; Thu, 14
 Apr 2022 23:26:21 -0700 (PDT)
MIME-Version: 1.0
References: <20220407031525.2368067-1-yuzhao@google.com> <20220407031525.2368067-9-yuzhao@google.com>
 <20220411191621.0378467ad99ebc822d5ad005@linux-foundation.org>
 <CAOUHufYeC=Kuu59BPL_48sM67CqACxH2wWy-SYGXpadgMDmY3w@mail.gmail.com> <20220414185654.e7150bcbe859e0dd4b9c61af@linux-foundation.org>
In-Reply-To: <20220414185654.e7150bcbe859e0dd4b9c61af@linux-foundation.org>
From:   Yu Zhao <yuzhao@google.com>
Date:   Fri, 15 Apr 2022 00:25:45 -0600
Message-ID: <CAOUHufYy6yQS9ARN9C5+ODkopR+ez4TH3hZNZo4HtNHBExS1mA@mail.gmail.com>
Subject: Re: [PATCH v10 08/14] mm: multi-gen LRU: support page table walks
To:     Andrew Morton <akpm@linux-foundation.org>
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

On Thu, Apr 14, 2022 at 7:57 PM Andrew Morton <akpm@linux-foundation.org> wrote:
>
> On Thu, 14 Apr 2022 19:14:54 -0600 Yu Zhao <yuzhao@google.com> wrote:
>
> > On Mon, Apr 11, 2022 at 8:16 PM Andrew Morton <akpm@linux-foundation.org> wrote:
> > >
> > > On Wed,  6 Apr 2022 21:15:20 -0600 Yu Zhao <yuzhao@google.com> wrote:
> > >
> > > > +static void update_batch_size(struct lru_gen_mm_walk *walk, struct folio *folio,
> > > > +                           int old_gen, int new_gen)
> > > > +{
> > > > +     int type = folio_is_file_lru(folio);
> > > > +     int zone = folio_zonenum(folio);
> > > > +     int delta = folio_nr_pages(folio);
> > > > +
> > > > +     VM_BUG_ON(old_gen >= MAX_NR_GENS);
> > > > +     VM_BUG_ON(new_gen >= MAX_NR_GENS);
> > >
> > > General rule: don't add new BUG_ONs, because they crash the kenrel.
> > > It's better to use WARN_ON or WARN_ON_ONCE then try to figure out a way
> > > to keep the kernel limping along.  At least so the poor user can gather logs.
> >
> > These are VM_BUG_ONs, which are BUILD_BUG_ONs except for (mostly MM) developers.
>
> I'm told that many production builds enable runtime VM_BUG_ONning.

Nobody wants to debug VM in production. Some distros that offer both
the latest/LTS kernels do enable CONFIG_DEBUG_VM in the former so the
latter can have better test coverage when it becomes available. Do
people use the former in production? Absolutely, otherwise we won't
have enough test coverage. Are we supposed to avoid CONFIG_DEBUG_VM? I
don't think so, because it defeats the purpose of those distros
enabling it in the first place.

The bottomline is that none of RHEL 8.5, SLES 15, Debian 11 enables
CONFIG_DEBUG_VM.
