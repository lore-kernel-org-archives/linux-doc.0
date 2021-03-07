Return-Path: <SRS0=pILf=IF=vger.kernel.org=linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2D5EFC433DB
	for <linux-doc@archiver.kernel.org>; Sun,  7 Mar 2021 08:40:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id CF3266511D
	for <linux-doc@archiver.kernel.org>; Sun,  7 Mar 2021 08:40:31 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231237AbhCGIj7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 7 Mar 2021 03:39:59 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39198 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230408AbhCGIjo (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 7 Mar 2021 03:39:44 -0500
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5E3DBC061760
        for <linux-doc@vger.kernel.org>; Sun,  7 Mar 2021 00:39:44 -0800 (PST)
Received: by mail-pj1-x1031.google.com with SMTP id jx13so1443755pjb.1
        for <linux-doc@vger.kernel.org>; Sun, 07 Mar 2021 00:39:44 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=5+ZIdAEa9OwEkxgFcDiKNp4vM+KvSh13doJNbkRyCBk=;
        b=xhjBKjSuF4exEfCWDp7cl5chAnIppGTTfOErwDX9TjXEDszpoQHxnheS0lDw/Px0GD
         auYjkp6xPVobYtnb3S5RJvK1McAT4Kx8vX4xO0J6pWGev71nx7MLrRcp9ZqpAlqWMnk8
         41yZTr35QJIAv3pOKBlvutH6ZCYXbZ15BFgpzWEx2GQ9Uan85hsZnr/bHfrhoWR3tJma
         m/nPKyAxWAJDS1igXcKnuHQqeOB5PMan3Ob/2UMVY0BpFi3ftw1E3U45qkzFTRrU9FYD
         +ykdzS8Ay9pxLZL1cZRHxyvyJaE+C2SsxklsIxZOcXdbIZMFb3GflqrqWxIcpuSctdqQ
         3/mQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=5+ZIdAEa9OwEkxgFcDiKNp4vM+KvSh13doJNbkRyCBk=;
        b=lVk1XfY4I03ZWCk7QRYMkgvLUarBjXt8TDXNkcNsasDIQNOP0PAx2eAxpXZLJn8hjP
         xwFQhm1eH3fjOVlG03K5lJs3pt90e3uWxAO0utMG0y8HN82KD8eslYlv+qkvFV8BJkjB
         jkGZqL7EPreHRd3E1iBYju+VicE6SJwHM0rCbb6MpaC1o5iRlQpFFfOwYbpB3JkNrNws
         PZwv6XWl3Tl99AMcpjDjKbyQbWmyE+ODT/epye+NfQa/d1KZltuTrGrFHDUk6FA8pBNW
         Sy9sEdyt0SrxE2uh7kGPk/fC4GgFJIDKmti7g/+O8tQiC6j9w5QtGPyFibmVZ4U8CeMm
         VC+A==
X-Gm-Message-State: AOAM532xLXAp/B6f4rPdvbegM2S5ZLdLDyUs3O0NJ1BDD+3DOkt7aIFD
        waLGzYR7lBgH4Au2gRz8kBgmkus1odRE/DMMXuWoeQ==
X-Google-Smtp-Source: ABdhPJzYu4GAe2KZbj6JGQ3TjLW4bhjtDiKLF8LYik5ilaN940EpS0CUXvYX1AmTwVvRaeE70SCqKvP8wVhLrFQc8B8=
X-Received: by 2002:a17:90a:778a:: with SMTP id v10mr18672246pjk.229.1615106383749;
 Sun, 07 Mar 2021 00:39:43 -0800 (PST)
MIME-Version: 1.0
References: <20210225132130.26451-1-songmuchun@bytedance.com>
 <20210225132130.26451-6-songmuchun@bytedance.com> <20210307081857.GE1223287@balbir-desktop>
In-Reply-To: <20210307081857.GE1223287@balbir-desktop>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Sun, 7 Mar 2021 16:39:07 +0800
Message-ID: <CAMZfGtUjDj8e9tW2dum+JSMo-BQ5YwPo+Am4ixndkMKaCuG4gQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v17 5/9] mm: hugetlb: set the PageHWPoison
 to the raw error page
To:     Balbir Singh <bsingharora@gmail.com>
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
        Michal Hocko <mhocko@suse.com>,
        "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>,
        David Hildenbrand <david@redhat.com>,
        =?UTF-8?B?SE9SSUdVQ0hJIE5BT1lBKOWggOWPoyDnm7TkuZ8p?= 
        <naoya.horiguchi@nec.com>,
        Joao Martins <joao.m.martins@oracle.com>,
        Xiongchun duan <duanxiongchun@bytedance.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Sun, Mar 7, 2021 at 4:19 PM Balbir Singh <bsingharora@gmail.com> wrote:
>
> On Thu, Feb 25, 2021 at 09:21:26PM +0800, Muchun Song wrote:
> > Because we reuse the first tail vmemmap page frame and remap it
> > with read-only, we cannot set the PageHWPosion on some tail pages.
> > So we can use the head[4].private (There are at least 128 struct
> > page structures associated with the optimized HugeTLB page, so
> > using head[4].private is safe) to record the real error page index
> > and set the raw error page PageHWPoison later.
> >
>
> Does the hardcoding of 4 come from HUGETLB_CGROUP_MIN_ORDER, if so

Yes.

> do we need to hardcode 4? Also, I am not sure about the comment
> on safety and 128 struct pages

We can set head[4].private only if free_vmemmap_pages_per_hpage(h)
returns true. In this case, there are 128 struct page structures (we reserve
2 pages as vmemmap pages, so 2 * 4KB / sizeof(struct page) == 128) that
can be used. Instead of hardcode, I introduce another patch to make the
code more readable. Please refer to patch #8 in this series.

Thanks.

>
> Balbir
>
