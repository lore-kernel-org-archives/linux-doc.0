Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B97AAC07E96
	for <linux-doc@archiver.kernel.org>; Thu, 15 Jul 2021 06:52:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9492061370
	for <linux-doc@archiver.kernel.org>; Thu, 15 Jul 2021 06:52:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231298AbhGOGy7 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 15 Jul 2021 02:54:59 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:32900 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230016AbhGOGy7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 15 Jul 2021 02:54:59 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 69C55C06175F
        for <linux-doc@vger.kernel.org>; Wed, 14 Jul 2021 23:52:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=RytKYXm4KX75fZPuEx0/hV8/+9xmwDuSUAB8ht171wA=; b=mltIaCBwgrX66P0slkl+2j+B2M
        rQrOgnmLTMAs3lfTc48w2haDkZU6ODizMF0ERmJ3rMuFv0dicbWjMOJPX/JnCvz3KxRNLIeWd4lYJ
        p2k/zVvo9eyxktFhj7M7A+IB3rD/y6eYaoUCVplS4x2lsGcYtleIjrvsbUqF19Fz1rhUZ3iIo898m
        5pR0/tPZYKxv5WrYNtBOK0Y6HmGquYQ1rZo54fWqsFBUDvSURWyJSIyVljogEZAMWU3B7HrqWo/K0
        3P8MEpaaYnzPWhWoYO30Y7EfyoH0uLrNLrkKkqDc4oN7qnSoCsLQEcvD8yh41zwsc53k67cIJXoRK
        PEvqzC1A==;
Received: from hch by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1m3vAy-0034Lh-O9; Thu, 15 Jul 2021 06:49:15 +0000
Date:   Thu, 15 Jul 2021 07:48:52 +0100
From:   Christoph Hellwig <hch@infradead.org>
To:     Joao Martins <joao.m.martins@oracle.com>
Cc:     linux-mm@kvack.org, Dan Williams <dan.j.williams@intel.com>,
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
Subject: Re: [PATCH v3 04/14] mm/memremap: add ZONE_DEVICE support for
 compound pages
Message-ID: <YO/aVLL2WlWkKXia@infradead.org>
References: <20210714193542.21857-1-joao.m.martins@oracle.com>
 <20210714193542.21857-5-joao.m.martins@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210714193542.21857-5-joao.m.martins@oracle.com>
X-SRS-Rewrite: SMTP reverse-path rewritten from <hch@infradead.org> by casper.infradead.org. See http://www.infradead.org/rpr.html
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> +static inline unsigned long pgmap_geometry(struct dev_pagemap *pgmap)
> +{
> +	if (!pgmap || !pgmap->geometry)
> +		return PAGE_SIZE;
> +	return pgmap->geometry;

Nit, but avoiding all the negations would make this a little easier to
read:

	if (pgmap && pgmap->geometry)
		return pgmap->geometry;
	return PAGE_SIZE

> +	if (pgmap_geometry(pgmap) > PAGE_SIZE)
> +		percpu_ref_get_many(pgmap->ref, (pfn_end(pgmap, range_id)
> +			- pfn_first(pgmap, range_id)) / pgmap_pfn_geometry(pgmap));
> +	else
> +		percpu_ref_get_many(pgmap->ref, pfn_end(pgmap, range_id)
> +				- pfn_first(pgmap, range_id));

This is a horrible undreadable mess, which is trivially fixed by a
strategically used local variable:

	refs = pfn_end(pgmap, range_id) - pfn_first(pgmap, range_id);
	if (pgmap_geometry(pgmap) > PAGE_SIZE)
		refs /= pgmap_pfn_geometry(pgmap);
	percpu_ref_get_many(pgmap->ref, refs);

