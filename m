Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 461F6C433F5
	for <linux-doc@archiver.kernel.org>; Tue, 22 Mar 2022 08:20:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230385AbiCVIWA (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 22 Mar 2022 04:22:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35674 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230241AbiCVIV7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 22 Mar 2022 04:21:59 -0400
Received: from mail-vk1-xa32.google.com (mail-vk1-xa32.google.com [IPv6:2607:f8b0:4864:20::a32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7A37D5EDD6
        for <linux-doc@vger.kernel.org>; Tue, 22 Mar 2022 01:20:32 -0700 (PDT)
Received: by mail-vk1-xa32.google.com with SMTP id w123so1491899vkg.7
        for <linux-doc@vger.kernel.org>; Tue, 22 Mar 2022 01:20:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=42YXUZS4Bh5f7hZiKMs+uWT14p+nXPI0hRRdRy/jBrw=;
        b=HIPCGJVN9RSH1xeF7DYptNWpIBgK5qTF6waBgSfWsR4iPSDHQ0R00bHPHJdDkN960d
         K7G1Q/6J52SMtagmwRDP4lSrs52niH41e/LBaFclp7unH1AbDGZdOrOR+zGUpYmRtmC1
         pilPjufkqcjV3hlOTs8zT2MSTqVXKiErKeWhpQ2QbTkZJZ28mm7wvOgo6ntWobN6L4Xt
         sCxCFYNtSfTOHAaIo9ncr4syVy4JuVFSa2RJ8nhK7gVVtYjaVCIoeuZACTgnbtGzIUzC
         PBeAJStLHBI7ryXcA/uBYCbzEht6PpalY/d3EFU6hDOzpvE+FTd2Mhft7LrwySgVuWT1
         TTgw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=42YXUZS4Bh5f7hZiKMs+uWT14p+nXPI0hRRdRy/jBrw=;
        b=ub7syiU4cD9J7v0oS1r+Yw1L+dScp+PObNGPcgNtZjPgkfOY77Nb4/jfUbeM6VT7fh
         iEGr9Yd9aQPisc8tGtmIAjP53eTERSZShneEAMxru6LK8FKBTdksDlSgc1CxYu7d2JBF
         cZ8OVP2Dv+UZf6Z9/ucptA5r2STH6DV9yjhUSqTvJ8I13JXbBz5si2/lgN1+oMGPK617
         xOIMpea9WF4ZiSKbDIobdyrfV/liTXaTAHYcMzDhMihq3fxkDsRluScTx8OcnzkIJYzv
         9Za15fOKDrfyc/iM+zD7AsYRXeW3mTgOxaYZ633Raf3E95Lehq9aI0TMRNT1DhhtkJ+X
         5gww==
X-Gm-Message-State: AOAM532sIz1FkDas/YTXYYauseiW3Fl+ViUbBHxdCdAveARUOaAjEmrS
        Cqo98sQ5AmpjnhFkYMWYZiitloHnV8Blb4hehdEAFg==
X-Google-Smtp-Source: ABdhPJyk9a1oX9F0PyYF9vK0N7xNfdbrYjqPWxhBwPh3TBqJeyDmyw2FybEi5s6bYuVOH4xB/QKDtj49PVeU9VdWwX4=
X-Received: by 2002:a05:6122:2213:b0:31b:76c3:16df with SMTP id
 bb19-20020a056122221300b0031b76c316dfmr9732880vkb.31.1647937231477; Tue, 22
 Mar 2022 01:20:31 -0700 (PDT)
MIME-Version: 1.0
References: <20220309021230.721028-1-yuzhao@google.com> <20220309021230.721028-11-yuzhao@google.com>
 <CAGsJ_4xqRGp1gV89+bAx5iA=AVwj2TA+No92UqLHFa0i14MBMQ@mail.gmail.com>
In-Reply-To: <CAGsJ_4xqRGp1gV89+bAx5iA=AVwj2TA+No92UqLHFa0i14MBMQ@mail.gmail.com>
From:   Yu Zhao <yuzhao@google.com>
Date:   Tue, 22 Mar 2022 02:20:20 -0600
Message-ID: <CAOUHufbP7kHquWiD3VsmD=veNFF2v_E9HWqdYSMbS1nPJic0Fg@mail.gmail.com>
Subject: Re: [PATCH v9 10/14] mm: multi-gen LRU: kill switch
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

On Tue, Mar 22, 2022 at 1:47 AM Barry Song <21cnbao@gmail.com> wrote:
>
...
> > +static bool drain_evictable(struct lruvec *lruvec)
> > +{
> > +       int gen, type, zone;
> > +       int remaining = MAX_LRU_BATCH;
> > +
> > +       for_each_gen_type_zone(gen, type, zone) {
> > +               struct list_head *head = &lruvec->lrugen.lists[gen][type][zone];
> > +
> > +               while (!list_empty(head)) {
> > +                       bool success;
> > +                       struct folio *folio = lru_to_folio(head);
> > +
> > +                       VM_BUG_ON_FOLIO(folio_test_unevictable(folio), folio);
> > +                       VM_BUG_ON_FOLIO(folio_test_active(folio), folio);
> > +                       VM_BUG_ON_FOLIO(folio_is_file_lru(folio) != type, folio);
> > +                       VM_BUG_ON_FOLIO(folio_zonenum(folio) != zone, folio);
> > +
> > +                       success = lru_gen_del_folio(lruvec, folio, false);
> > +                       VM_BUG_ON(!success);
> > +                       lruvec_add_folio(lruvec, folio);
>
> for example, max_seq=4(GEN=0) and max_seq-1=3, then we are supposed to put
> max_seq in the head of active list. but your code seems to be putting max_seq-1
> after putting max_seq, then max_seq is more likely to be evicted
> afterwards as it
> is in the tail of the active list.

This is correct.

> anyway, it might not be so important. I can't imagine we will
> frequently switch mglru
> with lru dynamically. will we?

I certainly hope not :)
