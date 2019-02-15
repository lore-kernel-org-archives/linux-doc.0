Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id E1C957D08A
	for <lwn-linux-doc@archive.lwn.net>; Fri, 15 Feb 2019 18:34:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2388282AbfBOSe7 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 15 Feb 2019 13:34:59 -0500
Received: from shards.monkeyblade.net ([23.128.96.9]:43914 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388116AbfBOSe7 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 15 Feb 2019 13:34:59 -0500
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::bf5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id B8BBE14F06A7D;
        Fri, 15 Feb 2019 10:34:58 -0800 (PST)
Date:   Fri, 15 Feb 2019 10:34:58 -0800 (PST)
Message-Id: <20190215.103458.2233581578201067146.davem@davemloft.net>
To:     hch@lst.de
Cc:     deller@gmx.de, robin.murphy@arm.com,
        iommu@lists.linux-foundation.org, sparclinux@vger.kernel.org,
        linux-parisc@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 3/5] sparc64/iommu: allow large DMA masks
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20190215144559.8777-4-hch@lst.de>
References: <20190215144559.8777-1-hch@lst.de>
        <20190215144559.8777-4-hch@lst.de>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Fri, 15 Feb 2019 10:34:59 -0800 (PST)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Christoph Hellwig <hch@lst.de>
Date: Fri, 15 Feb 2019 15:45:57 +0100

> We've been moving to a model where the device just sets the DMA mask
> supported by it, instead of having to fallback to something it thinks
> the platform might support.  Sparc64 is the remaining holdout forcing
> drivers to supply a matching mask.  Change dma_4u_supported to just
> check if the supplied dma mask is large enough as nothing in the
> iommu.c code (or the core DMA code) actually looks at the DMA mask
> later on.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: David S. Miller <davem@davemloft.net>
