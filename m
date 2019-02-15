Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 4C6927D08A
	for <lwn-linux-doc@archive.lwn.net>; Fri, 15 Feb 2019 18:34:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389934AbfBOSef (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 15 Feb 2019 13:34:35 -0500
Received: from shards.monkeyblade.net ([23.128.96.9]:43892 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389689AbfBOSef (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Fri, 15 Feb 2019 13:34:35 -0500
Received: from localhost (unknown [IPv6:2601:601:9f80:35cd::bf5])
        (using TLSv1 with cipher AES256-SHA (256/256 bits))
        (Client did not present a certificate)
        (Authenticated sender: davem-davemloft)
        by shards.monkeyblade.net (Postfix) with ESMTPSA id 5814514F06A70;
        Fri, 15 Feb 2019 10:34:34 -0800 (PST)
Date:   Fri, 15 Feb 2019 10:34:31 -0800 (PST)
Message-Id: <20190215.103431.281080744416004293.davem@davemloft.net>
To:     hch@lst.de
Cc:     deller@gmx.de, robin.murphy@arm.com,
        iommu@lists.linux-foundation.org, sparclinux@vger.kernel.org,
        linux-parisc@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/5] sparc64: refactor the ali DMA quirk
From:   David Miller <davem@davemloft.net>
In-Reply-To: <20190215144559.8777-3-hch@lst.de>
References: <20190215144559.8777-1-hch@lst.de>
        <20190215144559.8777-3-hch@lst.de>
X-Mailer: Mew version 6.8 on Emacs 26.1
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
X-Greylist: Sender succeeded SMTP AUTH, not delayed by milter-greylist-4.5.12 (shards.monkeyblade.net [149.20.54.216]); Fri, 15 Feb 2019 10:34:34 -0800 (PST)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

From: Christoph Hellwig <hch@lst.de>
Date: Fri, 15 Feb 2019 15:45:56 +0100

> Do the quirk first in the dma_supported routines, as we don't need
> any of the other checks for it, and remove the duplicate mask checking
> that is already done by the callers.
> 
> Signed-off-by: Christoph Hellwig <hch@lst.de>

Acked-by: David S. Miller <davem@davemloft.net>
