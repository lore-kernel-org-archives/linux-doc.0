Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4A843C4743D
	for <linux-doc@archiver.kernel.org>; Fri, 11 Jun 2021 07:54:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2F108613AE
	for <linux-doc@archiver.kernel.org>; Fri, 11 Jun 2021 07:54:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231391AbhFKH41 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 11 Jun 2021 03:56:27 -0400
Received: from mail-pf1-f175.google.com ([209.85.210.175]:33336 "EHLO
        mail-pf1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229733AbhFKH41 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 11 Jun 2021 03:56:27 -0400
Received: by mail-pf1-f175.google.com with SMTP id p13so3818737pfw.0
        for <linux-doc@vger.kernel.org>; Fri, 11 Jun 2021 00:54:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=Nw9bO65kv+vQzZ++JLwMCIyG0t/9RcSEQHg9y8K4+tU=;
        b=OAnD2p66yIuge2Exhcrg10S9Z8oPV5BTTtawPiL8+zS1a8AIZRVb3fgDpy8Msgxw4M
         RBZvHTCraGkv8nzI6uTWb85+/jNYyjVFSQiZSwgcfj63lOZ9S/732vounN3BK/kar2Tt
         sowkCJpyRPd0KStiTx4sHKbyItYqMwfMgcsELKWkYYXZGJggpRlCihR20ARxHVjGeO6w
         O+j9kvTqRxgUAR9ugVmtjZKKUOXs7/M/qGoCw5Z2L8wTuDQUSnL6nTMa5oFERdG2ZRB5
         DFcLujleTUQSnLx1EHg8fv+z9pNe/+O4rnI8Ii9h9rLEsjxeIawnMLOT43RYSNBgOwhM
         g3Pw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Nw9bO65kv+vQzZ++JLwMCIyG0t/9RcSEQHg9y8K4+tU=;
        b=M95GabGqd/uCuQTsp+t83FLf8fEwfZGIbNKUYwC6tJGMDW+t4TvtgF6AN9tSAW6H8f
         0+XlYK0c+FJjXT08ySYHdNo1LKAmft3OaK9ScrPnyJ4hz1SLGAzeA8gCWFowtBezgaDF
         Hv3b3UWCgny0brB3p4r/gtSTIXPoZGXVKu+F3fP1P95lLpgxvgK+/XvV94C9UP+0NXvz
         ZyYeJMU6jNXjSv8wbWyx6SBrVh7mJ2lApBgoylwCmrw5em8/7j7cr/OBpkK3qcsj+Gb/
         8kK/ls0VtCkwkBASd0BH7I+Kd1rZlrTegVkmPpWkfc5PZvj0oL5DdjdsprTRmBeGzlp8
         IIWQ==
X-Gm-Message-State: AOAM530o0vKUiLioeZMEbB9KXHgpSxM1vkFGXjsP1KUYPs8sZD7CiYeF
        pKzOTG6HObghzd/yKlKfMpu2jeKhzqAJaH9xpXVjqw==
X-Google-Smtp-Source: ABdhPJzKuyr2FvUEJ2NbeqTxmGKZrL+MaigtT0hVYXHXVW2pY66rOIQFs76DmlBfTYidHDA1Rj+WH4jcfTzk66gexGs=
X-Received: by 2002:a63:6547:: with SMTP id z68mr2358600pgb.341.1623398009991;
 Fri, 11 Jun 2021 00:53:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210609121310.62229-1-songmuchun@bytedance.com>
 <20210609121310.62229-4-songmuchun@bytedance.com> <1c910c9a-d5fd-8eb8-526d-bb1f71833c30@oracle.com>
In-Reply-To: <1c910c9a-d5fd-8eb8-526d-bb1f71833c30@oracle.com>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Fri, 11 Jun 2021 15:52:52 +0800
Message-ID: <CAMZfGtU6D28AzoGsVdddrf54P_O-134j2dEMu6gn+uiBJkdi9Q@mail.gmail.com>
Subject: Re: [External] Re: [PATCH 3/5] mm: sparsemem: split the huge PMD
 mapping of vmemmap pages
To:     Mike Kravetz <mike.kravetz@oracle.com>
Cc:     Andrew Morton <akpm@linux-foundation.org>,
        Oscar Salvador <osalvador@suse.de>,
        Michal Hocko <mhocko@suse.com>,
        "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>,
        David Hildenbrand <david@redhat.com>,
        Chen Huang <chenhuang5@huawei.com>,
        "Bodeddula, Balasubramaniam" <bodeddub@amazon.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Xiongchun duan <duanxiongchun@bytedance.com>,
        fam.zheng@bytedance.com, zhengqi.arch@bytedance.com,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jun 11, 2021 at 6:35 AM Mike Kravetz <mike.kravetz@oracle.com> wrote:
>
> On 6/9/21 5:13 AM, Muchun Song wrote:
> > If the vmemmap is huge PMD mapped, we should split the huge PMD firstly
> > and then we can change the PTE page table entry. In this patch, we add
> > the ability of splitting the huge PMD mapping of vmemmap pages.
> >
> > Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> > ---
> >  include/linux/mm.h   |  2 +-
> >  mm/hugetlb.c         | 42 ++++++++++++++++++++++++++++++++++--
> >  mm/hugetlb_vmemmap.c |  3 ++-
> >  mm/sparse-vmemmap.c  | 61 +++++++++++++++++++++++++++++++++++++++++++++-------
> >  4 files changed, 96 insertions(+), 12 deletions(-)
> >
> > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > index cadc8cc2c715..b97e1486c5c1 100644
> > --- a/include/linux/mm.h
> > +++ b/include/linux/mm.h
> > @@ -3056,7 +3056,7 @@ static inline void print_vma_addr(char *prefix, unsigned long rip)
> >  #endif
> >
> >  void vmemmap_remap_free(unsigned long start, unsigned long end,
> > -                     unsigned long reuse);
> > +                     unsigned long reuse, struct list_head *pgtables);
> >  int vmemmap_remap_alloc(unsigned long start, unsigned long end,
> >                       unsigned long reuse, gfp_t gfp_mask);
> >
> > diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> > index c3b2a8a494d6..3137c72d9cc7 100644
> > --- a/mm/hugetlb.c
> > +++ b/mm/hugetlb.c
> > @@ -1609,6 +1609,13 @@ static void __prep_account_new_huge_page(struct hstate *h, int nid)
> >  static void __prep_new_huge_page(struct hstate *h, struct page *page)
> >  {
> >       free_huge_page_vmemmap(h, page);
> > +     /*
> > +      * Because we store preallocated pages on @page->lru,
> > +      * vmemmap_pgtable_free() must be called before the
> > +      * initialization of @page->lru in INIT_LIST_HEAD().
> > +      */
> > +     vmemmap_pgtable_free(&page->lru);
> > +
> >       INIT_LIST_HEAD(&page->lru);
> >       set_compound_page_dtor(page, HUGETLB_PAGE_DTOR);
> >       hugetlb_set_page_subpool(page, NULL);
> > @@ -1775,14 +1782,29 @@ static struct page *alloc_fresh_huge_page(struct hstate *h,
> >               nodemask_t *node_alloc_noretry)
> >  {
> >       struct page *page;
> > +     LIST_HEAD(pgtables);
> > +
> > +     if (vmemmap_pgtable_prealloc(h, &pgtables))
> > +             return NULL;
>
> In the previous two patches I asked:
> - Can we wait until later to prealloc vmemmap pages for gigantic pages
>   allocated from bootmem?
> - Should we fail to add a hugetlb page to the pool if we can not do
>   vmemmap optimization?
>
>
> Depending on the answers to those questions, we may be able to eliminate
> these vmemmap_pgtable_prealloc/vmemmap_pgtable_free calls in hugetlb.c.
> What about adding the calls to free_huge_page_vmemmap?
> At the beginning of free_huge_page_vmemmap, allocate any vmemmap pgtable
> pages.  If it fails, skip optimization.  We can free any pages before
> returning to the caller.

You are right because we've introduced HPageVmemmapOptimized flag.
It can be useful here. If failing to optimize vmemmap is allowed, we can
eliminate allocating/freeing page table helpers. Thanks for your reminder.

>
> Since we also know the page/address in the page table can we check to see
> if it is already PTE mapped.  If so, can we then skip allocation?

Good point. We need to allocate 512 page tables when splitting
1 GB huge page. If we fail to allocate page tables in the middle
of processing of remapping, we should restore the previous
mapping. I just want to clarify something for myself.

Thanks, Mike. I'll try in the next version.


> --
> Mike Kravetz
