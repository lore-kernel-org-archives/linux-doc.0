Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5A862C433F5
	for <linux-doc@archiver.kernel.org>; Fri,  4 Mar 2022 18:49:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230422AbiCDSuX (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Fri, 4 Mar 2022 13:50:23 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46778 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233327AbiCDSuX (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 4 Mar 2022 13:50:23 -0500
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1EB31D67CF;
        Fri,  4 Mar 2022 10:49:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Type:MIME-Version:
        References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
        Content-Transfer-Encoding:Content-ID:Content-Description;
        bh=vdCOfW9AA5pXpyysIv5oA6baxsdWJvIveo/FjSSwSb0=; b=OF7MGL/zQ7Zt2b8OOThljpYjTW
        ty2cu1wmG4x8JrCx4Qifj7YhWqJ6gt3qL2jRDZ2IrYkpR+FzNwOa2NL/uj2Ky7W0ps22YwLUHlanH
        EoMI6jlstrEUYM2l11LatKIp0GzBPwEO64nOYC1t1tmRTFPkWFiOGynAkLcvIk0n1A+M9KaX3CUQG
        82guEbNFyGF4Lqg9A5yRaHMCmcpcsCWJzpAJV6+RIDkkdJ+o+FvnS4QhS3AZY4xk2167Hv/K8Nbwb
        2Iln+dud1D8cD3q0rbyODLqsA8Q0wJhtUUccipr2ax2e88ISa7a0touBwuCfSThUagQqGrVgdXePM
        tFpLSabg==;
Received: from willy by casper.infradead.org with local (Exim 4.94.2 #2 (Red Hat Linux))
        id 1nQCzE-00CtOx-Bj; Fri, 04 Mar 2022 18:49:08 +0000
Date:   Fri, 4 Mar 2022 18:49:08 +0000
From:   Matthew Wilcox <willy@infradead.org>
To:     Halil Pasic <pasic@linux.ibm.com>
Cc:     Christoph Hellwig <hch@infradead.org>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Doug Gilbert <dgilbert@interlog.com>,
        "James E.J. Bottomley" <jejb@linux.ibm.com>,
        "Martin K. Petersen" <martin.petersen@oracle.com>,
        Christian Borntraeger <borntraeger@de.ibm.com>,
        Anshuman Khandual <khandual@linux.vnet.ibm.com>,
        Thiago Jung Bauermann <bauerman@linux.ibm.com>,
        Tom Lendacky <thomas.lendacky@amd.com>,
        "Michael S. Tsirkin" <mst@redhat.com>,
        Linus Torvalds <torvalds@linux-foundation.org>,
        stable@vger.kernel.org, iommu@lists.linux-foundation.org,
        linux-doc@vger.kernel.org
Subject: Re: [PATCH 0/2] swiotlb: rework fix info leak with DMA_FROM_DEVICE
Message-ID: <YiJfJEo4xvq/YIZW@casper.infradead.org>
References: <20220304135859.3521513-1-pasic@linux.ibm.com>
 <YiI2DPIrNLKwanZw@infradead.org>
 <20220304172908.43ab261d.pasic@linux.ibm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220304172908.43ab261d.pasic@linux.ibm.com>
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Mar 04, 2022 at 05:29:08PM +0100, Halil Pasic wrote:
> No problem, I can do that. It isn't hard to squash things together, but
> when I was about to write the commit message, I had the feeling doing
> a revert is cleaner.
> 
> Any other opinions?

One patch, not two.
