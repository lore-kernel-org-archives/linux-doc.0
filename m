Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6303C433B4
	for <linux-doc@archiver.kernel.org>; Sat, 17 Apr 2021 04:14:51 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 91113611AB
	for <linux-doc@archiver.kernel.org>; Sat, 17 Apr 2021 04:14:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229631AbhDQEPP (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 17 Apr 2021 00:15:15 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55416 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229533AbhDQEOu (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 17 Apr 2021 00:14:50 -0400
Received: from mail-pl1-x633.google.com (mail-pl1-x633.google.com [IPv6:2607:f8b0:4864:20::633])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D8CD4C06175F
        for <linux-doc@vger.kernel.org>; Fri, 16 Apr 2021 21:13:53 -0700 (PDT)
Received: by mail-pl1-x633.google.com with SMTP id u7so13174185plr.6
        for <linux-doc@vger.kernel.org>; Fri, 16 Apr 2021 21:13:53 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ylgfgCTB63uVvdacThJs9TcQmae/fWoutKmKR8VmUn4=;
        b=y4PC6dhtLnxM+GheU9KrGq+aZszXhMW31nY1EERC+Q72IGwebhRGazT63ogIYWDj9U
         bDAh3OQw+ccOX2q0qvSG2KEEMjFgOT4A45hkFRtshiPAth22yLZ2MF3dhsUkV5YBqEvl
         4dOGTAwsLEvtH1HBM5TYHtqF7EqdsZ3Ek8cIgdkIsk0M0SGrv5+rYesR4Ol/RBZGkTPr
         bqq+nda5GpPH4KS5Belg9AP4J6t5ACS7h9yC4GhWf+1yzPr8RMMLCdWP+JznF/FtmnFo
         Oef0zZVhvFSkR9DoOF6bQ9aQykFqqsHWSvCrnJ/Cj/lnFL/OABVuwCXJ5q3/sotSBdg4
         p8OA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ylgfgCTB63uVvdacThJs9TcQmae/fWoutKmKR8VmUn4=;
        b=b+rhCrzGYd5e15kfJm4ygjki0nbsZGYqO1QWF/eVsHJ5oS0OSnarxxsEcEAiyOArOO
         bUUq8SUCBTNIexGThEAoEljLHZ5GptChlNrKcgbc/tSJlXIBJA4NrchGm2O7GsV/Zh41
         mF0gD7Y7bheb0wlTQ1V8Ob7guKVjjeBMjotzRy7UPfIMasIji8oukxJX7346PLjCXpu/
         FgQBgCojj/QmNU+bnbF4QiZyM9n96/x8C5Z2+BnM8E18Qu/1KsTIX4W6ChEYWc8dKznX
         LU84g9t2wIlNeW05T9yEVojGlKPr1+PuzFbewGAHFiv+Yc0qtuuvrQ1LnLv54WAjomO5
         fPzw==
X-Gm-Message-State: AOAM531aEB15pJ0f+RCRnuhF2KZW3z8PjkKyY2BnY8oodg1tQbmYcVxC
        h5RtbKhBT1Gmt1DfV7/eKLzWcU5cA80RPCdhtH6YFQ==
X-Google-Smtp-Source: ABdhPJyTA/qdCYB5+347wvSUfF0S0QefLWSkq+r4WoEHhHvTfIvW8GVDcnUKBnDhsKr6eX5RccpxInyNQNh1cYXazl8=
X-Received: by 2002:a17:90a:a895:: with SMTP id h21mr13280750pjq.13.1618632833248;
 Fri, 16 Apr 2021 21:13:53 -0700 (PDT)
MIME-Version: 1.0
References: <20210415084005.25049-1-songmuchun@bytedance.com>
 <20210415084005.25049-6-songmuchun@bytedance.com> <33a4f2fe-72c2-a3a1-9205-461ddde9b162@oracle.com>
In-Reply-To: <33a4f2fe-72c2-a3a1-9205-461ddde9b162@oracle.com>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Sat, 17 Apr 2021 12:13:17 +0800
Message-ID: <CAMZfGtWXpTfeHeuHJdX5hjd03sNabZeh7Uzw7sPqgOFCWQDDZA@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v20 5/9] mm: hugetlb: defer freeing of
 HugeTLB pages
To:     Mike Kravetz <mike.kravetz@oracle.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, bp@alien8.de,
        X86 ML <x86@kernel.org>, hpa@zytor.com,
        dave.hansen@linux.intel.com, luto@kernel.org,
        Peter Zijlstra <peterz@infradead.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>, paulmck@kernel.org,
        pawan.kumar.gupta@linux.intel.com,
        Randy Dunlap <rdunlap@infradead.org>, oneukum@suse.com,
        anshuman.khandual@arm.com, jroedel@suse.de,
        Mina Almasry <almasrymina@google.com>,
        David Rientjes <rientjes@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        Oscar Salvador <osalvador@suse.de>,
        Michal Hocko <mhocko@suse.com>,
        "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>,
        David Hildenbrand <david@redhat.com>,
        =?UTF-8?B?SE9SSUdVQ0hJIE5BT1lBKOWggOWPoyDnm7TkuZ8p?= 
        <naoya.horiguchi@nec.com>,
        Joao Martins <joao.m.martins@oracle.com>,
        Xiongchun duan <duanxiongchun@bytedance.com>,
        fam.zheng@bytedance.com, linux-doc@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Apr 17, 2021 at 7:56 AM Mike Kravetz <mike.kravetz@oracle.com> wrote:
>
> On 4/15/21 1:40 AM, Muchun Song wrote:
> > In the subsequent patch, we should allocate the vmemmap pages when
> > freeing a HugeTLB page. But update_and_free_page() can be called
> > under any context, so we cannot use GFP_KERNEL to allocate vmemmap
> > pages. However, we can defer the actual freeing in a kworker to
> > prevent from using GFP_ATOMIC to allocate the vmemmap pages.
>
> Thanks!  I knew we would need to introduce a kworker for this when I
> removed the kworker previously used in free_huge_page.

Yeah, but another choice is using GFP_ATOMIC to allocate vmemmap
pages when we are in an atomic context. If not atomic context, just
use GFP_KERNEL. In this case, we can drop kworker.

>
> > The __update_and_free_page() is where the call to allocate vmemmmap
> > pages will be inserted.
>
> This patch adds the functionality required for __update_and_free_page
> to potentially sleep and fail.  More questions will come up in the
> subsequent patch when code must deal with the failures.

Right. More questions are welcome.

>
> >
> > Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> > ---
> >  mm/hugetlb.c         | 73 ++++++++++++++++++++++++++++++++++++++++++++++++----
> >  mm/hugetlb_vmemmap.c | 12 ---------
> >  mm/hugetlb_vmemmap.h | 17 ++++++++++++
> >  3 files changed, 85 insertions(+), 17 deletions(-)
> >
> > diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> > index 923d05e2806b..eeb8f5480170 100644
> > --- a/mm/hugetlb.c
> > +++ b/mm/hugetlb.c
> > @@ -1376,7 +1376,7 @@ static void remove_hugetlb_page(struct hstate *h, struct page *page,
> >       h->nr_huge_pages_node[nid]--;
> >  }
> >
> > -static void update_and_free_page(struct hstate *h, struct page *page)
> > +static void __update_and_free_page(struct hstate *h, struct page *page)
> >  {
> >       int i;
> >       struct page *subpage = page;
> > @@ -1399,12 +1399,73 @@ static void update_and_free_page(struct hstate *h, struct page *page)
> >       }
> >  }
> >
> > +/*
> > + * As update_and_free_page() can be called under any context, so we cannot
> > + * use GFP_KERNEL to allocate vmemmap pages. However, we can defer the
> > + * actual freeing in a workqueue to prevent from using GFP_ATOMIC to allocate
> > + * the vmemmap pages.
> > + *
> > + * free_hpage_workfn() locklessly retrieves the linked list of pages to be
> > + * freed and frees them one-by-one. As the page->mapping pointer is going
> > + * to be cleared in free_hpage_workfn() anyway, it is reused as the llist_node
> > + * structure of a lockless linked list of huge pages to be freed.
> > + */
> > +static LLIST_HEAD(hpage_freelist);
> > +
> > +static void free_hpage_workfn(struct work_struct *work)
> > +{
> > +     struct llist_node *node;
> > +
> > +     node = llist_del_all(&hpage_freelist);
> > +
> > +     while (node) {
> > +             struct page *page;
> > +             struct hstate *h;
> > +
> > +             page = container_of((struct address_space **)node,
> > +                                  struct page, mapping);
> > +             node = node->next;
> > +             page->mapping = NULL;
> > +             h = page_hstate(page);
>
> The VM_BUG_ON_PAGE(!PageHuge(page), page) in page_hstate is going to
> trigger because a previous call to remove_hugetlb_page() will
> set_compound_page_dtor(page, NULL_COMPOUND_DTOR)

Sorry, I did not realise that. Thanks for your reminder.

>
> Note how h(hstate) is grabbed before calling update_and_free_page in
> existing code.
>
> We could potentially drop the !PageHuge(page) in page_hstate.  Or,
> perhaps just use 'size_to_hstate(page_size(page))' in free_hpage_workfn.

I prefer not to change the behavior of page_hstate(). So I
should use 'size_to_hstate(page_size(page))' directly.

Thanks Mike.


> --
> Mike Kravetz
