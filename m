Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F799C433E6
	for <linux-doc@archiver.kernel.org>; Fri,  5 Feb 2021 22:18:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4611D64EE4
	for <linux-doc@archiver.kernel.org>; Fri,  5 Feb 2021 22:18:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232742AbhBEWRW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 5 Feb 2021 17:17:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44400 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232743AbhBEOfy (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 5 Feb 2021 09:35:54 -0500
Received: from mail-pg1-x52d.google.com (mail-pg1-x52d.google.com [IPv6:2607:f8b0:4864:20::52d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F1E3C06121C
        for <linux-doc@vger.kernel.org>; Fri,  5 Feb 2021 08:14:00 -0800 (PST)
Received: by mail-pg1-x52d.google.com with SMTP id r38so4832656pgk.13
        for <linux-doc@vger.kernel.org>; Fri, 05 Feb 2021 08:14:00 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=tgToZXIcR//slb37mMxyXMF6K319Gf4e4xqtIkg5mSQ=;
        b=vi1eZTDGn0s+c7nDc/UcaxmiZ8SO8djhd8YKp6I27b2SvO+LfWMsqNulS/rqad1/EE
         zti94jrpclnDbtIra0/SF7oO933+vtLmvQh0LOlXgTtUA/Ys9pWpCzEJCP/8EeKnN7RY
         KpnRSlevGccsTyUxdhwrPyWiJ1Hac/O8fH2AVQtrKbP/z2fQG58C63wBM+0nDMC0Ynvk
         4eOqfX54/u8Ei+AiBWg43xL9oUa8Xrf8Zjdlyh5mAdzbTEcTH01mFIo52cFaP8k0nK7Z
         Q4Y7yFF8vBMHXuXjyC1YB7Zwja6igzBF2grNPDY3PHAeLebuziRPFkGYUNNyVT7trndg
         fTZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=tgToZXIcR//slb37mMxyXMF6K319Gf4e4xqtIkg5mSQ=;
        b=O1Fpve3dK/GVY7R2/DuzD7GggDXdogPJy7HtbqK/jVUnKoI8vl5UUPRii7NoYEIdld
         N1tqS8+GxlmuxJmGsmeLF+owx/5TR5uOYelqYuJHs6JHWA2t14tmylACUQbBcvvJp8yM
         tASLDMK8EKGUpBf5K2KfR6XBxufsW6+86J+N+ShEKWuNYyAEtifNV/fIXZxiyLcfsJ2N
         iutOpT4mBlSa3LeG83LRZzs6qBgFWMFulqf4xM061nReC+egnnMFlxKQDJAIuLrncNeM
         xUIFIWByMXIGQ2O51gIRSi8xKq6dnJTsdXVKgEZ3EwSG2fz2Ur1FMEiNKrYSPpEFjNQV
         lBrw==
X-Gm-Message-State: AOAM532/PxvaGZ/O6fJFj69/ftq4CSrCz0cToTnR2Tl4v07M16OHyoiz
        OTCgov71LtsMA1ETe63U+cmnTXzADpPA/Kmw6+zxTA==
X-Google-Smtp-Source: ABdhPJwkirrFi8xuKWL/S5D2cKkWHr8/viSsyFvrNlI047a1E3Q16PWtG8tYxcyd1lVj1EuEzbAYJyMFxhtmMXc0PgQ=
X-Received: by 2002:a62:1b93:0:b029:1cb:4985:623b with SMTP id
 b141-20020a621b930000b02901cb4985623bmr5289599pfb.59.1612541639757; Fri, 05
 Feb 2021 08:13:59 -0800 (PST)
MIME-Version: 1.0
References: <20210204035043.36609-1-songmuchun@bytedance.com> <a14113c5-08ae-2819-7e24-3d2687ef88da@oracle.com>
In-Reply-To: <a14113c5-08ae-2819-7e24-3d2687ef88da@oracle.com>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Sat, 6 Feb 2021 00:13:22 +0800
Message-ID: <CAMZfGtXyWkeO9gGKGpEXYA9DA75mMZUaHboTXH6dGxZgEHvMpA@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v14 0/8] Free some vmemmap pages of HugeTLB page
To:     Joao Martins <joao.m.martins@oracle.com>
Cc:     Xiongchun duan <duanxiongchun@bytedance.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>,
        Jonathan Corbet <corbet@lwn.net>,
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
        Oscar Salvador <osalvador@suse.de>,
        Michal Hocko <mhocko@suse.com>,
        "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>,
        David Hildenbrand <david@redhat.com>,
        =?UTF-8?B?SE9SSUdVQ0hJIE5BT1lBKOWggOWPoyDnm7TkuZ8p?= 
        <naoya.horiguchi@nec.com>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sat, Feb 6, 2021 at 12:01 AM Joao Martins <joao.m.martins@oracle.com> wrote:
>
> On 2/4/21 3:50 AM, Muchun Song wrote:
> > Hi all,
> >
>
> [...]
>
> > When a HugeTLB is freed to the buddy system, we should allocate 6 pages for
> > vmemmap pages and restore the previous mapping relationship.
> >
> > Apart from 2MB HugeTLB page, we also have 1GB HugeTLB page. It is similar
> > to the 2MB HugeTLB page. We also can use this approach to free the vmemmap
> > pages.
> >
> > In this case, for the 1GB HugeTLB page, we can save 4094 pages. This is a
> > very substantial gain. On our server, run some SPDK/QEMU applications which
> > will use 1024GB hugetlbpage. With this feature enabled, we can save ~16GB
> > (1G hugepage)/~12GB (2MB hugepage) memory.
> >
> > Because there are vmemmap page tables reconstruction on the freeing/allocating
> > path, it increases some overhead. Here are some overhead analysis.
>
> [...]
>
> > Although the overhead has increased, the overhead is not significant. Like Mike
> > said, "However, remember that the majority of use cases create hugetlb pages at
> > or shortly after boot time and add them to the pool. So, additional overhead is
> > at pool creation time. There is no change to 'normal run time' operations of
> > getting a page from or returning a page to the pool (think page fault/unmap)".
> >
>
> Despite the overhead and in addition to the memory gains from this series ...
> there's an additional benefit there isn't talked here with your vmemmap page
> reuse trick. That is page (un)pinners will see an improvement and I presume because
> there are fewer memmap pages and thus the tail/head pages are staying in cache more
> often.
>
> Out of the box I saw (when comparing linux-next against linux-next + this series)
> with gup_test and pinning a 16G hugetlb file (with 1G pages):
>
>         get_user_pages(): ~32k -> ~9k
>         unpin_user_pages(): ~75k -> ~70k
>
> Usually any tight loop fetching compound_head(), or reading tail pages data (e.g.
> compound_head) benefit a lot. There's some unpinning inefficiencies I am fixing[0], but
> with that in added it shows even more:
>
>         unpin_user_pages(): ~27k -> ~3.8k
>
> FWIW, I was also seeing that with devdax and the ZONE_DEVICE vmemmap page reuse equivalent
> series[1] but it was mixed with other numbers.

It's really a surprise. Thank you very much for the test data.
Very nice. Thanks again.


>
> Anyways, JFYI :)
>
>         Joao
>
> [0] https://lore.kernel.org/linux-mm/20210204202500.26474-1-joao.m.martins@oracle.com/
> [1] https://lore.kernel.org/linux-mm/20201208172901.17384-1-joao.m.martins@oracle.com/
