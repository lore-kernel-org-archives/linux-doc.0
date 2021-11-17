Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E552FC433FE
	for <linux-doc@archiver.kernel.org>; Wed, 17 Nov 2021 09:37:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id C6579619E5
	for <linux-doc@archiver.kernel.org>; Wed, 17 Nov 2021 09:37:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235296AbhKQJkY (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 17 Nov 2021 04:40:24 -0500
Received: from verein.lst.de ([213.95.11.211]:49641 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234868AbhKQJkY (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 17 Nov 2021 04:40:24 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id 6E65068AFE; Wed, 17 Nov 2021 10:37:22 +0100 (CET)
Date:   Wed, 17 Nov 2021 10:37:22 +0100
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
Subject: Re: [PATCH v5 6/8] device-dax: use struct_size()
Message-ID: <20211117093722.GA8429@lst.de>
References: <20211112150824.11028-1-joao.m.martins@oracle.com> <20211112150824.11028-7-joao.m.martins@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211112150824.11028-7-joao.m.martins@oracle.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> +		pgmap = devm_kzalloc(
> +                       dev, struct_size(pgmap, ranges, dev_dax->nr_range - 1),
> +                       GFP_KERNEL);

Keeping the dev argument on the previous line would not only make this
much more readable but also avoid the overly long line.
