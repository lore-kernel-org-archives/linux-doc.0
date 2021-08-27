Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 91EA4C432BE
	for <linux-doc@archiver.kernel.org>; Fri, 27 Aug 2021 15:33:13 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5DF6760F35
	for <linux-doc@archiver.kernel.org>; Fri, 27 Aug 2021 15:33:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S245401AbhH0PeB (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 27 Aug 2021 11:34:01 -0400
Received: from verein.lst.de ([213.95.11.211]:34332 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234044AbhH0PeB (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 27 Aug 2021 11:34:01 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 3934B67373; Fri, 27 Aug 2021 17:33:09 +0200 (CEST)
Date:   Fri, 27 Aug 2021 17:33:09 +0200
From:   Christoph Hellwig <hch@lst.de>
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
        Jonathan Corbet <corbet@lwn.net>,
        Christoph Hellwig <hch@lst.de>, nvdimm@lists.linux.dev,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH v4 04/14] mm/memremap: add ZONE_DEVICE support for
 compound pages
Message-ID: <20210827153308.GA20687@lst.de>
References: <20210827145819.16471-1-joao.m.martins@oracle.com> <20210827145819.16471-5-joao.m.martins@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210827145819.16471-5-joao.m.martins@oracle.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Aug 27, 2021 at 03:58:09PM +0100, Joao Martins wrote:
> + * @geometry: structural definition of how the vmemmap metadata is populated.
> + *	A zero or 1 defaults to using base pages as the memmap metadata
> + *	representation. A bigger value will set up compound struct pages
> + *	representative of the requested geometry size.
>   * @ops: method table
>   * @owner: an opaque pointer identifying the entity that manages this
>   *	instance.  Used by various helpers to make sure that no
> @@ -114,6 +118,7 @@ struct dev_pagemap {
>  	struct completion done;
>  	enum memory_type type;
>  	unsigned int flags;
> +	unsigned long geometry;

So why not make this a shift as I suggested somewhere deep in the
last thread?  Also geometry sounds a bit strange, even if I can't really
offer anything better offhand.

> +static inline unsigned long pgmap_geometry(struct dev_pagemap *pgmap)
> +{
> +	if (pgmap && pgmap->geometry)
> +		return pgmap->geometry;

Why does this need to support a NULL pgmap?

> +static void __ref memmap_init_compound(struct page *head, unsigned long head_pfn,

Overly long line.
