Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF758C4361B
	for <linux-doc@archiver.kernel.org>; Thu, 17 Dec 2020 03:23:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9EEAB23715
	for <linux-doc@archiver.kernel.org>; Thu, 17 Dec 2020 03:23:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727621AbgLQDXl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 16 Dec 2020 22:23:41 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46858 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727420AbgLQDXl (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 16 Dec 2020 22:23:41 -0500
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3827DC0617B0
        for <linux-doc@vger.kernel.org>; Wed, 16 Dec 2020 19:23:01 -0800 (PST)
Received: by mail-pl1-x632.google.com with SMTP id s2so14356878plr.9
        for <linux-doc@vger.kernel.org>; Wed, 16 Dec 2020 19:23:01 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=mlMtQGu2Ifr2DB7fOrHeXkv/k4LyT1iT196YLb6MeGY=;
        b=sQVmH0gSAc8M7hEb33NnMYoVdTE57AThi904A5up8MfLUFV0xP/MIucJVRJtieMu6M
         larvHzjsQtVG0nSrqsFOtW2d3S8oWkXIQbc8iwkv2nD++1DUn4vgNBuUs+VCGuqlZBmq
         WA7XN/2WW14csLIrQ5F7EYAQOQ7vpvjKl+YP03uGUIc/e0LC3WiJhorFSfX9Ys0Jkh77
         DGfSHuz7N/QFF2u/VarqhXkjeFZ7fdUnNIdpOcKqDVM4nzelQqmyNCzqfv9OlBYNOrFk
         CoNsX3Zijnuhs+Vnicbw8hHw5IfPZ2+nPicEteFUdaIx0C5GmPOPTzYCS5rEN0wsge3w
         a2Dg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=mlMtQGu2Ifr2DB7fOrHeXkv/k4LyT1iT196YLb6MeGY=;
        b=d8JQMMHX7tTXCUKJvrLhwXrgeb9vKAK6oVekJc/+DV6oBBEfBE6LkzTCbxGkvyKVRH
         at/RIOuMRMQ+xPegdf3OngOgkZcaqighKLA0fo3LenXh0zpJXHbMQW2orV23mjAmFRc2
         JZZ4QUNjGkWg+jZ551cFONWAsUfSSlp6Ad+tUrE738KyHoP/NJttbauuwABK3G2awLm1
         pXUtORvG4VHHkVkg9XRmXJg6ww7jBVbe4QBHgOGDAFgfFFq8f9svSSN4eTV1jlbLjmdi
         P7eFKDZi8A32uMS1iiM7Jvn1FwAB2bzLMZ87P7h91SpUXIvwQ41/atWNzLV4wqGXXZz6
         wKuQ==
X-Gm-Message-State: AOAM532vdLLNnPGytbyDTvoti2h2ARLt83NLDZS+cNjHMCiNZ4mSEapf
        Ku+0+/AYtDSqtgndJVBcNYNOYXBm0ZD0ZaMLNtEpYg==
X-Google-Smtp-Source: ABdhPJzN/F5jEThlpm/kOqB6Sl/IhLB8qsqLnwpT6R9vRPzZwrQkAmdl+WZeX/wP8HtfTj0Cqlyyj1+BBS+FhHKjX6E=
X-Received: by 2002:a17:90a:ba88:: with SMTP id t8mr5826632pjr.229.1608175380735;
 Wed, 16 Dec 2020 19:23:00 -0800 (PST)
MIME-Version: 1.0
References: <20201213154534.54826-1-songmuchun@bytedance.com>
 <20201213154534.54826-6-songmuchun@bytedance.com> <153c505c-d78f-42f2-9a56-04b2b4f6ae7c@oracle.com>
In-Reply-To: <153c505c-d78f-42f2-9a56-04b2b4f6ae7c@oracle.com>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Thu, 17 Dec 2020 11:22:24 +0800
Message-ID: <CAMZfGtU-01eC01LenTODLhDXfBNHcQc_QGRsp3j=kcLrj8iO1Q@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v9 05/11] mm/hugetlb: Allocate the vmemmap
 pages associated with each HugeTLB page
To:     Mike Kravetz <mike.kravetz@oracle.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>, mingo@redhat.com,
        bp@alien8.de, x86@kernel.org, hpa@zytor.com,
        dave.hansen@linux.intel.com, luto@kernel.org,
        Peter Zijlstra <peterz@infradead.org>, viro@zeniv.linux.org.uk,
        Andrew Morton <akpm@linux-foundation.org>, paulmck@kernel.org,
        mchehab+huawei@kernel.org, pawan.kumar.gupta@linux.intel.com,
        Randy Dunlap <rdunlap@infradead.org>, oneukum@suse.com,
        anshuman.khandual@arm.com, jroedel@suse.de,
        Mina Almasry <almasrymina@google.com>,
        David Rientjes <rientjes@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        Oscar Salvador <osalvador@suse.de>,
        Michal Hocko <mhocko@suse.com>,
        "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>,
        David Hildenbrand <david@redhat.com>,
        Xiongchun duan <duanxiongchun@bytedance.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Dec 17, 2020 at 9:17 AM Mike Kravetz <mike.kravetz@oracle.com> wrote:
>
> On 12/13/20 7:45 AM, Muchun Song wrote:
> > When we free a HugeTLB page to the buddy allocator, we should allocate the
> > vmemmap pages associated with it. We can do that in the __free_hugepage()
> > before freeing it to buddy.
>
> ...
>
> > diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
> > index 78c527617e8d..ffcf092c92ed 100644
> > --- a/mm/sparse-vmemmap.c
> > +++ b/mm/sparse-vmemmap.c
> > @@ -29,6 +29,7 @@
> >  #include <linux/sched.h>
> >  #include <linux/pgtable.h>
> >  #include <linux/bootmem_info.h>
> > +#include <linux/delay.h>
> >
> >  #include <asm/dma.h>
> >  #include <asm/pgalloc.h>
> > @@ -39,7 +40,8 @@
> >   *
> >   * @rmap_pte:                called for each non-empty PTE (lowest-level) entry.
> >   * @reuse:           the page which is reused for the tail vmemmap pages.
> > - * @vmemmap_pages:   the list head of the vmemmap pages that can be freed.
> > + * @vmemmap_pages:   the list head of the vmemmap pages that can be freed
> > + *                   or is mapped from.
> >   */
> >  struct vmemmap_rmap_walk {
> >       void (*rmap_pte)(pte_t *pte, unsigned long addr,
> > @@ -54,6 +56,9 @@ struct vmemmap_rmap_walk {
> >   */
> >  #define VMEMMAP_TAIL_PAGE_REUSE              -1
> >
> > +/* The gfp mask of allocating vmemmap page */
> > +#define GFP_VMEMMAP_PAGE     (GFP_KERNEL | __GFP_RETRY_MAYFAIL | __GFP_NOWARN)
> > +
> >  static void vmemmap_pte_range(pmd_t *pmd, unsigned long addr,
> >                             unsigned long end, struct vmemmap_rmap_walk *walk)
> >  {
> > @@ -200,6 +205,68 @@ void vmemmap_remap_reuse(unsigned long start, unsigned long size)
> >       free_vmemmap_page_list(&vmemmap_pages);
> >  }
> >
> > +static void vmemmap_remap_restore_pte(pte_t *pte, unsigned long addr,
> > +                                   struct vmemmap_rmap_walk *walk)
> > +{
> > +     pgprot_t pgprot = PAGE_KERNEL;
> > +     struct page *page;
> > +     void *to;
> > +
> > +     BUG_ON(pte_page(*pte) != walk->reuse);
> > +
> > +     page = list_first_entry(walk->vmemmap_pages, struct page, lru);
> > +     list_del(&page->lru);
> > +     to = page_to_virt(page);
> > +     copy_page(to, page_to_virt(walk->reuse));
> > +
> > +     set_pte_at(&init_mm, addr, pte, mk_pte(page, pgprot));
> > +}
> > +
> > +static void alloc_vmemmap_page_list(struct list_head *list,
> > +                                 unsigned long nr_pages)
> > +{
> > +     while (nr_pages--) {
> > +             struct page *page;
> > +
> > +retry:
> > +             page = alloc_page(GFP_VMEMMAP_PAGE);
>
> Should we try (or require) the vmemmap page be on the same node as the
> pages they describe?  I imagine performance would be impacted if a
> struct page and the page it describes are on different numa nodes.

Yeah, it is a good idea. I also think that we should do this. I will do that in
the next version. Thanks.

>
> > +             if (unlikely(!page)) {
> > +                     msleep(100);
> > +                     /*
> > +                      * We should retry infinitely, because we cannot
> > +                      * handle allocation failures. Once we allocate
> > +                      * vmemmap pages successfully, then we can free
> > +                      * a HugeTLB page.
> > +                      */
> > +                     goto retry;
> > +             }
> > +             list_add_tail(&page->lru, list);
> > +     }
> > +}
> > +
>
> --
> Mike Kravetz



-- 
Yours,
Muchun
