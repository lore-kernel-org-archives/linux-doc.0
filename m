Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B292FC433DB
	for <linux-doc@archiver.kernel.org>; Thu,  4 Mar 2021 03:40:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 849BE64DE8
	for <linux-doc@archiver.kernel.org>; Thu,  4 Mar 2021 03:40:06 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232688AbhCDDih (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 3 Mar 2021 22:38:37 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35110 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232664AbhCDDiH (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Wed, 3 Mar 2021 22:38:07 -0500
Received: from mail-pj1-x102f.google.com (mail-pj1-x102f.google.com [IPv6:2607:f8b0:4864:20::102f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4D57C061760
        for <linux-doc@vger.kernel.org>; Wed,  3 Mar 2021 19:37:26 -0800 (PST)
Received: by mail-pj1-x102f.google.com with SMTP id d2so5901523pjs.4
        for <linux-doc@vger.kernel.org>; Wed, 03 Mar 2021 19:37:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=V5aaETOTZkHBTtEXphmw/cUhBvHYGOGg2bi64gc0COM=;
        b=fZ7WA8txY9uXEXqTFaVbB4DIu0hZ0dICn+uHs2p4lCHU4k3P47Yo0zFYBBq7GpxFH+
         NRN/Iz/ofK337vNhjF8Ttoyok/6H25rgUDLSkYtumyFREI78IqpOuNJEU4YtAt++YJNA
         67QO5GDhjSaqve0o0ZH2ujiGkGQ60l6raKjrMw7Unc/KHTCOxJZc+OnXC5RMu/ESzfC0
         +QwEAaNeGndLDHeZgven22q6jpxUt00LwhdFxPtyE1s/lKjiVZ+8kNVQCmHmRFrh13dR
         +3Fe8JsYKC6e5qK1PDz5rkeqMlMIwccy5FdQaL2yEjluQ3A57xKCCUXuwtEEqu2IzbA8
         2Wdg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=V5aaETOTZkHBTtEXphmw/cUhBvHYGOGg2bi64gc0COM=;
        b=l/A30PrL9M5e8DydHlRemp9TciftUC7bob12Y1lktDd6gmjFOHC1Z0N7/1DKACLTRd
         qRCgx+YbkRzMrzhiJJrcThuoUhkA1Q0uxHxcVQ49ZGJELJ0owtn+eH4Av0UIWNYv1lrq
         ToysobTTz9bNAw9coUJvohrZUE2yS+3EYHlZFmt0GCs1CHbLLpsr+Sr9Epj93gS5Kata
         JqlW+0j0IaFYHvaHXJMLID/8OySWoj8zq/F9e75z4CtNKUXC70djUTjBDcB3EHiUp2os
         b+I7c3AX6hEnmdrUIoTPZ/NM76KEu+UfuNOsjome4+CPWjKW6QQFa/6+BU1biUSP/G3X
         b6Eg==
X-Gm-Message-State: AOAM530+Zy0B+IP9UdFnL053f7tkGF9nvEG+wJlXZ71Wvg3LL4/mocG1
        UCNfmvBL+RdeLG6gkZmtSEMYI88ZyV4Rh5OYmRLTYQ==
X-Google-Smtp-Source: ABdhPJw+Pt8GPG27iErHvkZjPIsoVxDhuetCkdHSYGA/hC/MW/L8FCiOy4ferytRGPCEKiUQQmnWNi6Pibpf7dqHNls=
X-Received: by 2002:a17:90a:f008:: with SMTP id bt8mr2359360pjb.13.1614829041551;
 Wed, 03 Mar 2021 19:37:21 -0800 (PST)
MIME-Version: 1.0
References: <20210225132130.26451-1-songmuchun@bytedance.com> <e9ef3479-24f1-9304-ee0e-6f06fb457d50@gmail.com>
In-Reply-To: <e9ef3479-24f1-9304-ee0e-6f06fb457d50@gmail.com>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Thu, 4 Mar 2021 11:36:44 +0800
Message-ID: <CAMZfGtWeyo8+uWf7oB4ODqpyOw_--K+LdYeJDhdFj+ob0OaoeA@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v17 0/9] Free some vmemmap pages of HugeTLB page
To:     "Singh, Balbir" <bsingharora@gmail.com>
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

On Thu, Mar 4, 2021 at 11:14 AM Singh, Balbir <bsingharora@gmail.com> wrote:
>
> On 26/2/21 12:21 am, Muchun Song wrote:
> > Hi all,
> >
> > This patch series will free some vmemmap pages(struct page structures)
> > associated with each hugetlbpage when preallocated to save memory.
> >
> > In order to reduce the difficulty of the first version of code review.
> > From this version, we disable PMD/huge page mapping of vmemmap if this
> > feature was enabled. This accutualy eliminate a bunch of the complex code
> > doing page table manipulation. When this patch series is solid, we cam add
> > the code of vmemmap page table manipulation in the future.
> >
> > The struct page structures (page structs) are used to describe a physical
> > page frame. By default, there is a one-to-one mapping from a page frame to
> > it's corresponding page struct.
> >
> > The HugeTLB pages consist of multiple base page size pages and is supported
> > by many architectures. See hugetlbpage.rst in the Documentation directory
> > for more details. On the x86 architecture, HugeTLB pages of size 2MB and 1GB
> > are currently supported. Since the base page size on x86 is 4KB, a 2MB
> > HugeTLB page consists of 512 base pages and a 1GB HugeTLB page consists of
> > 4096 base pages. For each base page, there is a corresponding page struct.
> >
> > Within the HugeTLB subsystem, only the first 4 page structs are used to
> > contain unique information about a HugeTLB page. HUGETLB_CGROUP_MIN_ORDER
> > provides this upper limit. The only 'useful' information in the remaining
> > page structs is the compound_head field, and this field is the same for all
> > tail pages.
>
> The HUGETLB_CGROUP_MIN_ORDER is only when CGROUP_HUGETLB is enabled, but I guess
> that does not matter

Agree.

>
> >
> > By removing redundant page structs for HugeTLB pages, memory can returned to
> > the buddy allocator for other uses.
> >
> > When the system boot up, every 2M HugeTLB has 512 struct page structs which
> > size is 8 pages(sizeof(struct page) * 512 / PAGE_SIZE).
> >
> >     HugeTLB                  struct pages(8 pages)         page frame(8 pages)
> >  +-----------+ ---virt_to_page---> +-----------+   mapping to   +-----------+
> >  |           |                     |     0     | -------------> |     0     |
> >  |           |                     +-----------+                +-----------+
> >  |           |                     |     1     | -------------> |     1     |
> >  |           |                     +-----------+                +-----------+
> >  |           |                     |     2     | -------------> |     2     |
> >  |           |                     +-----------+                +-----------+
> >  |           |                     |     3     | -------------> |     3     |
> >  |           |                     +-----------+                +-----------+
> >  |           |                     |     4     | -------------> |     4     |
> >  |    2MB    |                     +-----------+                +-----------+
> >  |           |                     |     5     | -------------> |     5     |
> >  |           |                     +-----------+                +-----------+
> >  |           |                     |     6     | -------------> |     6     |
> >  |           |                     +-----------+                +-----------+
> >  |           |                     |     7     | -------------> |     7     |
> >  |           |                     +-----------+                +-----------+
> >  |           |
> >  |           |
> >  |           |
> >  +-----------+
> >
> > The value of page->compound_head is the same for all tail pages. The first
> > page of page structs (page 0) associated with the HugeTLB page contains the 4
> > page structs necessary to describe the HugeTLB. The only use of the remaining
> > pages of page structs (page 1 to page 7) is to point to page->compound_head.
> > Therefore, we can remap pages 2 to 7 to page 1. Only 2 pages of page structs
> > will be used for each HugeTLB page. This will allow us to free the remaining
> > 6 pages to the buddy allocator.
>
> What is page 1 used for? page 0 carries the 4 struct pages needed, does compound_head
> need a full page? IOW, why do we need two full pages -- may be the patches have the
> answer to something I am missing?

Yeah. It really can free 7 pages. But we need some work to support this. Why?

Now for the 2MB HugeTLB page, we only free 6 vmemmap pages. we really can
free 7 vmemmap pages. In this case, we can see 8 of the 512 struct page
structures have been set PG_head flag. If we can adjust compound_head()
slightly and make compound_head() return the real head struct page when
the parameter is the tail struct page but with PG_head flag set.

In order to make the code evolution route clearer. This feature can be
a separate patch (and send it out) after this patchset is solid and applied.

>
> >
> > Here is how things look after remapping.
> >
> >     HugeTLB                  struct pages(8 pages)         page frame(8 pages)
> >  +-----------+ ---virt_to_page---> +-----------+   mapping to   +-----------+
> >  |           |                     |     0     | -------------> |     0     |
> >  |           |                     +-----------+                +-----------+
> >  |           |                     |     1     | -------------> |     1     |
> >  |           |                     +-----------+                +-----------+
> >  |           |                     |     2     | ----------------^ ^ ^ ^ ^ ^
> >  |           |                     +-----------+                   | | | | |
> >  |           |                     |     3     | ------------------+ | | | |
> >  |           |                     +-----------+                     | | | |
> >  |           |                     |     4     | --------------------+ | | |
> >  |    2MB    |                     +-----------+                       | | |
> >  |           |                     |     5     | ----------------------+ | |
> >  |           |                     +-----------+                         | |
> >  |           |                     |     6     | ------------------------+ |
> >  |           |                     +-----------+                           |
> >  |           |                     |     7     | --------------------------+
> >  |           |                     +-----------+
> >  |           |
> >  |           |
> >  |           |
> >  +-----------+
> >
> > When a HugeTLB is freed to the buddy system, we should allocate 6 pages for
> > vmemmap pages and restore the previous mapping relationship.
> >
>
> Can these 6 pages come from the hugeTLB page itself? When you say 6 pages,
> I presume you mean 6 pages of PAGE_SIZE

There was a decent discussion about this in a previous version of the
series starting here:

https://lore.kernel.org/linux-mm/20210126092942.GA10602@linux/

In this thread various other options were suggested and discussed.

Thanks.

>
> > Apart from 2MB HugeTLB page, we also have 1GB HugeTLB page. It is similar
> > to the 2MB HugeTLB page. We also can use this approach to free the vmemmap
> > pages.
> >
> > In this case, for the 1GB HugeTLB page, we can save 4094 pages. This is a
> > very substantial gain. On our server, run some SPDK/QEMU applications which
> > will use 1024GB hugetlbpage. With this feature enabled, we can save ~16GB
> > (1G hugepage)/~12GB (2MB hugepage) memory.
>
> Thanks,
> Balbir Singh
>
>
>
>
>
>
>
>
>
>
>
>
>
