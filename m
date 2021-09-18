Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D8E53C433F5
	for <linux-doc@archiver.kernel.org>; Sat, 18 Sep 2021 10:51:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B6D006101C
	for <linux-doc@archiver.kernel.org>; Sat, 18 Sep 2021 10:51:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237009AbhIRKxJ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 18 Sep 2021 06:53:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53704 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236946AbhIRKxI (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 18 Sep 2021 06:53:08 -0400
Received: from mail-pl1-x631.google.com (mail-pl1-x631.google.com [IPv6:2607:f8b0:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 65DC1C061757
        for <linux-doc@vger.kernel.org>; Sat, 18 Sep 2021 03:51:45 -0700 (PDT)
Received: by mail-pl1-x631.google.com with SMTP id w6so7891475pll.3
        for <linux-doc@vger.kernel.org>; Sat, 18 Sep 2021 03:51:45 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=xBFWMVLwmHIiRIbiBZy+2kXWxtuoqm6ONSYo0yLetxk=;
        b=wSs30QhbRby8deq8G74Z9mrupXOI0LHVqPjUhF7BA/lElDOz1xHJxU2OUwQDCQMNlh
         fvF2hX6tTH5AKwuwG0kHP4NgTot2e7T32S6It624AzA/V9YBszXbl0ShrCtbgnY184aO
         PHHeMGZo6u/fsaGL9rIsl13L/LDOVKVr/4A/f/3Pkn0xjoZC5nQA6jDQ/zRrBDOvkmEW
         oDtMOFBcjFAfgBI6RMHQhOomn9P4jQLiAiXLksx8sdR6m5pPiNRlljfj3SR4zHG21C2J
         c0uinWg4lus/S8aV+TFXOq3s/QldB4VIOYBh3VuK2GWuDEmbdUQmqtzVA8FgKE5c9CBm
         JOaw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=xBFWMVLwmHIiRIbiBZy+2kXWxtuoqm6ONSYo0yLetxk=;
        b=2NvEFSOO68Yl5EtNPi9ZIvpGZikF7OyWmZf/4uRb1tu3+gEWh78eo+nDj8M/SytkS8
         4XOaESMipkJGusIaHaW6NbtEbN3vNKewlSUK81Vkd9+C7heiwwEsjCG6JftQJ2Mwr3uc
         /3PruBAupjZAv/+iE0sR43/64NkOCGBvRDfss+RhP2aXtTJ2tqZqK26+6diCS64k72Wk
         9a7XdOSyRmC3if1oZoJq1xRYwtcw/nLcB9STu/NK5km3LH3T48bAcETmVSSyHZ+lVc3W
         /qxn/Tre2KgtfAOmbb1Peq+PAywR/FZP3BwzL0ktcv3miw/O5j+KA9fdunz1hMFoDlnN
         mrPg==
X-Gm-Message-State: AOAM530o+I8Soi/VhhIJ5/zLxPW1waZEkYguJSPypKsUmqAOYk948iGB
        Xc1QWIlveMG/VMukZOLd4S5+64b33y4gZYb66sEXIw==
X-Google-Smtp-Source: ABdhPJxA0n1aW2qTA8q2EYKyRrnJdw0Nq1B3sRm0ZkNuBsUHNnADC9+jA1rOu2JCO4gYTVUHX/0OxXO6gzR+ZZT5MEA=
X-Received: by 2002:a17:90b:4f8a:: with SMTP id qe10mr16148057pjb.5.1631962304832;
 Sat, 18 Sep 2021 03:51:44 -0700 (PDT)
MIME-Version: 1.0
References: <20210917034815.80264-1-songmuchun@bytedance.com>
 <20210917034815.80264-4-songmuchun@bytedance.com> <CAGsJ_4yWZTcRqnBmLrYJ3Z1Yo_7oWRgR4B3qK5m570xgpeJ-5Q@mail.gmail.com>
In-Reply-To: <CAGsJ_4yWZTcRqnBmLrYJ3Z1Yo_7oWRgR4B3qK5m570xgpeJ-5Q@mail.gmail.com>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Sat, 18 Sep 2021 18:51:07 +0800
Message-ID: <CAMZfGtW1_U2d=zQFCYBEDfKWB=EkoYTGgVcCHauX-iv4VD7U8Q@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 3/4] mm: sparsemem: use page table lock to
 protect kernel pmd operations
To:     Barry Song <21cnbao@gmail.com>
Cc:     Mike Kravetz <mike.kravetz@oracle.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Oscar Salvador <osalvador@suse.de>,
        Michal Hocko <mhocko@suse.com>,
        Barry Song <song.bao.hua@hisilicon.com>,
        David Hildenbrand <david@redhat.com>,
        Chen Huang <chenhuang5@huawei.com>,
        "Bodeddula, Balasubramaniam" <bodeddub@amazon.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Matthew Wilcox <willy@infradead.org>,
        Xiongchun duan <duanxiongchun@bytedance.com>,
        fam.zheng@bytedance.com, Muchun Song <smuchun@gmail.com>,
        Qi Zheng <zhengqi.arch@bytedance.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux-MM <linux-mm@kvack.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Sep 18, 2021 at 1:07 PM Barry Song <21cnbao@gmail.com> wrote:
>
> On Sat, Sep 18, 2021 at 12:09 AM Muchun Song <songmuchun@bytedance.com> wrote:
> >
> > The init_mm.page_table_lock is used to protect kernel page tables, we
> > can use it to serialize splitting vmemmap PMD mappings instead of mmap
> > write lock, which can increase the concurrency of vmemmap_remap_free().
> >
>
> Curious what is the actual benefit we get in user scenarios from this patch,
> 1. we set bootargs to reserve hugetlb statically
> 2. we "echo" some figures to sys or proc.
>
> In other words, Who is going to care about this concurrency?

Actually, It increase the concurrency between allocations of
HugeTLB pages. But it is not my first consideration. There are
a lot of users of mmap read lock of init_mm. The mmap write
lock is holding through vmemmap_remap_free(), I want to make
it does not affect other users of mmap read lock.

I suppose a lot of developers are trying to avoid using mmap write
lock. I am also one of them.

> Can we have some details on this to put in the commit log?

For sure. Those judgments above should be placed in the
commit log.

Thanks.
