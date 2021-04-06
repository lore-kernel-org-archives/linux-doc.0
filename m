Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94444C43460
	for <linux-doc@archiver.kernel.org>; Tue,  6 Apr 2021 19:39:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 4B80F613D0
	for <linux-doc@archiver.kernel.org>; Tue,  6 Apr 2021 19:39:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S244928AbhDFTjL (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 6 Apr 2021 15:39:11 -0400
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124]:28214 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S235313AbhDFTi6 (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 6 Apr 2021 15:38:58 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617737928;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=vI8YDIonPiHpIWfhl9xXg/leetNX2/MBMNKFn6NXfmo=;
        b=LxaYdL+XRSr7m/iiggLVly/izGgVQxhyr+RS7CPrWEMZb1Nhc2VY/wDjCzCLtDnrsuM0bZ
        gVc1RgaL06vRdRuHrHzVKFeLHUUJSpqK7ald4k5EsThv1gSs0g0yusZpptb92Trnn75HHd
        /4hm4oM5Y9N6uZstRpeFCTIaDQqqVtE=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-110-F--7sEJ2MbaF1knlcyyofg-1; Tue, 06 Apr 2021 15:38:21 -0400
X-MC-Unique: F--7sEJ2MbaF1knlcyyofg-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id 01C918189C8;
        Tue,  6 Apr 2021 19:38:18 +0000 (UTC)
Received: from omen (ovpn-112-85.phx2.redhat.com [10.3.112.85])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 4390A1750D;
        Tue,  6 Apr 2021 19:38:16 +0000 (UTC)
Date:   Tue, 6 Apr 2021 13:38:15 -0600
From:   Alex Williamson <alex.williamson@redhat.com>
To:     Jason Gunthorpe <jgg@nvidia.com>
Cc:     Cornelia Huck <cohuck@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Diana Craciun <diana.craciun@oss.nxp.com>,
        Eric Auger <eric.auger@redhat.com>, kvm@vger.kernel.org,
        Kirti Wankhede <kwankhede@nvidia.com>,
        linux-doc@vger.kernel.org, "Raj, Ashok" <ashok.raj@intel.com>,
        Bharat Bhushan <Bharat.Bhushan@nxp.com>,
        Christian Ehrhardt <christian.ehrhardt@canonical.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Daniel Vetter <daniel@ffwll.ch>,
        Christoph Hellwig <hch@lst.de>,
        Jike Song <jike.song@intel.com>,
        Kevin Tian <kevin.tian@intel.com>,
        Leon Romanovsky <leonro@nvidia.com>,
        Max Gurtovoy <mgurtovoy@nvidia.com>,
        Tarun Gupta <targupta@nvidia.com>,
        Liu Yi L <yi.l.liu@intel.com>,
        Zhenyu Wang <zhenyuw@linux.intel.com>,
        Zhi Wang <zhi.a.wang@intel.com>
Subject: Re: [PATCH v3 00/14] Embed struct vfio_device in all sub-structures
Message-ID: <20210406133815.40cc1503@omen>
In-Reply-To: <0-v3-225de1400dfc+4e074-vfio1_jgg@nvidia.com>
References: <0-v3-225de1400dfc+4e074-vfio1_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 23 Mar 2021 13:14:52 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:
> 
>  Documentation/driver-api/vfio.rst             |  48 ++--
>  drivers/vfio/fsl-mc/vfio_fsl_mc.c             | 127 +++++----
>  drivers/vfio/fsl-mc/vfio_fsl_mc_private.h     |   1 +
>  drivers/vfio/mdev/mdev_private.h              |   5 +-
>  drivers/vfio/mdev/vfio_mdev.c                 |  53 ++--
>  drivers/vfio/pci/vfio_pci.c                   | 253 ++++++++++--------
>  drivers/vfio/pci/vfio_pci_private.h           |   1 +
>  drivers/vfio/platform/vfio_amba.c             |   8 +-
>  drivers/vfio/platform/vfio_platform.c         |  20 +-
>  drivers/vfio/platform/vfio_platform_common.c  |  56 ++--
>  drivers/vfio/platform/vfio_platform_private.h |   5 +-
>  drivers/vfio/vfio.c                           | 210 +++++----------
>  include/linux/vfio.h                          |  37 ++-
>  13 files changed, 417 insertions(+), 407 deletions(-)
 

Applied to vfio next branch for v5.13.  Thanks!

Alex

