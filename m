Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16421C433F5
	for <linux-doc@archiver.kernel.org>; Tue, 15 Mar 2022 00:50:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343929AbiCOAvd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 14 Mar 2022 20:51:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42824 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233875AbiCOAvc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 14 Mar 2022 20:51:32 -0400
Received: from mail-vs1-xe31.google.com (mail-vs1-xe31.google.com [IPv6:2607:f8b0:4864:20::e31])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84EC442A01
        for <linux-doc@vger.kernel.org>; Mon, 14 Mar 2022 17:50:20 -0700 (PDT)
Received: by mail-vs1-xe31.google.com with SMTP id g21so19119412vsp.6
        for <linux-doc@vger.kernel.org>; Mon, 14 Mar 2022 17:50:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=TGWP/j9jQDz8ITNZjF9Mi8AuvhWKnrJvGLZgMJstMyM=;
        b=CfS7UUjvLrAT1aDGYV3HnxSl8EQtbmuYuPBgTmaQYFz9vJimhbOWc+IH0w9b5GdliA
         mHycmaQ42AeBz9Run7QRKkijkzuuXe/k4wG3L3HFkHZHxIBQpp8MnzKygxU4iwixKfT6
         nORrYwSyj8T0AVOhVnvyQjHf7uFM6uTZfIcyPyr3tJO5Yiat5KQ0XdDbvQQhBCTnq/dN
         MppfA+kUUjiUpIDzqmo6ULH6hF5gFIzU2wFX9+1UGraZQIkxwy9XqrNvVMBciDx3dxqx
         ZfhQmEtcCIW+Hrvaqj6jda+tfyYebGiiPej6g5M7HQMMiHUBUvAsBcSGTY7JohJz/mR3
         q82A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=TGWP/j9jQDz8ITNZjF9Mi8AuvhWKnrJvGLZgMJstMyM=;
        b=gEvyNAD+j9hDZLgOAk4JD9JzachMqwe5mMIdnRo4fBEbT0pH4QpEb056hOz2o6+8/8
         zwABTWf/FQFldp0Mwknj1VH96QzA0YgxDnJ8AAtfnO4oSWNCXKp4eQPO2CPzsf0pdVCd
         axTz1bUd6S1fzhB8z4Sj5rbWNHMhF4DxXlyuvUNdQjbl/p7lpAowRA0awnJzN6mLMeiu
         2O9jEqXcLPCmLzuzFd7eHydRsKYYW2g6CxKS4UESUR4oOqaJsvnM1vwbl1Zy8yA1J5nm
         1VE96f9RquMYoTqqD7grLMt/3Pv38g0wgRVWg1TbqDhMMEHbfvhCir4RwAd6DGSne85W
         BvVg==
X-Gm-Message-State: AOAM531zmI/dOIykcmFl/CCGLQBpiRCKlFXf/d8h1VWJjvfOnUD3vnbq
        Os60Egggt8DqVpJmYAbihzy5Ftg68dsk/anpi8DFFg==
X-Google-Smtp-Source: ABdhPJx0othUKamJYw7fkq4YIMuB/hB8vElbG97cfyPOzYEEeFJqxq2EgYGx7cZnSaYaYnniHc3DsVySI8hwoEtt7Bs=
X-Received: by 2002:a05:6102:290c:b0:322:b864:22f5 with SMTP id
 cz12-20020a056102290c00b00322b86422f5mr7717062vsb.41.1647305419517; Mon, 14
 Mar 2022 17:50:19 -0700 (PDT)
MIME-Version: 1.0
References: <20220309021230.721028-1-yuzhao@google.com> <20220309021230.721028-6-yuzhao@google.com>
 <875yoh552i.fsf@yhuang6-desk2.ccr.corp.intel.com> <CAOUHufYPSesiePfxaV=y9Vne5cb+Y_vQtJyQ1NiO1CFus=8WOA@mail.gmail.com>
 <87mths3vg5.fsf@yhuang6-desk2.ccr.corp.intel.com>
In-Reply-To: <87mths3vg5.fsf@yhuang6-desk2.ccr.corp.intel.com>
From:   Yu Zhao <yuzhao@google.com>
Date:   Mon, 14 Mar 2022 18:50:08 -0600
Message-ID: <CAOUHufY8_f353GivFy=_2g=DHmQJcBHNzbabhyGhMnoBbzL8yQ@mail.gmail.com>
Subject: Re: [PATCH v9 05/14] mm: multi-gen LRU: groundwork
To:     "Huang, Ying" <ying.huang@intel.com>
Cc:     kernel@lists.fedoraproject.org, kernel-team@lists.ubuntu.com,
        Andrew Morton <akpm@linux-foundation.org>,
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
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Mar 14, 2022 at 6:34 PM Huang, Ying <ying.huang@intel.com> wrote:
>
> Yu Zhao <yuzhao@google.com> writes:
>
> > On Mon, Mar 14, 2022 at 2:09 AM Huang, Ying <ying.huang@intel.com> wrote:
> >>
> >> Hi, Yu,
> >>
> >> Yu Zhao <yuzhao@google.com> writes:
> >> > diff --git a/mm/Kconfig b/mm/Kconfig
> >> > index 3326ee3903f3..747ab1690bcf 100644
> >> > --- a/mm/Kconfig
> >> > +++ b/mm/Kconfig
> >> > @@ -892,6 +892,16 @@ config ANON_VMA_NAME
> >> >         area from being merged with adjacent virtual memory areas due to the
> >> >         difference in their name.
> >> >
> >> > +# the multi-gen LRU {
> >> > +config LRU_GEN
> >> > +     bool "Multi-Gen LRU"
> >> > +     depends on MMU
> >> > +     # the following options can use up the spare bits in page flags
> >> > +     depends on !MAXSMP && (64BIT || !SPARSEMEM || SPARSEMEM_VMEMMAP)
> >>
> >> LRU_GEN depends on !MAXSMP.  So, What is the maximum NR_CPUS supported
> >> by LRU_GEN?
> >
> > LRU_GEN doesn't really care about NR_CPUS. IOW, it doesn't impose a
> > max number. The dependency is with NODES_SHIFT selected by MAXSMP:
> >     default "10" if MAXSMP
> > This combined with LAST_CPUPID_SHIFT can exhaust the spare bits in page flags.
>
> From the following code snippets from page-flags-layout.h,
> LAST_CPUPID_SHIFT is related to NR_CPUS instead of NODES_SHIFT.

It is. But LAST_CPUPID_NOT_IN_PAGE_FLAGS should always work but
NODE_NOT_IN_PAGE_FLAGS doesn't.
