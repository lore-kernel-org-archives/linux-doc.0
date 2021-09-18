Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91352C433EF
	for <linux-doc@archiver.kernel.org>; Sat, 18 Sep 2021 10:31:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6708F61212
	for <linux-doc@archiver.kernel.org>; Sat, 18 Sep 2021 10:31:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235820AbhIRKcu (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 18 Sep 2021 06:32:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:49304 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234515AbhIRKct (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 18 Sep 2021 06:32:49 -0400
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6B87CC061574
        for <linux-doc@vger.kernel.org>; Sat, 18 Sep 2021 03:31:25 -0700 (PDT)
Received: by mail-pg1-x52d.google.com with SMTP id r2so12211974pgl.10
        for <linux-doc@vger.kernel.org>; Sat, 18 Sep 2021 03:31:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=sqcmPvsXMriA6MZ/1xe+ZZKmWFZFt3hQB0j09TtDJdc=;
        b=FgcErukEVEa15/A2CYRRQCkwAVaBw080oU1C53GRRDOjSajj4JGHY/qMQf5QUHDrHp
         7/p4dzu++xya5ko0h5l7RnTk+oP0w9KVPzS12z27k749zOCFAHiKby5GRG0kXC8NNuhF
         RE6lYdMSj2/TnwUwYM3IigU3rlGhpoO9+nrfIzlpo/nGqi6zfHhsiS9EkQjmPXy7Rdqv
         eiG2vyotuIrvjz73vVOHc6PO1VsFSVwc77mU+XCPXn8ASD0Abd+cjqwx3O096ACv3aKA
         r47pn0AMdRC6GdK1Od9VTXvHQYma34HJuFz9kqFl9h+A4aztodofsu1VQtEb//5DPHxp
         dQsA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=sqcmPvsXMriA6MZ/1xe+ZZKmWFZFt3hQB0j09TtDJdc=;
        b=yIju9hRl3ec3aYLZ40jGnJ7RDi08t22XJoxCTJmobt4ZrwV2m+AEhvDwTd8jUYgf4S
         3gCwfLMw1072/wjmCT0fHSIGeZamkWnccUcFbtvdaBfLSF8ILCGwJQ4xZd8g0V0Ih+EJ
         eQrgddlVkpzCTviSa40XcyJBPx/jxatEUy4nTe0BuISbNmI352yDc8Aeh1G1gK3XxQVj
         53mA6qQz1cXCCr5WZv0cVA3Qm9g1JVX3Vjrp3e2eI2Bzh0n1iKW7wnDLMcrY7SX5dk44
         HunuoO9Aq/inecTTpDpFmjnmqKhGAa9KrWvzenj+8DVVvAeQjLpkdaD2g2K+PPhOfYE4
         SGCg==
X-Gm-Message-State: AOAM532LhSf/jqr58yjMJSZPU4hx3mgmiZAncumNyIgty5Yx+qvrNgn5
        CtGeTpfH/zXAf+S+Gx9r8AzBiyQaL6IXDe1eZO+yRag5Jp1oIw==
X-Google-Smtp-Source: ABdhPJxsMhmppLIPhrb1MKC0j7eF7QvQ/6Qw0M9XceOp5ZDgbWPzUZwGjcW6ItDdNounSGnzkJEhgvIu+UCRWQn1ipc=
X-Received: by 2002:a63:3753:: with SMTP id g19mr14236561pgn.328.1631961084827;
 Sat, 18 Sep 2021 03:31:24 -0700 (PDT)
MIME-Version: 1.0
References: <20210917034815.80264-1-songmuchun@bytedance.com>
 <20210917034815.80264-3-songmuchun@bytedance.com> <CAGsJ_4ymutSL-pbWA_TykJ2vE8ZKc+JGn+w_WWy2j7Mn-q+ebA@mail.gmail.com>
In-Reply-To: <CAGsJ_4ymutSL-pbWA_TykJ2vE8ZKc+JGn+w_WWy2j7Mn-q+ebA@mail.gmail.com>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Sat, 18 Sep 2021 18:30:47 +0800
Message-ID: <CAMZfGtWWvDcz+JZtj0k_YZsD4j42cgaoWOCd1o8jArizqBYKgQ@mail.gmail.com>
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

On Sat, Sep 18, 2021 at 12:55 PM Barry Song <21cnbao@gmail.com> wrote:
>
> On Sat, Sep 18, 2021 at 12:08 AM Muchun Song <songmuchun@bytedance.com> wrote:
> >
> > The page_head_if_fake() is used throughout memory management and the
> > conditional check requires checking a global variable, although the
> > overhead of this check may be small, it increases when the memory
> > cache comes under pressure. Also, the global variable will not be
> > modified after system boot, so it is very appropriate to use static
> > key machanism.
> >
> > Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> > ---
> >  include/linux/hugetlb.h    |  6 +++++-
> >  include/linux/page-flags.h |  6 ++++--
> >  mm/hugetlb_vmemmap.c       | 10 +++++-----
> >  3 files changed, 14 insertions(+), 8 deletions(-)
> >
> > diff --git a/include/linux/hugetlb.h b/include/linux/hugetlb.h
> > index f7ca1a3870ea..ee3ddf3d12cf 100644
> > --- a/include/linux/hugetlb.h
> > +++ b/include/linux/hugetlb.h
> > @@ -1057,7 +1057,11 @@ static inline void set_huge_swap_pte_at(struct mm_struct *mm, unsigned long addr
> >  #endif /* CONFIG_HUGETLB_PAGE */
> >
> >  #ifdef CONFIG_HUGETLB_PAGE_FREE_VMEMMAP
> > -extern bool hugetlb_free_vmemmap_enabled;
> > +DECLARE_STATIC_KEY_MAYBE(CONFIG_HUGETLB_PAGE_FREE_VMEMMAP_DEFAULT_ON,
> > +                        hugetlb_free_vmemmap_enabled_key);
> > +#define hugetlb_free_vmemmap_enabled                                    \
> > +       static_key_enabled(&hugetlb_free_vmemmap_enabled_key)
> > +
> >  #else
> >  #define hugetlb_free_vmemmap_enabled   false
> >  #endif
> > diff --git a/include/linux/page-flags.h b/include/linux/page-flags.h
> > index 7b1a918ebd43..d68d2cf30d76 100644
> > --- a/include/linux/page-flags.h
> > +++ b/include/linux/page-flags.h
> > @@ -185,7 +185,8 @@ enum pageflags {
> >  #ifndef __GENERATING_BOUNDS_H
> >
> >  #ifdef CONFIG_HUGETLB_PAGE_FREE_VMEMMAP
> > -extern bool hugetlb_free_vmemmap_enabled;
> > +DECLARE_STATIC_KEY_MAYBE(CONFIG_HUGETLB_PAGE_FREE_VMEMMAP_DEFAULT_ON,
> > +                        hugetlb_free_vmemmap_enabled_key);
> >
> >  /*
> >   * If the feature of freeing some vmemmap pages associated with each HugeTLB
> > @@ -204,7 +205,8 @@ extern bool hugetlb_free_vmemmap_enabled;
> >   */
> >  static __always_inline const struct page *page_head_if_fake(const struct page *page)
> >  {
> > -       if (!hugetlb_free_vmemmap_enabled)
> > +       if (!static_branch_maybe(CONFIG_HUGETLB_PAGE_FREE_VMEMMAP_DEFAULT_ON,
> > +                                &hugetlb_free_vmemmap_enabled_key))
>
> A question bothering me is that we still have hugetlb_free_vmemmap_enabled
> defined as static_key_enabled(&hugetlb_free_vmemmap_enabled_key).
> but here you are using static_branch_maybe() with the CONFIG and refer the key
> directly.
> Do we only need one of them? Or something is wrong?
>

Yeah, we only need one. But my consideration is that we
use static_branch_maybe() for performance sensitive places.
So I do not change hugetlb_free_vmemmap_enabled
to static_branch_maybe(), this can reduce some codes
that need to be updated when the static key is enabled.
Actually, the user of hugetlb_free_vmemmap_enabled
is not performance sensitive.

Thanks.
