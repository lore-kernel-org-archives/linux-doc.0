Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 57834C433E0
	for <linux-doc@archiver.kernel.org>; Mon, 15 Feb 2021 12:26:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 278BD64DAF
	for <linux-doc@archiver.kernel.org>; Mon, 15 Feb 2021 12:26:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229977AbhBOMZs (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 15 Feb 2021 07:25:48 -0500
Received: from mx2.suse.de ([195.135.220.15]:57094 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230255AbhBOMZe (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 15 Feb 2021 07:25:34 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.com; s=susede1;
        t=1613391886; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
         mime-version:mime-version:content-type:content-type:
         in-reply-to:in-reply-to:references:references;
        bh=clNVAPUhMB6rr4TBZ1GcOTiKp+wPJNTpI9l+37a26XA=;
        b=dp0V06WWkqe+uRmlRdGyLDWQqXtP25DEndHfYdVJ2FhTZuSE6X2UmRn0rNX1CHZgX76/Ze
        Daq8252M97ty2PmdemtbniFK7GVBOHJo2qki6iDlMEnHSGKIOLqy/pzsUOC2d9khg6yRqt
        xvqicVpi2h3jtm7hdubVWtDU36hRhzs=
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id E9374AD29;
        Mon, 15 Feb 2021 12:24:45 +0000 (UTC)
Date:   Mon, 15 Feb 2021 13:24:45 +0100
From:   Michal Hocko <mhocko@suse.com>
To:     Muchun Song <songmuchun@bytedance.com>
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
        HORIGUCHI =?utf-8?B?TkFPWUEo5aCA5Y+jIOebtOS5nyk=?= 
        <naoya.horiguchi@nec.com>,
        Joao Martins <joao.m.martins@oracle.com>,
        Xiongchun duan <duanxiongchun@bytedance.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>
Subject: Re: [External] Re: [PATCH v15 4/8] mm: hugetlb: alloc the vmemmap
 pages associated with each HugeTLB page
Message-ID: <YCpoDQGHpaGotfV3@dhcp22.suse.cz>
References: <20210208085013.89436-1-songmuchun@bytedance.com>
 <20210208085013.89436-5-songmuchun@bytedance.com>
 <YCafit5ruRJ+SL8I@dhcp22.suse.cz>
 <CAMZfGtXgVUvCejpxu1o5WDvmQ7S88rWqGi3DAGM6j5NHJgtdcg@mail.gmail.com>
 <YCpN38i75olgispI@dhcp22.suse.cz>
 <CAMZfGtUXJTaMo36aB4nTFuYFy3qfWW69o=4uUo-FjocO8obDgw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMZfGtUXJTaMo36aB4nTFuYFy3qfWW69o=4uUo-FjocO8obDgw@mail.gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon 15-02-21 19:51:26, Muchun Song wrote:
> On Mon, Feb 15, 2021 at 6:33 PM Michal Hocko <mhocko@suse.com> wrote:
> >
> > On Mon 15-02-21 18:05:06, Muchun Song wrote:
> > > On Fri, Feb 12, 2021 at 11:32 PM Michal Hocko <mhocko@suse.com> wrote:
> > [...]
> > > > > +int alloc_huge_page_vmemmap(struct hstate *h, struct page *head)
> > > > > +{
> > > > > +     int ret;
> > > > > +     unsigned long vmemmap_addr = (unsigned long)head;
> > > > > +     unsigned long vmemmap_end, vmemmap_reuse;
> > > > > +
> > > > > +     if (!free_vmemmap_pages_per_hpage(h))
> > > > > +             return 0;
> > > > > +
> > > > > +     vmemmap_addr += RESERVE_VMEMMAP_SIZE;
> > > > > +     vmemmap_end = vmemmap_addr + free_vmemmap_pages_size_per_hpage(h);
> > > > > +     vmemmap_reuse = vmemmap_addr - PAGE_SIZE;
> > > > > +
> > > > > +     /*
> > > > > +      * The pages which the vmemmap virtual address range [@vmemmap_addr,
> > > > > +      * @vmemmap_end) are mapped to are freed to the buddy allocator, and
> > > > > +      * the range is mapped to the page which @vmemmap_reuse is mapped to.
> > > > > +      * When a HugeTLB page is freed to the buddy allocator, previously
> > > > > +      * discarded vmemmap pages must be allocated and remapping.
> > > > > +      */
> > > > > +     ret = vmemmap_remap_alloc(vmemmap_addr, vmemmap_end, vmemmap_reuse,
> > > > > +                               GFP_ATOMIC | __GFP_NOWARN | __GFP_THISNODE);
> > > >
> > > > I do not think that this is a good allocation mode. GFP_ATOMIC is a non
> > > > sleeping allocation and a medium memory pressure might cause it to
> > > > fail prematurely. I do not think this is really an atomic context which
> > > > couldn't afford memory reclaim. I also do not think we want to grant
> > >
> > > Because alloc_huge_page_vmemmap is called under hugetlb_lock
> > > now. So using GFP_ATOMIC indeed makes the code more simpler.
> >
> > You can have a preallocated list of pages prior taking the lock.
> 
> A discussion about this can refer to here:
> 
> https://patchwork.kernel.org/project/linux-mm/patch/20210117151053.24600-5-songmuchun@bytedance.com/

I do not see any real response to the pre-allocation argument except
that put_page can be called from an atomic context. Which might be true
in general but it is not the case for hugetlb pages. hugetlb_lock would
have to be irq safe otherwise. Also the whole operation can be scheduled
to a kworker context for a stronger allocation context.

-- 
Michal Hocko
SUSE Labs
