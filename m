Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD854C2D0E4
	for <linux-doc@archiver.kernel.org>; Tue, 17 Nov 2020 15:36:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 618242463D
	for <linux-doc@archiver.kernel.org>; Tue, 17 Nov 2020 15:36:01 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=bytedance-com.20150623.gappssmtp.com header.i=@bytedance-com.20150623.gappssmtp.com header.b="nUVsC2+9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726181AbgKQPgB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 17 Nov 2020 10:36:01 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52010 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726174AbgKQPgA (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 17 Nov 2020 10:36:00 -0500
Received: from mail-pl1-x643.google.com (mail-pl1-x643.google.com [IPv6:2607:f8b0:4864:20::643])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 468ACC0617A6
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2020 07:35:59 -0800 (PST)
Received: by mail-pl1-x643.google.com with SMTP id d17so8895340plr.5
        for <linux-doc@vger.kernel.org>; Tue, 17 Nov 2020 07:35:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=hptfVDhp17lNG0zTY32jtB2ORRoWKMoYJw0mGzRFDYU=;
        b=nUVsC2+9jIY0quFTo/Ulukf3VUuU1nHVOeXU3jB/pV+YhS7xXtH3IKlRvLx0ObzOWO
         DFe+fr+fz+KjwT+YERHo4TsJ045U5KRwFYrqEZMTpgVkgnS4iWksZ22Z5OEUFPxDKGMJ
         eLntD23iYtJBYmehuQcIvl5/VDMxMsP8LGOAU9xpC+D7nIzqpC7G81XgCsoXHYAuG9Mj
         RQ+oLGpJpCJeNThKY06vrzlCKBxi9S2nKqY8KayRRfjKM2sL2Hd/B17jOYFiP/d0hBKI
         SOAwSIxeumw6Fdu0RFV5flWlGtSmE4OL223//7brUSNLcCibmXJ41E+Sk7ZYDkc7oEQA
         ox0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=hptfVDhp17lNG0zTY32jtB2ORRoWKMoYJw0mGzRFDYU=;
        b=IbrZsRotcZ26pSOmcngal2TVB0eO27T66gV1341G8uYtlRnc0KOThtaUs2y5SaKVJf
         Ig/5mpGRIYYTNCwMRg1N1AnL5aofsa8jYyg0PJu1Z2G//f48FKM2HLneluuy/XnbISkZ
         2JPH/oYLoV5dxE4po9TfiWIGrBXhbx8cIV3gpg3fOW/97UBHMYInePgaDKGNP1K8WeKS
         r0beRH8th4YMks3+3ouYu3YYUiaPPkym0KsofopWhE58vUIaGiHOEo4NDr2VEkY0xZqN
         LaSBaPlw5yDuaQan1+W7NJXuVy9ZhkHbvVgWZ47OHhb8PKpMDU3+igjk6qWa1tlzvWmq
         Vdzw==
X-Gm-Message-State: AOAM532dVFdt43ZuKPcXZ8gh+mW+0GknveFaP6GIGKHKQPpdZchh6T/0
        KUtBKDCB6FYmbp5fy6l2eiXTykXZzi6t68Zk3t+Ezg==
X-Google-Smtp-Source: ABdhPJwwhxoNvmlzPdAoSMicIpSAuvKb4FDamsz7ABcccu4oUhkRg96zse1OAo2A7X/R+bLoM37GT5VBN2K7h/qnIGg=
X-Received: by 2002:a17:902:c14b:b029:d6:ab18:108d with SMTP id
 11-20020a170902c14bb02900d6ab18108dmr93696plj.20.1605627358702; Tue, 17 Nov
 2020 07:35:58 -0800 (PST)
MIME-Version: 1.0
References: <20201108141113.65450-1-songmuchun@bytedance.com>
 <20201108141113.65450-4-songmuchun@bytedance.com> <20201109135215.GA4778@localhost.localdomain>
 <ef564084-ea73-d579-9251-ec0440df2b48@oracle.com> <20201110195025.GN17076@casper.infradead.org>
In-Reply-To: <20201110195025.GN17076@casper.infradead.org>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Tue, 17 Nov 2020 23:35:19 +0800
Message-ID: <CAMZfGtU=NM3H6X3HzFHNPS8Eekk0RHQ3WqKVER23bK-aBD8CCQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v3 03/21] mm/hugetlb: Introduce a new
 config HUGETLB_PAGE_FREE_VMEMMAP
To:     Matthew Wilcox <willy@infradead.org>
Cc:     Mike Kravetz <mike.kravetz@oracle.com>,
        Oscar Salvador <osalvador@suse.de>,
        Jonathan Corbet <corbet@lwn.net>,
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
        Michal Hocko <mhocko@suse.com>,
        Xiongchun duan <duanxiongchun@bytedance.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Nov 11, 2020 at 3:50 AM Matthew Wilcox <willy@infradead.org> wrote:
>
> On Tue, Nov 10, 2020 at 11:31:31AM -0800, Mike Kravetz wrote:
> > On 11/9/20 5:52 AM, Oscar Salvador wrote:
> > > On Sun, Nov 08, 2020 at 10:10:55PM +0800, Muchun Song wrote:
> > >> The purpose of introducing HUGETLB_PAGE_FREE_VMEMMAP is to configure
> > >> whether to enable the feature of freeing unused vmemmap associated
> > >> with HugeTLB pages. Now only support x86.
> > >>
> > >> Signed-off-by: Muchun Song <songmuchun@bytedance.com>
> > >> ---
> > >>  arch/x86/mm/init_64.c |  2 +-
> > >>  fs/Kconfig            | 16 ++++++++++++++++
> > >>  mm/bootmem_info.c     |  3 +--
> > >>  3 files changed, 18 insertions(+), 3 deletions(-)
> > >>
> > >> diff --git a/arch/x86/mm/init_64.c b/arch/x86/mm/init_64.c
> > >> index 0a45f062826e..0435bee2e172 100644
> > >> --- a/arch/x86/mm/init_64.c
> > >> +++ b/arch/x86/mm/init_64.c
> > >> @@ -1225,7 +1225,7 @@ static struct kcore_list kcore_vsyscall;
> > >>
> > >>  static void __init register_page_bootmem_info(void)
> > >>  {
> > >> -#ifdef CONFIG_NUMA
> > >> +#if defined(CONFIG_NUMA) || defined(CONFIG_HUGETLB_PAGE_FREE_VMEMMAP)
> > >>    int i;
> > >>
> > >>    for_each_online_node(i)
> > >> diff --git a/fs/Kconfig b/fs/Kconfig
> > >> index 976e8b9033c4..21b8d39a9715 100644
> > >> --- a/fs/Kconfig
> > >> +++ b/fs/Kconfig
> > >> @@ -245,6 +245,22 @@ config HUGETLBFS
> > >>  config HUGETLB_PAGE
> > >>    def_bool HUGETLBFS
> > >>
> > >> +config HUGETLB_PAGE_FREE_VMEMMAP
> > >> +  bool "Free unused vmemmap associated with HugeTLB pages"
> > >> +  default y
> > >> +  depends on X86
> > >> +  depends on HUGETLB_PAGE
> > >> +  depends on SPARSEMEM_VMEMMAP
> > >> +  depends on HAVE_BOOTMEM_INFO_NODE
> > >> +  help
> > >> +    There are many struct page structures associated with each HugeTLB
> > >> +    page. But we only use a few struct page structures. In this case,
> > >> +    it wastes some memory. It is better to free the unused struct page
> > >> +    structures to buddy system which can save some memory. For
> > >> +    architectures that support it, say Y here.
> > >> +
> > >> +    If unsure, say N.
> > >
> > > I am not sure the above is useful for someone who needs to decide
> > > whether he needs/wants to enable this or not.
> > > I think the above fits better in a Documentation part.
> > >
> > > I suck at this, but what about the following, or something along those
> > > lines?
> > >
> > > "
> > > When using SPARSEMEM_VMEMMAP, the system can save up some memory
> > > from pre-allocated HugeTLB pages when they are not used.
> > > 6 pages per 2MB HugeTLB page and 4095 per 1GB HugeTLB page.
> > > When the pages are going to be used or freed up, the vmemmap
> > > array representing that range needs to be remapped again and
> > > the pages we discarded earlier need to be rellocated again.
> > > Therefore, this is a trade-off between saving memory and
> > > increasing time in allocation/free path.
> > > "
> > >
> > > It would be also great to point out that this might be a
> > > trade-off between saving up memory and increasing the cost
> > > of certain operations on allocation/free path.
> > > That is why I mentioned it there.
> >
> > Yes, this is somewhat a trade-off.
> >
> > As a config option, this is something that would likely be decided by
> > distros.  I almost hate to suggest this, but is it something that an
> > end user would want to decide?  Is this something that perhaps should
> > be a boot/kernel command line option?
>
> I don't like config options.  I like boot options even less.  I don't
> know how to describe to an end-user whether they should select this
> or not.  Is there a way to make this not a tradeoff?  Or make the
> tradeoff so minimal as to be not worth describing?  (do we have numbers
> for the worst possible situation when enabling this option?)
>
> I haven't read through these patches in detail, so maybe we do this
> already, but when we free the pages to the buddy allocator, do we retain
> the third page to use for the PTEs (and free pages 3-7), or do we allocate
> a separate page for the PTES and free pages 2-7?

Sorry for missing this reply. It is a good idea. I will start an investigation
and implement this. Thanks Matthew.



-- 
Yours,
Muchun
