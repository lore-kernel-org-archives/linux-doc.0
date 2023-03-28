Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD5AAC76196
	for <linux-doc@archiver.kernel.org>; Tue, 28 Mar 2023 03:57:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232840AbjC1D5m (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 27 Mar 2023 23:57:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37652 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232841AbjC1D5f (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Mon, 27 Mar 2023 23:57:35 -0400
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2E2F5198;
        Mon, 27 Mar 2023 20:57:30 -0700 (PDT)
Received: by verein.lst.de (Postfix, from userid 2407)
        id CA62968AA6; Tue, 28 Mar 2023 05:57:25 +0200 (CEST)
Date:   Tue, 28 Mar 2023 05:57:25 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Petr Tesarik <petrtesarik@huaweicloud.com>
Cc:     Jonathan Corbet <corbet@lwn.net>, Christoph Hellwig <hch@lst.de>,
        Marek Szyprowski <m.szyprowski@samsung.com>,
        Robin Murphy <robin.murphy@arm.com>,
        Borislav Petkov <bp@suse.de>,
        "Paul E. McKenney" <paulmck@kernel.org>,
        Andrew Morton <akpm@linux-foundation.org>,
        Randy Dunlap <rdunlap@infradead.org>,
        Damien Le Moal <damien.lemoal@opensource.wdc.com>,
        Kim Phillips <kim.phillips@amd.com>,
        "Steven Rostedt (Google)" <rostedt@goodmis.org>,
        "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>,
        open list <linux-kernel@vger.kernel.org>,
        "open list:DMA MAPPING HELPERS" <iommu@lists.linux.dev>,
        Roberto Sassu <roberto.sassu@huawei.com>, petr@tesarici.cz
Subject: Re: [RFC v1 1/4] dma-mapping: introduce the DMA_ATTR_MAY_SLEEP
 attribute
Message-ID: <20230328035725.GA25506@lst.de>
References: <cover.1679309810.git.petr.tesarik.ext@huawei.com> <ea0646e0e63380bb8595fbac81c23aeca30feae9.1679309810.git.petr.tesarik.ext@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ea0646e0e63380bb8595fbac81c23aeca30feae9.1679309810.git.petr.tesarik.ext@huawei.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, Mar 20, 2023 at 01:28:13PM +0100, Petr Tesarik wrote:
> From: Petr Tesarik <petr.tesarik.ext@huawei.com>
> 
> Introduce a DMA attribute to tell the DMA-mapping subsystem that
> the operation is allowed to sleep.
> 
> This patch merely adds the flag, which is not used for anything at
> the moment. It should be used by users who can sleep (e.g. dma-buf
> ioctls) to allow page reclaim and/or allocations from CMA.

So what drivers would call this?  As-is it doesn't have any users in
the series.
