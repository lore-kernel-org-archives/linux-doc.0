Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24069C433DB
	for <linux-doc@archiver.kernel.org>; Tue, 30 Mar 2021 15:29:33 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E2E76619A7
	for <linux-doc@archiver.kernel.org>; Tue, 30 Mar 2021 15:29:32 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232344AbhC3P3B (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Tue, 30 Mar 2021 11:29:01 -0400
Received: from us-smtp-delivery-124.mimecast.com ([216.205.24.124]:41218 "EHLO
        us-smtp-delivery-124.mimecast.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S232299AbhC3P3A (ORCPT
        <rfc822;linux-doc@vger.kernel.org>); Tue, 30 Mar 2021 11:29:00 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
        s=mimecast20190719; t=1617118140;
        h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
         to:to:cc:cc:mime-version:mime-version:content-type:content-type:
         content-transfer-encoding:content-transfer-encoding:
         in-reply-to:in-reply-to:references:references;
        bh=KIwIzC8lO2M6wOAP/fBeh4ci0+vN5Fc6vXZzQHI08I8=;
        b=DLAygyvYhGUoiskbGKEbl++MLi/RPedkCQ7SzKxsZPYc5ngMCOP4MjVzOLN81vLg4CuGBZ
        7p2+ELM+ZGkFTR3geB7Bx5DqG4Awk5FcOriYjORC3p8+CHdmhT2PO2ngusLN6nNOe+5KT9
        owwLfDgilV53eoJugAbVuP8/8yk9f/U=
Received: from mimecast-mx01.redhat.com (mimecast-mx01.redhat.com
 [209.132.183.4]) (Using TLS) by relay.mimecast.com with ESMTP id
 us-mta-35-aaT3ivg2MJOQQkLq-y2Q4Q-1; Tue, 30 Mar 2021 11:28:49 -0400
X-MC-Unique: aaT3ivg2MJOQQkLq-y2Q4Q-1
Received: from smtp.corp.redhat.com (int-mx06.intmail.prod.int.phx2.redhat.com [10.5.11.16])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mimecast-mx01.redhat.com (Postfix) with ESMTPS id B53911084D6D;
        Tue, 30 Mar 2021 15:28:46 +0000 (UTC)
Received: from gondolin (ovpn-113-155.ams2.redhat.com [10.36.113.155])
        by smtp.corp.redhat.com (Postfix) with ESMTP id 20B975C3E6;
        Tue, 30 Mar 2021 15:28:40 +0000 (UTC)
Date:   Tue, 30 Mar 2021 17:28:38 +0200
From:   Cornelia Huck <cohuck@redhat.com>
To:     Jason Gunthorpe <jgg@nvidia.com>
Cc:     Alex Williamson <alex.williamson@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>, kvm@vger.kernel.org,
        Kirti Wankhede <kwankhede@nvidia.com>,
        linux-doc@vger.kernel.org, "Raj, Ashok" <ashok.raj@intel.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Christoph Hellwig <hch@lst.de>,
        Leon Romanovsky <leonro@nvidia.com>,
        Max Gurtovoy <mgurtovoy@nvidia.com>,
        Tarun Gupta <targupta@nvidia.com>
Subject: Re: [PATCH 03/18] vfio/mdev: Simplify driver registration
Message-ID: <20210330172838.0a2c30a7.cohuck@redhat.com>
In-Reply-To: <3-v1-7dedf20b2b75+4f785-vfio2_jgg@nvidia.com>
References: <0-v1-7dedf20b2b75+4f785-vfio2_jgg@nvidia.com>
        <3-v1-7dedf20b2b75+4f785-vfio2_jgg@nvidia.com>
Organization: Red Hat GmbH
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.79 on 10.5.11.16
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Tue, 23 Mar 2021 14:55:20 -0300
Jason Gunthorpe <jgg@nvidia.com> wrote:

> This is only done once, we don't need to generate code to initialize a
> structure stored in the ELF .data segment. Fill in the three required
> .driver members directly instead of copying data into them during
> mdev_register_driver().
> 
> Further the to_mdev_driver() function doesn't belong in a public header,
> just inline it into the two places that need it. Finally, we can now
> clearly see that 'drv' derived from dev->driver cannot be NULL, firstly
> because the driver core forbids it, and secondly because NULL won't pass
> through the container_of(). Remove the dead code.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  Documentation/driver-api/vfio-mediated-device.rst |  5 +----
>  drivers/vfio/mdev/mdev_driver.c                   | 15 +++++++--------
>  drivers/vfio/mdev/vfio_mdev.c                     |  8 ++++++--
>  include/linux/mdev.h                              |  6 +-----
>  4 files changed, 15 insertions(+), 19 deletions(-)

Reviewed-by: Cornelia Huck <cohuck@redhat.com>

