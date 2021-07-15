Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7531AC07E96
	for <linux-doc@archiver.kernel.org>; Thu, 15 Jul 2021 13:00:36 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 563BE613BF
	for <linux-doc@archiver.kernel.org>; Thu, 15 Jul 2021 13:00:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232161AbhGOND2 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 15 Jul 2021 09:03:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60852 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229679AbhGOND2 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 15 Jul 2021 09:03:28 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 865E3C06175F
        for <linux-doc@vger.kernel.org>; Thu, 15 Jul 2021 06:00:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=zEE2nfRfHuUPirbJkDMcOoVwEDE+zjPwjDDORrIirKk=; b=BL8T/G9GnAZDrpcJeud1pe4uRj
        ATOguswZSWPE75WODgr2IDqJni49D1lvCTSeg9hW/z0Xj6gzwQAgLvXAAYjvMpygC3FxToq3Q+WHA
        GMrzHIZAWzIo9qdQg8jOCST9EbAsV2K1p4GAzxuEaV7w9LrRHHFZ8XmykgTmNtOFKWm7fXo6svmKT
        M0PgRf7DueoCNHiY8CwwBvOpRKNxYhaNHbwIVoVIZ/jA1Hbl59Cu9jLN4pp2YrceTUydr8TBDrCZ7
        kvBOxWKwbqslJy9MBupzFMOB1N0abOaT880jjZ9KGlnj7uRq0SyOeq5TsCq4X2rzqaKE1iW7qIlR0
        lTHqb1BQ==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1m40xF-003MIx-3g; Thu, 15 Jul 2021 12:59:13 +0000
Date:   Thu, 15 Jul 2021 13:59:05 +0100
From:   Christoph Hellwig <hch@infradead.org>
To:     Dan Williams <dan.j.williams@intel.com>
Cc:     Joao Martins <joao.m.martins@oracle.com>,
        Linux MM <linux-mm@kvack.org>,
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
        Jonathan Corbet <corbet@lwn.net>,
        Linux NVDIMM <nvdimm@lists.linux.dev>,
        Linux Doc Mailing List <linux-doc@vger.kernel.org>
Subject: Re: [PATCH v3 04/14] mm/memremap: add ZONE_DEVICE support for
 compound pages
Message-ID: <YPAxGcVa9QkSd7E7@infradead.org>
References: <20210714193542.21857-1-joao.m.martins@oracle.com>
 <20210714193542.21857-5-joao.m.martins@oracle.com>
 <CAPcyv4jwd_dzTH1H+cbiKqfK5=Xaa9JY=EVKHhPbjicVZA-URQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAPcyv4jwd_dzTH1H+cbiKqfK5=Xaa9JY=EVKHhPbjicVZA-URQ@mail.gmail.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Wed, Jul 14, 2021 at 06:08:14PM -0700, Dan Williams wrote:
> > +static inline unsigned long pgmap_geometry(struct dev_pagemap *pgmap)
> > +{
> > +       if (!pgmap || !pgmap->geometry)
> > +               return PAGE_SIZE;
> > +       return pgmap->geometry;
> > +}
> > +
> > +static inline unsigned long pgmap_pfn_geometry(struct dev_pagemap *pgmap)
> > +{
> > +       return PHYS_PFN(pgmap_geometry(pgmap));
> > +}
> 
> Are both needed? Maybe just have ->geometry natively be in nr_pages
> units directly, because pgmap_pfn_geometry() makes it confusing
> whether it's a geometry of the pfn or the geometry of the pgmap.

Actually - do we need non-power of two sizes here?  Otherwise a shift
for the pfns would be really nice as that simplifies a lot of the
calculations.
