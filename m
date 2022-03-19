Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A1272C433EF
	for <linux-doc@archiver.kernel.org>; Sat, 19 Mar 2022 03:11:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241883AbiCSDMm (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 18 Mar 2022 23:12:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60326 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241856AbiCSDMl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 18 Mar 2022 23:12:41 -0400
Received: from mail-vk1-xa33.google.com (mail-vk1-xa33.google.com [IPv6:2607:f8b0:4864:20::a33])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6917320094B
        for <linux-doc@vger.kernel.org>; Fri, 18 Mar 2022 20:11:21 -0700 (PDT)
Received: by mail-vk1-xa33.google.com with SMTP id 188so1823544vku.5
        for <linux-doc@vger.kernel.org>; Fri, 18 Mar 2022 20:11:21 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DPWkpEZTUPx8RezVYIweJltfbI2PstSaIw69Jkk1LgA=;
        b=SCIWl/14VSpA5cOd0Lwaoa1Kf3xHGcWMoESYsocaRg2Gut/yFp8ifxnBAnvkP2gz9Y
         2apsTQZ/jGJvR1BXCxH0Knp85D2Qzt+tuIoUAp9shcvxlAoEubSSxVPInCcz5EFRNEQm
         9+PmghRAO6RoU+Bxeh6f4yMnVm9JqmTVMBZxQwkfILnV5GpUZAnShVs2NkkUrWg97MVa
         YyMr2EfmQoQiQ0qAEEiPCsc8rgEscohw/A9EsaXbv1QGORD5aR3bH3/3ZsUBeAFH2R2b
         Sb8fLcR03p308VBkhhdfk4ukE7liTmo+jfC9S9e+3Qtmfvs5A5pFPt5pgX3NdGDqrOPT
         z+0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DPWkpEZTUPx8RezVYIweJltfbI2PstSaIw69Jkk1LgA=;
        b=uB4aW0SMp+XvTRatkrjZoEGRki4i1p2ttn7kxXqQ3s8/FE4gkyq40/cPLk2k8W6TWn
         q9vvAjhu5/FsxDOD0Z9+63xaCUQDBUekvkHIGSKPMP5pEMw986Ui9Cl/bo1vElr8UH59
         EuKzU/wMUQpnSGKA0teiCO4gaxiLyq68WDdq0xDzfrt1wDU6GhnZPB4vI9khj3SdyBDI
         Yfg+XN1xA0ztmddbK5FwPIMT3SKDy5/S9y8kz1SRJ0cl+6HvLbKM3L4KsIHTvhKPjeB4
         U2UNmP5gZ0EeiFEMnTgdYA8MpsynJnCDxnLLT9llRB5vRDv8CiaEckVcDhrKdiwilBK2
         zMPQ==
X-Gm-Message-State: AOAM531WIetAwZIezHjzTeug+7YHIor6+wEBVStGSHWQSHkXOFdt/HCK
        wkmy1faEW5P+DoOqExXrsf/0lwnc9CkByaUdYZXAxA==
X-Google-Smtp-Source: ABdhPJy/iE22VepUPG4b5BxoTJh/Okw9HmCdMV+xoYJkkoh2isbFfIcgEUs0IHWCL1BtdLwbslwt8FedPDz0XzORp6w=
X-Received: by 2002:a05:6122:2089:b0:337:bb38:9145 with SMTP id
 i9-20020a056122208900b00337bb389145mr4778638vkd.14.1647659480347; Fri, 18 Mar
 2022 20:11:20 -0700 (PDT)
MIME-Version: 1.0
References: <20220309021230.721028-1-yuzhao@google.com> <20220309021230.721028-7-yuzhao@google.com>
 <CAGsJ_4xfL7h6M92WGusxbTxQzHOJDj4X4AuC=0HgrEyAYJaJFg@mail.gmail.com>
In-Reply-To: <CAGsJ_4xfL7h6M92WGusxbTxQzHOJDj4X4AuC=0HgrEyAYJaJFg@mail.gmail.com>
From:   Yu Zhao <yuzhao@google.com>
Date:   Fri, 18 Mar 2022 21:11:09 -0600
Message-ID: <CAOUHufbiSShp=khZFL6BmJKNNkG-LBrsPoLwYxewcgtZhi5tFg@mail.gmail.com>
Subject: Re: [PATCH v9 06/14] mm: multi-gen LRU: minimal implementation
To:     Barry Song <21cnbao@gmail.com>
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
        Mike Rapoport <rppt@kernel.org>,
        Rik van Riel <riel@surriel.com>,
        Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>,
        Ying Huang <ying.huang@intel.com>,
        LAK <linux-arm-kernel@lists.infradead.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>,
        Kernel Page Reclaim v2 <page-reclaim@google.com>,
        x86 <x86@kernel.org>, Brian Geffon <bgeffon@google.com>,
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

On Fri, Mar 18, 2022 at 9:01 PM Barry Song <21cnbao@gmail.com> wrote:
>
> > +static int folio_inc_gen(struct lruvec *lruvec, struct folio *folio, bool reclaiming)
> > +{
> > +       unsigned long old_flags, new_flags;
> > +       int type = folio_is_file_lru(folio);
> > +       struct lru_gen_struct *lrugen = &lruvec->lrugen;
> > +       int new_gen, old_gen = lru_gen_from_seq(lrugen->min_seq[type]);
> > +
> > +       do {
> > +               new_flags = old_flags = READ_ONCE(folio->flags);
> > +               VM_BUG_ON_FOLIO(!(new_flags & LRU_GEN_MASK), folio);
> > +
> > +               new_gen = ((new_flags & LRU_GEN_MASK) >> LRU_GEN_PGOFF) - 1;
> > +               new_gen = (old_gen + 1) % MAX_NR_GENS;
>
> new_gen is assigned twice, i assume you mean
>                old_gen = ((new_flags & LRU_GEN_MASK) >> LRU_GEN_PGOFF) - 1;
>                new_gen = (old_gen + 1) % MAX_NR_GENS;
>
> or do you always mean new_gen =  lru_gen_from_seq(min_seq) + 1?

Thanks a lot for your attention to details!

The first line should be in the next patch but I overlooked during the
last refactoring:

  new_gen = ((new_flags & LRU_GEN_MASK) >> LRU_GEN_PGOFF) - 1;
+ /* folio_update_gen() has promoted this page? */
+ if (new_gen >= 0 && new_gen != old_gen)
+ return new_gen;
+
  new_gen = (old_gen + 1) % MAX_NR_GENS;
