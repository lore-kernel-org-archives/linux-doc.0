Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5F83FC48BD1
	for <linux-doc@archiver.kernel.org>; Fri, 11 Jun 2021 12:37:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4060D613B8
	for <linux-doc@archiver.kernel.org>; Fri, 11 Jun 2021 12:37:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231270AbhFKMju (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 11 Jun 2021 08:39:50 -0400
Received: from mail-pj1-f47.google.com ([209.85.216.47]:44687 "EHLO
        mail-pj1-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230382AbhFKMjt (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 11 Jun 2021 08:39:49 -0400
Received: by mail-pj1-f47.google.com with SMTP id h12-20020a17090aa88cb029016400fd8ad8so5909272pjq.3
        for <linux-doc@vger.kernel.org>; Fri, 11 Jun 2021 05:37:37 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=12Vllmb27JTcKGXEJV8r1BAI8OMCziqg4MFGRk+RiQc=;
        b=aIbxHPH4LxhzTr+MvcOZubxGwHrqudcYvCJjmRVVfNe60Py/se92CDO44lQ3VrJGJ5
         plYXLmWGs942FFDp37HO8TsKCSXhEXZq+fxwxfQrSRlRgd+glhJjMrVNv+xIXsUth+yl
         coiIT5ZRvk63POl6PbmDTdpYGNxVlX2xmZumfmz1FpFMpwirk1pCzeV6zlfsGBDvFJPH
         XVYScY7gM2+mEQDBGYNvoAIVIsARS2Wp7NA13UdwwuXqQc/hABcoTkNyOhmD1/lq6BLI
         JFIciIC29psRSTwDvbq9pou0NrJ6I7R7FhE8oe47djDTo2alX9/zgkk9/4Al5G7qOUwS
         ufVg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=12Vllmb27JTcKGXEJV8r1BAI8OMCziqg4MFGRk+RiQc=;
        b=TVQGiB58bNWwhk8ukS8g5tvQm81LrI1WvrVvjIVB+tUQSuhnP/1JOlVasHXQTO9sIg
         W17kpk+RwqkZ4AE9YwAmnJwT25FDINFx90tWfHisAp89s91pVxGZDNRpGpGDAAye9JPS
         Wmuh4sb14a4vmiI3Qq4OYiS8OKAfvASilZkfS47RGwGjsTRCfYEQcT1LHgxIV8ZgXq0m
         Gn6nNFtjN8I8dz5UpFEL9JBawUBdwrpjsvCTd7ljy8yEXCWuyqvOM5Q9Qk4CIXwTX8ze
         muttaX3Xhod/6tfbOm1k0teK2CyHwistgbISBNhm7/W2iEqx4jiYQZcOC/HQC+rLB2KH
         j0jw==
X-Gm-Message-State: AOAM530/bUQm2Wczra0jqIX/80KJyuNktj37akSoydLnhkHTnP2Q26tx
        k96aOfoBIwWWp7loYfaPYVU6dAMii3wOMVh9yD7DQQ==
X-Google-Smtp-Source: ABdhPJwXzHGIkJWA9jG9u+8cCrLseq1HhgXSPHBPWWqIPGSMO2zyWAeVhMAlvBmyfyXKZmFGriSZk71r9BVeiCfNvmE=
X-Received: by 2002:a17:90a:10c8:: with SMTP id b8mr1907381pje.147.1623414997443;
 Fri, 11 Jun 2021 05:36:37 -0700 (PDT)
MIME-Version: 1.0
References: <20210609121310.62229-1-songmuchun@bytedance.com>
 <20210609121310.62229-4-songmuchun@bytedance.com> <1c910c9a-d5fd-8eb8-526d-bb1f71833c30@oracle.com>
 <CAMZfGtU6D28AzoGsVdddrf54P_O-134j2dEMu6gn+uiBJkdi9Q@mail.gmail.com>
In-Reply-To: <CAMZfGtU6D28AzoGsVdddrf54P_O-134j2dEMu6gn+uiBJkdi9Q@mail.gmail.com>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Fri, 11 Jun 2021 20:35:59 +0800
Message-ID: <CAMZfGtUv+ZOGxH_f_2JGQGDFvFw-o69BiyJUSX-BLmZVZ1Y+dg@mail.gmail.com>
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

On Fri, Jun 11, 2021 at 3:52 PM Muchun Song <songmuchun@bytedance.com> wrote:
>
> On Fri, Jun 11, 2021 at 6:35 AM Mike Kravetz <mike.kravetz@oracle.com> wrote:
> >
> > On 6/9/21 5:13 AM, Muchun Song wrote:
> > > If the vmemmap is huge PMD mapped, we should split the huge PMD firstly
> > > and then we can change the PTE page table entry. In this patch, we add
> > > the ability of splitting the huge PMD mapping of vmemmap pages.
> > >
> > > Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> > > ---
> > >  include/linux/mm.h   |  2 +-
> > >  mm/hugetlb.c         | 42 ++++++++++++++++++++++++++++++++++--
> > >  mm/hugetlb_vmemmap.c |  3 ++-
> > >  mm/sparse-vmemmap.c  | 61 +++++++++++++++++++++++++++++++++++++++++++++-------
> > >  4 files changed, 96 insertions(+), 12 deletions(-)
> > >
> > > diff --git a/include/linux/mm.h b/include/linux/mm.h
> > > index cadc8cc2c715..b97e1486c5c1 100644
> > > --- a/include/linux/mm.h
> > > +++ b/include/linux/mm.h
> > > @@ -3056,7 +3056,7 @@ static inline void print_vma_addr(char *prefix, unsigned long rip)
> > >  #endif
> > >
> > >  void vmemmap_remap_free(unsigned long start, unsigned long end,
> > > -                     unsigned long reuse);
> > > +                     unsigned long reuse, struct list_head *pgtables);
> > >  int vmemmap_remap_alloc(unsigned long start, unsigned long end,
> > >                       unsigned long reuse, gfp_t gfp_mask);
> > >
> > > diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> > > index c3b2a8a494d6..3137c72d9cc7 100644
> > > --- a/mm/hugetlb.c
> > > +++ b/mm/hugetlb.c
> > > @@ -1609,6 +1609,13 @@ static void __prep_account_new_huge_page(struct hstate *h, int nid)
> > >  static void __prep_new_huge_page(struct hstate *h, struct page *page)
> > >  {
> > >       free_huge_page_vmemmap(h, page);
> > > +     /*
> > > +      * Because we store preallocated pages on @page->lru,
> > > +      * vmemmap_pgtable_free() must be called before the
> > > +      * initialization of @page->lru in INIT_LIST_HEAD().
> > > +      */
> > > +     vmemmap_pgtable_free(&page->lru);
> > > +
> > >       INIT_LIST_HEAD(&page->lru);
> > >       set_compound_page_dtor(page, HUGETLB_PAGE_DTOR);
> > >       hugetlb_set_page_subpool(page, NULL);
> > > @@ -1775,14 +1782,29 @@ static struct page *alloc_fresh_huge_page(struct hstate *h,
> > >               nodemask_t *node_alloc_noretry)
> > >  {
> > >       struct page *page;
> > > +     LIST_HEAD(pgtables);
> > > +
> > > +     if (vmemmap_pgtable_prealloc(h, &pgtables))
> > > +             return NULL;
> >
> > In the previous two patches I asked:
> > - Can we wait until later to prealloc vmemmap pages for gigantic pages
> >   allocated from bootmem?
> > - Should we fail to add a hugetlb page to the pool if we can not do
> >   vmemmap optimization?
> >
> >
> > Depending on the answers to those questions, we may be able to eliminate
> > these vmemmap_pgtable_prealloc/vmemmap_pgtable_free calls in hugetlb.c.
> > What about adding the calls to free_huge_page_vmemmap?
> > At the beginning of free_huge_page_vmemmap, allocate any vmemmap pgtable
> > pages.  If it fails, skip optimization.  We can free any pages before
> > returning to the caller.
>
> You are right because we've introduced HPageVmemmapOptimized flag.
> It can be useful here. If failing to optimize vmemmap is allowed, we can
> eliminate allocating/freeing page table helpers. Thanks for your reminder.
>
> >
> > Since we also know the page/address in the page table can we check to see
> > if it is already PTE mapped.  If so, can we then skip allocation?
>
> Good point. We need to allocate 512 page tables when splitting

Sorry, it is 7 page tables here.

> 1 GB huge page. If we fail to allocate page tables in the middle
> of processing of remapping, we should restore the previous
> mapping. I just want to clarify something for myself.
>
> Thanks, Mike. I'll try in the next version.
>
>
> > --
> > Mike Kravetz
