Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 20300EB64DA
	for <linux-doc@archiver.kernel.org>; Thu, 20 Jul 2023 06:44:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231368AbjGTGoC (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 20 Jul 2023 02:44:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48252 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231375AbjGTGnr (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Jul 2023 02:43:47 -0400
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D387D3591;
        Wed, 19 Jul 2023 23:43:22 -0700 (PDT)
Received: by verein.lst.de (Postfix, from userid 2407)
        id 7C70B68AFE; Thu, 20 Jul 2023 08:43:18 +0200 (CEST)
Date:   Thu, 20 Jul 2023 08:43:18 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     "Michael S. Tsirkin" <mst@redhat.com>
Cc:     Christoph Hellwig <hch@lst.de>, linux-kernel@vger.kernel.org,
        Jonathan Corbet <corbet@lwn.net>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>, linux-doc@vger.kernel.org,
        iommu@lists.linux.dev
Subject: Re: [PATCH] dma: DMA_ATTR_SKIP_CPU_SYNC documentation tweaks
Message-ID: <20230720064318.GA4349@lst.de>
References: <98ef4f76d7a5f90b0878e649a70b101402b8889d.1689761699.git.mst@redhat.com> <20230720060742.GA2987@lst.de> <20230720021914-mutt-send-email-mst@kernel.org> <20230720062525.GA3723@lst.de> <20230720022702-mutt-send-email-mst@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230720022702-mutt-send-email-mst@kernel.org>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Thu, Jul 20, 2023 at 02:30:04AM -0400, Michael S. Tsirkin wrote:
> sure, they are not hard to generate ;)
> 
> https://lore.kernel.org/all/20230710034237.12391-11-xuanzhuo%40linux.alibaba.com

Thanks, I'll chime in there.

> > > Looks like there's really little else can be done: there's a
> > > shared page we allow DMA into, so we sync periodically.
> > > Then when we unmap we really do not need that data
> > > synced again.
> > > 
> > > What exactly is wrong with this?
> > 
> > A "shared" page without ownership can't work with the streaming
> > DMA API (dma_map_*) at all.  You need to use dma_alloc_coherent
> > so that it is mapped uncached.
> 
> Hmm confused.  Based on both documentation and code I think this works:
> 
> 	dma_map
> 	dma_sync
> 	dma_sync
> 	dma_sync
> 	dma_sync
> 	dma_unmap(DMA_ATTR_SKIP_CPU_SYNC)
> 
> right?

Depends on your definition of "shared".  If there is always a clear
owner at a given time you can games with lots of syncs that transfer
ownership.  If there is no clear ownership, and the "device" just
DMAs into the buffer at random times and the host checks bits in
there we need to map the buffer uncached.

I'll chime in in the thread.

> 
> -- 
> MST
---end quoted text---
