Return-Path: <linux-doc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.3 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7BBA4C433ED
	for <linux-doc@archiver.kernel.org>; Mon, 26 Apr 2021 14:14:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 39C246101C
	for <linux-doc@archiver.kernel.org>; Mon, 26 Apr 2021 14:14:01 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233573AbhDZOOl (ORCPT <rfc822;linux-doc@archiver.kernel.org>);
        Mon, 26 Apr 2021 10:14:41 -0400
Received: from verein.lst.de ([213.95.11.211]:41445 "EHLO verein.lst.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233294AbhDZOOl (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 26 Apr 2021 10:14:41 -0400
Received: by verein.lst.de (Postfix, from userid 2407)
        id 1578768C4E; Mon, 26 Apr 2021 16:13:55 +0200 (CEST)
Date:   Mon, 26 Apr 2021 16:13:55 +0200
From:   Christoph Hellwig <hch@lst.de>
To:     Jason Gunthorpe <jgg@nvidia.com>
Cc:     David Airlie <airlied@linux.ie>,
        Alex Williamson <alex.williamson@redhat.com>,
        Cornelia Huck <cohuck@redhat.com>,
        Jonathan Corbet <corbet@lwn.net>,
        Daniel Vetter <daniel@ffwll.ch>,
        dri-devel@lists.freedesktop.org, intel-gfx@lists.freedesktop.org,
        intel-gvt-dev@lists.freedesktop.org,
        Jani Nikula <jani.nikula@linux.intel.com>,
        Joonas Lahtinen <joonas.lahtinen@linux.intel.com>,
        kvm@vger.kernel.org, Kirti Wankhede <kwankhede@nvidia.com>,
        linux-doc@vger.kernel.org, Rodrigo Vivi <rodrigo.vivi@intel.com>,
        Zhenyu Wang <zhenyuw@linux.intel.com>,
        Zhi Wang <zhi.a.wang@intel.com>,
        "Raj, Ashok" <ashok.raj@intel.com>,
        Dan Williams <dan.j.williams@intel.com>,
        Christoph Hellwig <hch@lst.de>,
        Leon Romanovsky <leonro@nvidia.com>,
        Max Gurtovoy <mgurtovoy@nvidia.com>,
        Tarun Gupta <targupta@nvidia.com>
Subject: Re: [PATCH 08/12] vfio/gvt: Convert to use
 vfio_register_group_dev()
Message-ID: <20210426141355.GF15209@lst.de>
References: <0-v1-d88406ed308e+418-vfio3_jgg@nvidia.com> <8-v1-d88406ed308e+418-vfio3_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <8-v1-d88406ed308e+418-vfio3_jgg@nvidia.com>
User-Agent: Mutt/1.5.17 (2007-11-01)
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

> diff --git a/drivers/vfio/mdev/Makefile b/drivers/vfio/mdev/Makefile
> index ff9ecd80212503..7c236ba1b90eb1 100644
> --- a/drivers/vfio/mdev/Makefile
> +++ b/drivers/vfio/mdev/Makefile
> @@ -1,5 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  
> -mdev-y := mdev_core.o mdev_sysfs.o mdev_driver.o vfio_mdev.o
> +mdev-y := mdev_core.o mdev_sysfs.o mdev_driver.o
>  
>  obj-$(CONFIG_VFIO_MDEV) += mdev.o
> diff --git a/drivers/vfio/mdev/mdev_core.c b/drivers/vfio/mdev/mdev_core.c
> index 51b8a9fcf866ad..f95d01b57fb168 100644
> --- a/drivers/vfio/mdev/mdev_core.c
> +++ b/drivers/vfio/mdev/mdev_core.c

I think all these mdev core changes belong into a separate commit with a
separate commit log.

>  static int __init mdev_init(void)
>  {
> -	int rc;
> -
> -	rc = mdev_bus_register();
> -	if (rc)
> -		return rc;
> -	rc = mdev_register_driver(&vfio_mdev_driver);
> -	if (rc)
> -		goto err_bus;
> -	return 0;
> -err_bus:
> -	mdev_bus_unregister();
> -	return rc;
> +	return  mdev_bus_register();

Weird indentation.  But I think it would be best to just kill off the
mdev_init wrapper anyway.

>  static void __exit mdev_exit(void)
>  {
> -	mdev_unregister_driver(&vfio_mdev_driver);
> -
>  	if (mdev_bus_compat_class)
>  		class_compat_unregister(mdev_bus_compat_class);
> -
>  	mdev_bus_unregister();
>  }

Same here.

> diff --git a/drivers/vfio/mdev/mdev_driver.c b/drivers/vfio/mdev/mdev_driver.c
> index 6e96c023d7823d..0012a9ee7cb0a4 100644
> --- a/drivers/vfio/mdev/mdev_driver.c
> +++ b/drivers/vfio/mdev/mdev_driver.c
> @@ -74,15 +74,8 @@ static int mdev_remove(struct device *dev)
>  static int mdev_match(struct device *dev, struct device_driver *drv)
>  {
>  	struct mdev_device *mdev = to_mdev_device(dev);
> +
> +	return drv == &mdev->type->parent->ops->device_driver->driver;
>  }

Btw, I think we don't even need ->match with the switch to use
device_bind_driver that I suggested.

> -EXPORT_SYMBOL_GPL(vfio_init_group_dev);
> +EXPORT_SYMBOL(vfio_init_group_dev);

> -EXPORT_SYMBOL_GPL(vfio_register_group_dev);
> +EXPORT_SYMBOL(vfio_register_group_dev);

> -EXPORT_SYMBOL_GPL(vfio_unregister_group_dev);
> +EXPORT_SYMBOL(vfio_unregister_group_dev);


Err, no.  vfio should remain EXPORT_SYMBOL_GPL, just because the weird
mdev "GPL condom" that should never have been merged in that form went away.
