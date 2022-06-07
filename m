Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D63B4C43334
	for <linux-doc@archiver.kernel.org>; Tue,  7 Jun 2022 21:19:24 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1378228AbiFGVTW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 7 Jun 2022 17:19:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:54690 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352999AbiFGVS7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 7 Jun 2022 17:18:59 -0400
Received: from mail-vs1-xe29.google.com (mail-vs1-xe29.google.com [IPv6:2607:f8b0:4864:20::e29])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A254D224113
        for <linux-doc@vger.kernel.org>; Tue,  7 Jun 2022 11:59:22 -0700 (PDT)
Received: by mail-vs1-xe29.google.com with SMTP id q14so17522576vsr.12
        for <linux-doc@vger.kernel.org>; Tue, 07 Jun 2022 11:59:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=9Elzb0WSXIXlROa5Ne/fkFdeuavdNhknMmaOlUejDTY=;
        b=Cv0f7VDXY7aEPKcXAgnBc/m7gn4KcwOMCSs6PnP0SNIDWWYURJ50n1BCOckHKyAo4L
         osssjroBU4blBT4uRm44yv1fi6oI2L3ujbMxK0o1i7oGhzuJEZHYVRVpCkNRjU/hFtxf
         Ifer0vvxCoOUoY1v9kjyMENImilrTTM4fAy0Btq15FrFxyPHCeK2B0D84LFU8iZVCbEM
         TH8Id7ZOemPx6JqSCTpgYaMPAPVA73HfyKXhphSlNjINHTMX+uRZzLvngc5H22ab9HNY
         8jkBwlmf+zLp0DZxf4DQWE1GgEnOF/mife+Vv/Z4dmejaQyeRkI9GPk+3cw2UFYny78M
         GbTQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=9Elzb0WSXIXlROa5Ne/fkFdeuavdNhknMmaOlUejDTY=;
        b=XZ4ecdqF0TPEdBY3Ild71Fv7mXzPPIjIRc0nA2IKD4vSKd2JNMtLxOPCiLa7o53hnF
         mLIx+7zQ7ZH0x+CostP4ZE4y0XesFGNhDdIhbnSIzWDTINo0G+8sx9+zQocz9a9OYwQ+
         uvy8pRnCFM0ol7leX2hnLDfbKJ8Na+oCeAUZHVrBXrZSqJaVpLz2W/qB0dtCtzSIv5w3
         eicppscZ86qMnvoobVVl9CnjECxyiRXyOFLPFo57BmOa8K67qElE2QcIVCbbI46LMR0s
         yQhKBAPbOi72QKynCfmOaCULOjQQ0gVHtOAteTccOd/Oc3cOSQtGu0tGMv4tx926aATR
         6WQw==
X-Gm-Message-State: AOAM532bixGW5MIEdDCK2qGiAAX0ow7fdJcEY31GWlkmUbjGJJ/DG5W/
        aL8K3TiX7SzK+F/2aiRu/wJ/jHvA5+O/ZkmwX85Rjw==
X-Google-Smtp-Source: ABdhPJwItyNg+JlCejjmtMRo2UgKL6vqnWouemHIBZUAlTzMQTqGRbdROMZliSDf1VNw1QrtZay3uVygVctsRUZw5Ew=
X-Received: by 2002:a67:f3d0:0:b0:34b:b52d:d676 with SMTP id
 j16-20020a67f3d0000000b0034bb52dd676mr6382966vsn.6.1654628358760; Tue, 07 Jun
 2022 11:59:18 -0700 (PDT)
MIME-Version: 1.0
References: <20220518014632.922072-1-yuzhao@google.com> <20220518014632.922072-8-yuzhao@google.com>
 <CAGsJ_4yboZEY9OfyujPxBa_AEuGM3OAq5y_L9gvzSMUv70BxeQ@mail.gmail.com>
In-Reply-To: <CAGsJ_4yboZEY9OfyujPxBa_AEuGM3OAq5y_L9gvzSMUv70BxeQ@mail.gmail.com>
From:   Yu Zhao <yuzhao@google.com>
Date:   Tue, 7 Jun 2022 12:58:42 -0600
Message-ID: <CAOUHufYwhcWZFdkaJ9qsNoFMUxPOEd+CFzDtYwWdpSGWBbjPgw@mail.gmail.com>
Subject: Re: [PATCH v11 07/14] mm: multi-gen LRU: exploit locality in rmap
To:     Barry Song <21cnbao@gmail.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Linux-MM <linux-mm@kvack.org>, Andi Kleen <ak@linux.intel.com>,
        Aneesh Kumar <aneesh.kumar@linux.ibm.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Dave Hansen <dave.hansen@linux.intel.com>,
        Hillf Danton <hdanton@sina.com>, Jens Axboe <axboe@kernel.dk>,
        Johannes Weiner <hannes@cmpxchg.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        Matthew Wilcox <willy@infradead.org>,
        Mel Gorman <mgorman@suse.de>,
        Michael Larabel <Michael@michaellarabel.com>,
        Michal Hocko <mhocko@kernel.org>,
        Mike Rapoport <rppt@kernel.org>,
        Peter Zijlstra <peterz@infradead.org>,
        Tejun Heo <tj@kernel.org>, Vlastimil Babka <vbabka@suse.cz>,
        Will Deacon <will@kernel.org>,
        LAK <linux-arm-kernel@lists.infradead.org>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        LKML <linux-kernel@vger.kernel.org>, x86 <x86@kernel.org>,
        Kernel Page Reclaim v2 <page-reclaim@google.com>,
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

On Mon, Jun 6, 2022 at 3:25 AM Barry Song <21cnbao@gmail.com> wrote:
>
> On Wed, May 18, 2022 at 4:49 PM Yu Zhao <yuzhao@google.com> wrote:

...

> > @@ -821,6 +822,12 @@ static bool folio_referenced_one(struct folio *folio,
> >                 }
> >
> >                 if (pvmw.pte) {
> > +                       if (lru_gen_enabled() && pte_young(*pvmw.pte) &&
> > +                           !(vma->vm_flags & (VM_SEQ_READ | VM_RAND_READ))) {
> > +                               lru_gen_look_around(&pvmw);
> > +                               referenced++;
> > +                       }
> > +
> >                         if (ptep_clear_flush_young_notify(vma, address,
>
> Hello, Yu.
> look_around() is calling ptep_test_and_clear_young(pvmw->vma, addr, pte + i)
> only without flush and notify. for flush, there is a tlb operation for arm64:
> static inline int ptep_clear_flush_young(struct vm_area_struct *vma,
>                                          unsigned long address, pte_t *ptep)
> {
>         int young = ptep_test_and_clear_young(vma, address, ptep);
>
>         if (young) {
>                 /*
>                  * We can elide the trailing DSB here since the worst that can
>                  * happen is that a CPU continues to use the young entry in its
>                  * TLB and we mistakenly reclaim the associated page. The
>                  * window for such an event is bounded by the next
>                  * context-switch, which provides a DSB to complete the TLB
>                  * invalidation.
>                  */
>                 flush_tlb_page_nosync(vma, address);
>         }
>
>         return young;
> }
>
> Does it mean the current kernel is over cautious?

Hi Barry,

This is up to individual archs. For x86, ptep_clear_flush_young() is
ptep_test_and_clear_young(). For arm64, I'd say yes, based on Figure 1
of Navarro, Juan, et al. "Practical, transparent operating system
support for superpages." [1].

int ptep_clear_flush_young(struct vm_area_struct *vma,
                           unsigned long address, pte_t *ptep)
{
        /*
         * On x86 CPUs, clearing the accessed bit without a TLB flush
         * doesn't cause data corruption. [ It could cause incorrect
         * page aging and the (mistaken) reclaim of hot pages, but the
         * chance of that should be relatively low. ]
         *
         * So as a performance optimization don't flush the TLB when
         * clearing the accessed bit, it will eventually be flushed by
         * a context switch or a VM operation anyway. [ In the rare
         * event of it not getting flushed for a long time the delay
         * shouldn't really matter because there's no real memory
         * pressure for swapout to react to. ]
         */
        return ptep_test_and_clear_young(vma, address, ptep);
}

[1] https://www.usenix.org/legacy/events/osdi02/tech/full_papers/navarro/navarro.pdf

> is it
> safe to call ptep_test_and_clear_young() only?

Yes. Though the h/w A-bit is designed to allow OSes to skip TLB
flushes when unmapping, the Linux kernel doesn't do this.

> btw, lru_gen_look_around() has already included 'address', are we doing
> pte check for 'address' twice here?

Yes for host MMU but no KVM MMU. ptep_clear_flush_young_notify() goes
into the MMU notifier. We don't use the _notify variant in
lru_gen_look_around() because GPA space generally exhibits no memory
locality.

Thanks.
