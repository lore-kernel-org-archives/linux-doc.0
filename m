Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BAAC8C5517A
	for <linux-doc@archiver.kernel.org>; Wed, 11 Nov 2020 03:42:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6774D207BB
	for <linux-doc@archiver.kernel.org>; Wed, 11 Nov 2020 03:42:18 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.b="nDSsuklB"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726037AbgKKDmR (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 10 Nov 2020 22:42:17 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725923AbgKKDmP (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 10 Nov 2020 22:42:15 -0500
Received: from mail-pj1-x1043.google.com (mail-pj1-x1043.google.com [IPv6:2607:f8b0:4864:20::1043])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 434CAC0613D4
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2020 19:42:14 -0800 (PST)
Received: by mail-pj1-x1043.google.com with SMTP id g19so9820pji.0
        for <linux-doc@vger.kernel.org>; Tue, 10 Nov 2020 19:42:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=3RCk5Lg80tCKH2h84e6aWqwn6rIZrZeLyv6urQGsnrk=;
        b=nDSsuklBIZ6PLGuj/KDWKEZDFoJ/cIPGYSaxv/eHUCvyCiR0swrdgUHEO+cof0xset
         UA/IWOo2xczA8lSz/6XYBzeMnedQt+f3Vv0OiMQidxgiTBt2w7EpK0JO11EOuwwW9Hc0
         XzCSgqCd2/l5p6CxxDuKsUq+lvPB20MOjtnmxtZ+8vc1jl+6G2Vu+c40pu0TzqDnY7Sz
         sar5t7w7Nu0fL9yvErXSw5xYQGL2WNBcIMlowSSQT9SHMmTQdvaeCXLsR7X7nrv9GhJh
         7Pi6VqHkdRryHB3Rw9928ks8EHXIC1Ah8QDpuG2WcGScmA0P6luXl/dQT5OVl4E2COwn
         VyWA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=3RCk5Lg80tCKH2h84e6aWqwn6rIZrZeLyv6urQGsnrk=;
        b=KTooWIGnjC64czOzXjpPxJkNYWtSjCJtcQwiLmTXpRy86RDXy1jlQbNZDrWS1zBk/4
         OMDUsnlMiH+P7fMLKsLd56JucPQfsnSHWgl7/cp/dVF+9Wxy8T9JtVNOLQQGaTTNtLw1
         0ld3pRbZ9lV5yC3X+Q7XqZPxnsHrKI4vgyPKZPbTOLk/qUBISpZSFUYke/PcRf7jIAK8
         1PR4vwe7tapAXAX+ngRnhzVKaUkrTw+AsYMjT/aY3WJueFlFkQbU906AROz7D/dtX8V7
         nJnlwT8SXWY/ZT6Q+Jy3XgTpeUWhPreKwXQg2/mW7H/wew16uayTYhbBA74NkzKr6OjF
         12JA==
X-Gm-Message-State: AOAM531VCG7Rd7jm/f5761oJUFhXqErMwPmrGl0NRpI6SgfOyQ8gVvQc
        gcksn8SQISTYerGE6sCorkokjeZ8ssi1AITOTX2hEQ==
X-Google-Smtp-Source: ABdhPJxF7ZRGO4wQDKRrKPCJgMcOEFMd947qOplSNFxKgHU19KphVlDhswATyIvHm7poYitt6oUJ8mgehNoWhFFmRFI=
X-Received: by 2002:a17:90a:4749:: with SMTP id y9mr1747464pjg.229.1605066133283;
 Tue, 10 Nov 2020 19:42:13 -0800 (PST)
MIME-Version: 1.0
References: <20201108141113.65450-1-songmuchun@bytedance.com>
 <20201108141113.65450-6-songmuchun@bytedance.com> <9dc62874-379f-b126-94a7-5bd477529407@oracle.com>
In-Reply-To: <9dc62874-379f-b126-94a7-5bd477529407@oracle.com>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Wed, 11 Nov 2020 11:41:37 +0800
Message-ID: <CAMZfGtV+_vP66N1WagwNfxs4r3QGwnrYoR60yimwutTs=awXag@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v3 05/21] mm/hugetlb: Introduce pgtable
 allocation/freeing helpers
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
        Xiongchun duan <duanxiongchun@bytedance.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Nov 11, 2020 at 8:47 AM Mike Kravetz <mike.kravetz@oracle.com> wrote:
>
> On 11/8/20 6:10 AM, Muchun Song wrote:
> > On x86_64, vmemmap is always PMD mapped if the machine has hugepages
> > support and if we have 2MB contiguos pages and PMD aligned. If we want
> > to free the unused vmemmap pages, we have to split the huge pmd firstly.
> > So we should pre-allocate pgtable to split PMD to PTE.
> >
> > diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> > index a0007902fafb..5c7be2ee7e15 100644
> > --- a/mm/hugetlb.c
> > +++ b/mm/hugetlb.c
> > @@ -1303,6 +1303,108 @@ static inline void destroy_compound_gigantic_page(struct page *page,
> ...
> > +static inline void vmemmap_pgtable_init(struct page *page)
> > +{
> > +     page_huge_pte(page) = NULL;
> > +}
> > +
> > +static void vmemmap_pgtable_deposit(struct page *page, pgtable_t pgtable)
> > +{
> > +     /* FIFO */
> > +     if (!page_huge_pte(page))
> > +             INIT_LIST_HEAD(&pgtable->lru);
> > +     else
> > +             list_add(&pgtable->lru, &page_huge_pte(page)->lru);
> > +     page_huge_pte(page) = pgtable;
> > +}
> > +
> > +static pgtable_t vmemmap_pgtable_withdraw(struct page *page)
> > +{
> > +     pgtable_t pgtable;
> > +
> > +     /* FIFO */
> > +     pgtable = page_huge_pte(page);
> > +     page_huge_pte(page) = list_first_entry_or_null(&pgtable->lru,
> > +                                                    struct page, lru);
> > +     if (page_huge_pte(page))
> > +             list_del(&pgtable->lru);
> > +     return pgtable;
> > +}
> > +
> > +static int vmemmap_pgtable_prealloc(struct hstate *h, struct page *page)
> > +{
> > +     int i;
> > +     pgtable_t pgtable;
> > +     unsigned int nr = pgtable_pages_to_prealloc_per_hpage(h);
> > +
> > +     if (!nr)
> > +             return 0;
> > +
> > +     vmemmap_pgtable_init(page);
> > +
> > +     for (i = 0; i < nr; i++) {
> > +             pte_t *pte_p;
> > +
> > +             pte_p = pte_alloc_one_kernel(&init_mm);
> > +             if (!pte_p)
> > +                     goto out;
> > +             vmemmap_pgtable_deposit(page, virt_to_page(pte_p));
> > +     }
> > +
> > +     return 0;
> > +out:
> > +     while (i-- && (pgtable = vmemmap_pgtable_withdraw(page)))
> > +             pte_free_kernel(&init_mm, page_to_virt(pgtable));
> > +     return -ENOMEM;
> > +}
> > +
> > +static void vmemmap_pgtable_free(struct hstate *h, struct page *page)
> > +{
> > +     pgtable_t pgtable;
> > +     unsigned int nr = pgtable_pages_to_prealloc_per_hpage(h);
> > +
> > +     if (!nr)
> > +             return;
> > +
> > +     pgtable = page_huge_pte(page);
> > +     if (!pgtable)
> > +             return;
> > +
> > +     while (nr-- && (pgtable = vmemmap_pgtable_withdraw(page)))
> > +             pte_free_kernel(&init_mm, page_to_virt(pgtable));
> > +}
>
> I may be confused.
>
> In patch 9 of this series, the first call to vmemmap_pgtable_free() is made:
>
> > @@ -1645,6 +1799,10 @@ void free_huge_page(struct page *page)
> >
> >  static void prep_new_huge_page(struct hstate *h, struct page *page, int nid)
> >  {
> > +     free_huge_page_vmemmap(h, page);
> > +     /* Must be called before the initialization of @page->lru */
> > +     vmemmap_pgtable_free(h, page);
> > +
> >       INIT_LIST_HEAD(&page->lru);
> >       set_compound_page_dtor(page, HUGETLB_PAGE_DTOR);
> >       set_hugetlb_cgroup(page, NULL);
>
> When I saw that comment in previous patch series, I assumed page->lru was
> being used to store preallocated pages and pages to free.  However, unless

Yeah, you are right.

> I am reading the code incorrectly it does not appear page->lru (of the huge
> page) is being used for this purpose.  Is that correct?
>
> If it is correct, would using page->lru of the huge page make this code
> simpler?  I am just missing the reason why you are using
> page_huge_pte(page)->lru

For 1GB HugeTLB pages, we should pre-allocate more than one page
table. So I use a linked list. The page_huge_pte(page) is the list head.
Because the page->lru shares storage with page->pmd_huge_pte.

+     /* Must be called before the initialization of @page->lru */
+     vmemmap_pgtable_free(h, page);
+
       INIT_LIST_HEAD(&page->lru);

Here we initialize the lru. So the vmemmap_pgtable_free should
be called before this. It seems like that I should point out this "share"
in the comment.

Thanks.

>
> --
> Mike Kravetz



-- 
Yours,
Muchun
