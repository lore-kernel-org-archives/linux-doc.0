Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16EE5EB64DA
	for <linux-doc@archiver.kernel.org>; Thu, 20 Jul 2023 06:25:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229567AbjGTGZf (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 20 Jul 2023 02:25:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36614 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230117AbjGTGZc (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Jul 2023 02:25:32 -0400
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A9071268E;
        Wed, 19 Jul 2023 23:25:29 -0700 (PDT)
Received: by verein.lst.de (Postfix, from userid 2407)
        id 11F7567373; Thu, 20 Jul 2023 08:25:26 +0200 (CEST)
Date:   Thu, 20 Jul 2023 08:25:25 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     Christoph Hellwig <hch@lst.de>, linux-kernel@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>, linux-doc@vger.kernel.org,
        iommu@lists.linux.dev
Subject: Re: [PATCH] dma: DMA_ATTR_SKIP_CPU_SYNC documentation tweaks
Message-ID: <20230720062525.GA3723@lst.de>
References: <98ef4f76d7a5f90b0878e649a70b101402b8889d.1689761699.git.mst@redhat.com> <20230720060742.GA2987@lst.de> <20230720021914-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230720021914-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jul 20, 2023 at 02:21:05AM -0400, Michael S. Tsirkin wrote:
> On Thu, Jul 20, 2023 at 08:07:42AM +0200, Christoph Hellwig wrote:
> > On Wed, Jul 19, 2023 at 06:15:59AM -0400, Michael S. Tsirkin wrote:
> > > A recent patchset highlighted to me that DMA_ATTR_SKIP_CPU_SYNC
> > > might be easily misunderstood.
> > 
> > .. just curious: what patchset is that?  DMA_ATTR_SKIP_CPU_SYNC is
> > often a bad idea and all users probably could use a really good
> > audit..
> 
> Message-Id: <20230710034237.12391-1-xuanzhuo@linux.alibaba.com>

Do you have an actual link?

> 
> 
> Looks like there's really little else can be done: there's a
> shared page we allow DMA into, so we sync periodically.
> Then when we unmap we really do not need that data
> synced again.
> 
> What exactly is wrong with this?

A "shared" page without ownership can't work with the streaming
DMA API (dma_map_*) at all.  You need to use dma_alloc_coherent
so that it is mapped uncached.
