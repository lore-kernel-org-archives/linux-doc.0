Return-Path: <SRS0=kdU1=EL=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7027C55178
	for <linux-doc@archiver.kernel.org>; Thu,  5 Nov 2020 16:09:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5998420936
	for <linux-doc@archiver.kernel.org>; Thu,  5 Nov 2020 16:09:03 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.b="pThxNC2i"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730973AbgKEQJC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 5 Nov 2020 11:09:02 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60216 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727275AbgKEQJC (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 5 Nov 2020 11:09:02 -0500
Received: from mail-pj1-x1042.google.com (mail-pj1-x1042.google.com [IPv6:2607:f8b0:4864:20::1042])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 62AAEC0613D3
        for <linux-doc@vger.kernel.org>; Thu,  5 Nov 2020 08:09:02 -0800 (PST)
Received: by mail-pj1-x1042.google.com with SMTP id k2so306073pjg.2
        for <linux-doc@vger.kernel.org>; Thu, 05 Nov 2020 08:09:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DNv8EosKffE1C3jvJ0rJJftgCHCwNxl7hTu0xBgm/Zs=;
        b=pThxNC2iJ8WFGX/CGhbMOz/uQOkRR402aJuKaha93Pq/6th/4+9b3EQxZYmYMja8bt
         JGNVYLyczLTg2hqy5qZBWT3Qlql1DyFTk1DUA3WPaJxLhLn+HdXlsk1pmfYlKC32a0Ki
         zHxNATnnT6UY5TqJcf94WHtNHakHxKdieBbEnx3OasXX7Q21307PjKgIZSG5WzPjd5Ha
         nMA1b85jwYf6oFl3eUW1PUHpKY341qDdil2h3EQX+oGvUp1GvL6FUtzf5k9K2pB3+nAc
         RahaqWpJdCTC5R7p6o0Pm5Sl5Wsj+YZmm+yJOrvelDAt2iswhlHggy22P1C3OpaM7QAB
         friA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DNv8EosKffE1C3jvJ0rJJftgCHCwNxl7hTu0xBgm/Zs=;
        b=SuPiSdSdxToa6ce0tgSRnr9EXmOz2zPzBlCUXo6C3yze5vBw/AeVMa17+YYQpb8DRG
         t452z71yLYQjhunKFsmGjIlVD0GvpagPUHyZbElTQu9TJaSou8tCzUun3j8cTqOsFjqd
         eq0xw05/Q8PI9GLaQH4FmqXQllI5cvSu1mVGDknolL7v7GMZqpWdtZtmTMKxL/Jmb4Ow
         9oOY7HVws7QwJH/sJtxHe8GLUcLxyzIECTZk7La/zCSj/XhVHCeq3KGzyKUmOB76q9Fx
         fC/4rh6FLuE1Pb3SVB9/SvEnOvQ2Qdx2DouHEnjazuCMlQ/4xuSUvmbCR12EphmalD8F
         ywTQ==
X-Gm-Message-State: AOAM531wlShVQMwH9q5G0GRBLJ0F/1dX1nIrWkixav1BqJCbZKQyHY/P
        tuxq6FgzdiqGGEF1TQp/RALUzhenZduwK4zPbhHVMA==
X-Google-Smtp-Source: ABdhPJyfkwi9gxSQB/Njp7wQRtuErG+nc9B9XUg+PiBnL0eCmyKFJMhKuJYI9/DMyjHpnFYTEqRY9c+gEThQzv17YF8=
X-Received: by 2002:a17:902:aa86:b029:d6:99d8:3fff with SMTP id
 d6-20020a170902aa86b02900d699d83fffmr2954337plr.34.1604592541785; Thu, 05 Nov
 2020 08:09:01 -0800 (PST)
MIME-Version: 1.0
References: <20201026145114.59424-1-songmuchun@bytedance.com>
 <20201026145114.59424-6-songmuchun@bytedance.com> <20201105132337.GA7552@linux>
In-Reply-To: <20201105132337.GA7552@linux>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Fri, 6 Nov 2020 00:08:22 +0800
Message-ID: <CAMZfGtXwKJ3uCuNC3mxHQLNJqTcUzj7Gd2-JRuOWEjZ1C7Oh=A@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v2 05/19] mm/hugetlb: Introduce pgtable
 allocation/freeing helpers
To:     Oscar Salvador <osalvador@suse.de>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Mike Kravetz <mike.kravetz@oracle.com>,
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
        Xiongchun duan <duanxiongchun@bytedance.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Nov 5, 2020 at 9:23 PM Oscar Salvador <osalvador@suse.de> wrote:
>
> On Mon, Oct 26, 2020 at 10:51:00PM +0800, Muchun Song wrote:
> > +#ifdef CONFIG_HUGETLB_PAGE_FREE_VMEMMAP
> > +#define VMEMMAP_HPAGE_SHIFT                  PMD_SHIFT
> > +#define arch_vmemmap_support_huge_mapping()  boot_cpu_has(X86_FEATURE_PSE)
>
> I do not think you need this.
> We already have hugepages_supported().

Maybe some architectures support hugepage, but the vmemmap do not
use the hugepage map. In  this case, we need it. But I am not sure if it
exists in the real world. At least, x86 can reuse hugepages_supported.

>
> > +#ifdef CONFIG_HUGETLB_PAGE_FREE_VMEMMAP
> > +#ifndef arch_vmemmap_support_huge_mapping
> > +static inline bool arch_vmemmap_support_huge_mapping(void)
> > +{
> > +     return false;
> > +}
>
> Same as above
>
> >  static inline unsigned int nr_free_vmemmap(struct hstate *h)
> >  {
> >       return h->nr_free_vmemmap_pages;
> >  }
> >
> > +static inline unsigned int nr_vmemmap(struct hstate *h)
> > +{
> > +     return nr_free_vmemmap(h) + RESERVE_VMEMMAP_NR;
> > +}
> > +
> > +static inline unsigned long nr_vmemmap_size(struct hstate *h)
> > +{
> > +     return (unsigned long)nr_vmemmap(h) << PAGE_SHIFT;
> > +}
> > +
> > +static inline unsigned int nr_pgtable(struct hstate *h)
> > +{
> > +     unsigned long vmemmap_size = nr_vmemmap_size(h);
> > +
> > +     if (!arch_vmemmap_support_huge_mapping())
> > +             return 0;
> > +
> > +     /*
> > +      * No need pre-allocate page tabels when there is no vmemmap pages
> > +      * to free.
> > +      */
> > +     if (!nr_free_vmemmap(h))
> > +             return 0;
> > +
> > +     return ALIGN(vmemmap_size, VMEMMAP_HPAGE_SIZE) >> VMEMMAP_HPAGE_SHIFT;
> > +}
>
> IMHO, Mike's naming suggestion fit much better.

I will do that.

>
> > +static void vmemmap_pgtable_deposit(struct page *page, pte_t *pte_p)
> > +{
> > +     pgtable_t pgtable = virt_to_page(pte_p);
> > +
> > +     /* FIFO */
> > +     if (!page_huge_pte(page))
> > +             INIT_LIST_HEAD(&pgtable->lru);
> > +     else
> > +             list_add(&pgtable->lru, &page_huge_pte(page)->lru);
> > +     page_huge_pte(page) = pgtable;
> > +}
>
> I think it would make more sense if this took a pgtable argument
> instead of a pte_t *.

Will do. Thanks for your suggestions.

>
> > +static pte_t *vmemmap_pgtable_withdraw(struct page *page)
> > +{
> > +     pgtable_t pgtable;
> > +
> > +     /* FIFO */
> > +     pgtable = page_huge_pte(page);
> > +     if (unlikely(!pgtable))
> > +             return NULL;
>
> AFAICS, above check only needs to be run once.
> It think we can move it to vmemmap_pgtable_free, can't we?

Yeah, we can. Thanks.

>
> > +     page_huge_pte(page) = list_first_entry_or_null(&pgtable->lru,
> > +                                                    struct page, lru);
> > +     if (page_huge_pte(page))
> > +             list_del(&pgtable->lru);
> > +     return page_to_virt(pgtable);
> > +}
>
> At the risk of adding more code, I think it would be nice to return a
> pagetable_t?
> So it is more coherent with the name of the function and with what
> we are doing.

Yeah.

>
> It is a pity we cannot converge these and pgtable_trans_huge_*.
> They share some code but it is different enough.
>
> > +static int vmemmap_pgtable_prealloc(struct hstate *h, struct page *page)
> > +{
> > +     int i;
> > +     pte_t *pte_p;
> > +     unsigned int nr = nr_pgtable(h);
> > +
> > +     if (!nr)
> > +             return 0;
> > +
> > +     vmemmap_pgtable_init(page);
>
> Maybe just open code this one?

Sorry. I don't quite understand what it means. Could you explain?


>
> > +static inline void vmemmap_pgtable_free(struct hstate *h, struct page *page)
> > +{
> > +     pte_t *pte_p;
> > +
> > +     if (!nr_pgtable(h))
> > +             return;
> > +
> > +     while ((pte_p = vmemmap_pgtable_withdraw(page)))
> > +             pte_free_kernel(&init_mm, pte_p);
>
> As mentioned above, move the pgtable_t check from vmemmap_pgtable_withdraw
> in here.

OK.

>
>
> >  static void prep_new_huge_page(struct hstate *h, struct page *page, int nid)
> >  {
> > +     /* Must be called before the initialization of @page->lru */
> > +     vmemmap_pgtable_free(h, page);
> > +
> >       INIT_LIST_HEAD(&page->lru);
> >       set_compound_page_dtor(page, HUGETLB_PAGE_DTOR);
> >       set_hugetlb_cgroup(page, NULL);
> > @@ -1783,6 +1892,14 @@ static struct page *alloc_fresh_huge_page(struct hstate *h,
> >       if (!page)
> >               return NULL;
> >
> > +     if (vmemmap_pgtable_prealloc(h, page)) {
> > +             if (hstate_is_gigantic(h))
> > +                     free_gigantic_page(page, huge_page_order(h));
> > +             else
> > +                     put_page(page);
> > +             return NULL;
> > +     }
> > +
>
> I must confess I am bit puzzled.
>
> IIUC, in this patch we are just adding the helpers to create/tear the page
> tables.
> I do not think we actually need to call vmemmap_pgtable_prealloc/vmemmap_pgtable_free, do we?
> In the end, we are just allocating pages for pagetables and then free them shortly.
>
> I think it would make more sense to add the calls when they need to be?

OK,  will do. Thanks very much.

>
>
> --
> Oscar Salvador
> SUSE L3



--
Yours,
Muchun
