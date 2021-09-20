Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A18D7C433F5
	for <linux-doc@archiver.kernel.org>; Mon, 20 Sep 2021 14:26:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8057161077
	for <linux-doc@archiver.kernel.org>; Mon, 20 Sep 2021 14:26:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237859AbhITO2I (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 20 Sep 2021 10:28:08 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237692AbhITO2H (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 20 Sep 2021 10:28:07 -0400
Received: from mail-pg1-x534.google.com (mail-pg1-x534.google.com [IPv6:2607:f8b0:4864:20::534])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E7A99C061760
        for <linux-doc@vger.kernel.org>; Mon, 20 Sep 2021 07:26:40 -0700 (PDT)
Received: by mail-pg1-x534.google.com with SMTP id w8so17506316pgf.5
        for <linux-doc@vger.kernel.org>; Mon, 20 Sep 2021 07:26:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20210112.gappssmtp.com; s=20210112;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=zEsX1wE2wUwgVo5sqagm06pGLMALS0tuk0jb3y2D0xM=;
        b=wmQ7DtwNqInFEzlGaZLWkN/xY6byH8fldi+0bt0L0CVe9maaX3m0W/r/4w/IhmCrF0
         UVmAPKR1ZUisR352UvLvqhm8+Pu34UfOlO5YvS2wQofUkCKjqDRNJj6w4S6S7aZwM4Fu
         IoCrO3hH+vWModq4cnYczInrM6l+n7HCkSzHQhwnGLJAYNDkOBgn22XgGUM6nJswTlzf
         AmbtjZ3DC7UkW+7wjstKAGpbnfrB7m6nBHF1wUAlfZnqNtR9aUJy++mThLjYGO/Ik85d
         g0cB3f6OsWvBNVFwCD6cAA8IHVFd64DZ8VV3x/uRSVS0C/cifs4CtD8j8QdN9ObNbOMa
         ETPQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=zEsX1wE2wUwgVo5sqagm06pGLMALS0tuk0jb3y2D0xM=;
        b=kBwxzdzjnaD9YNH2x36F6x9zdXtRPSnrZ51ceIceGySmhiPZSQTPwyOUoW0r6czMCp
         TtimGPd12QSsArD8ht/sZZ+tC0aRfrfNnKvGKrbgRK57Djwywilsbg9CZXAggPT/1t+S
         Rz1+mdDNvpYiGg9rFt4QLoCMJW03TA7E2N+0meNJak0754BSnAaS2bzPVnzzbWjJWUXc
         ugJ+ZF3SQE9kOIHCHjq59Wz7l9/oFgKGPEdii3So8qOyHBnGYz+MpuTaaZ6xgr1ljRBF
         y5M0wb0+SWIeHl5fv21SPKWgRPLw0CzDZneiQpdjGW1Iq657Mu7uYPkMcId8fGIW6Dre
         HSNA==
X-Gm-Message-State: AOAM530Icu+UWCTIPUBqnCFV3WPna9CXdvdJHx+kYnGb9+E8DAD0brIj
        9jwBWpD8bcExCyx0Z/XC4lRPg+bHDAbyHVxOgpJUjg==
X-Google-Smtp-Source: ABdhPJwfCKGZEQIIRuKMhY+7FrAZiWptl/porLMfHW9bp8HEicvlAaeY9DXy1mhaWHjd2OJKcFVW2vbMnqLt0z0T3N8=
X-Received: by 2002:a62:1717:0:b0:440:527f:6664 with SMTP id
 23-20020a621717000000b00440527f6664mr24161534pfx.73.1632148000396; Mon, 20
 Sep 2021 07:26:40 -0700 (PDT)
MIME-Version: 1.0
References: <20210917034815.80264-1-songmuchun@bytedance.com>
 <20210917034815.80264-5-songmuchun@bytedance.com> <CAGsJ_4wW6b5aC4va1_BZuWLqxzRkSi3vLcyJo7XGMbVi8i7iuw@mail.gmail.com>
In-Reply-To: <CAGsJ_4wW6b5aC4va1_BZuWLqxzRkSi3vLcyJo7XGMbVi8i7iuw@mail.gmail.com>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Mon, 20 Sep 2021 22:26:01 +0800
Message-ID: <CAMZfGtVtU2zWYJB1U_Q4AMBb5vYysT2MC06qsA5u0T6FrpbW1g@mail.gmail.com>
Subject: Re: [PATCH RESEND v2 4/4] selftests: vm: add a hugetlb test case
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

On Sat, Sep 18, 2021 at 1:20 PM Barry Song <21cnbao@gmail.com> wrote:
>
> On Sat, Sep 18, 2021 at 12:08 AM Muchun Song <songmuchun@bytedance.com> wrote:
> >
> > Since the head vmemmap page frame associated with each HugeTLB page is
> > reused, we should hide the PG_head flag of tail struct page from the
> > user. Add a tese case to check whether it is work properly.
> >
>
> TBH, I am a bit confused. I was thinking about some kernel unit tests to make
> sure those kernel APIs touched by this patchset are still working as before.
> This userspace test, while certainly useful for checking the content of page
> frames as expected, doesn't directly prove things haven't changed.
>
> In patch 1/4, a couple of APIs have the fixup for the fake head issue.
> Do you think a test like the below would be more sensible?
> 1. alloc 2MB hugeTLB

It is done in main().

> 2. get each page frame
> 3. apply those APIs in each page frame
> 4. Those APIs work completely the same as before.

Reading the flags of a page by /proc/kpageflags is done
in stable_page_flags(), which has invoked PageHead(),
PageTail(), PageCompound() and compound_head().
If those APIs work properly, the head page must have
15 and 17 bits set. And tail pages must have 16 and 17
bits set but 15 unset.

So I think check_page_flags() has done the step 2 to 4.
What do you think?

Thanks.
