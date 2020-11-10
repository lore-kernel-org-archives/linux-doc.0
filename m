Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.7 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07B3BC5517A
	for <linux-doc@archiver.kernel.org>; Tue, 10 Nov 2020 05:43:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C96B020781
	for <linux-doc@archiver.kernel.org>; Tue, 10 Nov 2020 05:43:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731886AbgKJFm4 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 10 Nov 2020 00:42:56 -0500
Received: from mx2.suse.de ([195.135.220.15]:41040 "EHLO mx2.suse.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729801AbgKJFm4 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 10 Nov 2020 00:42:56 -0500
X-Virus-Scanned: by amavisd-new at test-mx.suse.de
Received: from relay2.suse.de (unknown [195.135.221.27])
        by mx2.suse.de (Postfix) with ESMTP id B02C6ABDE;
        Tue, 10 Nov 2020 05:42:54 +0000 (UTC)
Date:   Tue, 10 Nov 2020 06:42:50 +0100
From:   Oscar Salvador <osalvador@suse.de>
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
        Michal Hocko <mhocko@suse.com>,
        Xiongchun duan <duanxiongchun@bytedance.com>,
        linux-doc@vger.kernel.org, LKML <linux-kernel@vger.kernel.org>,
        Linux Memory Management List <linux-mm@kvack.org>,
        linux-fsdevel <linux-fsdevel@vger.kernel.org>
Subject: Re: [External] Re: [PATCH v3 05/21] mm/hugetlb: Introduce pgtable
 allocation/freeing helpers
Message-ID: <20201110054250.GA2906@localhost.localdomain>
References: <CAMZfGtVm9buFPscDVn5F5nUE=Yq+y4NoL0ci74=hUyjaLAPQQg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMZfGtVm9buFPscDVn5F5nUE=Yq+y4NoL0ci74=hUyjaLAPQQg@mail.gmail.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Nov 10, 2020 at 11:49:27AM +0800, Muchun Song wrote:
> On Tue, Nov 10, 2020 at 1:21 AM Oscar Salvador <osalvador@suse.de> wrote:
> >
> > On Sun, Nov 08, 2020 at 10:10:57PM +0800, Muchun Song wrote:
> > > +static inline unsigned int pgtable_pages_to_prealloc_per_hpage(struct hstate *h)
> > > +{
> > > +     unsigned long vmemmap_size = vmemmap_pages_size_per_hpage(h);
> > > +
> > > +     /*
> > > +      * No need pre-allocate page tabels when there is no vmemmap pages
> > > +      * to free.
> >  s /tabels/tables/
> 
> Thanks.
> 
> >
> > > +static int vmemmap_pgtable_prealloc(struct hstate *h, struct page *page)
> > > +{
> > > +     int i;
> > > +     pgtable_t pgtable;
> > > +     unsigned int nr = pgtable_pages_to_prealloc_per_hpage(h);
> > > +
> > > +     if (!nr)
> > > +             return 0;
> > > +
> > > +     vmemmap_pgtable_init(page);
> > > +
> > > +     for (i = 0; i < nr; i++) {
> > > +             pte_t *pte_p;
> > > +
> > > +             pte_p = pte_alloc_one_kernel(&init_mm);
> > > +             if (!pte_p)
> > > +                     goto out;
> > > +             vmemmap_pgtable_deposit(page, virt_to_page(pte_p));
> > > +     }
> > > +
> > > +     return 0;
> > > +out:
> > > +     while (i-- && (pgtable = vmemmap_pgtable_withdraw(page)))
> > > +             pte_free_kernel(&init_mm, page_to_virt(pgtable));
> >
> >         would not be enough to:
> >
> >         while (pgtable = vmemmap_pgtable_withdrag(page))
> >                 pte_free_kernel(&init_mm, page_to_virt(pgtable));
> 
> The vmemmap_pgtable_withdraw can not return NULL. So we can not
> drop the "i--".

Yeah, you are right, I managed to confuse myself.
But why not make it return null, something like:

static pgtable_t vmemmap_pgtable_withdraw(struct page *page)
{
	pgtable_t pgtable;

	/* FIFO */
	pgtable = page_huge_pte(page);
	page_huge_pte(page) = list_first_entry_or_null(&pgtable->lru,
						       struct page, lru);
	if (page_huge_pte(page))
		list_del(&pgtable->lru);

	return page_huge_pte(page) ? pgtable : NULL;
}

What do you think?


-- 
Oscar Salvador
SUSE L3
