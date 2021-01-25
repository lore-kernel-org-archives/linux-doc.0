Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6BD11C433E6
	for <linux-doc@archiver.kernel.org>; Mon, 25 Jan 2021 05:07:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 48C9B22C9C
	for <linux-doc@archiver.kernel.org>; Mon, 25 Jan 2021 05:07:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726627AbhAYFH3 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 25 Jan 2021 00:07:29 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726326AbhAYFHZ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 25 Jan 2021 00:07:25 -0500
Received: from mail-pf1-x42c.google.com (mail-pf1-x42c.google.com [IPv6:2607:f8b0:4864:20::42c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 20CA4C061756
        for <linux-doc@vger.kernel.org>; Sun, 24 Jan 2021 21:06:39 -0800 (PST)
Received: by mail-pf1-x42c.google.com with SMTP id m6so7742042pfk.1
        for <linux-doc@vger.kernel.org>; Sun, 24 Jan 2021 21:06:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=F+LeAZ3S+m2I2AXil2lfLUpMV0pLG8mixzK8f2VmApw=;
        b=aT/9rd5uVrMHlG0kkM6L/ia4xQjNlHVLs7Yo1N4ieoOC/buPWE6taP44/uPWB4C4QO
         b4Ru5GuscZDSNJZXEJiW7nIKDqISX1Hch5YioyQWLgtUxJgFCt2wFEINniJJUcfUR+QV
         E/ALPWnPNg64mfGe/PwI4ngpWA40dORyhsKBNSsjjR9b1/mt1Fw/K9wR2onR0mtBbHck
         RJixkzeApzAPHTz97k94LyHMkdHedYZwexLkyikaPapRTrmJbYT9NsSRRSJGLsF3eI0v
         0ov0SQNfDeV7KWf9t8lB0gTOuX/ObgtvKeMdtzrOT+997Ci7dj4f1Thrw4XhS0sxvZhh
         r/QQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=F+LeAZ3S+m2I2AXil2lfLUpMV0pLG8mixzK8f2VmApw=;
        b=nSSa+NEEqg1fXSMrc01f6x0tSV3Ktos2qb48GPW+wJemryv/94nCC732/PyPruC8/c
         Oula0lr1PmgKkS/lCvJpvbBughNN+X7ClpdNHaGI2dZrLgsU5bYjhaRCerfE6/rwbXEw
         hP7I8W3j7n5Lb6L0NXWB3pb2qhxUY/BuqTKJyizfcubRnDf2vFPm7XZsJI6qJ16N1Q55
         R485qGxIGI2zHSw+JvTl+RLTydGCkj4CnNFptbEl9PkZsOLlf/7Si/5eSVtxNsmTBzZg
         DIhSXKDDFq6j7u+lju0x/Ho3Okap1FEH/30t0e4wG4C63++q4t5TbGGe90MiTx2u+hto
         nwkQ==
X-Gm-Message-State: AOAM532Xz4Z56tb3XvLsTsu2N8Ah8xw/cIs7gJZPgTvk81BZx0/SLpys
        2uDaTdOksNz4aC2jE+a77Msfr8b3iuWmzYbgcXtXvA==
X-Google-Smtp-Source: ABdhPJy+Le05w7oqogZ0luTwVIsG6PienApfkykZwVB3DkAUwmltvOrYL6hQhvcX2VeH0nh0dnEHd1r+rretXXAsrPE=
X-Received: by 2002:a63:1f21:: with SMTP id f33mr319808pgf.31.1611551198624;
 Sun, 24 Jan 2021 21:06:38 -0800 (PST)
MIME-Version: 1.0
References: <20210117151053.24600-1-songmuchun@bytedance.com>
 <20210117151053.24600-3-songmuchun@bytedance.com> <472a58b9-12cb-3c3-d132-13dbae5174f0@google.com>
 <CAMZfGtUGT6UP3aBEGmMvahOu5akvqoVoiXQqQvAdY82P6VGiTg@mail.gmail.com> <eef4ff8b-f3e3-6ae0-bae8-243bd0c8add0@infradead.org>
In-Reply-To: <eef4ff8b-f3e3-6ae0-bae8-243bd0c8add0@infradead.org>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Mon, 25 Jan 2021 13:06:02 +0800
Message-ID: <CAMZfGtV5rcCq6EGFAG4joRfWht0=1WE6Oik7LgNUPr-_iNX4Xg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v13 02/12] mm: hugetlb: introduce a new
 config HUGETLB_PAGE_FREE_VMEMMAP
To:     Randy Dunlap <rdunlap@infradead.org>
Cc:     David Rientjes <rientjes@google.com>,
        Jonathan Corbet <corbet@lwn.net>,
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

On Mon, Jan 25, 2021 at 12:09 PM Randy Dunlap <rdunlap@infradead.org> wrote:
>
> On 1/24/21 8:06 PM, Muchun Song wrote:
> > On Mon, Jan 25, 2021 at 7:58 AM David Rientjes <rientjes@google.com> wrote:
> >>
> >>
> >> On Sun, 17 Jan 2021, Muchun Song wrote:
> >>
> >>> The HUGETLB_PAGE_FREE_VMEMMAP option is used to enable the freeing
> >>> of unnecessary vmemmap associated with HugeTLB pages. The config
> >>> option is introduced early so that supporting code can be written
> >>> to depend on the option. The initial version of the code only
> >>> provides support for x86-64.
> >>>
> >>> Like other code which frees vmemmap, this config option depends on
> >>> HAVE_BOOTMEM_INFO_NODE. The routine register_page_bootmem_info() is
> >>> used to register bootmem info. Therefore, make sure
> >>> register_page_bootmem_info is enabled if HUGETLB_PAGE_FREE_VMEMMAP
> >>> is defined.
> >>>
> >>> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> >>> Reviewed-by: Oscar Salvador <osalvador@suse.de>
> >>> Acked-by: Mike Kravetz <mike.kravetz@oracle.com>
> >>> ---
> >>>  arch/x86/mm/init_64.c |  2 +-
> >>>  fs/Kconfig            | 18 ++++++++++++++++++
> >>>  2 files changed, 19 insertions(+), 1 deletion(-)
> >>>
> >>> diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
> >>> index 0a45f062826e..0435bee2e172 100644
> >>> --- a/arch/x86/mm/init_64.c
> >>> +++ b/arch/x86/mm/init_64.c
> >>> @@ -1225,7 +1225,7 @@ static struct kcore_list kcore_vsyscall;
> >>>
> >>>  static void __init register_page_bootmem_info(void)
> >>>  {
> >>> -#ifdef CONFIG_NUMA
> >>> +#if defined(CONFIG_NUMA) || defined(CONFIG_HUGETLB_PAGE_FREE_VMEMMAP)
> >>>       int i;
> >>>
> >>>       for_each_online_node(i)
> >>> diff --git a/fs/Kconfig b/fs/Kconfig
> >>> index 976e8b9033c4..e7c4c2a79311 100644
> >>> --- a/fs/Kconfig
> >>> +++ b/fs/Kconfig
> >>> @@ -245,6 +245,24 @@ config HUGETLBFS
> >>>  config HUGETLB_PAGE
> >>>       def_bool HUGETLBFS
> >>>
> >>> +config HUGETLB_PAGE_FREE_VMEMMAP
> >>> +     def_bool HUGETLB_PAGE
> >>
> >> I'm not sure I understand the rationale for providing this help text if
> >> this is def_bool depending on CONFIG_HUGETLB_PAGE.  Are you intending that
> >> this is actually configurable and we want to provide guidance to the admin
> >> on when to disable it (which it currently doesn't)?  If not, why have the
> >> help text?
> >
> > This is __not__ configurable. Seems like a comment to help others
> > understand this option. Like Randy said.
>
> Yes, it could be written with '#' (or "comment") comment syntax instead of as help text.

Got it. I will update in the next version. Thanks.

>
> thanks.
>
> >>
> >>> +     depends on X86_64
> >>> +     depends on SPARSEMEM_VMEMMAP
> >>> +     depends on HAVE_BOOTMEM_INFO_NODE
> >>> +     help
> >>> +       The option HUGETLB_PAGE_FREE_VMEMMAP allows for the freeing of
> >>> +       some vmemmap pages associated with pre-allocated HugeTLB pages.
> >>> +       For example, on X86_64 6 vmemmap pages of size 4KB each can be
> >>> +       saved for each 2MB HugeTLB page.  4094 vmemmap pages of size 4KB
> >>> +       each can be saved for each 1GB HugeTLB page.
> >>> +
> >>> +       When a HugeTLB page is allocated or freed, the vmemmap array
> >>> +       representing the range associated with the page will need to be
> >>> +       remapped.  When a page is allocated, vmemmap pages are freed
> >>> +       after remapping.  When a page is freed, previously discarded
> >>> +       vmemmap pages must be allocated before remapping.
> >>> +
> >>>  config MEMFD_CREATE
> >>>       def_bool TMPFS || HUGETLBFS
> >>>
> >
>
>
> --
> ~Randy
>
