Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D0D1C433F5
	for <linux-doc@archiver.kernel.org>; Wed, 17 Nov 2021 09:37:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 425826321A
	for <linux-doc@archiver.kernel.org>; Wed, 17 Nov 2021 09:37:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235301AbhKQJkf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 17 Nov 2021 04:40:35 -0500
Received: from verein.lst.de ([213.95.11.211]:49653 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S235298AbhKQJkd (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 17 Nov 2021 04:40:33 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id 68C3268B05; Wed, 17 Nov 2021 10:37:33 +0100 (CET)
Date:   Wed, 17 Nov 2021 10:37:33 +0100
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
Subject: Re: [PATCH v5 7/8] device-dax: ensure dev_dax->pgmap is valid for
 dynamic devices
Message-ID: <20211117093733.GB8429@lst.de>
References: <20211112150824.11028-1-joao.m.martins@oracle.com> <20211112150824.11028-8-joao.m.martins@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211112150824.11028-8-joao.m.martins@oracle.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> +bool static_dev_dax(struct dev_dax *dev_dax)
> +{
> +	return is_static(dev_dax->region);
> +}
> +EXPORT_SYMBOL_GPL(static_dev_dax);

This function would massively benefit from documentic what a static
DAX region is and why someone would want to care.  Because even as
someone occasionally dabbling with the DAX code I have no idea at all
what that means.
