Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F410EC433F5
	for <linux-doc@archiver.kernel.org>; Sat, 18 Sep 2021 11:48:19 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CE5566127B
	for <linux-doc@archiver.kernel.org>; Sat, 18 Sep 2021 11:48:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233559AbhIRLtl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 18 Sep 2021 07:49:41 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37734 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230051AbhIRLtk (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 18 Sep 2021 07:49:40 -0400
Received: from mail-pl1-x62e.google.com (mail-pl1-x62e.google.com [IPv6:2607:f8b0:4864:20::62e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6333AC061757
        for <linux-doc@vger.kernel.org>; Sat, 18 Sep 2021 04:48:17 -0700 (PDT)
Received: by mail-pl1-x62e.google.com with SMTP id t4so7991231plo.0
        for <linux-doc@vger.kernel.org>; Sat, 18 Sep 2021 04:48:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=NfLIXi5NuL2PF6rTqaUWLiDGZ2bM9/OPvGTCBxQf/Zg=;
        b=47B5COgWWP/NtFNfOGAnx46845XseXNan5j5kLiIQ2mDLnhAe1Ri0x9AWEOU9Zc3TQ
         +o3BUUuBj36Z+f732jeBhBhult7nydYxZU7pOKcg1P0WMG0BIm4o6E+g7ML2BKAUe1tG
         oFWmll5zRPWzlTh+nvo1sNM7gtfA2z0c/ZxUl0JYmLw0VJ1TJ5fEFr7evhFF0GpQR45I
         nKcWz6oJ/krCrJas16QTQD/LdpuKLyCHri3ZSnDYsaWjmAcuRmTOY/YuFbyFw28CShIi
         TD7Gjghf2V68n6uYxVFu3mdhWOApcZnw0LclnRPoH1Q3b30eIxuzppoqmQRFWYoX1COJ
         wU+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=NfLIXi5NuL2PF6rTqaUWLiDGZ2bM9/OPvGTCBxQf/Zg=;
        b=k3C/xf0hgARvAaS+zC7Iprbpo0Wnd6oN1aHE/8+a38zBFrv1rDqv4GkQbd7zsAzQTP
         yAxe+ZkV5aYXRQCEI+ycqgGbD/Q5dHrC5zUUj9Y+P9eHwUnyePNshVLBJEXlo5z+sRiJ
         JXj9iGsbliIZxAQ+AZYChk/8B6ygeX2mWLTCzfZ9oaV6OAcjaI192DH+JKKMHArLvhRT
         M7v4a8co4UN1dld5YmAy8wHzAz5eT4mMTlzFto79h6Qto9n57jOQPZbn29r7FlU+NIpD
         xDEP3AK8VcefI5gNPJiF3Fq2L5mvRQzvsYxNbaxbHctQ5IAy9im6Hn1Jnb3wnx4FdAm4
         Vo7A==
X-Gm-Message-State: AOAM533keYvm9w8PXA3mhUh+VLD9+dbpE9wV/5gZ33WKdUKC7PSYxqiC
        hAHynMl6xjOuLh3tIHmYWWFfA1ZnE/TI2hnUTLHGYA==
X-Google-Smtp-Source: ABdhPJzetvZXdXg9Gt1c0+iA4OzPlw1wcIa1EoiEU4dl7DT5RDXRl8uezwWIrMiicKgsrOCUFr4UYI/AgpzQwPIdWyI=
X-Received: by 2002:a17:90b:1807:: with SMTP id lw7mr14281165pjb.217.1631965696767;
 Sat, 18 Sep 2021 04:48:16 -0700 (PDT)
MIME-Version: 1.0
References: <20210917034815.80264-1-songmuchun@bytedance.com>
 <20210917034815.80264-3-songmuchun@bytedance.com> <CAGsJ_4ymutSL-pbWA_TykJ2vE8ZKc+JGn+w_WWy2j7Mn-q+ebA@mail.gmail.com>
 <CAMZfGtWWvDcz+JZtj0k_YZsD4j42cgaoWOCd1o8jArizqBYKgQ@mail.gmail.com> <CAGsJ_4zZfemMA9=85sgASacPqaT4OnV7RaYUwtQef=BzEfqW9w@mail.gmail.com>
In-Reply-To: <CAGsJ_4zZfemMA9=85sgASacPqaT4OnV7RaYUwtQef=BzEfqW9w@mail.gmail.com>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Sat, 18 Sep 2021 19:47:38 +0800
Message-ID: <CAMZfGtV32Wya=rNw29S1suM8qGzHvYhaqvGeFEvsegy5Oxas0A@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 2/4] mm: hugetlb: replace hugetlb_free_vmemmap_enabled
 with a static_key
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

On Sat, Sep 18, 2021 at 7:15 PM Barry Song <21cnbao@gmail.com> wrote:
>
> On Sat, Sep 18, 2021 at 10:31 PM Muchun Song <songmuchun@bytedance.com> wrote:
> >
> > On Sat, Sep 18, 2021 at 12:55 PM Barry Song <21cnbao@gmail.com> wrote:
> > >
> > > On Sat, Sep 18, 2021 at 12:08 AM Muchun Song <songmuchun@bytedance.com> wrote:
> > > >
> > > > The page_head_if_fake() is used throughout memory management and the
> > > > conditional check requires checking a global variable, although the
> > > > overhead of this check may be small, it increases when the memory
> > > > cache comes under pressure. Also, the global variable will not be
> > > > modified after system boot, so it is very appropriate to use static
> > > > key machanism.
> > > >
> > > > Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> > > > ---
> > > >  include/linux/hugetlb.h    |  6 +++++-
> > > >  include/linux/page-flags.h |  6 ++++--
> > > >  mm/hugetlb_vmemmap.c       | 10 +++++-----
> > > >  3 files changed, 14 insertions(+), 8 deletions(-)
> > > >
> > > > diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
> > > > index f7ca1a3870ea..ee3ddf3d12cf 100644
> > > > --- a/include/linux/hugetlb.h
> > > > +++ b/include/linux/hugetlb.h
> > > > @@ -1057,7 +1057,11 @@ static inline void set_huge_swap_pte_at(struct mm_struct *mm, unsigned long addr
> > > >  #endif /* CONFIG_HUGETLB_PAGE */
> > > >
> > > >  #ifdef CONFIG_HUGETLB_PAGE_FREE_VMEMMAP
> > > > -extern bool hugetlb_free_vmemmap_enabled;
> > > > +DECLARE_STATIC_KEY_MAYBE(CONFIG_HUGETLB_PAGE_FREE_VMEMMAP_DEFAULT_ON,
> > > > +                        hugetlb_free_vmemmap_enabled_key);
> > > > +#define hugetlb_free_vmemmap_enabled                                    \
> > > > +       static_key_enabled(&hugetlb_free_vmemmap_enabled_key)
> > > > +
> > > >  #else
> > > >  #define hugetlb_free_vmemmap_enabled   false
> > > >  #endif
> > > > diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
> > > > index 7b1a918ebd43..d68d2cf30d76 100644
> > > > --- a/include/linux/page-flags.h
> > > > +++ b/include/linux/page-flags.h
> > > > @@ -185,7 +185,8 @@ enum pageflags {
> > > >  #ifndef __GENERATING_BOUNDS_H
> > > >
> > > >  #ifdef CONFIG_HUGETLB_PAGE_FREE_VMEMMAP
> > > > -extern bool hugetlb_free_vmemmap_enabled;
> > > > +DECLARE_STATIC_KEY_MAYBE(CONFIG_HUGETLB_PAGE_FREE_VMEMMAP_DEFAULT_ON,
> > > > +                        hugetlb_free_vmemmap_enabled_key);
> > > >
> > > >  /*
> > > >   * If the feature of freeing some vmemmap pages associated with each HugeTLB
> > > > @@ -204,7 +205,8 @@ extern bool hugetlb_free_vmemmap_enabled;
> > > >   */
> > > >  static __always_inline const struct page *page_head_if_fake(const struct page *page)
> > > >  {
> > > > -       if (!hugetlb_free_vmemmap_enabled)
> > > > +       if (!static_branch_maybe(CONFIG_HUGETLB_PAGE_FREE_VMEMMAP_DEFAULT_ON,
> > > > +                                &hugetlb_free_vmemmap_enabled_key))
> > >
> > > A question bothering me is that we still have hugetlb_free_vmemmap_enabled
> > > defined as static_key_enabled(&hugetlb_free_vmemmap_enabled_key).
> > > but here you are using static_branch_maybe() with the CONFIG and refer the key
> > > directly.
> > > Do we only need one of them? Or something is wrong?
> > >
> >
> > Yeah, we only need one. But my consideration is that we
> > use static_branch_maybe() for performance sensitive places.
> > So I do not change hugetlb_free_vmemmap_enabled
> > to static_branch_maybe(), this can reduce some codes
> > that need to be updated when the static key is enabled.
> > Actually, the user of hugetlb_free_vmemmap_enabled
> > is not performance sensitive.
>
> not quite sure if an unified inline API will be better, e.g.
>
> #ifdef CONFIG_SCHED_SMT
> extern struct static_key_false sched_smt_present;
>
> static __always_inline bool sched_smt_active(void)
> {
>         return static_branch_likely(&sched_smt_present);
> }
> #else
> static inline bool sched_smt_active(void) { return false; }
> #endif

Alright, I can change hugetlb_free_vmemmap_enabled to
an inline function.

>
> but in your case, CONFIG_HUGETLB_PAGE_FREE_VMEMMAP
> is always true in your page_head_if_fake(). Why do we check it
> again?

That is CONFIG_HUGETLB_PAGE_FREE_VMEMMAP_DEFAULT_ON
not CONFIG_HUGETLB_PAGE_FREE_VMEMMAP.

Thanks
