Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6941FC43381
	for <linux-doc@archiver.kernel.org>; Thu, 11 Mar 2021 10:01:31 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1ED6D64E57
	for <linux-doc@archiver.kernel.org>; Thu, 11 Mar 2021 10:01:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232140AbhCKKA7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 11 Mar 2021 05:00:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58016 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232100AbhCKKAr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 11 Mar 2021 05:00:47 -0500
Received: from mail-pg1-x533.google.com (mail-pg1-x533.google.com [IPv6:2607:f8b0:4864:20::533])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 59049C061760
        for <linux-doc@vger.kernel.org>; Thu, 11 Mar 2021 02:00:47 -0800 (PST)
Received: by mail-pg1-x533.google.com with SMTP id q5so705914pgk.5
        for <linux-doc@vger.kernel.org>; Thu, 11 Mar 2021 02:00:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=UQYHWAxJkDDd3f+gQZzvbrjXR8K2vgw8ut0GHNgkmoM=;
        b=TGZB56pq53iJrbDY/snWAhnMelGY6QSE+Yv/4rXOZF8ClO6D17/XVaPjgLf/6KmFGv
         UIkQ/2qRLk3cCji7+/COxGOJFB14ZYLUhacmrEXPkr5eL/l43Czfhqly17NuHNj0e+UY
         zuFiR7pojUusz5EVmDAIDRxBRa2JsxlgSqXnwehIg5gen6srHlXbS82ai+U6lhRhjWph
         PpsZQrZfgnFvfxrZsJvi1gFcFi/nEpv7r7rZ/GopaDNqOFb9YbRlV8FyTgFx+YSnJbr/
         ioPbB3tV3Um5t0pJY5uKOyKLo8ACUmzSZrB9NqPQXaY5yKUUM/Ctm8B5HNpv4UmFCvPG
         ycXA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=UQYHWAxJkDDd3f+gQZzvbrjXR8K2vgw8ut0GHNgkmoM=;
        b=kca2MdAEi+Hv7L8uAi2VdbP+/G5KFGNNwpM2Op5KaGM7aA+XFwLOcnivVBS51YF+rZ
         BC7B4junyNaGoKptNjYH7EAcwpVqpKpbdzVUX6260Q3dZAXdI6sLjhb7846gMNyigccT
         ECUfCPuoEs50Ocj2ctemiYta2/REsnoegN4S68GdAMlWvvH4nlhuMfvcEzMsykSghMkw
         pfYETV/aAK4K/RFBfLUQ5w981bYu43PxVUAsBa4kywk8/QhXb47Syb4M3C2z2R5/xr5D
         l/Kgt3+UDcAhoO83l+ON/Um9l1VQcXYV12FFORvyAYpjZ+5SdlT6ll+5S2Vu0hLcUUTk
         gQqw==
X-Gm-Message-State: AOAM5304Iym+A6OC1fh7hUkjOVoBQ9PERqySmroQZqON0zxuXGT6SkBk
        dBy7WslWmPpBft8xIdZ3Av53wvLWGfmjo+TfhN+ryA==
X-Google-Smtp-Source: ABdhPJwqzuj630hhgNm5RpgiIIsq6u5FJpc47tt2JPxPfMHD0qYBylhZFf5FrpayQuz02H1TABPQKpF4NTKHNt6mO7g=
X-Received: by 2002:a63:141e:: with SMTP id u30mr6765052pgl.31.1615456846679;
 Thu, 11 Mar 2021 02:00:46 -0800 (PST)
MIME-Version: 1.0
References: <20210308102807.59745-1-songmuchun@bytedance.com>
 <20210308102807.59745-10-songmuchun@bytedance.com> <YEjoozshsvKeMAAu@dhcp22.suse.cz>
 <CAMZfGtV1Fp1RiQ64c9RrMmZ+=EwjGRHjwL8Wx3Q0YRWbbKF6xg@mail.gmail.com>
 <YEnbBPviwU6N2RzK@dhcp22.suse.cz> <CAMZfGtW5uHYiA_1an3W-jEmemsoN3Org7JwieeE2V271wh9X-A@mail.gmail.com>
 <YEnlRlLJD1bK/Dup@dhcp22.suse.cz>
In-Reply-To: <YEnlRlLJD1bK/Dup@dhcp22.suse.cz>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Thu, 11 Mar 2021 18:00:09 +0800
Message-ID: <CAMZfGtX3pUmPOY1ieVQubnBKHZoOxfp-ARsPigYZpc=-UiiNjg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v18 9/9] mm: hugetlb: optimize the code
 with the help of the compiler
To:     Michal Hocko <mhocko@suse.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>, bp@alien8.de, x86@kernel.org,
        hpa@zytor.com, dave.hansen@linux.intel.com, luto@kernel.org,
        Peter Zijlstra <peterz@infradead.org>,
        Alexander Viro <viro@zeniv.linux.org.uk>,
        Andrew Morton <akpm@linux-foundation.org>, paulmck@kernel.org,
        mchehab+huawei@kernel.org, pawan.kumar.gupta@linux.intel.com,
        Randy Dunlap <rdunlap@infradead.org>, oneukum@suse.com,
        anshuman.khandual@arm.com, jroedel@suse.de,
        Mina Almasry <almasrymina@google.com>,
        David Rientjes <rientjes@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        Oscar Salvador <osalvador@suse.de>,
        "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>,
        David Hildenbrand <david@redhat.com>,
        =?UTF-8?B?SE9SSUdVQ0hJIE5BT1lBKOWggOWPoyDnm7TkuZ8p?= 
        <naoya.horiguchi@nec.com>,
        Joao Martins <joao.m.martins@oracle.com>,
        Xiongchun duan <duanxiongchun@bytedance.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        Miaohe Lin <linmiaohe@huawei.com>,
        Chen Huang <chenhuang5@huawei.com>,
        Bodeddula Balasubramaniam <bodeddub@amazon.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Mar 11, 2021 at 5:39 PM Michal Hocko <mhocko@suse.com> wrote:
>
> On Thu 11-03-21 17:08:34, Muchun Song wrote:
> > On Thu, Mar 11, 2021 at 4:55 PM Michal Hocko <mhocko@suse.com> wrote:
> > >
> > > On Thu 11-03-21 15:33:20, Muchun Song wrote:
> > > > On Wed, Mar 10, 2021 at 11:41 PM Michal Hocko <mhocko@suse.com> wrote:
> > > > >
> > > > > On Mon 08-03-21 18:28:07, Muchun Song wrote:
> > > > > > When the "struct page size" crosses page boundaries we cannot
> > > > > > make use of this feature. Let free_vmemmap_pages_per_hpage()
> > > > > > return zero if that is the case, most of the functions can be
> > > > > > optimized away.
> > > > >
> > > > > I am confused. Don't you check for this in early_hugetlb_free_vmemmap_param already?
> > > >
> > > > Right.
> > > >
> > > > > Why do we need any runtime checks?
> > > >
> > > > If the size of the struct page is not power of 2, compiler can think
> > > > is_hugetlb_free_vmemmap_enabled() always return false. So
> > > > the code snippet of this user can be optimized away.
> > > >
> > > > E.g.
> > > >
> > > > if (is_hugetlb_free_vmemmap_enabled())
> > > >         /* do something */
> > > >
> > > > The compiler can drop "/* do something */" directly, because
> > > > it knows is_hugetlb_free_vmemmap_enabled() always returns
> > > > false.
> > >
> > > OK, so this is a micro-optimization to generate a better code?
> >
> > Right.
> >
> > > Is this measurable to warrant more code?
> >
> > I have disassembled the code to confirm this behavior.
> > I know this is not the hot path. But it actually can decrease
> > the code size.
>
> struct page which is not power of 2 is not a common case.

I know this is not a common case. But the check of
is_power_of_2(sizeof(struct page)) does not bring extra
runtime overhead. It just tells the compiler to optimize code
as much as possible.

> Are you sure
> it makes sense to micro optimize for an outliar. If you really want to
> microptimize then do that for a common case - the feature being
> disabled - via static key.

We cannot optimize the code size (vmlinux) even if we use a static
key when the size is not power of 2.

Sorry. I am confused why you disagree with this change.
It does not bring any disadvantages.

> --
> Michal Hocko
> SUSE Labs
