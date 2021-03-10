Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C97E3C433E6
	for <linux-doc@archiver.kernel.org>; Wed, 10 Mar 2021 07:38:32 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 8B88064FFB
	for <linux-doc@archiver.kernel.org>; Wed, 10 Mar 2021 07:38:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229574AbhCJHh5 (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Wed, 10 Mar 2021 02:37:57 -0500
Received: from verein.lst.de ([213.95.11.211]:34944 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S231843AbhCJHhg (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Wed, 10 Mar 2021 02:37:36 -0500
Received: by verein.lst.de (Postfix, from userid 2407)
        id 2F12A68B05; Wed, 10 Mar 2021 08:37:34 +0100 (CET)
Date:   Wed, 10 Mar 2021 08:37:33 +0100
From:   Christoph Hellwig <hch@lst.de>
To:     Jason Gunthorpe <jgg@nvidia.com>
Cc:     Alex Williamson <alex.williamson@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Diana Craciun <diana.craciun@oss.nxp.com>,
        Eric Auger <eric.auger@redhat.com>, kvm@vger.kernel.org,
        Kirti Wankhede <kwankhede@nvidia.com>,
        linux-doc@vger.kernel.org, "Raj, Ashok" <ashok.raj@intel.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Christoph Hellwig <hch@lst.de>,
        Leon Romanovsky <leonro@nvidia.com>,
        Max Gurtovoy <mgurtovoy@nvidia.com>,
        Tarun Gupta <targupta@nvidia.com>
Subject: Re: [PATCH 10/10] vfio: Remove device_data from the vfio bus
 driver API
Message-ID: <20210310073733.GI2659@lst.de>
References: <0-v1-7355d38b9344+17481-vfio1_jgg@nvidia.com> <10-v1-7355d38b9344+17481-vfio1_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <10-v1-7355d38b9344+17481-vfio1_jgg@nvidia.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

Looks good,

Reviewed-by: Christoph Hellwig <hch@lst.de>
