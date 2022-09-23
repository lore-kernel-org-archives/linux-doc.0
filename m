Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C812DECAAD8
	for <linux-doc@archiver.kernel.org>; Fri, 23 Sep 2022 14:48:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230325AbiIWOsL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 23 Sep 2022 10:48:11 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41284 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229949AbiIWOsL (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 23 Sep 2022 10:48:11 -0400
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 051461406F4;
        Fri, 23 Sep 2022 07:48:09 -0700 (PDT)
Received: by verein.lst.de (Postfix, from userid 2407)
        id C083267373; Fri, 23 Sep 2022 16:48:04 +0200 (CEST)
Date:   Fri, 23 Sep 2022 16:48:04 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Robin Murphy <robin.murphy@arm.com>
Cc:     Nate Drude <nate.d@variscite.com>, iommu@lists.linux.dev,
        Jonathan Corbet <corbet@lwn.net>,
        Christoph Hellwig <hch@lst.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Borislav Petkov <bp@suse.de>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Neeraj Upadhyay <quic_neeraju@quicinc.com>,
        Randy Dunlap <rdunlap@infradead.org>,
        Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        Muchun Song <songmuchun@bytedance.com>,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        eran.m@variscite.com
Subject: Re: [PATCH] dma-contiguous: add optional cma_name for cma= kernel
 parameter
Message-ID: <20220923144804.GA18477@lst.de>
References: <20220912163805.4113238-1-nate.d@variscite.com> <aa96eb55-4925-221f-1fb2-8226ea347c22@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <aa96eb55-4925-221f-1fb2-8226ea347c22@arm.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Sep 13, 2022 at 11:45:17AM +0100, Robin Murphy wrote:
> If userspace expects the CMA heap driver to expose a consistent name for 
> CMA heaps, shouldn't it be the CMA heap driver's responsibility to expose a 
> consistent name for CMA heaps? Tinkering with the core CMA code doesn't 
> feel like the right approach.

Agreed.  In fact I think exposing this name in a uapi seems like a really
bad idea that is asking for a lot of trouble.
