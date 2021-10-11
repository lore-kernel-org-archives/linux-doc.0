Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 55945C433F5
	for <linux-doc@archiver.kernel.org>; Mon, 11 Oct 2021 11:44:26 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4253B60F0F
	for <linux-doc@archiver.kernel.org>; Mon, 11 Oct 2021 11:44:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233089AbhJKLqZ (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 11 Oct 2021 07:46:25 -0400
Received: from verein.lst.de ([213.95.11.211]:37017 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S230450AbhJKLqZ (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 11 Oct 2021 07:46:25 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 22C7B68B05; Mon, 11 Oct 2021 13:44:23 +0200 (CEST)
Date:   Mon, 11 Oct 2021 13:44:22 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Logan Gunthorpe <logang@deltatee.com>
Cc:     Christoph Hellwig <hch@lst.de>, iommu@lists.linux-foundation.org,
        linux-doc@vger.kernel.org, Stephen Rothwell <sfr@canb.auug.org.au>
Subject: Re: [PATCH] dma-mapping: fix the kerneldoc for dma_map_sgtable()
Message-ID: <20211011114422.GA16322@lst.de>
References: <20211005164812.15938-1-logang@deltatee.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20211005164812.15938-1-logang@deltatee.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Thanks,

applied.
