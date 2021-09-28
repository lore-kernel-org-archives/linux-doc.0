Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6FC1AC433F5
	for <linux-doc@archiver.kernel.org>; Tue, 28 Sep 2021 18:01:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 56CE761355
	for <linux-doc@archiver.kernel.org>; Tue, 28 Sep 2021 18:01:54 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242127AbhI1SDd (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 28 Sep 2021 14:03:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45616 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242119AbhI1SDc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 28 Sep 2021 14:03:32 -0400
Received: from mail-qk1-x732.google.com (mail-qk1-x732.google.com [IPv6:2607:f8b0:4864:20::732])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 06A9BC06161C
        for <linux-doc@vger.kernel.org>; Tue, 28 Sep 2021 11:01:53 -0700 (PDT)
Received: by mail-qk1-x732.google.com with SMTP id q125so26925478qkd.12
        for <linux-doc@vger.kernel.org>; Tue, 28 Sep 2021 11:01:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=ziepe.ca; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Hbv2nrTZWWGTP0zetuxX8JZfSvkOTIqxNDWscf8lqjM=;
        b=k4yeqVkRBZLOz8RVqZfB/X5go9d5P08x7DAbdDnxauKP3w8Ly9MWhcIHzduBQOXIv6
         5T5FpLdhoYxRIYJWBMLnAJ7jOYyO3vy177E9aPa3GqGMao6G1SAoEYk2fyt1p3IWPBuw
         K1Anqfuu7NYgolRTn0AfvVNGspfbs0NRJ1sKcbA2uCFLvg5fZxKmQPdfUDYS23yyyQLB
         aLowg6jW72cG3PRtSZ6WOi2yuNJGa4STjmwpcX5B0gvtmcRhLASp6KxUB1QEMamXP1nY
         oA4t3c6XPhHyNRDddoMK+c2IK+nwFlv8bVPLD9Q944WafOhKBZ3mKMpllZ11Y9sQe7tM
         HxuA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Hbv2nrTZWWGTP0zetuxX8JZfSvkOTIqxNDWscf8lqjM=;
        b=5F6zgfSORRxTI2rSXyU+qzVYaZ9djb8T0SvTxcjWp6J0i9J745/syl1dIvvrCCqMGW
         NrUPHFvXngHCyyr3Ubj4Z2Wg1bB3h5C6De6ZUsuxsZDY98NfdqkGMMt14rqgkJa7hTAQ
         jBTtX0l9wqGmIxDG+8ThOGPhyKSeDGuNwNJnZrkqFtZ4t0XJ2tvGZh9CzfqmcUR9lVzX
         iNLAZOmgl/dBcOa5eb3kHi+Hs/er/WkpCOd1yfh/+ZEpOVolpm3I6bxl8IF/TEC/DXqI
         7yoqIwj4HeXKpfqfkMCsbcvv4qJ1oVt5AalGocPses9LIec6t/mjUlOKtmGsFHTRyjLL
         Sa3g==
X-Gm-Message-State: AOAM530X1iIX4VOvFT65DvCCHcTUKdvV3Dnh/1d99KfLuMIvcjTDtUCc
        LY4lgodwsSsu8//i9rBg99duAydF+VHAbg==
X-Google-Smtp-Source: ABdhPJw8PoqtCM9jEu0HEkGUTPOuB+K045ZQ+xnwIr++i1ps2Ma+Gi571Hezhn6PyiIq87siDpO+yw==
X-Received: by 2002:ae9:eb8b:: with SMTP id b133mr1406067qkg.188.1632852112225;
        Tue, 28 Sep 2021 11:01:52 -0700 (PDT)
Received: from ziepe.ca (hlfxns017vw-142-162-113-129.dhcp-dynamic.fibreop.ns.bellaliant.net. [142.162.113.129])
        by smtp.gmail.com with ESMTPSA id q184sm15663797qkd.35.2021.09.28.11.01.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 28 Sep 2021 11:01:51 -0700 (PDT)
Received: from jgg by mlx with local (Exim 4.94)
        (envelope-from <jgg@ziepe.ca>)
        id 1mVHQM-007Eis-Ps; Tue, 28 Sep 2021 15:01:50 -0300
Date:   Tue, 28 Sep 2021 15:01:50 -0300
From:   Jason Gunthorpe <jgg@ziepe.ca>
To:     Joao Martins <joao.m.martins@oracle.com>
Cc:     Dan Williams <dan.j.williams@intel.com>, linux-mm@kvack.org,
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
Message-ID: <20210928180150.GI3544071@ziepe.ca>
References: <20210827145819.16471-1-joao.m.martins@oracle.com>
 <20210827145819.16471-9-joao.m.martins@oracle.com>
 <20210827162552.GK1200268@ziepe.ca>
 <da90638d-d97f-bacb-f0fa-01f5fd9f2504@oracle.com>
 <20210830130741.GO1200268@ziepe.ca>
 <cda6d8fb-bd48-a3de-9d4e-96e4a43ebe58@oracle.com>
 <20210831170526.GP1200268@ziepe.ca>
 <8c23586a-eb3b-11a6-e72a-dcc3faad4e96@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8c23586a-eb3b-11a6-e72a-dcc3faad4e96@oracle.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Sep 23, 2021 at 05:51:04PM +0100, Joao Martins wrote:
> On 8/31/21 6:05 PM, Jason Gunthorpe wrote:

> >> Switching to similar iteration logic to unpin would look something like
> >> this (still untested):
> >>
> >>         for_each_compound_range(index, &page, npages, head, refs) {
> >>                 pgmap = get_dev_pagemap(pfn + *nr, pgmap);
> > 
> > I recall talking to DanW about this and we agreed it was unnecessary
> > here to hold the pgmap and should be deleted.
> 
> Yeap, I remember that conversation[0]. It was a long time ago, and I am
> not sure what progress was made there since the last posting? Dan, any
> thoughts there?
> 
> [0]
> https://lore.kernel.org/linux-mm/161604050866.1463742.7759521510383551055.stgit@dwillia2-desk3.amr.corp.intel.com/

I would really like to see that finished :\

> So ... if pgmap accounting was removed from gup-fast then this patch
> would be a lot simpler and we could perhaps just fallback to the regular
> hugepage case (THP, HugeTLB) like your suggestion at the top. See at the
> end below scissors mark as the ballpark of changes.
> 
> So far my options seem to be: 1) this patch which leverages the existing
> iteration logic or 2) switching to for_each_compound_range() -- see my previous
> reply 3) waiting for Dan to remove @pgmap accounting in gup-fast and use
> something similar to below scissors mark.
> 
> What do you think would be the best course of action?

I still think the basic algorithm should be to accumulate physicaly
contiguous addresses when walking the page table and then flush them
back to struct pages once we can't accumulate any more.

That works for both the walkers and all the page types?

If the get_dev_pagemap has to remain then it just means we have to
flush before changing pagemap pointers

Jason
