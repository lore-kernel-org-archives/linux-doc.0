Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-13.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A255BC433DB
	for <linux-doc@archiver.kernel.org>; Sat,  6 Feb 2021 08:03:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 688E264E51
	for <linux-doc@archiver.kernel.org>; Sat,  6 Feb 2021 08:03:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229548AbhBFIDS (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Sat, 6 Feb 2021 03:03:18 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:51566 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229492AbhBFIDQ (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Sat, 6 Feb 2021 03:03:16 -0500
Received: from mail-pf1-x42d.google.com (mail-pf1-x42d.google.com [IPv6:2607:f8b0:4864:20::42d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 744B4C06174A
        for <linux-doc@vger.kernel.org>; Sat,  6 Feb 2021 00:02:36 -0800 (PST)
Received: by mail-pf1-x42d.google.com with SMTP id o20so5934000pfu.0
        for <linux-doc@vger.kernel.org>; Sat, 06 Feb 2021 00:02:36 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance-com.20150623.gappssmtp.com; s=20150623;
        h=mime-version:references:in-reply-to:from:date:message-id:subject:to
         :cc;
        bh=+4ngpioykdaswjtQ50G9wJ1z4lzpWogRACPFYV04cNw=;
        b=LBNEqzXrKkilK+S+ibcAuad7DFuUukoIsNHlF4p6chdboba20kOYSIu5QwpWxQH2nx
         OEZ31k5B9EyIvppcoINkh65RGhM7KBuvGESxDNDPNcDy8qRL1GZSlNF3RNZxFN0AnqUf
         jzbSD2vCfbkyhYFr5nkOMwKC0n0demDWQv75PFSvstDHGmhOPtrCQS+pEBQgHzwMMIDD
         iEWt2VE5hj7kFYYsIZ8F/GmiFVudtGC6EsUVV6VXChW3/RROvXmn3nLPPl5uCcAFABgh
         Tpkct590AMCu9aD10Gqv5FCbNGgWxb8naqpM8gwbWdvZXQKbyJaYoWvFgocaCAfo0mQz
         HdTg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=+4ngpioykdaswjtQ50G9wJ1z4lzpWogRACPFYV04cNw=;
        b=LhF73iZARv+V0hiS28frQaJ395mxyjhL+9u2vacdgWJzGrFy5D0xvqOy2L/2J5ZYCy
         pwv6/OTyiLEctXj1F0sEkmz7JGd8q5g9OyEZvB0wKh1kAu6EvtT2nWFOAZ1vUIReWfKu
         4/tWqsz5wuD1SalLbyPqF63UXZWD0Pb5uobHThnlCpqG2IJnIC03IJ4nXvvwk/JdSlrn
         Kj7f2bv8CwuylpEGcuLLxrpOfXoyFxr1iX5YPsCXlO8AuuzD2ZDYt80BqjWBQOcf8Jh8
         ydl4GCQpfcm5lAXVpy6z2ghGNsmfRidWvl+JwL2P1BX2/USYk5le4lNYo5667kkDzhXu
         KB7A==
X-Gm-Message-State: AOAM533SvxdiRJ0hd3uSH9KdOOIA6s/2fAir7mSA26XJ5PBfYAN8cqmD
        gjXx7I2+0IEfGX48xFn91uG5gjVdqamUtWaTtEV2zQ==
X-Google-Smtp-Source: ABdhPJzVyVF5yNIljrr7V2pJ5nxH8aJhsD1UM3EyuHS7WsAUOEosBeeTy2sHnzGqAIU6QNuHnp8ZM3ux8Bx7YWuBCDE=
X-Received: by 2002:aa7:9790:0:b029:1d8:263e:cc9b with SMTP id
 o16-20020aa797900000b02901d8263ecc9bmr6239477pfp.2.1612598555875; Sat, 06 Feb
 2021 00:02:35 -0800 (PST)
MIME-Version: 1.0
References: <20210204035043.36609-1-songmuchun@bytedance.com>
 <20210204035043.36609-5-songmuchun@bytedance.com> <20210205115351.GA16428@linux>
In-Reply-To: <20210205115351.GA16428@linux>
From:   Muchun Song <songmuchun@bytedance.com>
Date:   Sat, 6 Feb 2021 16:01:58 +0800
Message-ID: <CAMZfGtXWBThxT26B9nD+zNVoU9BcK_G8uwqqTBCCwCeXG0AuxQ@mail.gmail.com>
Subject: Re: [External] Re: [PATCH v14 4/8] mm: hugetlb: alloc the vmemmap
 pages associated with each HugeTLB page
To:     Oscar Salvador <osalvador@suse.de>
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

On Fri, Feb 5, 2021 at 7:54 PM Oscar Salvador <osalvador@suse.de> wrote:
>
> On Thu, Feb 04, 2021 at 11:50:39AM +0800, Muchun Song wrote:
> > When we free a HugeTLB page to the buddy allocator, we should allocate the
> > vmemmap pages associated with it. But we may cannot allocate vmemmap pages
> > when the system is under memory pressure, in this case, we just refuse to
> > free the HugeTLB page instead of looping forever trying to allocate the
> > pages.
> >
> > Signed-off-by: Muchun Song <songmuchun@bytedance.com>
>
> [...]
>
> > diff --git a/mm/hugetlb.c b/mm/hugetlb.c
> > index 4cfca27c6d32..5518283aa667 100644
> > --- a/mm/hugetlb.c
> > +++ b/mm/hugetlb.c
> > @@ -1397,16 +1397,26 @@ static void __free_huge_page(struct page *page)
> >               h->resv_huge_pages++;
> >
> >       if (HPageTemporary(page)) {
> > -             list_del(&page->lru);
> >               ClearHPageTemporary(page);
> > +
> > +             if (alloc_huge_page_vmemmap(h, page, GFP_ATOMIC)) {
> > +                     h->surplus_huge_pages++;
> > +                     h->surplus_huge_pages_node[nid]++;
> > +                     goto enqueue;
> > +             }
> > +             list_del(&page->lru);
> >               update_and_free_page(h, page);
> >       } else if (h->surplus_huge_pages_node[nid]) {
> > +             if (alloc_huge_page_vmemmap(h, page, GFP_ATOMIC))
> > +                     goto enqueue;
> > +
> >               /* remove the page from active list */
> >               list_del(&page->lru);
> >               update_and_free_page(h, page);
> >               h->surplus_huge_pages--;
> >               h->surplus_huge_pages_node[nid]--;
> >       } else {
> > +enqueue:
> >               arch_clear_hugepage_flags(page);
> >               enqueue_huge_page(h, page);
>
> Ok, we just keep them in the pool in case we fail to allocate.
>
>
> > diff --git a/mm/hugetlb_vmemmap.c b/mm/hugetlb_vmemmap.c
> > index ddd872ab6180..0bd6b8d7282d 100644
> > --- a/mm/hugetlb_vmemmap.c
> > +++ b/mm/hugetlb_vmemmap.c
> > @@ -169,6 +169,8 @@
> >   * (last) level. So this type of HugeTLB page can be optimized only when its
> >   * size of the struct page structs is greater than 2 pages.
>
> [...]
>
> > +int alloc_huge_page_vmemmap(struct hstate *h, struct page *head, gfp_t gfp_mask)
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
> > +                               gfp_mask | __GFP_NOWARN | __GFP_THISNODE);
>
> Why don't you set all the GFP flags here?

Originally, I wanted to let the caller know the GFP flag which they
used. But setting all the GFP flags here also makes sense to me.
And we can remove the @gfp_mask parameter of the
alloc_huge_page_vmemmap. It is simple.

>
> vmemmap_remap_alloc(vmemmap_addr, vmemmap_end, vmemmap_reuse, GFP_ATOMIC|
>                     __GFP_NOWARN | __GFP_THISNODE) ?

I will use this.

>
> > diff --git a/mm/sparse-vmemmap.c b/mm/sparse-vmemmap.c
> > index 50c1dc00b686..277eb43aebd5 100644
> > --- a/mm/sparse-vmemmap.c
> > +++ b/mm/sparse-vmemmap.c
>
> [...]
>
> > +static int alloc_vmemmap_page_list(unsigned long start, unsigned long end,
> > +                                gfp_t gfp_mask, struct list_head *list)
>
> I think it would make more sense for this function to get the nid and the
> nr_pages to allocate directly.

Just like alloc_pages(), right? If so, make sense to me.

>
> > +{
> > +     unsigned long addr;
> > +     int nid = page_to_nid((const void *)start);
>
> Uh, that void is a bit ugly. page_to_nid(struct page *)start).
> Do not need the const either.

OK. Will do. Thanks.

>
> > +     struct page *page, *next;
> > +
> > +     for (addr = start; addr < end; addr += PAGE_SIZE) {
> > +             page = alloc_pages_node(nid, gfp_mask, 0);
> > +             if (!page)
> > +                     goto out;
> > +             list_add_tail(&page->lru, list);
> > +     }
>
> and replace this by while(--nr_pages) etc.

OK. Will do.

>
> I did not really go in depth, but looks good to me, and much more simply
> overall.

Yeah. The series only has 8 patches now. It is simpler.

>
> The only thing I am not sure about is the use of GFP_ATOMIC.
> It has been raised before than when we are close to OOM, the user might want
> to try to free up some memory by dissolving free_huge_pages, and so we might
> want to dip in the reserves.
>
> Given the fact that we are prepared to fail, and that we do not retry, I would
> rather use GFP_KERNEL than to have X pages atomically allocated and then realize
> we need to drop them on the ground because we cannot go further at some point.
> I think those reserves would be better off used by someone else in that
> situation.
>
> But this is just my thoughs, and given the fact that there seems to be a consensus
> of susing GFP_ATOMIC.
>
> --
> Oscar Salvador
> SUSE L3
