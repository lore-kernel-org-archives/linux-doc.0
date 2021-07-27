Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 87293C4338F
	for <linux-doc@archiver.kernel.org>; Tue, 27 Jul 2021 07:16:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 64BC161078
	for <linux-doc@archiver.kernel.org>; Tue, 27 Jul 2021 07:16:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235841AbhG0HQa (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 27 Jul 2021 03:16:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235558AbhG0HQ3 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 27 Jul 2021 03:16:29 -0400
Received: from mail-pj1-x1030.google.com (mail-pj1-x1030.google.com [IPv6:2607:f8b0:4864:20::1030])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4155CC061757
        for <linux-doc@vger.kernel.org>; Tue, 27 Jul 2021 00:16:30 -0700 (PDT)
Received: by mail-pj1-x1030.google.com with SMTP id g23-20020a17090a5797b02901765d605e14so3606151pji.5
        for <linux-doc@vger.kernel.org>; Tue, 27 Jul 2021 00:16:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=bKC84XaSphQuDQX3Q4os9LEp/o8VsHBxPfbvxrdpw8g=;
        b=OwiBlgeDOlRH50jaV5RCT+PgIPPbRpsmxhBpmRsIM9fDqNi/4zgFbY9dopH8RFi0yU
         yuKdMK7KXeNB7+NGVx7NuE5X++fVjy3g5lG4gk+TUs0TOtvPhX+KhcDDlASt7yTD0BHI
         WdxyPbXPJxGuk32uxWIartQfpEtI4PQ/mgf87IgXM/mpEyZwxroIzWYBrz4RB2r9uh1y
         bfs+xBeA6rE5Jcm2+vVYDRkwN4vqNt7lbzJVWIB3CLxmh9YXhV28YakiBJKThwV2AuT9
         dERLtEs+forZ6Eo1llKBcPVc4yzXmqw6ZcofvQ+edDd6Xkud5B4xrXki85fTzKMa3KBA
         /nBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=bKC84XaSphQuDQX3Q4os9LEp/o8VsHBxPfbvxrdpw8g=;
        b=N8XAg4xkl2mSyaqWXBAax1bzXdtLNeVniWNj3k/zxl0unXeHaWpOnSvbtg4bm6cmE7
         jYTD1BSvMRYSfcGSlmr5bmtodLQ7mC8p6Z4TRF+USnucn0erRZt2QWf6WpdLVJUm+/UR
         LO5GQ86KIeGRhOIjIPteuyYPg6+/6PT9Dyl633/8rWTWvRKXS0UwB8boPRYKvE5Uhg0s
         g+kif2Cu7AL0FGgFu0B2yI5Q/P932liDHMav3rfbr8gujsKUzh7AvK+2GlaA2zLXkt4L
         OxyGzsjbftFstK34Th8BJf2D/uZNJ6DE3QR9Dq0qGz53Ef9eQTRts6AKro6fOi1aWBvv
         PERQ==
X-Gm-Message-State: AOAM530wnGNcQRMFcCDkkzSJ5ziq9B9QDTH6awclsOCP9y0je0KtJP7L
        ZVyJ6oTr7Mfh5ze/QHg+CoG40sM/P9OdDjIqhCYzmA==
X-Google-Smtp-Source: ABdhPJxF9oRwI8Oz5wbwdM8pBPWdXdq4eg1Pbto1lovz7LB3/FTv8mQ5dlcrT+l5xb7DKqmFQLNS0DDnBQUH7iy3M0Y=
X-Received: by 2002:a63:cd4b:: with SMTP id a11mr22181343pgj.273.1627370189757;
 Tue, 27 Jul 2021 00:16:29 -0700 (PDT)
MIME-Version: 1.0
References: <20210714091800.42645-1-songmuchun@bytedance.com>
 <20210714091800.42645-4-songmuchun@bytedance.com> <YP8mKV4wTp5sPIZg@casper.infradead.org>
In-Reply-To: <YP8mKV4wTp5sPIZg@casper.infradead.org>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Tue, 27 Jul 2021 15:15:52 +0800
Message-ID: <CAMZfGtUKKcduZb5w7NED53Ke8UwNtiNZRp8ttbUb=TH-K1zgPA@mail.gmail.com>
Subject: Re: [PATCH 3/5] mm: hugetlb: free the 2nd vmemmap page associated
 with each HugeTLB page
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Mike Kravetz <mike.kravetz@oracle.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Oscar Salvador <osalvador@suse.de>,
        Michal Hocko <mhocko@suse.com>,
        "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>,
        David Hildenbrand <david@redhat.com>,
        Chen Huang <chenhuang5@huawei.com>,
        "Bodeddula, Balasubramaniam" <bodeddub@amazon.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Xiongchun duan <duanxiongchun@bytedance.com>,
        fam.zheng@bytedance.com, linux-doc@vger.kernel.org,
        LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        Qi Zheng <zhengqi.arch@bytedance.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Jul 27, 2021 at 5:17 AM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Wed, Jul 14, 2021 at 05:17:58PM +0800, Muchun Song wrote:
> > +#ifdef CONFIG_HUGETLB_PAGE_FREE_VMEMMAP
> > +extern bool hugetlb_free_vmemmap_enabled;
> > +
> > +/*
> > + * If the feature of freeing some vmemmap pages associated with each HugeTLB
> > + * page is enabled, the head vmemmap page frame is reused and all of the tail
> > + * vmemmap addresses map to the head vmemmap page frame (furture details can
> > + * refer to the figure at the head of the mm/hugetlb_vmemmap.c).  In other
> > + * word, there are more than one page struct with PG_head associated with each
> > + * HugeTLB page.  We __know__ that there is only one head page struct, the tail
> > + * page structs with PG_head are fake head page structs.  We need an approach
> > + * to distinguish between those two different types of page structs so that
> > + * compound_head() can return the real head page struct when the parameter is
> > + * the tail page struct but with PG_head. This is what page_head_if_fake()
> > + * does.
> > + *
> > + * The page_head_if_fake() returns the real head page struct iff the @page may
> > + * be fake, otherwise, returns NULL if the @page cannot be a fake page struct.
> > + * The following figure describes how to distinguish between real and fake head
> > + * page struct.
> > + *
> > + *   if (test_bit(PG_head, &page->flags)) {
> > + *           unsigned long head = READ_ONCE(page[1].compound_head);
> > + *
> > + *           if (head & 1) {
> > + *                   if (head == (unsigned long)page + 1)
> > + *                           ==> head page struct
> > + *                   else
> > + *                           ==> tail page struct
> > + *           } else
> > + *                   ==> head page struct
> > + *   } else
> > + *           ==> cannot be fake head page struct
>
> I'm not sure we need the pseudocode when the code is right there ...

Maybe it is redundant. I'll remove this in the next version.

>
> > + * We can safely access the field of the @page[1] with PG_head because it means
> > + * that the @page is a compound page composed with at least two contiguous
> > + * pages.
> > + */
> > +static __always_inline struct page *page_head_if_fake(const struct page *page)
> > +{
> > +     if (!hugetlb_free_vmemmap_enabled)
> > +             return NULL;
> > +
> > +     /*
> > +      * Only addresses aligned with PAGE_SIZE of struct page may be fake head
> > +      * struct page. The alignment check aims to avoid access the fields (
> > +      * e.g. compound_head) of the @page[1]. It can avoid touch a (possibly)
> > +      * cold cacheline in some cases.
> > +      */
> > +     if (IS_ALIGNED((unsigned long)page, PAGE_SIZE) &&
> > +         test_bit(PG_head, &page->flags)) {
> > +             unsigned long head = READ_ONCE(page[1].compound_head);
> > +
> > +             if (likely(head & 1))
> > +                     return (struct page *)(head - 1);
> > +     }
> > +
> > +     return NULL;
> > +}
>
> Why return 'NULL' instead of 'page'?

Returning @page is also fine. Will do in the next version.

>
> This is going to significantly increase the cost of calling
> compound_page() (by whichever spelling it has).  That will make
> the folio patchset more compelling ;-)

As Mike mentationed, do you have any recommended
benchmark (suspect you have a lot of experience on
this)?

Thanks.
