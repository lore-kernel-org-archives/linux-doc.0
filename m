Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EBA2EC433DB
	for <linux-doc@archiver.kernel.org>; Wed, 10 Mar 2021 07:27:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A5E4064FF2
	for <linux-doc@archiver.kernel.org>; Wed, 10 Mar 2021 07:27:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231591AbhCJH0g (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 10 Mar 2021 02:26:36 -0500
Received: from verein.lst.de ([213.95.11.211]:34888 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229724AbhCJH0W (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 10 Mar 2021 02:26:22 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id 3265368BEB; Wed, 10 Mar 2021 08:26:19 +0100 (CET)
Date:   Wed, 10 Mar 2021 08:26:19 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Jason Gunthorpe <jgg@nvidia.com>
Cc:     Alex Williamson <alex.williamson@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org, "Raj, Ashok" <ashok.raj@intel.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Christoph Hellwig <hch@lst.de>,
        Leon Romanovsky <leonro@nvidia.com>,
        Max Gurtovoy <mgurtovoy@nvidia.com>,
        Tarun Gupta <targupta@nvidia.com>
Subject: Re: [PATCH 02/10] vfio: Split creation of a vfio_device into init
 and register ops
Message-ID: <20210310072619.GB2659@lst.de>
References: <0-v1-7355d38b9344+17481-vfio1_jgg@nvidia.com> <2-v1-7355d38b9344+17481-vfio1_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2-v1-7355d38b9344+17481-vfio1_jgg@nvidia.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, Mar 09, 2021 at 05:38:44PM -0400, Jason Gunthorpe wrote:
> The pattern also makes it clear that vfio_register_group_dev() must be
> last in the sequence, as once it is called the core code can immediately
> start calling ops. The init/register gap is provided to allow for the
> driver to do setup before ops can be called and thus avoid races.

Yes, APIs that init and register together are generatelly a rather
bad idea.

Reviewed-by: Christoph Hellwig <hch@lst.de>
