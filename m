Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 44BB9C4320E
	for <linux-doc@archiver.kernel.org>; Wed,  1 Sep 2021 09:44:52 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2B7FE60F3A
	for <linux-doc@archiver.kernel.org>; Wed,  1 Sep 2021 09:44:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S243714AbhIAJpr (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 1 Sep 2021 05:45:47 -0400
Received: from verein.lst.de ([213.95.11.211]:46991 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S242789AbhIAJpr (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 1 Sep 2021 05:45:47 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 3F54868AFE; Wed,  1 Sep 2021 11:44:47 +0200 (CEST)
Date:   Wed, 1 Sep 2021 11:44:46 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Joao Martins <joao.m.martins@oracle.com>
Cc:     Christoph Hellwig <hch@lst.de>, linux-mm@kvack.org,
        Dan Williams <dan.j.williams@intel.com>,
        Vishal Verma <vishal.l.verma@intel.com>,
        Dave Jiang <dave.jiang@intel.com>,
        Naoya Horiguchi <naoya.horiguchi@nec.com>,
        Matthew Wilcox <willy@infradead.org>,
        Jason Gunthorpe <jgg@ziepe.ca>,
        John Hubbard <jhubbard@nvidia.com>,
        Jane Chu <jane.chu@oracle.com>,
        Muchun Song <songmuchun@bytedance.com>,
        Mike Kravetz <mike.kravetz@oracle.com>,
        Andrew Morton <akpm@linux-foundation.org>,
        Jonathan Corbet <corbet@lwn.net>, nvdimm@lists.linux.dev,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 04/14] mm/memremap: add ZONE_DEVICE support for
 compound pages
Message-ID: <20210901094446.GA29632@lst.de>
References: <20210827145819.16471-1-joao.m.martins@oracle.com> <20210827145819.16471-5-joao.m.martins@oracle.com> <20210827153308.GA20687@lst.de> <9ee23c67-e600-555a-85fc-d527b1484bcc@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9ee23c67-e600-555a-85fc-d527b1484bcc@oracle.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Aug 27, 2021 at 05:00:11PM +0100, Joao Martins wrote:
> So felt like doing it inline straight away inline when calling percpu_ref_get_many():
> 	
> 	(pfn_end(pgmap, range_id) - pfn_first(pgmap, range_id)) / pgmap_geometry(pgmap);
> 
> I can switch to a shift if you prefer:
> 
> 	(pfn_end(pgmap, range_id) - pfn_first(pgmap, range_id))
> 		<< pgmap_geometry_order(pgmap);

Yes.  A shift is less overhead than a branch.

> > Also geometry sounds a bit strange, even if I can't really
> > offer anything better offhand.
> > 
> We started with @align (like in device dax core), and then we switched
> to @geometry because these are slightly different things (one relates
> to vmemmap metadata structure (number of pages) and the other is how
> the mmap is aligned to a page size. I couldn't suggest anything else,
> besides a more verbose name like vmemmap_align maybe.

It for sure isn't an alignment.  I think the term that comes closest
is a granularity.  But something like vmemmap_shift if switching to
a shift might be descriptive enough for the struct member name.
