Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CA157EB64DC
	for <linux-doc@archiver.kernel.org>; Thu, 20 Jul 2023 06:56:53 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229757AbjGTG4x (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Thu, 20 Jul 2023 02:56:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:35410 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229651AbjGTG4w (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Thu, 20 Jul 2023 02:56:52 -0400
Received: from verein.lst.de (verein.lst.de [213.95.11.211])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C43D79E;
        Wed, 19 Jul 2023 23:56:51 -0700 (PDT)
Received: by verein.lst.de (Postfix, from userid 2407)
        id 2315D67373; Thu, 20 Jul 2023 08:56:47 +0200 (CEST)
Date:   Thu, 20 Jul 2023 08:56:46 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Yajun Deng <yajun.deng@linux.dev>
Cc:     corbet@lwn.net, hch@lst.de, m.szyprowski@samsung.com,
        robin.murphy@arm.com, akpm@linux-foundation.org,
        paulmck@kernel.org, catalin.marinas@arm.com, rdunlap@infradead.org,
        peterz@infradead.org, rostedt@goodmis.org, kim.phillips@amd.com,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
        iommu@lists.linux.dev, linux-mm@kvack.org
Subject: Re: [PATCH v3] dma-contiguous: support numa CMA for specified node
Message-ID: <20230720065646.GA4605@lst.de>
References: <20230712074758.1133272-1-yajun.deng@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20230712074758.1133272-1-yajun.deng@linux.dev>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Thanks.

I'll pick this up for the dma-mapping tree with some minor style
fixups.
