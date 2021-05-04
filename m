Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0EA0EC433B4
	for <linux-doc@archiver.kernel.org>; Tue,  4 May 2021 09:39:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 95CE16115B
	for <linux-doc@archiver.kernel.org>; Tue,  4 May 2021 09:39:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229920AbhEDJjz (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 4 May 2021 05:39:55 -0400
Received: from verein.lst.de ([213.95.11.211]:38746 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229883AbhEDJjz (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Tue, 4 May 2021 05:39:55 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 7309268AFE; Tue,  4 May 2021 11:38:57 +0200 (CEST)
Date:   Tue, 4 May 2021 11:38:57 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Jason Gunthorpe <jgg@nvidia.com>
Cc:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Christoph Hellwig <hch@lst.de>,
        Alex Williamson <alex.williamson@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, kvm@vger.kernel.org,
        Kirti Wankhede <kwankhede@nvidia.com>,
        linux-doc@vger.kernel.org, "Raj, Ashok" <ashok.raj@intel.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Leon Romanovsky <leonro@nvidia.com>,
        Max Gurtovoy <mgurtovoy@nvidia.com>,
        Tarun Gupta <targupta@nvidia.com>
Subject: Re: [PATCH v2 09/13] vfio/mdev: Remove vfio_mdev.c
Message-ID: <20210504093857.GB24834@lst.de>
References: <9-v2-7667f42c9bad+935-vfio3_jgg@nvidia.com> <20210428060703.GA4973@lst.de> <YIkCVnTFmTHiX3xn@kroah.com> <20210428125321.GP1370958@nvidia.com> <20210429065315.GC2882@lst.de> <YIpYnz/isPaXsTYs@kroah.com> <20210503173220.GN1370958@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20210503173220.GN1370958@nvidia.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Mon, May 03, 2021 at 02:32:20PM -0300, Jason Gunthorpe wrote:
> Since that is not agreeable I will shrink this patch series to remove
> the ccw conversion that already has complex feedback and drop this
> patch. I'll sadly shelve the rest of the work until something changes.

Please don't.  I'll happily takes on that this is the right work, and
should not be damaged by a bad actor (Nvidia corporate that has been
sneaking weird backdoors into Linux for a while) directing someone
that now works for them through an acquisition.

And we realy need to put Nvidia in the watchlist unfortunately as they
have caused so much damage to Linux through all their crazy backdoors.
