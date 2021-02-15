Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 945CDC433DB
	for <linux-doc@archiver.kernel.org>; Mon, 15 Feb 2021 10:06:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5550E64DF0
	for <linux-doc@archiver.kernel.org>; Mon, 15 Feb 2021 10:06:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230060AbhBOKGY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 15 Feb 2021 05:06:24 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53814 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230005AbhBOKGX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 15 Feb 2021 05:06:23 -0500
Received: from mail-pj1-x102c.google.com (mail-pj1-x102c.google.com [IPv6:2607:f8b0:4864:20::102c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0099AC061756
        for <linux-doc@vger.kernel.org>; Mon, 15 Feb 2021 02:05:42 -0800 (PST)
Received: by mail-pj1-x102c.google.com with SMTP id nm1so3432366pjb.3
        for <linux-doc@vger.kernel.org>; Mon, 15 Feb 2021 02:05:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=DmRB0K44KO7vG/sp1xtUpHVwS6fGMWfTKOE8QU8jS6g=;
        b=EhjrjjBYBupuI5im9doAwVzO+jGLquTgwobo7U7h3v0K1j4+obz4rjNleNiQ0aPEqZ
         IHY9+7M4Vd2XXMsNbJe5aNZpoMy2ArzXBurcksVbF1YUiMH6cgwm5mfd+RCu2K0PHI9O
         hGXGA7Uc5JkSiWzC7Yv18dOIaqkgGJgRdDPb+vfGpEG+wi4fLoHCujyw4qC1yH2f2NID
         LRnAWqpTTUrx1HSRDEPr9KBqy2AXz3oPQnSljzqgZXbZ5hc5MRdxm7Z16NvzEEX4OGyn
         AAuHKLuXnOWV0VUvted7bLe42IU2y8LNp07b53RTcEthwczxVjWkAD21NW5756+5CSmx
         vyiw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=DmRB0K44KO7vG/sp1xtUpHVwS6fGMWfTKOE8QU8jS6g=;
        b=hT8rKgr610oBfedva86gUBEkal7H7N7/EUAusTIUk2SLRZC67/UieKhduAv+WqDaGZ
         xgjRhmUPcH8UtopHBbSEVLf2i9mA4W0ALZlGH+YkFTBkr0h8yswSr6Egd/+tAOJj93CS
         Eolxo0/sVkC/ww9o/ck/7MDa5TxAji995w0BHKFe7LJTe5kvKMvOGIW/84p7xdnbz1R9
         lIKEIXv1pYZEfWw76vZdm6IVjnCF/44rCNijFpB/JmbWIKdEVfDovSXozkvIZ1nR+rU5
         aANO7/z6Ir8VU6K56mP5kUiwLweHey67RMnO2fiW3zjTzQvcfeM+zB7edG08Ts7kYMFx
         Q90g==
X-Gm-Message-State: AOAM531/qYcRCR/jBCfoLJAjtrGnzGvWIzBPyeOKrC6bd/TWsC6V+/a8
        Sh/2Bk3bCJNvmY7iZEBmZ8zOdg0PNsb4LHIySPChvQ==
X-Google-Smtp-Source: ABdhPJz3aVkYh+fCF+JZBBZYkK3dCHFrSlukd/ZQkDuxm0T341Lg/HmVz8233DOtYoTwQIYNuKyP66yVJ8zhGG9fRlE=
X-Received: by 2002:a17:902:7290:b029:e3:1dcf:f3ec with SMTP id
 d16-20020a1709027290b02900e31dcff3ecmr14638057pll.20.1613383542493; Mon, 15
 Feb 2021 02:05:42 -0800 (PST)
MIME-Version: 1.0
References: <20210208085013.89436-1-songmuchun@bytedance.com>
 <20210208085013.89436-5-songmuchun@bytedance.com> <YCafit5ruRJ+SL8I@dhcp22.suse.cz>
In-Reply-To: <YCafit5ruRJ+SL8I@dhcp22.suse.cz>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Mon, 15 Feb 2021 18:05:06 +0800
Message-ID: <CAMZfGtXgVUvCejpxu1o5WDvmQ7S88rWqGi3DAGM6j5NHJgtdcg@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v15 4/8] mm: hugetlb: alloc the vmemmap
 pages associated with each HugeTLB page
To:     Michal Hocko <mhocko@suse.com>
Cc:     Jonathan Corbet <corbet@lwn.net>,
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

On Fri, Feb 12, 2021 at 11:32 PM Michal Hocko <mhocko@suse.com> wrote:
>
> On Mon 08-02-21 16:50:09, Muchun Song wrote:
> > When we free a HugeTLB page to the buddy allocator, we should allocate the
> > vmemmap pages associated with it. But we may cannot allocate vmemmap pages
> > when the system is under memory pressure, in this case, we just refuse to
> > free the HugeTLB page instead of looping forever trying to allocate the
> > pages.
>
> Thanks for simplifying the implementation from your early proposal!
>
> This will not be looping for ever. The allocation will usually trigger
> the OOM killer and sooner or later there will be a memory to allocate
> from or the system panics when there are no eligible tasks to kill. This
> is just a side note.
>
> I think the changelog could benefit from a more explicit documentation
> of those error failures. There are different cases when the hugetlb page
> is freed. It can be due to an admin intervention (decrease the pool),
> overcommit, migration, dissolving and likely some others. Most of them
> should be fine to stay in the pool which would just increase the surplus
> pages in the pool. I am not so sure about dissolving path.

Thanks. I will update the changelog.

> [...]
> > diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
> > index 0209b736e0b4..3d85e3ab7caa 100644
> > --- a/mm/hugetlb_vmemmap.c
> > +++ b/mm/hugetlb_vmemmap.c
> > @@ -169,6 +169,8 @@
> >   * (last) level. So this type of HugeTLB page can be optimized only when its
> >   * size of the struct page structs is greater than 2 pages.
> >   */
> > +#define pr_fmt(fmt)  "HugeTLB: " fmt
> > +
> >  #include "hugetlb_vmemmap.h"
> >
> >  /*
> > @@ -198,6 +200,34 @@ static inline unsigned long free_vmemmap_pages_size_per_hpage(struct hstate *h)
> >       return (unsigned long)free_vmemmap_pages_per_hpage(h) << PAGE_SHIFT;
> >  }
> >
> > +int alloc_huge_page_vmemmap(struct hstate *h, struct page *head)
> > +{
> > +     int ret;
> > +     unsigned long vmemmap_addr = (unsigned long)head;
> > +     unsigned long vmemmap_end, vmemmap_reuse;
> > +
> > +     if (!free_vmemmap_pages_per_hpage(h))
> > +             return 0;
> > +
> > +     vmemmap_addr += RESERVE_VMEMMAP_SIZE;
> > +     vmemmap_end = vmemmap_addr + free_vmemmap_pages_size_per_hpage(h);
> > +     vmemmap_reuse = vmemmap_addr - PAGE_SIZE;
> > +
> > +     /*
> > +      * The pages which the vmemmap virtual address range [@vmemmap_addr,
> > +      * @vmemmap_end) are mapped to are freed to the buddy allocator, and
> > +      * the range is mapped to the page which @vmemmap_reuse is mapped to.
> > +      * When a HugeTLB page is freed to the buddy allocator, previously
> > +      * discarded vmemmap pages must be allocated and remapping.
> > +      */
> > +     ret = vmemmap_remap_alloc(vmemmap_addr, vmemmap_end, vmemmap_reuse,
> > +                               GFP_ATOMIC | __GFP_NOWARN | __GFP_THISNODE);
>
> I do not think that this is a good allocation mode. GFP_ATOMIC is a non
> sleeping allocation and a medium memory pressure might cause it to
> fail prematurely. I do not think this is really an atomic context which
> couldn't afford memory reclaim. I also do not think we want to grant

Because alloc_huge_page_vmemmap is called under hugetlb_lock
now. So using GFP_ATOMIC indeed makes the code more simpler.
From the document of the kernel, I learned that __GFP_NOMEMALLOC
can be used to explicitly forbid access to emergency reserves. So if
we do not want to use the reserve memory. How about replacing it to

GFP_ATOMIC | __GFP_NOMEMALLOC | __GFP_NOWARN | __GFP_THISNODE

Thanks.

> access to memory reserve is reasonable. Just think of a huge number of
> hugetlb pages being freed which can deplete the memory reserve for
> atomic allocations. I think that you want
>         GFP_KERNEL | __GFP_NORETRY | __GFP_NOWARN | __GFP_THISNODE
>
> for an initial implementation. The justification being that the
> allocation should at least try to reclaim but it shouldn't cause any
> major disruption because the failure is not fatal. If the failure rate
> would be impractically high then just drop NORETRY part. You can replace
> it by __GFP_RETRY_MAYFAIL but that shouldn't be strictly necessary
> because __GFP_THISNODE on its own implies on OOM killer, but that is
> kinda ugly to rely on.
> --
> Michal Hocko
> SUSE Labs
