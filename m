Return-Path: <linux-doc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.1 (2015-04-28) on archive.lwn.net
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=5.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,RCVD_IN_DNSWL_HI autolearn=ham autolearn_force=no
	version=3.4.1
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by archive.lwn.net (Postfix) with ESMTP id 19F717E279
	for <lwn-linux-doc@archive.lwn.net>; Mon, 30 Apr 2018 18:39:20 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1754737AbeD3SjA (ORCPT <rfc822;lwn-linux-doc@archive.lwn.net>);
        Mon, 30 Apr 2018 14:39:00 -0400
Received: from mx1.redhat.com ([209.132.183.28]:41717 "EHLO mx1.redhat.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754672AbeD3Si6 (ORCPT <rfc822;linux-doc@vger.kernel.org>);
        Mon, 30 Apr 2018 14:38:58 -0400
Received: from smtp.corp.redhat.com (int-mx09.intmail.prod.int.phx2.redhat.com [10.5.11.24])
        (using TLSv1.2 with cipher AECDH-AES256-SHA (256/256 bits))
        (No client certificate requested)
        by mx1.redhat.com (Postfix) with ESMTPS id 2E71E30001DB;
        Mon, 30 Apr 2018 18:38:58 +0000 (UTC)
Received: from w520.home (ovpn-116-103.phx2.redhat.com [10.3.116.103])
        by smtp.corp.redhat.com (Postfix) with ESMTP id B9FD9314F9AE;
        Mon, 30 Apr 2018 18:38:57 +0000 (UTC)
Date:   Mon, 30 Apr 2018 12:38:57 -0600
From:   Alex Williamson <alex.williamson@redhat.com>
To:     "dongbo (E)" <dongbo4@huawei.com>
Cc:     <corbet@lwn.net>, <kvm@vger.kernel.org>,
        <linux-doc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] VFIO: Fix Documentation
Message-ID: <20180430123857.006a0697@w520.home>
In-Reply-To: <36f5940b-cac5-9a4a-86cb-7ad9766d5d62@huawei.com>
References: <1524218521-61496-1-git-send-email-zhangshaokun@hisilicon.com>
        <36f5940b-cac5-9a4a-86cb-7ad9766d5d62@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-Scanned-By: MIMEDefang 2.84 on 10.5.11.24
X-Greylist: Sender IP whitelisted, not delayed by milter-greylist-4.5.16 (mx1.redhat.com [10.5.110.41]); Mon, 30 Apr 2018 18:38:58 +0000 (UTC)
Sender: linux-doc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-doc.vger.kernel.org>
X-Mailing-List: linux-doc@vger.kernel.org

On Fri, 20 Apr 2018 18:07:27 +0800
"dongbo (E)" <dongbo4@huawei.com> wrote:

> From: Dong Bo <dongbo4@huawei.com>
> 
> Signed-off-by: Dong Bo <dongbo4@huawei.com>
> ---

Hi Dong Bo,

The patch is corrupted, please resend and also include a commit log,
something as simple as "Update vfio_add_group_dev description to match
the current API" would be fine.  Thanks,

Alex

>  Documentation/vfio.txt | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/vfio.txt b/Documentation/vfio.txt
> index ef6a511..f1a4d3c 100644
> --- a/Documentation/vfio.txt
> +++ b/Documentation/vfio.txt
> @@ -252,15 +252,14 @@ into VFIO core.  When devices are bound and unbound to the driver,
>  the driver should call vfio_add_group_dev() and vfio_del_group_dev()
>  respectively::
>  -	extern int vfio_add_group_dev(struct iommu_group *iommu_group,
> -	                              struct device *dev,
> +	extern int vfio_add_group_dev(struct device *dev,
>  				      const struct vfio_device_ops *ops,
>  				      void *device_data);
>   	extern void *vfio_del_group_dev(struct device *dev);
>   vfio_add_group_dev() indicates to the core to begin tracking the
> -specified iommu_group and register the specified dev as owned by
> +iommu_group of the specified dev and register the dev as owned by
>  a VFIO bus driver.  The driver provides an ops structure for callbacks
>  similar to a file operations structure::
>  -- 1.9.1
> 
> 
> .
> 
> 

--
To unsubscribe from this list: send the line "unsubscribe linux-doc" in
the body of a message to majordomo@vger.kernel.org
More majordomo info at  http://vger.kernel.org/majordomo-info.html
