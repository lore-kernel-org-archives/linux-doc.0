Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 900C1C432BE
	for <linux-doc@archiver.kernel.org>; Mon, 30 Aug 2021 13:07:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 69BA461002
	for <linux-doc@archiver.kernel.org>; Mon, 30 Aug 2021 13:07:45 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236314AbhH3NIi (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 30 Aug 2021 09:08:38 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234963AbhH3NIh (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 30 Aug 2021 09:08:37 -0400
Received: from mail-qv1-xf36.google.com (mail-qv1-xf36.google.com [IPv6:2607:f8b0:4864:20::f36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 02A92C061575
        for <linux-doc@vger.kernel.org>; Mon, 30 Aug 2021 06:07:44 -0700 (PDT)
Received: by mail-qv1-xf36.google.com with SMTP id s16so6354355qvt.13
        for <linux-doc@vger.kernel.org>; Mon, 30 Aug 2021 06:07:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=1qnygVIdbO5qF5LsQbT9hI/Ok2qT9hqw4DyjZOskK38=;
        b=FCbsWnp1YMdAAs88hVebCbV+bCns5Qdb54WRn1kBoOvfwzfzSYGllmcv2DaVXBUGrI
         biw7fjnU8dNz9qKs3ofhsuUdDhf4gGecWEpgv10rtdqNCC7NPCan0ag12uLILA3uv9Fl
         fX0YQZ2JcmSufsB1g80pckdiEbo8/wZnrbP8BbDziymWYLQ3fOUE4ZnjLs5NcZ+0d17K
         iSRlJ3Is1H/85BygstMwNJTywr4UlawNJPo9wpKRj3iVwFhu4dMYpCrVtmpDZ2psxdfb
         lwKdvNMD850i7auhmlR5sIu+zbhpuWIzHkUXgM1FUBWa7cs1mtmF+05dWg/lVzgo+IJe
         P3+A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=1qnygVIdbO5qF5LsQbT9hI/Ok2qT9hqw4DyjZOskK38=;
        b=BXcn4G8hD1KsVQxdQZrjXoR9NxrnUoZiMAEBPDPuR89latEhmmQfRxepkO9rTUkaSB
         7gGMiu2rA3C1D+pZox5sdth/BOx2Vtmcmzx4KjBR7f5n/Nc4N54b/PbQhKzXyMPVaMDs
         zfqE0OK2h9X2z3HJS7O3UQ+MZQUiuHAiSstU1cMBRXX5V4nxqUzMJm3kg+j9y5yT6w5i
         n2GpRkwSuaVq4Mt+OUzQSmksxKWQ1sddFZyNTSesRJ1dIceGrKVrs6KRnjIZkCLYBXHr
         L4xPU4j4w33+cJnORTSCGglafGA3lDUwbif1Mg/oToAwB3ffzwo/UZQ064OOePuc1aaa
         K+cg==
X-Gm-Message-State: AOAM531Jwq8Qm05/3hzCmK0FLwgFV/7xQI9CIJZzQbLk27lbkC5FIs2C
        hY/a7l0BqZKgxJ+tBpmvCvk3cw==
X-Google-Smtp-Source: ABdhPJyJOTt2clWfHDjZgw7CKauIEY9N24woeOtrgL67oYkMzCrstsgj0LDvTSCcn/YsRwfBoO1BSw==
X-Received: by 2002:a05:6214:250f:: with SMTP id gf15mr23180471qvb.2.1630328863099;
        Mon, 30 Aug 2021 06:07:43 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.113.129])
        by smtp.gmail.com with ESMTPSA id c4sm9235157qkf.122.2021.08.30.06.07.42
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Aug 2021 06:07:42 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1mKh0n-007CHr-Ea; Mon, 30 Aug 2021 10:07:41 -0300
Date:   Mon, 30 Aug 2021 10:07:41 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Joao Martins <joao.m.martins@oracle.com>
Cc:     linux-mm@kvack.org, Dan Williams <dan.j.williams@intel.com>,
        Vishal Verma <vishal.l.verma@intel.com>,
        Dave Jiang <dave.jiang@intel.com>,
        Naoya Horiguchi <naoya.horiguchi@nec.com>,
        Matthew Wilcox <willy@infradead.org>,
        John Hubbard <jhubbard@nvidia.com>,
        Jane Chu <jane.chu@oracle.com>,
        Muchun Song <songmuchun@bytedance.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>,
        Christoph Hellwig <hch@lst.de>, nvdimm@lists.linux.dev,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 08/14] mm/gup: grab head page refcount once for group
 of subpages
Message-ID: <20210830130741.GO1200268@ziepe.ca>
References: <20210827145819.16471-1-joao.m.martins@oracle.com>
 <20210827145819.16471-9-joao.m.martins@oracle.com>
 <20210827162552.GK1200268@ziepe.ca>
 <da90638d-d97f-bacb-f0fa-01f5fd9f2504@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <da90638d-d97f-bacb-f0fa-01f5fd9f2504@oracle.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Aug 27, 2021 at 07:34:54PM +0100, Joao Martins wrote:
> On 8/27/21 5:25 PM, Jason Gunthorpe wrote:
> > On Fri, Aug 27, 2021 at 03:58:13PM +0100, Joao Martins wrote:
> > 
> >>  #if defined(CONFIG_ARCH_HAS_PTE_DEVMAP) && defined(CONFIG_TRANSPARENT_HUGEPAGE)
> >>  static int __gup_device_huge(unsigned long pfn, unsigned long addr,
> >>  			     unsigned long end, unsigned int flags,
> >>  			     struct page **pages, int *nr)
> >>  {
> >> -	int nr_start = *nr;
> >> +	int refs, nr_start = *nr;
> >>  	struct dev_pagemap *pgmap = NULL;
> >>  	int ret = 1;
> >>  
> >>  	do {
> >> -		struct page *page = pfn_to_page(pfn);
> >> +		struct page *head, *page = pfn_to_page(pfn);
> >> +		unsigned long next = addr + PAGE_SIZE;
> >>  
> >>  		pgmap = get_dev_pagemap(pfn, pgmap);
> >>  		if (unlikely(!pgmap)) {
> >> @@ -2252,16 +2265,25 @@ static int __gup_device_huge(unsigned long pfn, unsigned long addr,
> >>  			ret = 0;
> >>  			break;
> >>  		}
> >> -		SetPageReferenced(page);
> >> -		pages[*nr] = page;
> >> -		if (unlikely(!try_grab_page(page, flags))) {
> >> -			undo_dev_pagemap(nr, nr_start, flags, pages);
> >> +
> >> +		head = compound_head(page);
> >> +		/* @end is assumed to be limited at most one compound page */
> >> +		if (PageHead(head))
> >> +			next = end;
> >> +		refs = record_subpages(page, addr, next, pages + *nr);
> >> +
> >> +		SetPageReferenced(head);
> >> +		if (unlikely(!try_grab_compound_head(head, refs, flags))) {
> >> +			if (PageHead(head))
> >> +				ClearPageReferenced(head);
> >> +			else
> >> +				undo_dev_pagemap(nr, nr_start, flags, pages);
> >>  			ret = 0;
> >>  			break;
> > 
> > Why is this special cased for devmap?
> > 
> > Shouldn't everything processing pud/pmds/etc use the same basic loop
> > that is similar in idea to the 'for_each_compound_head' scheme in
> > unpin_user_pages_dirty_lock()?
> > 
> > Doesn't that work for all the special page type cases here?
> 
> We are iterating over PFNs to create an array of base pages (regardless of page table
> type), rather than iterating over an array of pages to work on. 

That is part of it, yes, but the slow bit here is to minimally find
the head pages and do the atomics on them, much like the
unpin_user_pages_dirty_lock()

I would think this should be designed similar to how things work on
the unpin side.

Sweep the page tables to find a proper start/end - eg even if a
compound is spread across multiple pte/pmd/pud/etc we should find a
linear range of starting PFN (ie starting page*) and npages across as
much of the page tables as we can manage. This is the same as where
things end up in the unpin case where all the contiguous PFNs are
grouped togeher into a range.

Then 'assign' that range to the output array which requires walking
over each compount_head in the range and pinning it, then writing out
the tail pages to the output struct page array.

And this approach should apply universally no matter what is under the
pte's - ie huge pages, THPs and devmaps should all be treated the same
way. Currently each case is different, like above which is unique to
device_huge.

The more we can process groups of pages in bulks the faster the whole
thing will be.

Jason





Given that all these gup
> functions already give you the boundary (end of pmd or end of pud, etc) then we just need
> to grab the ref to pgmap and head page and save the tails. But sadly we need to handle the
> base page case which is why there's this outer loop exists sadly. If it was just head
> pages we wouldn't need the outer loop (and hence no for_each_compound_head, like the
> hugetlb variant).
> 
> But maybe I am being dense and you just mean to replace the outer loop with
> for_each_compound_range(). I am a little stuck on the part that I anyways need to record
> back the tail pages when iterating over the (single) head page. So I feel that it wouldn't
> bring that much improvement, unless I missed your point.
> 
> 	Joao
> 
