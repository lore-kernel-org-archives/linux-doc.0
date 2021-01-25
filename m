Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E0784C433E6
	for <linux-doc@archiver.kernel.org>; Mon, 25 Jan 2021 04:07:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A192022CA2
	for <linux-doc@archiver.kernel.org>; Mon, 25 Jan 2021 04:07:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726810AbhAYEH2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sun, 24 Jan 2021 23:07:28 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52278 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726760AbhAYEH0 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sun, 24 Jan 2021 23:07:26 -0500
Received: from mail-pj1-x1032.google.com (mail-pj1-x1032.google.com [IPv6:2607:f8b0:4864:20::1032])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1A529C06174A
        for <linux-doc@vger.kernel.org>; Sun, 24 Jan 2021 20:06:46 -0800 (PST)
Received: by mail-pj1-x1032.google.com with SMTP id a20so4586614pjs.1
        for <linux-doc@vger.kernel.org>; Sun, 24 Jan 2021 20:06:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=ItE1V13xBIFMkkQIHyN5DolaFu5DIm6bF+ssAPU9ZZI=;
        b=Osne98d5EG6Q4OgIiE1GaIE3O0+xF6vOIiExm4HkwuVPdtKKHhMFdIJ+/l8J4H2OAH
         ikTyDWyvyFhXGb/kimFpGD/pgg7dVHL+oLrAVq8ViN7P9s5+sAuVPNROvTdtnsln5ZSw
         H2RDyFkyWrJo9Xr+eMxxWYSDuGgBnA959wnzc6ix7E1VivvjLjeqXBug7FKuD7enonmf
         QNIL5aWM7R1ptspa6cqH95HdAdZ9ztXCH5vuOhQHuTJZ9IF7K2cTySkNuIaWY38eBeJZ
         2kqsxUUcgOSmtE4kP/M73pXgD42vzVZmQonZkaGsOf/1otjVLVgE/dE+RnAk6CP09ocV
         VhaA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=ItE1V13xBIFMkkQIHyN5DolaFu5DIm6bF+ssAPU9ZZI=;
        b=FRDvzBvwRbebbJXMMs4N8heZGyJdfpBQZW63cXLBu3CIxtBhcsjoy32C8ntSKl8lDi
         jYBIiaYACpTxvratr7z+Y/ZTq2oGvlZSNBq1Iz9sZ9FZF+MDpclGbhn3hXidN8xLHGTp
         YWeevWR3wV2JrhiWTifx7P7R30fEbAdet44g4e+eAgHdWw9vjiAUefsKY743dCc0ZSJg
         QJPgBLJuao67p+SWWbyDlJ8p3RveQbc+MnxHBnf454WiBDU6FwIcnqP57Xqqg2GZFH0G
         YllV3ZePEhSiEHS0Roo+wyqQESsCRDHMwuVwuM1/rxJVm1K89tSIOz/YJYjBueTPsg6y
         Qdxw==
X-Gm-Message-State: AOAM532NDUYa4/6eg3XCQ+3cjAF5SsvI1RLwp6fj3UB4ezo72PjgPfJj
        j+yEcxEyVXmJYXY3CWePBA6GeUtifQVN3vGIhXrjJw==
X-Google-Smtp-Source: ABdhPJzfgcSfEwTTRxkh7UYvNdHkjg7MVrQEFF/Ie65pk7W0mEUa7DUpMagmTluzyq+VB7ZhdUNm+Sqn9nL7vIH3J6U=
X-Received: by 2002:a17:90a:808a:: with SMTP id c10mr5558079pjn.229.1611547605568;
 Sun, 24 Jan 2021 20:06:45 -0800 (PST)
MIME-Version: 1.0
References: <20210117151053.24600-1-songmuchun@bytedance.com>
 <20210117151053.24600-3-songmuchun@bytedance.com> <472a58b9-12cb-3c3-d132-13dbae5174f0@google.com>
In-Reply-To: <472a58b9-12cb-3c3-d132-13dbae5174f0@google.com>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Mon, 25 Jan 2021 12:06:09 +0800
Message-ID: <CAMZfGtUGT6UP3aBEGmMvahOu5akvqoVoiXQqQvAdY82P6VGiTg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v13 02/12] mm: hugetlb: introduce a new
 config HUGETLB_PAGE_FREE_VMEMMAP
To:     David Rientjes <rientjes@google.com>,
        Randy Dunlap <rdunlap@infradead.org>
Cc:     Jonathan Corbet <corbet@lwn.net>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Thomas Gleixner <tglx@linutronix.de>, mingo@redhat.com,
        bp@alien8.de, x86@kernel.org, hpa@zytor.com,
        dave.hansen@linux.intel.com, luto@kernel.org,
        Peter Zijlstra <peterz@infradead.org>, viro@zeniv.linux.org.uk,
        Andrew Morton <akpm@linux-foundation.org>, paulmck@kernel.org,
        mchehab+huawei@kernel.org, pawan.kumar.gupta@linux.intel.com,
        oneukum@suse.com, anshuman.khandual@arm.com, jroedel@suse.de,
        Mina Almasry <almasrymina@google.com>,
        Matthew Wilcox <willy@infradead.org>,
        Oscar Salvador <osalvador@suse.de>,
        Michal Hocko <mhocko@suse.com>,
        "Song Bao Hua (Barry Song)" <song.bao.hua@hisilicon.com>,
        David Hildenbrand <david@redhat.com>,
        =?UTF-8?B?SE9SSUdVQ0hJIE5BT1lBKOWggOWPoyDnm7TkuZ8p?= 
        <naoya.horiguchi@nec.com>,
        Xiongchun duan <duanxiongchun@bytedance.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Jan 25, 2021 at 7:58 AM David Rientjes <rientjes@google.com> wrote:
>
>
> On Sun, 17 Jan 2021, Muchun Song wrote:
>
> > The HUGETLB_PAGE_FREE_VMEMMAP option is used to enable the freeing
> > of unnecessary vmemmap associated with HugeTLB pages. The config
> > option is introduced early so that supporting code can be written
> > to depend on the option. The initial version of the code only
> > provides support for x86-64.
> >
> > Like other code which frees vmemmap, this config option depends on
> > HAVE_BOOTMEM_INFO_NODE. The routine register_page_bootmem_info() is
> > used to register bootmem info. Therefore, make sure
> > register_page_bootmem_info is enabled if HUGETLB_PAGE_FREE_VMEMMAP
> > is defined.
> >
> > Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> > Reviewed-by: Oscar Salvador <osalvador@suse.de>
> > Acked-by: Mike Kravetz <mike.kravetz@oracle.com>
> > ---
> >  arch/x86/mm/init_64.c |  2 +-
> >  fs/Kconfig            | 18 ++++++++++++++++++
> >  2 files changed, 19 insertions(+), 1 deletion(-)
> >
> > diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
> > index 0a45f062826e..0435bee2e172 100644
> > --- a/arch/x86/mm/init_64.c
> > +++ b/arch/x86/mm/init_64.c
> > @@ -1225,7 +1225,7 @@ static struct kcore_list kcore_vsyscall;
> >
> >  static void __init register_page_bootmem_info(void)
> >  {
> > -#ifdef CONFIG_NUMA
> > +#if defined(CONFIG_NUMA) || defined(CONFIG_HUGETLB_PAGE_FREE_VMEMMAP)
> >       int i;
> >
> >       for_each_online_node(i)
> > diff --git a/fs/Kconfig b/fs/Kconfig
> > index 976e8b9033c4..e7c4c2a79311 100644
> > --- a/fs/Kconfig
> > +++ b/fs/Kconfig
> > @@ -245,6 +245,24 @@ config HUGETLBFS
> >  config HUGETLB_PAGE
> >       def_bool HUGETLBFS
> >
> > +config HUGETLB_PAGE_FREE_VMEMMAP
> > +     def_bool HUGETLB_PAGE
>
> I'm not sure I understand the rationale for providing this help text if
> this is def_bool depending on CONFIG_HUGETLB_PAGE.  Are you intending that
> this is actually configurable and we want to provide guidance to the admin
> on when to disable it (which it currently doesn't)?  If not, why have the
> help text?

This is __not__ configurable. Seems like a comment to help others
understand this option. Like Randy said.

Thanks.

>
> > +     depends on X86_64
> > +     depends on SPARSEMEM_VMEMMAP
> > +     depends on HAVE_BOOTMEM_INFO_NODE
> > +     help
> > +       The option HUGETLB_PAGE_FREE_VMEMMAP allows for the freeing of
> > +       some vmemmap pages associated with pre-allocated HugeTLB pages.
> > +       For example, on X86_64 6 vmemmap pages of size 4KB each can be
> > +       saved for each 2MB HugeTLB page.  4094 vmemmap pages of size 4KB
> > +       each can be saved for each 1GB HugeTLB page.
> > +
> > +       When a HugeTLB page is allocated or freed, the vmemmap array
> > +       representing the range associated with the page will need to be
> > +       remapped.  When a page is allocated, vmemmap pages are freed
> > +       after remapping.  When a page is freed, previously discarded
> > +       vmemmap pages must be allocated before remapping.
> > +
> >  config MEMFD_CREATE
> >       def_bool TMPFS || HUGETLBFS
> >
