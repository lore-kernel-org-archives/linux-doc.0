Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 96BE17D04D
	for <lwn-linux-doc@archive.lwn.net>; Fri,  1 Feb 2019 09:08:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726513AbfBAJI2 (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 1 Feb 2019 04:08:28 -0500
Received: from verein.lst.de ([213.95.11.211]:33836 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726339AbfBAJI2 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 1 Feb 2019 04:08:28 -0500
Received: by newverein.lst.de (Postfix, from userid 2407)
        id D15CC68CEC; Fri,  1 Feb 2019 10:08:26 +0100 (CET)
Date:   Fri, 1 Feb 2019 10:08:26 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Corentin Labbe <clabbe@baylibre.com>
Cc:     corbet@lwn.net, hch@lst.de, m.szyprowski@samsung.com,
        robin.murphy@arm.com, iommu@lists.linux-foundation.org,
        linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dma-debug: add dumping facility via debugfs
Message-ID: <20190201090826.GA16494@lst.de>
References: <1547819058-3552-1-git-send-email-clabbe@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1547819058-3552-1-git-send-email-clabbe@baylibre.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Thanks!

I had to adjust the patch a bit for the debugfs cleanups form Greg
that I applied before, can you check the result here:

    http://git.infradead.org/users/hch/dma-mapping.git/commitdiff/0a3b192c26da198fce38e1ee242a34f558670246
