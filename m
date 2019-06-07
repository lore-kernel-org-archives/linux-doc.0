Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.2 (2018-09-13) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI,SPF_HELO_NONE,SPF_NONE
	autolearn=ham autolearn_force=no version=3.4.2
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 6EEE07D2EF
	for <lwn-linux-doc@archive.lwn.net>; Fri,  7 Jun 2019 08:35:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726531AbfFGIfP (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Fri, 7 Jun 2019 04:35:15 -0400
Received: from verein.lst.de ([213.95.11.211]:54791 "EHLO newverein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725978AbfFGIfO (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Fri, 7 Jun 2019 04:35:14 -0400
Received: by newverein.lst.de (Postfix, from userid 2407)
        id 7922868C4E; Fri,  7 Jun 2019 10:34:47 +0200 (CEST)
Date:   Fri, 7 Jun 2019 10:34:47 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc:     Christoph Hellwig <hch@lst.de>, "corbet@lwn.net" <corbet@lwn.net>,
        "jroedel@suse.de" <jroedel@suse.de>,
        "m.szyprowski@samsung.com" <m.szyprowski@samsung.com>,
        "linux-doc@vger.kernel.org" <linux-doc@vger.kernel.org>,
        "iommu@lists.linux-foundation.org" <iommu@lists.linux-foundation.org>
Subject: Re: [PATCH] Documentation: DMA-API: fix a function name of
 max_mapping_size
Message-ID: <20190607083447.GA10860@lst.de>
References: <1559893633-6852-1-git-send-email-yoshihiro.shimoda.uh@renesas.com> <20190607080814.GA10303@lst.de> <TYAPR01MB3102C6CCC204DAAA6570FD25D8100@TYAPR01MB3102.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TYAPR01MB3102C6CCC204DAAA6570FD25D8100@TYAPR01MB3102.jpnprd01.prod.outlook.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, Jun 07, 2019 at 08:19:08AM +0000, Yoshihiro Shimoda wrote:
> Hi Christoph,
> 
> > From: Christoph Hellwig, Sent: Friday, June 7, 2019 5:08 PM
> > 
> > Looks good.  And it seems like you've also found the solution to
> > your usb storage problem, but I'm going to post the variant I just
> > hacked up nevertheless.
> 
> Thank you for your reply! I think this API is related to my problem,
> but I don't have any actual solution (a patch) for now. So, I'll wait
> for your patch!

Turns out it isn't as simple as I thought, as there doesn't seem to
be an easy way to get to the struct device used for DMA mapping
from USB drivers.  I'll need to think a bit more how to handle that
best.
