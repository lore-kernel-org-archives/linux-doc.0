Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2F094C433DB
	for <linux-doc@archiver.kernel.org>; Mon, 15 Feb 2021 12:46:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E4E7464DEC
	for <linux-doc@archiver.kernel.org>; Mon, 15 Feb 2021 12:46:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230145AbhBOMqW (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 15 Feb 2021 07:46:22 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230379AbhBOMqO (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 15 Feb 2021 07:46:14 -0500
Received: from mail-pg1-x531.google.com (mail-pg1-x531.google.com [IPv6:2607:f8b0:4864:20::531])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 94E66C061756
        for <linux-doc@vger.kernel.org>; Mon, 15 Feb 2021 04:45:33 -0800 (PST)
Received: by mail-pg1-x531.google.com with SMTP id o21so4126344pgn.12
        for <linux-doc@vger.kernel.org>; Mon, 15 Feb 2021 04:45:33 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=B/Q6VwPDe6I6EirNcsyicnPy138BEVcOe0YKhiLSwKI=;
        b=bFnBs52Ad4AzO3WrtmP1t4dKywjpPzK+A482Eht6ojz0TpmO7rLiExFrSiXmi1S2/N
         JVPugG3EVQe37M9ZZbqQbe3vnUWlJ02gF52OhqtjzccwxgbMqN7glFsab53y34iAsFbL
         4kjXYxYj4ufcMKtowhp4K7R5ARxG1wIl53SN1GNMvPvMAMKzWhz6Z+F9q9iOjCnhqXEO
         hfWRa/ZSRjqL+PRzodxE8JEJzZg0064aea6im6iFOGyV3tcqTSjWLMisoHnAe4KdD2lI
         4nfmAWUZN/9VffDyOGlST7TAebdEl3HRz5sKQJHvXGJxwQT0NXRV4c1fT6gYDqLv/YA2
         QAHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=B/Q6VwPDe6I6EirNcsyicnPy138BEVcOe0YKhiLSwKI=;
        b=K8l3c5gZgXrcR87+QiSOhb8lASXtMSx0Krf1vJ2nG7o3ZDMcuewCvWaRyNb9UU/psf
         itfQGZVHTfiZ+mi7R5UfbqiEgY/iVp2gjVcLZE7i4tvicnmpDT7nqQRKQv+ZUwS130M4
         zoBbQkGi45U8bQKHr8BpVskxIQTYNQtW5BPeBaWttBDdj+CbI+9F6DmwTEVyxG13FrwI
         FPpLBNsh63Xajwb6JOX5EioLrWwCUnyPOEdqlQTOlaOiqt/SYSVYXhUEgj1v5BvpzNAA
         wnWcCBNVdgUXu53HAvoDj+A/pcrEpiC7HrP0RdeAN7IsU1A2NSFZMUvsHb9xHihnv5Gs
         Avtw==
X-Gm-Message-State: AOAM531R7m45GXjECcVhGkqC5knjbpWiExSgwQWQyHNBwI9UNBIW9IWD
        YnMY0WkTduDLOp1qoRKmnaz7gGvCGzVATprGG3bATA==
X-Google-Smtp-Source: ABdhPJyq6XwxGiX9i2zyXPYTiHNrGd98hXjL3RiX/v0CDPtNUnDm8UIfyWi8yX3TRZ6m+4rmLlNJOKb3zXYFAt+3B1c=
X-Received: by 2002:a63:de0e:: with SMTP id f14mr14400347pgg.273.1613393133150;
 Mon, 15 Feb 2021 04:45:33 -0800 (PST)
MIME-Version: 1.0
References: <20210208085013.89436-1-songmuchun@bytedance.com>
 <20210208085013.89436-5-songmuchun@bytedance.com> <YCafit5ruRJ+SL8I@dhcp22.suse.cz>
 <CAMZfGtXgVUvCejpxu1o5WDvmQ7S88rWqGi3DAGM6j5NHJgtdcg@mail.gmail.com>
 <YCpN38i75olgispI@dhcp22.suse.cz> <CAMZfGtUXJTaMo36aB4nTFuYFy3qfWW69o=4uUo-FjocO8obDgw@mail.gmail.com>
 <CAMZfGtWT8CJ-QpVofB2X-+R7GE7sMa40eiAJm6PyD0ji=FzBYQ@mail.gmail.com> <YCpmlGuoTakPJs1u@dhcp22.suse.cz>
In-Reply-To: <YCpmlGuoTakPJs1u@dhcp22.suse.cz>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Mon, 15 Feb 2021 20:44:57 +0800
Message-ID: <CAMZfGtWd_ZaXtiEdMKhpnAHDw5CTm-CSPSXW+GfKhyX5qQK=Og@mail.gmail.com>
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

On Mon, Feb 15, 2021 at 8:18 PM Michal Hocko <mhocko@suse.com> wrote:
>
> On Mon 15-02-21 20:00:07, Muchun Song wrote:
> > On Mon, Feb 15, 2021 at 7:51 PM Muchun Song <songmuchun@bytedance.com> wrote:
> > >
> > > On Mon, Feb 15, 2021 at 6:33 PM Michal Hocko <mhocko@suse.com> wrote:
> > > >
> > > > On Mon 15-02-21 18:05:06, Muchun Song wrote:
> > > > > On Fri, Feb 12, 2021 at 11:32 PM Michal Hocko <mhocko@suse.com> wrote:
> > > > [...]
> > > > > > > +int alloc_huge_page_vmemmap(struct hstate *h, struct page *head)
> > > > > > > +{
> > > > > > > +     int ret;
> > > > > > > +     unsigned long vmemmap_addr = (unsigned long)head;
> > > > > > > +     unsigned long vmemmap_end, vmemmap_reuse;
> > > > > > > +
> > > > > > > +     if (!free_vmemmap_pages_per_hpage(h))
> > > > > > > +             return 0;
> > > > > > > +
> > > > > > > +     vmemmap_addr += RESERVE_VMEMMAP_SIZE;
> > > > > > > +     vmemmap_end = vmemmap_addr + free_vmemmap_pages_size_per_hpage(h);
> > > > > > > +     vmemmap_reuse = vmemmap_addr - PAGE_SIZE;
> > > > > > > +
> > > > > > > +     /*
> > > > > > > +      * The pages which the vmemmap virtual address range [@vmemmap_addr,
> > > > > > > +      * @vmemmap_end) are mapped to are freed to the buddy allocator, and
> > > > > > > +      * the range is mapped to the page which @vmemmap_reuse is mapped to.
> > > > > > > +      * When a HugeTLB page is freed to the buddy allocator, previously
> > > > > > > +      * discarded vmemmap pages must be allocated and remapping.
> > > > > > > +      */
> > > > > > > +     ret = vmemmap_remap_alloc(vmemmap_addr, vmemmap_end, vmemmap_reuse,
> > > > > > > +                               GFP_ATOMIC | __GFP_NOWARN | __GFP_THISNODE);
> > > > > >
> > > > > > I do not think that this is a good allocation mode. GFP_ATOMIC is a non
> > > > > > sleeping allocation and a medium memory pressure might cause it to
> > > > > > fail prematurely. I do not think this is really an atomic context which
> > > > > > couldn't afford memory reclaim. I also do not think we want to grant
> > > > >
> > > > > Because alloc_huge_page_vmemmap is called under hugetlb_lock
> > > > > now. So using GFP_ATOMIC indeed makes the code more simpler.
> > > >
> > > > You can have a preallocated list of pages prior taking the lock.
> > >
> > > A discussion about this can refer to here:
> > >
> > > https://patchwork.kernel.org/project/linux-mm/patch/20210117151053.24600-5-songmuchun@bytedance.com/
> > >
> > > > Moreover do we want to manipulate vmemmaps from under spinlock in
> > > > general. I have to say I have missed that detail when reviewing. Need to
> > > > think more.
> > > >
> > > > > From the document of the kernel, I learned that __GFP_NOMEMALLOC
> > > > > can be used to explicitly forbid access to emergency reserves. So if
> > > > > we do not want to use the reserve memory. How about replacing it to
> > > > >
> > > > > GFP_ATOMIC | __GFP_NOMEMALLOC | __GFP_NOWARN | __GFP_THISNODE
> > > >
> > > > The whole point of GFP_ATOMIC is to grant access to memory reserves so
> > > > the above is quite dubious. If you do not want access to memory reserves
> > >
> > > Look at the code of gfp_to_alloc_flags().
> > >
> > > static inline unsigned int gfp_to_alloc_flags(gfp_t gfp_mask)
> > > {
> > >         [...]
> > >         if (gfp_mask & __GFP_ATOMIC) {
> > >         /*
> > >          * Not worth trying to allocate harder for __GFP_NOMEMALLOC even
> > >          * if it can't schedule.
> > >          */
> > >         if (!(gfp_mask & __GFP_NOMEMALLOC))
> > >                 alloc_flags |= ALLOC_HARDER;
> > >        [...]
> > > }
> > >
> > > Seems to allow this operation (GFP_ATOMIC | __GFP_NOMEMALLOC).
>
> Please read my response again more carefully. I am not claiming that
> combination is not allowed. I have said it doesn't make any sense in
> this context.

I see you are worried that using GFP_ATOMIC will use reverse memory
unlimited. So I think that __GFP_NOMEMALLOC may be suitable for us.
Sorry, I may not understand the point you said. What I missed?

>
> --
> Michal Hocko
> SUSE Labs
